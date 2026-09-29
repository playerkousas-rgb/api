# 🎓 教育・題庫・趣味

> 集會遊戲、訓練 quiz、文化教育用嘅 API。
> ✅ = 2026-09-29 實測 ｜ 🔑 = 要免費 key ｜ ❌ = 唔使 key

## 題庫 / 遊戲

| API | Key | 實測 | 備註 |
|---|:---:|:---:|---|
| **Open Trivia DB** | ❌ | ✅ | 4000+ 條選擇題，24 個分類（地理/科學/歷史），可以揀難度——集會quiz現成題庫（英文） |
| **Deck of Cards** | ❌ | ✅ | 虛擬啤牌：洗牌/派牌/記狀態，整卡牌遊戲零成本 |
| **PokéAPI** | ❌ | ✅ | 寵物小精靈全數據——教細路仔玩 API 嘅最佳教材 |
| **xkcd** | ❌ | ✅ | 每日科學漫畫 JSON |
| JokeAPI / Advice Slip | ❌ | — | 冷笑話/金句（英文） |

```bash
# 一條地理題
curl "https://opentdb.com/api.php?amount=10&category=22&difficulty=easy"
# 開新牌局
curl "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
```

## 圖書 / 文化

| API | Key | 實測 | 備註 |
|---|:---:|:---:|---|
| **Open Library** | ❌ | ✅ | 4000萬+ 書目：實測搜 "Scouting for Boys" 有 498 個結果！有書封面圖 API |
| **Google Books** | 🔑 建議申請 | ⚠️ | 唔使 key 都得但共用 quota 好易 429，正式用要免費 key |
| **Met Museum**（紐約大都會） | ❌ | ✅ | 47 萬件藝術品開放圖像 |
| **Art Institute of Chicago** | ❌ | — | 同類，芝加哥美術館 |
| **Wikipedia / Wikidata** | ❌ | ✅ | 見 [world-scout.md](world-scout.md) |

```bash
# 搵書＋封面
curl "https://openlibrary.org/search.json?q=knots&limit=5"
# 封面圖：https://covers.openlibrary.org/b/isbn/{ISBN}-M.jpg
```

## 語言學習

| API | Key | 實測 | 備註 |
|---|:---:|:---:|---|
| **Free Dictionary** | ❌ | — | 英文釋義/音標/發音：`api.dictionaryapi.dev` |
| **MyMemory 翻譯** | ❌（免費額度） | ✅ | 免費 tier 每日 5000 字；⚠️ 質素一般（實測 scout 譯咗做「偵察兵」😅），正經嘢用 DeepL |
| **DeepL API Free** | 🔑 | — | 每月 50 萬字符免費，中文質素好 |
| **LibreTranslate** | ❌（self-host） | — | 開源翻譯，自己 host 無限用 |

## 🌍 全球假期 / 時區（國際交流）

| API | Key | 實測 | 備註 |
|---|:---:|:---:|---|
| **Nager.Date** | ❌ | ✅ | 全球 100+ 國家公眾假期（實測日本 2026 回晒「元日」等）——JOTA-JOTI 約時間必備 |
| **timeapi.io** | ❌ | ✅ | 時區/當地時間（WorldTimeAPI 成日死，用呢個穩陣啲） |

```bash
# 日本 2026 假期
curl "https://date.nager.at/api/v3/PublicHolidays/2026/JP"
# 而家英國幾點
curl "https://timeapi.io/api/time/current/zone?timeZone=Europe/London"
```

## 💡 教育工具點子

| 工具 | 配搭 |
|---|---|
| 🎯 **集會 quiz 機**：搶答計分 | Open Trivia + 自建童軍知識題庫 |
| 🃏 **分組抽籤器** | Deck of Cards |
| 📚 **章目閱讀清單**：搵書＋封面＋圖書館連結 | Open Library + 公共圖書館數據 |
| 🌏 **JOTA-JOTI 對接站**：對方國家而家幾點+假期+國旗+你好點講 | timeapi + Nager.Date + Wikipedia |
