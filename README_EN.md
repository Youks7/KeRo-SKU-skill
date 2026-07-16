<h1 align="center">KeRo SKU Skill</h1>

<p align="center"><strong>Protect the real SKU first. Then build product pages that do not look templated.</strong></p>

<p align="center">Real-product fidelity · Three-stage decisions · Differentiated production · Screen-by-screen prompts</p>

<p align="center">
  <a href="./README.md">简体中文</a> ·
  English ·
  <a href="./README_ZH-TW.md">繁體中文</a>
</p>

<p align="center">
  <a href="./packages/kero-sku-skills-v1.3-bundle.zip">Download the V1.3 full suite</a> ·
  <a href="./docs/INSTALL.md">Install guide</a> ·
  <a href="./examples/sunglasses-detail-page.md">Examples</a> ·
  <a href="./shared/core-safety.md">Core safety rules</a>
</p>

---

## What Is This

KeRo SKU Skill is a Codex skill suite for **real-SKU fact analysis, marketplace routing, product-page planning, and controlled visual production**.

> V1.3 development status: the former all-in-one workflow is being split into a shared product-fidelity core plus dedicated Taobao, Tmall, Pinduoduo, JD, 1688, Amazon, Shopify, and TikTok Shop skills. Standalone packages are available in [`packages/`](./packages/).

It is designed to protect the actual product before generating commercial visuals. The workflow is intentionally staged:

```text
Upload real product images
        ↓
sku-product-core: verified facts and fidelity boundaries
        ↓
Router: marketplace and asset-slot selection
        ↓
Dedicated marketplace skill
        ↓
Native listing, module, PDP, B2B, prompt, and QA outputs
```

V1.3 includes dedicated Taobao, Tmall, JD.com, Pinduoduo, 1688, Amazon, Shopify, and TikTok Shop workflows instead of treating them as style variants.

## Who It Is For

- E-commerce operators who need a clear SKU page direction.
- Designers who need product-page structure, visual rhythm, and per-screen planning.
- AIGC creators who need safer product-image prompts.
- Cross-border sellers working on Amazon A+, Shopify, or TikTok Shop assets.
- Teams that need differentiated visual systems for many SKUs.

## Quick Navigation

