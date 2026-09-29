# 🤖 AI API — 香港可用性全攻略

> ⚠️ **香港開發者最大嘅坑就喺呢度**：三大美國 AI 廠（OpenAI / Anthropic / Google AI Studio）
> 全部唔支援香港——係佢哋公司自己封，唔係香港封佢。
> 資料截至 2026-09（呢樣嘢成日變，用之前 check 返官方 supported countries 頁）。

## 🚧 香港 AI 牆 — 邊個封、邊個唔封

### ❌ 直接用唔到（香港 IP / +852 被擋）

| 服務 | 情況 | 合規替代路徑 |
|---|---|---|
| **Google AI Studio / Gemini API** | ❌ 香港 IP 直接封（**注意：2026年3月 Gemini 網頁版開放咗俾香港，但 AI Studio 同 API 仍然封**——好多人中呢個伏！） | ✅ **Vertex AI**（Google Cloud）香港用到 |
| **OpenAI API / ChatGPT** | ❌ 2024年7月起封香港，+852 註冊唔到 | ✅ **Azure OpenAI**（Microsoft 官方路徑）、Copilot |
| **Anthropic Claude** | ❌ 唔喺 supported list，仲要係最嚴（每個 session 實時查 IP） | ✅ **AWS Bedrock** |

> 💡 記住呢條公式：**美國三大廠 = 封香港；佢哋嘅雲企業版（Vertex/Azure/Bedrock）= 香港用到**

### ✅ 香港原生可用

| 服務 | 免費情況 | 備註 |
|---|---|---|
| **DeepSeek API** | 唔算免費但極平 | 香港直接註冊用到，中文勁 |
| **阿里 Qwen（Model Studio 國際版）** | 有免費額度 | 阿里雲國際，香港 OK |
| **智譜 GLM** | GLM Flash 系有免費檔 | bigmodel.cn，香港用到 |
| **Moonshot Kimi API** | 有試用額度 | 香港用到 |
| **xAI Grok API** | 有時有免費額度 | 香港原生可用 |
| **Hugging Face Inference** | 免費 tier | 冇聽過封香港 |
| **Cloudflare Workers AI** | 每日免費額度 | 冇地區限制，仲可以做 proxy |
| **OpenRouter** | 有免費模型（如 DeepSeek free 檔） | 聚合器：一個 key 用幾十個模型，**香港用到，仲係接觸海外模型嘅實用通道** |
| **GitHub Models** | 免費（跟 GitHub 帳戶） | GitHub 香港正常用，內置多款模型試用 |
| **Poe** | 消費者產品 | 香港用到，可以摸到 Claude/GPT（但唔係開發者 API） |

## 🎯 香港童軍工具嘅實戰建議

1. **首選 OpenRouter / GitHub Models**：一個 key 玩晒，免費模型夠 demo 用，香港冇障礙
2. **中文任務用國產模型**：DeepSeek / Qwen / GLM 中文好、平、香港冇牆
3. **要 Gemini 就行 Vertex AI**：Google Cloud 免費 credit 都用到，只係設定繁複啲
4. **咪嘥時間 VPN 註冊 OpenAI/Claude 個人帳戶**：違反佢條款，隨時 ban 帳戶，唔啱攞嚟做正式工具

## 影像辨識（童軍場景，香港冇問題嘅）

| 用途 | 方案 | HK |
|---|---|:---:|
| 🌿 影相認植物 | **Pl@ntNet API**（免費 500 次/日）→ [world-scout.md](world-scout.md) | ✅ |
| 🦜 影相認雀/物種 | iNaturalist computer vision | ✅ |
| 🍄 通用辨識 | Qwen-VL / GLM-4V（國產 vision 模型）、HF 開源模型 | ✅ |
| ☁️ 雲種辨識 | HF 現成 cloud classification 模型 | ✅ |

## 語音（香港可用）

| 用途 | 方案 | HK |
|---|---|:---:|
| 語音轉文字（支援廣東話） | HF Whisper 模型、Azure Speech 免費層 | ✅ |
| 文字轉語音（有粵語聲） | Edge TTS（免費）、Azure TTS 免費層 | ✅ |

## ⚠️ 通用注意

1. **Rate limit 好緊**——加 cache，同一條問題咪問兩次
2. **API key 千祈咪擺落 client side**——經 Cloudflare Workers（免費）做 proxy
3. 俾青少年用嘅 app 要加 content filter
4. **地區政策成日變**（例：Gemini 網頁版 2026 年 3 月先開放香港）——出 production 前 check 官方名單：
   - OpenAI: platform.openai.com/docs/supported-countries
   - Anthropic: anthropic.com/supported-countries
   - Google: ai.google.dev/gemini-api/docs/available-regions
