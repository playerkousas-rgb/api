# 💰 金融經濟

## 金管局 HKMA API

- **要 Key？** ❌ 唔使
- **文件：** [apidocs.hkma.gov.hk](https://apidocs.hkma.gov.hk/)
- ⚠️ **注意：** 會封部分海外數據中心 IP（cloud server call 唔到好正常），香港本地／瀏覽器冇問題
- 支援 `pagesize` / `offset` 分頁、`from` / `to` 日期篩選

Base：`https://api.hkma.gov.hk/public/`

| 數據 | 路徑（節錄） |
|---|---|
| 每日銀行同業流動性 | `market-data-and-statistics/daily-monetary-statistics/daily-figures-interbank-liquidity` |
| 港匯指數 / 匯率（每日） | `market-data-and-statistics/monthly-statistical-bulletin/er-ir/er-eeri-daily` |
| HIBOR 拆息 | `market-data-and-statistics/monthly-statistical-bulletin/er-ir/hk-interbank-ir-daily` |
| 外匯基金票據債券 | `market-data-and-statistics/daily-monetary-statistics/...` |
| 住宅按揭統計（負資產等） | `market-data-and-statistics/monthly-statistical-bulletin/banking/...` |
| 銀行牌照名單 | `banking/register-ais-lros` |

```bash
curl "https://api.hkma.gov.hk/public/market-data-and-statistics/monthly-statistical-bulletin/er-ir/hk-interbank-ir-daily?pagesize=5"
```

## 銀行 Open Banking API（HKMA Open API Framework）

各大銀行按金管局框架開放咗產品資訊 API（存款利率、按揭、信用卡、分行/ATM 位置），**免費註冊開發者帳戶**：

| 銀行 | 開發者平台 |
|---|---|
| 滙豐 HSBC | developer.hsbc.com |
| 恒生 | developer.hangseng.com |
| 中銀香港 | 中銀開發者平台 |
| 渣打 | axess.sc.com |

Phase 1（產品資訊）免費公開；交易類 API 要合作協議。

## 其他

- **公司註冊處**：e-Search 要收費，冇免費 API；但「放債人牌照名單」等有免費 CSV（data.gov.hk）
- **差餉物業估價署**：物業市場統計（售價/租金指數）CSV — [data.gov.hk 搜 RVD](https://data.gov.hk/tc-datasets/provider/hk-rvd)
- **港交所 HKEX**：❌ 冇官方免費 API（港股報價要用第三方，睇 [non-gov.md](non-gov.md)）
