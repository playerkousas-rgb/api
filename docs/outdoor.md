# ⛰️ 戶外實用

> 行山露營水上活動嘅實戰數據：收訊、實況相機、浪高、蚊患。
> ✅ = 2026-09-29 實測 ｜ 🔑 = 要免費 key ｌ ❌ = 唔使 key ｜ ⚠️ = 有數據但唔係 API

## 📶 電訊收訊範圍（郊野公園）⚠️ 冇 API，但有官方數據

實情：**通訊辦（OFCA）冇開放 API**，佢哋做過詳細調查，出咗 **171 幅遠足徑/郊遊徑流動網絡覆蓋電子地圖**放喺網站：

- 通訊辦專頁：[郊野公園流動電話服務](https://www.ofca.gov.hk/tc/consumer_focus/guide/safety/country_parks/mobile_network/index.html)
- 四大電訊商各自嘅郊野公園覆蓋頁：HKT / 3HK / CMHK / SmarTone（通訊辦頁有晒 link）

**整 app 可用嘅事實**（來自官方）：
- 漁護署轄下遠足徑 **超過 95% 路段**有至少一個本地網絡覆蓋
- 🆘 **黃金知識：冇自己台嘅 signal 時，打 112 會用任何有覆蓋嘅網絡接駁 999** —— 呢樣嘢好值得寫入任何行山 app
- 想做覆蓋圖層：可以引用/連結佢哋啲電子地圖，或者眾包實測（app 收集用戶信號強度）

## 📷 實況相機（睇真實天氣/環境）

### 天文台分區天氣照片 ❌ ✅ 香港版「全球 camera」

全港幾十個攝影點（山頂/機場/大帽山/横瀾島…），幾分鐘更新一次：

```bash
# 圖片 URL 格式（VPA=中環, VPB=尖沙咀... 站點代碼見天文台網頁）
https://www.hko.gov.hk/wxinfo/aws/hko_mica/vpa/latest_VPA.jpg   # ✅ 實測 200
```

- 站點清單：[天文台天氣照片頁](https://www.hko.gov.hk/tc/wxinfo/ts/index_webcam.htm)（data.gov.hk 亦有「天氣照片」數據集連所有站點代碼）
- 用途：出發前睇吓大帽山有冇霧、西貢海面點

### 運輸署交通快拍 ❌ ✅

全港路面 CCTV 相片，見 [transport.md](transport.md)

### 全球 webcam

| API | Key | 備註 |
|---|:---:|---|
| **Windy Webcams API** | 🔑 免費 tier | 全球幾萬個 webcam 聚合（山/海灘/城市），正規「全球 camera」做法 |
| **YouTube Data API v3** | 🔑 免費 quota 10,000 units/日 | search `eventType=live` 搵全球直播 cam；quota 夠個人工具用 |

```bash
# YouTube 搵香港 live cam（要 key）
curl "https://www.googleapis.com/youtube/v3/search?part=snippet&eventType=live&type=video&q=hong+kong+live+cam&key={KEY}"
```

## 🌊 水上活動（獨木舟/風帆/游繩）

### Open-Meteo Marine API ❌ ✅

```bash
# 西貢對開浪高（仲有 swell 方向/週期、海溫）
curl "https://marine-api.open-meteo.com/v1/marine?latitude=22.2&longitude=114.3&hourly=wave_height,sea_surface_temperature&forecast_days=2"
```

### 潮汐

天文台 HHOT/HLT（尖鼻咀/大廟灣等分站潮汐）→ [weather.md](weather.md)。石灘活動/潮間帶觀察必查。

## 🦟 蚊患指數（露營選址參考）

食環署**分區白紋伊蚊誘蚊器指數**，每月分批公佈：

- 開放數據：[data.gov.hk 搜「誘蚊器」](https://data.gov.hk/tc-datasets?q=%E8%AA%98%E8%9A%8A%E5%99%A8)（CSV/JSON）
- 指數 >20% = 蚊患需關注級別

## 🌡️ 分區 1 分鐘實時數據 ❌ ✅

天文台自動氣象站 CSV，**每分鐘**更新（正式 API 係 10 分鐘級，呢個更快）：

```bash
curl "https://data.weather.gov.hk/weatherAPI/hko_data/regional-weather/latest_1min_temperature.csv"
# 同系仲有 latest_1min_humidity / wind / pressure
```

## 🔗 戶外相關已收錄（跳去睇）

- 海拔 profile、OSM 營地/水源、行山路線 → [world-scout.md](world-scout.md)
- 天氣警告、UV、閃電 → [weather.md](weather.md)
- 空氣質素 AQHI → [weather.md](weather.md)
- 急症室輪候（意外應變） → [health.md](health.md)
- 郊野公園設施 GeoJSON → [geo.md](geo.md)

## 💡 戶外工具點子

| 工具 | 配搭 |
|---|---|
| 📶 **行山通訊規劃**：路線沿途邊度有 signal＋112 教學 | OFCA 地圖連結 + 眾包實測 |
| 👀 **出發前實況一覽**：目的地 webcam＋天氣＋AQHI 一頁睇 | 天文台照片 + rhrread + AQHI |
| 🛶 **水上活動 go/no-go**：浪高+風速+潮汐+天氣警告自動判斷 | Marine API + 天文台 |
| ⛺ **營地選址助手**：營地位置+蚊患指數+水源+天氣 | Overpass + 食環署 + 天文台 |
