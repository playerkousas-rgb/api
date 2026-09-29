# 公共設施位置 API — 泳池／公廁／消防栓／AED

> 驗證日期:2026-09-29(sandbox 海外 IP)。呢一版嘅主題係「香港地面上嘅公共設施」——
> 邊啲有官方機讀數據、邊啲要行社群路、邊啲老實講係冇。

---

## 1. 康文署(LCSD)

### 1.1 全部場地總表 ✅(keyless)

```
https://www.lcsd.gov.hk/datagovhk/venue/venue.json
```

- ✅ 實測 200,623KB JSON
- 康文署**所有場地**:地址、電話、開放時間
- 呢個係「搵最近體育館/公園」嘅底表

### 1.2 泳池位置 GeoJSON ✅(keyless)

```
https://www.lcsd.gov.hk/datagovhk/facility/facility-swimming-pools.json
```

- ✅ 實測 200,標準 GeoJSON FeatureCollection,45 個泳池連座標、中英名、地址
- 同系仲有泳灘:`facility-beaches.json` ✅ 200
- ⚠️ 其他設施類(燒烤場/體育館等)試過十幾個檔名都 404 —— 呢個家族目前
  確認得泳池+泳灘兩個檔;其他設施用 1.1 venue.json 或 CSDI(見第 4 節)

### 1.3 「關池」實時狀態 —— 官方冇 API ❌,但有兩條路

老實記錄:康文署**冇**「而家邊個池關咗」嘅開放數據。
突發關池(例如水質事故)係出新聞稿+場地頁更新;年度維修時間表係每年三月尾新聞公報附件。

**路 A:社群 scraper(現成)✅**

```
https://raw.githubusercontent.com/iristkats/hkpools/main/pools.json
```

- ✅ 實測 200,190KB,45 個池
- 每日刮兩次 LCSD 官網,有:開放時段、每週清潔日、年度維修、臨時關閉、設施明細(主池/嬉水池/滑水梯)、埋收費同惡劣天氣規則
- 依賴第三方持續維護,用之前 check 下 `snapshot_date` 新唔新鮮

**路 B:自己監察(自主)**

- 用 changedetection.io 監察 LCSD 泳池頁(見 glue.md)
- 突發關池會出 info.gov.hk 新聞公報,可以用 RSS 關鍵字「游泳池 暫停」

**周邊數據:**
- 泳池入場人次(年度統計):CSDI dataset `lcsd_rcd_1670393362105_82481`
- SmartPlay 訂場:冇公開 API(同康體通年代一樣)

---

## 2. 公廁 —— 食環署設施地圖 XML ✅(keyless,寶藏級)

```
https://www.fehd.gov.hk/english/map/fehd_map_e.xml      (英)
https://www.fehd.gov.hk/tc/map/fehd_map_tc.xml          (中,同 pattern)
```

- ✅ 實測 200,707KB,**1,374 個設施連座標**,每日更新(generation_date 係尋日)
- 內容統計(2026-09-29):

| 類型 | 數量 |
|---|---|
| 公廁 toilet | **808** |
| 垃圾收集站 refuse | 171 |
| 長期流動廁所 portable_toilet | 122 |
| 街市/熟食市場 market | 93 |
| 旱廁 ap (aqua privy) | 32 |
| 公共浴室 bath | 25 |
| 其餘 | 墳場/靈灰安置所/小販市場等 |

- 每個項目有:中英名、地址、電話、**開放時間**(好多係 24 hours)、
  `map_coordinate`(lat,lng)、仲有 `remarks` 寫住裝修停用時段
- 遠足實用組合:呢個 XML(市區公廁)+ **AFCD 郊野公園廁所**(CSDI dataset
  `Toilets in Country Parks`,data.gov.hk 話舊 CSV 停更、去 CSDI 攞最新)
- 補充:OSM `amenity=toilets` 經 Overpass 都有,但官方呢份更全更新

---

## 3. 消防栓 —— 老實講:冇 ❌

