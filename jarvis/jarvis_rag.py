"""
J.A.R.V.I.S Lightweight Workspace Indexer & Context Provider
Extracts Day 01-18 curriculum, SQL learning challenges, and Marketing Reels catalog into an ultra-fast in-memory index.
"""
import json
import re
from pathlib import Path
from typing import Dict, Any, List

PROJECT_ROOT = Path(__file__).resolve().parent.parent
CURRICULUM_DIR = PROJECT_ROOT / "narrations"
MARKETING_DIR = PROJECT_ROOT / "marketing"
INDEX_FILE = Path(__file__).resolve().parent / "workspace_index.json"

def build_workspace_index() -> Dict[str, Any]:
    """Scans local project and builds lightweight structured metadata index."""
    index = {
        "curriculum": [],
        "reels": [],
        "platform_info": {
            "name": "Manodemy",
            "founder": "Deepak",
            "core_features": [
                "In-browser zero-setup SQL/Python sandbox (WASM/DuckDB)",
                "Day 01-18 SQL Learning Engine with studio audio narration",
                "Instant automated grading & smart error diagnostics",
                "Day 1 & Day 2 are 100% free"
            ]
        }
    }

    # 1. Index Curriculum Days from narrations/
    if CURRICULUM_DIR.exists():
        for json_file in sorted(CURRICULUM_DIR.glob("day-*.json")):
            try:
                data = json.loads(json_file.read_text(encoding="utf-8"))
                day_match = re.search(r"day-(\d+)", json_file.name)
                day_num = int(day_match.group(1)) if day_match else 0
                
                title = data.get("title", f"Day {day_num:02d}")
                summary = data.get("summary", "")
                topics = data.get("topics", [])
                
                # Extract key challenge titles
                challenges = []
                for q in data.get("questions", []):
                    challenges.append(q.get("title", "") or q.get("question", "")[:60])

                index["curriculum"].append({
                    "day": day_num,
                    "file": json_file.name,
                    "title": title,
                    "summary": summary[:250],
                    "topics": topics,
                    "challenge_count": len(challenges),
                    "sample_challenges": challenges[:3]
                })
            except Exception:
                pass

    # 2. Index Marketing Publishing Kits
    if MARKETING_DIR.exists():
        for kit_file in sorted(MARKETING_DIR.glob("*_Publishing_Kit.md")):
            try:
                content = kit_file.read_text(encoding="utf-8")
                reel_id = kit_file.stem.replace("_Publishing_Kit", "")
                
                # Extract topic & slot
                topic_match = re.search(r"\*\*Topic:\*\*\s*(.+)", content)
                slot_match = re.search(r"\*\*Slot:\*\*\s*(.+)", content)
                link_match = re.search(r"manodemy\.com/([a-zA-Z0-9_-]+)", content)
                
                index["reels"].append({
                    "reel_id": reel_id,
                    "topic": topic_match.group(1).strip() if topic_match else reel_id,
                    "slot": slot_match.group(1).strip() if slot_match else "General",
                    "bridge_link": f"manodemy.com/{link_match.group(1)}" if link_match else "manodemy.com"
                })
            except Exception:
                pass

    # Save to disk cache
    INDEX_FILE.write_text(json.dumps(index, indent=2), encoding="utf-8")
    return index

def get_workspace_index() -> Dict[str, Any]:
    """Returns cached index or builds fresh."""
    if INDEX_FILE.exists():
        try:
            return json.loads(INDEX_FILE.read_text(encoding="utf-8"))
        except Exception:
            pass
    return build_workspace_index()

def get_context_for_query(user_text: str) -> str:
    """Returns compact, token-efficient context tailored to the user's specific query."""
    index = get_workspace_index()
    user_lower = user_text.lower()
    
    # 1. Check if specific Day is requested (e.g., 'day 5', 'day 05', 'day five')
    day_match = re.search(r"\bday\s*0?(\d+)\b", user_lower)
    if day_match:
        day_num = int(day_match.group(1))
        for c in index["curriculum"]:
            if c["day"] == day_num:
                # Load full JSON for this specific day
                day_file = CURRICULUM_DIR / c["file"]
                if day_file.exists():
                    return f"[SPECIFIC WORKSPACE CONTEXT - DAY {day_num}]\nTitle: {c['title']}\nTopics: {c['topics']}\nRaw Content: {day_file.read_text(encoding='utf-8')[:1500]}"

    # 2. Check if specific Reel is requested
    reel_match = re.search(r"\b(sql-\d+-r\d+|reel\s*\d+|q\d+)\b", user_lower)
    if reel_match:
        return f"[MARKETING VAULT REELS INDEX]\n" + json.dumps(index["reels"], indent=1)

    # 3. Default: Compact summary index
    summary_view = {
        "platform": index["platform_info"],
        "available_curriculum_days": [f"Day {c['day']}: {c['title']} ({', '.join(c['topics'][:2])})" for c in index["curriculum"][:10]],
        "recent_reels": index["reels"][-4:] if index["reels"] else []
    }
    return f"[WORKSPACE METADATA INDEX]\n{json.dumps(summary_view, indent=1)}"

if __name__ == "__main__":
    idx = build_workspace_index()
    print(f"Index built: {len(idx['curriculum'])} curriculum days, {len(idx['reels'])} marketing reels.")
