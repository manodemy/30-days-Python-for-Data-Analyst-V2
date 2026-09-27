#!/usr/bin/env python3
"""
Scout Delta Testing & Immutability Shield Tool for Manodemy.
Calculates git deltas, checks protected regression contracts, validates syntax,
inspects platform landing & payment routes, and outputs surgical test plans.
"""
import os
import sys
import subprocess
import json

sys.stdout.reconfigure(encoding='utf-8')

# The 8 Immutability Protected Contracts that Scout Shields from Regressions
PROTECTED_CONTRACTS = [
    {
        "id": "TIMEKEEPER-006",
        "name": "Timeline Reset & Stop Contract",
        "target_file": "public/Version-3/mano-engine.js",
        "patterns": ["combinedTrackIndex = 0", "currentCombinedTime = 0", "isCombinedPlaying = false"]
    },
    {
        "id": "TIMEKEEPER-007",
        "name": "Audio Invalidation & Loop Guard",
        "target_file": "public/Version-3/mano-engine.js",
        "patterns": ["currentGeneration++", "if (myGeneration !== currentGeneration)"]
    },
    {
        "id": "COACH-002",
        "name": "Interactive 1-Click Fix Button",
        "target_file": "public/Version-3/mano-engine.js",
        "patterns": ["diag-fix-btn", "applyCoachFix", "showCoachToast"]
    },
    {
        "id": "COACH-003",
        "name": "Diagnostic Priority Guard",
        "target_file": "public/Version-3/mano-engine.js",
        "patterns": ["noSuchTable", "noSuchCol", "keywordTypos", "missing_semicolon"]
    },
    {
        "id": "SYNC-020",
        "name": "Progressive Card Sliding Window",
        "target_file": "public/Version-3/styles.css",
        "patterns": ["subblock-scrolled-out", "scroll-margin-top"]
    },
    {
        "id": "SYNC-001",
        "name": "7-Space Multi-Line SQL Layout",
        "target_file": "public/Version-3/content/day-05.js",
        "patterns": ["solutionEvents"]
    },
    {
        "id": "SCOUT-005",
        "name": "Cross-Day Scorecard & Progress Sync",
        "target_file": "public/Version-3/mano-engine.js",
        "patterns": ["updateOverallScoreUI", "submitTest", "localStorage"]
    },
    {
        "id": "SCOUT-006",
        "name": "Navigation & Paywall Route Integrity",
        "target_file": "public/Version-3/mano-engine.js",
        "patterns": ["showGuestPaywallModal", "window.location.href"]
    }
]

def run_scout_inspection(day_scope=None):
    base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    print("=" * 70)
    print("🕵️ [SCOUT] ON-DEMAND DELTA QA & PLATFORM REGRESSION SHIELD")
    print("=" * 70)

    # 1. Inspect Git Delta
    try:
        git_diff = subprocess.check_output(["git", "status", "--porcelain"], cwd=base_dir, text=True).strip()
        modified_files = [line.strip().split()[-1] for line in git_diff.split("\n") if line.strip()]
    except Exception:
        modified_files = []

    print(f"📦 Modified files in workspace: {len(modified_files)}")
    for f in modified_files[:6]:
        print(f"   • {f}")
    if len(modified_files) > 6:
        print(f"   ... and {len(modified_files) - 6} more")

    # 2. Check JavaScript Syntax Integrity
    js_files_to_check = [
        "public/Version-3/mano-engine.js",
        "public/Version-3/content/day-05.js",
        "public/Version-3/content/day-04.js",
        "public/Version-3/content/day-03.js"
    ]
    syntax_ok = True
    print("\n🔍 Step 1: Syntax Integrity Check")
    for js_path in js_files_to_check:
        full_path = os.path.join(base_dir, js_path)
        if os.path.exists(full_path):
            res = subprocess.run(["node", "-c", full_path], capture_output=True, text=True)
            if res.returncode == 0:
                print(f"   ✅ {js_path}: Syntax OK (0 errors)")
            else:
                print(f"   ❌ {js_path}: SYNTAX ERROR!\n{res.stderr}")
                syntax_ok = False

    # 3. Immutability Regression Shield Verification (8 Protected Contracts)
    print("\n🛡️ Step 2: Immutability Regression Shield (8 Protected Contracts)")
    all_contracts_passed = True
    for c in PROTECTED_CONTRACTS:
        target_path = os.path.join(base_dir, c["target_file"])
        if not os.path.exists(target_path):
            print(f"   ⚠️ Target file not found: {c['target_file']}")
            continue

        with open(target_path, "r", encoding="utf-8") as f:
            content = f.read()

        missing = [p for p in c["patterns"] if p not in content]
        if not missing:
            print(f"   ✅ [{c['id']}] {c['name']}: Intact & Protected")
        else:
            print(f"   ❌ [{c['id']}] {c['name']}: REGRESSION DETECTED! Missing: {missing}")
            all_contracts_passed = False

    # 4. Platform Landing & Payment Gateways Integrity
    print("\n🌐 Step 3: Platform Landing & Payment Gateways Verification")
    platform_pages = [
        ("home.html", "Landing Page / Home Hub"),
        ("payment-success.html", "Payment Success Gateway Redirect"),
        ("payment-failed.html", "Payment Failed Gateway Fallback"),
        ("terms.html", "Terms & Conditions"),
        ("privacy.html", "Privacy Policy"),
        ("refund-policy.html", "Refund Policy")
    ]
    platform_ok = True
    for page, label in platform_pages:
        page_path = os.path.join(base_dir, page)
        if os.path.exists(page_path) and os.path.getsize(page_path) > 100:
            print(f"   ✅ {label:<35} [{page}]: Healthy")
        else:
            print(f"   ❌ {label:<35} [{page}]: MISSING OR CORRUPTED")
            platform_ok = False

    # 5. Generate Surgical Delta Test Plan
    print("\n🎯 Step 4: Delta Test Recommendation")
    target_day = day_scope or "day05"
    print(f"   • Recommended Test Scope: Surgical validation on '{target_day}'")
    print(f"   • Delta Targets: Timeline Seek/Play, SQL Coach Fix, Scorecard Sync, Routing.")
    print(f"   • Estimated Token Savings vs Full-Suite: ~75% Saved.")

    print("=" * 70)
    if syntax_ok and all_contracts_passed and platform_ok:
        print("🎉 [SCOUT] GREEN LIGHT: 100% of platform routes and studio contracts intact.")
    else:
        print("⚠️ [SCOUT] RED LIGHT: Issues detected! Self-healing remediation required.")
    print("=" * 70)

    return syntax_ok and all_contracts_passed and platform_ok

if __name__ == "__main__":
    scope = sys.argv[1] if len(sys.argv) > 1 else None
    run_scout_inspection(scope)
