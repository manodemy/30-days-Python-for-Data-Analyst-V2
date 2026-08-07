---
name: project-file-organizer
description: Standard operating procedure and automated tooling for maintaining a pristine, professional workspace hierarchy in Manodemy. Safely categorizes database migrations, scripts, docs, and carefully purges irrelevant temporary scratch files while strictly protecting the live public web root and core assets. Trigger whenever the user asks to organize files, clean workspace, tidy directories, remove unwanted files, or check folder structure.
---

# 🧹 Project File Organizer & Safe Pruner Standard Operating Procedure

This skill provides an automated workflow to keep the **Manodemy** repository organized, intuitive, and clean like an enterprise-grade software project.

---

## 🏛️ 1. Master Workspace Hierarchy

| Folder | What Belongs Here |
| :--- | :--- |
| **`public/`** | **Production Web App Only:** Served by Vercel (`public/sql/`, `public/excel/`, `public/python/`, `home.html`, `Version-3/`, `notebook.js`, `notebook.css`). Never place loose generator scripts or scratch logs here. |
| **`sql_migrations/`** | All Supabase SQL migration files (`001_...sql` to `021_...sql`, `supabase_schema_v2.sql`, RPC scripts). |
| **`scripts/generators/`** | Day page & notebook generator scripts (`gen_*.py`, `generate_day_pages.py`, `create_excel_notebooks.py`). |
| **`scripts/migrations/`** | Seeding & theory migration tools (`migrate_users.py`, `push_sql_theory_to_supabase.py`). |
| **`scripts/maintenance/`** | Version bumbers, link checkers, health validators (`organize_workspace.py`, `check_db.py`, `check_notebook.py`). |
| **`docs/`** | Curriculum specs, design documentation, and business analyses (`docs/curriculum/`, `docs/specs/`, `docs/business/`). |
| **`narrations/`** | ASR JSON timestamp files for all 60 days (`day-01.json` to `day-60.json`). |
| **`.agents/skills/`** | Master skills registry (`SKILLS_INDEX.md`, `skills-registry.json`) and individual skill folders. |

---

## 🛡️ 2. Careful Deletion & Pruning Rules

When cleaning the repository, follow these strict rules to eliminate clutter without risk:

1. **Safe to Delete (Whitelisted Irrelevant Files):**
   - Temporary scratch files (`*.tmp`, `cell*_full.txt`, `day*_analysis.txt`, `extracted_*_log.txt`, `git_diff_*.txt`).
   - Legacy duplicate drafts in root that already exist in `public/`.
   - Outdated temporary test folders (`archive/`, `scratch/*.tmp`).
2. **STRICTLY PROTECTED (Never Delete):**
   - Anything inside `public/` (Vercel production root).
   - Anything inside `sql_migrations/` (Supabase database schemas).
   - Anything inside `narrations/` (Audio timestamp JSONs).
   - Core root configuration files (`package.json`, `vercel.json`, `tsconfig.json`, `.gitignore`, `.env.local`).
3. **Automated Execution:**
   - To clean and prune safely at any time, run:
     ```bash
     python scripts/maintenance/organize_workspace.py
     ```
