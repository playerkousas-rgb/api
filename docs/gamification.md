# 🏆 遊戲化系統 — 積分/排行榜/成就

> 場景：旅團積分賽、電子章系統、訓練進度、習慣養成。
> ✅ = 2026-09-29 實測 ｜ 核心心法：**電子章行國際標準，排行榜由簡入繁**。

## 🎖️ 電子章嘅正規做法：Open Badges 國際標準

**1EdTech Open Badges**——全球教育界電子章標準（美國童軍/大學/MOOC 都用緊）：

- 章 = PNG/SVG 圖 + **烘焙（bake）入去嘅 metadata**：邊個發、發俾邊個、憑咩準則、幾時發
- **可驗證**：任何人攞住個章檔案都可以驗真僞
- 章可以「攜帶」——擺入 badge wallet、LinkedIn、CV

| 工具 | 類型 | 備註 |
|---|---|---|
| **Badgr / Canvas Credentials** | 免費 tier + **開源 server**（`badgr-server`，Python） | 最主流發章平台，self-host 完全免費 |
| **openbadges-bakery** | npm 庫 | 自己寫 code 將 metadata 烘入章圖 |
| Open Badge Factory | 商業 | 歐洲學校常用 |

> 💡 同 [icons.md](icons.md) 章設計配方直接駁通：設計 SVG 章 → bake metadata → 發章。

## 🏫 一站式平台（自host）

| 平台 | 備註 |
|---|---|
| **Moodle** | 開源 LMS 王者——**內建 Open Badges 發章**、積分、等級、進度追蹤、排行榜 plugin 齊全。訓練班/考章課程一站搞掂，中文介面現成 |
| **Habitica** ✅ | 開源「習慣養成 RPG」：日常任務變打怪升級。有公開 API（實測 alive，要加 `x-client` header）；可 self-host。**隊員日行八千步/每日整理背囊呢類挑戰一流** |
| BadgeOS | WordPress 發章 plugin | 有 WP 網站就順手 |

## 🎮 遊戲後端 API（排行榜/成就即用）

| 服務 | 免費情況 | 實測 | 備註 |
|---|---|:---:|---|
| **Dreamlo** | 免費 | ✅ | **最簡排行榜**：一條 URL 加分、一條 URL 攞榜，indie 遊戲界名物——prototype 五分鐘搞掂 |
| **PlayFab**（Microsoft） | 免費層 10 萬 MAU | — | 正規遊戲後端：排行榜/成就/虛擬貨幣/統計，香港用到 |
| **LootLocker** | 免費層 | — | 同類，較新較易用 |
| **GameJolt API** | 免費 | ✅ | 積分榜+trophies（成就）系統，適合放喺佢平台嘅遊戲 |

```
# Dreamlo 用法概念（註冊攞兩條 key）
加分:  http://dreamlo.com/lb/{private_key}/add/{玩家名}/{分數}
攞榜:  http://dreamlo.com/lb/{public_key}/json
```

## 🔧 自砌路線（最啱旅團實情）

| 方案 | 備註 |
|---|---|
| **Google Sheets + Apps Script** | 最貼地：領袖入分落 Sheet → script 出排行榜網頁/Telegram 推送。零成本零學習成本 |
| **Supabase** | 正經 app：Postgres 排行榜 + Row Level Security + realtime 訂閱（實時榜！）→ [glue.md](glue.md) |
| 積分邏輯設計 | 參考 Habitica 開源 code：串連（streak）獎勵、隊伍 boss 戰等機制直接抄得 |

## 🎯 童軍電子章系統建議架構

```
章設計（icons.md 配方 SVG）
   ↓
Open Badges bake（openbadges-bakery / badgr-server）
   ↓
發章紀錄（Google Sheets 或 Supabase）
   ↓
隊員 badge wallet 頁（GitHub Pages 免費 host）
   +
排行榜（Dreamlo prototype → Supabase 正式版）
```

⚠️ 提醒：正式**考章紀錄係總會制度**，電子章系統定位做「旅團內部獎勵/活動章」最穩陣。
