# Installation Guide

This guide explains how to install and start KeRo SKU Skill in Codex.

## Method 1: Import the `.skill` File

Download this file:

[`sku-detail-page-director.skill`](../dist/sku-detail-page-director.skill)

Then import it into Codex through the Skill import flow.

After import, the Skill name should be:

```text
sku-detail-page-director
```

## Method 2: Copy the Skill Directory

Copy this directory into your Codex skills directory:

```text
skills/sku-detail-page-director/
```

The target folder should contain:

```text
SKILL.md
agents/openai.yaml
references/core-guardrails.md
references/workflow-contracts.md
references/prompt-production.md
references/platform-profiles.md
references/category-profiles.md
```

## Confirm Installation

Start a new Codex conversation and send:

```text
请使用 $sku-detail-page-director 分析我上传的产品图。
```

If the Skill is installed correctly, Codex should use the SKU detail-page director workflow and begin with Stage 1 product analysis.

## First Starter Prompt

```text
请使用 $sku-detail-page-director 分析我上传的产品图。

先执行阶段一：产品深度分析。
在我确认方向前，不要输出正式生图 Prompt。
不能编造图片和资料中无法确认的规格、材质、认证、功效或评价。
```

## Recommended Input Images

Provide as many of these as possible:

- Front view
- Side view
- 45-degree view
- Detail close-ups
- Packaging
- Logo area
- Product variants
- In-use image

You do not need to prepare everything at once. The Skill is designed to proceed with reasonable default assumptions when information is missing.

## Common Installation Issues

- If the Skill does not trigger, check whether the folder name is exactly `sku-detail-page-director`.
- If the reference rules are not read, confirm that the whole `references/` folder is inside the Skill directory.
- Do not copy only `SKILL.md`; V2 reads focused reference files when each workflow stage needs them.
- If Codex directly generates prompts without analysis, explicitly say: "先执行阶段一，在我确认方向前不要输出正式生图 Prompt。"
