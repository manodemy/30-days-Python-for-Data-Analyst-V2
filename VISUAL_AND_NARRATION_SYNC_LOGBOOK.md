# 🎬 Visual & Narration Synchronization Logbook
*(Living Documentation & Improvement Register for Manodemy Audio-Visual Sync)*

---

## 🎯 Purpose & Scope
This logbook tracks all improvements, architectural updates, audio inventories, transcripts, and timeline syncing enhancements across the Manodemy interactive learning platform. 

It ensures a tight 1:1 synchronization between:
1. **Narration Audio Clips** (`.mp3` speech generated or recorded).
2. **Spoken Narration Transcripts** (Whisper ASR extracted word-for-word ground truth).
3. **UI Visual Targets & Animations** (DOM elements, diagram nodes, highlighted rows/columns, and code typewriter animations in `mano-engine.js` and `day-XX.js`).

---

## 📜 Session Change Log

### 🗓️ Entry: 2026-08-21 — Professional Web Audio Mechanical Typing Sound Synthesizer & Day 05 Segments
* **Target Feature**: `startAudioSyncedTypewriter` animation engine in `mano-engine.js`.
* **Sound Engineering Design**:
  1. **Zero-Latency Web Audio API Synthesis**: Synthesizes tactile mechanical switch sounds using `AudioContext` without network audio asset requests.
  2. **Dual-Layer Keystroke Acoustic Model**:
     - **Layer A (Stem Snap)**: 12ms shaped noise burst filtered through a high-Q bandpass filter centered at `4200Hz` ($\pm 250\text{Hz}$ random jitter).
     - **Layer B (Bottom-out Thud)**: 35ms damped sine/triangle wave (`185Hz` down to `80Hz`).
     - **Spacebar / Return Weight**: Spacebars and Enter keys trigger deeper resonance (`110Hz - 135Hz`) and wider bandpass for realistic tactile feedback.
  3. **Volume Gating & Anti-Stacking**: Keystrokes are throttled to a minimum 22ms delta and calibrated to a gentle background level (`~0.045`) that complements narration without masking speech.
  4. **Day 05 Segments Sync**: All 15 practice questions in `questionSolutionMap['day05']` upgraded to Whisper-aligned keyword `segments`.
