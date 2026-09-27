#!/usr/bin/env python3
"""
RAG Studio Audio Synthesis Pipeline (Edge-TTS)
==============================================
Synthesizes professional instructor narration for Day 01 RAG Theory and Practice Challenges.
Voice: en-US-AndrewNeural (100% parity with SQL Day 04 & Day 05)
Outputs to: public/Version-3/RAG-Day01/
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
OUTPUT_DIR = BASE_DIR / "public" / "Version-3" / "RAG-Day01"
NARRATIONS_FILE = BASE_DIR / "narrations" / "rag-day-01.json"
CACHE_FILE = BASE_DIR / "scripts" / ".audio-cache.json"

VOICE = "en-US-AndrewNeural"

def get_text_hash(text: str) -> str:
    return hashlib.md5(text.strip().encode('utf-8')).hexdigest()

def normalize_phonetics(text: str) -> str:
    """Apply phonetic substitutions to prevent TTS mispronunciations."""
    cleaned = re.sub(r'[\r\n]+', ' ', text)
    cleaned = re.sub(r'\s+', ' ', cleaned).strip()
    
    # Phonetic replacements
    substitutions = [
        (r'\bR-A-G\b', 'rag'),
        (r'\bRAG\b', 'rag'),
        (r'\bL-L-Ms\b', 'L L M s'),
        (r'\bLLMs\b', 'L L M s'),
        (r'\bL-L-M\b', 'L L M'),
        (r'\bLLM\b', 'L L M'),
        (r'\bPyodide\b', 'pie-o-died'),
        (r'\bWASM\b', 'wasm'),
        (r'\bnumpy\b', 'num-pie'),
        (r'\bNumPy\b', 'num-pie'),
        (r'\bF-string\b', 'F-string'),
        (r'\bF-strings\b', 'F-strings'),
        (r'\bJ-S-O-N\b', 'jay-sahn'),
        (r'\bJSON\b', 'jay-sahn'),
        (r'\bG-P-U\b', 'G P U'),
        (r'\bGPU\b', 'G P U'),
        (r'\bGPUs\b', 'G P Us'),
        (r'\bP-T-O\b', 'P T O'),
        (r'\bPTO\b', 'P T O'),
        (r'\bRBAC\b', 'R-back'),
        (r'\bbge-base-en\b', 'B G E base E N'),
        (r'\bHNSW\b', 'H N S W'),
        (r'\bAcme\b', 'Ack-mee'),
        (r'\bMaano-demy\b', 'Mahno-demy'),
        (r'\bManodemy\b', 'Mahno-demy'),
        (r'\bbuild_rag_prompt\b', 'build rag prompt'),
        (r'\bfind_matching_chunk\b', 'find matching chunk'),
        (r'\bcheck_token_budget\b', 'check token budget'),
        (r'\bformat_citation\b', 'format citation'),
        (r'\bsafe_grounded_answer\b', 'safe grounded answer'),
    ]
    
    for pattern, replacement in substitutions:
        cleaned = re.sub(pattern, replacement, cleaned)
        
    return cleaned

async def generate_speech(text: str, output_path: Path):
    clean_text = normalize_phonetics(text)
    communicate = edge_tts.Communicate(clean_text, VOICE, rate="+0%", pitch="+0Hz")
    await communicate.save(str(output_path))

async def main():
    force = "--force" in sys.argv
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    
    cache = {}
    if CACHE_FILE.exists():
        try:
            with open(CACHE_FILE, "r", encoding="utf-8") as f:
                cache = json.load(f)
        except Exception:
            cache = {}

    if not NARRATIONS_FILE.exists():
        print(f"❌ Error: Narration file not found: {NARRATIONS_FILE}")
        sys.exit(1)

    with open(NARRATIONS_FILE, "r", encoding="utf-8") as f:
        data = json.load(f)

    tracks = {}
    if "lecture" in data:
        tracks.update(data["lecture"])
    if "questions" in data:
        tracks.update(data["questions"])

    total = len(tracks)
    print(f"🎙️  Synthesizing RAG Day 01 Narration ({total} tracks)")
    print(f"    Voice: {VOICE}")
    print(f"    Target: {OUTPUT_DIR}")
    print("=" * 60)

    generated = 0
    skipped = 0

    for filename, text in tracks.items():
        out_file = OUTPUT_DIR / filename
        h = get_text_hash(text)
        
        if not force and out_file.exists() and cache.get(filename) == h and out_file.stat().st_size > 10000:
            print(f"  ⏭️  Skipped (cached): {filename} ({out_file.stat().st_size // 1024} KB)")
            skipped += 1
            continue

        print(f"  🔊 Synthesizing: {filename} ...")
        try:
            await generate_speech(text, out_file)
            size_kb = out_file.stat().st_size // 1024
            print(f"     ✅ Saved: {filename} ({size_kb} KB)")
            cache[filename] = h
            generated += 1
        except Exception as e:
            print(f"     ❌ Error generating {filename}: {e}")

    with open(CACHE_FILE, "w", encoding="utf-8") as f:
        json.dump(cache, f, indent=2)

    print("=" * 60)
    print(f"✅ RAG Day 01 Audio Generation Complete! ({generated} synthesized, {skipped} cached)\n")

if __name__ == "__main__":
    asyncio.run(main())
