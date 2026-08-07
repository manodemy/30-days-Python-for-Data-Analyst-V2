---
name: project-file-organizer
description: Standard operating procedure and automated tooling for maintaining a pristine, professional workspace hierarchy in Manodemy. Safely categorizes database migrations, scripts, docs, and legacy files into dedicated directories with zero file deletion and protects the live public web root. Trigger whenever the user asks to organize files, clean workspace, tidy directories, or check folder structure.
---

# 🧹 Project File Organizer Standard Operating Procedure

This skill provides an automated workflow to keep the **Manodemy** repository organized, intuitive, and clean like an enterprise-grade software project.

---

## 🏛️ 1. Master Workspace Hierarchy

| Folder | What Belongs Here |
| :--- | :--- |
| **`public/`** | **Production Web App Only:** Served by Vercel (`public/sql/`, `public/excel/`, `public/python/`, `home.html`, `Version-3/`, `notebook.js`, `notebook.css`). Never place loose generator scripts here. |
| **`sql_migrations/`** | All Supabase SQL migration files (`001_...sql` to `021_...sql`, `supabase_schema_v2.sql`, RPC scripts). |
| **`scripts/generators/`** | Day page & notebook generator scripts (`gen_*.py`, `generate_day_pages.py`, `create_excel_notebooks.py`). |
| **`scripts/migrations/`** | Seeding & theory migration tools (`migrate_users.py`, `push_sql_theory_to_supabase.py`). |
| **`scripts/maintenance/`** | Version bumbers, link checkers, health validators (`check_db.py`, `check_notebook.py`, `server.py`). |
| **`docs/`** | Curriculum specs, design documentation, and business analyses (`docs/curriculum/`, `docs/specs/`, `docs/business/`). |
| **`narrations/`** | ASR JSON timestamp files for all 60 days (`day-01.json` to `day-60.json`). |
| **`archive/`** | Legacy root HTML drafts and scratch logs safely archived without data loss. |
| **`.agents/skills/`** | Master skills registry (`SKILLS_INDEX.md`, `skills-registry.json`) and individual skill folders. |

---

## 🛡️ 2. Non-Negotiable Safety Rules

1. **Zero File Deletion:** Never run `rm` or `del` on user files. When organizing, always use `shutil.move` into categorized folders (`archive/`, `docs/`, `scripts/`).
2. **Never Break `public/` Paths:** Do not rename or move files inside `public/` unless explicitly requested, as Vercel serves the live website directly from `public/`.
3. **Keep Root Minimal:** The root folder must only contain top-level project configurations (`package.json`, `vercel.json`, `tsconfig.json`, `.gitignore`, `.env.local`).

---

## ⚙️ 3. Automated Reorganization Tool

Run the automated script to clean and organize the workspace safely:

```bash
python scripts/maintenance/organize_workspace.py
```
