"""
Frame-Perfect Deterministic Stepped Video Renderer for Manodemy Marketing Engine
Eliminates all sync drift by calculating exact mathematical timestamps for every frame and streaming directly to FFmpeg.
"""

import os
import sys
import json
import time
import asyncio
import subprocess
from pathlib import Path
from pydub import AudioSegment
from playwright.async_api import async_playwright

# Ensure clean UTF-8 console output on Windows
if sys.platform == "win32":
    try:
        sys.stdout.reconfigure(encoding="utf-8")
        sys.stderr.reconfigure(encoding="utf-8")
    except:
        pass

PROJECT_ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

OUTPUT_DIR = PROJECT_ROOT / "marketing" / "output" / "video"
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

async def render_stepped_video_async(reel_id="SQL-01-R1", width=1080, height=1920, fps=30, total_sec=15.5):
    print(f"🎬 Starting 100% Deterministic Stepped Render for [{reel_id}] at {width}x{height} @ {fps}fps...", flush=True)
    start_time = time.time()
    
    # 1. Prepare 3-Layer Master Audio (Narration Dominant + 22% BGM + Crisp Acoustic SFX Suite)
    from marketing.sfx_synth import build_sfx_audio_segment

    cues = {
        't_hook_start': 0,
        't_line2_start': 2470,
        't_clock_in': 5760,
        't_opta': 7420,
        't_optb': 8880,
        't_clock_out': 13100,
        'totalMs': int(total_sec * 1000)
    }

    sfx_track = build_sfx_audio_segment(cues, int(total_sec * 1000)) + 1.5
    mixed_audio = OUTPUT_DIR / f"{reel_id}_temp_render_audio.mp3"
    
    audio_path = PROJECT_ROOT / "marketing" / "output" / "audio" / f"{reel_id}_narration.mp3"
    if not audio_path.exists():
        audio_path = PROJECT_ROOT / "marketing" / "output" / "audio" / "SQL-01-R1_narration.mp3"
    bgm_path = PROJECT_ROOT / "marketing" / "assets" / "audio" / "quiz_night_anthem_reel_16s.mp3"

    if audio_path.exists():
        # Narration: Dominant & punching through with +2.5dB clarity
        narration = AudioSegment.from_file(str(audio_path)) + 2.5
        
        # BGM: Exact 22% volume (-13.15 dB attenuation)
        if bgm_path.exists():
            bgm = AudioSegment.from_file(str(bgm_path)) - 13.15
            mixed = narration.overlay(bgm).overlay(sfx_track)
        else:
            mixed = narration.overlay(sfx_track)
            
        mixed.export(str(mixed_audio), format="mp3", bitrate="320k")
    else:
        AudioSegment.silent(duration=int(total_sec * 1000)).overlay(sfx_track).export(str(mixed_audio), format="mp3")

    out_mp4 = OUTPUT_DIR / f"{reel_id}_{height}p_perfect_sync.mp4"
    total_frames = int(total_sec * fps)

    # 2. Launch FFmpeg with stdin image pipe
    ffmpeg_cmd = [
        "ffmpeg", "-y",
        "-f", "image2pipe",
        "-vcodec", "mjpeg",
        "-r", str(fps),
        "-i", "-",
        "-i", str(mixed_audio),
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

    print(f"🚀 Spawning Playwright Chromium for Frame-Stepped Capture...", flush=True)
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
            viewport={"width": width, "height": height},
            device_scale_factor=1.0
        )
        page = await context.new_page()

        # Load Template
        template_file = (PROJECT_ROOT / "marketing" / "templates" / "neon-radial-clock.html").resolve()
        await page.goto(template_file.as_uri())
        await page.wait_for_timeout(1000)

        print(f"📸 Capturing {total_frames} frames with full preview animation fidelity...", flush=True)
        frame_start = time.time()

        for f in range(total_frames):
            ms = (f / fps) * 1000.0
            
            # Instant mathematical state seek
            await page.evaluate(f"window.ReelEngine.seek({ms});")
            
            # High-speed pristine JPEG screenshot buffer (quality 96 for crystal clear text)
            jpeg_bytes = await page.screenshot(type="jpeg", quality=96)
            ffmpeg_proc.stdin.write(jpeg_bytes)

            if f % 45 == 0 or f == total_frames - 1:
                pct = int((f + 1) / total_frames * 100)
                fps_rate = round((f + 1) / (time.time() - frame_start), 1)
                print(f"   [{pct}%] Frame {f+1}/{total_frames} ({ms/1000:.2f}s) @ {fps_rate} fps", flush=True)

        await browser.close()

    # Flush FFmpeg pipe and finish encoding
    ffmpeg_proc.stdin.close()
    ffmpeg_proc.wait()

    # Clean up temp audio
    if mixed_audio.exists():
        try: os.remove(mixed_audio)
        except: pass

    dur_total = round(time.time() - start_time, 1)
    file_size_mb = round(out_mp4.stat().st_size / (1024 * 1024), 2)
    print(f"==================================================", flush=True)
    print(f"🎉 100% FRAME-PERFECT VIDEO GENERATED!", flush=True)
    print(f"📁 File: {out_mp4}", flush=True)
    print(f"📦 Size: {file_size_mb} MB | Render Time: {dur_total}s", flush=True)
    print(f"==================================================", flush=True)
    return str(out_mp4)

def render_reel_to_video(reel_id="SQL-01-R1", width=1080, height=1920, fps=30, total_sec=15.5):
    return asyncio.run(render_stepped_video_async(reel_id, width, height, fps, total_sec))

if __name__ == "__main__":
    reel = sys.argv[1] if len(sys.argv) > 1 and not sys.argv[1].startswith("--") else "SQL-01-R1"
    is_4k = "--4k" in sys.argv
    fps_val = 60 if "--60fps" in sys.argv else 30
    w = 2160 if is_4k else 1080
    h = 3840 if is_4k else 1920
    render_reel_to_video(reel, width=w, height=h, fps=fps_val)
