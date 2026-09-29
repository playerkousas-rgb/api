# 💎 冷門寶藏 — 外國出名香港少人知

> 專收「外國圈子好出名、香港冇乜人講」嘅 API 同資源。
> ✅ = 2026-09-29 實測 ｜ 🔑 = 免費 key ｜ ❌ = 唔使 key ｜ ⛔ = 誠實講：冇呢樣API

## 💪 健身 / 瑜伽 / 普拉提

### wger ❌ ✅ — 開源健身界標準

德國開源健身平台，**912 個動作**連說明/肌群/器材分類，仲可以 self-host：

```bash
curl "https://wger.de/api/v2/exerciseinfo/?limit=20&language=2"
# language=2 英文；有動作圖片、肌肉圖 endpoint
```

### Free Exercise DB ❌ ✅ — GitHub 神人之作

`yuhonas/free-exercise-db`：**800+ 動作 JSON + 每個動作有示範相**，一條 URL 攞晒成個數據庫（連 API 都唔使 call，直接 raw JSON）：

```bash
curl "https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/dist/exercises.json"
# 圖片: .../exercises/{id}/0.jpg 跟住個JSON入面條path
```

### Yoga API ❌ ✅

開源瑜伽 pose 數據庫（英文＋梵文名＋圖＋好處說明）：

```bash
curl "https://yoga-api-nzy4.onrender.com/v1/poses"        # 全部 pose
curl "https://yoga-api-nzy4.onrender.com/v1/poses?name=downward%20dog"
```

⚠️ Host 喺免費 Render，冷啟動要等幾十秒；重要嘢就 clone 佢個 repo（`alexcumplido/yoga-api`）自己 host。

### 普拉提 ⛔ 冇專門 API（誠實講）

替代組合：wger 有 core/柔軟度動作分類 + YouTube Data API 抽 playlist + free-exercise-db 嘅 stretching 類。

### 其他

| API | Key | 備註 |
|---|:---:|---|
| ExerciseDB（RapidAPI） | 🔑 免費 tier | 1300+ 動作連 GIF，比 wger 靚但綁 RapidAPI |
| API Ninjas caloriesburned | 🔑 免費 | 「行山60分鐘燒幾多卡」 |

## 🪢 繩結 ⛔ 冇 API（但有寶）

實查結論：**世上冇實用「繩結教學 API」**（搜出嚟全係數學繩結理論/機械人綁繩研究）。替代方案：

| 資源 | 用法 |
|---|---|
| **Animated Knots by Grog** | 繩結界聖經網站，**有埋童軍專區**（Scouting Knots 分類）——冇 API 但可以連結過去 |
| **Wikimedia Commons** | 大量 CC 授權繩結圖/動畫，經 MediaWiki API 攞：搜 `Category:Knot diagrams` |
| **Wikipedia List of knots** | 結構化清單，可以自己砌 JSON 數據庫 |
| **自建良機** | 童軍繩結數據庫（中文名+英文名+用途+步驟圖）係香港童軍界空白位——砌完仲可以開源返轉頭 |

## 🏕️ 野外生存 ⛔ 冇單一 API，但有組合拳

| 需求 | 方案 | Key |
|---|---|:---:|
| 🌿 **植物可唔可以食** | **Permapeople API** — permaculture 界數據庫，有 edibility/毒性欄位 | 🔑 免費 |
| ☠️ 香港有毒植物 | 漁護署「香港有毒植物」網頁資料（冇API，可引用） | — |
| 💧 水源/避難處 | Overpass：`natural=spring`、`amenity=shelter` → [world-scout.md](world-scout.md) | ❌ |
| 🍄 物種辨識 | iNaturalist / Pl@ntNet → [world-scout.md](world-scout.md) | — |
| 📖 **離線求生手冊** | GitHub 神作 `ligi/SurvivalManual`——成本開源離線求生手冊（改自美軍 FM 21-76），可以 fork 嚟做中文版 | ❌ |

## 🎭 香港今日活動 ✅ 有官方寶藏！

### 康文署文化節目 XML ❌ ✅ — 每日更新

