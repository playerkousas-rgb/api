# 公共設施位置 II — 行山徑設施／回收點／飲水機

> 驗證日期:2026-09-29,16 個 dataset 全部經 CSDI file-api 實測落地(海外 IP 都通)。
> 全部 keyless,全部 GeoJSON,全部有中英名+座標。
>
> file-api 用法見 facilities.md 第 4.2 節;下面每項直接畀完整 URL,copy 即用。

---

## 1. 行山徑設施(AFCD 郊野公園全家桶)

Base:`https://portal.csdi.gov.hk/csdi-webpage/file-api?dataset_id={ID}&format=geojson&layer_name={LAYER}`

| 數據 | 實測 | dataset_id | layer_name |
|---|---|---|---|
| **行山徑**(線狀,167 段,連長度/起點) | ✅ | `afcd_rcd_1665568199103_4360` | `HikingTrails_HikingTrails_Ext_GDB` |
| **標距柱** ⭐(1,078 支,連編號+UTM) | ✅ | `afcd_rcd_1635136039113_86105` | `DistancePosts_DistancePosts_Ext_GDB` |
| **封閉山徑**(實時性!7 條) | ✅ | `afcd_rcd_1742550096880_1424` | `CPISDBOCLOSED_TRAIL_IN_CP_GDB` |
| **關閉設施**(實時性!19 項) | ✅ | `afcd_rcd_1728897009646_22480` | `Closed_Facilities_in_Country_Parks` |
| **營地**(41 個,**連水源欄位**) | ✅ | `afcd_rcd_1635133060194_82554` | `Campsites_Campsites_Ext_GDB` |
| 郊野燒烤場(155 個) | ✅ | `afcd_rcd_1635132752214_22438` | `BarbecueSitesincludeWheelchairSite_BarbecueSites_Ext_GDB` |
| **觀景點**(78 個) | ✅ | `afcd_rcd_1635142967951_6079` | `ViewingPoints_ViewingPoints_Ext_GDB` |
| 郊野景點(53 個,連網址) | ✅ | `afcd_rcd_1728896853370_57183` | `Attractions_in_Country_Parks` |
| **郊野加水站**(37 個) | ✅ | `afcd_rcd_1635133835075_48993` | `WaterFillingStation_WaterFillingStation_Ext_GDB` |
| LCSD 市區燒烤場(43 個) | ✅ | `lcsd_rcd_1634540957025_61259` | `LCSD_BBQ` |

重點解讀:

- **標距柱 = 行山報案定位系統**。柱上編號(如 `C1234`)+ 呢份數據 →
  隊員報「我喺 M047」你即刻有座標。急救/迷路演習教材直接生成。
- **封閉山徑 + 關閉設施**係成個 CSDI 少有嘅「實時狀態」數據——計劃路線前
  拉一次,自動剔走封咗嘅段(對應返 facilities.md 關池嗰種需求,行山版係有官方數據嘅!)
- **營地數據有 `SOURCE_OF_WATER` 欄位**——計劃露營自動答「呢個營地有冇水源」。
- 涼亭(pavilion)單獨數據 ❌ 冇——最接近係觀景點+郊野設施;
  補充可用 OSM `amenity=shelter`(Overpass)。

---

## 2. 回收點(綠在區區都喺入面)

| 數據 | 實測 | dataset_id | layer_name |
|---|---|---|---|
| **EPD 回收點總庫(8,858 個!)** | ✅ | `epd_rcd_1630899452408_9505` | `geotagging` |
| 入樽機 RVM(120 部) | ✅ | `epd_rcd_1638153978303_23086` | `RVMPS` |
| 舊衣回收箱(187 個) | ✅ | `had_rcd_1665042410524_59761` | `geotagging` |

- 總庫 8,858 個包晒**綠在區區**(回收環保站/便利點/流動點)同各類回收桶,
  有 `cp_state`(狀態)、地址中英、分區——「綠在區區喺邊+開唔開」一份數據搞掂
- 童軍環保章/社區服務:回收地圖、「屋企最近回收點」小工具,材料就係呢三份

---

## 3. 飲水機地圖(四庫合體)

| 數據 | 實測 | dataset_id | layer_name |
|---|---|---|---|
| **LCSD 場地飲水機(1,040 部)** | ✅ | `lcsd_rcd_1671530248519_33416` | `geotagging` |
| 政府場地公用飲水機(374 部) | ✅ | `epd_rcd_1638154342238_45289` | `EPDWD` |
| FEHD 場地飲水機(64 部) | ✅ | `fehd_rcd_1629969846020_11292` | `FEHD_WDPM` |
| 郊野加水站(37 個,同上表) | ✅ | `afcd_rcd_1635133835075_48993` | `WaterFillingStation_...` |

- 仲有 WSD/機管局等場地嘅細庫(CSDI 搜 "water dispenser" 有 63 個結果),
  但以上四份已覆蓋主力
- 合併四份 GeoJSON(~1,500 部)→「撲水」地圖:自備水樽行動、遠足補水規劃。
  民間本來有個「撲水 Water for Free」app,自己砌開源版材料齊晒

---

## 4. 童軍實戰配方

1. **行山安全包 PWA**:行山徑+標距柱+封閉山徑+加水站+AED(facilities.md)
   +公廁(facilities.md)六層疊喺 MapLibre 上,活動前印埋「本路線標距柱清單」
2. **露營計劃器**:營地(連水源)+郊野燒烤+觀景點 → 揀營地自動列
   「最近水源/廁所/靚景位」;配 camp booking 規則(outdoor.md)
3. **環保章社區任務**:回收點總庫+入樽機+舊衣箱 → 隊員「回收尋寶」
   打卡遊戲(配 xr-games.md 嘅 geofence 機制,一嘢變 LBS 遊戲)

---

## 一覽

16/16 dataset 實測 ✅ keyless ✅ 海外通 ✅。涼亭係唯一冇官方數據嘅項目(用 OSM 補)。
