# 🚌 交通運輸

全部 ❌ 唔使 Key。ETA 建議每 10–30 秒 poll 一次就夠。

## 巴士 / 小巴 實時到站 ETA

### 九巴 + 龍運 KMB/LWB ✅

Base：`https://data.etabus.gov.hk/v1/transport/kmb`

```bash
curl "https://data.etabus.gov.hk/v1/transport/kmb/route/"          # 全部路線
curl "https://data.etabus.gov.hk/v1/transport/kmb/stop"            # 全部車站（連座標）
curl "https://data.etabus.gov.hk/v1/transport/kmb/route-stop/1A/outbound/1"  # 路線沿途站
curl "https://data.etabus.gov.hk/v1/transport/kmb/stop-eta/{STOP_ID}"        # 該站所有 ETA
curl "https://data.etabus.gov.hk/v1/transport/kmb/eta/{STOP_ID}/1A/1"        # 指定路線 ETA
```

### 城巴 CTB (v2) ✅

Base：`https://rt.data.gov.hk/v2/transport/citybus`

```bash
curl "https://rt.data.gov.hk/v2/transport/citybus/route/ctb"                 # 全部路線
curl "https://rt.data.gov.hk/v2/transport/citybus/route-stop/CTB/1/outbound" # 沿途站
curl "https://rt.data.gov.hk/v2/transport/citybus/stop/{6位數字站ID}"        # 站資料
curl "https://rt.data.gov.hk/v2/transport/citybus/eta/CTB/{站ID}/{路線}"     # ETA
```

### 綠色專線小巴 GMB ✅

Base：`https://data.etagmb.gov.hk`

```bash
curl "https://data.etagmb.gov.hk/route"                    # 全部路線 (HKI/KLN/NT)
curl "https://data.etagmb.gov.hk/route/HKI/1"              # 路線詳情
curl "https://data.etagmb.gov.hk/eta/route-stop/{route_id}/{stop_seq}"  # ETA
```

### 新大嶼山巴士 NLB

```bash
curl "https://rt.data.gov.hk/v2/transport/nlb/route.php?action=list"
curl "https://rt.data.gov.hk/v2/transport/nlb/stop.php?action=list&routeId=1"
```

## 港鐵 MTR

### 重鐵下一班車 Next Train ✅

```bash
# line = 線路代碼 (TKL/ISL/TWL/KTL/EAL/TML/SIL/TCL/AEL/DRL)
# sta  = 車站 3 字代碼 (CEN/TST/TIK...)
curl "https://rt.data.gov.hk/v1/transport/mtr/getSchedule.php?line=TKL&sta=TIK"
```

### 輕鐵 LRT

```bash
curl "https://rt.data.gov.hk/v1/transport/mtr/lrt/getSchedule?station_id=1"
```

### 港鐵巴士 ✅

```bash
curl -X POST "https://rt.data.gov.hk/v1/transport/mtr/bus/getSchedule" \
  -H "Content-Type: application/json" \
  -d '{"language":"zh","routeName":"K66"}'
```

## ✈️ 機場航班資訊（機管局）✅

冇 key、JSON、有齊航班狀態/閘口/行李帶：

```bash
# arrival=true 抵港 / false 離港；cargo=false 客機
curl "https://www.hongkongairport.com/flightinfo-rest/rest/flights/past?date=2026-09-29&lang=zh_HK&cargo=false&arrival=true"
```

數據集頁：[data.gov.hk 搜 "flight information"](https://data.gov.hk/tc-datasets?q=flight)

## 🅿️ 泊車 — 停車場空置車位 ✅

```bash
curl "https://api.data.gov.hk/v1/carpark-info-vacancy?data=vacancy&lang=zh_TW"   # 實時空位
curl "https://api.data.gov.hk/v1/carpark-info-vacancy?data=info&lang=zh_TW"      # 停車場資料
```

## 📷 運輸署 — 路面實況

```bash
# 交通快拍 CCTV 鏡頭清單（連圖片 URL，每 2 分鐘更新）✅
curl "https://static.data.gov.hk/td/traffic-snapshot-images/code/Traffic_Camera_Locations_Tc.csv"

# 特別交通消息（封路/事故）✅
curl "https://resource.data.one.gov.hk/td/en/specialtrafficnews.xml"
```

其他（行車速度圖、主要幹道行車時間、隧道車流）：喺 [DATA.GOV.HK 運輸分類](https://data.gov.hk/tc-datasets/category/transport) 有直接 resource URL（網址間中會改版，以數據集頁為準）。

## ⛴️ 渡輪

新渡輪 / 富裕小輪等 ETA 喺 DATA.GOV.HK 搜 ["ferry"](https://data.gov.hk/tc-datasets?q=ferry)。

## 📊 全部交通數據一覽

一站式參考：[DATA.GOV.HK 實時交通數據專頁](https://data.gov.hk/tc-data/dataset?q=real-time)
