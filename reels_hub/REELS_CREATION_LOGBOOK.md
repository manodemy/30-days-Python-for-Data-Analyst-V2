# 🎬 Manodemy Instagram Reels Creation — Master SOP & Living Logbook

> **Single Source of Truth** for all Manodemy Instagram Reels production, visual design standards, narration scripting, shortlink attribution, Supabase integration, Hollywood / Anirudh-inspired cinematic sound design, precision semantic Closed Captions, and iterative improvisations.
> **Last Synchronized:** 2026-08-20 (v3.0 — Hollywood Trailer Sound Master, Precision Semantic CC, Exact Code Cell Bounding Box & Reel 03 Visual Parity)

---

## 📌 Table of Contents
1. [Core Operational Pipeline (Screenshot to Publishing)](#1-core-operational-pipeline)
2. [Narration Scripting & Hook Architecture (No Day Mentions)](#2-narration-scripting--hook-architecture-no-day-mentions)
3. [Hollywood & Anirudh Sound Engineering & Non-Repeating SFX Architecture (v3.0)](#3-hollywood--anirudh-sound-engineering--non-repeating-sfx-architecture-v30)
4. [Precision Semantic Closed Caption (CC) Engine (v3.0)](#4-precision-semantic-closed-caption-cc-engine-v30)
5. [Code Editor Highlight & Traveling Laser Light Engine (v3.0)](#5-code-editor-highlight--traveling-laser-light-engine-v30)
6. [8K Super-Sampling Hero Question Card Engine](#6-8k-super-sampling-hero-question-card-engine)
7. [Font Engineering & Typography Specifications (v2.2)](#7-font-engineering--typography-specifications-v22)
8. [Deliverables Generation & Mobile Auto-Landing Protocol](#8-deliverables-generation--mobile-auto-landing-protocol)
9. [Living Evolution & Improvisation Registry](#9-living-evolution--improvisation-registry)
10. [Production Logbook & Campaign Registry](#10-production-logbook--campaign-registry)

---

## 1. Core Operational Pipeline

Whenever the user provides a **screenshot of a question** from the Manodemy code editor, follow this strict sequential workflow:

```
[1. User Screenshot] 
       ↓ 
[2. Extract & Measure] → Measure question bbox height/width + parse exact title & body
       ↓ 
[3. Narration Script]  → Evergreen Hook (No Day Mention) + Question Reading + Challenge Pivot + Branded CTA
       ↓ 
[4. User Approval]     → Present script to User & obtain confirmation
       ↓ 
[5. Audio Engine]      → Edge-TTS ('en-US-AndrewNeural') + stable-whisper + Hollywood v3.0 Sound Engine (48kHz 320k)
       ↓ 
[6. Frame Compositor]  → 05_compose_reel.py (Reel 03 Visual Timing + Semantic CC + Traveling Code Cell Laser Light)
       ↓ 
[7. Video Encoder]     → 06_render_video.py (1080x1920 @ 30fps H.264 master / 320k 48kHz Stereo AAC)
       ↓ 
[8. Post Deliverables] → Instagram Caption + Pinned Comment + Shortlink (/qX) + Supabase Sync + Mobile Practice Auto-Landing
```

---

## 2. Narration Scripting & Hook Architecture (No Day Mentions)

To keep all reels 100% evergreen and universally consumable across algorithm feeds:
- **Rule on "Day" Mentions:** **NEVER mention Day numbers (e.g. "Day 4") in the voiceover or intro hook.** The reels must feel standalone and evergreen on Explore feeds.
- **Hook (0.0s – 2.5s):** Immediate curiosity hook.
  *Example:* `"Here's today's SQL logic challenge!"` or `"Can you solve this advanced SQL salary comparison?"`
- **Intro Visual (Reel 03 Parity):**
  - `t_card_start = 1.30s`: UI card emerges early to eliminate empty black frames.
  - `t_badge_start = 0.85s`: Dynamic topic badge pops briskly (e.g. `"⚡ SUBQUERY CHALLENGE"`).
  - `hook_end = 2.15s`: Hook text fades smoothly into the question card reveal.
  - `t_zoom_start = 1.80s`: Camera zoom locks in with a diagonal silver light sweep across the card.
- **Question Formulation:** Direct, engaging problem presentation.
- **Challenge Pivot:** Conversational curiosity hook before the challenge countdown (*"Do you know how to write this subquery?"*).
- **Actionable CTA:** Branded call to action (*"Run your query in the Maano-demy editor, and drop your code in the comments!"*).
- **Brand Pronunciation:** Always write `Maano-demy` in TTS scripts for natural phonetics (`/mɑːnoʊdɛmi/`), automatically mapped to `Manodemy` in visual captions.
- **NEVER Pronounce Underscores (`_`):** In `spoken_script` for TTS, ALWAYS replace underscores in column and table names with natural spaces (e.g. `markup_price` ➔ spoken as `"markup price"`, `unit_price` ➔ spoken as `"unit price"`, `cost_price` ➔ spoken as `"cost price"`, `first_name` ➔ spoken as `"first name"`, `department_id` ➔ spoken as `"department id"`). The TTS engine must NEVER pronounce the word *"underscore"*. Visual closed captions and question cards retain clean SQL syntax (`markup_price`, `unit_price`, etc.).

---

## 3. Hollywood & Anirudh Sound Engineering & Non-Repeating SFX Architecture (v3.0)

Engineered for maximum social feed impact, trailer-grade energy, and mobile phone speaker punch:

### Layer 1: High-Energy Electro Hybrid Score
- **808 Sub-Bass Drop & Rhythmic Pulse:** `E1 (41.2Hz) / A1 (55Hz)` root progression driving high-energy 130 BPM momentum.
- **Synth Lead & Atmospheric Shimmer Pads:** Voiced in `Em9 -> Cmaj7 -> D9` with arpeggiated lead motifs.
- **Hi-Hat Shimmer Groove:** High-frequency transient groove at 130 BPM.

### Layer 2: Precision Non-Repeating Transition SFX
Every visual transition has a dedicated, bespoke sound effect with **zero repetitive clutter**:
- **Beat 1 (Hook & Intro Drop @ 0.00s):** Hollywood Blockbuster Intro Hit (Detuned E1/E2 low brass "BWAAAM" sweep `4200Hz -> 180Hz`, `140Hz -> 30Hz` sub-thunder drop, and stereo air whoosh).
- **Beat 2 (Badge Pop @ 0.85s):** High-frequency glass snap transient (3400Hz snap + micro sub click — zero low-end mud).
- **Beat 3 (Question Reveal @ t_s3 ~ 3.21s):** Crystalline Holographic UI Chime (D6 bell partials with spatial 3D reverb tail + preceding air riser).
- **Beat 4 (Challenge Beat @ t_s4 ~ 13.33s):** Intense 130 BPM Electro Double Heartbeat (`lub-dub` 60Hz/84Hz) + tactile clock ticks (**Zero repeating BWAAAM!** Clean, focused tension).
- **Beat 5 (Editor Focus & Traveling Laser @ t_s5 ~ 15.39s):** Cyber glitch laser sweep (`2200Hz -> 750Hz`) + mechanical blue-switch click synced with the start of the Traveling Border Laser Light.
- **Beat 6 (Comments Sheet CTA @ t_s6 ~ 17.81s):** Celestial Resolution Brass/Synth Chord (`Cmaj9 -> D9` warm shimmer) + glass slide whoosh.
- **Beat 7 (Trailer Outro @ 19.30s – End):** Natural BGM bed swell with broadcast soft-clip limiter fadeout.

### Layer 3: Dynamic Multi-Band Sidechain Ducking & Mastering
- **Sidechain Compression:** Music score dynamically ducks by `-16dB` during narration with **22ms fast attack** and **200ms smooth release** for crystal vocal intelligibility.
- **Mastering Bus:** Sub-bass warmth (50Hz), vocal air shelf (+1.5dB @ 8kHz), broadcast soft-clip brickwall limiter (-0.3dBFS ceiling) exported in **320kbps 48kHz Stereo AAC/MP3**.

---

## 4. Precision Semantic Closed Caption (CC) Engine (v3.0)

### Semantic 3–4 Word Chunking Policy (Zero 1-Word Orphan Flashes):
To maintain smooth, broadcast-grade reading flow on mobile feeds:
- Words are grouped into **14–16 natural semantic phrases** (3 to 4 words per phrase).
- Phrases break strictly on **sentence boundaries (`. ? !`)**, **commas with 3+ words**, or **vocal pauses (>0.35s)**.
- Single-word orphan phrases (e.g. standalone `"subquery,"`, `"department"`, `"salary."`) are strictly merged into adjacent phrases to eliminate rapid jarring flashes.

### Sub-Millisecond Word Highlighting & Styling:
- **ASR Engine:** Aligned using `stable-whisper` on master narration audio.
- **Active Word Badge:** Solid Cyber Yellow (`#FFE600`) capsule with a 2px crisp white outline and deep obsidian text (`#050812`).
- **Zero Outer Blur Policy:** The fuzzy yellow outer glow stroke is eliminated for 100% crisp, readable vector typography.
- **Safe Zone:** Rendered at `y=1430` / `y=1630` well above Instagram's bottom UI action elements (Like, Comment, Share, Audio ticker).

---

## 5. Code Editor Highlight & Traveling Laser Light Engine (v3.0)

### Exact Code Editor Typing Cell Bounding Box:
To guarantee the highlight wraps only the typing area (excluding top toolbar buttons):
- **Top Coordinate (`ed_y1`):** `int(316 * sy)` (`416px` on card_w=980 canvas) — starts **strictly below** the toolbar buttons (`Question-XX`, `Run`, `Tables`, `Clear`) and sits cleanly above `1 -- Write your SQL query here`.
- **Bottom Coordinate (`ed_y2`):** `int(580 * sy)` (`764px` on card_w=980 canvas) — aligns directly above the `TERMINAL OUTPUT` header.
- **Horizontal Bounds (`ed_x1, ed_x2`):** `int(24 * sx)` to `int((orig_w - 24) * sx)` wrapping the dark coding cell.

### Traveling Border Light Laser Beam Engine:
- Continuous 36-segment glowing cyan laser beam (`#00F0FF` with `#FFFFFF` core).
- Travels smoothly along the perimeter `P = 2 * (bw + bh)` throughout the entire duration of Scene 5 (`t_s5_start` to `t_s6_start`).

---

## 6. 8K Super-Sampling Hero Question Card Engine

Whenever a reel is composed, `get_dynamic_question_bbox(ui_img)` scans the UI card for the light prompt box row boundaries. The `render_hero_question_overlay()` engine dynamically replaces this area with crystal-clear 8K vector elements:
1. **4x Super-Sampling Canvas:** Renders at `(qw * 4, qh * 4)` before downsampling via `Image.LANCZOS` for subpixel anti-aliased Retina rendering.
2. **Full-Width Text Span:** Replicated UI buttons (Play/Prev/Next) are omitted so the question text neatly and gorgeously fills the full width of the card.
3. **Dynamic Font Sizing:**
   - **Title:** Auto-scales up to `44px` bold font (`#0F172A`).
   - **Body:** Dynamically fits up to `36px` semibold font (`#1E293B`) with `1.38x` line height to fill the box vertically without overflow.
4. **Brand Accent Bar:** Solid Purple `#7C3AED` pill pinned to the left edge.
5. **Interactive Highlight Laser:** Pulsing Cyan outer aura (`#00F0FF`) + Gold chamfer (`#FFE600`) + White tech corner brackets.

---

## 7. Font Engineering & Typography Specifications (v2.2)

| Element | Typeface | Font Weight | Target Size (1x) | Target Size (4x SS) | Line Height | Color Token |
|:---|:---|:---|:---|:---|:---|:---|
| **Question Title** | **Plus Jakarta Sans** | Bold (700) | `42px – 44px` | `168px – 176px` | `1.20x` | Obsidian Slate `#0F172A` |
| **Question Body** | **Plus Jakarta Sans** | SemiBold (600) | `34px – 36px` | `136px – 144px` | `1.38x` | Deep Slate `#1E293B` |
| **Accent Bar** | — | — | `w=14px` | `w=56px` | Full Height | Electric Violet `#7C3AED` |
| **Card Surface** | — | — | Gradient | Studio Glass | — | Top `#FFFFFF` to Base `#F2F6FF` |
| **Closed Captions** | **Plus Jakarta Sans** | Bold (700) | `36px` | — | — | Active `#FFE600` / Inactive `#FFFFFF` |

---

## 8. Deliverables Generation & Mobile Auto-Landing Protocol

Every completed reel must be accompanied by the full social package:
1. **Reel Caption:** Hook, Table, Task, Solution SQL code block, `💡 Pro-Tip`, Engagement Question, and `#manodemy` hashtag cluster.
2. **Pinned Comment:** Challenge bait + Link to live practice editor.
3. **Shortlink & Attribution:** Mapped in `middleware.ts` (`/qX` & `/go/instagram_reel_0X`) with `guest=true` & `tab=practice` query parameters.
4. **Mobile Practice Auto-Landing:** When mobile users tap reel links, `mano-engine.js` automatically triggers `setMobileTab('practice')` so users land directly on the **Question & Code Editor** instead of defaulting to Theory/Lesson.

---

## 9. Living Evolution & Improvisation Registry

| Date | Category | Improvisation & Decision Record | Status |
|:---|:---|:---|:---|
| **2026-08-20** | **Reel 04 Master v3.0** | **Hollywood Trailer Sound + Precision Semantic CC + Exact Code Cell BBox + Reel 03 Timing Parity:** Upgraded Reel 04 to v3.0 standard. Forensically aligned non-repeating Hollywood SFX cues (`0.0s`, `0.85s`, `3.21s`, `13.33s`, `15.39s`, `17.81s`), eliminated 1-word orphan flashes with 14 natural 3-4 word semantic CC phrases, calibrated code cell highlight strictly below toolbar (`y=316*sy` to `y=580*sy`), and synced Reel 03 intro pacing (`t_card_start=1.30s`, `hook_end=2.15s`). | **ACTIVE (v3.0)** |
| **2026-08-19** | **Reel 04 Recreation (v2.5)** | **Anirudh Sound Engine + Code Cell Traveling Light + Crisp CC:** Recreated Reel 04 with Anirudh v3.0 high-energy audio mix, traveling border laser light animation, zero-glow solid Cyber Yellow CC badge, and mobile practice tab auto-landing. | **SUPERSEDED by v3.0** |
| **2026-08-19** | **Full Series Recreation** | **Batch Production for Reels 4, 5, 6, 7:** Standardized all 7 reels on the Hollywood Cinematic Sound Engine, Plus Jakarta Sans 8K Engine, CC Safe Zone (`y=1430`), and Universal Evergreen Hooks (no day mentions). | **ACTIVE (v2.4)** |
| **2026-08-19** | **Hook Architecture** | **Evergreen Hook Policy (v2.4):** Standalone curiosity hooks (*"Here's today's..."*, *"Can you solve..."*, *"Watch out for..."*) without day numbers for maximum explore shelf-life. | **ACTIVE (v2.4)** |
| **2026-08-19** | **Font Engineering** | **Plus Jakarta Sans Standard (v2.2):** Standardized on Plus Jakarta Sans (44px Title, 36px Body) with studio frosted glass gradient surface and 4x super-sampling. | **ACTIVE (v2.2)** |

---

## 10. Production Logbook & Campaign Registry

### 🎬 Reel 01 — Day 04 Q01: Implicit Type Casting
- **Question ID:** `day04_q01` (Question 2 on platform)
- **Topic:** SQL Implicit Type Casting & Integer Division
- **Campaign ID:** `CMP-REEL01` (`reel_day04_q1_high_performers` / `instagram_reel_01`)
- **Shortlinks:** `manodemy.com/q2` | `manodemy.com/go/instagram_reel_01`
- **Target URL:** `https://www.manodemy.com/sql-practice?day=4&q=1`
- **Master Video:** `output/reels/day04_q01.mp4`
- **Status:** ✅ Production Complete

---

### 🎬 Reel 02 — Day 04 Q02: Total Compensation with COALESCE
- **Question ID:** `day04_q02` (Question 3 on platform)
- **Topic:** COALESCE Null Handling & Arithmetic
- **Campaign ID:** `CMP-REEL02` (`reel_day04_q2_salary_analytics` / `instagram_reel_02`)
- **Shortlinks:** `manodemy.com/q3` | `manodemy.com/go/instagram_reel_02`
- **Target URL:** `https://www.manodemy.com/sql-practice?day=4&q=2`
- **Master Video:** `output/reels/day04_q02.mp4`
- **Status:** ✅ Production Complete

---

### 🎬 Reel 03 — Day 04 Q03: High Earners (Explicit Parentheses)
- **Question ID:** `day04_q03` (Question 4 on platform)
- **Topic:** Boolean Logic Operator Precedence (`AND` vs `OR`)
- **Campaign ID:** `CMP-REEL03` (`reel_day04_q3_dept_ranking` / `instagram_reel_03`)
- **Shortlinks:** `manodemy.com/q4` | `manodemy.com/go/instagram_reel_03`
- **Target URL:** `https://www.manodemy.com/sql-practice?day=4&q=4`
- **Master Video:** `output/reels/day04_q03.mp4` (16.7s Hollywood Master)
- **Status:** ✅ Production Complete (Gold Standard Visual Pacing Benchmark)

---

### 🎬 Reel 04 — Day 04 Q04: Earn More Than Every Sales Employee
- **Question ID:** `day04_q04` (Question 5 on platform)
- **Topic:** Subquery with `MAX()`
- **Campaign ID:** `CMP-REEL04` (`reel_day04_q4_sales_growth` / `instagram_reel_04`)
- **Shortlinks:** `manodemy.com/q5` | `manodemy.com/go/instagram_reel_04`
- **Target URL:** `https://www.manodemy.com/sql-practice?day=4&q=5`
- **Master Video:** `reels_hub/day04_q04_master.mp4` (20.1s Hollywood v3.0 Master)
- **Status:** ✅ Production Complete (v3.0 Hollywood Master + Precision Semantic CC + Exact Code Cell BBox + Traveling Laser Light + Reel 03 Timing Parity)

---

### 🎬 Reel 05 — Day 04 Q05: Price Markup
- **Question ID:** `day04_q05` (Question 6 on platform)
- **Topic:** Arithmetic Expressions & Calculated Column Aliasing
- **Campaign ID:** `CMP-REEL05` (`reel_day04_q5_price_markup` / `instagram_reel_05`)
- **Shortlinks:** `manodemy.com/q6` | `manodemy.com/go/instagram_reel_05`
- **Target URL:** `https://www.manodemy.com/sql-practice?day=4&q=6`
- **Master Video:** `reels_hub/day04_q05_master.mp4` (20.0s Hollywood v3.0 Master)
- **Status:** ✅ Production Complete (v3.0 Hollywood Master + Precision Semantic CC + Exact Code Cell BBox + Traveling Laser Light + Reel 03 Timing Parity)

---

### 🎬 Reel 06 — Day 04 Q06: Safe Ratio with NULLIF
- **Question ID:** `day04_q06` (Question 8 on platform)
- **Topic:** Divide-by-Zero Protection using `NULLIF()`
- **Campaign ID:** `CMP-REEL06` (`reel_day04_q8_nullif_safe_ratio` / `instagram_reel_06`)
- **Shortlinks:** `manodemy.com/q8` | `manodemy.com/go/instagram_reel_06`
- **Target URL:** `https://www.manodemy.com/sql-practice?day=4&q=8`
- **Master Video:** `output/reels/day04_q06.mp4` (23.6s Hollywood Master)
- **Status:** 🚀 Production Complete

---

### 🎬 Reel 07 — Day 04 Q07: Profit Percentage with ROUND
- **Question ID:** `day04_q07` (Question 9 on platform)
- **Topic:** Percentage Calculation, Float Precision & `ROUND()`
- **Campaign ID:** `CMP-REEL07` (`reel_day04_q9_profit_percentage` / `instagram_reel_07`)
- **Shortlinks:** `manodemy.com/q9` | `manodemy.com/go/instagram_reel_07`
- **Target URL:** `https://www.manodemy.com/sql-practice?day=4&q=9`
- **Master Video:** `output/reels/day04_q07.mp4` (25.5s Hollywood Master)
- **Status:** 🚀 Production Complete

---

## 11. Master Standards & Advanced Visual Effects (v3.1 Standard)

### 1. Question Card Moving Laser Border Animation (Scene 3)
- **Visual FX:** During Scene 3 question narration (`t_s3_trans` to `t_s4_trans`), the 8K Hero Question Card features a high-energy **28-segment traveling cyan perimeter laser light beam** (`(prog * P) % P`).
- **Pacing:** Sweeps dynamically at `0.9 cycles/sec` with white core highlight at the laser head (`frac2 > 0.65`).
- **Tech Brackets:** 24px white and cyan tech corner brackets at top-left and bottom-right anchor the card visually.

### 2. Code Editor Highlighter Perfect Bounding Box (Scene 5)
- **Exact Coordinates:**
  - `orig_x1 = 12` (expanded left edge covering full editor canvas)
  - `orig_x2 = orig_w - 12` (expanded right edge covering full editor canvas)
  - `orig_y1 = 274` (exact elevated top edge positioned directly below the toolbar button row `Run / Tables / Clear`, completely enclosing `Line 1: -- Write your SQL query here` and the editor pane)
  - `orig_y2 = 580` (grounded bottom edge stopping immediately above `TERMINAL OUTPUT`)
- **Traveling Laser:** 16-to-24 segment electric cyan perimeter laser traveling at `2.5x` perimeter speed throughout Scene 5.

### 3. Sub-Millisecond Closed Caption (CC) Sync & Viral Instagram Engine
- **Positioning:** Rendered strictly at **`y=1430`** (Instagram Safe Zone, well above bottom action buttons, username, audio pill).
- **Collision-Free Geometry:** Active word badge dynamically reserves full padding (`badge_pad_x = 18px`) plus `26px` inter-word separation. Active Cyber Yellow pill never overlaps or touches adjacent words.
- **Needle-Sharp Contrast:** Inactive words rendered in **100% Ultra-Bright White (`#FFFFFF`) with 2px dark drop shadow** for high-contrast legibility.
- **Snappy Phrase Transition:** Immediate phrase yield when next word start timestamp is reached, eliminating lingering/lagging captions.
- **Pacing Cadence:** Punchy **2 to 3 words per phrase** burst.

### 4. Spoken Narration Phonetic Rules
- **Brand Pronunciation:** Always write `Maano-demy` in TTS scripts for natural phonetics (`/mɑːnoʊdɛmi/`), mapped to `Manodemy` in visual captions.
- **Zero Underscore Pronunciation:** Always replace underscores in column and table names with spaces in `spoken_script` (e.g. `markup_price` ➔ `"markup price"`, `unit_price` ➔ `"unit price"`, `department_id` ➔ `"department id"`).
