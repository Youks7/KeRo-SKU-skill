<h1 align="center">KeRo SKU Skill</h1>

<p align="center"><strong>先保护真实 SKU，再做不套模板的电商详情页</strong></p>

<p align="center">真实产品保真 · 三阶段决策 · 防同质化生产 · 逐屏商业图</p>

<p align="center">
  简体中文 ·
  <a href="./README_EN.md">English</a> ·
  <a href="./README_ZH-TW.md">繁體中文</a>
</p>

<p align="center">
  <a href="./dist/sku-detail-page-director.skill">下载 Skill</a> ·
  <a href="./docs/INSTALL.md">安装说明</a> ·
  <a href="./examples/sunglasses-detail-page.md">查看示例</a> ·
  <a href="./skills/sku-detail-page-director/SKILL.md">查看 Skill</a>
</p>

---

## 这是什么

KeRo SKU Skill 是一个用于 **真实 SKU 商品详情页策划与 AI 生图 Prompt 生产** 的 Codex Skill。

它的核心不是让 AI 直接“发挥想象”生成商品图，而是先保护真实产品，再把电商详情页拆成可控流程：

```text
上传真实产品图
   ↓
阶段一：产品深度分析
   ↓
阶段二：A / B / C 三个详情页方向
   ↓
用户确认方向
   ↓
阶段三：逐屏方案、Prompt、Negative Prompt、质检点
```

适用于淘宝、天猫、京东、拼多多、抖音商城、小红书、Amazon、Shopify、TikTok Shop 等电商场景。

## 适合谁使用

- 电商运营：需要快速判断一个 SKU 详情页怎么做。
- 设计师：需要把产品图拆成可执行的视觉方向和分屏方案。
- AIGC 创作者：需要更安全、更稳定的商品图 Prompt。
- 跨境卖家：需要 Amazon A+、Shopify、TikTok Shop 商品图方向。
- 批量上新团队：需要避免所有 SKU 都长得像同一套模板。

## 你想做什么，直接看这里

