# 🧭 Manodemy Master Skills Index & Registry
*A unified, single-file catalog of all active and automated developer skills in the Manodemy codebase.*

---

## 🌟 Quick Reference Table

| # | Skill Name | Folder Location | Status | Primary Purpose | When It Automatically Triggers |
| :-: | :--- | :--- | :-: | :--- | :--- |
| **1** | **`project-file-organizer`** | [`.agents/skills/project-file-organizer/`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/.agents/skills/project-file-organizer/SKILL.md) | 🟢 Active | Workspace structure enforcement, moving loose scripts/docs, zero file loss | *"organize files"*, *"clean workspace"*, *"tidy repo"*, *"file structure"* |
| **2** | **`practice-question-audio-sync`** | [`.agents/skills/practice-question-audio-sync/`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/.agents/skills/practice-question-audio-sync/SKILL.md) | 🟢 Active | Word-level Whisper ASR sync, typewriter code narration, timeline continuation | *"audio sync"*, *"practice question audio"*, *"narration"*, *"typewriter"* |
| **3** | **`reddit-growth-copilot`** | [`.agents/skills/reddit-growth-copilot/`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/.agents/skills/reddit-growth-copilot/SKILL.md) | 🟢 Active | 7-Day Reddit launch, live comment response generator, preflight health checks | *"reddit launch"*, *"marketing"*, *"comment reply"*, *"conversion"* |
| **4** | **`day-curriculum-builder`** | [`.agents/skills/day-curriculum-builder/`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/.agents/skills/day-curriculum-builder/SKILL.md) | 🟡 Ready | Step-by-step creation of Days 05 to 60 with SQLite sandbox & practice questions | *"create day"*, *"new curriculum day"*, *"build lecture"* |

---

## 📁 1. `project-file-organizer`
* **File:** [`.agents/skills/project-file-organizer/SKILL.md`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/.agents/skills/project-file-organizer/SKILL.md)
* **What it does:**
  - Maintains a pristine project directory hierarchy.
  - Automatically moves database migrations to `sql_migrations/`, Python tools to `scripts/`, documentation to `docs/`, and legacy files to `archive/`.
  - Guarantees **zero file deletions** and protects the live `public/` web directory.

---

## 🎙️ 2. `practice-question-audio-sync`
* **File:** [`.agents/skills/practice-question-audio-sync/SKILL.md`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/.agents/skills/practice-question-audio-sync/SKILL.md)
* **What it does:**
  - Extracts word-level millisecond timestamps from Whisper ASR.
  - Syncs the code typewriter animation with audio solution narration.
  - Manages table scrolling, multi-column SQL formatting, and seamless scrubbing.

---

## 🚀 3. `reddit-growth-copilot`
* **File:** [`.agents/skills/reddit-growth-copilot/SKILL.md`](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/.agents/skills/reddit-growth-copilot/SKILL.md)
* **What it does:**
  - Guides the 7-day organic launch strategy on `r/SideProject`, `r/SQL`, `r/dataanalysis`, and `r/learnpython`.
  - Provides instant developer-first comment responses to technical critiques, bug reports, and pricing questions.
  - Runs pre-flight link validation and live comment monitoring.

---

## 🔄 How to Add or Update Skills in the Future
1. When you finalize a new pattern in chat, simply say: **`"Update the skill file with this new standard"`**.
2. The AI will immediately edit the corresponding `SKILL.md` and log the update in this master `SKILLS_INDEX.md`.
