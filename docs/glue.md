# 🧰 後端膠水・自動化

> 將啲 API 砌成完整工具需要嘅「膠水」：數據庫、通知、排程、部署——全部有免費層。

## 零成本後端

| 服務 | 免費層 | 適合 |
|---|---|---|
| **Google Sheets API** 🔑 | 免費 | **旅團神器**：報名表/點名/物資清單直接當數據庫，領袖用慣 Excel 介面 |
| **Google Forms + Apps Script** | 免費 | 收表→自動處理→出通知，零 server |
| **Supabase** 🔑 | 免費層（Postgres+登入+API） | 正經 app 後端 |
| **Firebase** 🔑 | 免費層 | 手機 app 推送+數據庫 |
| **Cloudflare Workers** 🔑 | 每日 10 萬次請求免費 | 做 API proxy/cache/藏 key |
| **GitHub API + Actions** | 免費 | 定時任務（cron）、靜態網站自動更新——「當年今日」每朝自動 build 就係用呢招 |

## 通知推送

| 服務 | Key | 備註 |
|---|:---:|---|
| **Telegram Bot API** | 🔑 免費 | 主力推薦：群組通知/指令互動/inline查詢全部免費無限 |
| **ntfy.sh** | ❌ | 一句 curl 推去手機，連註冊都唔使 |
| **Discord Webhook** | 🔑 免費 | 年輕成員可能多用 Discord |
| Email（Resend/Brevo） | 🔑 免費層 | 每日幾百封免費 |

## 實用小工具 API

| API | Key | 實測 | 用途 |
|---|:---:|:---:|---|
| **QR Server** | ❌ | — | 生成 QR：簽到/尋寶/物資標籤 |
| **timeapi.io** | ❌ | ✅ | 時區換算 |
| **ip-api.com** | ❌ | — | IP 定位（非商用免費） |
| is.gd 短網址 | ❌ | ⚠️ 實測間中出錯 | 後備：tinyurl API |
| **Nominatim** | ❌ | — | 地名→座標，見 [world-scout.md](world-scout.md) |

```bash
# 生成活動簽到 QR
curl "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=https://your-form-link" -o checkin.png
# ntfy 推通知去手機（訂閱咗 topic 就收到）
curl -d "聽日集隊記得帶指南針!" ntfy.sh/your-troop-topic
```

## 排程（免費 cron）

- **GitHub Actions schedule**：最穩，每 5 分鐘級
- **Cloudflare Workers Cron Triggers**：免費層有
- cron-job.org：免費網頁版 cron

## 🏗️ 零成本架構範本（旅團工具通用）

```
數據源（政府API/eBird/...）
   ↓  GitHub Actions 定時抓
Google Sheets / JSON on GitHub Pages   ← 儲存
   ↓
GitHub Pages 靜態網頁（免費 host）     ← 展示
   +
Telegram Bot（Cloudflare Workers 托管） ← 通知/互動
```

成套嘢 **$0/月**，唔使管 server。
