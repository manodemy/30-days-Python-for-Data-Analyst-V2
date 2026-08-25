"""
Direct End-to-End Programmatic Video Builder & Publisher for Manodemy Marketing Engine
Executes the full pipeline in pure code: Speech Synthesis -> Whisper ASR -> 3-Layer Audio Mastering -> Deterministic Video Render -> Publish Pack JSON.
"""

import os
import sys
import json
import time
import asyncio
import hashlib
import subprocess
from pathlib import Path
from pydub import AudioSegment
from playwright.async_api import async_playwright

# ---------------------------------------------------------------
# ⚡ WHISPER RESULT CACHE — skip re-transcription on same audio
# ---------------------------------------------------------------
def _whisper_cached_transcribe(narration_path: Path, model, reel_no: str, script_text: str) -> dict:
    """Return cached Whisper result keyed on reel_no + script text (stable across re-runs)."""
    cache_dir = narration_path.parent / ".whisper_cache"
    cache_dir.mkdir(exist_ok=True)
    # Key on script TEXT (stable), NOT audio bytes (Edge-TTS is non-deterministic)
    text_hash = hashlib.md5((reel_no + script_text).encode('utf-8')).hexdigest()[:14]
    cache_file = cache_dir / f"{reel_no}_{text_hash}.json"
    if cache_file.exists():
        print("   ✓ Whisper cache HIT — skipping re-transcription (saved ~9s)", flush=True)
        return json.loads(cache_file.read_text(encoding='utf-8'))
    print("   🔄 Whisper cache MISS — running transcription...", flush=True)
    result = model.transcribe(str(narration_path), word_timestamps=True)
    cache_file.write_text(
        json.dumps(result, ensure_ascii=False, default=str), encoding='utf-8'
    )
    return result

import re

def align_expected_phrase(expected_text: str, raw_whisper_words: list, phrase_start_ms: int, phrase_end_ms: int) -> list:
    """
    Takes clean ground-truth script words and aligns them to raw Whisper acoustic timestamps.
    Preserves 100% correct spelling & punctuation while locking onto actual spoken timing.
    """
    expected_words = [w.strip() for w in expected_text.split() if w.strip()]
    if not expected_words:
        return []
    
    if not raw_whisper_words:
        dur = max(200, phrase_end_ms - phrase_start_ms)
        step = dur / len(expected_words)
        return [
            {
                "word": w,
                "startMs": round(phrase_start_ms + i * step),
                "endMs": round(phrase_start_ms + (i + 1) * step)
            }
            for i, w in enumerate(expected_words)
        ]
    
    result = []
    w_idx = 0
    num_exp = len(expected_words)
    num_wh = len(raw_whisper_words)
    
    for e_i, exp_w in enumerate(expected_words):
        clean_exp = re.sub(r"[^\w]", "", exp_w.lower())
        
        if w_idx >= num_wh:
            last_end = result[-1]["endMs"] if result else phrase_start_ms
            rem_words = num_exp - e_i
            step = max(100, (phrase_end_ms - last_end) / max(1, rem_words))
            result.append({
                "word": exp_w,
                "startMs": round(last_end),
                "endMs": round(last_end + step)
            })
            continue

        cur_wh = raw_whisper_words[w_idx]
        clean_wh = re.sub(r"[^\w]", "", cur_wh["word"].lower())

        is_compound = False
        if clean_exp != clean_wh:
            remaining_exp = expected_words[e_i:]
            remaining_wh = raw_whisper_words[w_idx:]
            
            if len(remaining_wh) == 1 and len(remaining_exp) > 1:
                is_compound = True
                matched_group = remaining_exp
            elif (clean_exp in clean_wh) or (clean_wh[:4] == clean_exp[:4] and len(clean_wh) > len(clean_exp) + 2):
                matched_group = [exp_w]
                temp_i = e_i + 1
                while temp_i < num_exp and (len(remaining_wh) - 1) < (num_exp - temp_i):
                    matched_group.append(expected_words[temp_i])
                    temp_i += 1
                if len(matched_group) > 1:
                    is_compound = True

            if is_compound:
                wh_start = cur_wh["startMs"]
                wh_end = cur_wh["endMs"]
                wh_dur = wh_end - wh_start
                total_len = sum(len(w) for w in matched_group)
                cur_t = wh_start
                for g_idx, g_w in enumerate(matched_group):
                    ratio = len(g_w) / max(1, total_len)
                    g_dur = ratio * wh_dur
                    result.append({
                        "word": g_w,
                        "startMs": round(cur_t),
                        "endMs": round(cur_t + g_dur)
                    })
                    cur_t += g_dur
                w_idx += 1
                break

        if clean_wh in clean_exp and clean_exp != clean_wh:
            wh_start = cur_wh["startMs"]
            wh_end = cur_wh["endMs"]
            combined = clean_wh
            temp_w = w_idx + 1
            while temp_w < num_wh:
                next_wh = re.sub(r"[^\w]", "", raw_whisper_words[temp_w]["word"].lower())
                if next_wh and (combined + next_wh) in clean_exp:
                    combined += next_wh
                    wh_end = raw_whisper_words[temp_w]["endMs"]
                    temp_w += 1
                else:
                    break
            result.append({
                "word": exp_w,
                "startMs": wh_start,
                "endMs": wh_end
            })
            w_idx = temp_w
            continue

        result.append({
            "word": exp_w,
            "startMs": cur_wh["startMs"],
            "endMs": cur_wh["endMs"]
        })
        w_idx += 1

    return result

