#!/usr/bin/env python3
"""
RAG Studio Whisper ASR Timestamp Extraction Pipeline
====================================================
Transcribes all synthesized RAG audio files using OpenAI Whisper, extracting
word-level and segment-level timestamps. Produces timestamps.json and manifest
duration metadata for 100% synchronized GSAP animations and Scrimba typewriter.
"""

import os
import sys
import json
from pathlib import Path

# Ensure UTF-8 output on Windows
if sys.platform == "win32":
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

try:
    import whisper
except ImportError:
    print("Error: openai-whisper is not installed. Install with: pip install openai-whisper")
    sys.exit(1)

BASE_DIR = Path(__file__).resolve().parent.parent
AUDIO_DIR = BASE_DIR / "public" / "Version-3" / "RAG-Day01"
OUTPUT_FILE = AUDIO_DIR / "timestamps.json"
MANIFEST_FILE = BASE_DIR / "public" / "Version-3" / "manifest.json"

def main():
    if not AUDIO_DIR.exists():
        print(f"❌ Error: Audio directory not found: {AUDIO_DIR}")
        sys.exit(1)

    mp3_files = sorted(list(AUDIO_DIR.glob("*.mp3")))
    if not mp3_files:
        print(f"❌ No MP3 files found in {AUDIO_DIR}. Run build-rag-audio.py first.")
        sys.exit(1)

    print(f"🎙️  Loading Whisper ASR model ('base') for timestamp extraction...")
    model = whisper.load_model("base")

    results = {}
    manifest_entries = {}

    print(f"🔍 Transcribing {len(mp3_files)} audio files...")
    print("=" * 60)

    for mp3_path in mp3_files:
        filename = mp3_path.name
        print(f"  ⚡ Processing: {filename} ...")
        
        try:
            res = model.transcribe(
                str(mp3_path),
                word_timestamps=True,
                language="en",
                temperature=0.0
            )

            duration_sec = 0.0
            segments_clean = []
            words_clean = []

            for seg in res.get("segments", []):
                seg_end = seg.get("end", 0.0)
                if seg_end > duration_sec:
                    duration_sec = seg_end

                segments_clean.append({
                    "start": round(seg.get("start", 0.0), 3),
                    "end": round(seg.get("end", 0.0), 3),
                    "text": seg.get("text", "").strip()
                })

                for w in seg.get("words", []):
                    words_clean.append({
                        "word": w.get("word", "").strip(),
                        "start": round(w.get("start", 0.0), 3),
                        "end": round(w.get("end", 0.0), 3)
                    })

            results[filename] = {
                "duration": round(duration_sec, 3),
                "durationMs": int(duration_sec * 1000),
                "segments": segments_clean,
                "words": words_clean
            }

            # Prepare manifest entry
            track_id = f"rag01_{mp3_path.stem}"
            manifest_entries[track_id] = {
                "audioPath": f"RAG-Day01/{filename}",
                "eventsPath": None,
                "durationMs": int(duration_sec * 1000)
            }

            print(f"     ✅ Done: {filename} (Duration: {duration_sec:.2f}s, Words: {len(words_clean)})")

        except Exception as e:
            print(f"     ❌ Error transcribing {filename}: {e}")

    # Save timestamps.json
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2)
    print(f"\n💾 Saved word-level timestamps to: {OUTPUT_FILE}")

    # Update manifest.json if exists
    if MANIFEST_FILE.exists():
        try:
            with open(MANIFEST_FILE, "r", encoding="utf-8") as f:
                manifest_data = json.load(f)
            manifest_data.update(manifest_entries)
            with open(MANIFEST_FILE, "w", encoding="utf-8") as f:
                json.dump(manifest_data, f, indent=2)
            print(f"💾 Updated {len(manifest_entries)} tracks in {MANIFEST_FILE}")
        except Exception as e:
            print(f"⚠️  Could not update manifest.json: {e}")

    print("=" * 60)
    print("✅ Timestamp Extraction & Alignment Complete!\n")

if __name__ == "__main__":
    main()