* **Files Updated**:
  - [`public/Version-3/mano-engine.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js): Added `playTypingSound(char)` and updated `rafLoop()` in `startAudioSyncedTypewriter()`.

### 🗓️ Entry: 2026-08-21 — Single Question Isolation during Interview Q&A Narration
* **Target Scope**: All interview Q&A blocks (`.interview-box > div`, e.g., `#iqReferentialIntegrity`, `#iqSqlVsNosql`, `#iqCompositePk`).
* **Behavior & Resolution**:
  1. **Single Question Visible**: When an interview question track plays, `updateSlidePlaybackVisibility` dynamically hides all other sibling question cards inside `.interview-box`, displaying **ONLY the currently spoken question & answer**.
  2. **Zero-Scroll Box Stability**: `scrollToTarget` automatically anchors the `.interview-box` cleanly at `top: 0` without scrolling between sequential questions.
  3. **Full Restoration on Pause**: When playback is paused or completed, `clearSlidePlaybackVisibility` restores all questions in the box so students can read the complete Q&A set freely.
* **Files Updated**:
  - [`public/Version-3/mano-engine.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js): Updated `updateSlidePlaybackVisibility`, `clearSlidePlaybackVisibility`, and `scrollToTarget`.

### 🗓️ Entry: 2026-08-21 — Day 01 SQL Sub-Languages Table Stationary & Keyword Row Spotlight Sync
* **Target Audio**: `New_Day1Part1audio16.mp3` through `New_Day1Part1audio21.mp3` (`#sqlSubLanguages`, `#subLangDql`, `#subLangDml`, `#subLangDdl`, `#subLangTcl`, `#subLangDcl`).
* **Target Container**: `#sqlSubLanguagesTable` (`.sub-languages-table`)
* **Root Cause & Resolution**:
  1. **Root Cause**: `scrollToTarget(selector)` was computing the bounding rectangle of each individual `<tr>` element (`#subLangDql`, `#subLangDml`, etc.) and continuously issuing `container.scrollTo()` commands, causing the whole table to scroll and shift upwards by ~50px on every row narration track.
  2. **Fixed Stationary Table**: `scrollToTarget` and `pauseCombinedPlayback` now explicitly recognize all sub-language row tracks and bypass row-level scrolling. The entire table remains 100% fixed, stationary, and unmoving in the viewer.
  3. **Keyword-Level Spotlight**:
     - `audio16` (Intro): Full table displayed cleanly with zero row highlights.
     - `audio17` (`DQL`): Row 1 (`#subLangDql`) smoothly glows with `.row-active-spotlight`.
     - `audio18` (`DML`): Row 2 (`#subLangDml`) smoothly glows with `.row-active-spotlight`.
     - `audio19` (`DDL`): Row 3 (`#subLangDdl`) smoothly glows with `.row-active-spotlight`.
     - `audio20` (`TCL`): Row 4 (`#subLangTcl`) smoothly glows with `.row-active-spotlight`.
     - `audio21` (`DCL`): Row 5 (`#subLangDcl`) smoothly glows with `.row-active-spotlight`.
  4. **Zero-Jerk Transition**: Because the section is already mounted, switching between row tracks produces zero scroll displacement or pop-in animation, maintaining a rock-solid reading experience.
* **Files Updated**:
  - [`public/Version-3/mano-engine.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js): Updated `scrollToTarget` and `pauseCombinedPlayback` to bypass row-level scrolling on `#sqlSubLanguagesTable` and `#coreEntitiesTableWrap`. Added `updateDay01SqlSubLanguagesHighlights`.

### 🗓️ Entry: 2026-08-21 — Day 01 Core Structural Entities Table Stationary & Zero-Jerk Row Transition
* **Target Audio**: `New_Day1Part1audio04.mp3` through `New_Day1Part1audio08.mp3` (`#coreEntities`, `#entityDatabase`, `#entityTable`, `#entityColumn`, `#entityRow`).
* **Problem Addressed**: Switching tracks between rows within the same section repeatedly re-triggered `stunning-section-entry` animations and reset `container.scrollTop = 0`, causing the table to jump, pop, and scroll unexpectedly.
* **Resolution**:
  1. **Section State Tracking (`.active-section-mounted`)**: `updateSlidePlaybackVisibility` now detects if the `.slide-section` is already mounted and active. Sub-track transitions inside the same section bypass scroll resets and entry animations.
  2. **100% Fixed Table Layout**: The table stays completely steady and stationary on screen while only the blue highlight border smoothly moves from row to row (`Database` ➔ `Table` ➔ `Column` ➔ `Row`).
* **Files Updated**:
  - [`public/Version-3/styles.css`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/styles.css): Added `transform: none !important` to `.db-table-mock tr.row-active-spotlight`.
  - [`public/Version-3/mano-engine.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js): Updated `updateSlidePlaybackVisibility` and `clearSlidePlaybackVisibility`.

### 🗓️ Entry: 2026-08-21 — Day 01 Topic 01 Full Content Visibility Preservation & Sub-Element Spotlight Refactoring
* **Target Scope**: All 25 narration tracks across Day 01 Topic 01 (`New_Day1Part1audio01.mp3` through `New_Day1Part1audio25.mp3`).
* **Root Cause Addressed**: Overly aggressive sibling traversal and `[id]`/`code` block hiding in `updateSlidePlaybackVisibility` caused inner terms (e.g. `Database`, `Table`, `Column`, `Row`), code snippets (`employees`, `salary INTEGER`), and explanatory sections (e.g. comparative cards, sub-language tables, Q&As) to be partially hidden or display only headings during playback.
* **Refactoring Solution**:
  1. **Full Section Content Preservation**: When any narration track within a `.slide-section` plays, the entire section remains 100% visible, fully rendered with complete descriptive depth (paragraphs, diagrams, code blocks, comparative vs-cards, tables, and Q&As).
  2. **Complete Table Display & Active Row Spotlight**: The `Core Structural Entities` table is always rendered in full (all 4 rows: Database, Table, Column, Row + definitions + code badges). When individual keyword tracks play (`audio07` for Database, `audio06` for Table, `audio05` for Column, `audio08` for Row), that specific row lights up with `.row-active-spotlight` without hiding or collapsing the other rows.
  3. **Universal Sub-Item Spotlight System**:
     - `.db-table-mock tr.row-active-spotlight`: Table rows (Core Entities, SQL Sub-Languages) highlight with sapphire border accents.
     - `.vs-card.card-active-spotlight`: Comparative cards (PK vs FK, Imperative vs Declarative) highlight with elevation and glowing blue outline.
     - `.block-active-spotlight`: Interview Q&As and Parent/Child blocks highlight with a sleek left accent border.
* **Files Updated**:
  - [`public/Version-3/styles.css`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/styles.css): Added universal row, card, and Q&A spotlight styles.
  - [`public/Version-3/mano-engine.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js): Refactored `updateSlidePlaybackVisibility` and `updateDay01CoreEntitiesHighlights`.

### 🗓️ Entry: 2026-08-21 — Day 01 Audio 04–08 Core Structural Entities Sequential Row Spotlight & Order Sync
* **Target Audio**: `New_Day1Part1audio04.mp3` through `New_Day1Part1audio08.mp3`
* **Target Container**: `#coreEntitiesTableWrap` (`.core-entities-table`)
* **Spoken Hierarchy Flow**:
  1. `New_Day1Part1audio04.mp3` (`#coreEntities`): Intro to strict hierarchy. Table shell and columns (`Term`, `Also Called`, `Description`) are revealed.
  2. `New_Day1Part1audio07.mp3` (`#entityDatabase`): *"At the top level we have the database, also called a schema..."* ➔ Row 1 (**Database**) appears & glows with cobalt blue spotlight (`#eff6ff`, border `3.5px solid #3b82f6`).
  3. `New_Day1Part1audio06.mp3` (`#entityTable`): *"Inside the database, we find tables or relations..."* ➔ Row 2 (**Table**) appears below Row 1 & glows.
  4. `New_Day1Part1audio05.mp3` (`#entityColumn`): *"Each table is made of columns, or also called attributes..."* ➔ Row 3 (**Column**) appears below Row 2 & glows.
  5. `New_Day1Part1audio08.mp3` (`#entityRow`): *"And finally, we have rows, also known as records or tuples..."* ➔ Row 4 (**Row**) appears with full table complete & glows.
* **Implementation Deliverables**:
  1. Updated [`public/Version-3/content/day-01.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/content/day-01.js): Added `#coreEntitiesTableWrap`, `#coreEntitiesTable`, and row IDs `#rowDatabase`, `#rowTable`, `#rowColumn`, `#rowRow`.
  2. Updated [`public/Version-3/styles.css`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/styles.css): Added `.row-active-spotlight` styles with smooth border highlights.
  3. Updated [`public/Version-3/mano-engine.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js): Implemented `updateDay01CoreEntitiesHighlights(activeTarget, isPlaying)` and connected to `updateSlidePlaybackVisibility`, `loadAndPlayTrack`, and standalone `playAudio`.

### 🗓️ Entry: 2026-08-21 — Day 01 Audio 03 Three Problems Sequential Card Spotlight & Zoom Sync
* **Target Audio**: `New_Day1Part1audio03.mp3` (Duration: 20.0s)
* **Target Container**: `#rdbmsProblems` (`.info-columns`)
* **Spoken Narration**:
  > *"First, it eliminates data redundancy by ensuring facts are stored only once across related tables. Second, it maintains data integrity, preventing bad or broken data. And third, it handles concurrent access, letting multiple users read and write data at the exact same time without conflicting with or corrupting each other's transactions."*
* **Implementation Deliverables**:
  1. **Phase 1 (`0.00s – 5.80s`)**:
     - **Active Spotlight**: Card 1 (`#cardRedundancy` - Green) zooms slightly (`scale: 1.05`, `translateY(-4px)`) with emerald halo glow (`box-shadow: 0 14px 28px rgba(16, 185, 129, 0.3), 0 0 0 2px #10b981`).
     - **Siblings**: Cards 2 & 3 softly dimmed (`opacity: 0.55; transform: scale(0.97); filter: grayscale(20%)`).
  2. **Phase 2 (`5.80s – 10.60s`)**:
     - **Active Spotlight**: Card 2 (`#cardIntegrity` - Blue) zooms in (`scale: 1.05`, `translateY(-4px)`) with sapphire blue halo glow (`box-shadow: 0 14px 28px rgba(37, 99, 235, 0.3), 0 0 0 2px #2563eb`).
     - **Siblings**: Cards 1 & 3 softly dimmed.
  3. **Phase 3 (`10.60s – 20.00s`)**:
     - **Active Spotlight**: Card 3 (`#cardConcurrent` - Orange) zooms in (`scale: 1.05`, `translateY(-4px)`) with warm amber halo glow (`box-shadow: 0 14px 28px rgba(234, 88, 12, 0.3), 0 0 0 2px #ea580c`).
     - **Siblings**: Cards 1 & 2 softly dimmed.
  4. **Files Updated**:
     - [`public/Version-3/content/day-01.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/content/day-01.js): Added `#cardRedundancy`, `#cardIntegrity`, `#cardConcurrent`.
     - [`public/Version-3/styles.css`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/styles.css): Added `.card-narration-active` with customized color halos and `.has-narration-active` dimming.
     - [`public/Version-3/mano-engine.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js): Implemented `updateDay01Audio03Highlights(currentTime, isPlaying)`.

### 🗓️ Entry: 2026-08-21 — Day 01 Audio 01 Two-Phase Zoom & Keyword Sync Implementation
* **Target Audio**: `New_Day1Part1audio01.mp3` (Duration: 23.4s)
* **Spoken Narration**:
  > *"Hey everyone, welcome to first topic of day one of our data analytics course. First we will understand what a relational database management system is. An RDBMS is software that structures data into tables, also known as relations. For example, in this employees table, columns header defines attributes like ID, employee name, role and salary, while the rows represent individual records."*
* **Implementation Deliverables**:
  1. **Phase 1 (0.00s – 13.50s)**:
     - **UI Element**: `#rdbmsHeroSection` (Hero Header bar with `[01]` purple gradient badge, title `What is RDBMS?`, play button, and paragraph definition).
     - **Animation**: Smooth zoom-in (`opacity: 0 -> 1`, `scale: 0.95 -> 1.0` with `cubic-bezier(0.16, 1, 0.3, 1)`).
     - **Staged Element**: `#rdbmsTableCard` staged in hidden/collapsed state.
  2. **Phase 2 (13.94s – 23.40s)**:
     - **Trigger at 13.94s** (*"For example, in this employees table..."*): `#rdbmsTableCard` appears smoothly with zoom/fade-in.
     - **Word-Synchronized Column & Row Highlights**:
       - `17.86s – 18.88s` (*"ID"*): Highlights Column 1 (`🔑 ID (PK) INT` + data cells) with dashed cyber-blue border and soft blue background tint.
       - `18.88s – 19.78s` (*"employee name"*): Highlights Column 2 (`Name VARCHAR` + data cells).
       - `19.78s – 20.12s` (*"role"*): Highlights Column 3 (`Role VARCHAR` + data cells).
       - `20.12s – 20.88s` (*"salary"*): Highlights Column 4 (`Salary DECIMAL` + data cells).
       - `20.88s – 23.40s` (*"while the rows represent individual records."*): Clears column borders and highlights data row (`Bob Smith` record in mint green `#ecfdf5`).
  3. **Files Updated**:
     - [`public/Version-3/content/day-01.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/content/day-01.js): Added `#rdbmsHeroSection`, `#rdbmsTableCard`, `#rdbmsMockTable`, and column markers.
     - [`public/Version-3/styles.css`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/styles.css): Added `.rdbms-hero-container`, `.narration-zoomed`, `.narration-hidden`, `.narration-revealed`, `.column-narration-active`, and `.narration-row-pulse`.
     - [`public/Version-3/mano-engine.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js): Implemented `updateDay01Audio01Highlights(currentTime, isPlaying)` and connected to `timeupdate`, `pause`, and `ended` listeners.

### 🗓️ Entry: 2026-08-21 — Day 01 Audio Inventory, Full Transcription & Narration SSOT
* **Activity**: Complete audio audit, Whisper ASR transcription, and UI target mapping for Day 01.
* **Deliverables Created**:
  1. [`narrations/day-01.json`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/narrations/day-01.json): Unified JSON repository of all Day 01 narration scripts.
  2. [`scratch/day01_p1_transcription.json`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/scratch/day01_p1_transcription.json) & [`scratch/day01_p2_transcription.json`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/scratch/day01_p2_transcription.json): Verbatim Whisper transcript dumps.
  3. [`VISUAL_AND_NARRATION_SYNC_LOGBOOK.md`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/VISUAL_AND_NARRATION_SYNC_LOGBOOK.md): This central sync tracking document.
* **Key Findings & Fixes**:
  - Identified **62 audio files** on disk for Day 01 (25 Part 1 lecture + 3 Part 1 questions + 7 legacy Part 1 clips + 25 Part 2 lecture + 2 Part 2 questions).
  - Verified active mapping of 45+ inline triggers in [`public/Version-3/content/day-01.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/content/day-01.js) and engine timeline tracks in [`public/Version-3/mano-engine.js`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js).

---

## 🏗️ Audio-to-Visual Target Mapping & Narration Registry

### 📘 Day 01 — Topic 1: Relational Databases & SQL

| Track # | Audio File | Target Selector | Section / Title | Verbatim Spoken Narration (Whisper ASR) | Visual Animation Cues |
| :---: | :--- | :--- | :--- | :--- | :--- |
| **01** | `New_Day1Part1audio01.mp3` | `#rdbmsIntro` | What is RDBMS? | *"Hey everyone, welcome to first topic of day one of our data analytics course. First we will understand what a relational database management system is. An RDBMS is software that structures data into tables, also known as relations. For example, in this employees table, columns header defines attributes like ID, employee name, role and salary, while the rows represent individual records."* | **Phase 1 (0.00s–13.50s)**: Zoom in `#rdbmsHeroSection`.<br/>**Phase 2 (13.94s)**: Zoom in `#rdbmsTableCard`.<br/>**17.86s–18.88s**: Highlight Col 1 (`ID`).<br/>**18.88s–19.78s**: Highlight Col 2 (`employee name`).<br/>**19.78s–20.12s**: Highlight Col 3 (`role`).<br/>**20.12s–20.88s**: Highlight Col 4 (`salary`).<br/>**20.88s–23.40s**: Highlight Row (`Bob Smith`). |
| **02** | `New_Day1Part1audio02.mp3` | `#whyRdbms` | Why Relational Databases? | *"Next we will see why do we need relational databases? Well, before they existed, data lived in messy flat files, which caused tons of duplication and inconsistency. Relational databases were invented to solve three fundamental problems."* | Highlight "Why RDBMS?" container & flat file comparison card. |
| **03** | `New_Day1Part1audio03.mp3` | `#rdbmsProblems` | Three Problems RDBMS Solves | *"First, it eliminates data redundancy by ensuring facts are stored only once across related tables. Second, it maintains data integrity, preventing bad or broken data. And third, it handles concurrent access, letting multiple users read and write data at the exact same time without conflicting with or corrupting each other's transactions."* | Step-by-step sequence highlight across cards: 1. Redundancy -> 2. Integrity -> 3. Concurrent Access. |
| **04** | `New_Day1Part1audio04.mp3` | `#coreEntities` | Core Structural Entities | *"Now that we know the problems it solves, let's look at the core structural entities of an RDBMS. Think of this as a strict hierarchy where every piece of data has its exact place."* | Focus hierarchy wrapper. |
| **05** | `New_Day1Part1audio07.mp3` | `#entityDatabase` | Database Entity | *"At the top level we have the database, also called a schema. It's simply the container holding everything, like our tables, indexes and views."* | Highlight Database / Schema container card. |
| **06** | `New_Day1Part1audio06.mp3` | `#entityTable` | Table Entity | *"Inside the database, we find tables or relations. These are the two dimensional grids of rows and columns representing a specific entity type like our employees."* | Highlight 2D Grid / Table entity representation. |
| **07** | `New_Day1Part1audio05.mp3` | `#entityColumn` | Column Entity | *"Each table is made of columns, or also called attributes. A column defines a specific property of the table and enforces a data type, like a salary column that only accepts integer numbers."* | Flash column attribute badges and datatype pill. |
| **08** | `New_Day1Part1audio08.mp3` | `#entityRow` | Row Entity | *"And finally, we have rows, also known as records or tuples. A row represents a single complete instance in the table, containing values across all columns."* | Highlight active row record / tuple across all columns. |
| **09** | `New_Day1Part1audio09.mp3` | `#pkFkKeys` | Primary Key vs. Foreign Key | *"But why is it called a relational database? In mathematics, a table is called a relation. The real power, however, comes from linking these tables together. By connecting them with primary and foreign keys, we establish referential integrity, ensuring all our data links remain accurate and unbroken."* | Animate relational connector arrow linking parent and child tables. |
| **10** | `New_Day1Part1audio10.mp3` | `#pkDetail` | Primary Key | *"First is the primary key. Think of it as a unique identifier for every single row in a table, much like an employee ID or passport number. A primary key has three strict rules. It can never be empty or null. It can never contain duplicates, and each row must have one. In SQL, we define it simply by adding primary key next to the column name when creating a table."* | Glow PK badge (`PRIMARY KEY`), sequentially highlight 3 rule badges (Not Null, Unique, Exists). |
| **11** | `New_Day1Part1audio11.mp3` | `#fkDetail` | Foreign Key | *"Next is the foreign key. This references the primary key of another parent table to establish a link, like connecting an employee to a department ID. It guarantees referential integrity, meaning a child row can never point to a parent that doesn't exist, though it can be null if the link is optional. In SQL, we define this connection using the references keyword."* | Glow FK badge (`REFERENCES`), trace relationship link to parent table. |
| **12** | `New_Day1Part1audio12.mp3` | `#parentTableDept` | Parent & Child Tables | *"To see this in action, let's look at these tables. First, we have our parent table, departments, where each department has a unique ID, like 10 or 20, which is the primary key for this table. Below it is our child table, employees. Notice the department ID column. It acts as our foreign key. For instance, RAV has a department ID of 10, which links him directly back to the engineering department in the parent table."* | Synchronized dual highlight: `departments.id = 10` and `employees.department_id = 10`. |
| **13** | `New_Day1Part1audio13.mp3` | `#sqlDeclarative` | SQL is Declarative | *"SQL is a declarative language, not an imperative one. This is one of the most important ideas in SQL, which means you only describe what you want, not how to get it. The query optimizer figures out the execution plan."* | Focus declarative header and concept callout. |
| **14** | `New_Day1Part1audio14.mp3` | `#sqlImperativeVs` | Imperative Code | *"In Python, you write the exact steps to loop and collect the data."* | Highlight Python loop code block. |
| **15** | `New_Day1Part1audio15.mp3` | `#sqlDeclarativeVs` | Declarative Code | *"Whereas in SQL, you simply describe the final result you want. The database engine then does the heavy lifting, automatically figuring out the best way to get it for you."* | Highlight declarative `SELECT` statement block. |
| **16** | `New_Day1Part1audio16.mp3` | `#sqlSubLanguages` | Five SQL Sub-Languages | *"To help organize commands, SQL is divided into five sub languages based on their function."* | Reveal / illuminate sub-languages overview grid. |
| **17** | `New_Day1Part1audio17.mp3` | `#subLangDql` | DQL — Query Language | *"First is DQL or Data Query Language. This is used solely to query or retrieve data from the database using the Select command."* | Glow DQL card & `SELECT` syntax. |
| **18** | `New_Day1Part1audio18.mp3` | `#subLangDml` | DML — Manipulation Language | *"Second is DML or Data Manipulation Language. This is used to add, modify, or delete the actual data records inside your tables, using commands like insert, update, and delete."* | Glow DML card & `INSERT`/`UPDATE`/`DELETE` syntax. |
| **19** | `New_Day1Part1audio19.mp3` | `#subLangDdl` | DDL — Definition Language | *"Third is DDL or Data Definition Language. Instead of modifying the records, DDL defines and alters the structure of the database itself, such as creating, altering, or dropping whole tables."* | Glow DDL card & `CREATE`/`ALTER`/`DROP` syntax. |
| **20** | `New_Day1Part1audio20.mp3` | `#subLangTcl` | TCL — Transaction Control | *"Fourth is TCL or Transaction Control Language. This groups multiple SQL commands together into a single atomic transaction, letting you save changes permanently with commit or undo them with rollback."* | Glow TCL card & `COMMIT`/`ROLLBACK` keywords. |
| **21** | `New_Day1Part1audio21.mp3` | `#subLangDcl` | DCL — Data Control Language | *"Finally, we have DCL or Data Control Language. This handles security and access permissions, allowing administrators to grant or revoke database read and write access to specific users."* | Glow DCL card & `GRANT`/`REVOKE` keywords. |
| **22** | `New_Day1Part1audio22.mp3` | `#proTipRdbms` | Pro Tip: Which RDBMS? | *"Here's a quick pro tip on choosing the right relational database. For learning, mobile apps, and local tools, SQLite is ideal because it is a lightweight, file-based database embedded directly inside the application. For real-world production systems, PostgreSQL is the modern industry standard. MySQL and MariaDB are widely used in Webstacks, while Microsoft SQL Server remains dominant in corporate Windows environments."* | Highlight pro-tip box and pulse database engine badges sequentially. |
| **23** | `New_Day1Part1audio23.mp3` | `#iqReferentialIntegrity` | Interview Q1: Referential Integrity | *"Now let's discuss some key interview questions. First, what is referential integrity and how does a foreign key enforce it? Referential integrity simply means every foreign key value in a child table must point to a valid primary key in the parent table. A foreign key constraint enforces this relationship by blocking any child record referencing a non-existent parent and preventing a parent record from being deleted if child tables are still referencing it."* | Reveal & highlight Interview Q1 accordion / box. |
| **24** | `New_Day1Part1audio24.mp3` | `#iqSqlVsNosql` | Interview Q2: SQL vs NoSQL | *"Next question, what is the difference between SQL and NoSQL databases? And when should you choose each? SQL databases use rigid schemas, structured tables, and guarantee strong consistency through ACID transactions, making them perfect for finance and ERP systems where accuracy is critical. NoSQL databases use flexible schemas, scale horizontally, and follow the eventual consistency model, making them ideal for applications like real-time analytics and content platforms."* | Reveal & highlight Interview Q2 comparison table. |
| **25** | `New_Day1Part1audio25.mp3` | `#iqCompositePk` | Interview Q3: Primary Key | *"And our third question, can a table have more than one primary key? The answer is no. A table can only have one primary key constraint. However, that primary key can be a composite key, meaning it spans two or more columns together to uniquely identify a row. Each individual column within that composite key is referred to as a prime attribute."* | Reveal & highlight Interview Q3 definition card. |
| **26** | `New_Day1Part1Question01.mp3` | `#questionBar` | Practice Q1: Retrieve All Rows | *"All right, now it's time to put your knowledge into practice. For our first exercise, write a SQL query to retrieve all columns and all rows from the employees table."* | Switch UI to Practice Studio, load Q1 card & prompt. |
| **27** | `New_Day1Part1Question02.mp3` | `#questionBar` | Practice Q1 Solution | *"The solution is select asterisk from employees. Here, select asterisk is the shorthand for selecting every single column in the table, and from employees simply points the database to the right table. No filters, no conditions, just a clean, full retrieval of all the data."* | Code editor typewriter animation: `SELECT * FROM employees;` -> Auto Execute -> Output Table view. |
| **28** | `New_Day1Part1Question03.mp3` | `#questionBar` | Practice Q2: sqlite_master | *"Next question, write a query to retrieve all columns and rows from the system table, sqlite_master, to inspect the database structure. Think about what you already know. The same pattern applies here, just with a different table name. Try it yourself and see the result. This completes topic one of day one of our Data Analytics course. Thank you for watching and keep learning."* | Load Q2 card, focus editor for student query entry. |

---

### 📗 Day 01 — Topic 2: Column Projection

| Track # | Audio File | Target Selector | Section / Title | Verbatim Spoken Narration (Whisper ASR) | Visual Animation Cues |
| :---: | :--- | :--- | :--- | :--- | :--- |
| **01** | `Day01topic2/New_Day1Part2audio01.mp3` | `#columnProjectionIntro` | What is Column Projection? | *"Welcome back. In this section we're diving into column projection and why it is one of the most critical factors in database performance. Column projection is the act of selecting only the specific columns you need from a query result. In the relational algebra that underpins SQL, a projection operation reduces a relation's attributes from N columns to a smaller subset. It is the fundamental mechanism behind the column list in your select clause."* | Highlight projection formula banner and select clause definition. |
| **02** | `Day01topic2/New_Day1Part2audio02.mp3` | `#cardPagesBlocks` | PAGES / BLOCKS Card | *"To understand why this is so critical, let's look at how relational databases handle data under the hood. It boils down to three concepts. First, pages and blocks. Databases store data in fixed-size blocks called pages, specifically eight kilobytes in PostgreSQL and 16 kilobytes in MySQL. Because all I/O operations are done at the page level, every disk read fetches an entire page into memory."* | Glow 8KB / 16KB disk page memory diagram block. |
| **03** | `Day01topic2/New_Day1Part2audio03.mp3` | `#cardRowOriented` | ROW-ORIENTED Card | *"Second, relational databases are row oriented. This means all columns of a row are stored together. Therefore, reading even just one column loads the whole row. While this design is ideal for transactional or OLTP workloads, it presents a major bottleneck if you retrieve unnecessary data."* | Highlight horizontal row-storage layout card. |
| **04** | `Day01topic2/New_Day1Part2audio03(new).mp3` | `#cardFullPageLoad` | FULL PAGE LOAD Card | *"Next is full page load. Using select star forces the database to load every single unused column into memory. This pollutes and clogs the database's buffer pool cache by filling it with data you don't need, which ultimately wastes massive amounts of disk I/O and network bandwidth."* | Show buffer pool saturation / warning animation. |
| **05** | `Day01topic2/New_Day1Part2audio04.mp3` | `#projectionDiagram` | How Projection Works (Disk) | *"Next we see how column projection works. First we will start with the disk page, where the physical storage block on disk containing the entire raw row data, the ID, name, department, and salary columns."* | Animate step 1: Disk Page block lights up with all 4 columns. |
| **06** | `Day01topic2/New_Day1Part2audio05.mp3` | `#projectionLoads` | Loads Link | *"Next, the database loads the data. It fetches the complete page from disk storage and brings it directly into the systems memory."* | Animate step 2: Flow arrow from Disk to Memory RAM. |
| **07** | `Day01topic2/New_Day1Part2audio06.mp3` | `#projectionFilter` | SELECT name, salary Filter | *"Then, the query applies the projection filter. Writing select name salary tells the engine to keep only those two specific columns and discard the rest."* | Animate step 3: Filter gate strips `id` & `department`, passes `name` & `salary`. |
| **08** | `Day01topic2/New_Day1Part2audio07.mp3` | `#projectionResultSet` | Result Set Node | *"Finally, the query returns the result set. The final output contains only the requested name and salary columns, keeping the response fast and lightweight."* | Animate step 4: Lightweight 2-column result set arrives at Client. |
| **09** | `Day01topic2/New_Day1Part2audio08.mp3` | `#performanceCosts` | 4 Performance Costs of SELECT * | *"Now let's explore the actual performance penalties when you use Select Star instead of projecting specific columns. There are four major costs."* | Highlight 4-card cost container grid. |
| **10** | `Day01topic2/New_Day1Part2audio09.mp3` | `#costExcessDiskIO` | 1. Excess Disk I/O | *"First, excess disk input output. Requesting every column forces the engine to read more physical pages from the disk."* | Pulse Cost 1 Card: Excess Disk I/O. |
| **11** | `Day01topic2/New_Day1Part2audio10.mp3` | `#costBufferPool` | 2. Buffer Pool Pollution | *"Second, buffer pool pollution. Unused columns occupy RAM in the database buffer cache, evicting frequently needed pages and causing cache misses."* | Pulse Cost 2 Card: Buffer Pool Pollution. |
| **12** | `Day01topic2/New_Day1Part2audio11(new).mp3` | `#costNetworkOverhead` | 3. Network Overhead | *"Third is network overhead. Every byte travels over the network from the DB server to your app. Wide rows with blob columns cause noticeable latency under heavy traffic."* | Pulse Cost 3 Card: Network Overhead & latency meter. |
| **13** | `Day01topic2/New_Day1Part2audio11.mp3` | `#costDefeatedIndex` | 4. Defeated Index Scans | *"And fourth, defeated index only scans. Even when a covering index exists, select star forces a heap lookup, visiting actual table pages, because not all columns are in the index."* | Pulse Cost 4 Card: Defeated Index Scans. |
| **14** | `Day01topic2/New_Day1Part2audio12.mp3` | `#projectionMockTable` | Mock Table (Projection) | *"As you can see in this mock table, the unrequested ID and department columns are completely ignored. Only the selected name and salary columns are loaded and returned, saving critical memory and network bandwidth."* | Dim unselected columns (`id`, `department`) and brightly highlight selected columns (`name`, `salary`). |
| **15** | `Day01topic2/New_Day1Part2audio13.mp3` | `#indexOnlyScans` | Index-Only Scans Overview | *"Now let's discuss about one of the most powerful query optimization techniques, the index only scan. When you project only columns that are part of a database index, the query optimizer can execute an index only scan, also called a covering index scan. It reads data directly from the index B tree without ever touching the physical table pages."* | Highlight Index-Only Scan master banner & B-Tree node icon. |
| **16** | `Day01topic2/New_Day1Part2audio14.mp3` | `#heapLookupRequired` | SELECT * Heap Lookup | *"When querying the employees table with a filter for the engineering department using Select Star, the index on department is not enough. The engine must still visit the physical heap pages to fetch the ID, name, and salary columns, causing unnecessary disk reads."* | Animate red detour arrow to physical heap storage. |
| **17** | `Day01topic2/New_Day1Part2audio15.mp3` | `#indexOnlyScanGood` | Specific Projection Index Scan | *"Now let's look at the optimized approach using a specific projection. By selecting only the name and department columns and having a composite index on both of those fields, the engine reads only the index tree. The query is resolved entirely in memory, requiring zero physical heap page reads."* | Animate direct green return path with zero disk heap lookups. |
| **18** | `Day01topic2/New_Day1Part2audio16.mp3` | `#columnOrientedDbs` | Columnar Databases Intro | *"Taking it a step further, let's look at column-oriented databases. Analytical systems like Google BigQuery, Snowflake, and Amazon Redshift store data by column on disk rather than by row, which changes how data is retrieved."* | Highlight Snowflake/BigQuery/Redshift architecture container. |
| **19** | `Day01topic2/New_Day1Part2audio17.mp3` | `#cardZeroOverhead` | ZERO OVERHEAD Card | *"First, this enables zero overhead. Columnar databases read only the requested columns from disk, ensuring zero I/O is wasted on unused attributes. This design is ideal for analytical or OLAP workloads."* | Glow Zero Overhead metric badge. |
| **20** | `Day01topic2/New_Day1Part2audio18(new).mp3` | `#cardBilledPerByte` | BILLED PER BYTE Card | *"Second is billed per byte. Database engines bill you directly for the quantity of scanned data. By projecting only two columns instead of 10, you reduce the scan volume and cut your query cost by 80%. Designing efficient queries directly saves your operational budget."* | Glow 80% Cost Savings badge and cost calculator. |
| **21** | `Day01topic2/New_Day1Part2audio18.mp3` | `#cardCompression` | COMPRESSION Card | *"Third, we get extreme compression. Because similar data types are clustered together on disk, columnar data compresses significantly better than rows. This brings index-only scan benefits directly to the storage layer, saving massive disk space."* | Glow Compression ratio graphic. |
| **22** | `Day01topic2/New_Day1Part2audio19.mp3` | `#projectionProTip` | Outage Scenario Pro-Tip | *"To understand the real world impact of these concepts, consider this real world outage scenario. A backend team deployed Select Star on a users table. Six months later, a feature team added a profile picture BLOB column, storing binary image data up to two megabytes per user. Overnight, every query that previously returned 200 bytes per row now returned two megabytes per row, causing database memory exhaustion and a P0 outage. The fix was explicit column projection in every query. The lesson here is simple. Never use Select Star in Application Code."* | Illuminate Warning Outage box; show 200 bytes vs 2MB explosion callout. |
| **23** | `Day01topic2/New_Day1Part2audio20.mp3` | `#iqIndexOnlyScan` | Interview Q1: Index-Only Scan | *"Now let's discuss some interview questions. First, what is an index-only scan, and when does the optimizer use it? An index-only scan occurs when every column requested in the select list and where clause is present within a single index. The optimizer can resolve the entire query from the index B tree without reading the physical table heap pages, drastically reducing disk input output. To enable this, design covering indexes that include all frequently projected columns alongside filter columns."* | Expand Interview Q1 answer card. |
| **24** | `Day01topic2/New_Day1Part2audio21.mp3` | `#iqSelectStarCosts` | Interview Q2: SELECT * Costs | *"Next question, why does Select Star hurt performance even when all columns are small? Even with small columns, Select Star prevents the optimizer from using index-only scans, increases network payload per row, fills more buffer pool pages, reducing cache hit ratio for other queries, and makes your code fragile. If new columns are added to the table, all queries silently start fetching extra data. Explicit projection makes performance deterministic and code future proof."* | Expand Interview Q2 answer card. |
| **25** | `Day01topic2/New_Day1Part2audio22.mp3` | `#iqHeapScanVsIndexScan` | Interview Q3: Heap vs Index Scan | *"Now we have come to final question, what is the difference between a heap scan and an index scan? A heap scan, also known as a sequential or full table scan, reads every page of the physical table in order, resulting in an O(N) search cost regardless of your filters. An index scan traverses the B-tree index structure to locate matching row pointers in O(log N) time and then optionally fetches the actual row from the heap through a heap lookup. Finally, an index only scan skips that heap lookup step entirely when all the needed data is already present inside the index itself."* | Expand Interview Q3 comparison matrix ($O(N)$ vs $O(\log N)$ vs Index-Only). |
| **26** | `Day01topic2/New_Day1Part2Question01.mp3` | `#questionBar` | Practice Q1: Project Name & Dept | *"Now let's test our understanding with a quick challenge. In this question, we have to write a query to retrieve only the name and department columns from the employees table. The solution is to use specific column projection. By writing select name, department from employees, we explicitly list only the columns we need separated by a comma. This retrieves just those two fields, avoiding the overhead of fetching every column in the table."* | Switch to Studio, load Q1 card -> Type `SELECT name, department FROM employees;` -> Auto execute -> Show filtered 2-column result. |
| **27** | `Day01topic2/New_Day1Part2Question02.mp3` | `#questionBar` | Practice Q2: Project ID, Name, Salary | *"Let's look at our final challenge for this topic. Question two, write a query to project the columns ID, name and salary in that specific order from the employees table. Go ahead and write your query in the code editor below, click Run and verify your results. Once you have successfully completed this query, you are done with this lesson. Feel free to select our next topic from the dropdown, column aliasing."* | Load Practice Q2 card, highlight 3 required output columns. |

---

## 🎯 Synchronization Implementation Standards

When adding or fine-tuning visual animations in `mano-engine.js`:

1. **Auto-Scroll to Target Element**:
   ```javascript
   if (track.target) {
     const el = document.querySelector(track.target);
     if (el) {
       el.scrollIntoView({ behavior: 'smooth', block: 'center' });
       el.classList.add('audio-active-highlight');
     }
   }
   ```
2. **Timeline Seek State Cleanups**:
   - On `pause` or track switch, remove `.audio-active-highlight` from previous elements.
   - For practice question solutions, sync the typewriter speed with narration duration so query finishes typing precisely when narration finishes reading the query keywords.
3. **Multi-Column Alignment**:
   - All multi-column SQL queries must be formatted in clean, structured uppercase syntax.