if sys.platform == "win32":
    try:
        sys.stdout.reconfigure(encoding="utf-8")
        sys.stderr.reconfigure(encoding="utf-8")
    except:
        pass

PROJECT_ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

OUTPUT_DIR = PROJECT_ROOT / "marketing" / "output" / "video"
AUDIO_DIR = PROJECT_ROOT / "marketing" / "output" / "audio"
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
AUDIO_DIR.mkdir(parents=True, exist_ok=True)

# Master Reels Catalog
REELS_CATALOG = {
    "SQL-01-R1": {
        "reelNo": "SQL-01-R1",
        "day": "DAY 04",
        "badge": "SQL · NULL Trap",
        "hook": "90% FAIL THIS SQL TRAP 💀\nRETURN 0-ROWS ?",
        "hookLineObjects": [
            {"text": "90% FAIL THIS SQL TRAP 💀", "font": "Plus Jakarta Sans", "size": 6.3},
            {"text": "RETURN 0-ROWS ?", "font": "Outfit", "size": 5.5}
        ],
        "hookHighlights": [
            {"text": "90%", "color": "#facc15"},
            {"text": "0-ROWS", "color": "#00f0ff"}
        ],
        "lang": "sql",
        "codeA": "SELECT *\nFROM employees\nWHERE dept_id NOT IN (\n  SELECT dept_id\n  FROM departments\n)",
        "codeB": "SELECT *\nFROM employees\nWHERE dept_id NOT IN (\n  SELECT dept_id\n  FROM departments\n  WHERE dept_id IS NOT NULL\n)",
        "pollInstr": "DROP YOUR VOTE IN COMMENTS 👇",
        "clockSfx": "bomb",
        "ccStyle": "hormozi",
        "ccEnabled": True,
        "voice": "en-US-AndrewNeural",
        "voiceScript": "Ninety percent fail this SQL trap.\nOne of these silently returns zero rows.\nChoose your answer.\nOption A or Option B?\nComment your answer with reason below.",
        "caption": "90% FAIL THIS SQL TRAP 💀\nOne of these silently returns ZERO rows!\n\nCan you spot the trap before checking the pinned comment? \n\nDrop your vote (A or B) below 👇\n\n\nPractice Data Skills \n👉 Day 1 & Day 2 are 100% FREE\n🔗 Link in bio\n\n#sql #sqlinterview #sqltips #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis",
        "pinnedAnswer": "Option A is the trap ❌ | Option B is correct ✅\n\nWhy Option A returns 0 rows:\n`NOT IN` expands into multiple `!=` with `AND`. \nIf even ONE value in the subquery is `NULL`, `val != NULL` evaluates to UNKNOWN — which silently fails the entire WHERE clause for every single row!\n\nOption B safely filters out NULLs first with `WHERE dept_id IS NOT NULL`.\n\n💡 Pro-tip: In production, avoid `NOT IN` on subqueries and just use `NOT EXISTS`.\n\nBe honest — did you get this right? 👇",
        "link": "https://manodemy.in"
    },
    "SQL-01-R2": {
        "reelNo": "SQL-01-R2",
        "day": "DAY 04",
        "badge": "SQL · NULL Trap",
        "hook": "HR CALLED: TOTAL PAY IS NULL 💸\nWHICH QUERY FIXES PAYROLL ?",
        "hookLineObjects": [
            {"text": "HR CALLED: TOTAL PAY IS NULL 💸", "font": "Plus Jakarta Sans", "size": 5.4},
            {"text": "WHICH QUERY FIXES PAYROLL ?", "font": "Outfit", "size": 5.2}
        ],
        "hookHighlights": [
            {"text": "TOTAL PAY IS NULL", "color": "#facc15"},
            {"text": "FIXES PAYROLL", "color": "#00f0ff"}
        ],
        "lang": "sql",
        "codeA": "SELECT emp_name,\n       base_salary + bonus AS total_pay\nFROM employees",
        "codeB": "SELECT emp_name,\n       base_salary + COALESCE(bonus, 0) AS total_pay\nFROM employees",
        "pollInstr": "DROP YOUR VOTE IN COMMENTS 👇",
        "clockSfx": "bomb",
        "ccStyle": "hormozi",
        "ccEnabled": True,
        "voice": "en-US-AndrewNeural",
        "voiceScript": "Salary day, and HR says total pay is NULL!\nWhich query fixes payroll for every employee?\nChoose your answer.\nOption A...\nor Option B?\nDrop your vote in the comments below.",
        "caption": "HR CALLED: TOTAL PAY IS NULL 💸\nWhich query fixes payroll for every employee?\n\nCan you spot the trap before checking the pinned comment? \n\nDrop your vote (A or B) below 👇\n\n\nPractice Data Skills \n👉 Day 1 & Day 2 are 100% FREE\n🔗 Link in bio\n\n#sql #sqlinterview #sqltips #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis",
        "pinnedAnswer": "Option A is the trap ❌ | Option B is correct ✅\n\nWhy Option A turns salary into NULL:\nIn SQL, any arithmetic with NULL results in NULL (e.g. $50,000 + NULL = NULL!).\nSo employees without a bonus end up with NULL total pay instead of their base salary!\n\nOption B safely fixes this with `COALESCE(bonus, 0)`.\n\n💡 Pro-tip: Always wrap optional numeric columns in COALESCE when doing math!\n\nBe honest — did you get this right? 👇",
        "link": "https://manodemy.in"
    },
    "SQL-02-R1": {
        "reelNo": "SQL-02-R1",
        "day": "DAY 05",
        "badge": "SQL · Window Functions",
        "hook": "TOP 3 EARNERS TRAP 🏆\nAVOIDS SKIPPING RANKS ?",
        "hookLineObjects": [
            {"text": "TOP 3 EARNERS TRAP 🏆", "font": "Plus Jakarta Sans", "size": 6.0},
            {"text": "AVOIDS SKIPPING RANKS ?", "font": "Outfit", "size": 5.2}
        ],
        "hookHighlights": [
            {"text": "TOP 3 EARNERS", "color": "#facc15"},
            {"text": "SKIPPING RANKS", "color": "#00f0ff"}
        ],
        "lang": "sql",
        "codeA": "SELECT emp_name, salary, rk\nFROM (\n  SELECT emp_name, salary,\n         RANK() OVER (ORDER BY salary DESC) AS rk\n  FROM employees\n) t\nWHERE rk <= 3",
        "codeB": "SELECT emp_name, salary, rk\nFROM (\n  SELECT emp_name, salary,\n         DENSE_RANK() OVER (ORDER BY salary DESC) AS rk\n  FROM employees\n) t\nWHERE rk <= 3",
        "pollInstr": "DROP YOUR VOTE IN COMMENTS 👇",
        "clockSfx": "bomb",
        "ccStyle": "hormozi",
        "ccEnabled": True,
        "voice": "en-US-AndrewNeural",
        "voiceScript": "Top 3 earners, but two employees have same salary!\nWhich query avoids skipping ranks?\nChoose your answer.\nOption A...\nor Option B?\nDrop your vote in the comments below.",
        "caption": "TOP 3 EARNERS TRAP 🏆\nWhich query avoids skipping ranks?\n\nCan you spot the trap before checking the pinned comment? \n\nDrop your vote (A or B) below 👇\n\n\nPractice Data Skills \n👉 Day 1 & Day 2 are 100% FREE\n🔗 Link in bio\n\n#sql #sqlinterview #windowfunctions #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis",
        "pinnedAnswer": "Option A is the trap ❌ | Option B is correct ✅\n\nWhy Option A misses true top 3 earners:\nWhen salaries tie (e.g. two people earn $120k), `RANK()` gives ranks 1, 1, 3 — skipping rank 2!\nIf 3 people tie at 1st place (1, 1, 1, 4), `WHERE rk <= 3` completely misses the 2nd and 3rd highest salary tiers!\n\n`DENSE_RANK()` gives consecutive ranks (1, 1, 2, 3) with zero gaps, guaranteeing you fetch true top 3 distinct salary levels!\n\n💡 Pro-tip: Use ROW_NUMBER for pagination, DENSE_RANK for leaderboard ties!\n\nBe honest — did you get this right? 👇",
        "link": "https://manodemy.in"
    },
    "SQL-02-R2": {
        "reelNo": "SQL-02-R2",
        "day": "DAY 05",
        "badge": "SQL · Running Total",
        "hook": "RUNNING TOTAL DISASTER 💸\nWHICH GIVES ROW-BY-ROW SUM ?",
        "hookLineObjects": [
            {"text": "RUNNING TOTAL DISASTER 💸", "font": "Plus Jakarta Sans", "size": 5.6},
            {"text": "WHICH GIVES ROW-BY-ROW SUM ?", "font": "Outfit", "size": 5.0}
        ],
        "hookHighlights": [
            {"text": "RUNNING TOTAL", "color": "#facc15"},
            {"text": "ROW-BY-ROW", "color": "#00f0ff"}
        ],
        "lang": "sql",
        "codeA": "SELECT order_date, amount,\n       SUM(amount) OVER (\n         ORDER BY order_date\n         ROWS UNBOUNDED PRECEDING\n       ) AS running_total\nFROM orders",
        "codeB": "SELECT order_date, amount,\n       SUM(amount) OVER (\n         ORDER BY order_date\n       ) AS running_total\nFROM orders",
        "pollInstr": "DROP YOUR VOTE IN COMMENTS 👇",
        "clockSfx": "bomb",
        "ccStyle": "hormozi",
        "ccEnabled": True,
        "voice": "en-US-AndrewNeural",
        "voiceScript": "Running total disaster on same-day orders!\nWhich query gives a true row-by-row sum?\nChoose your answer.\nOption A...\nor Option B?\nDrop your vote in the comments below.",
        "caption": "RUNNING TOTAL DISASTER 💸\nWhich query gives a true row-by-row sum on same-day orders?\n\nCan you spot the trap before checking the pinned comment? \n\nDrop your vote (A or B) below 👇\n\n\nPractice Data Skills \n👉 Day 1 & Day 2 are 100% FREE\n🔗 Link in bio\n\n#sql #sqlinterview #windowfunctions #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis",
        "pinnedAnswer": "Option A is correct ✅ | Option B is the trap ❌\n\nWhy Option B fails on same-day orders:\nIf you don't specify a window frame after `ORDER BY`, SQL defaults to `RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`.\n`RANGE` treats duplicate dates as a single tied group — adding all same-day amounts together in one sudden jump!\n\nOption A explicitly uses `ROWS UNBOUNDED PRECEDING`, forcing SQL to accumulate strictly row by row!\n\n💡 Pro-tip: Always specify `ROWS` in cumulative window sums!\n\nBe honest — did you get this right? 👇",
        "link": "https://manodemy.in"
    },
    "SQL-03-R1": {
        "reelNo": "SQL-03-R1",
        "day": "DAY 04",
        "badge": "SQL · Aggregations",
        "hook": "COUNT(*) VS COUNT(COL) 🔢\nWhich query counts all employees without dropping NULLs?",
        "hookLineObjects": [
            {"text": "COUNT(*) VS COUNT(COL) 🔢", "font": "Plus Jakarta Sans", "size": 5.2},
            {"text": "Which query counts all employees without dropping NULLs?", "font": "Space Grotesk", "size": 3.4}
        ],
        "hookHighlights": [
            {"text": "COUNT(*)", "color": "#facc15"},
            {"text": "without dropping NULLs", "color": "#00f0ff"}
        ],
        "lang": "sql",
        "codeA": "SELECT department_id,\n       COUNT(commission) AS total_emps\nFROM employees\nWHERE department_id = 20",
        "codeB": "SELECT department_id,\n       COUNT(*) AS total_emps\nFROM employees\nWHERE department_id = 20",
        "pollInstr": "DROP YOUR VOTE IN COMMENTS 👇",
        "clockSfx": "bomb",
        "ccStyle": "hormozi",
        "ccEnabled": True,
        "voice": "en-US-AndrewNeural",
        "voiceScript": "Ninety percent fail this SQL aggregation trap!\nWhich query counts all employees without dropping nulls?\nChoose your answer.\nOption A...\nor Option B?\nDrop your vote in the comments below.",
        "caption": "COUNT(*) VS COUNT(COL) 🔢\nWhich query counts all employees without dropping NULLs?\n\nCan you spot the trap before checking the pinned comment? \n\nDrop your vote (A or B) below 👇\n\n\nPractice Data Skills \n👉 Day 1 & Day 2 are 100% FREE\n🔗 Link in bio / manodemy.com/q5\n\n#sql #sqlinterview #sqltips #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis",
        "pinnedAnswer": "Option A is the trap ❌ | Option B is correct ✅\n\nWhy Option A undercounts employees:\n`COUNT(column_name)` ONLY counts rows where the column is NOT NULL. If an employee has NULL commission, they are silently excluded from the headcount!\n`COUNT(*)` counts total physical rows regardless of NULLs.\n\n💡 Pro-tip: Always use `COUNT(*)` for row counts and `COUNT(col)` only when checking non-null presence!\n\nBe honest — did you get this right? 👇",
        "link": "https://www.manodemy.com/q5"
    },
    "SQL-03-R2": {
        "reelNo": "SQL-03-R2",
        "day": "DAY 04",
        "badge": "SQL · Precedence",
        "hook": "SQL \"OR\" PRECEDENCE BUG 🐛\nWhich query returns strictly active employees in Dept 10 or 20?",
        "hookLineObjects": [
            {"text": "SQL \"OR\" PRECEDENCE BUG 🐛", "font": "Plus Jakarta Sans", "size": 5.2},
            {"text": "Which query returns strictly active employees in Dept 10 or 20?", "font": "Space Grotesk", "size": 3.4}
        ],
        "hookHighlights": [
            {"text": "PRECEDENCE BUG", "color": "#facc15"},
            {"text": "strictly active employees", "color": "#00f0ff"}
        ],
        "lang": "sql",
        "codeA": "SELECT first_name, department_id, is_active\nFROM employees\nWHERE is_active = 1\n  AND department_id = 20\n   OR department_id = 10",
        "codeB": "SELECT first_name, department_id, is_active\nFROM employees\nWHERE is_active = 1\n  AND (department_id = 20 OR department_id = 10)",
        "pollInstr": "DROP YOUR VOTE IN COMMENTS 👇",
        "clockSfx": "bomb",
        "ccStyle": "hormozi",
        "ccEnabled": True,
        "voice": "en-US-AndrewNeural",
        "voiceScript": "The sneakiest Boolean operator bug in SQL!\nWhich query returns strictly active employees in department ten or twenty?\nChoose your answer.\nOption A...\nor Option B?\nDrop your vote in the comments below.",
        "caption": "SQL \"OR\" PRECEDENCE BUG 🐛\nWhich query returns strictly ACTIVE employees in Dept 10 or 20?\n\nCan you spot the trap before checking the pinned comment? \n\nDrop your vote (A or B) below 👇\n\n\nPractice Data Skills \n👉 Day 1 & Day 2 are 100% FREE\n🔗 Link in bio / manodemy.com/q6\n\n#sql #sqlinterview #sqltips #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis",
        "pinnedAnswer": "Option A is the trap ❌ | Option B is correct ✅\n\nWhy Option A returns inactive employees:\nIn SQL operator precedence, `AND` takes priority over `OR` (`A AND B OR C` evaluates as `(A AND B) OR C`).\nBecause of this, ANY employee in Department 10 is returned — even if they are inactive (`is_active = 0`)!\n\nOption B uses parentheses `AND (dept = 20 OR dept = 10)` to strictly enforce active status on both departments.\n\n💡 Pro-tip: Always use parentheses when mixing AND and OR in WHERE clauses!\n\nBe honest — did you get this right? 👇",
        "link": "https://www.manodemy.com/q6"
    }
}

