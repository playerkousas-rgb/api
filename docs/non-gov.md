# 🌐 非政府免費 API（香港用到）

香港 side project 常用嘅第三方免費 API。標 🔑 = 要免費註冊攞 key。

## 📡 通訊 / Bot

| API | Key | 備註 |
|---|:---:|---|
| **Telegram Bot API** | 🔑 免費 | 香港整通知 bot 首選，搵 @BotFather 攞 token 即用，完全免費 |
| **Discord Webhook/Bot** | 🔑 免費 | 推送通知另一選擇 |
| **ntfy.sh** | ❌ | 開源 push notification，curl 一句就推到手機 |

## 🌦️ 天氣（政府以外嘅選擇）

| API | Key | 備註 |
|---|:---:|---|
| **Open-Meteo** | ❌ | 完全免費、唔使 key，支援香港座標，有小時級預報＋歷史數據，非商用免費 |
| OpenWeatherMap | 🔑 免費 tier | 每分鐘 60 call |

```bash
curl "https://api.open-meteo.com/v1/forecast?latitude=22.3&longitude=114.17&hourly=temperature_2m,precipitation"
```

## 🗺️ 地圖（唔想註冊政府地圖服務嘅話）

| API | Key | 備註 |
|---|:---:|---|
| **OpenStreetMap tiles** | ❌ | 香港覆蓋唔錯，配 Leaflet 即用（留意 tile 使用政策） |
| **Nominatim** | ❌ | OSM geocoding（每秒 1 call 限制），中英地址都搵到 |
| **Overpass API** | ❌ | Query OSM 數據（例：全港茶餐廳 POI） |
| Mapbox / Google Maps | 🔑 免費 tier | Mapbox 每月 50k loads free；Google $200/月 credit |

## 💹 金融市場

| API | Key | 備註 |
|---|:---:|---|
| **Frankfurter** | ❌ | 歐央行匯率（有 HKD），完全免費：`api.frankfurter.dev` |
| **CoinGecko** | ❌ demo tier | Crypto 價格，免費 tier 每分鐘 ~30 call |
| **Yahoo Finance**（非官方） | ❌ | 港股報價 `0005.HK` 呢啲，非官方 endpoint，隨時變 |
| Alpha Vantage | 🔑 免費 | 每日 25 call，美股為主 |
| 富途 OpenAPI | 🔑 要開戶 | 港股實時行情，要富途帳戶＋裝 OpenD |

```bash
# 港紙匯率
curl "https://api.frankfurter.dev/v1/latest?base=HKD&symbols=USD,JPY,CNY"
```

## 📰 新聞 / 內容

| API | Key | 備註 |
|---|:---:|---|
| **RTHK RSS** | ❌ | 即時新聞（本地/大中華/國際/財經/體育） |
| **Wikipedia / Wikidata API** | ❌ | 中英維基內容、結構化數據 |
| HK01 / on.cc RSS | ❌ | 部分媒體有公開 RSS |

## 🤖 AI / 工具類

| API | Key | 備註 |
|---|:---:|---|
| Hugging Face Inference | 🔑 免費 tier | 開源模型推理 |
| ip-api.com | ❌ | IP 地理位置（非商用免費） |
| QR Server | ❌ | 生成 QR code：`api.qrserver.com` |

## ✈️ 出行

| API | Key | 備註 |
|---|:---:|---|
| **機管局航班 API** | ❌ | 半官方，詳見 [transport.md](transport.md) ✅ |
| AviationStack | 🔑 免費 tier | 全球航班，每月 100 call |
| **澳門政府開放數據** | ❌ | 過大海？澳門都有 data.gov.mo，巴士/天氣 API 類似香港 |

## ⚠️ 揀 API 心法

1. 政府有嘅先用政府（穩定、免費、冇 quota）
2. 非官方 endpoint（Yahoo Finance 呢啲）唔好做 production 核心依賴
3. 免費 tier 留意 rate limit，加 cache 慳 quota
