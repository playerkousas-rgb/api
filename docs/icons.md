# 🎖️ 圖標 / 徽章素材庫

> 場景：章設計工具、app icon、活動海報、電子章系統。
> ✅ = 2026-09-29 實測 ｜ 全部開源/免費，授權逐個標。

## 👑 王者：Iconify API ❌ 唔使 key ✅

**一個 API 查勻 20 萬+ icon（150+ 個 icon set 全部收錄）**——唔使逐個庫學，呢個就係 icon 界嘅「總開關」：

```bash
# 直接攞 SVG（任何 set 任何 icon）
curl "https://api.iconify.design/mdi/campfire.svg"                 # ✅
curl "https://api.iconify.design/game-icons/rope-coil.svg"
curl "https://api.iconify.design/lucide/tent.svg?color=%23336633&width=64"

# 跨全部 set 搜尋（✅ 實測搜 tent 一次過回 mdi/tabler/boxicons…）
curl "https://api.iconify.design/search?query=tent&limit=20"

# 睇個 set 有咩貨（✅ 實測 game-icons 有 4133 個）
curl "https://api.iconify.design/collection?prefix=game-icons"
```

- 支援 `color`/`width`/`flip`/`rotate` query param 即時改
- 開源、可以 self-host 成個 API
- 有埋 React/Vue/Svelte 組件同 Figma plugin

## 🏕️ 章設計專用：Game-icons.net（4133 個，CC BY 3.0）✅

**同童軍章最夾嘅寶庫**——營火/繩圈/指南針/斧頭/帳幕/月桂環/盾牌底全部有：

- 官網 `game-icons.net` 可以逐個執色下載
- 經 Iconify 用 prefix `game-icons:` 直接 call
- **章底形狀都有**：`shield` 系列 / `laurel-crown` / `rosette`——章 = 底形 + 主題 icon + 文字，三層搞掂
- ⚠️ CC BY 3.0 要署名（章設計工具入面加返個 credits 頁就得）

## 🧰 UI Icon 庫（整 app 用）

| 庫 | 授權 | 數量 | CDN 直連（✅ 實測） |
|---|---|---|---|
| **Lucide** | ISC | 1500+ | `unpkg.com/lucide-static/icons/tent.svg`（要 follow redirect） |
| **Tabler** | MIT | 5800+ | `unpkg.com/@tabler/icons/icons/outline/compass.svg` |
| Heroicons | MIT | 300+ | Tailwind 御用 |
| Phosphor | MIT | 9000+ | 6 種粗細 |
| Bootstrap Icons | MIT | 2000+ | |
| Material Symbols | Apache 2.0 | 3800+ | Google 官方 |
| Font Awesome Free | CC BY 4.0 + MIT | 2000+ | 免費版已夠用 |

## 😀 Emoji SVG（全部可商用）

| 庫 | 授權 | 備註 |
|---|---|---|
| **OpenMoji** | CC BY-SA 4.0 | ✅ 實測：raw.githubusercontent 直攞彩色 SVG（🏕️=1F3D5.svg），手繪風格靚 |
| Twemoji | CC BY 4.0 | Twitter 開源 emoji |
| Noto Emoji | Apache/OFL | Google 開源 emoji |

```bash
# 露營emoji SVG
curl "https://raw.githubusercontent.com/hfg-gmuend/openmoji/master/color/svg/1F3D5.svg"
```

## 🏷️ 徽章生成器：Shields.io ❌ ✅（連中文都得！）

即時生成 badge SVG——README 章、電子證書小徽、狀態標籤：

```bash
# ✅ 實測中文正常
https://img.shields.io/badge/童軍-香港-green.svg
# 可加 logo/顏色/樣式：?style=for-the-badge&logo=github
```

## 🔤 字體（章上面嘅中文字）

| 字體 | 授權 | 備註 |
|---|---|---|
| **思源黑體/宋體（Noto Sans/Serif TC）** | SIL OFL | 中文開源字體標準答案，Google Fonts API 直接嵌 |
| **芫荽 Iansui** | SIL OFL | 教育部標準字形手寫感，台灣開源 |
| **粒線體 / 全字庫** | 開源/政府 | 特色中文字體 |
| Google Fonts API | 免費 | `fonts.googleapis.com` 一條 link 用晒 |
| Fontsource | 開源 | self-host 字體 npm 包 |

## 🖼️ 品牌 Logo：Simple Icons ❌ ✅

3000+ 品牌 logo SVG：`https://cdn.simpleicons.org/github`（social link 圖標用）

## 🔑 要免費 key 嘅

| API | 備註 |
|---|---|
| The Noun Project | 500 萬+ icon，免費 tier 要署名 |
| Flaticon | 免費要署名，API 綁 Freepik |

## 🎯 章設計工具實戰配方

```
章 = 底形（game-icons: shield/rosette/laurel）
   + 主題 icon（Iconify search 一搜即有）
   + 中文章名（思源黑體 SIL OFL）
   + 支部色系（小童軍黃/幼童軍黃/童軍綠/深資紅——色值自己定義做 theme）
```

- 全程 SVG 疊 SVG，同 [avatar.md](avatar.md) 工仔嘅做法一樣——兩個工具可以共用引擎
- ⚠️ 再提一次：**官方章係版權物**，呢啲素材係俾你設計「原創電子章/活動章」用
