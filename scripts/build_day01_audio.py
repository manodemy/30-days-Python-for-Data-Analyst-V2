#!/usr/bin/env python3
"""
Targeted Audio Synthesis for Python Day 01
Uses Edge-TTS (en-US-AndrewNeural) to generate all 35 audio files for Day 01.
Outputs to:
  - public/python/Day01/
  - python/Day01/
"""

import os
import sys
import re
import json
import hashlib
import asyncio
from pathlib import Path

if sys.platform == "win32":
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

import edge_tts

BASE_DIR = Path(__file__).resolve().parent.parent
JSON_FILE = BASE_DIR / "narrations" / "py-day-01.json"
OUT_DIR_PUB = BASE_DIR / "public" / "python" / "Day01"
OUT_DIR_ROOT = BASE_DIR / "python" / "Day01"

VOICE = "en-US-AndrewNeural"
RATE = "-2%"
PITCH = "+1Hz"

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
        (r'\bNaN\b', 'nan'),
        (r'\bManodemy\b', 'Mahno-demy'),
        (r'\bint\b', 'int'),
        (r'\bstr\b', 'string'),
        (r'\bbool\b', 'bool'),
        (r'\bdict\b', 'dictionary'),
        (r'\bdefaultdict\b', 'default dictionary'),
        (r'\bfrozenset\b', 'frozen set'),
        (r'_', ' '),  # Replace underscores with spaces for natural speech
    ]

    for pat, rep in substitutions:
        cleaned = re.sub(pat, rep, cleaned)

    return cleaned

async def synthesize_one(sem, fname: str, text: str):
    clean_text = clean_text_for_speech(text)
    dest_pub = OUT_DIR_PUB / fname
    dest_root = OUT_DIR_ROOT / fname
    
    async with sem:
        for attempt in range(3):
            try:
                comm = edge_tts.Communicate(clean_text, VOICE, rate=RATE, pitch=PITCH)
                await comm.save(str(dest_pub))
                # Copy to root python/Day01
                dest_root.write_bytes(dest_pub.read_bytes())
                print(f"  ✓ [{fname}] Synthesized ({dest_pub.stat().st_size} bytes)")
                return True
            except Exception as e:
                print(f"  [Attempt {attempt+1}] Failed {fname}: {e}")
                await asyncio.sleep(1)
        return False

async def main():
    OUT_DIR_PUB.mkdir(parents=True, exist_ok=True)
    OUT_DIR_ROOT.mkdir(parents=True, exist_ok=True)

    with open(JSON_FILE, "r", encoding="utf-8") as f:
        data = json.load(f)

    all_items = []
    for k, v in data.get("lecture", {}).items():
        all_items.append((k, v))
    for k, v in data.get("questions", {}).items():
        all_items.append((k, v))

    print(f"Starting Edge-TTS synthesis for Python Day 01 ({len(all_items)} tracks)...")
    sem = asyncio.Semaphore(4)
    tasks = [synthesize_one(sem, fname, text) for fname, text in all_items]
    
    results = await asyncio.gather(*tasks)
    success = sum(1 for r in results if r)
    print(f"\n🎉 Finished Day 01 synthesis: {success}/{len(all_items)} successful.")

if __name__ == "__main__":
    asyncio.run(main())