- 查過 data.gov.hk CKAN(0 結果)、CSDI 英文+中文搜尋(「fire hydrant」23 個
  結果、「街喉」35 個、「消防栓」151 個全部係行政/牌照數據)——
  **水務署/消防處都冇公開街道消防栓位置數據**,估計係運作考慮
- OSM 香港 `emergency=fire_hydrant` 只有 **339 個節點**(✅ Overpass 實測)——
  覆蓋好疏,參考價值有限;有心可以組織隊員做 OSM mapping 活動補完佢
- 附近類似但有數據嘅:AED(下一節)、消防局位置(CSDI `hkfsd_rcd_1634798867463_89696`)、救護站(`hkfsd_rcd_1634799003993_7633`)

---

## 4. 意外寶藏兩件

### 4.1 全港 AED 位置 4,189 部 ✅(keyless GeoJSON)

```
https://portal.csdi.gov.hk/csdi-webpage/file-api?dataset_id=hkfsd_rcd_1695974242578_37917&format=geojson&layer_name=AED
```

- ✅ 實測 200,2.9MB,**4,189 個 AED** 連座標、詳細位置描述(例:「正門外」)、
  邊個用得、樓層、服務時間、牌子型號
- 消防處中央 AED 登記冊(急救call 999 時話你知最近部 AED 喺邊嗰個庫)
- 童軍用法:急救章訓練、大型活動安全計劃書直接引用、行山路線「最近 AED」圖層

### 4.2 CSDI file-api —— 成個空間數據庫嘅黃金入口 ✅

```
https://portal.csdi.gov.hk/csdi-webpage/file-api?dataset_id={ID}&format=geojson&layer_name={LAYER}
```

- **一條 URL pattern 攞到 CSDI 任何 dataset 嘅 GeoJSON**,keyless
- 同 geodata.gov.hk 唔同:**海外 IP 都通**(sandbox 實測 ✅)—— 呢個係
  README「地區限制三種坑」入面第②類坑嘅逃生門
- 搵 dataset_id / layer_name:
  1. 搜尋:`https://portal.csdi.gov.hk/geoportal/rest/metadata/search?q=關鍵字&f=json`(✅ 實測)
  2. 攞 metadata:`.../rest/metadata/item/{ID}?f=json` → 入面有 file-api 完整 URL
- 每個 dataset 仲有 OGC WFS/WMS 同 ArcGIS REST 三種 API 可揀

---

## 5. 童軍實戰配方

1. **「臨急臨忙」PWA**:FEHD 公廁 XML + AFCD 郊野廁所 + Geolocation →
   「最近公廁 + 開唔開」一撳即知,行山帶隊神器
2. **活動安全一頁**:活動地點座標 → Turf.js 搵最近 AED / 消防局 / 公廁,
   自動生成安全簡報附件
3. **游水活動 checker**:hkpools JSON + HKO 天氣警告 API(weather.md)→
   出發前自動答「今日邊個池開 + 會唔會落雷」

---

## 一覽

| 資源 | 免費 | 香港 | 驗證 | 備註 |
|---|---|---|---|---|
| LCSD venue.json | ✅ | ✅ | ✅ 2026-09-29 | 全場地地址電話時間 |
| LCSD 泳池/泳灘 GeoJSON | ✅ | ✅ | ✅ 2026-09-29 | 45 池連座標 |
| 關池實時官方 API | — | — | ❌ 唔存在 | 用社群/自己監察 |
| hkpools 社群 JSON | ✅ | ✅ | ✅ 2026-09-29 | 日刮兩次,第三方 |
| FEHD 設施 XML(公廁) | ✅ | ✅ | ✅ 2026-09-29 | 808 公廁+時間+座標 |
| 消防栓官方數據 | — | — | ❌ 唔存在 | OSM 僅 339 個 |
| FSD AED GeoJSON | ✅ | ✅ | ✅ 2026-09-29 | 4,189 部 |
| CSDI file-api | ✅ | ✅ | ✅ 2026-09-29 | 海外都通,萬用入口 |
