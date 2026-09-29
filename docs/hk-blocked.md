# 🚫 公司封香港紀錄冊

> 呢啲服務係**公司自己封香港**（唔係香港封人）。記錄在案原因：
> ① 免得日後研究時撞牆嘥時間 ② 政策會變（Gemini 網頁版就係先例），留返個base方便覆查
> ③ 每項寫低替代路徑。**狀態截至 2026-09-29**，用前必 check 官方名單。

## 📕 封港名單

### OpenAI（2024年7月起封）

| 產品 | 狀態 | 備註 |
|---|:---:|---|
| ChatGPT（網頁/app） | ❌ | 香港 IP 封、+852 註冊唔到；登入時查 IP |
| OpenAI API | ❌ | 直連封 |
| Sora | ❌ | 跟 OpenAI 帳戶體系 |
| **替代路徑** | ✅ | **Azure OpenAI**（香港企業合規首選）、Microsoft Copilot（香港正常用）、Perplexity（香港可用，內裡可揀 GPT） |

官方名單：`platform.openai.com/docs/supported-countries`

### Anthropic Claude（一直冇支援過香港）

| 產品 | 狀態 | 備註 |
|---|:---:|---|
| Claude.ai / Claude API | ❌ | **最嚴**：每個 session 實時查 IP（唔似 OpenAI 只喺登入查）；香港號碼過唔到驗證；2025年9月仲擴大埋封全球中資機構 |
| **替代路徑** | ✅ | **AWS Bedrock**（官方雲路徑）、Microsoft 365 Copilot 內揀 Claude、Perplexity |

官方名單：`anthropic.com/supported-countries`

### Google（部分封）⚠️ 最容易中伏，逐樣睇

| 產品 | 狀態 | 備註 |
|---|:---:|---|
| Gemini 網頁版/app | ✅ **2026年3月開放咗** | 唯一解封先例！ |
| **Google AI Studio** | ❌ | 照封——好多教學教你去 aistudio 攞免費 key，香港行唔通 |
| **Gemini API**（ai.google.dev） | ❌ | AI Studio 出嘅 key 香港 IP call 唔到 |
| Google AI Pro 訂閱 | ❌* | 開放進度反覆，用前自行確認 |
| NotebookLM | ❌ | 個人版封；Workspace Enterprise 版香港用到 |
| Gemini CLI / Code Assist | ❌ | 有香港用戶報告唔可用 |
| **替代路徑** | ✅ | **Vertex AI**（Google Cloud，香港正式用到 Gemini API）、Google Workspace 付費版內嘅 Gemini 功能 |

官方名單：`ai.google.dev/gemini-api/docs/available-regions`

### Meta

| 產品 | 狀態 | 備註 |
|---|:---:|---|
| Meta AI（app/網頁/WhatsApp 內） | ❌ | 未列香港；WhatsApp 版仲會封 +852 號碼；Meta 用 IP+帳戶註冊地+裝置時區多維度檢測 |
| **替代路徑** | ✅ | Llama 模型本身開源——經 **OpenRouter / Groq / Cloudflare Workers AI / HF** 用 Llama 香港冇任何問題 |

## ✅ 確認香港原生可用（成日俾人誤會封咗）

| 服務 | 狀態 | 備註 |
|---|:---:|---|
| Microsoft Copilot | ✅ | 香港完全支援，GPT 模型合規路徑 |
| Perplexity（連 Sonar API） | ✅ | 香港直接用，仲可以掂到 GPT/Claude/Gemini |
| xAI Grok | ✅ | 原生可用 |
| Google Gemini 網頁版 | ✅ | 2026年3月起 |
| DeepSeek / Qwen / Kimi / GLM | ✅ | 國產模型全部原生 |
| GitHub（連 GitHub Models） | ✅ | 正常 |
| Hugging Face | ✅ | 正常 |
| OpenRouter | ✅ | 香港接觸海外模型嘅實用通道 |
| Poe | ✅ | 消費者聚合器 |

## 📝 未確認（記低待查）

| 服務 | 狀態 | 備註 |
|---|:---:|---|
| Midjourney | ❓ | 未搵到明確封港證據（經 Discord 用） |
| Mistral API | ❓ | 未搵到明確封港證據 |
| Cohere API | ❓ | 未搵到明確封港證據 |

## 🧭 點解會封？（背景，幫助判斷未來走向）

- 全部係**廠商商業/合規決定**（美國出口管制+國安法風險評估），唔係香港政府封鎖——香港網絡本身冇牆
- 共通 pattern：**消費者/開發者產品封，企業雲產品唔封**（Azure/Bedrock/Vertex 全部香港用到）
- 有解封先例：Gemini 網頁版 2026 年 3 月開放香港——所以呢份名單要定期覆查

## ⚠️ 對做童軍工具嘅實際含義

1. 教學文件/教班唔好教人用 AI Studio 攞 key（香港行唔通），教 OpenRouter / GitHub Models
2. 唔好將 VPN 繞路寫入正式工具或教材（違反服務條款+隨時斷）
3. 揀 AI 供應商時「香港可用」係第一篩選條件，先至輪到價錢/質素
