# 🦾 J.A.R.V.I.S v2 — Production Upgraded Architecture Spec

**Reviewer Role:** Principal AI Systems Architect / Real-Time Audio DSP Engineer  
**Status:** Implemented & Live on `http://localhost:7070`  
**Execution Spine:** Full Bidirectional Streaming Pipeline (Sentence-Boundary Chunking + Web Audio API Barge-In + 6-Stage DSP)

---

## 1. 🏛️ Pipeline of Streams (The Core Upgrade)

```
[ CLIENT: Mic Audio Stream ]
            │ (Web Speech VAD)
            ▼
[ WEBSOCKET: /ws/jarvis (JSON/Binary Stream) ]
            │
            ├──> [ BRAIN: Sentence-Boundary Streamer ]
            │       │ (Yields Sentence 1 immediately when formed)
            │       ▼
            └──> [ MOUTH: 6-Stage DSP Sentence Synthesizer ]
                    │ (Synthesizes Sentence 1 while Brain generates Sentence 2)
                    ▼
[ CLIENT: Web Audio API Queue & Sub-Millisecond GainNode Ducking ]
```

---

## 2. 🎛️ 6-Stage Hollywood Acoustic Mastering Chain

1. **Low-End Rumble Clean:** High-Pass Filter @ 95Hz.
2. **Dynamic Range Normalization:** Calibrates baseline level.
3. **Stage A (Titanium Helmet Early Reflection):** 12ms delay @ -18dB.
4. **Stage B (Stark Lab Spatial Halo):** 35ms spatial acoustic halo @ -24dB.
5. **Stage C (Multiband Dynamics Glue):** Gentle compression (`threshold=-20dB`, `ratio=2.5`, `attack=5ms`, `release=60ms`).
6. **Stage D (Broadcast Limiter):** True Peak Ceiling @ -0.5dB.

---

## 3. 🛡️ Instant Client-Side Barge-In & Duplex

- **Web Audio API `GainNode`:** Sub-millisecond instant volume ducking (50ms linear ramp to 0) upon user voice detection, avoiding network roundtrip delay.
- **Server Interruption Event:** Cancels in-flight LLM generation and voice synthesis instantly.
- **Audio Tail Guard:** 750ms buffer prevents speaker echo from looping back into the microphone.

---

## 4. 📚 Token-Efficient Local Workspace RAG

- Pre-indexed `jarvis/workspace_index.json` containing:
  - Day 01–18 SQL curriculum metadata and challenges.
  - Marketing Reels catalog & bridge links (`manodemy.com/q1` through `manodemy.com/q10`).
- Request-time keyword router injects only relevant day/reel content into context.

---

## 5. 🛠️ Non-Blocking Agentic Tool Execution

- **`git_status`:** Asynchronously inspects repository state and reports verbally.
- **`render_reel`:** Triggers video-reel render pipeline for specified curriculum day.
- **`run_diagnostic`:** Real-time CPU, RAM, and render queue telemetry.
