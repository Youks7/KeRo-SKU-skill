# Installation Guide

This guide explains how to install and start KeRo SKU Skill in Codex.

## V1.3 Skill Selection

V1.3 is a multi-skill suite. Install `sku-product-core` plus the platform skills you need. Install `sku-detail-page-director` when you need legacy compatibility, platform selection, or multi-platform routing.

Prebuilt packages are in `packages/`:

```text
sku-detail-page-director.skill
sku-product-core.skill
sku-taobao.skill
sku-tmall.skill
sku-pinduoduo.skill
sku-jd.skill
sku-1688.skill
sku-amazon.skill
sku-shopify.skill
sku-tiktok-shop.skill
kero-sku-skills-v1.3-bundle.zip
```

The bundle contains the standalone `.skill` files; import the ones you want. Each platform package is self-contained.

## Method 1: Import the Complete V1.3 Suite

Download the bundle:

[`kero-sku-skills-v1.3-bundle.zip`](../packages/kero-sku-skills-v1.3-bundle.zip)

Extract it, then import `sku-product-core.skill` plus the marketplace `.skill` files you need. Import `sku-detail-page-director.skill` when you want platform selection, multi-platform routing, or legacy invocation.

For the complete eight-marketplace workflow, the installed Skill names should include:

```text
sku-detail-page-director
sku-product-core
sku-taobao
sku-tmall
sku-pinduoduo
sku-jd
sku-1688
sku-amazon
sku-shopify
sku-tiktok-shop
```

The legacy [`SKU详情页导演Skill.skill`](../SKU详情页导演Skill/SKU详情页导演Skill.skill) contains only the compatibility router. Installing it alone does not install marketplace production rules or the mandatory per-unit Prompt contract.

## Method 2: Copy the Skill Directory

Copy the core, router, and required marketplace directories into your Codex skills directory:

```text
SKU详情页导演Skill/sku-detail-page-director/
skills/sku-product-core/
skills/sku-taobao/
...the marketplace directories you need
```

If your system or terminal has trouble with Chinese paths, copy only the inner folder:

```text
sku-detail-page-director/
```

Every marketplace Skill folder should contain:

```text
SKILL.md
agents/openai.yaml
references/common-safety.md
references/platform-rules.md
references/per-unit-production.md
```

## Confirm Installation

Start a new Codex conversation and send:

```text
请使用 $sku-detail-page-director 判断这个商品应该进入哪个平台工作流。
```

If the Skill is installed correctly, Codex should identify the marketplace and route to the matching platform skill. Install `sku-product-core` when shared fact analysis is required.

With the complete bundle installed, the router should continue into product analysis and the selected marketplace workflow in the same conversation. The user should not need to copy `SKU_CONTEXT` or invoke a second Skill manually.

## First Starter Prompt

```text
请使用 $sku-detail-page-director 从我上传的真实产品资料开始，
在同一任务中完成事实分析、平台识别和方向提案。
不要让我重复调用其他 Skill；方向确认前不要输出正式生图 Prompt。
```

If the platform is already known, invoke it directly after installing the core and platform packages:

```text
请使用 $sku-amazon 基于我的 SKU_CONTEXT 规划 Amazon US Main Image、附图和 A+ Content。
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

- If a platform skill does not trigger, use its exact name such as `$sku-amazon` or `$sku-1688`.
- Use `$sku-detail-page-director` as the recommended one-entry workflow. Advanced users may invoke a marketplace Skill directly.
- If the reference rules are not read, confirm that the `references/` folder is inside the Skill directory.
- If Chinese paths display incorrectly, copy the inner English folder directly.
- If a platform skill restarts product analysis, provide the existing `SKU_CONTEXT` and tell it to preserve verified facts and fidelity mode.
