<h1 align="center">KeRo SKU Skill</h1>

<p align="center"><strong>先保護真實 SKU，再做不套模板的電商詳情頁</strong></p>

<p align="center">真實產品保真 · 三階段決策 · 防同質化生產 · 逐屏商業圖</p>

<p align="center">
  <a href="./README.md">簡體中文</a> ·
  <a href="./README_EN.md">English</a> ·
  繁體中文
</p>

<p align="center">
  <a href="./dist/sku-detail-page-director.skill">下載 Skill</a> ·
  <a href="./docs/INSTALL.md">安裝說明</a> ·
  <a href="./examples/sunglasses-detail-page.md">查看示例</a> ·
  <a href="./skills/sku-detail-page-director/SKILL.md">查看 Skill</a>
</p>

---

## 這是什麼

KeRo SKU Skill 是一個用於 **真實 SKU 商品詳情頁策劃與 AI 生圖 Prompt 生產** 的 Codex Skill。

它的核心不是讓 AI 直接想像商品圖，而是先保護真實產品，再把電商詳情頁拆成可控流程：

```text
上傳真實產品圖
   ↓
階段一：產品深度分析
   ↓
階段二：A / B / C 三個詳情頁方向
   ↓
使用者確認方向
   ↓
階段三：逐屏方案、Prompt、Negative Prompt、質檢點
```

適用於淘寶、天貓、京東、拼多多、抖音商城、小紅書、Amazon、Shopify、TikTok Shop 等電商場景。

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
| 想做淘寶 / 抖音詳情頁 | [淘寶 9:16 示例](./examples/taobao-9-16-detail-page.md) |
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

### 階段二：方向提案

給出 A / B / C 三個明顯不同的詳情頁方向。

每個方向會說明：

- 適合的平台和人群。
- 首屏應該怎麼吸引注意。
- 頁面節奏和銷售邏輯。
- 未來每一屏大概長什麼樣。
- 如何避開常見模板感。
- 優點、風險和推薦程度。

### 階段三：逐屏生產

只有你確認方向後，才進入正式逐屏生產。

每一屏會包含：

- 銷售任務。
- 構圖說明。
- 文案方向。
- 生圖 Prompt。
- Negative Prompt。
- 產品保真要求。
- 文字安全區。
- 一致性質檢點。

## 快速安裝

### 方法一：匯入 `.skill` 文件

下載這個文件並匯入 Codex：

[`sku-detail-page-director.skill`](./dist/sku-detail-page-director.skill)

### 方法二：複製 Skill 目錄

把下面這個目錄複製到 Codex 的 skills 目錄：

```text
skills/sku-detail-page-director/
```

原始碼使用英文路徑，避免不同工具對中文路徑的相容性問題。

更詳細步驟見 [docs/INSTALL.md](./docs/INSTALL.md)。

## 第一次使用

上傳真實產品圖後，傳送：

```text
請使用 $sku-detail-page-director 分析我上傳的產品圖。

先執行階段一：產品深度分析。
在我確認方向前，不要輸出正式生圖 Prompt。
不能編造圖片和資料中無法確認的規格、材質、認證、功效或評價。
```

## 產品處理模式

| 模式 | 適合場景 | 產品處理方式 |
| --- | --- | --- |
| A 嚴格保真 | 品牌款、高客單、外觀必須完全一致 | 使用真實產品去背，AI 只生成背景、場景、光影和留白 |
| B AI 輔助商品圖 | 普通 SKU、快速上新、小白使用者 | 基於真實產品圖做背景替換、輕度重繪或場景化生成，並做一致性質檢 |
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
- [淘寶 / 抖音 9:16 詳情頁示例](./examples/taobao-9-16-detail-page.md)
- [Amazon A+ 示例](./examples/amazon-a-plus-example.md)
- [安全參考競品示例](./examples/competitor-reference-safe-use.md)

## 項目結構

```text
skills/sku-detail-page-director/     Skill 原始碼與按需讀取的規則
dist/sku-detail-page-director.skill  可直接匯入的發布包
scripts/package-skill.ps1            發布包建置腳本
docs/                                安裝與排錯
examples/                            典型電商場景示例
```

## 版本

目前版本：**v2.0.0 分層工作流版**

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
