# 🔧 DATA.GOV.HK 平台 API

平台本身都有 API，用嚟搵數據集同攞歷史版本，全部 ❌ 唔使 Key。

> 📊 想搵「某部門有咩數據集」或者「統計處 639 張表號」，睇 **[censtatd.md](censtatd.md)**——
> 嗰邊有齊全機構代碼表、`package_search` 實戰 query、filter API 完整 JSON 規格同歷史檔案 5 條端點。

## 1. CKAN 目錄 API — programmatically 搜數據集 ✅

```bash
# 搜尋數據集
curl "https://data.gov.hk/tc-data/api/3/action/package_search?q=transport&rows=10"

# 數據集詳情（連 resource 直連 URL）
curl "https://data.gov.hk/tc-data/api/3/action/package_show?id={dataset_id}"
```

⚠️ CKAN 目錄只包含部分數據集（~200+），唔係全站；全站搜尋用返網頁 [data.gov.hk/tc-datasets](https://data.gov.hk/tc-datasets)。

## 2. 歷史檔案 API — 攞任何數據集嘅舊版本 ✅

呢個係做**趨勢分析嘅寶藏**：政府每日 snapshot 咗所有 resource，你可以攞返「上年今日嘅急症室輪候時間」呢類數據。

```bash
# 列出 HKO 喺指定日期範圍嘅檔案
curl "https://api.data.gov.hk/v1/historical-archive/list-files?start=20250101&end=20250102&provider=hk-hko"

# 某個 resource 嘅所有歷史版本時間戳
curl "https://api.data.gov.hk/v1/historical-archive/list-file-versions?url={resource_url}&start=20250101&end=20250131"

# 落返指定時間嘅版本
curl "https://api.data.gov.hk/v1/historical-archive/get-file?url={resource_url}&time={YYYYMMDD-HHmm}"
```

參數：`category`（分類）、`provider`（部門代碼，如 `hk-hko`、`hk-td`、`hk-ha`）、`format`（csv/json/xml）。

## 3. 數據篩選 API — server-side query CSV/JSON

唔使成個檔案落，直接喺 server 度 filter：

```bash
curl "https://api.data.gov.hk/v2/filter?q={query JSON}"
```

Query 格式支援指定 resource URL、揀 column、加 filter 條件，回傳 CSV/JSON/XML。詳情：[API 規範](https://data.gov.hk/tc/help/api-spec)。

## 4. 搵最近設施 API

```bash
curl "https://api.data.gov.hk/v1/nearest-schools?lat=22.2812&long=114.1659&max=5"
```

## 部門代碼（provider）常用表

| 代碼 | 部門 |
|---|---|
| `hk-hko` | 天文台 |
| `hk-td` | 運輸署 |
| `hk-ha` | 醫管局 |
| `hk-epd` | 環保署 |
| `hk-lcsd` | 康文署 |
| `hk-hkma` | 金管局 |
| `hk-landsd` | 地政總署 |
| `hk-censtatd` | 政府統計處 |
| `hk-swd` | 社會福利署 |
| `hk-wsd` | 水務署 |
| `hk-emsd` | 機電工程署 |
| `hk-dsd` | 渠務署 |
| `hk-cedd` | 土木工程拓展署 |
| `hk-hkpf` | 警務處 |
| `hk-edb` | 教育局 |
| `hk-cstb` | 文化體育及旅遊局 |

> 全 130+ 個代碼（部門＋公營機構＋電車／渡輪／的士車隊）見 [censtatd.md 附錄](censtatd.md#7-附錄datagovhk-數據提供機構代碼provider-參數用)。
