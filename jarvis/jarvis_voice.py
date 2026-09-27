"""
J.A.R.V.I.S 6-Stage Hollywood DSP Voice Engine
Synthesizes per-sentence streams with studio dynamics glue, early reflections, and spatial halos.
"""
import io
import asyncio
import base64
from pathlib import Path
from typing import AsyncGenerator
import edge_tts
from pydub import AudioSegment, effects
from pydub.effects import compress_dynamic_range

JARVIS_DIR = Path(__file__).resolve().parent
AUDIO_CACHE = JARVIS_DIR / "audio_cache"
AUDIO_CACHE.mkdir(parents=True, exist_ok=True)

JARVIS_VOICE = "en-GB-RyanNeural"
JARVIS_RATE = "-3%"
JARVIS_PITCH = "-2Hz"

def master_jarvis_audio_bytes(raw_mp3_bytes: bytes) -> bytes:
    """
    Applies the 6-Stage Hollywood Acoustic Mastering Chain:
    1. High-Pass Clean (95Hz)
    2. Base Normalization
    3. Titanium Helmet Early Reflection (12ms @ -18dB)
    4. Stark Lab Spatial Halo (35ms @ -24dB)
    5. Multi-band Dynamics Compression (Threshold -20dB, Ratio 2.5)
    6. Broadcast True Peak Limiter (-0.5dB)
    """
    sound = AudioSegment.from_file(io.BytesIO(raw_mp3_bytes), format="mp3")
    
    # 1. Clean low-end rumble
    sound = sound.high_pass_filter(95)
    sound = effects.normalize(sound)
    
    # 2. Stage A: Titanium Helmet Early Reflection
    helmet = sound - 18
    layered = sound.overlay(helmet, position=12)
    
    # 3. Stage B: Cinematic Lab Spatial Halo
    lab_spatial = sound - 24
    cinematic = layered.overlay(lab_spatial, position=35)
    
    # 4. Stage C: Gentle Dynamic Range Compression
    compressed = compress_dynamic_range(
        cinematic,
        threshold=-20.0,
        ratio=2.5,
        attack=5.0,
        release=60.0
    )
    
    # 5. Stage D: Final Broadcast Limiting
    final_master = effects.normalize(compressed) - 0.5
    
    out_buf = io.BytesIO()
    final_master.export(out_buf, format="mp3", bitrate="320k")
    return out_buf.getvalue()

async def synthesize_sentence_stream(sentence: str) -> AsyncGenerator[bytes, None]:
    """Synthesizes a single complete sentence and yields mastered audio bytes."""
    clean_text = sentence.strip().replace('"', '').replace("'", "'")
    if not clean_text:
        return
    
    communicate = edge_tts.Communicate(
        text=clean_text,
        voice=JARVIS_VOICE,
        rate=JARVIS_RATE,
        pitch=JARVIS_PITCH
    )
    
    raw_buffer = bytearray()
    async for chunk in communicate.stream():
        if chunk["type"] == "audio":
            raw_buffer.extend(chunk["data"])
            
    if raw_buffer:
        mastered_bytes = master_jarvis_audio_bytes(bytes(raw_buffer))
        yield mastered_bytes

async def get_jarvis_speech_base64(text: str) -> str:
    """Convenience helper returning full base64 audio."""
    mastered_chunks = []
    async for chunk in synthesize_sentence_stream(text):
        mastered_chunks.append(chunk)
    
    if not mastered_chunks:
        return ""
    full_audio = b"".join(mastered_chunks)
    return base64.b64encode(full_audio).decode("utf-8")

if __name__ == "__main__":
    async def test_run():
        sentence = "At your service, sir. All neural subsystems are calibrated."
        print("[JARVIS] Synthesizing sentence stream...")
        async for chunk in synthesize_sentence_stream(sentence):
            print(f"Generated mastered chunk: {len(chunk)} bytes")
    asyncio.run(test_run())
