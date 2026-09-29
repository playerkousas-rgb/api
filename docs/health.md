# 🏥 醫療衞生

## 醫院管理局 HA

### 急症室等候時間 ✅

- **要 Key？** ❌ ｜ JSON ｜ 18 間公立醫院，每 15 分鐘更新
- ⚠️ **2025 年 10 月換咗新網址**（`aedwtdata2`），舊版 `aedwtdata` 已死，網上好多舊教學仲用緊死 link

```bash
curl "https://www.ha.org.hk/opendata/aed/aedwtdata2-tc.json"   # 繁中
curl "https://www.ha.org.hk/opendata/aed/aedwtdata2-en.json"   # 英文
```

回傳包括：第一/第二類（危殆/危急）處理狀態、第三類（緊急）等候中位數及 95 百分位、第四五類（次緊急/非緊急）等候時間。

### 專科門診 / 普通科門診

- 專科門診（SOPC）新症輪候時間
- 普通科門診診所名單及籌額安排

喺 [DATA.GOV.HK 醫管局分類](https://data.gov.hk/tc-datasets/provider/hk-ha) 有 JSON/CSV。

## 衞生署

- 診所名單、牙科街症、母嬰健康院等：[DATA.GOV.HK 衞生署數據集](https://data.gov.hk/tc-datasets/provider/hk-dh)
- 藥物辦公室註冊藥物資料庫（CSV 下載）

## 💡 工具點子

- 急症室分流助手：全港輪候時間 + 邊間最近（配 [geo.md](geo.md) 地點搜尋）
- 輪候時間歷史趨勢：配 [平台歷史檔案 API](platform.md) 攞返以前嘅 snapshot 做分析
