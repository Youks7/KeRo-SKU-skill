<h1 align="center">KeRo SKU Skill</h1>

<p align="center"><strong>先保護真實 SKU，再做不套模板的電商詳情頁</strong></p>

<p align="center">真實產品保真 · 三階段決策 · 防同質化生產 · 逐屏商業圖</p>

<p align="center">
  <a href="./README.md">簡體中文</a> ·
  <a href="./README_EN.md">English</a> ·
  繁體中文
</p>

<p align="center">
  <a href="./packages/kero-sku-skills-v1.3-bundle.zip">下載 V1.3 全平台合集</a> ·
  <a href="./docs/INSTALL.md">安裝說明</a> ·
  <a href="./examples/sunglasses-detail-page.md">查看示例</a> ·
  <a href="./shared/core-safety.md">公共安全規則</a>
</p>

---

## 這是什麼

KeRo SKU Skill 是一組用於 **真實 SKU 事實分析、平台路由、商品頁策劃與 AI 視覺生產** 的 Codex Skills。

它的核心不是讓 AI 直接想像商品圖，而是先保護真實產品，再把電商詳情頁拆成可控流程：

```text
上傳真實產品圖
   ↓
sku-product-core：產品事實與保真分析
   ↓
總路由：平台與素材槽位選擇
   ↓
對應平台專用 Skill
   ↓
平台原生素材、Prompt 與質檢
```

V1.3 已將淘寶、天貓、京東、拼多多、1688、Amazon、Shopify 與 TikTok Shop 拆成獨立工作流，不再只當作不同視覺風格。

## 適合誰使用

- 電商營運：需要快速判斷一個 SKU 詳情頁怎麼做。
- 設計師：需要把產品圖拆成可執行的視覺方向和分屏方案。
- AIGC 創作者：需要更安全、更穩定的商品圖 Prompt。
- 跨境賣家：需要 Amazon A+、Shopify、TikTok Shop 商品圖方向。
- 批量上新團隊：需要避免所有 SKU 都長得像同一套模板。

## 你想做什麼，直接看這裡

