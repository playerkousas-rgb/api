# 🧑‍🎨 人物 Avatar / 臉型髮式動作 素材庫

> 目標場景：**可以換制服＋章嘅童軍工仔開源工具**。
> 外國呢瓣好成熟，分四條路線：組件式 SVG／即用 API／像素遊戲式／3D。
> ✅ = 2026-09-29 實測 ｜ 授權好重要，每項都標明。

## 🅰️ 組件式 SVG 插畫庫（★ 最啱「換衫換章」玩法）

呢類庫嘅設計理念就係「人物 = 圖層疊圖層」：臉型/髮式/表情/衫/配件全部係獨立組件，任砌任換——你只需要**自己畫多一層「童軍制服＋領巾＋章」組件**就變成童軍工仔生成器。

| 庫 | 授權 | 有啲乜 |
|---|---|---|
| **Open Peeps**（Pablo Stanley） | **CC0！完全免費任改任商用** | 手繪風：頭×髮型×鬍鬚×表情×衫，仲有**成身 pose（企/坐/行）**——換制服最理想嘅起點 |
| **Avataaars**（Pablo Stanley） | Free（個人+商用） | 卡通半身：臉型/髮式/眼耳口/衫/飾物，Sketch/Figma 組件齊 |
| **Humaaans**（Pablo Stanley） | Free（個人+商用） | 全身人物 mix-match，**專為換衫換褲設計**，姿勢可調 |
| **Open Doodles** | CC0 | 手繪 sketch 風全身動作 |

> 💡 三個都係同一個作者 Pablo Stanley——外國設計圈無人不識，香港真係少人講。

## 🅱️ Avatar API（即 call 即有）

### DiceBear ❌ 唔使 key ✅ 實測通

開源 avatar 引擎，**30+ 風格**（包括 Avataaars/Adventurer/Notionists/Pixel Art…），全部 query param 客製：

```bash
# 基本：seed 決定隨機樣
curl "https://api.dicebear.com/9.x/avataaars/svg?seed=scout"

# 指定髮型+衫+衫色（✅ 實測有效）
curl "https://api.dicebear.com/9.x/avataaars/svg?seed=scout&top=shortCurly&clothing=collarAndSweater&clothesColor=3c4f5c"

# 每個風格有 schema 列晒所有可調選項（✅ 實測）
curl "https://api.dicebear.com/9.x/avataaars/schema.json"
```

- 回 SVG/PNG/WebP；有 JS 庫可以完全 offline 生成；**可以 self-host**
- ⚠️ 授權逐個風格唔同：avataaars 系 Free，adventurer 等係 CC BY 4.0（要署名）——每個風格頁有寫

### 其他

| API | 狀態 | 備註 |
|---|---|---|
| Multiavatar | ⚠️ API 俾 Cloudflare 擋 script（實測）| 開源 repo 可 self-host；120 億組合 |
| Boring Avatars | ✅ | React 庫+服務，抽象風格頭像 |
| UI Avatars | ✅ | 名字縮寫頭像：`ui-avatars.com/api/?name=Ah+Ming` |

## 🅲 像素遊戲式（工仔識行路！）

### Universal LPC Spritesheet Generator — 開源像素人物生成器

遊戲開發界老字號：**髮型/膚色/衣服/裝備逐層砌**，output 係 spritesheet——**行路/揮手/攞嘢動作現成有**：

- 網頁版：`liberatedpixelcup.github.io/Universal-LPC-Spritesheet-Character-Generator`
- 開源 repo 可以 fork，**自己畫童軍制服 layer 加入去**
- ⚠️ 授權係 CC-BY-SA / GPL（share-alike——你嘅制服 layer 都要開源返，同你「開源工具」目標啱 key）

| 其他 | 授權 | 備註 |
|---|---|---|
| **Kenney.nl** | CC0 | 遊戲素材寶庫（外國 indie 界人人知），有人物/UI/圖標成千件 |
| OpenGameArt | 逐件睇 | 社群素材庫 |

## 🅳 3D 路線（進階）

| 工具 | 授權 | 備註 |
|---|---|---|
| **MakeHuman** | 開源 | 參數化 3D 人體生成：臉型/體型/年齡條桿較——「臉型數據庫」嘅 3D 答案 |
| **Mixamo**（Adobe） | 免費（唔開源） | **2000+ 動作動畫**自動 rig——3D 工仔敬禮/行路/紮營動作一 click |
| **VRoid Studio** | 免費 | Anime 風 3D 人物，**內置換衫系統**（自己畫制服 texture） |
| **Blender** | 開源 | 終極工具，配 MakeHuman/Mixamo 用 |

## 🎯 童軍工仔工具實戰路線圖

1. **最快出成品**：DiceBear（avataaars 風格）做底 → 自己畫「領巾/船帽/肩章」SVG layer 疊上去（SVG 疊 SVG 好簡單）
2. **最高質+完全自主**：Open Peeps（CC0 任改）入 Figma → 畫香港四支部制服組件（小童軍/幼童軍/童軍/深資）→ 砌自家 generator → 開源
3. **識郁嘅工仔**：fork LPC generator 加童軍制服 layer（記住 share-alike）
4. ⚠️ **章同制服係版權嘢**：香港童軍總會嘅章/徽要自己**重繪向量版**，正式發佈前最好問總會攞個祝福
5. pose 需求：Open Peeps 有企/坐 pose、LPC 有動作動畫、3D 就 Mixamo

## 🔗 相關

- SVG 處理/顏色替換技巧：塞 CSS variable 入 SVG，一個 param 換晒制服色
- 圖庫/授權注意 → [media.md](media.md)
