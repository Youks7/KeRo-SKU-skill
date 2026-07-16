[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$InputRoot,

    [Parameter(Mandatory = $true)]
    [string]$OutputRoot,

    [ValidateSet('Inventory', 'Validate')]
    [string]$Mode = 'Inventory'
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function Get-FullPath {
    param([string]$Path)
    return [System.IO.Path]::GetFullPath($Path).TrimEnd([System.IO.Path]::DirectorySeparatorChar)
}

function Add-Count {
    param(
        [hashtable]$Table,
        [string]$Key
    )
    if ($Table.ContainsKey($Key)) {
        $Table[$Key]++
    }
    else {
        $Table[$Key] = 1
    }
}

$inputRootFull = Get-FullPath $InputRoot
$outputRootFull = Get-FullPath $OutputRoot

if (-not (Test-Path -LiteralPath $inputRootFull -PathType Container)) {
    throw "Input directory does not exist: $inputRootFull"
}

$imageExtensions = @('.jpg', '.jpeg', '.png', '.webp', '.bmp', '.tif', '.tiff')
$inputFiles = @(
    Get-ChildItem -LiteralPath $inputRootFull -Recurse -File |
        Where-Object { $imageExtensions -contains $_.Extension.ToLowerInvariant() } |
        Sort-Object FullName
)

$records = foreach ($file in $inputFiles) {
    $relative = [System.IO.Path]::GetRelativePath($inputRootFull, $file.FullName)
    $outputRelative = [System.IO.Path]::ChangeExtension($relative, '.png')
    [pscustomobject]@{
        RelativeInput  = $relative
        RelativeOutput = $outputRelative
        InputPath      = $file.FullName
        OutputPath     = [System.IO.Path]::Combine($outputRootFull, $outputRelative)
        InputExtension = $file.Extension.ToLowerInvariant()
    }
}

$collisions = @(
    $records |
        Group-Object { $_.RelativeOutput.ToLowerInvariant() } |
        Where-Object Count -gt 1 |
        ForEach-Object {
            [pscustomobject]@{
                RelativeOutput = $_.Group[0].RelativeOutput
                Inputs         = @($_.Group.RelativeInput)
            }
        }
)

$extensionCounts = @{}
foreach ($record in $records) {
    Add-Count -Table $extensionCounts -Key $record.InputExtension
}

$existingOutputFiles = @()
if (Test-Path -LiteralPath $outputRootFull -PathType Container) {
    $existingOutputFiles = @(Get-ChildItem -LiteralPath $outputRootFull -Recurse -File | Sort-Object FullName)
}

$existingExpectedOutputs = @(
    $records |
        Where-Object { Test-Path -LiteralPath $_.OutputPath -PathType Leaf } |
        Select-Object -ExpandProperty RelativeOutput
)

$existingExpectedLookup = @{}
foreach ($relative in $existingExpectedOutputs) {
    $existingExpectedLookup[$relative.ToLowerInvariant()] = $true
}

$existingOtherFiles = @(
    $existingOutputFiles |
        Where-Object {
            $relative = [System.IO.Path]::GetRelativePath($outputRootFull, $_.FullName)
            -not $existingExpectedLookup.ContainsKey($relative.ToLowerInvariant())
        } |
        ForEach-Object { [System.IO.Path]::GetRelativePath($outputRootFull, $_.FullName) }
)

if ($Mode -eq 'Inventory') {
    [pscustomobject]@{
        Mode              = $Mode
        InputRoot         = $inputRootFull
        OutputRoot        = $outputRootFull
        InputImageCount   = $records.Count
        InputExtensions   = $extensionCounts
        OutputCollisions  = $collisions.Count
        CollisionDetails  = $collisions
        OutputDirectoryExists       = (Test-Path -LiteralPath $outputRootFull -PathType Container)
        ExistingOutputFileCount     = $existingOutputFiles.Count
        ExistingExpectedOutputCount = $existingExpectedOutputs.Count
        ExistingExpectedOutputs     = $existingExpectedOutputs
        ExistingOtherFileCount      = $existingOtherFiles.Count
        ExistingOtherFiles          = $existingOtherFiles
        OverwriteRisk               = ($existingExpectedOutputs.Count -gt 0)
        CleanOutputDirectory        = ($existingOutputFiles.Count -eq 0)
        SafeToWrite                 = ($records.Count -gt 0 -and $collisions.Count -eq 0 -and $existingExpectedOutputs.Count -eq 0)
        Manifest          = $records
        Ready             = ($records.Count -gt 0 -and $collisions.Count -eq 0)
    } | ConvertTo-Json -Depth 8

    if ($records.Count -eq 0 -or $collisions.Count -gt 0) {
        exit 2
    }
    exit 0
}

$outputFiles = $existingOutputFiles

$pngFiles = @($outputFiles | Where-Object { $_.Extension.ToLowerInvariant() -eq '.png' })
$nonPngFiles = @($outputFiles | Where-Object { $_.Extension.ToLowerInvariant() -ne '.png' })
$expectedRelative = @{}
foreach ($record in $records) {
    $expectedRelative[$record.RelativeOutput.ToLowerInvariant()] = $record
}

$missing = @(
    $records |
        Where-Object { -not (Test-Path -LiteralPath $_.OutputPath -PathType Leaf) } |
        Select-Object -ExpandProperty RelativeOutput
)

$extra = @(
    $pngFiles |
        ForEach-Object { [System.IO.Path]::GetRelativePath($outputRootFull, $_.FullName) } |
        Where-Object { -not $expectedRelative.ContainsKey($_.ToLowerInvariant()) }
)

$unreadable = @()
$outputSizes = @{}
$outputFormats = @{}

if ($pngFiles.Count -gt 0) {
    Add-Type -AssemblyName System.Drawing
    foreach ($file in $pngFiles) {
        try {
            $image = [System.Drawing.Image]::FromFile($file.FullName)
            try {
                Add-Count -Table $outputSizes -Key "$($image.Width)x$($image.Height)"
                Add-Count -Table $outputFormats -Key $image.RawFormat.ToString()
            }
            finally {
                $image.Dispose()
            }
        }
        catch {
            $unreadable += [System.IO.Path]::GetRelativePath($outputRootFull, $file.FullName)
        }
    }
}

$valid = (
    $records.Count -gt 0 -and
    $collisions.Count -eq 0 -and
    $pngFiles.Count -eq $records.Count -and
    $missing.Count -eq 0 -and
    $extra.Count -eq 0 -and
    $nonPngFiles.Count -eq 0 -and
    $unreadable.Count -eq 0
)

[pscustomobject]@{
    Mode                   = $Mode
    InputRoot              = $inputRootFull
    OutputRoot             = $outputRootFull
    InputImageCount        = $records.Count
    OutputPngCount         = $pngFiles.Count
    MissingCount           = $missing.Count
    Missing                = $missing
    ExtraPngCount          = $extra.Count
    ExtraPng               = $extra
    NonPngCount            = $nonPngFiles.Count
    NonPng                 = @($nonPngFiles | ForEach-Object { [System.IO.Path]::GetRelativePath($outputRootFull, $_.FullName) })
    UnreadableCount        = $unreadable.Count
    Unreadable             = $unreadable
    OutputCollisions       = $collisions.Count
    CollisionDetails       = $collisions
    OutputNativeSizes      = $outputSizes
    DetectedOutputFormats  = $outputFormats
    FileValidationPassed   = $valid
    VisualValidationNeeded = $true
} | ConvertTo-Json -Depth 8

if (-not $valid) {
    exit 2
}

exit 0
