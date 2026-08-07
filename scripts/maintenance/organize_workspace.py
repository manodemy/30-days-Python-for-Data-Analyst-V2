#!/usr/bin/env python3
"""
Automated Workspace Organizer for Manodemy.
Scans the repository and safely moves loose files into dedicated subdirectories with zero file deletions.
"""
import os
import shutil
import glob

def organize_workspace():
    base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    
    # 1. Target directory definitions
    folders = [
        "sql_migrations",
        os.path.join("scripts", "generators"),
        os.path.join("scripts", "migrations"),
        os.path.join("scripts", "maintenance"),
        os.path.join("docs", "curriculum"),
        os.path.join("docs", "specs"),
        os.path.join("docs", "prompts"),
        os.path.join("docs", "business"),
        os.path.join("archive", "legacy_root_html"),
        os.path.join("archive", "scratch_logs")
    ]
    
    for folder in folders:
        full_path = os.path.join(base_dir, folder)
        os.makedirs(full_path, exist_ok=True)

    # 2. Organize SQL files
    sql_files = glob.glob(os.path.join(base_dir, "[0-9][0-9][0-9]_*.sql"))
    for sf in sql_files:
        if os.path.exists(sf):
            dest = os.path.join(base_dir, "sql_migrations", os.path.basename(sf))
            shutil.move(sf, dest)
            print(f"Organized migration: {os.path.basename(sf)} -> sql_migrations/")

    # 3. Organize Generator scripts
    gen_patterns = [
        "gen_*.py",
        "day*_part*.py",
        "create_excel_notebooks.py",
        "create_sql_notebooks.py",
        "create_sqlite_dbs.py",
        "generate_*.py",
        "sql_curriculum.py"
    ]
    for pat in gen_patterns:
        for f in glob.glob(os.path.join(base_dir, pat)):
            dest = os.path.join(base_dir, "scripts", "generators", os.path.basename(f))
            shutil.move(f, dest)
            print(f"Organized generator: {os.path.basename(f)} -> scripts/generators/")

    # 4. Organize Root HTML drafts
    root_htmls = glob.glob(os.path.join(base_dir, "day*.html"))
    for rh in root_htmls:
        if os.path.exists(rh):
            dest = os.path.join(base_dir, "archive", "legacy_root_html", os.path.basename(rh))
            shutil.move(rh, dest)
            print(f"Archived root draft: {os.path.basename(rh)} -> archive/legacy_root_html/")

    print("[SUCCESS] Manodemy repository is cleanly organized. Zero files deleted.")

if __name__ == "__main__":
    organize_workspace()
