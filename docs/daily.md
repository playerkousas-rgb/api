# 🛒 日常方便

> 買餸格價、食譜、卡路里營養呢類「日日用得着」嘅 API。
> ✅ = 2026-09-29 實測 ｜ 🔑 = 要免費 key ｜ ❌ = 唔使 key

## 💰 格價

### 消委會「網上價格一覽通」❌ ✅ 寶藏！

全港超市（百佳/惠康/HKTVmall 等）**逐件產品每日價格**，一個 JSON 攞晒：

```bash
curl -L "https://online-price-watch.consumer.org.hk/opw/opendata/pricewatch.json"
```

- 有齊產品名（三語）、條碼、各超市價錢、優惠
- 配歷史檔案 API（見 [platform.md](platform.md)）可以做**價格走勢追蹤**
- 油價版見 [civic.md](civic.md)

## 🍳 食譜

| API | Key | 實測 | 備註 |
|---|:---:|:---:|---|
| **TheMealDB** | ❌（dev key `1` 免費） | ✅ | 300+ 食譜連相、逐步教學、食材清單；有隨機食譜 endpoint（「今晚食乜」神器） |
| Spoonacular | 🔑 免費 150 點/日 | — | 食譜+營養+餐單規劃，功能最全 |
| Edamam | 🔑 免費 tier | — | 食譜搜尋+營養分析 |

```bash
# 搵雞食譜
curl "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken"
# 隨機一味（營火晚餐抽獎!）
curl "https://www.themealdb.com/api/json/v1/1/random.php"
```

## 🔥 卡路里 / 營養

### Open Food Facts ❌ ✅ — 掃 barcode 出營養標籤

```bash
curl "https://world.openfoodfacts.org/api/v2/product/{條碼}.json?fields=product_name,nutriments"
```

- 實測：國際產品（可樂 5449000000996）有齊卡路里/糖/鈉 ✅
- ⚠️ **香港本地產品覆蓋一般**（實測維他系 barcode 搵唔到）——可以鼓勵大家一齊貢獻返上去
- 姊妹庫：Open Beauty Facts、Open Products Facts

### USDA FoodData Central 🔑 免費 ✅

美國農業部官方營養數據庫，**通用食材超準**（香蕉/雞胸/白飯呢啲）：

```bash
# DEMO_KEY 可以直接試（有限額），正式用去 api.nal.usda.gov 免費攞 key
curl "https://api.nal.usda.gov/fdc/v1/foods/search?query=banana&pageSize=3&api_key=DEMO_KEY"
```

### 其他

| API | Key | 備註 |
|---|:---:|---|
| API Ninjas（Nutrition/Calories Burned） | 🔑 免費 tier | 輸入文字回營養；仲有「行山 60 分鐘燒幾多卡」呢類運動消耗 |
| Nutritionix | 🔑 免費 tier | 自然語言input（"2 eggs and toast"） |

## 📦 日常其他（已收錄，跳去睇）

- 公眾假期 → [civic.md](civic.md)
- 匯率 Frankfurter → [non-gov.md](non-gov.md)
- 英文字典 dictionaryapi.dev → [world-scout.md](world-scout.md)
- QR code 生成 → [non-gov.md](non-gov.md)
- 天氣/交通/急症室 → 各自分類

## 💡 日常工具點子

| 工具 | 配搭 |
|---|---|
| 🛒 **買餸格價 app**：掃條碼→邊間超市最平＋歷史低價 | 消委會價格 + 歷史檔案 API + Open Food Facts |
| 🍱 **營火餐單計算機**：人數→食材採購清單＋總卡路里 | TheMealDB + USDA |
| 🥗 **卡路里日記**：掃 barcode 記錄 | Open Food Facts + USDA fallback |
