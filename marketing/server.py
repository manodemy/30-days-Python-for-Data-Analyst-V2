"""
marketing/server.py - Robust Dev Server with Intelligent Audio-Visual Auto-Sync
Accurately splits and synthesizes speech chunks with zero phantom duplicates or repetitions.
"""
import os
import sys
import re
import json
import asyncio
import tempfile
from http.server import ThreadingHTTPServer, SimpleHTTPRequestHandler
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parent.parent
AUDIO_OUT_DIR = ROOT_DIR / "marketing" / "output" / "audio"
AUDIO_OUT_DIR.mkdir(parents=True, exist_ok=True)

class StudioHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(ROOT_DIR), **kwargs)

    def do_POST(self):
        if self.path == "/api/tts":
            self.handle_tts()
        elif self.path == "/api/tts/auto-sync":
            self.handle_auto_sync()
        elif self.path == "/api/render-video":
            self.handle_render_video()
        else:
            self.send_error(404, "Endpoint not found")

    def do_GET(self):
        if self.path == "/api/voices":
            self.handle_voices()
        else:
            super().do_GET()

    def handle_voices(self):
        voices = [
            {"id": "en-US-AndrewNeural", "name": "Andrew (Male - Charismatic & Energetic)"},
            {"id": "en-US-GuyNeural", "name": "Guy (Male - Professional & Casual)"},
            {"id": "en-US-ChristopherNeural", "name": "Christopher (Male - Deep & Authoritative)"},
            {"id": "en-US-EricNeural", "name": "Eric (Male - Tech Storyteller)"},
            {"id": "en-US-AvaNeural", "name": "Ava (Female - Expressive & Bright)"},
            {"id": "en-US-EmmaNeural", "name": "Emma (Female - Crisp & Conversational)"},
        ]
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Access-Control-Allow-Origin", "*")
        self.end_headers()
        self.wfile.write(json.dumps(voices).encode("utf-8"))

    def handle_auto_sync(self):
        """
        100% Automated Zero-Duplicate Audio-Visual Sync Engine.
        Synthesizes only the explicitly requested chunks, measures their exact durations down to the millisecond,
        inserts calibrated clock tension silence, stitches them into a clean master track,
        and generates exact millisecond cue timestamps.
        """
        import edge_tts
        from pydub import AudioSegment

        length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(length).decode("utf-8")
        
        try:
            payload = json.loads(body)
        except Exception as e:
            self.send_error(400, f"Invalid JSON payload: {e}")
            return

        hook_text = payload.get("hook", "").strip() or "Ninety percent fail this SQL trap."
        line2_text = payload.get("line2", "").strip() or "One of these silently returns zero rows."
        choose_text = payload.get("choose", "").strip() or "Choose your answer..."
        opta_text = payload.get("optA", "").strip() or "Option A..."
        optb_text = payload.get("optB", "").strip() or "or Option B?"
        cta_text = payload.get("cta", "").strip()  # Optional: only synthesize if provided!
        
        clock_tension_sec = float(payload.get("clockTensionSec", 2.0))
        voice = payload.get("voice", "en-US-AndrewNeural")
        rate = payload.get("rate", "-2%")
        pitch = payload.get("pitch", "+1Hz")
        reel_no = payload.get("reelNo", "SQL-01-R1")
        filename = f"{reel_no}_narration.mp3"
        out_path = AUDIO_OUT_DIR / filename

        chunk_list = [
            ("hook", hook_text),
            ("line2", line2_text),
            ("choose", choose_text),
            ("optA", opta_text),
            ("optB", optb_text)
        ]
        if cta_text:
            chunk_list.append(("cta", cta_text))

        async def generate_auto_sync():
            durations = {}
            audio_segments = {}
            with tempfile.TemporaryDirectory() as tmpdir:
                for key, text in chunk_list:
                    temp_file = Path(tmpdir) / f"{key}.mp3"
                    com = edge_tts.Communicate(text, voice, rate=rate, pitch=pitch)
                    await com.save(str(temp_file))
                    seg = AudioSegment.from_file(str(temp_file))
                    durations[key] = len(seg)
                    audio_segments[key] = seg

                # Calculate exact cue markers
                dur_hook = durations["hook"]
                dur_line2 = durations["line2"]
                dur_choose = durations["choose"]
                dur_opta = durations["optA"]
                dur_optb = durations["optB"]
                dur_cta = durations.get("cta", 0)

                t_hook_start = 0
                t_line2_start = dur_hook
                t_clock_in = t_line2_start + dur_line2 + 50 # 50ms micro breath
                t_opta = t_clock_in + dur_choose
                t_optb = t_opta + dur_opta
                t_optb_end = t_optb + dur_optb
                
                # Tension silence after Option B before clock disappears
                tension_ms = int(clock_tension_sec * 1000)
                t_clock_out = t_optb_end + tension_ms
                t_cta_start = t_clock_out
                t_total = t_cta_start + dur_cta + 300 # tail pad

                # Helper to compute precise syllable/char weighted word timings
                def compute_words(text_chunk, start_ms, dur_ms):
                    clean_words = [w.strip() for w in text_chunk.replace('\n', ' ').split() if w.strip()]
                    if not clean_words:
                        return []
                    weights = []
                    for w in clean_words:
                        clean_len = len(re.sub(r'[^\w]', '', w))
                        wt = max(1.5, clean_len * 1.0)
                        if any(c in w for c in '.,!?:;'):
                            wt += 1.2
                        weights.append(wt)
                    tot_wt = sum(weights) or 1.0
                    res = []
                    curr = start_ms
                    for i, w in enumerate(clean_words):
                        w_dur = (weights[i] / tot_wt) * dur_ms
                        res.append({
                            "word": w,
                            "startMs": round(curr, 1),
                            "endMs": round(curr + w_dur, 1)
                        })
                        curr += w_dur
                    return res

                hook_words = compute_words(hook_text, 0, dur_hook)
                line2_words = compute_words(line2_text, t_line2_start, dur_line2)
                choose_words = compute_words(choose_text, t_clock_in, dur_choose)
                opta_words = compute_words(opta_text, t_opta, dur_opta)
                optb_words = compute_words(optb_text, t_optb, dur_optb)
                cta_words = compute_words(cta_text, t_cta_start, dur_cta) if cta_text else []

                all_words = hook_words + line2_words + choose_words + opta_words + optb_words + cta_words

                phrases = [
                    {"index": 0, "text": hook_text, "startMs": 0, "endMs": t_line2_start, "words": hook_words},
                    {"index": 1, "text": line2_text, "startMs": t_line2_start, "endMs": t_clock_in, "words": line2_words},
                    {"index": 2, "text": f"{choose_text} {opta_text} {optb_text}".strip(), "startMs": t_clock_in, "endMs": t_optb_end, "words": choose_words + opta_words + optb_words}
                ]
                if cta_text:
                    phrases.append({"index": 3, "text": cta_text, "startMs": t_cta_start, "endMs": t_total, "words": cta_words})

                # Stitch final master audio track with zero duplicates
                combined = (
                    audio_segments["hook"] +
                    audio_segments["line2"] +
                    AudioSegment.silent(duration=50) +
                    audio_segments["choose"] +
                    audio_segments["optA"] +
                    audio_segments["optB"] +
                    AudioSegment.silent(duration=tension_ms)
                )
                if cta_text and "cta" in audio_segments:
                    combined += audio_segments["cta"] + AudioSegment.silent(duration=300)
                else:
                    combined += AudioSegment.silent(duration=300)

                combined.export(str(out_path), format="mp3")

                # Try exact Whisper ASR word boundary alignment for 100% ground-truth sync
                try:
                    import whisper
                    whisper_model = whisper.load_model('base')
                    w_res = whisper_model.transcribe(str(out_path), word_timestamps=True)
                    whisper_phrases = []
                    whisper_words = []
                    for idx, seg in enumerate(w_res.get('segments', [])):
                        seg_words = []
                        for w in seg.get('words', []):
                            clean_w = w['word'].strip()
                            if clean_w:
                                w_obj = {
                                    "word": clean_w,
                                    "startMs": round(w['start'] * 1000),
                                    "endMs": round(w['end'] * 1000)
                                }
                                seg_words.append(w_obj)
                                whisper_words.append(w_obj)
                        if seg_words:
                            whisper_phrases.append({
                                "index": idx,
                                "text": seg.get('text', '').strip(),
                                "startMs": round(seg.get('start', 0) * 1000),
                                "endMs": round(seg.get('end', 0) * 1000),
                                "words": seg_words
                            })
                    if whisper_phrases:
                        phrases = whisper_phrases
                        all_words = whisper_words
                except Exception as wex:
                    pass

                cues = {
                    "t_hook_start": t_hook_start,
                    "t_line2_start": t_line2_start,
                    "t_clock_in": t_clock_in,
                    "t_opta": t_opta,
                    "t_optb": t_optb,
                    "t_clock_out": t_clock_out,
                    "t_cta_start": t_cta_start,
                    "totalMs": t_total,
                    "clockDurationMs": (t_clock_out - t_clock_in),
                    "wordCues": all_words,
                    "phrases": phrases
                }

                return cues

        try:
            cues = asyncio.run(generate_auto_sync())
            rel_url = f"/marketing/output/audio/{filename}?t={int(os.path.getmtime(out_path))}"
            size_kb = round(out_path.stat().st_size / 1024, 1)

            res = {
                "success": True,
                "audioUrl": rel_url,
                "sizeKb": size_kb,
                "voice": voice,
                "filename": filename,
                "cues": cues
            }
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps(res).encode("utf-8"))
        except Exception as e:
            self.send_response(500)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps({"success": False, "error": str(e)}).encode("utf-8"))

    def handle_tts(self):
        """Standard raw TTS generation with [wait Xs] tags"""
        import edge_tts
        from pydub import AudioSegment

        length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(length).decode("utf-8")
        
        try:
            payload = json.loads(body)
        except Exception as e:
            self.send_error(400, f"Invalid JSON payload: {e}")
            return

        raw_text = payload.get("text", "")
        voice = payload.get("voice", "en-US-AndrewNeural")
        rate = payload.get("rate", "-2%")
        pitch = payload.get("pitch", "+1Hz")
        filename = payload.get("filename", "reel_audio.mp3")

        if not filename.endswith(".mp3"):
            filename += ".mp3"

        out_path = AUDIO_OUT_DIR / filename

        pattern = re.compile(r'\[(wait|pause)\s*([\d\.]+)\s*(s|ms|sec)?\]', re.IGNORECASE)
        
        parts = []
        last_end = 0
        for m in pattern.finditer(raw_text):
            start, end = m.span()
            if start > last_end:
                speech_chunk = raw_text[last_end:start].strip()
                if speech_chunk:
                    parts.append({"type": "speech", "text": speech_chunk})
            
            val = float(m.group(2))
            unit = (m.group(3) or 's').lower()
            dur_ms = int(val * 1000) if unit in ['s', 'sec'] else int(val)
            parts.append({"type": "pause", "ms": dur_ms})
            last_end = end
            
        if last_end < len(raw_text):
            trailing = raw_text[last_end:].strip()
            if trailing:
                parts.append({"type": "speech", "text": trailing})

        if not parts:
            parts.append({"type": "speech", "text": raw_text.strip()})

        async def generate_pipeline():
            combined = AudioSegment.empty()
            with tempfile.TemporaryDirectory() as tmpdir:
                for idx, p in enumerate(parts):
                    if p["type"] == "pause":
                        combined += AudioSegment.silent(duration=p["ms"])
                    elif p["type"] == "speech":
                        temp_file = Path(tmpdir) / f"chunk_{idx}.mp3"
                        com = edge_tts.Communicate(p["text"], voice, rate=rate, pitch=pitch)
                        await com.save(str(temp_file))
                        seg = AudioSegment.from_file(str(temp_file))
                        combined += seg
                
                combined.export(str(out_path), format="mp3")

        try:
            asyncio.run(generate_pipeline())
            rel_url = f"/marketing/output/audio/{filename}?t={int(os.path.getmtime(out_path))}"
            size_kb = round(out_path.stat().st_size / 1024, 1)

            res = {
                "success": True,
                "audioUrl": rel_url,
                "sizeKb": size_kb,
                "voice": voice,
                "filename": filename
            }
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps(res).encode("utf-8"))
        except Exception as e:
            self.send_response(500)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps({"success": False, "error": str(e)}).encode("utf-8"))

    def handle_render_video(self):
        """Renders 4K/1080p MP4 reel video via FFmpeg"""
        try:
            length = int(self.headers.get("Content-Length", 0))
            body = self.rfile.read(length).decode("utf-8")
            payload = json.loads(body) if body else {}
            reel_id = payload.get("reelId", "SQL-01-R1")
            is_4k = payload.get("is4k", True)
            
            # Import and call render script
            from marketing.render_video import render_reel_to_video
            w = 2160 if is_4k else 1080
            h = 3840 if is_4k else 1920
            out_file = render_reel_to_video(reel_id, width=w, height=h)
            
            res = {
                "success": True,
                "videoUrl": f"/marketing/output/video/{Path(out_file).name}",
                "resolution": f"{w}x{h}",
                "filename": Path(out_file).name
            }
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps(res).encode("utf-8"))
        except Exception as e:
            self.send_response(500)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps({"success": False, "error": str(e)}).encode("utf-8"))

def run(port=8085):
    server = ThreadingHTTPServer(("0.0.0.0", port), StudioHandler)
    print("=====================================================")
    print(f"[OK] Manodemy Multi-Threaded Studio Server running at http://localhost:{port}/")
    print("[OK] Smart Auto-Sync & 4K Video Engine active")
    print("=====================================================")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nStopping server...")
        server.server_close()

if __name__ == "__main__":
    port = 8085
    if len(sys.argv) > 1:
        port = int(sys.argv[1])
    run(port)