DEFAULT_REEL = REELS_CATALOG["SQL-02-R2"]

async def build_direct_video(reel=DEFAULT_REEL, is_4k=False, fps=30):
    start_total = time.time()
    reel_no = reel["reelNo"]
    w = 2160 if is_4k else 1080
    h = 3840 if is_4k else 1920
    res_label = "4K_2160p" if is_4k else "FullHD_1080p"
    
    print("==================================================================", flush=True)
    print(f"🚀 DIRECT CODE PIPELINE: Building [{reel_no}] ({res_label} @ {fps}fps)", flush=True)
    print("==================================================================", flush=True)

    # -------------------------------------------------------------
    # STEP 1: AI Speech Synthesis & Exact Cues Timing (Edge-TTS)
    # -------------------------------------------------------------
    print("\n🎙️ [STEP 1/5] Synthesizing Multi-Chunk Speech with Edge-TTS...", flush=True)
    import edge_tts
    import tempfile
    
    voice_lines = [l.strip() for l in reel["voiceScript"].split("\n") if l.strip()]
    hook_text = voice_lines[0] if len(voice_lines) > 0 else "Ninety nine percent fail this trap."
    line2_text = voice_lines[1] if len(voice_lines) > 1 else "One of these has an unexpected bug."
    choose_text = voice_lines[2] if len(voice_lines) > 2 else "Choose your answer."
    cta_text = voice_lines[5] if len(voice_lines) > 5 else (voice_lines[-1] if voice_lines else "Drop your vote in the comments below.")

    chunks = [
        ("hook", hook_text),
        ("line2", line2_text),
        ("choose", choose_text),
        ("optA", "Option A..."),
        ("optB", "or Option B?"),
        ("cta", cta_text)
    ]
    
    durations = {}
    audio_segments = {}
    with tempfile.TemporaryDirectory() as tmpdir:
        for key, text in chunks:
            tfile = Path(tmpdir) / f"{key}.mp3"
            saved = False
            for attempt in range(4):
                try:
                    com = edge_tts.Communicate(text, reel["voice"], rate="+3%", pitch="+1Hz")
                    await com.save(str(tfile))
                    saved = True
                    break
                except Exception as e:
                    print(f"   ⚠️ Edge-TTS chunk '{key}' retry {attempt+1}/4... ({e})", flush=True)
                    await asyncio.sleep(1.2)
            if not saved:
                raise RuntimeError(f"Failed to synthesize audio chunk '{key}'")
            seg = AudioSegment.from_file(str(tfile))
            durations[key] = len(seg)
            audio_segments[key] = seg

    dur_hook = durations["hook"]
    dur_line2 = durations["line2"]
    dur_choose = durations["choose"]
    dur_opta = durations["optA"]
    dur_optb = durations["optB"]
    dur_cta = durations["cta"]

    t_hook_start = 0
    t_line2_start = dur_hook
    t_clock_in = t_line2_start + dur_line2 + 50
    tension_ms = 2400

    raw_narration = (
        audio_segments["hook"] +
        audio_segments["line2"] +
        AudioSegment.silent(duration=50) +
        audio_segments["choose"] +
        audio_segments["optA"] +
        audio_segments["optB"] +
        AudioSegment.silent(duration=tension_ms) +
        audio_segments["cta"] +
        AudioSegment.silent(duration=300)
    )
    narration_out = AUDIO_DIR / f"{reel_no}_narration.mp3"
    raw_narration.export(str(narration_out), format="mp3", bitrate="320k")
    print(f"   ✓ Narration track stitched: {len(raw_narration)/1000.0:.2f}s total duration", flush=True)

    # -------------------------------------------------------------
    # STEP 2: Ground-Truth Whisper ASR Word Alignment on Stitched Track
    # -------------------------------------------------------------
    print("\n📝 [STEP 2/5] Extracting Whisper AI Word Timestamps from Stitched Narration...", flush=True)
    import whisper
    whisper_model = whisper.load_model('base')
    # Cache key = reel_no + all script text (stable; Edge-TTS audio bytes are non-deterministic)
    _script_key = reel_no + reel.get("hook","") + reel.get("codeA","") + reel.get("codeB","")
    w_res = _whisper_cached_transcribe(narration_out, whisper_model, reel_no, _script_key)
    w_segs = w_res.get('segments', [])

    def extract_words_from_segs(segs):
        extracted = []
        for s in segs:
            for w_tok in s.get('words', []):
                clean_w = w_tok['word'].strip()
                if clean_w:
                    extracted.append({
                        "word": clean_w,
                        "startMs": round(w_tok['start'] * 1000),
                        "endMs": round(w_tok['end'] * 1000)
                    })
        return extracted

    all_raw_words = extract_words_from_segs(w_segs)

    # Find acoustic anchor indices in Whisper word list:
    # 1. Line 2 start
    idx_line2 = 0
    for i, tok in enumerate(all_raw_words):
        clean_tok = re.sub(r"[^\w]", "", tok["word"].lower())
        if i >= 3 and (tok["startMs"] >= dur_hook - 400 or clean_tok in ["which", "what", "how", "one", "top", "why"]):
            idx_line2 = i
            break
    if idx_line2 == 0:
        idx_line2 = max(1, min(len(all_raw_words) - 1, len(hook_text.split())))

    # 2. Choose answer start
    idx_choose = idx_line2
    for i in range(idx_line2, len(all_raw_words)):
        clean_tok = re.sub(r"[^\w]", "", all_raw_words[i]["word"].lower())
        if clean_tok in ["choose", "pick", "select"] or all_raw_words[i]["startMs"] >= (dur_hook + dur_line2 - 300):
            idx_choose = i
            break

    # 3. Option A start
    idx_opta = idx_choose
    for i in range(idx_choose, len(all_raw_words)):
        clean_tok = re.sub(r"[^\w]", "", all_raw_words[i]["word"].lower())
        if clean_tok == "option":
            idx_opta = i
            break

    # 4. Option B start
    idx_optb = idx_opta + 1
    for i in range(idx_opta + 1, len(all_raw_words)):
        clean_tok = re.sub(r"[^\w]", "", all_raw_words[i]["word"].lower())
        if clean_tok in ["or", "option"]:
            idx_optb = i
            break

    # 5. CTA start
    idx_cta = idx_optb + 1
    for i in range(idx_optb + 1, len(all_raw_words)):
        clean_tok = re.sub(r"[^\w]", "", all_raw_words[i]["word"].lower())
        if clean_tok in ["drop", "comment", "vote", "share"]:
            idx_cta = i
            break

    t_hook_start = 0
    t_line2_start = all_raw_words[idx_line2]["startMs"] if all_raw_words and idx_line2 < len(all_raw_words) else dur_hook
    t_clock_in = all_raw_words[idx_choose]["startMs"] if all_raw_words and idx_choose < len(all_raw_words) else (t_line2_start + dur_line2)
    t_opta = all_raw_words[idx_opta]["startMs"] if all_raw_words and idx_opta < len(all_raw_words) else (t_clock_in + dur_choose)
    t_optb = all_raw_words[idx_optb]["startMs"] if all_raw_words and idx_optb < len(all_raw_words) else (t_opta + dur_opta)
    
    wh_optb = all_raw_words[idx_optb:idx_cta]
    t_optb_end = wh_optb[-1]["endMs"] if wh_optb else (t_optb + dur_optb)
    
    t_cta_start = all_raw_words[idx_cta]["startMs"] if all_raw_words and idx_cta < len(all_raw_words) else round((len(raw_narration) - dur_cta - 300))
    t_clock_out = t_cta_start
    t_voice_end = all_raw_words[-1]["endMs"] + 120 if all_raw_words else round(len(raw_narration))

    # Align clean script words with acoustic timestamps for each phrase:
    p0_words = align_expected_phrase(hook_text, all_raw_words[:idx_line2], t_hook_start, t_line2_start)
    p1_words = align_expected_phrase(line2_text, all_raw_words[idx_line2:idx_choose], t_line2_start, t_clock_in)
    p2_words = align_expected_phrase("Choose your answer...", all_raw_words[idx_choose:idx_opta], t_clock_in, t_opta)
    p3_words = align_expected_phrase("Option A...", all_raw_words[idx_opta:idx_optb], t_opta, t_optb)
    p4_words = align_expected_phrase("or Option B?", all_raw_words[idx_optb:idx_cta], t_optb, t_optb_end)
    p5_words = align_expected_phrase(cta_text, all_raw_words[idx_cta:], t_cta_start, t_voice_end)

    phrases = [
        {"index": 0, "text": hook_text, "startMs": t_hook_start, "endMs": t_line2_start, "words": p0_words},
        {"index": 1, "text": line2_text, "startMs": t_line2_start, "endMs": t_clock_in, "words": p1_words},
        {"index": 2, "text": "Choose your answer...", "startMs": t_clock_in, "endMs": t_opta, "words": p2_words},
        {"index": 3, "text": "Option A...", "startMs": t_opta, "endMs": t_optb, "words": p3_words},
        {"index": 4, "text": "or Option B?", "startMs": t_optb, "endMs": t_optb_end + 350, "words": p4_words},
        {"index": 5, "text": cta_text, "startMs": t_cta_start, "endMs": t_voice_end, "words": p5_words}
    ]
    all_words = p0_words + p1_words + p2_words + p3_words + p4_words + p5_words
    print(f"   ✓ Extracted {len(all_words)} word cues across {len(phrases)} perfectly aligned phrases", flush=True)

    hold_ms = 1500  # 1.5-second hold after voiceover finishes for user reaction
    total_ms = t_voice_end + hold_ms
    total_sec = total_ms / 1000.0

    cues_data = {
        "t_hook_start": t_hook_start,
        "t_line2_start": t_line2_start,
        "t_clock_in": t_clock_in,
        "t_opta": t_opta,
        "t_optb": t_optb,
        "t_optb_end": t_optb_end + 350,  # Exact Card B glow END from Whisper (phrase 4 endMs + 350ms buffer)
        "t_clock_out": t_clock_out,
        "t_cta_start": t_cta_start,
        "t_voice_end": t_voice_end,
        "totalMs": total_ms,
        "clockDurationMs": (t_clock_out - t_clock_in),
        "wordCues": all_words,
        "phrases": phrases
    }

    # -------------------------------------------------------------
    # STEP 3: Studio 3-Layer Audio Mastering
    # -------------------------------------------------------------
    print("\n🎛️ [STEP 3/5] Mastering 3-Layer Audio (Narration + 22% BGM + Acoustic SFX)...", flush=True)
    from marketing.sfx_synth import build_sfx_audio_segment

    # Voiceover: +2.5dB dominant punch with 1.5s silent hold tail
    vox = (raw_narration + 2.5) + AudioSegment.silent(duration=hold_ms)
    
    # BGM: Exact 22% volume (-13.15dB) extended across full total_ms
    bgm_path = PROJECT_ROOT / "marketing" / "assets" / "audio" / "quiz_night_anthem_reel_16s.mp3"
    bgm = AudioSegment.from_file(str(bgm_path)) - 13.15
    if len(bgm) < total_ms:
        bgm = (bgm * 2)[:total_ms]
    else:
        bgm = bgm[:total_ms]
    bgm = bgm.fade_out(450)
    
    # SFX Suite: Multi-oscillator acoustic textures
    sfx = build_sfx_audio_segment(cues_data, total_ms) + 1.5

    master_audio = vox.overlay(bgm).overlay(sfx)
    import tempfile
    master_audio_file = Path(tempfile.gettempdir()) / f"{reel_no}_temp_master_{int(time.time())}.mp3"
    master_audio.export(str(master_audio_file), format="mp3", bitrate="320k")
    print("   ✓ 3-Layer Audio mastered with zero clipping at 320kbps stereo", flush=True)

    # -------------------------------------------------------------
    # STEP 4: Deterministic Stepped Video Rendering (Playwright + FFmpeg)
    # -------------------------------------------------------------
    print(f"\n🎬 [STEP 4/5] Rendering {res_label} Video ({w}x{h} @ {fps}fps)...", flush=True)
    out_mp4 = OUTPUT_DIR / f"{reel_no}.mp4"
    total_frames = int(total_sec * fps)

    ffmpeg_cmd = [
        "ffmpeg", "-y",
        "-f", "image2pipe",
        "-vcodec", "mjpeg",
        "-r", str(fps),
        "-i", "-",
        "-i", str(master_audio_file),
        "-c:v", "libx264",
        "-preset", "fast",
        "-crf", "16",
        "-pix_fmt", "yuv420p",
        "-c:a", "aac",
        "-b:a", "320k",
        "-shortest",
        str(out_mp4)
    ]

    ffmpeg_proc = subprocess.Popen(
        ffmpeg_cmd,
        stdin=subprocess.PIPE,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )

    try:
        async with async_playwright() as p:
            browser = await p.chromium.launch(
                headless=True,
                args=[
                    "--disable-background-timer-throttling",
                    "--disable-renderer-backgrounding",
                    "--enable-gpu-rasterization"
                ]
            )
            context = await browser.new_context(
                viewport={"width": w, "height": h},
                device_scale_factor=1.0
            )
            page = await context.new_page()

            # Load Template
            template_file = (PROJECT_ROOT / "marketing" / "templates" / "neon-radial-clock.html").resolve()
            await page.goto(template_file.as_uri(), wait_until="domcontentloaded", timeout=60000)
            await page.wait_for_timeout(1000)

            # Ensure Logo Base64 is injected so it renders 100% crisply under all environments
            logo_path = PROJECT_ROOT / "marketing" / "assets" / "logo.png"
            if logo_path.exists():
                import base64
                logo_b64 = "data:image/png;base64," + base64.b64encode(logo_path.read_bytes()).decode('utf-8')
                await page.evaluate(f"const img = document.getElementById('heroLogoImg'); if(img) img.src = '{logo_b64}';")

            # Inject Reel Data and Cues into Template
            load_payload = dict(reel)
            load_payload["cues"] = cues_data
            await page.evaluate(f"window.ReelEngine.load({json.dumps(load_payload)});")
            await page.wait_for_timeout(500)

            render_t0 = time.time()
            for f in range(total_frames):
                ms = (f / fps) * 1000.0
                await page.evaluate(f"window.ReelEngine.seek({ms});")
                jpeg_bytes = await page.screenshot(type="jpeg", quality=82)  # 82 = visually lossless @ 30fps, 25% smaller bytes
                ffmpeg_proc.stdin.write(jpeg_bytes)

                if f % 45 == 0 or f == total_frames - 1:
                    pct = int((f + 1) / total_frames * 100)
                    fps_actual = round((f + 1) / (time.time() - render_t0), 1)
                    print(f"   [{pct}%] Frame {f+1}/{total_frames} ({ms/1000:.2f}s) @ {fps_actual} fps", flush=True)

            await browser.close()
    finally:
        ffmpeg_proc.stdin.close()
        ffmpeg_proc.wait()

        # Ensure output file permissions and flush
        if out_mp4.exists():
            print(f"   ✓ Successfully rendered & overwritten in-place: {out_mp4.name}", flush=True)

        # Cleanup temp master audio safely from OS temp
        if master_audio_file.exists():
            try: os.remove(master_audio_file)
            except: pass

    # -------------------------------------------------------------
    # STEP 5: Generate 1-Click Publishing Pack JSON
    # -------------------------------------------------------------
    print("\n📦 [STEP 5/5] Generating 1-Click Publishing Pack...", flush=True)
    pack_data = {
        "reelNo": reel_no,
        "day": reel["day"],
        "badge": reel["badge"],
        "videoFile": str(out_mp4.name),
        "videoPath": str(out_mp4),
        "fileSizeMb": round(out_mp4.stat().st_size / (1024 * 1024), 2),
        "resolution": f"{w}x{h}",
        "fps": fps,
        "durationSec": round(total_sec, 2),
        "caption": reel["caption"],
        "pinnedAnswer": reel["pinnedAnswer"],
        "simulatorLink": reel["link"],
        "cues": cues_data,
        "generatedAt": time.strftime("%Y-%m-%d %H:%M:%S")
    }
    pack_json_file = OUTPUT_DIR / f"{reel_no}_Publish_Pack.json"
    with open(pack_json_file, "w", encoding="utf-8") as f:
        json.dump(pack_data, f, indent=2, ensure_ascii=False)

    total_time = round(time.time() - start_total, 1)
    print("\n==================================================================", flush=True)
    print(f"🎉 DIRECT PIPELINE COMPLETE IN {total_time} SECONDS!", flush=True)
    print(f"📁 Video: {out_mp4} ({pack_data['fileSizeMb']} MB)", flush=True)
    print(f"📁 Pack:  {pack_json_file}", flush=True)
    print("==================================================================", flush=True)
    return pack_data

if __name__ == "__main__":
    is_4k = "--4k" in sys.argv
    reel_arg = next((arg for arg in sys.argv[1:] if not arg.startswith("--")), "SQL-03-R1")
    if reel_arg.lower() == "all":
        for k, r in REELS_CATALOG.items():
            asyncio.run(build_direct_video(r, is_4k=is_4k, fps=24))
    elif reel_arg in REELS_CATALOG:
        asyncio.run(build_direct_video(REELS_CATALOG[reel_arg], is_4k=is_4k, fps=24))
    else:
        asyncio.run(build_direct_video(DEFAULT_REEL, is_4k=is_4k, fps=24))
