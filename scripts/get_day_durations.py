import os
import sys
import subprocess
import json

def get_duration(file_path):
    # Try mutagen or ffprobe or wave
    try:
        from mutagen.mp3 import MP3
        audio = MP3(file_path)
        return audio.info.length
    except Exception:
        pass

    try:
        cmd = [
            'ffprobe', '-v', 'error', '-show_entries',
            'format=duration', '-of', 'default=noprint_wrappers=1:nokey=1',
            file_path
        ]
        out = subprocess.check_output(cmd).decode().strip()
        return float(out)
    except Exception:
        pass

    # Fallback estimation based on file size (approx 16-24kbps for edge-tts)
    size = os.path.getsize(file_path)
    return max(1.0, size / 6000.0)

def main():
    day_num = int(sys.argv[1]) if len(sys.argv) > 1 else 13
    day_str = f"Day{day_num:02d}"
    folder = os.path.join("public", "Version-3", day_str)
    if not os.path.exists(folder):
        print(f"Directory {folder} does not exist")
        return

    # Check theory tracks
    theory_files = [f"New_Day{day_num}Part1audio{i:02d}.mp3" for i in range(1, 17)]
    # Check question files
    q_files = []
    for i in range(1, 16):
        q_files.append(f"New_Day{day_num}Question{i:02d}.mp3")
        q_files.append(f"New_Day{day_num}Question{i:02d}sol.mp3")

    all_files = theory_files + q_files

    durations = {}
    total_sec = 0.0

    print(f"--- Audio Durations for Day {day_num} ---")
    for f in all_files:
        path = os.path.join(folder, f)
        if os.path.exists(path):
            d = get_duration(path)
            durations[f] = round(d, 2)
            total_sec += d
        else:
            print(f"Missing: {f}")

    print(f"Total files: {len(durations)} / {len(all_files)}")
    print(f"Total duration: {int(total_sec//60):02d}:{int(total_sec%60):02d} ({round(total_sec, 2)}s)")
    print("\nDurations Dict:")
    print(json.dumps(durations, indent=2))

if __name__ == '__main__':
    main()
