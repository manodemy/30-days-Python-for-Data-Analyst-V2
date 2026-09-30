#!/usr/bin/env python3
"""
Python Studio Audio Synthesis Pipeline (Edge-TTS)
=================================================
Synthesizes professional instructor narration for Python Day 01 & Day 02.
Voice: en-US-AndrewNeural (100% parity with SQL curriculum)
Pacing: -2% rate, +1Hz pitch (warm, clear instructor presence)
Outputs to: public/python/Day01/ and public/python/Day02/
"""

import os
import sys
import re
import json
import hashlib
import asyncio
from pathlib import Path

# Ensure UTF-8 output on Windows
if sys.platform == "win32":
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

try:
    import edge_tts
except ImportError:
    print("Error: edge-tts is not installed. Install with: pip install edge-tts")
    sys.exit(1)

BASE_DIR = Path(__file__).resolve().parent.parent
CACHE_FILE = BASE_DIR / "scripts" / ".audio-cache.json"

VOICE = "en-US-AndrewNeural"
RATE = "-2%"
PITCH = "+1Hz"

def get_text_hash(text: str) -> str:
    return hashlib.md5(text.strip().encode('utf-8')).hexdigest()

def clean_text_for_speech(text: str) -> str:
    cleaned = re.sub(r'[\r\n]+', ' ', text)
    cleaned = re.sub(r'\s+', ' ', cleaned).strip()

    # Phonetic normalization
    substitutions = [
        (r'\bPyodide\b', 'pie-o-died'),
        (r'\bWASM\b', 'wasm'),
        (r'\bIEEE-754\b', 'I triple E 7 5 4'),
        (r'\bPEP 393\b', 'P E P 3 9 3'),
        (r'\bPEP 572\b', 'P E P 5 7 2'),
        (r'\bUCS-2\b', 'U C S 2'),
        (r'\bUCS-4\b', 'U C S 4'),
        (r'\bNaN\b', 'nan'),
        (r'\bFAANG\b', 'fang'),
        (r'\bRBAC\b', 'R-back'),
        (r'\bManodemy\b', 'Mahno-demy'),
        (r'\bint\b', 'int'),
        (r'\bstr\b', 'string'),
        (r'\bbool\b', 'bool'),
        (r'\bdict\b', 'dictionary'),
        (r'\bdefaultdict\b', 'default dictionary'),
        (r'\bnamedtuple\b', 'named tuple'),
        (r'\bfrozenset\b', 'frozen set'),
        (r'_', ' '),  # Guard against any literal underscore
    ]

    for pat, rep in substitutions:
        cleaned = re.sub(pat, rep, cleaned)

    return cleaned

async def synthesize_file(sem, text: str, output_path: Path, cache: dict, force: bool = False):
    clean_text = clean_text_for_speech(text)
    thash = get_text_hash(clean_text)
    fname = output_path.name

    if not force and output_path.exists() and output_path.stat().st_size > 10000:
        if cache.get(fname) == thash:
            return True

    output_path.parent.mkdir(parents=True, exist_ok=True)
    async with sem:
        try:
            comm = edge_tts.Communicate(clean_text, VOICE, rate=RATE, pitch=PITCH)
            await comm.save(str(output_path))
            cache[fname] = thash
            print(f"  ✓ Synthesized: {fname} ({output_path.stat().st_size} bytes)")
            return True
        except Exception as e:
            print(f"  ✗ Failed {fname}: {e}")
            return False

async def process_day(day_num: int, json_file: Path, out_dir: Path, cache: dict, force: bool = False):
    if not json_file.exists():
        print(f"Missing {json_file}")
        return
    with open(json_file, 'r', encoding='utf-8') as f:
        data = json.load(f)

    out_dir.mkdir(parents=True, exist_ok=True)
    sem = asyncio.Semaphore(5)
    tasks = []

    # Lecture audio
    for fname, script in data.get("lecture", {}).items():
        dest = out_dir / fname
        tasks.append(synthesize_file(sem, script, dest, cache, force))

    # Question and solution audio
    for fname, script in data.get("questions", {}).items():
        dest = out_dir / fname
        tasks.append(synthesize_file(sem, script, dest, cache, force))

    print(f"\n🎙️ Starting synthesis for Day {day_num:02d}: {len(tasks)} files (voice={VOICE}, rate={RATE}, pitch={PITCH})...")
    results = await asyncio.gather(*tasks)
    success = sum(1 for r in results if r)
    print(f"✨ Day {day_num:02d} complete: {success}/{len(tasks)} files ready.")

async def main():
    force = "--force" in sys.argv or "-f" in sys.argv
    cache = {}
    if CACHE_FILE.exists():
        try:
            with open(CACHE_FILE, "r", encoding="utf-8") as f:
                cache = json.load(f)
        except Exception:
            cache = {}

    day1_json = BASE_DIR / "narrations" / "py-day-01.json"
    day1_out = BASE_DIR / "public" / "python" / "Day01"
    await process_day(1, day1_json, day1_out, cache, force)

    day2_json = BASE_DIR / "narrations" / "py-day-02.json"
    day2_out = BASE_DIR / "public" / "python" / "Day02"
    await process_day(2, day2_json, day2_out, cache, force)

    # Save cache
    with open(CACHE_FILE, "w", encoding="utf-8") as f:
        json.dump(cache, f, indent=2)

    # Synchronize to root python/ directory
    py_dir1 = BASE_DIR / "python" / "Day01"
    py_dir2 = BASE_DIR / "python" / "Day02"
    py_dir1.mkdir(parents=True, exist_ok=True)
    py_dir2.mkdir(parents=True, exist_ok=True)

    for f in day1_out.glob("*.mp3"):
        target = py_dir1 / f.name
        target.write_bytes(f.read_bytes())

    for f in day2_out.glob("*.mp3"):
        target = py_dir2 / f.name
        target.write_bytes(f.read_bytes())

    print("\n✅ Audio files perfectly synchronized across public/python/ and python/.")

if __name__ == "__main__":
    asyncio.run(main())
