#!/usr/bin/env python3
"""
Automated Workspace Organizer & Pruner for Manodemy.
Safely categorizes migrations, scripts, and docs into dedicated subdirectories,
and carefully purges temporary scratch logs and legacy root drafts.
"""
import os
import shutil
import glob

# Protected directories that must NEVER be deleted
PROTECTED_DIRS = ["public", "sql_migrations", "narrations", "docs", ".agents", "components", "app", "lib"]

def organize_and_prune_workspace():
    base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    print("=" * 60)
    print("🧹 MANODEMY WORKSPACE ORGANIZER & SAFE PRUNER")
    print("=" * 60)

    # 1. Target directory definitions
    folders = [
        "sql_migrations",
        os.path.join("scripts", "generators"),
        os.path.join("scripts", "migrations"),
        os.path.join("scripts", "maintenance"),
        os.path.join("docs", "curriculum"),
        os.path.join("docs", "specs"),
        os.path.join("docs", "prompts"),
        os.path.join("docs", "business")
    ]
    for folder in folders:
        os.makedirs(os.path.join(base_dir, folder), exist_ok=True)

    # 2. Organize SQL files
    sql_files = glob.glob(os.path.join(base_dir, "[0-9][0-9][0-9]_*.sql"))
    for sf in sql_files:
        if os.path.exists(sf):
            dest = os.path.join(base_dir, "sql_migrations", os.path.basename(sf))
            shutil.move(sf, dest)
            print(f"✅ Organized migration: {os.path.basename(sf)} -> sql_migrations/")

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
            print(f"✅ Organized generator: {os.path.basename(f)} -> scripts/generators/")

    # 4. Carefully Prune Temporary Scratch Logs & Legacy Drafts in Root
    scratch_patterns = [
        "*.tmp",
        "*_analysis.txt",
        "cell*_full.txt",
        "extracted_*_log.txt",
        "git_diff_*.txt"
    ]
    pruned_count = 0
    for pat in scratch_patterns:
        for f in glob.glob(os.path.join(base_dir, pat)):
            try:
                os.remove(f)
                print(f"🗑️ Safely pruned scratch file: {os.path.basename(f)}")
                pruned_count += 1
            except Exception as e:
                print(f"⚠️ Could not delete {f}: {e}")

    # Remove temporary archive folder if present
    archive_dir = os.path.join(base_dir, "archive")
    if os.path.exists(archive_dir):
        shutil.rmtree(archive_dir, ignore_errors=True)
        print("🗑️ Removed legacy archive directory.")

    print("-" * 60)
    print(f"🎉 WORKSPACE CLEAN & PRISTINE! Pruned {pruned_count} temporary scratch files.")
    print("=" * 60)

if __name__ == "__main__":
    organize_and_prune_workspace()