| Need | Start Here |
| --- | --- |
| Install the Skill | [Install guide](./docs/INSTALL.md) |
| First run | [First Use](#first-use) |
| Understand the workflow | [Routed Production Workflow](#routed-production-workflow) |
| Taobao product page | [Taobao mobile-detail module example](./examples/taobao-9-16-detail-page.md) |
| Amazon A+ content | [Amazon A+ example](./examples/amazon-a-plus-example.md) |
| V1.3 marketplace forward-test evidence | [Forward test report](./tests/FORWARD_TEST_REPORT.md) |
| Sunglasses or fashion accessories | [Sunglasses example](./examples/sunglasses-detail-page.md) |
| Use competitor pages safely | [Competitor reference example](./examples/competitor-reference-safe-use.md) |
| Troubleshooting | [Troubleshooting](./docs/TROUBLESHOOTING.md) |
| Commercial and safety boundaries | [Safety and usage guide](./docs/SAFETY_AND_USAGE.md) |

## Routed Production Workflow

### Stage 1: Shared Product Analysis

The Skill analyzes the product only. It does not produce final image-generation prompts yet.

It identifies:

- Verifiable facts from the uploaded product images.
- Information that must not be invented.
- The best product-handling mode.
- Common category templates to avoid.
- Product-specific visual memory points.
- The single decision needed for the next step.

### Stage 2: Direction Proposal

The Skill proposes three clearly different product-page directions.

Each direction explains:

- Best platform and audience.
- First-screen hook.
- Page rhythm and sales logic.
- Future visual structure.
- How it avoids template-like output.
- Benefits, risks, and recommendation level.

### Stage 3: Per-Screen Production

Only after the user approves a direction, the Skill creates the production plan.

Each screen includes:

- Sales objective.
- Composition.
- Copy direction.
- Image-generation prompt.
- Negative prompt.
- Product-handling mode and source evidence.
- Exact copy placement and text-safe area.
- Post-production layout and responsive crop requirements.
- Shot matrix and cross-unit continuity.
- Product-consistency QA points.
- Generic-prompt interception and mandatory rewrite when it fails.

## Installation

### Option 1: Import the `.skill` File

For the complete V1.3 workflow, download the bundle and import `sku-product-core` plus the marketplace packages you need:

[`kero-sku-skills-v1.3-bundle.zip`](./packages/kero-sku-skills-v1.3-bundle.zip)

The legacy [`SKU详情页导演Skill.skill`](./SKU详情页导演Skill/SKU详情页导演Skill.skill) is only the compatibility router and does not contain all marketplace production rules.

### Option 2: Copy the Skill Directory

Copy this directory into your Codex skills directory:

```text
SKU详情页导演Skill/sku-detail-page-director/
```

If your system or tooling has trouble with Chinese paths, copy the inner `sku-detail-page-director/` folder directly.

See [docs/INSTALL.md](./docs/INSTALL.md) for details.

## First Use

Use one entry point. After uploading real product images, send:

```text
Use $sku-detail-page-director to handle fact analysis, marketplace selection, and direction proposals in this same task.
Do not ask me to invoke other skills again. Do not produce formal image-generation prompts until I approve a direction, and do not invent facts that are not supported by my images or documents.
```

## Product-Handling Modes

| Mode | Best For | Product Handling |
| --- | --- | --- |
| A Strict fidelity | Branded products, premium SKUs, appearance-critical products | Use the real product cutout; AI generates only background, scene, lighting, and whitespace |
| B AI-assisted product image | Slots where the marketplace allows it and sufficient real references exist | Perform limited background or scene changes from the specified real image; fall back to Mode A when identity details drift |
| C Concept generation | New-product concepts or direction testing | Concept exploration only; never present it as a real SKU image |

## Non-Negotiable Rules

1. Real product images are the only source of product identity.
2. Never invent brand, specification, dimension, material, certification, claim, review, or after-sales promise.
3. If material is unverified, describe only visible finish or visual impression.
4. Do not change the SKU color, structure, proportions, logo, package text, or distinctive details.
5. Competitor references may guide composition and rhythm, but not product design, logos, copy, or brand assets.
6. Final text, logos, specs, certification marks, and CTAs should be added and proofread in post-production.

## Examples

- [Sunglasses detail-page example](./examples/sunglasses-detail-page.md)
- [Taobao mobile-detail module example](./examples/taobao-9-16-detail-page.md)
- [Amazon A+ example](./examples/amazon-a-plus-example.md)
- [Competitor-reference safety example](./examples/competitor-reference-safe-use.md)

## Project Structure

```text
SKU详情页导演Skill/
├── sku-detail-page-director/
│   ├── SKILL.md
│   ├── agents/openai.yaml
│   └── references/
└── SKU详情页导演Skill.skill

skills/            Shared product core and eight platform-specific skills
shared/            Canonical safety, state, research, and QA rules
scripts/           Sync, validation, asset checks, and package builds
tests/             Static trigger-regression corpus
packages/          Standalone .skill packages and the complete bundle
docs/              Installation, troubleshooting, safety, and GitHub settings
examples/          Practical e-commerce usage examples
assets/            Repository cover and visual assets
website/           Optional static website
```

## Version

Current development version: **V1.3.0-dev multi-platform skill suite**

Stable baseline: **Lite V1.2.1**, preserved by the `v1.2.1` Git tag.

See [CHANGELOG.md](./CHANGELOG.md) and [ROADMAP.md](./ROADMAP.md).

## License

The Skill, documentation, rules, and examples in this repository may be used for learning, reference, and non-commercial use.

If you quote or adapt this work, please credit the source and link back to this repository.

Do not directly repackage or resell this repository's content as a commercial product.

Third-party platform names, trademarks, product names, and tool names remain the property of their respective owners.

See [NOTICE.md](./NOTICE.md) and [LICENSE](./LICENSE).

## Author

**Qiu Shui Kero**, AIGC creator sharing AI, image, and e-commerce visual workflows.

X: [@Isonlyonenice](https://x.com/Isonlyonenice)
