# 燈柱編號與地下管網 — 香港嘅民間定位網格

> 驗證日期:2026-09-29,全部經 CSDI file-api 實測(keyless、海外通)。
> 起因:問「燈柱編號/水管編號有冇 API?」——燈柱答案係勁有;水管一半有一半冇。

---

## 1. 燈柱編號 ✅ 144,873 支(路政署)

```
https://portal.csdi.gov.hk/csdi-webpage/file-api?dataset_id=hyd_rcd_1629267205229_84645&format=geojson&layer_name=Lamppost
```

- ✅ 實測 200,49MB GeoJSON,**144,873 支燈柱**
- 每支有:**`LAMP_NO`(柱身嗰個編號)**、`DISTRICT`、`PRIMARY_ST`(街道)、LAT/LONG

```json
{ "LAMP_NO": "40343", "DISTRICT": "Central & Western",
  "PRIMARY_ST": "2 & 3 GARDEN TERRACE", "LAT": 22.2756, "LONG": 114.1546 }
```

**呢個就係市區版標距柱。** 999 報案、政府部門報位置,一直都係用燈柱編號——
而家你有齊成個對照表:

- **報位工具**:輸入「44851」→ 即出座標+地圖——同標距柱 lookup(facilities2.md)
  合體就係全港覆蓋(市區燈柱+郊野標距柱)嘅報位 app
- **城市定向 checkpoint 神器**:LAMP_NO 係天然打卡證明——隊員去到抄柱上編號,
  唔使貼 QR、唔使佈置,全港 14 萬個現成 checkpoint(直插 xr-games.md 定向配方)
- ⚠️ 49MB 唔好每次 fetch:下載一次 → 按區切開 / 入 SQLite index,
  GitHub Pages 放分區 JSON 就好夠用

### 智慧燈柱系列(周邊彩蛋)

| 數據 | 實測 | file-api 參數 |
|---|---|---|
| 多功能智慧燈柱(485 支,連編號+街道) | ✅ | `dpo_rcd_1633684022403_5010` / `DPO_MFSL` |
| 智慧燈柱實時氣象(HKO,25 支,**屬性內嵌 weatherAPI 數據 URL**) | ✅ | `hko_rcd_1634873892309_46072` / `smart_lamppost` |
| 智慧燈柱空氣質素(EPD,11 支,NO/NO₂/PM2.5) | ✅ | `epd_rcd_1631501732991_89126` / `Smart_Lampposts_Air_Quality_Data_map` |

---

## 2. 水管編號 —— 一半有一半冇

### 供水管網(水務署)❌ 唔公開

同消防栓一樣,食水/沖廁水管網位置+編號**冇開放數據**(運作/保安考慮)。老實記錄。

### 但係有兩件好嘢:

**A. 爆水管實時報告 ✅(水務署)**

```
https://portal.csdi.gov.hk/csdi-webpage/file-api?dataset_id=wsd_rcd_1696487849658_94872&format=geojson&layer_name=Report_of_Main_Burst_Case
```

- ✅ 實測,當日 5 宗,有日期時間、水管直徑、食水/鹹水、座標
- 精彩位:個位置欄係用**燈柱編號**寫嘅——「西灣河 興民街 **燈柱 44851** 附近」——
  官方自己都係用燈柱做定位網格,印證第 1 節個玩法

**B. 雨水渠管網 ✅(渠務署,107,144 段!)**

```
https://portal.csdi.gov.hk/csdi-webpage/file-api?dataset_id=dsd_rcd_1629267205232_85526&format=geojson&layer_name=Pipe_Stormwater
```

- ✅ 實測,**107,144 段渠管**,有渠管編號(`FEAT_NUM` 如 SWD4027611)、物料、
  闊度、上下游沙井編號——地下世界完全機讀
- 同系仲有:沙井 Chamber、出水口 Outfall、壓力管 Rising Main
  (CSDI 搜 "stormwater" 就見成套)

---

## 3. 一覽

| 資源 | 免費 | 驗證 | 備註 |
|---|---|---|---|
| 燈柱位置+編號(HyD) | ✅ | ✅ 2026-09-29 | 144,873 支,LAMP_NO 齊 |
| 多功能智慧燈柱 | ✅ | ✅ 2026-09-29 | 485 支 |
| 智慧燈柱氣象/空氣 | ✅ | ✅ 2026-09-29 | 25+11 支,實時 |
| 供水管網編號 | — | ❌ 唔存在 | WSD 唔公開,同消防栓一樣 |
| 爆水管實時報告 | ✅ | ✅ 2026-09-29 | 位置用燈柱編號寫 |
| 雨水渠管網(DSD) | ✅ | ✅ 2026-09-29 | 107,144 段連編號 |
