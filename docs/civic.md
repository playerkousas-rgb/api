# 🏛️ 民生社會

## 公眾假期（1823）✅

```bash
curl "https://www.1823.gov.hk/common/ical/tc.json"   # JSON（vCalendar 結構）
# 亦有 .ics 版本可以直接入 calendar
```

涵蓋今明兩年所有公眾假期，整「請假攻略」必備。

## 康文署 LCSD

- **設施數據**（體育館/泳池/圖書館/公園位置及開放時間）：[DATA.GOV.HK 康文署數據集](https://data.gov.hk/tc-datasets/provider/hk-lcsd)（JSON/CSV/XML）
- ⛔ **SmartPLAY 訂場/度假營空位：冇官方開放 API**
  - 度假營：3 個月前抽籤；**每月 20 號 08:30** 放剩餘營位（先到先得）；10 日內剩位要直接打電話問營地
  - 坊間執場工具（SeekCourt 等）係 crawl SmartPLAY 內部 REST endpoint，非官方、有 anti-bot 風險

## 教育

```bash
# 最近學校（連學校資料）
curl "https://api.data.gov.hk/v1/nearest-schools?lat=22.2812&long=114.1659&max=5"
```

教育局學校名冊 / 位置：[DATA.GOV.HK 教育分類](https://data.gov.hk/tc-datasets/category/education)

## 立法會 LegCo Open Data（OData）

- 議案表決紀錄、會議出席、議員資料、質詢
- Base：`https://app.legco.gov.hk/...`（OData protocol，可以直接 query）
- 文件：[立法會開放數據](https://www.legco.gov.hk/odata/chinese/index.html)

## 政府統計處 C&SD

- 人口、CPI、GDP、對外貿易等統計 API：[www.censtatd.gov.hk/api/](https://www.censtatd.gov.hk/tc/web_table.html)
- 支援 JSON，可以砌自動更新嘅經濟 dashboard

## 油價（消委會「油價通」）

- 各油站牌價 + 折扣後價格，有開放數據
- ⚠️ 舊 JSON 直連網址已改版，以 [DATA.GOV.HK 搜 "oil price"](https://data.gov.hk/tc-datasets?q=oil%20price) 數據集頁為準

## 選舉 / 政府組織

- 選舉事務處：選區分界、投票站（GeoJSON 喺 CSDI 都有）
- 政府電話簿 API、政府新聞處新聞稿 RSS：[news.gov.hk](https://www.news.gov.hk)

## 公營廣播

- **RTHK 新聞 RSS**：`https://rthk9.rthk.hk/rthk/news/rss/`（即時本地/國際/財經/體育）
