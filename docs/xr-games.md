# 🕶️ 3D / AR / 實境遊戲

> 場景：睇相估地方（GeoGuessr 類）、香港城市定向解謎、實境射擊、3D 香港。
> ✅ = 2026-09-29 實測 ｜ 🔑 = 免費 key ｜ ❌ = 唔使 key

## 📸 「睇相估地方」遊戲（GeoGuessr 類）

> 你講嗰個日本比賽就係呢類——GeoGuessr 本尊要收費又冇公開 API，但自己砌反而簡單。

### 核心 = 相片庫 + 地圖估點 + 計距離

| 相片來源 | Key | 實測 | 備註 |
|---|:---:|:---:|---|
| **Mapillary**（Meta 開放街景） | 🔑 免費 | ✅ API alive | 眾包街景，**香港有大量影像**，CC BY-SA。GeoGuessr 開源替代品都係用佢 |
| **KartaView** | 🔑 免費 | — | 同類開放街景 |
| Google Street View Static API | 🔑 有免費 credit | — | 影像最靚但要俾錢心理準備 |
| **Wikimedia Commons 地理標記相** | ❌ | — | 用 MediaWiki API 查某座標附近嘅 CC 相——**歷史香港相都有** |
| **自己影** | ❌ | — | 香港版最好玩嘅做法：領袖影 50 張旅程/營地/街角相，位置自己知 |

### 現成開源底

- **GeoGuess**（open-source GeoGuessr clone，GitHub）——fork 嚟改
- 計分核心一條式：**Turf.js** `distance(估點, 真點)` → 距離轉分數
- 地圖用 **Leaflet / MapLibre**（免費開源）

## 🏙️ 3D 香港

| 資源 | Key | 備註 |
|---|:---:|---|
| **政府三維數據（CSDI / 地政總署）** | ❌ | **寶藏**：香港 3D 建築模型（LOD1）、3D 行人網絡免費落地；`3d.map.gov.hk` 係官方 3D 地圖示範。⚠️ 部分 geo 站封海外 IP，香港本地正常 |
| **MapLibre GL** ✅ | ❌ | 開源地圖引擎，**樓宇 extrusion 一開就有 3D 香港**（用 OSM 樓宇數據，香港樓密效果一流） |
| **CesiumJS** | ion 有免費 tier | 開源 3D 地球引擎（衞星視角飛入香港嗰種） |
| Google Photorealistic 3D Tiles | 🔑 $ | 實景 3D，靚但收費 |
| OSM Buildings | — | ⚠️ 實測佢 tile server 403，直接用 MapLibre extrusion 代替 |

## 🕶️ AR 實境（城市定向解謎核心技術）

| 工具 | 授權 | 實測 | 備註 |
|---|---|:---:|---|
| **AR.js** | 開源（MIT） | ✅ CDN 通 | **Web AR 王者**：唔使裝 app，手機瀏覽器直接玩。有 **location-based AR 模式**——「行到指定座標先見到虛擬寶箱」就係呢個 |
| **MindAR** | 開源 | — | 圖像追蹤 web AR：**影住張海報/隊徽 pop 出 3D 嘢**——解謎關卡神器 |
| **WebXR API** | 瀏覽器原生 | — | 底層標準，免費 |
| **`<model-viewer>`** | Google 開源 | — | 一個 HTML tag 顯示 3D 模型＋AR 放落現場 |
| **Niantic Lightship** | 免費 tier | — | **Pokémon GO 同廠技術**：VPS 視覺定位、multiplayer AR（要 Unity） |
| Unity AR Foundation | 個人免費 | — | 正規 app 路線 |

## 📍 位置遊戲機制（定向/尋寶/射擊）

| 零件 | 方案 | 備註 |
|---|---|---|
| 玩家喺邊 | 瀏覽器 **Geolocation API**（免費原生） | PWA 就攞到 GPS |
| 到咗 checkpoint 未 | **Turf.js**（開源 geo 計算庫） | `booleanPointInPolygon` / `distance` 一句判定 |
| Checkpoint 從何來 | **Overpass**（→ [world-scout.md](world-scout.md)） | 全港涼亭/雕像/廟宇 POI 攞嚟做關卡 |
| 實體關卡 | QR Server（→ [glue.md](glue.md)） | 貼 QR 喺現場，掃咗先開下一關 |
| 國際尋寶網絡 | **Opencaching OKAPI** ✅（87,351 個 cache） | 🔑 免費 consumer key，開放版 geocaching |
| 對戰同步 | **Supabase Realtime**（→ [glue.md](glue.md)）/ **Colyseus**（開源遊戲 server） | 實境射擊嘅「邊個射中邊個」就係靠實時同步 |
| 方向感應 | Device Orientation API（免費原生） | 指南針/舉機瞄準 |

## 🧱 3D 素材（配 avatar.md 用）

| 庫 | 授權 | 實測 | 備註 |
|---|---|:---:|---|
| **Poly Haven** | **CC0** | ✅ API 通 | 模型/HDRI/材質，質素電影級：`api.polyhaven.com/assets` |
| **Sketchfab API** | 逐件睇（好多 CC） | ✅ 搜尋通 | 幾百萬個模型，search API 公開，download 要免費 OAuth |
| **Quaternius** | CC0 | — | Low-poly 人物/場景包，遊戲風 |
| **Kenney** | CC0 | — | → [avatar.md](avatar.md) |

## 🎮 引擎速查

| 引擎 | 授權 | 適合 |
|---|---|---|
| **Godot** | 開源（MIT） | 2D/3D 都得，共享精神啱童軍開源工具 |
| **Phaser** | 開源 | 2D web 遊戲（配 LPC 像素工仔！） |
| **Three.js / Babylon.js** | 開源 | Web 3D 底層 |
| PlayCanvas | 免費 tier | Web 3D 有編輯器 |
| Unity / Unreal | 個人免費 | 正規 app/靚graphics |

## 🎯 三個實戰配方

### ① 香港城市定向解謎（你講嗰類 app 嘅開源版）
```
PWA 網頁（唔使上架 app store）
+ Geolocation + Turf.js geofence（行到先解鎖）
+ AR.js location-based（現場 pop 3D 提示）
+ QR 實體關卡 + Supabase 記進度/排行榜（→gamification.md）
```

### ② 香港版 GeoGuessr
```
自影相庫/Mapillary + Leaflet 地圖俾人撳
+ Turf.distance 計分 + Dreamlo 排行榜
歷史模式：Wikimedia Commons 舊香港相「估下呢度係邊」
```

### ③ 實境射擊（簡化版）
```
Device Orientation 瞄準 + Geolocation 定位
+ Supabase Realtime 同步命中 + 章/積分獎勵（→gamification.md）
⚠️ 公眾地方玩要考慮安全同觀感，室內營地場景較穩
```

## ⚠️ 位置遊戲安全提醒（俾青少年玩必讀）

- 關卡避開馬路/危險位；行進中鎖屏提示「停低先睇」
- 位置數據係個人資料——記分唔記軌跡，PDPO 意識
- 夜間活動加光/結伴機制
