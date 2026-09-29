# 📜 證書生成 — 嘉許狀/獎狀/證書 Pipeline

> ✅ **本 repo 已有實戰示範**：[`demo/證書生成示範.pdf`](../demo/證書生成示範.pdf)
> —— Python ReportLab + 開源 Noto Sans TC + QR 驗證碼，2026-09-29 實際生成。

## 🛠️ 生成引擎（全部開源/免費）

### Python 路線

| 庫 | 特點 |
|---|---|
| **ReportLab** ✅ 已示範 | 逐筆畫 PDF，控制力最強。**坑位實錄：唔食 CFF outline 字體**（系統 NotoSerifCJK.ttc 會報 `postscript outlines are not supported`）——用 **Google Fonts 版 Noto Sans TC 嘅 TTF** 就冇事 |
| **WeasyPrint** | HTML+CSS → PDF：證書排版用 CSS 寫，設計師友好 |
| **fpdf2** | 輕量簡單 |

### JS 路線

| 庫 | 特點 |
|---|---|
| **pdf-lib** | 瀏覽器入面直接生成——**證書生成器可以做成純前端網頁，零 server** |
| jsPDF | 老牌 |
| Puppeteer/Playwright | HTML 排版 → print to PDF，最靚最自由 |

### 模板路線（唔使識排版 code）

| 工具 | 特點 |
|---|---|
| **docxtemplater** | Word 整靚個模板 → 塞名/日期 → 出 docx/PDF。**領袖自己都改到模板** |
| **Carbone** | 同類，開源版免費 |
| **Typst** | 新世代開源排版語言（LaTeX 後繼者）——證書代碼化，Git 管理版本 |
| Google Slides + Apps Script | 零 code：Slides 做模板 + Sheets 名單 mail-merge，教會其他領袖用最快 |

### Self-host API（俾成個團隊用）

- **Gotenberg**：HTML/Office → PDF 嘅 Docker API → [niche.md](niche.md)
- **Stirling-PDF**：生成後嘅合併/壓縮/水印 → [niche.md](niche.md)

### 免費層 SaaS（唔想搞 infra）

| 服務 | 免費層 |
|---|---|
| APITemplate.io | 每月 50 張 |
| CraftMyPDF | 每月 100 張 |
| PDFMonkey | 每月 300 張 |

## 🔐 證書驗證體系（防偽）

三個層次，由淺入深：

1. **QR + 編號**（已示範）：證書印 QR → 指去驗證頁（GitHub Pages 靜態頁 + JSON 紀錄檔就得，零成本）
2. **Open Badges baked 證書**：metadata 烘入證書圖，行業標準可攜帶 → [gamification.md](gamification.md)
3. **區塊鏈級**（政府在用嘅開源方案）：**OpenCerts**（新加坡 GovTech 開源）/ **Blockcerts**（MIT Media Lab 標準）——文憑級防僞，開源任用

## 🏭 批量生成 Pipeline 範本

```
Google Sheets（名單：姓名/獎項/日期）
   ↓  Python script（ReportLab 逐個生成，見 demo）
PDF × N 張（檔名 = 編號）
   ↓
驗證紀錄 JSON → GitHub Pages 驗證頁
   ↓
派發：email（Resend 免費層）或 Telegram bot 逐個推
```

成條 pipeline **$0**，一次過出成百張。

## 🔤 字體注意（中文證書必讀）

- 開源中文字體：**Noto Sans/Serif TC**（SIL OFL）→ [icons.md](icons.md) 有更多
- ⚠️ 實測坑：ReportLab/fpdf2 只食 **TrueType outline**（glyf）——Adobe/Noto 官方 OTF/OTC 係 CFF 會死，**去 Google Fonts 下載 TTF 版**就穩
- 書法感可以用「芫荽 Iansui」（OFL）
