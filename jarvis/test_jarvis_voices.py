"""
Tests and compares 3 distinct J.A.R.V.I.S voice profiles with audio post-processing DSP.
"""
import asyncio
from pathlib import Path
import edge_tts
from pydub import AudioSegment, effects

JARVIS_DIR = Path(__file__).resolve().parent
AUDIO_CACHE = JARVIS_DIR / "audio_cache"
AUDIO_CACHE.mkdir(parents=True, exist_ok=True)

PHRASE = "At your service, sir. I have calibrated all neural diagnostics. What would you like to build next, Deepak?"

def apply_jarvis_sfx(audio_path: Path) -> Path:
    """Applies high-tech acoustic studio EQ and subtle metallic intercom presence to replicate Iron Man's JARVIS."""
    sound = AudioSegment.from_file(str(audio_path), format="mp3")
    
    # 1. Normalize
    sound = effects.normalize(sound)
    
    # 2. Add subtle high-frequency presence (crisp AI clarity)
    # High-pass filter above 120Hz to remove muddy rumble
    sound = sound.high_pass_filter(140)
    
    # 3. Create subtle subharmonic spatial layer (Iron Man suit / lab intercom effect)
    # Duplicate with slight delay & gain reduction for natural acoustic space
    spatial_echo = sound - 14  # 14dB quieter
    # Shift slightly by 18ms
    ambient_mix = sound.overlay(spatial_echo, position=18)
    
    out_path = audio_path.parent / (audio_path.stem + "_dsp.mp3")
    ambient_mix.export(str(out_path), format="mp3", bitrate="320k")
    return out_path

async def generate_variants():
    configs = [
        ("V1_Thomas_Deep_British", "en-GB-ThomasNeural", "-4%", "-2Hz"),
        ("V2_Thomas_Crisp_Refined", "en-GB-ThomasNeural", "+2%", "+0Hz"),
        ("V3_Ryan_Posh_British", "en-GB-RyanNeural", "-1%", "-4Hz"),
    ]
    
    print("[JARVIS] Generating 3 Voice Variations for Evaluation...\n")
    for name, voice, rate, pitch in configs:
        raw_file = AUDIO_CACHE / f"{name}_raw.mp3"
        comm = edge_tts.Communicate(PHRASE, voice=voice, rate=rate, pitch=pitch)
        await comm.save(str(raw_file))
        
        # Apply Iron Man acoustic DSP filter
        dsp_file = apply_jarvis_sfx(raw_file)
        print(f"-> Generated {name}: {dsp_file.name}")

if __name__ == "__main__":
    asyncio.run(generate_variants())