**實測有效**，音樂會/展覽/戲劇/電影全部有齊（中英名、日期、場地、票價）：

```bash
curl "https://www.lcsd.gov.hk/datagovhk/event/events.xml"
# 同系仲有場地 venues.xml 等，喺 data.gov.hk 搜 "Cultural Programmes"
```

### 其他活動源

| 來源 | 格式 | 備註 |
|---|---|---|
| 旅發局 HKTB 大型活動 | CSV/API（data.gov.hk） | 年度大型活動（每年更新） |
| 康文署康體活動 | data.gov.hk 數據集 | SmartPLAY 報名嗰啲活動 |
| Timable / Eventbrite | Eventbrite 有 API 🔑 | Timable 冇公開 API；Eventbrite 香港活動唔算多 |
| **RSSHub**（見下面 GitHub 神人區） | RSS | 可以將冇 RSS 嘅活動網頁轉做 feed 自己 aggregate |

## 🖨️ 3D Printing

| API | Key | 備註 |
|---|:---:|---|
| **Thingiverse API** | 🔑 免費 app token | 全球最大模型庫：搜尋/下載 STL/收藏——「幫旅團印徽章/工具」搵模型 |
| **MyMiniFactory API** | 🔑 免費 | 質素高（全部人手驗證過印得出） |
| **OctoPrint REST API** | self-host | 3D 打印界神器：遙控打印機/睇進度/webcam 監控，香港 3D 打印愛好者都未必知佢有完整 API |
| Printables | ⛔ 冇公開 API | Prusa 家，得網站 |

## 📄 文書處理

| 工具/API | 類型 | 備註 |
|---|---|---|
| **Stirling-PDF** | self-host（GitHub 60k+ ⭐） | 60+ PDF 功能（合併/分割/OCR/簽名/壓縮）自己 host 有埋 REST API——**取代晒啲收費 PDF 網站** |
| **Gotenberg** | self-host | HTML/Markdown/Office → PDF 嘅 API，Docker 一句起 |
| **CloudConvert** | 🔑 免費 25 次/日 | 200+ 格式互轉（懶得 self-host 嘅選擇） |
| **docxtemplater / Carbone** | JS 庫 | Word 模板塞數據出證書/獎狀——**旅團出嘉許狀神器** |
| **Pandoc** | CLI | 文件格式轉換萬能俠（唔係 API 但必須知） |

## 🌟 GitHub 神人 repo（唔係 API，係彈藥庫本身）

| Repo | ⭐ 級數 | 係乜 |
|---|---|---|
| **public-apis/public-apis** | 300k+ | **全球最大免費 API 目錄**——我哋呢個 repo 嘅世界版，掘新 API first stop |
| **free-for.dev** | 100k+ | 所有「開發者免費層」服務總目錄（hosting/DB/監控/email…） |
| **awesome-selfhosted** | 200k+ | 可以自己 host 嘅開源服務總目錄 |
| **RSSHub**（DIYgod） | 30k+ | **萬物轉 RSS**：冇 RSS 嘅網站都變到 feed——追活動/新聞/更新一流 |
| **changedetection.io** | 20k+ | 監察任何網頁變化＋通知——**盯 SmartPLAY 剩餘營位頁呢類冇 API 嘅嘢就係靠佢** |
| **Uptime Kuma** | 60k+ | 自家服務監控（個 bot 死咗識通知你） |
| **Stirling-PDF** | 60k+ | 上面文書區介紹咗 |
| **OctoPrint** | 8k+ | 上面 3D 打印區介紹咗 |
| **ligi/SurvivalManual** | 20k+ | 離線求生手冊 app |
| **yuhonas/free-exercise-db** | 3k+ | 上面健身區介紹咗 |
| **hkbus/hk-independent-bus-eta** | 香港之光 | 開源香港巴士 app（hkbus.app）——想學點用香港交通 API 睇佢 source 最快 |

> 💡 用法貼士：GitHub repo 三寶——①直接用佢 hosted 版 ②self-host ③抄佢思路＋數據結構自己砌。
