# 📸 圖庫 / 媒體

> 整 app/網頁/海報需要嘅相片、插圖、示意圖資源。
> ✅ = 2026-09-29 實測 ｜ 🔑 = 要免費 key ｜ ❌ = 唔使 key

## 相片圖庫

| API | Key | 實測 | 備註 |
|---|:---:|:---:|---|
| **Openverse** | ❌（基本搜尋） | ✅ | WordPress 旗下，8 億+ CC 授權圖片/聲音，**教育用途最安全**（授權清晰） |
| **Unsplash** | 🔑 免費 50 req/hr | — | 質素最高嘅免費相；demo app 夠用 |
| **Pexels** | 🔑 免費 200 req/hr | — | 相＋影片都有 |
| **Pixabay** | 🔑 免費 | — | 相/插圖/向量圖 |
| **Lorem Picsum** | ❌ | ✅ | 佔位圖神器：`https://picsum.photos/400/300` 即出隨機靚相 |
| **Wikimedia Commons** | ❌ | — | 歷史相片/地圖，用 MediaWiki API 搜 |

```bash
# Openverse 搵營火 CC 圖
curl "https://api.openverse.org/v1/images/?q=campfire&license_type=commercial"
# 佔位圖（開發 UI 用）
https://picsum.photos/seed/scout/400/300
```

## 實況相機 / 影片

→ 已收錄喺 [outdoor.md](outdoor.md)：天文台天氣照片、交通快拍、Windy Webcams、YouTube Data API

## 聲音

| API | Key | 備註 |
|---|:---:|---|
| **Freesound** | 🔑 免費 | 音效庫（鳥聲/自然聲/哨子聲），CC 授權 |
| **Xeno-canto** | ❌ | 全球雀鳥叫聲庫！配 eBird 做「聽聲認雀」：`xeno-canto.org/api/2/recordings?query=...` |

## ⚠️ 授權提示

- 教育/童軍活動用：優先揀 CC0 / CC-BY（Openverse 可以按授權 filter）
- Unsplash/Pexels 條款要求註明出處（俾埋攝影師名最好）
- 出街嘅刊物用相前 double check 每張嘅授權
