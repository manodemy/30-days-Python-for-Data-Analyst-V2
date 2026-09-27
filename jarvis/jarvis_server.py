"""
J.A.R.V.I.S Real-Time Duplex Streaming WebSocket Server & Agentic Tool Bridge
"""
import asyncio
import base64
import json
import psutil
from pathlib import Path
from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.responses import HTMLResponse, JSONResponse
from pydantic import BaseModel

from jarvis.jarvis_voice import synthesize_sentence_stream, get_jarvis_speech_base64
from jarvis.jarvis_brain import stream_llm_sentences
from jarvis.jarvis_rag import get_workspace_index

app = FastAPI(title="J.A.R.V.I.S Streaming Core", version="5.0")

JARVIS_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = JARVIS_DIR.parent
HUD_HTML_PATH = JARVIS_DIR / "web_hud" / "index.html"

# Non-Blocking Agentic Tool Handlers
ACK_PHRASES = {
    "git_status": "Checking our repository status now, sir.",
    "code_search": "Scanning the Manodemy codebase, Deepak.",
    "render_reel": "Initializing the reel render pipeline for Day {day}, sir.",
    "run_diagnostic": "Running full studio diagnostics now, sir."
}

async def execute_tool_background(tool_name: str, args: dict, ws: WebSocket):
    """Executes long-running tool tasks asynchronously and reports result as a new vocal turn."""
    try:
        summary = "Operation completed, sir."
        if tool_name == "git_status":
            proc = await asyncio.create_subprocess_exec(
                "git", "status", "-s",
                stdout=asyncio.subprocess.PIPE, stderr=asyncio.subprocess.PIPE,
                cwd=str(PROJECT_ROOT)
            )
            stdout, _ = await proc.communicate()
            changes = len([l for l in stdout.decode().splitlines() if l.strip()])
            summary = f"Git status checked: We have {changes} active changes on the current branch, sir."

        elif tool_name == "render_reel":
            day = args.get("day", 5)
            summary = f"Render trigger acknowledged for Day {day}. The background render pipeline is standing by, sir."

        elif tool_name == "run_diagnostic":
            cpu = psutil.cpu_percent()
            ram = psutil.virtual_memory().percent
            summary = f"Diagnostics nominal, sir. CPU is at {cpu}% and RAM is at {ram}%."

        # Vocally report completion
        async for audio_chunk in synthesize_sentence_stream(summary):
            await ws.send_json({
                "type": "audio_chunk",
                "sentence_id": 999,
                "data": base64.b64encode(audio_chunk).decode("utf-8")
            })
            await ws.send_json({
                "type": "assistant_text_delta",
                "sentence": summary,
                "sentence_id": 999
            })
    except Exception as e:
        print(f"[TOOL ERROR] {tool_name}: {e}")

@app.get("/", response_class=HTMLResponse)
async def serve_hud():
    """Serves the Iron Man Holographic Web HUD."""
    if HUD_HTML_PATH.exists():
        return HTMLResponse(HUD_HTML_PATH.read_text(encoding="utf-8"))
    return HTMLResponse("<h1>JARVIS HUD not found</h1>", status_code=404)

@app.websocket("/ws/jarvis")
async def jarvis_duplex_websocket(ws: WebSocket):
    """
    Bidirectional Real-Time Duplex Streaming WebSocket
    Carries: user_text, user_interrupt, assistant_text_delta, audio_chunk, turn_complete
    """
    await ws.accept()
    interrupt_event = asyncio.Event()

    async def handle_turn(user_text: str):
        interrupt_event.clear()
        sentence_id = 0
        user_lower = user_text.lower()

        # Check for tool intent
        if "git" in user_lower and "status" in user_lower:
            ack = ACK_PHRASES["git_status"]
            sentence_id += 1
            await ws.send_json({"type": "assistant_text_delta", "sentence": ack, "sentence_id": sentence_id})
            async for audio_chunk in synthesize_sentence_stream(ack):
                await ws.send_json({"type": "audio_chunk", "sentence_id": sentence_id, "data": base64.b64encode(audio_chunk).decode("utf-8")})
            asyncio.create_task(execute_tool_background("git_status", {}, ws))
            await ws.send_json({"type": "turn_complete"})
            return

        # Stream Brain sentences in parallel with Vocal synthesis
        async for sentence in stream_llm_sentences(user_text, interrupt_event):
            if interrupt_event.is_set():
                break
            sentence_id += 1
            
            # Send text immediately
            await ws.send_json({
                "type": "assistant_text_delta",
                "sentence": sentence,
                "sentence_id": sentence_id
            })

            # Synthesize and stream audio chunk immediately for this sentence
            async for audio_chunk in synthesize_sentence_stream(sentence):
                if interrupt_event.is_set():
                    break
                await ws.send_json({
                    "type": "audio_chunk",
                    "sentence_id": sentence_id,
                    "data": base64.b64encode(audio_chunk).decode("utf-8")
                })

        if not interrupt_event.is_set():
            await ws.send_json({"type": "turn_complete"})

    try:
        while True:
            raw_msg = await ws.receive_text()
            data = json.loads(raw_msg)
            msg_type = data.get("type")

            if msg_type == "user_text":
                text = data.get("text", "").strip()
                if text:
                    asyncio.create_task(handle_turn(text))

            elif msg_type == "user_interrupt":
                # Instant cancellation signal from client barge-in controller
                interrupt_event.set()

    except WebSocketDisconnect:
        pass
    except Exception as e:
        print(f"[WS ERROR] {e}")

class ChatRequest(BaseModel):
    message: str

@app.post("/api/chat")
async def chat_rest_fallback(req: ChatRequest):
    """REST fallback endpoint."""
    user_text = req.message.strip()
    sentences = []
    async for s in stream_llm_sentences(user_text):
        sentences.append(s)
    full_text = " ".join(sentences)
    audio_b64 = await get_jarvis_speech_base64(full_text)
    return JSONResponse({"reply": full_text, "audio_base64": audio_b64})

@app.get("/api/status")
async def get_status():
    """Live system telemetry."""
    cpu_usage = psutil.cpu_percent(interval=None)
    ram = psutil.virtual_memory()
    index = get_workspace_index()
    return JSONResponse({
        "cpu_percent": cpu_usage,
        "ram_percent": ram.percent,
        "rendered_reels_count": len(index.get("reels", [])),
        "arc_reactor_core": "OPTIMAL",
        "active_protocol": "REAL-TIME DUPLEX WEBSOCKET"
    })

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=7070, log_level="warning")
