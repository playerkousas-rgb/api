# 🗺️ 地圖地理

## 地址查詢服務 ALS（政府資科辦）✅

打中/英文地址 → 標準地址 + 座標（HK1980 網格 + WGS84），**唔使 Key**：

```bash
curl -H "Accept: application/json" \
  "https://www.als.gov.hk/lookup?q=旺角彌敦道546號&n=3"
```

超好用：地址標準化、拆樓名/街道/地區，仲有埋 GeoAddress ID。

## 地點搜尋 API（地政總署 GeoData）

打地點名 → 座標（似政府版 geocoding search）：

```bash
curl "https://geodata.gov.hk/gs/api/v1.0.0/locationSearch?q=旺角"
```

⚠️ 呢個 endpoint 喺部分海外伺服器連唔到，香港本地正常。

## 空間數據共享平台 CSDI

[portal.csdi.gov.hk](https://portal.csdi.gov.hk) — 幾百個免費地理圖層，支援 **GeoJSON / WFS / WMS / API**：

- 樓宇輪廓、地段界線、行政區界（區議會分區等）
- 全港設施點：學校、診所、街市、公廁、垃圾站、充電站……
- 唔使 key，直接 REST call 或落 GeoJSON

## 搵最近設施 API（DATA.GOV.HK）

```bash
# 最近 5 間學校
curl "https://api.data.gov.hk/v1/nearest-schools?lat=22.2812&long=114.1659&max=5"
```

## 🔑 香港地圖服務 2.0（地政總署）— 唯一要 Key 嘅

官方地圖底圖（地形圖/影像 tiles、Vector tiles）、地圖 API：

1. 去 [api.portal.hkmapservice.gov.hk](https://api.portal.hkmapservice.gov.hk) **免費註冊**
2. 攞 API Key 之後可以用官方 basemap 做 web map（配 Leaflet / OpenLayers / Mapbox GL）

如果唔想註冊，可以用 OpenStreetMap 代替（睇 [non-gov.md](non-gov.md)）。

## 座標系統小知識

政府數據常見兩種座標：
- **HK1980 Grid**（northing/easting，例如 ALS 回傳）
- **WGS84**（普通 lat/lng）

轉換可以用 CSDI 嘅轉換工具，或者 Python `pyproj`（EPSG:2326 ↔ EPSG:4326）。
