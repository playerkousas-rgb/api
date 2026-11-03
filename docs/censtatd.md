# 📊 政府統計處（C&SD）＋ DATA.GOV.HK 大全

> 政府統計處係全香港**開放數據最大戶**：全站 984 個數據集佢一個佔咗成 592 個（CKAN 目錄計）。
> 全部網上統計表都有機器可讀 API，**唔使 Key、唔使註冊、商用免費**（要註明出處）。
> ✅ = 2026-11-03 實測（回應含 `header.status.code = 0`）

---

## 1. 一句話：統計處 API 就係一條 URL

```bash
# 表 110-02001：按區議會分區劃分的陸地面積、陸上人口及人口密度
curl "https://www.censtatd.gov.hk/api/get.php?id=110-02001&lang=tc&full_series=1"
```

| 參數 | 值 | 必要 | 說明 |
|---|---|:---:|---|
| `id` | 表號，例如 `110-02001` | ✅ | **一次只可以攞一張表** |
| `lang` | `tc` / `sc` / `en` | ✅ | 文字描述（`DCDesc`、`svDesc`）用邊種語言 |
| `full_series` | `1` | ✅ | 攞齊成條時間序列（唔加就只回最新一期） |

- 官方使用者指南：[www.censtatd.gov.hk/tc/API_Guide.html](https://www.censtatd.gov.hk/tc/API_Guide.html)（有 OpenAPI 3.0 YAML、Python 範例、AI agent 用嘅 `SKILL.md`）
- 官方**全表一覽**：[www.censtatd.gov.hk/tc/API.html](https://www.censtatd.gov.hk/tc/API.html) —— 一次過列晒 **639 張**有 API 嘅網上統計表（每張都有現成 URL 可以 copy）
- 唔使 Key、冇 CORS 白名單申請、冇每日 quota 公告（照舊斯文啲 call）

## 2. 回應結構（記熟呢 6 個欄位就夠）

```json
{
  "header": {
    "status": { "name": "Success", "code": 0, "description": "Query success" },
    "title": "按區議會分區劃分的陸地面積、陸上人口及人口密度",
    "tablenote": ["……統計註釋，圖表要照抄落去……"],
    "source": "政府統計處普查策劃組（一）",
    "count": { "noOfRecords": 1584 }
  },
  "dataSet": [
    { "DC": "A", "DCDesc": "中西區", "freq": "Y", "period": "2002",
      "sv": "LA", "svDesc": "（平方公里）", "figure": 12.39, "sd_value": "" }
  ]
}
```

| 欄位 | 意思 | 實戰用途 |
|---|---|---|
| `header.status.code` | `0` = 成功 | **一定要 check**，唔係會靜靜雞爆錯 |
| `header.title` / `source` | 表名 / 負責組別 | 出圖表要標出處 |
| `header.tablenote[]` | 統計註釋、修訂、不可比較年份 | 直接複製，唔好自己作 |
| `dataSet[].period` | 參考期（`2002`、`2025Q3`、`2025-08` 等） | 做時間軸 |
| `dataSet[].freq` | 頻率代碼（`Y` 年 / `Q` 季 / `M` 月） | 畫圖前 filter |
| `dataSet[].DC` / `DCDesc` | 維度代碼 / 中文名（例如分區、性別） | group by 用 |
| `dataSet[].sv` / `svDesc` | 變數代碼 / 單位（例如 `LA` = 平方公里） | **單位喺呢度，唔係 figure 隔籬** |
| `dataSet[].figure` | 數值 | `N.A.` 等等會用 `sd_value` 標示 |

> ⚠️ 兩個位最易中伏：**單位喺 `svDesc`**（唔寫落 figure）；**`sd_value` 唔係空就要睇**（修訂/特殊顯示/唔適用）。
> （`dataSet` 每一行嘅欄位組合會因表而異——例如部分表有 `svDesc`／`sd_value`，部分冇。寫 parser 唔好寫死，用 `pd.json_normalize` 或 `.get()` 處理。）

## 3. Python：一張表 → DataFrame

```python
import requests, pandas as pd

def csd_table(table_id: str, lang: str = "tc") -> pd.DataFrame:
    r = requests.get(
        "https://www.censtatd.gov.hk/api/get.php",
        params={"id": table_id, "lang": lang, "full_series": "1"},
        headers={"User-Agent": "Python Request"}, timeout=60,
    )
    r.raise_for_status()
    j = r.json()
    if j["header"]["status"]["code"] != 0:
        raise RuntimeError(j["header"]["status"])
    df = pd.json_normalize(j["dataSet"])
    print(j["header"]["title"], "｜單位：", df["svDesc"].unique()[:5])
    return df

df = csd_table("110-02001")           # 人口密度
latest = df[df.freq == "Y"].sort_values("period").tail(20)
```

## 4. 常用表號速查（由官方數據集標題抽出，可直接 curl）

### 👥 人口／人口普查

| 表號 | 內容 |
|---|---|
| `110-01001` | 按性別及年齡組別劃分的人口 |
| `110-01001A` | 同上（不包括外籍家庭傭工） |
| `110-01003` | 按組成部分劃分的人口增長 |
| `110-01004` | 撫養比率及人口年齡中位數 |
| `110-01005` | 按年齡組別劃分的性別比率 |
| `110-02001` ✅ | 按區議會分區劃分的陸地面積、陸上人口及人口密度 |
| `110-06811` | 按區議會分區、性別及年齡劃分的陸上非住院人口數目 |
| `115-01011` | 生命事件（出生／死亡） |
| `115-01012A` | 按性別劃分的每月活產嬰兒數目 |
| `115-01015A` | 每月結婚數目 |
| `115-01021` | 香港人口生命表 |
| `115-01022` | 按性別及年齡組別劃分的死亡人數 |
| `115-92001` | 離婚統計數字 |
| `170-05001` / `170-05001A` | 人口普查：按性別及年齡組別劃分的人口 |
| `171-05001` | 人口普查：15 歲及以上人口（按教育程度） |
| `172-05001` | 人口普查：勞動人口及參與率 |
| `172-05004` | 人口普查：按職業劃分的工作人口 |
| `173-05001` | 人口普查：按住戶人數劃分的家庭住戶數目 |
| `173-05004` | 人口普查：家庭住戶每月收入中位數 |
| `174-05001` | 人口普查：有人居住的屋宇單位數目 |
| `174-05009` | 人口普查：居所樓面面積中位數 |
| `174-05011` | 人口普查：住戶租金與收入比率中位數 |

### 💼 勞工／工資

| 表號 | 內容 |
|---|---|
| `210-06101` | 勞動人口、就業人口、失業人口及就業不足人口的統計數字 |
| `210-06313` | 按每月就業收入及性別劃分的就業人數 |
| `210-06314` | 按年齡及性別劃分的就業人士每月就業收入中位數 |
| `210-06401` | 按年齡及性別劃分的失業人數及失業率 |
| `210-06406` / `210-06407` | 按以前從事行業／職業劃分的失業人數及失業率 |
| `210-06501` | 按年齡及性別劃分的就業不足人數及比率 |
| `215-94002` | 保險、零售、專業／科學及技術服務業機構單位數目及從業人數 |
| `225-27001` | 勞工生產力指數（2015 年 = 100） |

> 失業率想寫 app：用 `210-06101`，記得 `sd_value` 有機會標「經季節性調整」。

### 💰 經濟／國民收入／金融市場

| 表號 | 內容 |
|---|---|
| `310-34501` | 按經濟活動劃分的本地生產總值（環比物量） |
| `310-36204` | 對外初次收入流量 |
| `310-36205` | 本地居民可支配總收入（當時市價） |
| `315-37001` | 國際收支平衡 |
| `315-37002` | 國際收支平衡相對本地生產總值的比率 |
| `315-37004` | 國際收支平衡：金融賬戶 |
| `315-37031` | 對外債務（期末頭寸） |
| `315-38001` | 香港直接投資統計數字 |
| `330-41001` ~ `330-41023` | 業務展望按季統計調查（業務／產出／就業／價格／盈利／財務／信貸） |
| `340-45001` | 流通貨幣 |
| `340-45011` / `340-45012` | 貨幣供應（所有貨幣／港幣及外幣） |
| `340-45021` | 港幣利率 |
| `340-45022` | 港元利息結算率 |
| `340-46001` | **外幣兌換率**（做 dashboard 匯率必用） |
| `340-46002` | 港匯指數（2020 年 1 月 = 100） |
| `340-92002` | 銀買賣報價 |
| `340-95001` | 香港銀行同業拆息市場 |
| `340-95003` | 在港交所上市的公司數目、總市值、成交金額等 |
| `340-95005` | 滬港通／深港通成交金額 |
| `340-95006` | 香港黃金交易所 99 金及倫敦金平均每日成交金額 |

### 💹 物價／消費

| 表號 | 內容 |
|---|---|
| `510-60001` | 消費物價指數（2019 年 10 月 – 2020 年 9 月 = 100） |
| `510-60001A` | 同上，各商品／服務類別指數 |
| `510-60002` / `510-60002A` | 基本消費物價指數（剔除政府一次性措施） |
| `510-60003` | 「按目的劃分的個人消費分類」類別指數 |
| `510-60004` | 經季節性調整的消費物價指數 |
| `520-62001` | 製造及廢棄物管理業生產者價格指數（2015 = 100） |
| `520-63001` | 選定服務業按季生產者價格指數（2015 = 100） |

### 🚢 對外貿易

| 表號 | 內容 |
|---|---|
| `410-50001` | 對外商品貿易總計數字 |
| `410-50001A` | 同上（同年累積月度） |
| `410-50001B` | 同上（最近 12 個月累積） |
| `410-50002` | 經季節性調整的對外商品貿易貨值 |
| `410-50011` | 與十個主要國家／地區的貿易總額 |
| `410-50012` / `410-50013` | 進口自十個主要供應地／出口往十個主要目的地的貨值 |
| `410-50021` / `410-50022` | 按運輸方式劃分的進口／整體出口貨值 |
| `410-50031` / `410-50032` | 進口／出口十項主要貨品類別的貨值 |

### 🏭 行業／服務業

| 表號 | 內容 |
|---|---|
| `660-69001` | 服務行業及服務界別業務收益指數（2015 年按季平均 = 100） |
| `660-69002` | 同上，按年變動百分率 |
| `660-69011` / `660-69012` | 經季節性調整的業務收益指數（水平／按季變動） |
| `610-65001` | 製造及廢棄物管理業工業生產指數（2015 = 100） |
| `915-91101` ~ `915-91104` | 油產品／煤產品淨進口貨值、貨量、進口單位價格 |
| `915-91201` | 按使用者類別劃分的電力及煤氣用量按月統計 |
| `990-92071` | 本地食品生產量的估計 |
| `930-92081A` | 須呈報的傳染病的死亡人數 |

> 想「零售業銷貨額」：C&SD 官網係專題頁（唔同表號），喺 [API.html](https://www.censtatd.gov.hk/tc/API.html) 搜「零售」最快。

## 5. 點搵表號？（三條路，按速度排）

1. **官方全表一覽**（最快）：開 [API.html](https://www.censtatd.gov.hk/tc/API.html)，左邊已經分好 9 大類：
   人口與住戶（`#population-and-households`）、人口普查（`#population-census-by-census`）、勞工與工資（`#labour-and-wages`）、經濟（`#economy`）、對外貿易（`#external-trade`）、物價（`#prices`）、行業（`#industry`）、科學及技術（`#science-and-technology`）、社會與環境（`#society-and-environment`）。
   每張表下面直接有 `https://www.censtatd.gov.hk/api/get.php?id=…&lang=tc&full_series=1` 可以 copy。
2. **網上統計表頁**：`web_table.html?id={表號}` 右上角有「API」掣，會俾你完整 URL；`web_table.html?api_popup=1&id={表號}` 係該表嘅數據字典（欄位定義）。
3. **DATA.GOV.HK CKAN 目錄**（想批量撈表號／標題用）：
   ```bash
   # 統計處全部數據集（592 個），只要 name + title
   curl "https://data.gov.hk/tc-data/api/3/action/package_search?q=organization:hk-censtatd&rows=1000&fl=name,title"
   ```
   數據集 `name` 有固定前綴 `hk-censtatd-tablechart-{表號小寫}`，例如
   `hk-censtatd-tablechart-340-46001` = 表 **340-46001** 外幣兌換率 —— **唔使查表都可以反推表號**。

> 🐞 **實測怪癖**：CKAN 搜中文要「成組詞」先得。`q=organization:hk-censtatd 消費物價指數` → 9 個結果 ✅；
> 但 `q=organization:hk-censtatd 失業`、`統計處 貿易` → 0 個結果 ❌。所以**用英文關鍵詞或者直接拉 592 個 title 落本機 grep** 最穩。

## 6. DATA.GOV.HK 全站：唔止統計處

### 6.1 三條官方平台 API（全部唔使 Key）

| API | 端點 | 做乜 |
|---|---|---|
| 歷史檔案文件列表 | `https://app.data.gov.hk/v1/historical-archive/list-files?start=YYYYMMDD&end=YYYYMMDD&provider={代碼}` | 列出某部門喺日期內每日 snapshot 咗嘅檔案 |
| 歷史檔案版本 | `.../list-file-versions?url={資源URL}&start=&end=` | 某個 resource 嘅所有歷史版本時間戳 |
| 歷史檔案下載 | `.../get-file?url={資源URL}&time=YYYYMMDD` | 落返嗰日嘅版本（302 → 檔案） |
| 歷史檔案 schema | `.../get-schema?url={數據集URL}&date=YYYYMMDD` | 舊版 schema |
| 歷史檔案數據字典 | `.../get-data-dictionary?url={數據集URL}&date=YYYYMMDD` | 舊版 data dictionary |
| 數據篩選 | `https://api.data.gov.hk/v2/filter?q={URL-encoded JSON}` | server-side 篩選／排序 CSV，出 CSV/JSON/XML |
| 最近學校 | `https://api.data.gov.hk/v1/nearest-schools?lat=&long=&max=` | 距離排序最近學校 |

`filter` 嘅 JSON 規格（實戰最常用）：

```bash
curl -G "https://api.data.gov.hk/v2/filter" --data-urlencode 'q={
  "resource":"https://www.cr.gov.hk/datagovhk/psi/ml_licensees.csv",
  "section":1,"format":"json",
  "filters":[[1,"eq",["3983"]],[2,"nct",["2021"]]],
  "sorts":[[4,"asc"],[7,"desc"]]
}'
```

運算符：`eq ne in ni lt le gt ge bt ct nct bw nbw ew new`（`in/ni` 要 ≥2 個操作數；`bt` 要 2 個）。
註：官方規範最新寫 `app.data.gov.hk`；坊間教學同本 repo 其他頁面常見 `api.data.gov.hk/v1/historical-archive/...`（同一組服務、舊寫法）。**如果一個 host 連唔到就試另一個**。

**統計處專用玩法**：統計處每個 CSV/XLSX 資源都有歷史快照，所以你可以攞「上年今日嘅 CPI」：

```bash
curl "https://app.data.gov.hk/v1/historical-archive/list-files?start=20250101&end=20250107&provider=hk-censtatd&format=csv"
```

### 6.2 搵數據集（CKAN 目錄 API）

```bash
# 全站有幾大？按 provider 睇分佈
curl "https://data.gov.hk/tc-data/api/3/action/package_search?rows=0&facet.field=%5B%22organization%22%5D&facet.limit=200"

# 某部門全部數據集
curl "https://data.gov.hk/tc-data/api/3/action/package_search?q=organization:hk-hko&rows=100&fl=name,title"

# 單一數據集詳情（連所有 resource 直連 URL / 格式 / 語言）
curl "https://data.gov.hk/tc-data/api/3/action/package_show?id=hk-censtatd-tablechart-340-46001"
```

- 機構清單：`.../action/organization_list`（純代碼）／`organization_list?all_fields=true`（連中文名、圖示）
- 分類代碼：`.../action/group_list`

**三個數要分清**（好多文章混淆咗）：

| 數字 | 意思 | 來源 |
|---|---|---|
| **984** | 網頁 provider 頁面顯示「政府統計處」數據集數 | [data.gov.hk/tc-datasets/provider/hk-censtatd](https://data.gov.hk/tc-datasets/provider/hk-censtatd) |
| **592** | CKAN 目錄真正索引到嘅數（**呢個係 API 攞到嘅數**） | `package_search` `count` |
| **639** | 統計處官網有 API 端點嘅網上統計表 | [censtatd.gov.hk/tc/API.html](https://www.censtatd.gov.hk/tc/API.html) |
| **864** | CKAN 目錄全站（所有部門）數據集總數 | `package_search` `count` |

> 🐞 **實測**：`data.gov.hk/tc-datasets/provider/...` 呢類頁面係前端 JS 渲染，用 curl／server 直接 fetch 會見到「顯示第 0 項結果，共 0 項」（其實係未 load 到）。想攞數就用上面 CKAN API，唔好 scrape 網頁。

### 6.3 統計處數據喺全站嘅分佈（592 個 CKAN 數據集）

| 分類 | 數量 |
|---|---:|
| 就業及勞工 | 143 |
| 工商業 | 133 |
| 人口 | 131 |
| 財經 | 61 |
| 其他 | 26 |
| 運輸 | 25 |
| 衞生 | 18 |
| 科技及廣播 | 12 |
| 教育 | 9 |
| 社區及社會福利 | 8 |
| 環境 | 6 |
| 法律及保安 | 6 |
| 旅遊 | 6 |
| 康樂、體育及文化 | 3 |
| 食物 | 2 |
| 房屋 | 2 |
| 選舉及立法機關 | 1 |

## 7. 附錄：DATA.GOV.HK 數據提供機構代碼（`provider` 參數用）

> 抄自官方 [API 規範](https://data.gov.hk/tc/help/api-spec)。`historical-archive/list-files` 同 CKAN `organization:` 都用呢批代碼。

**政府部門／決策局**

| 代碼 | 機構 | 代碼 | 機構 |
|---|---|---|---|
| hk-afcd | 漁農自然護理署 | hk-landsd | 地政總署 |
| hk-ams | 醫療輔助隊 | hk-lcsd | 康樂及文化事務署 |
| hk-archsd | 建築署 | hk-ld | 勞工處 |
| hk-aud | 審計署 | hk-lr | 土地註冊處 |
| hk-aw | 政務司司長辦公室轄下行政署 | hk-lwb | 勞工及福利局 |
| hk-bd | 屋宇署 | hk-md | 海事處 |
| hk-cad | 民航處 | hk-ofca | 通訊事務管理局辦公室 |
| hk-cas | 民眾安全服務隊 | hk-ofnaa | 電影、報刊及物品管理辦事處 |
| hk-cedb | 商務及經濟發展局 | hk-omb | 申訴專員公署 |
| hk-cedd | 土木工程拓展署 | hk-oro | 破產管理署 |
| hk-censtatd | 政府統計處 | hk-pland | 規劃署 |
| hk-ceo | 行政長官辦公室 | hk-psc | 公務員敍用委員會 |
| hk-cepu | 特首政策組 | hk-reo | 選舉事務處 |
| hk-cmab | 政制及內地事務局 | hk-rthk | 香港電台 |
| hk-cpu | 中央政策組 | hk-rvd | 差餉物業估價署 |
| hk-cr | 公司註冊處 | hk-sb | 保安局 |
| hk-csb | 公務員事務局 | hk-sciocs | 截取通訊及監察事務專員秘書處 |
| hk-csd | 懲教署 | hk-swd | 社會福利署 |
| hk-cso | 政務司司長辦公室 | hk-td | 運輸署 |
| hk-cstb | 文化體育及旅遊局 | hk-tid | 工業貿易署 |
| hk-customs | 香港海關 | hk-tlb | 運輸及物流局 |
| hk-devb | 發展局 | hk-try | 庫務署 |
| hk-dh | 衞生署 | hk-ugc | 大學教育資助委員會秘書處 |
| hk-doj | 律政司 | hk-wfsfaa | 在職家庭及學生資助事務處 |
| hk-dpo | 數字政策辦公室 | hk-wsd | 水務署 |
| hk-dsd | 渠務署 | hk-eabfu | 經濟分析及方便營商處 |
| hk-edb | 教育局 | hk-eeb | 環境及生態局 |
| hk-emsd | 機電工程署 | hk-epd | 環境保護署 |
| hk-fehd | 食物環境衞生署 | hk-fsd | 消防處 |
| hk-fso | 財政司司長辦公室 | hk-fstb | 財經事務及庫務局 |
| hk-gfs | 政府飛行服務隊 | hk-gld | 政府物流服務署 |
| hk-govtlab | 政府化驗所 | hk-gpa | 政府產業署 |
| hk-had | 民政事務總署 | hk-hb | 房屋局 |
| hk-hhb | 醫務衞生局 | hk-hko | 香港天文台 |
| hk-hkpf | 警務處 | hk-hkpo | 香港郵政 |
| hk-housing | 香港房屋委員會 | hk-hyab | 民政及青年事務局 |
| hk-hyd | 路政署 | hk-icac | 廉政公署 |
| hk-immd | 入境事務處 | hk-investhk | 投資推廣署 |
| hk-ipd | 知識產權署 | hk-ird | 稅務局 |
| hk-isd | 政府新聞處 | hk-itc | 創新科技署 |
| hk-itib | 創新科技及工業局 | hk-jsscs | 公務及司法人員薪俸及服務條件諮詢委員會聯合秘書處 |
| hk-lad | 法律援助署 | | |

**公營機構／企業／其他**

| 代碼 | 機構 | 代碼 | 機構 |
|---|---|---|---|
| aahk | 機場管理局 | hkhs | 香港房屋協會 |
| cc | 消費者委員會 | hkirc | 香港互聯網註冊管理有限公司 |
| cfs | 食物安全中心 | hkkf | 港九小輪 |
| chsc | 家庭與學校合作事宜委員會 | hkpc | 香港生產力促進局 |
| compcomm | 競爭事務委員會 | hkstp | 香港科技園公司 |
| cyberport | 數碼港管理有限公司 | hktdc | 香港貿易發展局 |
| dc | 區議會 | hktramways | 香港電車 |
| eac | 選舉管理委員會 | hospital | 醫院管理局 |
| hk-hkma | 香港金融管理局 | ia | 保險業監管局 |
| hkcaavq | 香港學術及職業資歷評審局 | legco | 立法會 |
| hkcert | 香港網絡安全事故協調中心 | llb | 酒牌局 |
| hkeaa | 香港考試及評核局 | mpfa | 強制性公積金計劃管理局 |
| hkecic | 香港出口信用保險局 | mtr | 港鐵 |
| hkelectric | 香港電燈 | rehabsociety | 香港復康會 |
| wkcda | 西九文化區管理局 | ura | 市區重建局 |
| clp | 中華電力 | towngas | 香港中華煤氣 |
| ctb | 城巴 | nlb | 新大嶼山巴士 |
| starferry | 天星小輪 | sunferry | 新渡輪 |
| ckf | 全記渡 | ff | 富裕小輪 |
| pckt | 坪洲街渡 | traway | 翠華船務 |
| centaline | 中原地產 | 28hse | 28 地產資訊 |
| big-boss-taxi | 大老闆的士 | joie | 樂行車隊 |
| amigo | Amigo（的士車隊） | tpd | 城市規劃委員會 |

## 8. 實戰注意

- **一次一張表**：想攞 20 個指標 = 20 個 request，寫 loop 就加 200–500ms delay，唔好狂打。
- **`full_series=1` 會好大**：例如 `110-02001` 一次 1,584 行。前端唔好直接 call 再塞入 browser（CORS 同 payload 都會痛），用自己 server／cron 落地再出輕量 JSON。
- **語言唔影響數值**：`lang` 只改 `DCDesc`／`svDesc` 嘅文字，`figure` 一樣。
- **單位同註釋要跟**：`svDesc`（單位）＋ `header.tablenote`（註釋）出街時一齊顯示，先唔會俾人話誤導。
- **數據修訂**：統計處會修訂舊期數（GDP、貿易尤其），所以要用歷史檔案 API 或者定期重拉，唔好 cache 成年。
- **出處格式**：`資料來源：政府統計處（表 110-02001），經 DATA.GOV.HK 擷取，YYYY-MM-DD`。
- 相關：[簡易版數據集瀏覽](civic.md#政府統計處-csd)、[平台 API 速查](platform.md)、[金管局 API](finance.md)。
