[CmdletBinding()]
param(
  [string]$RepositoryRoot
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($RepositoryRoot)) {
  $RepositoryRoot = Split-Path -Parent $PSScriptRoot
}

$source = Join-Path $RepositoryRoot 'skills\sku-detail-page-director'
$outputDirectory = Join-Path $RepositoryRoot 'dist'
$output = Join-Path $outputDirectory 'sku-detail-page-director.skill'

if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md'))) {
  throw "Cannot package: SKILL.md was not found at $source"
}

$temporaryPackage = Join-Path ([System.IO.Path]::GetTempPath()) ("kero-sku-skill-" + [System.Guid]::NewGuid().ToString('N') + '.zip')

try {
  New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
  Add-Type -AssemblyName System.IO.Compression
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  $stream = [System.IO.File]::Open($temporaryPackage, [System.IO.FileMode]::CreateNew)
  $archive = [System.IO.Compression.ZipArchive]::new($stream, [System.IO.Compression.ZipArchiveMode]::Create, $false)
  try {
    $sourceRoot = (Resolve-Path -LiteralPath $source).Path
    Get-ChildItem -LiteralPath $sourceRoot -File -Recurse | ForEach-Object {
      $relative = $_.FullName.Substring($sourceRoot.Length).TrimStart('\').Replace('\', '/')
      $entry = $archive.CreateEntry("sku-detail-page-director/$relative", [System.IO.Compression.CompressionLevel]::Optimal)
      $entryStream = $entry.Open()
      $inputStream = [System.IO.File]::OpenRead($_.FullName)
      try {
        $inputStream.CopyTo($entryStream)
      }
      finally {
        $inputStream.Dispose()
        $entryStream.Dispose()
      }
    }
  }
  finally {
    $archive.Dispose()
    $stream.Dispose()
  }
  [System.IO.File]::Copy($temporaryPackage, $output, $true)
  Write-Output "Created $output"
}
finally {
  if (Test-Path -LiteralPath $temporaryPackage) {
    Remove-Item -LiteralPath $temporaryPackage -Force -ErrorAction SilentlyContinue
  }
}
