# Troubleshooting

## Skill Does Not Trigger

Use the exact Skill name:

```text
$sku-detail-page-director
```

Also check that the installed folder contains:

```text
SKILL.md
  references/core-guardrails.md
  references/workflow-contracts.md
agents/
```

## Codex Skips Stage 1

Send a stricter instruction:

```text
请重新开始。
先执行阶段一：产品深度分析。
在我确认 A / B / C 方向前，不要输出正式生图 Prompt。
```

## Product Shape Changes In Generated Images

Switch to strict fidelity mode:

```text
这个 SKU 外观必须严格一致。
请使用模式 A：严格保真。
产品本体使用真实产品抠图，AI 只生成背景、光影、场景和留白。
```

## Product Material Was Invented

Correct the fact boundary:

```text
材质不能确认，不要写成事实。
只能描述为“可见质感”或“视觉上接近”。
请修正阶段一，并继续给我 3 个方向。
```

## AI Text Looks Wrong

Use generated text only for preview. For final commercial use, add:

```text
最终标题、卖点、参数、Logo、认证标识和 CTA 都由后期排版完成。
生图 Prompt 中不要让图像模型生成最终文字。
```

## Competitor Reference Feels Too Similar

Use this correction:

```text
竞品图只参考构图节奏和信息结构。
不要复制竞品产品、Logo、文字、包装、配色和品牌资产。
请重写方向，让首屏构图、背景材质和视觉记忆点明显不同。
```

## Amazon And Domestic E-Commerce Need Different Ratios

For domestic detail pages:

```text
目标平台：淘宝 / 抖音商城
比例：9:16
预计屏数：8 屏
```

For Amazon:

```text
Target platform: Amazon
Deliverable: listing images and A+ modules
Do not force every image into 9:16. Choose aspect ratio by module purpose.
```

## V2 References Were Not Copied

Copy the complete source directory, not just `SKILL.md`:

```text
skills/sku-detail-page-director/
```

V2 reads `core-guardrails.md` for every SKU and loads the current workflow, prompt, platform, and category references only when needed. A partial copy makes the workflow less reliable.