| 你的需求 | 建議入口 |
| --- | --- |
| 第一次安裝 Skill | [安裝說明](./docs/INSTALL.md) |
| 不知道怎麼啟動 | [第一次使用](#第一次使用) |
| 想看完整流程 | [三階段工作流](#三階段工作流) |
| 想做淘寶詳情頁 | [淘寶移動端詳情模塊示例](./examples/taobao-9-16-detail-page.md) |
| 想做 Amazon A+ | [Amazon A+ 示例](./examples/amazon-a-plus-example.md) |
| 想做墨鏡類商品圖 | [墨鏡詳情頁示例](./examples/sunglasses-detail-page.md) |
| 想參考競品但不想侵權 | [安全參考競品示例](./examples/competitor-reference-safe-use.md) |
| Skill 沒有觸發或產品變形 | [常見問題](./docs/TROUBLESHOOTING.md) |
| 想了解商用邊界 | [安全與使用邊界](./docs/SAFETY_AND_USAGE.md) |

## 三階段工作流

### 階段一：產品深度分析

只分析產品，不輸出正式生圖 Prompt。

這一階段會判斷：

- 圖片裡能確認的產品事實。
- 哪些資訊不能編造。
- 產品適合嚴格保真、AI 輔助商品圖，還是概念生成。
- 類目中常見的同質化套路。
- 這個產品自己的視覺記憶點。
- 下一步只需要你確認的一個關鍵決策。

### 階段二：平台路由與方向提案

先確認平台和素材槽位，再由對應平台 Skill 給出二至三個商業任務明顯不同的方向。A/B/C 只作選擇標籤，不固定等於功能、場景和高端。

每個方向會說明：

- 適合的平台和人群。
- 首屏應該怎麼吸引注意。
- 頁面節奏和銷售邏輯。
- 未來每一屏大概長什麼樣。
- 如何避開常見模板感。
- 優點、風險和推薦程度。

### 階段三：按平台素材槽位生產

只有你確認方向後，才進入主圖、輪播、SKU 圖、詳情模塊、A+ 或 PDP section 等對應資產生產。

每一屏會包含：

- 銷售任務。
- 構圖說明。
- 文案方向。
- 生圖 Prompt。
- Negative Prompt。
- 產品處理模式和來源證據。
- 文案位置和文字安全區。
- 後期排版與響應式裁切要求。
- 鏡頭矩陣和跨屏連續性。
- 產品一致性質檢點。
- 通用 Prompt 攔截，不合格時必須先重寫。

## 快速安裝

### 方法一：匯入 `.skill` 文件

完整使用 V1.3 時，下載合集並匯入 `sku-product-core` 和需要的平台 Skill：

[`kero-sku-skills-v1.3-bundle.zip`](./packages/kero-sku-skills-v1.3-bundle.zip)

舊地址 [`SKU详情页导演Skill.skill`](./SKU详情页导演Skill/SKU详情页导演Skill.skill) 只是兼容路由，不包含全部平台生產規則。

### 方法二：複製 Skill 目錄

把下面這個目錄複製到 Codex 的 skills 目錄：

```text
SKU详情页导演Skill/sku-detail-page-director/
```

如果你的系統或工具對中文路徑不穩定，優先複製內部的 `sku-detail-page-director/` 目錄。

更詳細步驟見 [docs/INSTALL.md](./docs/INSTALL.md)。

## 第一次使用

只需記住一個入口。上傳真實產品圖後，傳送：

```text
請使用 $sku-detail-page-director 在同一任務中完成產品事實分析、平台識別和方向提案。
不要讓我重複呼叫其他 Skill；在我確認方向前不要輸出正式生圖 Prompt，
也不要編造圖片和資料中無法確認的規格、材質、認證、功效或評價。
```

## 產品處理模式

| 模式 | 適合場景 | 產品處理方式 |
| --- | --- | --- |
| A 嚴格保真 | 品牌款、高客單、外觀必須完全一致 | 使用真實產品去背，AI 只生成背景、場景、光影和留白 |
| B AI 輔助商品圖 | 平台與槽位允許、且有足夠真實參考圖的快速生產 | 基於指定真實產品圖做有限背景或場景變更；關鍵細節偏移時退回模式 A |
| C 概念生成 | 新品提案、方向測試、沒有實物圖 | 只用於概念探索，不能當作真實 SKU 成品圖 |

## 不可違反的規則

1. 真實產品圖是唯一產品身分來源。
2. 不編造品牌、規格、尺寸、材質、認證、功效、評價和售後承諾。
3. 材質無法確認時，只能描述「可見質感」「視覺上接近」或「真實材質待確認」。
4. 不改變真實 SKU 的顏色、結構、比例、Logo、包裝文字和關鍵細節。
5. 競品圖只參考構圖、節奏和資訊結構，不複製產品、Logo、文案和品牌資產。
6. AI 圖像模型不負責最終文字、Logo、參數表、認證標識和 CTA，這些建議後期排版並人工校對。

## 示例

- [墨鏡詳情頁示例](./examples/sunglasses-detail-page.md)
- [淘寶移動端詳情模塊示例](./examples/taobao-9-16-detail-page.md)
- [Amazon A+ 示例](./examples/amazon-a-plus-example.md)
- [安全參考競品示例](./examples/competitor-reference-safe-use.md)

## 項目結構

```text
SKU详情页导演Skill/
├── sku-detail-page-director/
│   ├── SKILL.md
│   ├── agents/openai.yaml
│   └── references/
└── SKU详情页导演Skill.skill

skills/            公共產品核心與八個平台專用 Skill
shared/            公共安全、狀態、調研與質檢規則
scripts/           同步、校驗、素材檢查與安裝包構建
tests/             Skill 觸發回歸語料
packages/          獨立 .skill 安裝包與全平台合集
docs/              安裝、排錯、安全邊界和 GitHub 設定說明
examples/          典型電商場景使用示例
assets/            倉庫封面和展示素材
website/           可選靜態網站
```

## 版本

目前開發版本：**V1.3.0-dev 多平台 Skill 拆分版**

穩定基線版本：**Lite V1.2.1**。V1.3 將公共產品保真核心與淘寶、天貓、拼多多、京東、1688、Amazon、Shopify、TikTok Shop 專用 Skill 分離。

版本變化見 [CHANGELOG.md](./CHANGELOG.md)。

後續規劃見 [ROADMAP.md](./ROADMAP.md)。

## 使用許可

本倉庫的 Skill、文檔、規則和示例文字可以用於學習、參考和非商業使用。

如果你引用或改編本倉庫內容，請註明來源並連結回本倉庫。

請不要直接搬運本倉庫內容進行商業轉賣。

倉庫中涉及的第三方平台名稱、商標、產品名和工具名，仍歸各自權利人所有。

更多說明見 [NOTICE.md](./NOTICE.md) 和 [LICENSE](./LICENSE)。

## 關於作者

**秋水 Kero**，AIGC 創作者，持續分享 AI、圖片和電商視覺工作流。

X（推特）：[@Isonlyonenice](https://x.com/Isonlyonenice)
