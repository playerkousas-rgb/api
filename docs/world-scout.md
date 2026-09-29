# 🌍 世界免費 API — 童軍工具向

> 以「香港童軍 app / 工具」為目標篩選：自然觀察、觀星、行山露營、戶外安全、國際交流。
> ✅ = 2026-09-29 實測成功 ｜ 🔑 = 要免費註冊 key ｜ ❌ = 唔使 key

## 🦅 自然生態（自然研習章 / 生態遊）

### eBird（康奈爾大學鳥類學實驗室）🔑 免費 key ✅*

全球最大雀鳥觀察數據庫，**香港數據好豐富**（米埔/尖鼻咀好多紀錄）：

```bash
# 香港最近觀察紀錄（region code 就係 HK）
curl -H "X-eBirdApiToken: {你嘅KEY}" "https://api.ebird.org/v2/data/obs/HK/recent"
# 香港熱點清單 / 罕見雀報告
curl -H "X-eBirdApiToken: {KEY}" "https://api.ebird.org/v2/ref/hotspot/HK"
curl -H "X-eBirdApiToken: {KEY}" "https://api.ebird.org/v2/data/obs/HK/recent/notable"
```

- 申請：[ebird.org/api/keygen](https://ebird.org/api/keygen)（即批，免費）
- *實測：冇 key 回 403（行為正確），有 key 即用
- 姊妹庫 Macaulay Library 有雀聲/相片 media

### iNaturalist ❌ 唔使 key ✅

乜嘢物種都有（植物/昆蟲/爬蟲/雀），香港有 **70 萬+ 個觀察紀錄**：

```bash
# 香港 10km 內最近觀察
curl "https://api.inaturalist.org/v1/observations?lat=22.3&lng=114.17&radius=10&per_page=20"
# 影相識別（computer vision）要 OAuth，但讀數據完全開放
```

### GBIF 全球生物多樣性 ❌ ✅

科研級數據，香港有 **236 萬+ 筆紀錄**：

```bash
curl "https://api.gbif.org/v1/occurrence/search?country=HK&limit=20"
curl "https://api.gbif.org/v1/species/search?q=Pavo"   # 物種分類查詢
```

### Pl@ntNet 影相認植物 🔑 免費

上載相片 → 回植物名（每日 500 次免費）：[my.plantnet.org](https://my.plantnet.org)

## 🌌 天文觀星（觀星營 / 天文章）

| API | Key | 實測 | 用途 |
|---|:---:|:---:|---|
| **NASA APIs**（APOD 每日天文圖、火星相、近地小行星） | 🔑 免費（`DEMO_KEY` 可試用） | ✅ | api.nasa.gov |
| **ISS 太空站實時位置** wheretheiss.at | ❌ | ✅ | 「太空站幾時飛過香港」 |
| **Sunrise-Sunset.org** | ❌ | ✅ | 日出日落/民用暮光（夜行活動計時間） |
| 天文台農曆/日月出沒 | ❌ | ✅ | 見 [weather.md](weather.md)，月相用呢個更準 |
| Launch Library 2（火箭發射時間表） | ❌ | 未測 | ll.thespacedevs.com |

```bash
# ISS 而家喺邊
curl "https://api.wheretheiss.at/v1/satellites/25544"
# 香港今日日出日落（UTC 回傳，記得 +8）
curl "https://api.sunrise-sunset.org/json?lat=22.3&lng=114.17&formatted=0"
```

## 🏕️ 行山露營地圖（遠足章 / 露營章）

### Overpass API（OpenStreetMap 數據查詢）❌ ✅

寶藏！可以 query 全港任何 POI —— 實測香港有 **47 個營地節點**：

```bash
# 搵晒香港所有營地（記得帶 User-Agent）
curl -A "your-app/1.0" "https://overpass-api.de/api/interpreter" \
  --data-urlencode 'data=[out:json][timeout:25];
    node["tourism"="camp_site"](22.15,113.85,22.55,114.45);
    out body;'
# 其他好用 tag：drinking_water（水源！）、shelter、toilets、viewpoint
```

### OpenTopoData 海拔 ❌ ✅

```bash
# 大帽山附近海拔（實測回 815m）
curl "https://api.opentopodata.org/v1/aster30m?locations=22.4139,114.1225"
# 支援一次 query 成條路線嘅海拔 profile（|分隔多點）
```

### 其他

| API | Key | 用途 |
|---|:---:|---|
| **OpenRouteService** | 🔑 免費 | 行山路線規劃、等時圈（幾遠走得到）、海拔 profile |
| **Nominatim**（OSM geocoding） | ❌ | 地名→座標（每秒限 1 次） |
| Waymarked Trails | ❌ | 遠足徑圖層（麥理浩徑等都有） |
| 政府 CSDI / 漁護署 | ❌ | 官方郊野公園設施，見 [geo.md](geo.md) |

## 🌦️ 戶外安全天氣（配合香港天文台用）

| API | Key | 實測 | 亮點 |
|---|:---:|:---:|---|
| **Open-Meteo** | ❌ | ✅ | 指定座標+海拔嘅天氣（山頂 vs 山腳唔同！）、UV、逐小時 16 日預報 |
| **met.no**（挪威氣象局） | ❌（要 User-Agent header） | ✅ | 戶外界口碑最好嘅免費預報之一 |
| **USGS 全球地震** | ❌ | ✅ | GeoJSON feed，實時 |
| OpenUV | 🔑 免費 tier | — | UV 指數專門 API |
| OpenAQ 全球空氣質素 | 🔑 免費 key | ✅（401 確認要 key） | 外地交流營用 |

```bash
# 大帽山高度嘅逐小時溫度+UV（Open-Meteo 自動用地形海拔）
curl "https://api.open-meteo.com/v1/forecast?latitude=22.41&longitude=114.12&hourly=temperature_2m,uv_index&forecast_days=2"
# met.no（一定要自報 User-Agent，唔係會 block）
curl -A "your-app/1.0 contact@example.com" \
  "https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=22.41&lon=114.12"
```

## 🌏 國際交流（世界童軍 Jamboree / JOTA-JOTI）

| API | Key | 實測 | 用途 |
|---|:---:|:---:|---|
| **Wikipedia REST API** | ❌ | ✅ | 任何條目摘要（連「香港童軍總會」都有！） |
| **Wikidata SPARQL** | ❌ | — | 結構化知識查詢 |
| **Frankfurter 匯率** | ❌ | ✅ | 交流營使費換算，見 [non-gov.md](non-gov.md) |
| WorldTimeAPI | ❌ | 未測 | 世界時區（JOTA-JOTI 約時間） |
| RestCountries | ❌ | ⚠️ | 國家資料（國旗/首都），**2026 年舊版 v3.1 已 deprecated**，用前查最新文檔 |
| MyMemory 翻譯 | ❌ 免費 tier | 未測 | 簡單翻譯（每日限額） |

```bash
# 維基百科條目摘要
curl "https://zh.wikipedia.org/api/rest_v1/page/summary/香港童軍總會"
```

## 🛠️ App 開發實用（整工具嘅膠水）

| API/服務 | Key | 用途 |
|---|:---:|---|
| **Telegram Bot API** | 🔑 免費 | 旅團通知 bot、報名 bot、活動提醒 |
| **ntfy.sh** | ❌ | 一句 curl 推送通知去手機 |
| **QR Server** | ❌ | 生成 QR code（簽到、尋寶遊戲） |
| Dictionary API (dictionaryapi.dev) | ❌ | 英文字典（國際交流學英文） |
| Open Food Facts | ❌ | 掃 barcode 出食物資料（營火煮食買餸） |
| Supabase / Firebase | 🔑 免費 tier | 後端數據庫＋登入（報名系統） |

## 💡 童軍工具點子 × API 配搭

| 工具 | 用咩 API |
|---|---|
| 🦉 **自然觀察章 app**：附近有咩雀/物種、影相打卡 | eBird + iNaturalist + GBIF |
| 🌌 **觀星營小助手**：日落時間、月相、ISS 幾時飛過、每日天文圖 | sunrise-sunset + 天文台 + wheretheiss + NASA |
| 🥾 **行山安全 dashboard**：路線海拔 profile、山上天氣、水源位置、警告 | OpenTopoData + Open-Meteo + Overpass + 天文台 |
| ⛺ **營地大全地圖**：OSM 營地 + 政府郊野公園數據疊埋一齊 | Overpass + CSDI/漁護署 |
| 🌏 **JOTA-JOTI 國際交流 quiz**：國家/時區/匯率/維基 | Wikipedia + Frankfurter + WorldTime |
| 📋 **旅團管理 bot**：活動通知、天氣提醒、集合簽到 QR | Telegram + 天文台 + QR Server |

## ⚠️ 公德提示

- OSM 系（Overpass/Nominatim）係義工社群資源：帶 User-Agent、咪狂 call、大量用就自己 host
- met.no 條款要求有效 User-Agent（寫埋聯絡方式最好）
- eBird/iNaturalist 數據用喺教育用途冇問題，公開發佈要跟返各自授權條款
