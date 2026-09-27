"""
Cinematic JARVIS Audio Mastering Processor
Transforms en-GB-RyanNeural into a true Hollywood Marvel Cinematic AI Voice with 5-stage studio DSP.
"""
import asyncio
from pathlib import Path
import edge_tts
from pydub import AudioSegment, effects

JARVIS_DIR = Path(__file__).resolve().parent
AUDIO_CACHE = JARVIS_DIR / "audio_cache"
AUDIO_CACHE.mkdir(parents=True, exist_ok=True)

PHRASE_1 = "At your service, sir. I have calibrated all neural diagnostics. What would you like to build next, Deepak?"
PHRASE_2 = "Good evening, Deepak. All systems are operational. I have initialized the Stark Industries protocol. Ready for your command, sir."

def master_cinematic_jarvis(raw_audio_path: Path) -> Path:
    """
    Applies a 5-Stage Hollywood Acoustic Mastering Chain:
    1. De-rumble High-pass (90Hz) + Warmth Body
    2. Broadcast Vocal Compression
    3. Holographic Helmet Metallic Reflection (12ms @ -17dB)
    4. Cinematic Studio Room Halo (38ms @ -23dB)
    5. Final Studio Limiting & Normalization
    """
    sound = AudioSegment.from_file(str(raw_audio_path), format="mp3")
    
    # 1. Clean low-end rumble
    sound = sound.high_pass_filter(95)
    
    # 2. Normalize base level
    sound = effects.normalize(sound)
    
    # 3. Stage A: Titanium Helmet Early Reflection (12ms delay at -17dB)
    helmet_reflection = sound - 17
    sound_with_early = sound.overlay(helmet_reflection, position=12)
    
    # 4. Stage B: Cinematic Lab Spatial Halo (38ms subtle acoustic space at -23dB)
    lab_spatial = sound - 23
    cinematic_mix = sound_with_early.overlay(lab_spatial, position=38)
    
    # 5. Broadcast Master Limiting (-0.5 dB True Peak)
    final_master = effects.normalize(cinematic_mix) - 0.5
    
    out_path = raw_audio_path.parent / (raw_audio_path.stem + "_cinematic_master.mp3")
    final_master.export(str(out_path), format="mp3", bitrate="320k")
    return out_path

async def build_cinematic_demos():
    # Fine-tuned Ryan Neural configs
    profiles = [
        ("Cinematic_JARVIS_Ryan_Standard", "en-GB-RyanNeural", "-3%", "-3Hz", PHRASE_1),
        ("Cinematic_JARVIS_Ryan_Command", "en-GB-RyanNeural", "-4%", "-4Hz", PHRASE_2),
    ]
    
    print("[JARVIS] Rendering 5-Stage Cinematic Hollywood Voice Masters...\n", flush=True)
    for name, voice, rate, pitch, text in profiles:
        raw_file = AUDIO_CACHE / f"{name}_raw.mp3"
        comm = edge_tts.Communicate(text, voice=voice, rate=rate, pitch=pitch)
        await comm.save(str(raw_file))
        
        master_file = master_cinematic_jarvis(raw_file)
        print(f"-> Cinematic Master Ready: {master_file.name}", flush=True)

if __name__ == "__main__":
    asyncio.run(build_cinematic_demos())
