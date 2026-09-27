#!/usr/bin/env python3
"""
Manodemy RAG Studio Multi-Threaded Dev Server
============================================
Uses ThreadingHTTPServer to handle audio streaming, Pyodide WASM,
and dynamic JS micro-animation assets concurrently without socket deadlock.
"""

import os
import sys
import mimetypes
from pathlib import Path
from http.server import ThreadingHTTPServer, SimpleHTTPRequestHandler

# Ensure UTF-8 output on Windows consoles
if sys.platform == "win32":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

ROOT_DIR = Path(__file__).resolve().parent.parent
PUBLIC_DIR = ROOT_DIR / "public"

# Ensure all essential modern web MIME types are correctly registered
mimetypes.add_type("application/javascript", ".js")
mimetypes.add_type("application/wasm", ".wasm")
mimetypes.add_type("audio/mpeg", ".mp3")
mimetypes.add_type("application/json", ".json")
mimetypes.add_type("image/webp", ".webp")
mimetypes.add_type("image/jpeg", ".jpg")
mimetypes.add_type("image/png", ".png")

class MultiThreadedHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(PUBLIC_DIR), **kwargs)

    def end_headers(self):
        # Allow cross-origin requests for Web Workers and Audio buffers
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, HEAD, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "*")
        # Prevent aggressive browser caching during active development
        if self.path.endswith(".js") or self.path.endswith(".html") or self.path.endswith(".css"):
            self.send_header("Cache-Control", "no-cache, must-revalidate")
        super().end_headers()

    def do_OPTIONS(self):
        self.send_response(200)
        self.end_headers()

    def log_message(self, format, *args):
        # Keep server log concise: print status code and path
        try:
            sys.stdout.write(f"[{self.log_date_time_string()}] {args[0]} {args[1]}\n")
            sys.stdout.flush()
        except Exception:
            pass

def run(port=3000):
    if not PUBLIC_DIR.exists():
        print(f"Error: Public directory not found at {PUBLIC_DIR}")
        sys.exit(1)

    server_address = ("0.0.0.0", port)
    httpd = ThreadingHTTPServer(server_address, MultiThreadedHandler)
    httpd.daemon_threads = True
    print(f">> Multi-Threaded Dev Server running at http://localhost:{port}/")
    print(f">> Serving root: {PUBLIC_DIR}")
    print(f">> Audio, Pyodide WASM, and GSAP assets served concurrently.")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nShutting down dev server.")
        httpd.server_close()

if __name__ == "__main__":
    port = 3000
    if len(sys.argv) > 1 and sys.argv[1].isdigit():
        port = int(sys.argv[1])
    run(port)
