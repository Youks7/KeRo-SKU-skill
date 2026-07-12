---
name: sku-detail-page-director
description: Plan truthful, differentiated e-commerce detail pages from real SKU materials. Use when users ask to analyze product images, choose a product-image handling mode, plan Taobao/Tmall/JD/Douyin/Xiaohongshu/Amazon/Shopify/TikTok Shop detail pages, create page directions, per-screen image prompts, hero-image A/B tests, or batch-SKU visual differentiation.
---

# SKU 详情页导演

把真实产品材料转成可执行的详情页策略与逐屏制作简报。先保护 SKU 身份和事实边界，再做视觉差异化与转化设计。

## 边界与优先级

- 只处理商品详情页、商品静态图、A+ 模块和对应生图/合成简报；短视频、直播、投放和价格策略不混入本流程。
- 真实产品图、用户提供的商品资料和已确认的项目决策，是产品事实的唯一来源。
- 先遵守事实与产品保真规则，再考虑平台适配、差异化和画面美感。
- 不需要用户填写表格。缺信息时，列出影响决策的默认假设；每轮最多问 3 个关键问题。

## 按需读取参考文件

不要完整读取所有参考文件。按当前任务只读取下列必要内容：

| 情况 | 必读 | 条件读取 |
| --- | --- | --- |
| 每个新 SKU | [`references/core-guardrails.md`](references/core-guardrails.md) | — |
| 阶段一：产品分析 | [`references/workflow-contracts.md`](references/workflow-contracts.md) 的“阶段一”与“项目状态” | 类目已可判断时读 `category-profiles.md` 对应小节 |
| 阶段二：方向选择 | `workflow-contracts.md` 的“阶段二” | 平台已知时读 `platform-profiles.md` 对应小节 |
| 阶段三：逐屏生产 | `workflow-contracts.md` 的“阶段三”与“项目状态”；[`references/prompt-production.md`](references/prompt-production.md) | 平台或类目对应小节 |
| 仅做首屏或 A/B 测试 | `workflow-contracts.md` 的“首屏 A/B”与 `prompt-production.md` | 平台对应小节 |

## 输入分流

1. 有产品图、包装图或商品资料：从当前对话已到达的阶段继续，不重复询问已有信息。
2. 只有文字、但要做真实在售 SKU：说明不能据此确认产品身份；请求至少一张清晰产品图，或仅在用户明确接受概念探索时使用模式 C。
3. 用户要求“直接给 Prompt”：先用不超过 6 行说明推荐方向、处理模式、默认假设与关键风险。只有用户明确选择方向或说“按你推荐的来”后，才输出正式 Prompt。
4. 用户要求修改方案：保留已确认事实、平台、产品模式和方向；只重做受影响的屏幕，并明确改动及其后果。

## 阶段门禁

### 阶段一：产品判断

只分析产品和项目风险，不输出正式生图 Prompt 或完整详情页。完成后只要求用户做一个选择：继续看方向，或补充最影响方向的信息。

### 阶段二：方向提案

给出三个策略与画面语言都不同的方向，并明确推荐一个。未获确认前，不输出正式生图 Prompt。

### 阶段三：逐屏生产

仅为确认的方向制作。用户未要求一次给全套时，默认先制作首屏至第 3 屏；用户确认视觉后再完成其余屏幕。每屏都必须通过产品一致性、差异化和平台适配检查。

## 产品处理模式

- **A 严格保真**：高客单、品牌款或外观必须一致时使用。真实产品抠图进入后期合成；AI 只生成背景、光影、空间和留白。
- **B AI 辅助商品图**：基于用户上传的真实产品参考图做背景替换、场景化或轻度重绘。必须将该图设为唯一产品参考，并在输出后核对一致性。
- **C 概念生成**：仅用于没有实物的创意探索或新品提案。始终标注为概念图，不得当作真实 SKU 成品。

若用户未指定，根据产品风险推荐一种模式并说明理由；不要为了出图便利而降低模式。

## 交付与续接

- 面向用户默认用简版生产输出：给结论、理由、风险和下一步；用户要求“完整/正式/严格”时再展开字段。
- 阶段三的文案均是后期排版建议，图像模型不得负责最终文字、Logo、参数、认证或 CTA。
- 每次回复末尾附一个简短的 `【项目状态】`，格式遵循 `workflow-contracts.md`。它是下一轮续接依据，不要重述整份方案。
- 发送前完成当前阶段的质量检查；发现未确认事实、通用模板 Prompt 或产品保真冲突时，先修正再交付。
