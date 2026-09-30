import sys, json, re
from pathlib import Path
import mutagen.mp3

if sys.platform == "win32":
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

AUDIO_DIR = Path("public/python/Day01")

lecture_tracks = [
    {
        "src": "Day01/New_PyDay01Audio01.mp3",
        "target": "#day01WhyPythonSection",
        "title": "01. Python in Modern Data Analytics",
        "type": "narration"
    },
    {
        "src": "Day01/New_PyDay01Audio02.mp3",
        "target": "#day01ToolMatrixSection",
        "title": "Tool Matrix: SQL vs Excel vs Python",
        "type": "narration"
    },
    {
        "src": "Day01/New_PyDay01Audio03.mp3",
        "target": "#day01MutabilitySection",
        "title": "02. Object Mutability & Shared References",
        "type": "narration"
    },
    {
        "src": "Day01/New_PyDay01Audio04.mp3",
        "target": "#day01DataTypesSection",
        "title": "03. Master Data Types Reference",
        "type": "narration"
    },
    {
        "src": "Day01/New_PyDay01Audio05.mp3",
        "target": "#day01MemorySection",
        "title": "04. Memory Management & RAM Pointers",
        "type": "narration"
    }
]

question_tracks = []
for i in range(1, 16):
    question_tracks.append({
        "src": f"Day01/New_PyDay01Question{i:02d}.mp3",
        "target": "#questionBar",
        "title": f"Question {i}",
        "type": "question",
        "qId": i
    })
    question_tracks.append({
        "src": f"Day01/New_PyDay01Question{i:02d}sol.mp3",
        "target": "#questionBar",
        "title": f"Q{i} Solution Walkthrough",
        "type": "solution",
        "qId": i
    })

all_tracks = lecture_tracks + question_tracks
print(f"Total tracks: {len(all_tracks)}")

durations = []
for t in all_tracks:
    fname = Path(t["src"]).name
    audio_path = AUDIO_DIR / fname
    audio = mutagen.mp3.MP3(str(audio_path))
    dur = round(audio.info.length, 1)
    durations.append(dur)
    print(f"  {fname}: {dur}s ({t['title']})")

print(f"\nTotal Day 01 duration: {sum(durations):.1f}s ({sum(durations)/60:.1f} mins)")

# Build the JS block
tracks_json = json.dumps(all_tracks, indent=2)
# Indent tracks_json for python-engine.js
indented_tracks = "\n".join("    " + line for line in tracks_json.split("\n"))

durations_str = ", ".join(str(d) for d in durations)

py_day_01_registry = f"""  'pyDay01': {{
    tracks: {tracks_json},
    durations: [{durations_str}]
  }},"""

# Now replace pyDay01 in public/python/python-engine.js
engine_file = Path("public/python/python-engine.js")
with open(engine_file, "r", encoding="utf-8") as f:
    engine_code = f.read()

pattern = r"\'pyDay01\'\s*:\s*\{[\s\S]*?\}\s*,\s*(?=\'pyDay02\')"
new_engine_code = re.sub(pattern, py_day_01_registry + "\n", engine_code)

if new_engine_code == engine_code:
    print("ERROR: Could not find pyDay01 block in python-engine.js")
    sys.exit(1)

with open(engine_file, "w", encoding="utf-8") as f:
    f.write(new_engine_code)

print("✓ Successfully updated PYTHON_DAY_TRACKS['pyDay01'] in public/python/python-engine.js!")
