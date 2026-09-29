# 🌤️ 天氣環境

## 香港天文台 HKO — 天氣 API

- **要 Key？** ❌ 唔使
- **格式：** JSON ｜ **語言：** `lang=tc / sc / en`
- **文件：** [HKO Open Data API Documentation (PDF)](https://www.hko.gov.hk/tc/weatherAPI/doc/files/HKO_Open_Data_API_Documentation_tc.pdf)

### weather.php — 天氣資訊 ✅

Base：`https://data.weather.gov.hk/weatherAPI/opendata/weather.php`

| dataType | 內容 |
|---|---|
| `rhrread` | 現時天氣報告（分區氣溫、濕度、雨量、UV） |
| `fnd` | 九天天氣預報 |
| `flw` | 本港地區天氣預報（文字） |
| `warnsum` | 天氣警告一覽（風球/暴雨/雷暴等）— 整警報 bot 用呢個 |
| `warningInfo` | 詳細警告資訊 |
| `swt` | 特別天氣提示 |

```bash
curl "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=warnsum&lang=tc"
```

### opendata.php — 氣候數據

Base：`https://data.weather.gov.hk/weatherAPI/opendata/opendata.php`

| dataType | 內容 |
|---|---|
| `HHOT` / `HLT` | 潮汐（每小時高度 / 高低潮時間） |
| `SRS` / `MRS` | 日出日落 / 月出月落 |
| `LHL` | 閃電次數 |
| `LTMV` | 最新 10 分鐘平均能見度 |
| `CLMTEMP` / `CLMMAXT` / `CLMMINT` | 每日平均/最高/最低氣溫（歷史數據返到 1884 年） |
| `RYES` | 昨日天氣及輻射水平 |

支援 `rformat=json` 或 `csv`。

### earthquake.php — 地震 ✅

```bash
# 最新地震速報
curl "https://data.weather.gov.hk/weatherAPI/opendata/earthquake.php?dataType=qem&lang=tc"
# 有感地震報告用 dataType=feltearthquake
```

### 農曆轉換

```bash
curl "https://data.weather.gov.hk/weatherAPI/opendata/lunardate.php?date=2026-09-29"
```

## 環保署 — 空氣質素健康指數 AQHI ✅

- **要 Key？** ❌ 唔使 ｜ **格式：** XML/RSS（DATA.GOV.HK 亦有 JSON 版本）
- 全港 18 個監測站（一般 + 路邊），每小時更新

```bash
# 過去 24 小時 AQHI
curl "https://www.aqhi.gov.hk/epd/ddata/html/out/24aqhi_Eng.xml"
# 現時 AQHI
curl "https://www.aqhi.gov.hk/epd/ddata/html/out/aqhi_ind_rss_Eng.xml"
```

數據集頁：[data.gov.hk 搜 "AQHI"](https://data.gov.hk/tc-datasets?q=aqhi)