| 你的需求 | 建议入口 |
| --- | --- |
| 第一次安装 Skill | [安装说明](./docs/INSTALL.md) |
| 不知道怎么启动 | [第一次使用](#第一次使用) |
| 想看完整流程 | [三阶段工作流](#三阶段工作流) |
| 想做淘宝 / 抖音详情页 | [淘宝 9:16 示例](./examples/taobao-9-16-detail-page.md) |
| 想做 Amazon A+ | [Amazon A+ 示例](./examples/amazon-a-plus-example.md) |
| 想做墨镜类商品图 | [墨镜详情页示例](./examples/sunglasses-detail-page.md) |
| 想参考竞品但不想侵权 | [安全参考竞品示例](./examples/competitor-reference-safe-use.md) |
| Skill 没有触发或产品变形 | [常见问题](./docs/TROUBLESHOOTING.md) |
| 想了解商用边界 | [安全与使用边界](./docs/SAFETY_AND_USAGE.md) |

## V2 为什么更好用

旧版把几乎所有规则放在一个超过 2,000 行的文件里，并要求每个新项目完整读取。这样会挤占上下文，规则越多反而越容易被遗漏，也不利于跨轮续接。

V2 的改变：

- `SKILL.md` 只保留触发、分流、阶段门禁和交付原则。
- 事实护栏、工作流契约、Prompt 生产、平台和类目规则拆成按需读取的参考文件。
- 每轮用固定的“项目状态”记录事实、模式、方向和下一步，避免用户说“继续”后重新开始。
- 详情页制作默认先完成前 3 屏，确认视觉系统后再扩展，减少整套返工。
- `.skill` 安装包由脚本生成，避免发布包落后于源码。

## 三阶段工作流

### 阶段一：产品深度分析

只分析产品，不输出正式生图 Prompt。

这一阶段会判断：

- 图片里能确认的产品事实。
- 哪些信息不能编造。
- 产品适合严格保真、AI 辅助商品图，还是概念生成。
- 类目中常见的同质化套路。
- 这个产品自己的视觉记忆点。
- 下一步只需要你确认的一个关键决策。

### 阶段二：方向提案

给出 A / B / C 三个明显不同的详情页方向。

每个方向会说明：

- 适合的平台和人群。
- 首屏应该怎么吸引注意。
- 页面节奏和销售逻辑。
- 未来每一屏大概长什么样。
- 如何避开常见模板感。
- 优点、风险和推荐程度。

### 阶段三：逐屏生产

只有你确认方向后，才进入正式逐屏生产。

每一屏会包含：

- 销售任务。
- 构图说明。
- 文案方向。
- 生图 Prompt。
- Negative Prompt。
- 产品保真要求。
- 文字安全区。
- 一致性质检点。

## 快速安装

### 方法一：导入 `.skill` 文件

下载这个文件并导入 Codex：

[`sku-detail-page-director.skill`](./dist/sku-detail-page-director.skill)

### 方法二：复制 Skill 目录

把下面这个目录复制到 Codex 的 skills 目录：

```text
skills/sku-detail-page-director/
```

目录本身采用英文路径，避免中文路径在不同工具中的兼容性问题。

更详细步骤见 [docs/INSTALL.md](./docs/INSTALL.md)。

## 第一次使用

上传真实产品图后，发送：

```text
请使用 $sku-detail-page-director 分析我上传的产品图。

先执行阶段一：产品深度分析。
在我确认方向前，不要输出正式生图 Prompt。
不能编造图片和资料中无法确认的规格、材质、认证、功效或评价。
```

如果你已经知道平台和屏数，可以这样写：

```text
请使用 $sku-detail-page-director 分析我上传的产品图。

目标平台：淘宝 / 抖音商城通用
输出语言：中文
预计屏数：8 屏
核心卖点：暂不确定，请根据图片谨慎判断

先执行阶段一。
在我确认方向前，不要输出正式生图 Prompt。
不能编造图片中看不出来的规格、材质、认证、功效和用户评价。
```

## 产品处理模式

| 模式 | 适合场景 | 产品处理方式 |
| --- | --- | --- |
| A 严格保真 | 品牌款、高客单、外观必须完全一致 | 使用真实产品抠图，AI 只生成背景、场景、光影和留白 |
| B AI 辅助商品图 | 普通 SKU、快速上新、小白用户 | 基于真实产品图做背景替换、轻度重绘或场景化生成，并做一致性质检 |
| C 概念生成 | 新品提案、方向测试、没有实物图 | 只用于概念探索，不能当作真实 SKU 成品图 |

## 不可违反的规则

1. 真实产品图是唯一产品身份来源。
2. 不编造品牌、规格、尺寸、材质、认证、功效、评价和售后承诺。
3. 材质无法确认时，只能描述“可见质感”“视觉上接近”或“真实材质待确认”。
4. 不改变真实 SKU 的颜色、结构、比例、Logo、包装文字和关键细节。
5. 竞品图只参考构图、节奏和信息结构，不复制产品、Logo、文案和品牌资产。
6. AI 图像模型不负责最终文字、Logo、参数表、认证标识和 CTA，这些建议后期排版并人工校对。

## 示例

- [墨镜详情页示例](./examples/sunglasses-detail-page.md)
- [淘宝 / 抖音 9:16 详情页示例](./examples/taobao-9-16-detail-page.md)
- [Amazon A+ 示例](./examples/amazon-a-plus-example.md)
- [安全参考竞品示例](./examples/competitor-reference-safe-use.md)

## 项目结构

```text
skills/sku-detail-page-director/
├── SKILL.md                        触发、分流与阶段门禁
├── agents/openai.yaml               Codex UI 元数据
└── references/
    ├── core-guardrails.md           事实、保真与竞争品边界
    ├── workflow-contracts.md        三阶段输出与项目状态
    ├── prompt-production.md         分模式 Prompt 与质检
    ├── platform-profiles.md         平台适配
    └── category-profiles.md         类目风险速查

dist/sku-detail-page-director.skill  可直接导入的发布包
scripts/package-skill.ps1            从源码重建发布包
docs/                                安装、排错、安全边界和 GitHub 设置说明
examples/                            典型电商场景使用示例
```

## 版本

当前版本：**v2.0.0 分层工作流版**

版本变化见 [CHANGELOG.md](./CHANGELOG.md)。

后续规划见 [ROADMAP.md](./ROADMAP.md)。

## 维护与发布

修改 `skills/sku-detail-page-director/` 后，在仓库根目录运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\package-skill.ps1
```

它会重建 `dist/sku-detail-page-director.skill`。提交前请确认源码和安装包同时变化。

## 使用许可

本仓库的 Skill、文档、规则和示例文字可以用于学习、参考和非商业使用。

如果你引用或改编本仓库内容，请注明来源并链接回本仓库。

请不要直接搬运本仓库内容进行商业转卖。

仓库中涉及的第三方平台名称、商标、产品名和工具名，仍归各自权利人所有。

更多说明见 [NOTICE.md](./NOTICE.md) 和 [LICENSE](./LICENSE)。

## 关于作者

**秋水 Kero**，AIGC 创作者，持续分享 AI、图片和电商视觉工作流。

X（推特）：[@Isonlyonenice](https://x.com/Isonlyonenice)
