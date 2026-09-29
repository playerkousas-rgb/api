# ⚜️ WOSM / 世界童軍活動數據

> 問題：「WOSM 有冇全世界童軍組織嘅世界活動 API？」
> **誠實答案（2026-09-29 實測）：⛔ 冇官方 API**——但有四條替代路，仲有實測證據。

## 🔍 實測結果

| 途徑 | 結果 |
|---|:---:|
| `scout.org/jsonapi`（Drupal JSON:API） | ❌ 404（冇開放） |
| WOSM developer portal / open data | ❌ 唔存在 |
| `scout.org/rss.xml` | ✅ **200 有效**（新聞 RSS，非活動專屬） |
| `scout.org/sitemap.xml` | ✅ 有效（Drupal simple_sitemap） |
| `scout.org/events` 網頁 | ✅ 存在，**結構好整齊**（見下） |
| jotajoti.info | ⚠️ sandbox 連唔到（香港本地可再試） |
| ScoutLink stats API | ❌ 冇回應 |
| WAGGGS（女童軍世界會） | ❌ 同樣冇 API |

## 🛠️ 四條替代路（由易到難）

### 1️⃣ scout.org/events 網頁（數據源本尊）

活動列表結構整齊：**級別（Global/Regional/National）+ 日期 + 地點 + 主辦國**，仲分埋地區子頁（`/where-we-work/regions/europe/events` 等）。

- 冇 API 但係監察/擷取嘅理想對象
- 用 **changedetection.io**（→ [niche.md](niche.md)）盯住有新活動就通知
- 或者 **RSSHub** 自製一條 scout.org events route（開源，寫個 route 好簡單）
- ⚠️ 記得尊重 robots.txt、斯文咁 crawl

### 2️⃣ scout.org/rss.xml ✅（官方新聞 feed）

大型活動公佈（Jamboree 主辦國、報名開始）一定會出新聞——訂呢條 RSS 已經捕捉到大事：

```bash
curl "https://www.scout.org/rss.xml"
```

### 3️⃣ Wikidata SPARQL ✅（歷屆活動結構化數據）

歷屆世界大露營（class `Q1364447`）、各國總會、創辦人等全部有結構化條目，SPARQL 免費任 query（技術實測通）：

```sparql
SELECT ?item ?itemLabel ?start ?countryLabel WHERE {
  ?item wdt:P31 wd:Q1364447 .          # 世界童軍大露營
  OPTIONAL { ?item wdt:P580 ?start }
  OPTIONAL { ?item wdt:P17 ?country }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "zh,en" }
} ORDER BY DESC(?start)
```

適合做「歷屆大露營時間線/地圖」呢類教育內容。

### 4️⃣ 大活動官網逐個訂

每個大活動有獨立官網（多數冇 API），配 changedetection.io 監察：

| 活動 | 已知日期（截至 2026-09） |
|---|---|
| **JOTA-JOTI 2026** | 2026 年 10 月 16–18 日（每年十月，全球最大數碼童軍活動，200 萬人參加） |
| **第 26 屆世界大露營** | 2027 年 7 月 30 日 – 8 月 8 日，波蘭 Gdańsk |
| **世界童軍會議** | 2026 年 12 月 1–4 日，新加坡 |

## 💡 「世界童軍活動日曆」自砌方案

```
scout.org/events（changedetection 監察 / RSSHub route）
   + scout.org/rss.xml（官方公佈）
   + Wikidata（歷史數據）
   ↓  彙整落 Google Sheets / JSON
iCal feed 生成（俾團友訂閱入手機日曆）
   +  Telegram bot 有新活動推送
```

呢個「WOSM 冇做嘅 API」自己砌返出嚟，仲可以開源俾全世界童軍用——正正係空白位。

## 🔗 相關

- JOTA-JOTI 國際交流配套（時區/假期/翻譯）→ [edu-fun.md](edu-fun.md)
- 香港本地活動（康文署/HKTB）→ [niche.md](niche.md)
- 無線電/衛星（JOTA 技術面）→ 未收錄，需要時開新分類
