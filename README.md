# 🇭🇰 香港免費 API 天書 (HK Free APIs)

> 收集晒香港政府同埋喺香港用到嘅免費 API，全部分類整理、附實測狀態同 curl 例子。
> 整 side project、bot、dashboard 之前嚟呢度搵就得。

**最後更新：2026-09-29** ｜ 標示 ✅ = 當日實測成功

## 💡 三個重點

1. **香港政府開放數據絕大部分唔使 API Key** — 直接 HTTP GET 就有 JSON，商用都免費（要註明出處）
2. 極少數例外要**免費註冊**：地政總署「香港地圖服務」(api.hkmapservice.gov.hk)
3. 總入口：[資料一線通 DATA.GOV.HK](https://data.gov.hk)

## 📁 分類目錄

| 分類 | 內容 | 檔案 |
|---|---|---|
| 🌤️ 天氣環境 | 天文台全套、AQHI 空氣質素、地震 | [docs/weather.md](docs/weather.md) |
| 🚌 交通運輸 | 九巴/城巴/港鐵/小巴 ETA、泊車、CCTV、機場航班 | [docs/transport.md](docs/transport.md) |
| 🏥 醫療衞生 | 急症室輪候、專科門診 | [docs/health.md](docs/health.md) |
| 💰 金融經濟 | 金管局 HKMA、Open Banking | [docs/finance.md](docs/finance.md) |
| 🗺️ 地圖地理 | 地址查詢 ALS、地點搜尋、CSDI、地圖底圖 | [docs/geo.md](docs/geo.md) |
| 🏛️ 民生社會 | 公眾假期、康文署、學校、立法會、統計處、油價 | [docs/civic.md](docs/civic.md) |
| 🔧 平台工具 | DATA.GOV.HK 本身嘅 API（歷史檔案/篩選/目錄） | [docs/platform.md](docs/platform.md) |
| 🌐 非政府免費 API | 喺香港常用嘅第三方免費 API | [docs/non-gov.md](docs/non-gov.md) |
| 🌍 世界 API（童軍向） | eBird、iNaturalist、NASA、Overpass、海拔、觀星 | [docs/world-scout.md](docs/world-scout.md) |
| 🛒 日常方便 | 超市格價、食譜、卡路里營養 | [docs/daily.md](docs/daily.md) |
| ⛰️ 戶外實用 | 郊野收訊、實況相機、浪高潮汐、蚊患指數 | [docs/outdoor.md](docs/outdoor.md) |
| 📸 圖庫媒體 | CC 圖片、佔位圖、雀聲音效 | [docs/media.md](docs/media.md) |
| 🎓 教育題庫趣味 | Trivia、啤牌、圖書、全球假期時區、翻譯 | [docs/edu-fun.md](docs/edu-fun.md) |
| 🤖 AI 免費 tier | Gemini/Groq/HF、影相認植物雀鳥 | [docs/ai.md](docs/ai.md) |
| 🧰 後端膠水 | Sheets 當數據庫、Telegram bot、免費 cron、零成本架構 | [docs/glue.md](docs/glue.md) |
| 🚫 封港紀錄冊 | 公司封香港嘅服務＋替代路徑（OpenAI/Claude/AI Studio/Meta） | [docs/hk-blocked.md](docs/hk-blocked.md) |
| 💎 冷門寶藏 | 健身/瑜伽/繩結/求生/香港活動/3D打印/文書/GitHub神人 | [docs/niche.md](docs/niche.md) |
| 🧑‍🎨 人物素材庫 | Avatar/臉型髮式pose組件、換衫換章路線圖 | [docs/avatar.md](docs/avatar.md) |
| 🎖️ 圖標徽章 | Iconify總開關、Game-icons章設計、emoji SVG、開源中文字體 | [docs/icons.md](docs/icons.md) |
| 🏆 遊戲化 | Open Badges電子章標準、排行榜/成就後端、Moodle/Habitica | [docs/gamification.md](docs/gamification.md) |
| 📜 證書生成 | PDF引擎、批量pipeline、QR驗證體系（demo有實戰示範） | [docs/certs.md](docs/certs.md) |
| ⚜️ 世界童軍 | WOSM冇API實錄+四條替代路（RSS/Wikidata/監察） | [docs/wosm.md](docs/wosm.md) |
| 🕶️ 3D/AR/實境遊戲 | GeoGuessr類/城市定向/實境射擊配方、3D香港、AR.js | [docs/xr-games.md](docs/xr-games.md) |
| 🚻 公共設施位置 | 808公廁/泳池關池實況/4189部AED、消防栓冇API實錄、CSDI萬用入口 | [docs/facilities.md](docs/facilities.md) |
| 🥾 公共設施位置 II | 標距柱1078/封閉山徑/營地連水源、回收點8858、飲水機四庫 | [docs/facilities2.md](docs/facilities2.md) |
| 💡 燈柱編號與管網 | 燈柱144873支連編號(市區報位網格)、爆水管實時、雨水渠10萬段 | [docs/lamppost-pipes.md](docs/lamppost-pipes.md) |

## ⚡ 30 秒試用

```bash
# 而家幾多度？（天文台）
curl "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=rhrread&lang=tc"

# 調景嶺站下一班車（港鐵）
curl "https://rt.data.gov.hk/v1/transport/mtr/getSchedule.php?line=TKL&sta=TIK"

# 全港急症室輪候時間（醫管局）
curl "https://www.ha.org.hk/opendata/aed/aedwtdata2-tc.json"

# 今日機場航班（機管局）
curl "https://www.hongkongairport.com/flightinfo-rest/rest/flights/past?date=2026-09-29&lang=zh_HK&cargo=false&arrival=true"
```

更多例子睇 [examples/](examples/)。

## 🗃️ 機讀總索引

成個彈藥庫一張表：[`data/apis.csv`](data/apis.csv)（名稱/分類/URL/要唔要key/香港狀態/實測日期）——可以直接開入 Excel/Sheets 篩選，或者寫 script 讀。

## 🚦 快速總覽（邊啲要 Key？）

| API | 提供者 | 要 Key？ | 實測 |
|---|---|:---:|:---:|
| 天氣全套 | 天文台 | ❌ | ✅ |
| 巴士/港鐵/小巴 ETA | 運輸署/各營辦商 | ❌ | ✅ |
| 停車場空置車位 | 運輸署 | ❌ | ✅ |
| 交通快拍 CCTV / 特別交通消息 | 運輸署 | ❌ | ✅ |
| 機場航班資訊 | 機管局 | ❌ | ✅ |
| 急症室輪候時間 | 醫管局 | ❌ | ✅ |
| 空氣質素 AQHI | 環保署 | ❌ | ✅ |
| 金管局數據（HIBOR/匯率等） | HKMA | ❌ | ⚠️ 封海外 IP |
| 地址查詢 ALS | 政府資科辦 | ❌ | ✅ |
| 地點搜尋 / CSDI 圖層 | 地政總署 | ❌ | ⚠️ 本地用 |
| 公眾假期 | 1823 | ❌ | ✅ |
| 香港地圖服務（官方地圖 tiles） | 地政總署 | 🔑 免費註冊 | — |
| SmartPLAY 康體設施 | 康文署 | ⛔ 無官方 API | — |

## 🌐 地區限制三種坑（開工前必讀）

| 類型 | 例子 | 應對 |
|---|---|---|
| 🚫 **外國服務封香港** | OpenAI / Claude / Google AI Studio（Gemini 網頁版 2026年3月開放咗，**但 API 仍然封**） | 用雲企業版（Azure/Bedrock/Vertex）、OpenRouter、或國產模型 → 詳見 [docs/ai.md](docs/ai.md) |
| 🔒 **香港服務封海外** | HKMA API、geodata.gov.hk 封部分海外數據中心 IP | 喺香港本地行 / server 揀香港區域 |
| ✅ **兩邊都通** | 絕大部分 data.gov.hk、天文台、OSM 系 | 放心用 |

**教訓：唔好淨係睇「免費」，要睇埋「香港用唔用到」。** 本 repo 有地區問題嘅 API 都會標明。

## ⚠️ 使用注意

- **斯文啲 call**：ETA 類每 10–30 秒一次已經夠；政府有 anti-bot WAF
- 所有政府數據受 [DATA.GOV.HK 使用條款](https://data.gov.hk/tc/terms-and-conditions) 約束，商用 OK 但要註明出處
- API 網址間唔中會改（例：急症室 API 2025 年 10 月由 `aedwtdata` 轉咗做 `aedwtdata2`），發現死 link 請開 issue

## 🤝 貢獻

發現新 API / 死 link？歡迎開 PR，格式跟返 docs/ 入面嘅 table 就得。
