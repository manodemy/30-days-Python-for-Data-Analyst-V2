#!/usr/bin/env python3
"""
Narration & Typing Syncing Inspector
====================================
Inspects audio solution files for SQL practice questions, extracts Whisper ASR
word-level timestamps, aligns SQL lines/clauses to spoken keywords, validates
typing timing/intervals, and generates structured multi-line segments for mano-engine.js.
"""

import os
import sys
import re
import json
import argparse
from typing import List, Dict, Any

# Ensure UTF-8 output on Windows console
if sys.platform == "win32":
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

try:
    import whisper
except ImportError:
    print("Error: openai-whisper is not installed. Install with: pip install openai-whisper")
    sys.exit(1)


def format_sql_multiline(sql: str) -> str:
    """Format SQL query into clean multi-line layout with 7-space column indents."""
    sql = re.sub(r'\s+', ' ', sql.strip())
    if '\n' in sql:
        return sql
        
    formatted = sql
    formatted = re.sub(r'\bSELECT\s+', 'SELECT ', formatted, flags=re.IGNORECASE)
    
    select_match = re.search(r'\bSELECT\s+(.+?)\s+\bFROM\b', formatted, re.IGNORECASE)
    if select_match:
        cols_str = select_match.group(1)
        cols = []
        current = []
        paren_depth = 0
        for char in cols_str:
            if char == '(':
                paren_depth += 1
            elif char == ')':
                paren_depth -= 1
            if char == ',' and paren_depth == 0:
                cols.append(''.join(current).strip())
                current = []
            else:
                current.append(char)
        if current:
            cols.append(''.join(current).strip())
            
        if len(cols) > 1:
            first_col = f"SELECT {cols[0]},\n"
            rest_cols = "".join([f"       {col},\n" if i < len(cols) - 1 else f"       {col}\n" for i, col in enumerate(cols[1:], 1)])
            formatted = formatted.replace(select_match.group(0), f"{first_col}{rest_cols}FROM")
            
    for clause in ['FROM', 'WHERE', 'GROUP BY', 'HAVING', 'ORDER BY', 'LIMIT']:
        formatted = re.sub(rf'\s+\b{clause}\b\s+', f'\n{clause.ljust(7)}', formatted, flags=re.IGNORECASE)
        
    formatted = re.sub(r'\n+', '\n', formatted).strip()
    if not formatted.endswith(';'):
        formatted += ';'
    return formatted


def extract_word_timestamps(audio_path: str, model_name: str = "tiny.en") -> List[Dict[str, Any]]:
    """Transcribe audio and extract word-level timestamps using Whisper ASR."""
    if not os.path.exists(audio_path):
        raise FileNotFoundError(f"Audio file not found: {audio_path}")
        
    model = whisper.load_model(model_name)
    result = model.transcribe(audio_path, word_timestamps=True)
    
    words = []
    for seg in result.get("segments", []):
        for w in seg.get("words", []):
            clean_word = re.sub(r'[^\w]', '', w["word"].lower())
            if clean_word:
                words.append({
                    "word": clean_word,
                    "raw": w["word"].strip(),
                    "start": round(w["start"], 2),
                    "end": round(w["end"], 2)
                })
    return words


def split_sql_into_inspectable_segments(formatted_sql: str) -> List[str]:
    """Break formatted SQL into natural phrase segments for typing sync."""
    lines = formatted_sql.split('\n')
    segments = []
    
    for line in lines:
        line_with_nl = line + '\n'
        if re.match(r'^\s*(WHERE|ORDER BY|GROUP BY|HAVING)\s+', line, re.IGNORECASE):
            match = re.match(r'^(\s*(?:WHERE|ORDER BY|GROUP BY|HAVING)\s+)(.*)$', line, re.IGNORECASE)
            if match and len(match.group(2)) > 12:
                segments.append(match.group(1))
                segments.append(match.group(2) + '\n')
                continue
        segments.append(line_with_nl)
        
    if segments and segments[-1].endswith('\n'):
        segments[-1] = segments[-1][:-1]
        
    return [s for s in segments if s]


