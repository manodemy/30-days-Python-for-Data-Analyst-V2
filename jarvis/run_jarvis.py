"""
J.A.R.V.I.S 1-Click Launcher
Boots the Iron Man Holographic Voice AI Agent on http://localhost:7070
"""
import time
import webbrowser
import uvicorn
from pathlib import Path
from jarvis.jarvis_server import app

def launch_jarvis():
    print("==================================================================", flush=True)
    print("[JARVIS] STARK INDUSTRIES AI CORE INITIALIZING...", flush=True)
    print("==================================================================", flush=True)
    print("[JARVIS] Arc Reactor Core: OPTIMAL", flush=True)
    print("[JARVIS] Neural Voice Engine: ACTIVE (British Cadence)", flush=True)
    print("[JARVIS] Holographic Web HUD: http://127.0.0.1:7070", flush=True)
    print("==================================================================\n", flush=True)

    # Automatically open browser HUD after a brief 1-second pause
    def open_browser():
        time.sleep(1.2)
        print("[JARVIS] Opening Holographic HUD in your browser...", flush=True)
        webbrowser.open("http://127.0.0.1:7070")

    import threading
    threading.Thread(target=open_browser, daemon=True).start()

    # Start FastAPI server
    uvicorn.run(app, host="127.0.0.1", port=7070, log_level="warning")

if __name__ == "__main__":
    launch_jarvis()