def align_sql_segments_to_audio(segments: List[str], words: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    """Align each SQL segment to word timestamps in audio transcription."""
    aligned_segments = []
    current_word_idx = 0
    total_words = len(words)
    
    speech_aliases = {
        'sum': ['sum', 'some'],
        'avg': ['avg', 'average', 'vg'],
        'min': ['min', 'minimum', 'indian', 'man'],
        'max': ['max', 'maximum'],
        'count': ['count'],
        'select': ['select'],
        'from': ['from'],
        'where': ['where'],
        'group': ['group'],
        'by': ['by'],
        'having': ['having'],
        'order': ['order'],
        'desc': ['desc', 'descending'],
        'asc': ['asc', 'ascending'],
        'distinct': ['distinct'],
        'as': ['as'],
        'limit': ['limit']
    }
    
    for seg_idx, seg_text in enumerate(segments):
        seg_clean = re.sub(r'[^\w\s]', ' ', seg_text).lower()
        seg_tokens = [t for t in seg_clean.split() if t]
        
        start_time = None
        end_time = None
        matched_words = []
        
        for token in seg_tokens:
            acceptable = speech_aliases.get(token, [token])
            found_idx = -1
            for w_idx in range(current_word_idx, total_words):
                w = words[w_idx]
                if w["word"] in acceptable or token in w["word"] or w["word"] in token:
                    found_idx = w_idx
                    break
                    
            if found_idx != -1:
                matched_w = words[found_idx]
                matched_words.append(matched_w["raw"])
                if start_time is None or matched_w["start"] < start_time:
                    start_time = matched_w["start"]
                if end_time is None or matched_w["end"] > end_time:
                    end_time = matched_w["end"]
                current_word_idx = found_idx + 1
                
        if start_time is None:
            if aligned_segments:
                start_time = round(aligned_segments[-1]["startAt"] + 1.8, 2)
            else:
                start_time = 1.20
            end_time = round(start_time + len(seg_text) * 0.05, 2)
            
        if end_time is None or end_time <= start_time:
            end_time = round(start_time + len(seg_text) * 0.05, 2)
            
        duration_sec = max(0.4, end_time - start_time)
        char_interval = round((duration_sec * 1000) / max(1, len(seg_text)))
        char_interval = max(25, min(85, char_interval))
        
        aligned_segments.append({
            "text": seg_text,
            "startAt": start_time,
            "charInterval": char_interval,
            "matchedPhrase": " ".join(matched_words) if matched_words else "(estimated)"
        })
        
    return aligned_segments


def detect_scroll_at_timestamp(words: List[Dict[str, Any]], last_seg_end: float) -> float:
    """Detect when the narrator mentions execution (run / output / result)."""
    trigger_words = ['run', 'click', 'hit', 'execute', 'output', 'result', 'button']
    for w in words:
        if w["start"] >= last_seg_end - 1.0:
            if w["word"] in trigger_words:
                return round(w["start"] + 0.3, 1)
    return round(last_seg_end + 0.8, 1)


def inspect_solution(audio_path: str, sql_code: str, q_id: int = 1) -> Dict[str, Any]:
    """Inspect and generate synced typewriter timing for a single solution."""
    formatted_sql = format_sql_multiline(sql_code)
    words = extract_word_timestamps(audio_path)
    segments = split_sql_into_inspectable_segments(formatted_sql)
    aligned_segments = align_sql_segments_to_audio(segments, words)
    
    last_seg = aligned_segments[-1] if aligned_segments else None
    last_end = (last_seg["startAt"] + (len(last_seg["text"]) * last_seg["charInterval"] / 1000)) if last_seg else 10.0
    scroll_at = detect_scroll_at_timestamp(words, last_end)
    
    clean_segments = []
    for s in aligned_segments:
        clean_segments.append({
            "text": s["text"],
            "startAt": s["startAt"],
            "charInterval": s["charInterval"]
        })
        
    return {
        "qId": q_id,
        "src": audio_path.replace("public/Version-3/", ""),
        "code": formatted_sql,
        "segments": clean_segments,
        "scrollAt": scroll_at,
        "rawSegments": aligned_segments,
        "transcript": " ".join([w["raw"] for w in words])
    }


def print_inspection_report(report: Dict[str, Any]):
    """Print formatted inspection terminal report."""
    print("=" * 80)
    print(f" 🔍 NARRATION & TYPING SYNC INSPECTOR — Question {report['qId']}")
    print("=" * 80)
    print(f"📁 Audio Source : {report['src']}")
    print(f"📜 Spoken Audio : \"{report['transcript']}\"")
    print(f"⚡ Table Scroll : {report['scrollAt']}s")
    print("-" * 80)
    print(f"{'#':<3} | {'Start (s)':<9} | {'Interval':<8} | {'Matched Spoken Words':<22} | {'SQL Text Segment'}")
    print("-" * 80)
    
    for i, seg in enumerate(report["rawSegments"], 1):
        disp_text = seg["text"].replace("\n", "\\n")
        print(f"{i:<3} | {seg['startAt']:<9.2f} | {seg['charInterval']:<8} | {seg['matchedPhrase']:<22} | {disp_text}")
    print("=" * 80)
    print("\n✨ Ready-to-use JavaScript Object:")
    js_obj = {
        "src": report["src"],
        "code": report["code"],
        "segments": report["segments"],
        "scrollAt": report["scrollAt"]
    }
    print(json.dumps(js_obj, indent=2))
    print()


def main():
    parser = argparse.ArgumentParser(description="Narration & Typing Syncing Inspector for Practice Questions")
    parser.add_argument("--audio", type=str, help="Path to solution MP3 file")
    parser.add_argument("--code", type=str, help="SQL solution query")
    parser.add_argument("--day", type=int, help="Day number (e.g. 1, 2, 3, 4, 5)")
    parser.add_argument("--q", type=int, default=1, help="Question number (default: 1)")
    parser.add_argument("--json", action="store_true", help="Output raw JSON only")
    args = parser.parse_args()

    if args.audio and args.code:
        report = inspect_solution(args.audio, args.code, args.q)
        if args.json:
            print(json.dumps(report, indent=2))
        else:
            print_inspection_report(report)


if __name__ == "__main__":
    main()
