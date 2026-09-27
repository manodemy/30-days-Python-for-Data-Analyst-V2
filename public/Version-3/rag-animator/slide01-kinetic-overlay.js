/* ═══════════════════════════════════════════════════════════════════
   Manodemy RAG Studio — Slide 01 Kinetic Motion Overlay Engine
   100% GSAP Master Timeline-Driven Micro-Animations
   Injected Directly on top of the 3D Diorama Stage
   Zero setTimeout · Frame-Exact Scrubber Seeking & Reversal
   ═══════════════════════════════════════════════════════════════════ */

(function(root) {
  'use strict';

  const KINETIC_STYLE_ID = 'rag-kinetic-styles';

  function injectKineticStyles() {
    if (document.getElementById(KINETIC_STYLE_ID)) return;
    const style = document.createElement('style');
    style.id = KINETIC_STYLE_ID;
    style.textContent = `
      /* ── Kinetic Overlay Host ── */
      .rag-kinetic-container {
        position: absolute;
        inset: 0;
        pointer-events: none;
        overflow: hidden;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
      }

      /* ── Beat 1: 4 LLM Logos (ChatGPT, Claude, Gemini, Grok) ── */
      .kt-llm-logo-card {
        position: absolute;
        top: 50%;
        left: 50%;
        display: inline-flex;
        align-items: center;
        gap: 10px;
        background: rgba(255, 255, 255, 0.96);
        border: 1.5px solid rgba(226, 232, 240, 0.9);
        border-radius: 999px;
        padding: 5px 15px 5px 7px;
        box-shadow: 0 8px 24px rgba(15, 23, 42, 0.12), 0 2px 6px rgba(0, 0, 0, 0.04);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        opacity: 0;
        z-index: 10;
        pointer-events: auto;
        user-select: none;
      }
      .kt-logo-icon-wrap {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #ffffff;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.08);
        flex-shrink: 0;
      }
      .kt-logo-img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
      .kt-logo-tag {
        font-size: 12.5px;
        font-weight: 800;
        color: #0f172a;
        letter-spacing: -0.01em;
      }
      .kt-logo-chatgpt { border-color: rgba(16, 185, 129, 0.5); }
      .kt-logo-claude  { border-color: rgba(217, 119, 6, 0.5); }
      .kt-logo-gemini  { border-color: rgba(59, 130, 246, 0.5); }
      .kt-logo-grok    { border-color: rgba(15, 23, 42, 0.5); }

      /* ── Beat 2 & 3: Concept Boxes (Not a Database & Next-Word Predictor) ── */
      .kt-concept-card {
        position: absolute;
        top: 50%;
        left: 50%;
        display: inline-flex;
        align-items: center;
        gap: 10px;
        background: rgba(255, 255, 255, 0.96);
        border-radius: 12px;
        padding: 6px 14px;
        box-shadow: 0 8px 24px rgba(15, 23, 42, 0.12), 0 2px 6px rgba(0, 0, 0, 0.04);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        opacity: 0;
        z-index: 10;
        pointer-events: auto;
        user-select: none;
        white-space: nowrap;
      }
      .kt-card-not-db {
        border: 1.5px solid rgba(239, 68, 68, 0.5);
        box-shadow: 0 8px 24px rgba(239, 68, 68, 0.12), 0 2px 6px rgba(0, 0, 0, 0.04);
      }
      .kt-card-predictor {
        border: 1.5px solid rgba(16, 185, 129, 0.5);
        box-shadow: 0 8px 24px rgba(16, 185, 129, 0.12), 0 2px 6px rgba(0, 0, 0, 0.04);
      }
      .kt-concept-icon-wrap {
        width: 28px;
        height: 28px;
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        flex-shrink: 0;
      }
      .not-db-icon {
        background: rgba(239, 68, 68, 0.1);
        border: 1px solid rgba(239, 68, 68, 0.25);
      }
      .predictor-icon {
        background: rgba(16, 185, 129, 0.1);
        border: 1px solid rgba(16, 185, 129, 0.25);
      }
      .kt-concept-body {
        display: flex;
        flex-direction: column;
      }
      .kt-concept-title {
        font-size: 12px;
        font-weight: 800;
        letter-spacing: -0.01em;
      }
      .kt-card-not-db .kt-concept-title {
        color: #b91c1c;
      }
      .kt-card-predictor .kt-concept-title {
        color: #047857;
      }
      .kt-concept-sub {
        font-size: 9.5px;
        font-weight: 600;
        color: #64748b;
        letter-spacing: 0.2px;
      }

      @media (max-width: 768px) {
        .kt-llm-logo-card {
          padding: 4px 10px 4px 6px;
          gap: 6px;
        }
        .kt-logo-icon-wrap {
          width: 22px;
          height: 22px;
        }
        .kt-logo-tag {
          font-size: 10.5px;
        }
        .kt-concept-card {
          padding: 6px 12px;
          gap: 8px;
        }
        .kt-concept-icon-wrap {
          width: 26px;
          height: 26px;
          font-size: 13px;
        }
        .kt-concept-title {
          font-size: 11px;
        }
        .kt-concept-sub {
          font-size: 9px;
        }
      }

      /* ── Beat 3: 12 Information Gadget Icons (Orbital Blast) ── */
      .kt-gadget-icon {
        position: absolute;
        width: 46px;
        height: 46px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.95);
        border: 2px solid rgba(37, 99, 235, 0.4);
        box-shadow: 0 6px 18px rgba(37, 99, 235, 0.22), 0 0 0 3px rgba(255, 255, 255, 0.85);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 15;
        opacity: 0;
        pointer-events: none;
        backdrop-filter: blur(8px);
        transform: translate(-50%, -50%);
      }
      .kt-gadget-icon svg {
        width: 22px;
        height: 22px;
        fill: #2563eb;
      }
      @media (max-width: 768px) {
        .kt-gadget-icon {
          width: 34px;
          height: 34px;
        }
        .kt-gadget-icon svg {
          width: 17px;
          height: 17px;
        }
      }


      /* ── 3 Problem Cards (Sliding from Left at 35.7s) ── */
      .kt-problem-cards-list {
        position: absolute;
        left: 3.5%;
        top: 36%;
        display: flex;
        flex-direction: column;
        gap: 8px;
        z-index: 16;
        pointer-events: none;
        width: 240px;
      }
      .kt-problem-card {
        display: flex;
        align-items: center;
        gap: 10px;
        background: rgba(255, 255, 255, 0.96);
        border: 1.5px solid rgba(226, 232, 240, 0.9);
        border-radius: 12px;
        padding: 8px 13px;
        box-shadow: 0 4px 18px rgba(15, 23, 42, 0.07);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        opacity: 0;
        will-change: transform, opacity;
      }
      .kt-prob-badge {
        width: 24px;
        height: 24px;
        border-radius: 6px;
        background: #f1f5f9;
        color: #475569;
        font-weight: 800;
        font-size: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
        transition: background 0.35s, color 0.35s;
      }
      .kt-prob-info {
        flex: 1;
        min-width: 0;
      }
      .kt-prob-title {
        font-size: 12.5px;
        font-weight: 800;
        color: #0f172a;
        line-height: 1.2;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
      .kt-prob-desc {
        font-size: 10px;
        font-weight: 600;
        color: #64748b;
        margin-top: 2px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
      .kt-prob-icon {
        font-size: 16px;
        flex-shrink: 0;
      }

      /* ── Beat 6: Locked File Stack (Right Flank, High Contrast for White Background) ── */
      .kt-locked-files-box {
        position: absolute;
        top: 36%;
        right: 3.5%;
        width: 290px;
        display: flex;
        flex-direction: column;
        gap: 8px;
        z-index: 16;
        opacity: 0;
        pointer-events: none;
        background: rgba(255, 255, 255, 0.98);
        padding: 12px 14px;
        border-radius: 13px;
        border: 1.5px solid rgba(239, 68, 68, 0.45);
        box-shadow: 0 10px 28px rgba(239, 68, 68, 0.16), 0 2px 8px rgba(0, 0, 0, 0.05);
        backdrop-filter: blur(10px);
      }
      .kt-file-pill {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 7px 11px;
        background: #ffffff;
        border: 1.5px solid rgba(239, 68, 68, 0.65);
        border-radius: 8px;
        font-family: 'JetBrains Mono', monospace;
        font-size: 11.5px;
        font-weight: 700;
        color: #991b1b;
        box-shadow: 0 2px 6px rgba(239, 68, 68, 0.08);
      }
      .kt-file-name {
        flex: 1;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
      .kt-locked-files-warn {
        font-size: 10.5px;
        font-weight: 800;
        color: #dc2626;
        letter-spacing: 0.5px;
        display: flex;
        align-items: center;
        gap: 5px;
        margin-top: 2px;
      }

      /* ── Beat 7: Hallucination 4-Step Progressive Stage (Right Flank) ── */
      .kt-hallucination-stage {
        position: absolute;
        right: 3.5%;
        top: 36%;
        width: 310px;
        display: flex;
        flex-direction: column;
        gap: 8px;
        z-index: 16;
        pointer-events: none;
        opacity: 0;
      }
      .kt-h-step {
        background: rgba(255, 255, 255, 0.97);
        border-radius: 12px;
        padding: 8px 12px;
        box-shadow: 0 4px 14px rgba(15, 23, 42, 0.08);
        backdrop-filter: blur(10px);
        opacity: 0;
        transform: translateY(14px);
        display: flex;
        align-items: center;
        gap: 10px;
      }
      .kt-h-dangerous {
        border: 1.5px solid rgba(239, 68, 68, 0.65);
        background: #fff5f5;
      }
      .kt-h-dangerous .kt-h-title {
        color: #dc2626;
        font-weight: 800;
        font-size: 12px;
        letter-spacing: 0.5px;
      }
      .kt-h-dangerous .kt-h-sub {
        color: #991b1b;
        font-size: 10px;
        font-weight: 600;
      }
      .kt-h-helpful {
        border: 1.5px solid rgba(16, 185, 129, 0.55);
        background: #f0fdf4;
      }
      .kt-h-helpful .kt-h-title {
        color: #059669;
        font-weight: 800;
        font-size: 11.5px;
      }
      .kt-h-helpful .kt-h-speech {
        color: #047857;
        font-size: 10.5px;
        font-style: italic;
        font-weight: 600;
      }
      .kt-h-noadmit {
        border: 1.5px solid rgba(245, 158, 11, 0.65);
        background: #fffbeb;
      }
      .kt-h-noadmit .kt-h-title {
        color: #d97706;
        font-weight: 800;
        font-size: 11.5px;
      }
      .kt-h-noadmit .kt-h-sub {
        color: #b45309;
        font-size: 10px;
        font-weight: 600;
      }
      .kt-h-gauge {
        flex-direction: column;
        align-items: stretch;
        border: 2px solid rgba(239, 68, 68, 0.7);
        background: #ffffff;
        box-shadow: 0 8px 24px rgba(239, 68, 68, 0.18);
        padding: 9px 12px;
      }
      .kt-gauge-header {
        font-size: 10.5px;
        font-weight: 800;
        color: #dc2626;
        text-align: center;
        letter-spacing: 0.5px;
        margin-bottom: 5px;
      }
      .kt-gauge-row {
        display: flex;
        align-items: center;
        justify-content: space-around;
        padding: 3px 0;
      }
      .kt-gauge-col {
        text-align: center;
      }
      .kt-gauge-val {
        font-family: 'JetBrains Mono', monospace;
        font-size: 19px;
        font-weight: 900;
        line-height: 1;
      }
      .kt-gauge-label {
        font-size: 8.5px;
        font-weight: 800;
        letter-spacing: 0.5px;
        margin-top: 3px;
      }
      .kt-gauge-vs {
        font-size: 13px;
        font-weight: 900;
        color: #cbd5e1;
      }
      .kt-gauge-footer {
        border-top: 1px solid #fee2e2;
        margin-top: 5px;
        padding-top: 5px;
        font-size: 9.5px;
        font-weight: 700;
        color: #991b1b;
        text-align: center;
      }

      @media (max-width: 768px) {
        .kt-problem-cards-list {
          width: 165px;
          left: 2%;
          top: 24%;
          gap: 6px;
        }
        .kt-problem-card {
          padding: 6px 9px;
          gap: 6px;
        }
        .kt-prob-title {
          font-size: 10.5px;
        }
        .kt-prob-desc {
          display: none;
        }
        .kt-locked-files-box {
          width: 200px;
          right: 2%;
          top: 24%;
          padding: 8px 10px;
        }
        .kt-hallucination-stage {
          width: 210px;
          right: 2%;
          top: 24%;
          gap: 6px;
        }
      }

      /* ── Beat 8: RAG Simplest Solution Stage (58.80s - 65.22s) ── */
      .kt-rag-simplest-stage {
        position: absolute;
        top: 23.5%;
        left: 50%;
        transform: translateX(-50%);
        width: 90%;
        max-width: 700px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        z-index: 12;
        opacity: 0;
        pointer-events: none;
      }
      .kt-kb-card {
        background: rgba(255, 255, 255, 0.96);
        border: 1.5px solid rgba(2, 132, 199, 0.35);
        border-radius: 10px;
        padding: 8px 12px;
        width: 44%;
        box-shadow: 0 8px 24px rgba(2, 132, 199, 0.12);
        backdrop-filter: blur(12px);
      }
      .kt-stage-badge {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        font-size: 10px;
        font-weight: 800;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        border-radius: 4px;
        padding: 2px 6px;
      }
      .kt-badge-cyan {
        background: #e0f2fe;
        color: #0369a1;
        border: 1px solid #bae6fd;
      }
      .kt-badge-emerald {
        background: #ecfdf5;
        color: #047857;
        border: 1px solid #a7f3d0;
      }
      .kt-badge-red {
        background: #fef2f2;
        color: #991b1b;
        border: 1px solid #fecaca;
      }
      .kt-badge-indigo {
        background: #eef2ff;
        color: #4338ca;
        border: 1px solid #c7d2fe;
      }
      .kt-chunk-item {
        background: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 5px;
        padding: 3px 7px;
        margin-top: 4px;
        font-size: 10px;
        font-weight: 700;
        color: #334155;
        display: flex;
        align-items: center;
        gap: 6px;
      }
      .kt-arrow-flow {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 3px;
        text-align: center;
        white-space: nowrap;
      }
      .kt-arrow-pill {
        background: #ffffff;
        border: 1.5px solid #0284c7;
        border-radius: 999px;
        padding: 3px 10px;
        font-size: 9px;
        font-weight: 800;
        color: #0284c7;
        box-shadow: 0 4px 12px rgba(2, 132, 199, 0.16);
      }
      .kt-relevant-card {
        background: rgba(255, 255, 255, 0.98);
        border: 2px solid #10b981;
        border-radius: 10px;
        padding: 8px 12px;
        width: 48%;
        box-shadow: 0 8px 26px rgba(16, 185, 129, 0.16);
        backdrop-filter: blur(12px);
      }
      .kt-check-row {
        background: #f0fdf4;
        border: 1px solid #bbf7d0;
        border-radius: 5px;
        padding: 3px 7px;
        margin-top: 4px;
        font-size: 10px;
        font-weight: 700;
        color: #166534;
        display: flex;
        align-items: center;
        gap: 6px;
      }

      /* ── Beat 9: No Re-Training Stage (65.22s - 72.34s) ── */
      .kt-no-retrain-stage {
        position: absolute;
        top: 23.5%;
        left: 50%;
        transform: translateX(-50%);
        width: 90%;
        max-width: 700px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        z-index: 12;
        opacity: 0;
        pointer-events: none;
      }
      .kt-no-train-card {
        background: rgba(255, 255, 255, 0.96);
        border: 1.5px solid rgba(239, 68, 68, 0.4);
        border-radius: 10px;
        padding: 8px 12px;
        width: 44%;
        box-shadow: 0 8px 24px rgba(239, 68, 68, 0.12);
        backdrop-filter: blur(12px);
      }
      .kt-strike-item {
        font-size: 9.5px;
        font-weight: 600;
        color: #991b1b;
        margin-top: 3px;
        display: flex;
        align-items: center;
        gap: 5px;
      }
      .kt-fresh-card {
        background: rgba(255, 255, 255, 0.98);
        border: 2px solid #059669;
        border-radius: 10px;
        padding: 8px 12px;
        width: 48%;
        box-shadow: 0 8px 28px rgba(5, 150, 105, 0.18);
        backdrop-filter: blur(12px);
      }
      .kt-fresh-item {
        font-size: 9.5px;
        font-weight: 700;
        color: #065f46;
        margin-top: 3px;
        display: flex;
        align-items: center;
        gap: 5px;
      }
      .kt-fresh-badge-live {
        background: #10b981;
        color: #ffffff;
        font-size: 9.5px;
        font-weight: 800;
        border-radius: 5px;
        padding: 4px 8px;
        margin-top: 5px;
        text-align: center;
        box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
      }

      /* ── Beat 10 & 11: Grand Horizontal Glass Ribbon (72.34s - 79.44s) ── */
      .kt-grand-ribbon-stage {
        position: absolute;
        top: 23.5%;
        left: 50%;
        transform: translateX(-50%);
        width: 92%;
        max-width: 680px;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 6px;
        z-index: 12;
        opacity: 0;
        pointer-events: none;
      }
      .kt-grand-ribbon {
        background: rgba(255, 255, 255, 0.97);
        border: 1.5px solid rgba(99, 102, 241, 0.35);
        border-radius: 999px;
        padding: 5px 14px;
        box-shadow: 0 8px 28px rgba(99, 102, 241, 0.14);
        backdrop-filter: blur(14px);
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 8px;
        width: 100%;
        max-width: 580px;
        box-sizing: border-box;
      }
      .kt-ribbon-item {
        display: flex;
        align-items: center;
        gap: 6px;
        padding: 3px 6px;
        border-radius: 6px;
      }
      .kt-ribbon-icon {
        font-size: 15px;
        line-height: 1;
      }
      .kt-ribbon-info {
        display: flex;
        flex-direction: column;
      }
      .kt-ribbon-kicker {
        font-size: 8px;
        font-weight: 800;
        letter-spacing: 0.4px;
        color: #64748b;
        text-transform: uppercase;
        line-height: 1.1;
      }
      .kt-ribbon-title {
        font-size: 10px;
        font-weight: 800;
        color: #0f172a;
        white-space: nowrap;
        line-height: 1.2;
      }
      .kt-ribbon-op {
        font-size: 16px;
        font-weight: 900;
        color: #6366f1;
        line-height: 1;
      }
      .kt-ribbon-arrow {
        font-size: 14px;
        font-weight: 900;
        color: #10b981;
        line-height: 1;
      }
      .kt-grand-live-badge {
        background: rgba(255, 255, 255, 0.98);
        border: 1.5px solid #10b981;
        border-radius: 999px;
        padding: 4px 14px;
        box-shadow: 0 4px 16px rgba(16, 185, 129, 0.2);
        backdrop-filter: blur(12px);
        display: inline-flex;
        align-items: center;
        gap: 6px;
        font-size: 9px;
        opacity: 0;
        transform: translateY(4px);
      }
      .kt-live-glow-dot {
        width: 6px;
        height: 6px;
        border-radius: 50%;
        background: #10b981;
        box-shadow: 0 0 8px #10b981;
        display: inline-block;
      }

      @media (max-width: 768px) {
        .kt-rag-simplest-stage,
        .kt-no-retrain-stage {
          top: 23%;
          flex-direction: column;
          gap: 5px;
        }
        .kt-kb-card, .kt-relevant-card,
        .kt-no-train-card, .kt-fresh-card {
          width: 95%;
          padding: 5px 8px;
        }
        .kt-grand-ribbon-stage {
          top: 22.5%;
          scale: 0.92;
        }
        .kt-grand-ribbon {
          flex-direction: column;
          border-radius: 12px;
          gap: 5px;
          padding: 6px 10px;
        }
      }
    `;
    document.head.appendChild(style);
  }

  /* ══════════════════════════════════════════════════════
     Mount & Wire GSAP Tweens on Master Timeline
  ══════════════════════════════════════════════════════ */
  function mountSlide01KineticOverlay(container, masterTimeline) {
    if (!container || !masterTimeline) return;
    injectKineticStyles();

    // Create host layer
    container.innerHTML = `
      <div class="rag-kinetic-container" id="ragKineticContainer">
        <!-- Beat 1: 4 LLM Logos Popping from Center of Black Box -->
        <!-- Left 2 logos -->
        <div id="ktLogoChatgpt" class="kt-llm-logo-card kt-logo-chatgpt" title="ChatGPT / OpenAI">
          <div class="kt-logo-icon-wrap">
            <img src="/Version-3/rag-content/assets/logos/logo_chatgpt.png" alt="ChatGPT" class="kt-logo-img" />
          </div>
          <span class="kt-logo-tag">ChatGPT</span>
        </div>
        <div id="ktLogoClaude" class="kt-llm-logo-card kt-logo-claude" title="Claude / Anthropic">
          <div class="kt-logo-icon-wrap">
            <img src="/Version-3/rag-content/assets/logos/logo_claude.png" alt="Claude" class="kt-logo-img" />
          </div>
          <span class="kt-logo-tag">Claude</span>
        </div>

        <!-- Right 2 logos -->
        <div id="ktLogoGemini" class="kt-llm-logo-card kt-logo-gemini" title="Gemini / Google">
          <div class="kt-logo-icon-wrap">
            <img src="/Version-3/rag-content/assets/logos/logo_gemini.png" alt="Gemini" class="kt-logo-img" />
          </div>
          <span class="kt-logo-tag">Gemini</span>
        </div>
        <div id="ktLogoGrok" class="kt-llm-logo-card kt-logo-grok" title="Grok / xAI">
          <div class="kt-logo-icon-wrap">
            <img src="/Version-3/rag-content/assets/logos/logo_grok.png" alt="Grok" class="kt-logo-img" />
          </div>
          <span class="kt-logo-tag">Grok</span>
        </div>

        <!-- Beat 2 & 3: Not a Database & Probabilistic Next-Word Predictor Boxes -->
        <div id="ktBoxNotDb" class="kt-concept-card kt-card-not-db" title="LLM is not a database">
          <div class="kt-concept-icon-wrap not-db-icon">
            <span>🔒</span>
          </div>
          <div class="kt-concept-body">
            <div class="kt-concept-title">LLM is not a database</div>
            <div class="kt-concept-sub">Zero table storage · No factual rows</div>
          </div>
        </div>

        <div id="ktBoxPredictor" class="kt-concept-card kt-card-predictor" title="Probabilistic Next-Word Predictor">
          <div class="kt-concept-icon-wrap predictor-icon">
            <span>🎲</span>
          </div>
          <div class="kt-concept-body">
            <div class="kt-concept-title">probabilistic next-word predictor</div>
            <div class="kt-concept-sub">Predicts likely tokens · Statistical sampling</div>
          </div>
        </div>

        <!-- Beat 3: 12 Information Provider Gadget Icons (Orbital Blast) -->
        <div id="ktGadget1" class="kt-gadget-icon" title="Internet">
          <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9" fill="none" stroke="#2563eb" stroke-width="2"/><ellipse cx="12" cy="12" rx="4" ry="9" fill="none" stroke="#2563eb" stroke-width="1.8"/><path d="M3.5 9h17M3.5 15h17" stroke="#2563eb" stroke-width="1.8"/></svg>
        </div>
        <div id="ktGadget2" class="kt-gadget-icon" title="Cloud Storage">
          <svg viewBox="0 0 24 24"><path d="M6 19a5 5 0 0 1-1-9.9A7 7 0 0 1 18.5 8 5.5 5.5 0 0 1 19 19H6z" fill="#2563eb"/></svg>
        </div>
        <div id="ktGadget3" class="kt-gadget-icon" title="Laptop">
          <svg viewBox="0 0 24 24"><rect x="4" y="5" width="16" height="11" rx="1.5" fill="none" stroke="#2563eb" stroke-width="2"/><path d="M2 19h20c0-1.2-1-2-2.5-2h-15C3 17 2 17.8 2 19z" fill="#2563eb"/></svg>
        </div>
        <div id="ktGadget4" class="kt-gadget-icon" title="Database Server">
          <svg viewBox="0 0 24 24"><rect x="4" y="3" width="16" height="5" rx="1.5" fill="none" stroke="#2563eb" stroke-width="2"/><circle cx="7" cy="5.5" r="1" fill="#2563eb"/><rect x="4" y="10" width="16" height="5" rx="1.5" fill="none" stroke="#2563eb" stroke-width="2"/><circle cx="7" cy="12.5" r="1" fill="#2563eb"/><rect x="4" y="17" width="16" height="5" rx="1.5" fill="none" stroke="#2563eb" stroke-width="2"/><circle cx="7" cy="19.5" r="1" fill="#2563eb"/></svg>
        </div>
        <div id="ktGadget5" class="kt-gadget-icon" title="Smartphone">
          <svg viewBox="0 0 24 24"><rect x="6" y="2" width="12" height="20" rx="3" fill="none" stroke="#2563eb" stroke-width="2"/><circle cx="12" cy="18" r="1" fill="#2563eb"/><line x1="10" y1="5" x2="14" y2="5" stroke="#2563eb" stroke-width="2" stroke-linecap="round"/></svg>
        </div>
        <div id="ktGadget6" class="kt-gadget-icon" title="WiFi Connection">
          <svg viewBox="0 0 24 24"><circle cx="12" cy="18.5" r="1.5" fill="#2563eb"/><path d="M8.5 15a5 5 0 0 1 7 0" fill="none" stroke="#2563eb" stroke-width="2" stroke-linecap="round"/><path d="M5.5 12a9 9 0 0 1 13 0" fill="none" stroke="#2563eb" stroke-width="2" stroke-linecap="round"/><path d="M2.5 9a13.5 13.5 0 0 1 19 0" fill="none" stroke="#2563eb" stroke-width="2" stroke-linecap="round"/></svg>
        </div>
        <div id="ktGadget7" class="kt-gadget-icon" title="Radio Antenna">
          <svg viewBox="0 0 24 24"><circle cx="12" cy="5" r="2" fill="#2563eb"/><path d="M12 7v14M8 21l4-14 4 14M9 16h6M7 12a7 7 0 0 1 10 0" fill="none" stroke="#2563eb" stroke-width="2" stroke-linecap="round"/></svg>
        </div>
        <div id="ktGadget8" class="kt-gadget-icon" title="Network Router">
          <svg viewBox="0 0 24 24"><rect x="3" y="13" width="18" height="7" rx="2" fill="none" stroke="#2563eb" stroke-width="2"/><line x1="6" y1="13" x2="6" y2="5" stroke="#2563eb" stroke-width="2" stroke-linecap="round"/><line x1="18" y1="13" x2="18" y2="5" stroke="#2563eb" stroke-width="2" stroke-linecap="round"/><circle cx="7" cy="16.5" r="1" fill="#2563eb"/><circle cx="11" cy="16.5" r="1" fill="#2563eb"/><circle cx="15" cy="16.5" r="1" fill="#2563eb"/></svg>
        </div>
        <div id="ktGadget9" class="kt-gadget-icon" title="Tablet">
          <svg viewBox="0 0 24 24"><rect x="4" y="3" width="16" height="18" rx="2.5" fill="none" stroke="#2563eb" stroke-width="2"/><circle cx="12" cy="18" r="1" fill="#2563eb"/><line x1="9" y1="6" x2="15" y2="6" stroke="#2563eb" stroke-width="1.5" stroke-linecap="round"/></svg>
        </div>
        <div id="ktGadget10" class="kt-gadget-icon" title="Telephone Handset">
          <svg viewBox="0 0 24 24"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z" fill="#2563eb"/></svg>
        </div>
        <div id="ktGadget11" class="kt-gadget-icon" title="Email">
          <svg viewBox="0 0 24 24"><rect x="3" y="5" width="18" height="14" rx="2" fill="none" stroke="#2563eb" stroke-width="2"/><path d="M3 7l9 6 9-6" fill="none" stroke="#2563eb" stroke-width="2" stroke-linecap="round"/></svg>
        </div>
        <div id="ktGadget12" class="kt-gadget-icon" title="Desktop Workstation">
          <svg viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="12" rx="2" fill="none" stroke="#2563eb" stroke-width="2"/><path d="M12 15v4M8 19h8" stroke="#2563eb" stroke-width="2" stroke-linecap="round"/></svg>
        </div>


        <!-- Beat 5: 3 Problem Cards (Sliding from Left at 36.58s for "three real problems") -->
        <div id="ktProblemCardsList" class="kt-problem-cards-list">
          <div id="ktProbCard1" class="kt-problem-card">
            <div class="kt-prob-badge">1</div>
            <div class="kt-prob-info">
              <div class="kt-prob-title">Stuck in Time</div>
              <div class="kt-prob-desc">Cutoff horizon · Just guessing</div>
            </div>
            <div class="kt-prob-icon">⏳</div>
          </div>
          <div id="ktProbCard2" class="kt-problem-card">
            <div class="kt-prob-badge">2</div>
            <div class="kt-prob-info">
              <div class="kt-prob-title">Never Seen Your Files</div>
              <div class="kt-prob-desc">Private data never in room</div>
            </div>
            <div class="kt-prob-icon">🔒</div>
          </div>
          <div id="ktProbCard3" class="kt-problem-card">
            <div class="kt-prob-badge">3</div>
            <div class="kt-prob-info">
              <div class="kt-prob-title">The Dangerous One</div>
              <div class="kt-prob-desc">Confident hallucination</div>
            </div>
            <div class="kt-prob-icon">🚨</div>
          </div>
        </div>

        <!-- Beat 6: Locked Files (Right Flank, Generic File Names, High Contrast) -->
        <div id="ktLockedFiles" class="kt-locked-files-box">
          <div id="ktFilePill1" class="kt-file-pill">
            <span>📄</span>
            <span class="kt-file-name">Product_Roadmap_2025.pdf</span>
            <span class="kt-pill-lock">🔒</span>
          </div>
          <div id="ktFilePill2" class="kt-file-pill">
            <span>📊</span>
            <span class="kt-file-name">Annual_Financial_Report.xlsx</span>
            <span class="kt-pill-lock">🔒</span>
          </div>
          <div id="ktFilePill3" class="kt-file-pill">
            <span>🗄️</span>
            <span class="kt-file-name">Production_Database.sql</span>
            <span class="kt-pill-lock">🔒</span>
          </div>
          <div id="ktLockedWarn" class="kt-locked-files-warn">
            ⚠️ NEVER INTRODUCED TO ROOM
          </div>
        </div>

        <!-- Beat 7: Hallucination 4-Step Progressive Stage (Right Flank) -->
        <div id="ktHallucinationStage" class="kt-hallucination-stage">
          <!-- a. The Dangerous One -->
          <div id="ktVisDangerous" class="kt-h-step kt-h-dangerous">
            <div class="kt-h-icon">🚨</div>
            <div class="kt-h-body">
              <div class="kt-h-title">THE DANGEROUS ONE</div>
              <div class="kt-h-sub">Zero self-awareness · Silent risk</div>
            </div>
          </div>

          <!-- b. They Want to be Helpful -->
          <div id="ktVisHelpful" class="kt-h-step kt-h-helpful">
            <div class="kt-h-icon">🤖</div>
            <div class="kt-h-body">
              <div class="kt-h-title">Eager Persona: Always Helpful</div>
              <div class="kt-h-speech">"Of course! Here is your answer..."</div>
            </div>
          </div>

          <!-- c. When they don't know something, they won't admit it -->
          <div id="ktVisNoAdmit" class="kt-h-step kt-h-noadmit">
            <div class="kt-h-icon">🙈</div>
            <div class="kt-h-body">
              <div class="kt-h-title">Admission of Ignorance: REFUSED</div>
              <div class="kt-h-sub">Never says <em>"I don't know"</em></div>
            </div>
          </div>

          <!-- d. That's Hallucination (Dual Gauge Tachometer) -->
          <div id="ktVisHallucination" class="kt-h-step kt-h-gauge">
            <div class="kt-gauge-header">
              <span>🚨 CONFIDENT FABRICATION</span>
            </div>
            <div class="kt-gauge-row">
              <div class="kt-gauge-col">
                <div class="kt-gauge-val" style="color: #059669;">99.8%</div>
                <div class="kt-gauge-label" style="color: #059669;">CONFIDENCE</div>
              </div>
              <div class="kt-gauge-vs">VS</div>
              <div class="kt-gauge-col">
                <div class="kt-gauge-val" style="color: #dc2626;">0.0%</div>
                <div class="kt-gauge-label" style="color: #dc2626;">GROUND TRUTH</div>
              </div>
            </div>
            <div class="kt-gauge-footer">
              Fabricating answers that sound right = <strong>Hallucination</strong>
            </div>
          </div>
        </div>

        <!-- Beat 8: RAG The Simplest Solution Stage (58.80s - 65.22s) -->
        <div id="ktRagSimplestStage" class="kt-rag-simplest-stage">
          <div class="kt-kb-card">
            <div class="kt-stage-badge kt-badge-cyan">📚 Knowledge Base</div>
            <div id="ktChunk1" class="kt-chunk-item">
              <span>📄</span>
              <span>Doc Chunk #01: PTO Accrual Rules</span>
            </div>
            <div id="ktChunk2" class="kt-chunk-item">
              <span>📄</span>
              <span>Doc Chunk #02: Wellness Subsidy Cap</span>
            </div>
            <div id="ktChunk3" class="kt-chunk-item">
              <span>📄</span>
              <span>Doc Chunk #03: Remote Setup Stipend</span>
            </div>
          </div>
          <div class="kt-arrow-flow">
            <div class="kt-arrow-pill">Retrieve relevant chunks ➔</div>
            <span style="font-size: 10px; color: #0284c7; font-weight: 700;">Zero Model Re-Training</span>
          </div>
          <div class="kt-relevant-card">
            <div class="kt-stage-badge kt-badge-emerald">⚡ Relevant Context</div>
            <div id="ktCheck1" class="kt-check-row">
              <span>✅</span>
              <span><strong>Small chunks</strong> (Isolated passages, not 200 pages)</span>
            </div>
            <div id="ktCheck2" class="kt-check-row">
              <span>✅</span>
              <span><strong>Only what's needed</strong> (Zero irrelevant noise tokens)</span>
            </div>
            <div id="ktCheck3" class="kt-check-row">
              <span>✅</span>
              <span><strong>Right before answer</strong> (Just-in-time injection)</span>
            </div>
          </div>
        </div>

        <!-- Beat 9: No Re-Training Stage (65.22s - 72.34s) -->
        <div id="ktNoRetrainStage" class="kt-no-retrain-stage">
          <div class="kt-no-train-card">
            <div class="kt-stage-badge kt-badge-red">🚫 Model Re-Training</div>
            <div class="kt-strike-item">
              <span>❌</span>
              <span>Weeks on GPU compute clusters</span>
            </div>
            <div class="kt-strike-item">
              <span>❌</span>
              <span>Millions of dollars parameter tuning</span>
            </div>
            <div class="kt-strike-item">
              <span>❌</span>
              <span>Obsolete the moment facts change</span>
            </div>
            <div style="margin-top: 8px;">
              <span class="kt-stage-badge kt-badge-red" style="font-size: 9.5px;">No training required</span>
            </div>
          </div>
          <div class="kt-arrow-flow">
            <div class="kt-arrow-pill" style="border-color: #059669; color: #059669; padding: 5px 12px;">⚡ Just-In-Time Hand-Off ➔</div>
            <div class="kt-stage-badge kt-badge-emerald" style="margin-top: 3px; font-size: 9.5px;">Verified Citations</div>
          </div>
          <div class="kt-fresh-card">
            <div class="kt-stage-badge kt-badge-emerald">📑 Fresh, Verified Reference Page</div>
            <div class="kt-fresh-item">
              <span>✓</span>
              <span><strong>100% Ground Truth:</strong> Acme_HR_Policy_2025.pdf</span>
            </div>
            <div class="kt-fresh-item">
              <span>✓</span>
              <span><strong>Section 4.2:</strong> Verified citation page with exact match</span>
            </div>
            <div id="ktLiveBadge" class="kt-fresh-badge-live">
              ⏱️ Handed at the exact moment of query
            </div>
          </div>
        </div>

        <!-- Beat 10 & 11: Grand Horizontal Glass Ribbon (72.34s - 79.44s) -->
        <div id="ktGrandRibbonStage" class="kt-grand-ribbon-stage">
          <div class="kt-grand-ribbon">
            <div id="ktRibbonParam" class="kt-ribbon-item kt-ribbon-param">
              <span class="kt-ribbon-icon">🧠</span>
              <div class="kt-ribbon-info">
                <div class="kt-ribbon-kicker">PARAMETRIC KNOWLEDGE</div>
                <div class="kt-ribbon-title">Frozen Model Weights</div>
              </div>
            </div>
            <div id="ktRibbonOp" class="kt-ribbon-op">+</div>
            <div id="ktRibbonNonParam" class="kt-ribbon-item kt-ribbon-nonparam">
              <span class="kt-ribbon-icon">📁</span>
              <div class="kt-ribbon-info">
                <div class="kt-ribbon-kicker" style="color: #059669;">NON-PARAMETRIC MEMORY</div>
                <div class="kt-ribbon-title" style="color: #047857;">Live External Verified Docs</div>
              </div>
            </div>
            <div id="ktRibbonArrow" class="kt-ribbon-arrow">➔</div>
            <div id="ktRibbonResult" class="kt-ribbon-item kt-ribbon-result">
              <span class="kt-ribbon-icon">🎯</span>
              <div class="kt-ribbon-info">
                <div class="kt-ribbon-kicker" style="color: #4338ca;">GROUNDED GENERATION</div>
                <div class="kt-ribbon-title" style="color: #3730a3;">100% Fact-Checked Answer</div>
              </div>
            </div>
          </div>
          <div id="ktGrandLiveBadge" class="kt-grand-live-badge">
            <span class="kt-live-glow-dot"></span>
            <span style="font-weight: 800; color: #065f46;">DELIVERED AT INFERENCE TIME</span>
            <span style="color: #94a3b8;">·</span>
            <span style="font-weight: 700; color: #047857;">Zero Hallucination</span>
            <span style="color: #94a3b8;">·</span>
            <span style="font-weight: 700; color: #0369a1;">Real-Time Citations</span>
          </div>
        </div>
      </div>
    `;

    const G = root.gsap;
    if (!G) return;

    // Elements
    const logoChatgpt = document.getElementById('ktLogoChatgpt');
    const logoClaude  = document.getElementById('ktLogoClaude');
    const logoGemini  = document.getElementById('ktLogoGemini');
    const logoGrok    = document.getElementById('ktLogoGrok');
    const boxNotDb    = document.getElementById('ktBoxNotDb');
    const boxPredictor = document.getElementById('ktBoxPredictor');
    const ktGadgets   = Array.from({ length: 12 }, (_, i) => document.getElementById('ktGadget' + (i + 1)));
    const probCardsList = document.getElementById('ktProblemCardsList');
    const probCard1     = document.getElementById('ktProbCard1');
    const probCard2     = document.getElementById('ktProbCard2');
    const probCard3     = document.getElementById('ktProbCard3');
    const lockedFiles   = document.getElementById('ktLockedFiles');
    const hallucinationStage = document.getElementById('ktHallucinationStage');
    const visDangerous  = document.getElementById('ktVisDangerous');
    const visHelpful    = document.getElementById('ktVisHelpful');
    const visNoAdmit    = document.getElementById('ktVisNoAdmit');
    const visHallucination = document.getElementById('ktVisHallucination');
    const ragSimplestStage = document.getElementById('ktRagSimplestStage');
    const chunk1        = document.getElementById('ktChunk1');
    const chunk2        = document.getElementById('ktChunk2');
    const chunk3        = document.getElementById('ktChunk3');
    const check1        = document.getElementById('ktCheck1');
    const check2        = document.getElementById('ktCheck2');
    const check3        = document.getElementById('ktCheck3');
    const noRetrainStage = document.getElementById('ktNoRetrainStage');
    const liveBadge     = document.getElementById('ktLiveBadge');
    const grandRibbonStage = document.getElementById('ktGrandRibbonStage');
    const ribbonParam   = document.getElementById('ktRibbonParam');
    const ribbonOp      = document.getElementById('ktRibbonOp');
    const ribbonNonParam = document.getElementById('ktRibbonNonParam');
    const ribbonArrow   = document.getElementById('ktRibbonArrow');
    const ribbonResult  = document.getElementById('ktRibbonResult');
    const grandLiveBadge = document.getElementById('ktGrandLiveBadge');

    // Reset initial states at t=0
    masterTimeline.set([
      boxNotDb, boxPredictor,
      probCardsList, probCard1, probCard2, probCard3,
      lockedFiles, hallucinationStage,
      visDangerous, visHelpful, visNoAdmit, visHallucination,
      ragSimplestStage, noRetrainStage, grandRibbonStage, grandLiveBadge
    ], { opacity: 0 }, 0.0);

    masterTimeline.set([logoChatgpt, logoClaude, logoGemini, logoGrok, boxNotDb, boxPredictor, ...ktGadgets], {
      opacity: 0,
      scale: 0,
      left: '50%',
      top: '52%',
      xPercent: -50,
      yPercent: -50
    }, 0.0);

    /* ── BEAT 2 (3.14s -> 8.66s): 4 LLM Logos Popping Out from Center of Black Box ── */
    // Narration cue at ~4.1s: "how Large Language Models actually think"
    // 2 logos burst to the left (ChatGPT, Claude), 2 logos burst to the right (Gemini, Grok)
    // STAY VISIBLE throughout Beat 3 until 13.8s!
    if (logoChatgpt) {
      masterTimeline.fromTo(logoChatgpt,
        { opacity: 0, scale: 0, left: '50%', top: '50%', xPercent: -50, yPercent: -50 },
        { opacity: 1, scale: 1, left: '16%', top: '36%', xPercent: -50, yPercent: -50, duration: 0.7, ease: 'back.out(1.7)' },
        4.1
      );
      masterTimeline.to(logoChatgpt, { y: '-=5', duration: 1.5, yoyo: true, repeat: 5, ease: 'sine.inOut' }, 4.9);
      masterTimeline.to(logoChatgpt, { opacity: 0, scale: 0.5, duration: 0.35, ease: 'power2.in' }, 13.8);
    }
    if (logoClaude) {
      masterTimeline.fromTo(logoClaude,
        { opacity: 0, scale: 0, left: '50%', top: '50%', xPercent: -50, yPercent: -50 },
        { opacity: 1, scale: 1, left: '16%', top: '53%', xPercent: -50, yPercent: -50, duration: 0.7, ease: 'back.out(1.7)' },
        4.3
      );
      masterTimeline.to(logoClaude, { y: '+=5', duration: 1.5, yoyo: true, repeat: 5, ease: 'sine.inOut' }, 5.1);
      masterTimeline.to(logoClaude, { opacity: 0, scale: 0.5, duration: 0.35, ease: 'power2.in' }, 13.8);
    }
    if (logoGemini) {
      masterTimeline.fromTo(logoGemini,
        { opacity: 0, scale: 0, left: '50%', top: '50%', xPercent: -50, yPercent: -50 },
        { opacity: 1, scale: 1, left: '84%', top: '36%', xPercent: -50, yPercent: -50, duration: 0.7, ease: 'back.out(1.7)' },
        4.5
      );
      masterTimeline.to(logoGemini, { y: '-=5', duration: 1.5, yoyo: true, repeat: 5, ease: 'sine.inOut' }, 5.3);
      masterTimeline.to(logoGemini, { opacity: 0, scale: 0.5, duration: 0.35, ease: 'power2.in' }, 13.8);
    }
    if (logoGrok) {
      masterTimeline.fromTo(logoGrok,
        { opacity: 0, scale: 0, left: '50%', top: '50%', xPercent: -50, yPercent: -50 },
        { opacity: 1, scale: 1, left: '84%', top: '53%', xPercent: -50, yPercent: -50, duration: 0.7, ease: 'back.out(1.7)' },
        4.7
      );
      masterTimeline.to(logoGrok, { y: '+=5', duration: 1.5, yoyo: true, repeat: 5, ease: 'sine.inOut' }, 5.5);
      masterTimeline.to(logoGrok, { opacity: 0, scale: 0.5, duration: 0.35, ease: 'power2.in' }, 13.8);
    }

    /* ── BEAT 3 (9.2s -> 14.0s): Concept Boxes: Not a Database & Probabilistic Predictor ── */
    // Narration cue at ~9.2s: "An LLM is not a database."
    // Symmetrically placed on the left flank under the logos, safely clear of screen margin & central cube
    if (boxNotDb) {
      masterTimeline.fromTo(boxNotDb,
        { opacity: 0, scale: 0, left: '50%', top: '50%', xPercent: -50, yPercent: -50 },
        { opacity: 1, scale: 1, left: '18%', top: '71%', xPercent: -50, yPercent: -50, duration: 0.7, ease: 'back.out(1.7)' },
        9.2
      );
      masterTimeline.to(boxNotDb, { y: '-=4', duration: 1.4, yoyo: true, repeat: 2, ease: 'sine.inOut' }, 10.0);
      masterTimeline.to(boxNotDb, { opacity: 0, scale: 0.6, duration: 0.35, ease: 'power2.in' }, 13.8);
    }

    // Narration cue at ~11.5s: "It's a probabilistic next-word predictor."
    // Symmetrically placed on the right flank under the logos, safely clear of screen margin & central cube
    if (boxPredictor) {
      masterTimeline.fromTo(boxPredictor,
        { opacity: 0, scale: 0, left: '50%', top: '50%', xPercent: -50, yPercent: -50 },
        { opacity: 1, scale: 1, left: '82%', top: '71%', xPercent: -50, yPercent: -50, duration: 0.7, ease: 'back.out(1.7)' },
        11.5
      );
      masterTimeline.to(boxPredictor, { y: '-=4', duration: 1.4, yoyo: true, repeat: 1, ease: 'sine.inOut' }, 12.3);
      masterTimeline.to(boxPredictor, { opacity: 0, scale: 0.6, duration: 0.35, ease: 'power2.in' }, 13.8);
    }

    /* ── BEAT 3.2 (20.02s -> 22.16s): 12 Information Provider Gadget Icons Pop Up Blasted at a Time ── */
    // User cue: "— no access to the outside world, Animation: generate informations provider icons as shown in the 2nd image atleast 10 icons should be there and neatly position all the icons around the closed room in the image and these icons should pop up blasted at a time from the center of the image this should happen during this narration."
    const gadgetCoords = [
      { left: '50%', top: '18%' }, // 1. Internet
      { left: '68%', top: '23%' }, // 2. Cloud
      { left: '82%', top: '36%' }, // 3. Laptop
      { left: '88%', top: '52%' }, // 4. Server
      { left: '82%', top: '68%' }, // 5. Smartphone
      { left: '68%', top: '81%' }, // 6. WiFi
      { left: '50%', top: '86%' }, // 7. Radio Antenna
      { left: '32%', top: '81%' }, // 8. Router
      { left: '18%', top: '68%' }, // 9. Tablet
      { left: '12%', top: '52%' }, // 10. Phone Handset
      { left: '18%', top: '36%' }, // 11. Email
      { left: '32%', top: '23%' }  // 12. Desktop Workstation
    ];

    ktGadgets.forEach((g, idx) => {
      if (g) {
        // Blasted out at once from center of closed room at 20.02s
        masterTimeline.fromTo(g,
          { opacity: 0, scale: 0, left: '50%', top: '52%', xPercent: -50, yPercent: -50 },
          { opacity: 1, scale: 1, left: gadgetCoords[idx].left, top: gadgetCoords[idx].top, xPercent: -50, yPercent: -50, duration: 0.65, ease: 'back.out(2.2)' },
          20.02
        );
        masterTimeline.to(g, { y: (idx % 2 === 0 ? '-=4' : '+=4'), duration: 0.7, yoyo: true, repeat: 1, ease: 'sine.inOut' }, 20.67);
        // User cue: "they have complete knowledge on there trained data... smoothly change the image to the image shown in the 3rd image by remove all the icons"
        masterTimeline.to(g, { opacity: 0, scale: 0.2, duration: 0.45, ease: 'power2.in' }, 22.16);
      }
    });


    /* ── BEAT 3.4 (27.86s -> 29.3s): Narration: "That's a Large Language Model." ── */
    // User cue: "Animation: zoom in and zoom out the heading for this narration."
    masterTimeline.to('#sr-title_blackbox', { scale: 1.25, duration: 0.6, ease: 'power2.out' }, 27.86);
    masterTimeline.to('#sr-title_blackbox', { scale: 1.0, duration: 0.65, ease: 'power2.inOut' }, 28.5);

    /* ── BEAT 5.1 (35.46s -> 38.52s): "This locked room creates three real problems." ── */
    // Smooth, neat, premium cascade entrance: gentle slide from left with power3.out easing
    if (probCardsList && probCard1 && probCard2 && probCard3) {
      masterTimeline.set(probCardsList, { display: 'flex', opacity: 1 }, 35.7);
      masterTimeline.fromTo([probCard1, probCard2, probCard3],
        { opacity: 0, x: -36, scale: 0.96 },
        { opacity: 0.95, x: 0, scale: 1.0, stagger: 0.14, duration: 0.65, ease: 'power3.out' },
        35.7
      );

      /* ── BEAT 5.2 (38.52s -> 43.14s): Flaw 1: "First: they're stuck in time. Ask about anything new, and they're just guessing." ── */
      // Card 1 smooth spotlight lift
      masterTimeline.to(probCard1, {
        opacity: 1,
        scale: 1.03,
        borderColor: '#3b82f6',
        backgroundColor: '#ffffff',
        boxShadow: '0 8px 24px rgba(59, 130, 246, 0.25), 0 0 0 2px rgba(59, 130, 246, 0.3)',
        duration: 0.45,
        ease: 'power2.out'
      }, 38.52);

      const badge1 = probCard1.querySelector('.kt-prob-badge');
      if (badge1) {
        masterTimeline.to(badge1, {
          backgroundColor: '#eff6ff',
          color: '#2563eb',
          duration: 0.45,
          ease: 'power2.out'
        }, 38.52);
      }

      // Cards 2 & 3 gently soften in background
      masterTimeline.to([probCard2, probCard3], {
        opacity: 0.48,
        scale: 0.98,
        duration: 0.45,
        ease: 'power2.out'
      }, 38.52);

      const icon1 = probCard1.querySelector('.kt-prob-icon');
      if (icon1) {
        masterTimeline.to(icon1, { rotation: 180, duration: 0.6, ease: 'power2.inOut' }, 38.6);
      }

      /* ── BEAT 6 (43.14s -> 48.56s): Flaw 2: "Second: they've never seen your files. Your company's private documents were never in that room." ── */
      masterTimeline.to(probCard1, {
        opacity: 0.48,
        scale: 0.98,
        borderColor: 'rgba(226, 232, 240, 0.9)',
        backgroundColor: 'rgba(255, 255, 255, 0.94)',
        boxShadow: '0 4px 16px rgba(15, 23, 42, 0.07)',
        duration: 0.4,
        ease: 'power2.out'
      }, 43.14);
      if (badge1) {
        masterTimeline.to(badge1, {
          backgroundColor: '#f1f5f9',
          color: '#475569',
          duration: 0.4,
          ease: 'power2.out'
        }, 43.14);
      }

      // Card 2 smooth spotlight lift
      masterTimeline.to(probCard2, {
        opacity: 1,
        scale: 1.03,
        borderColor: '#f59e0b',
        backgroundColor: '#ffffff',
        boxShadow: '0 8px 24px rgba(245, 158, 11, 0.25), 0 0 0 2px rgba(245, 158, 11, 0.3)',
        duration: 0.45,
        ease: 'power2.out'
      }, 43.14);
      const badge2 = probCard2.querySelector('.kt-prob-badge');
      if (badge2) {
        masterTimeline.to(badge2, {
          backgroundColor: '#fffbeb',
          color: '#d97706',
          duration: 0.45,
          ease: 'power2.out'
        }, 43.14);
      }

      const lockIcon2 = probCard2.querySelector('.kt-prob-icon');
      if (lockIcon2) {
        masterTimeline.to(lockIcon2, { rotation: -16, duration: 0.08, yoyo: true, repeat: 4, ease: 'sine.inOut' }, 43.25);
      }

      // ── Bespoke Staggered Flying Files Animation (Right Flank) ──
      const filePill1 = document.getElementById('ktFilePill1');
      const filePill2 = document.getElementById('ktFilePill2');
      const filePill3 = document.getElementById('ktFilePill3');
      const lockedWarn = document.getElementById('ktLockedWarn');

      if (lockedFiles) {
        masterTimeline.fromTo(lockedFiles,
          { opacity: 0, scale: 0.94 },
          { opacity: 1, scale: 1.0, duration: 0.35, ease: 'power2.out' },
          43.14
        );

        if (filePill1) {
          masterTimeline.fromTo(filePill1,
            { opacity: 0, x: 60, scale: 0.9 },
            { opacity: 1, x: 0, scale: 1.0, duration: 0.4, ease: 'power2.out' },
            43.18
          );
        }
        if (filePill2) {
          masterTimeline.fromTo(filePill2,
            { opacity: 0, x: 60, scale: 0.9 },
            { opacity: 1, x: 0, scale: 1.0, duration: 0.4, ease: 'power2.out' },
            43.32
          );
        }
        if (filePill3) {
          masterTimeline.fromTo(filePill3,
            { opacity: 0, x: 60, scale: 0.9 },
            { opacity: 1, x: 0, scale: 1.0, duration: 0.4, ease: 'power2.out' },
            43.46
          );
        }
        if (lockedWarn) {
          masterTimeline.fromTo(lockedWarn,
            { opacity: 0, scale: 0.85 },
            { opacity: 1, scale: 1.0, duration: 0.35, ease: 'power2.out' },
            43.62
          );
        }

        masterTimeline.to(lockedFiles, { opacity: 0, x: 30, duration: 0.35, ease: 'power2.in' }, 48.56);
      }

      /* ── BEAT 7 (48.56s -> 58.8s): Flaw 3: "And third — the dangerous one. They want to be helpful." ── */
      masterTimeline.to(probCard2, {
        opacity: 0.48,
        scale: 0.98,
        borderColor: 'rgba(226, 232, 240, 0.9)',
        backgroundColor: 'rgba(255, 255, 255, 0.94)',
        boxShadow: '0 4px 16px rgba(15, 23, 42, 0.07)',
        duration: 0.4,
        ease: 'power2.out'
      }, 48.56);
      if (badge2) {
        masterTimeline.to(badge2, {
          backgroundColor: '#f1f5f9',
          color: '#475569',
          duration: 0.4,
          ease: 'power2.out'
        }, 48.56);
      }

      // Card 3 smooth spotlight lift
      masterTimeline.to(probCard3, {
        opacity: 1,
        scale: 1.03,
        borderColor: '#ef4444',
        backgroundColor: '#ffffff',
        boxShadow: '0 8px 24px rgba(239, 68, 68, 0.28), 0 0 0 2px rgba(239, 68, 68, 0.3)',
        duration: 0.45,
        ease: 'power2.out'
      }, 48.56);
      const badge3 = probCard3.querySelector('.kt-prob-badge');
      if (badge3) {
        masterTimeline.to(badge3, {
          backgroundColor: '#fef2f2',
          color: '#dc2626',
          duration: 0.45,
          ease: 'power2.out'
        }, 48.56);
      }

      const sirenIcon3 = probCard3.querySelector('.kt-prob-icon');
      if (sirenIcon3) {
        masterTimeline.to(sirenIcon3, { rotation: -14, duration: 0.09, yoyo: true, repeat: 5, ease: 'sine.inOut' }, 48.65);
      }

      // Smooth fade out at 58.80s
      masterTimeline.to(probCardsList, { opacity: 0, x: -18, duration: 0.4, ease: 'power2.in' }, 58.80);
      masterTimeline.set(probCardsList, { display: 'none' }, 59.20);

      // Hallucination Stage Progressive Visuals (a, b, c, d)
      if (hallucinationStage) {
        masterTimeline.set(hallucinationStage, { opacity: 1 }, 48.56);

        // a. "the dangerous one" (48.56s)
        if (visDangerous) {
          masterTimeline.fromTo(visDangerous,
            { opacity: 0, y: 16 },
            { opacity: 1, y: 0, duration: 0.45, ease: 'power2.out' },
            48.56
          );
        }

        // b. "They want to be helpful" (50.60s)
        if (visHelpful) {
          masterTimeline.fromTo(visHelpful,
            { opacity: 0, y: 16 },
            { opacity: 1, y: 0, duration: 0.45, ease: 'power2.out' },
            50.60
          );
        }

        // c. "So when they don't actually know something, they won't admit it" (51.90s)
        if (visNoAdmit) {
          masterTimeline.fromTo(visNoAdmit,
            { opacity: 0, y: 16 },
            { opacity: 1, y: 0, duration: 0.45, ease: 'power2.out' },
            51.90
          );
        }

        // d. "They'll just make up an answer that sounds right. That's hallucination" (55.14s)
        if (visHallucination) {
          masterTimeline.fromTo(visHallucination,
            { opacity: 0, scale: 0.88, y: 12 },
            { opacity: 1, scale: 1.0, y: 0, duration: 0.55, ease: 'back.out(1.6)' },
            55.14
          );
        }

        // Fade out flaw cards & visuals at 58.80s
        masterTimeline.to([probCardsList, hallucinationStage], { opacity: 0, duration: 0.4 }, 58.80);
      }
    }

    /* ── BEAT 8 (58.80s -> 65.22s): RAG The Simplest Solution ── */
    // Narration: "RAG fixes this the simplest way by giving small chunk documents with necessary informations right before they answer."
    if (ragSimplestStage) {
      masterTimeline.set(ragSimplestStage, { display: 'flex' }, 58.80);
      // 59.0s ("fixes this the simplest way"): Spring in stage
      masterTimeline.fromTo(ragSimplestStage,
        { opacity: 0, y: 16, scale: 0.95 },
        { opacity: 1, y: 0, scale: 1.0, duration: 0.5, ease: 'back.out(1.4)' },
        59.0
      );
      // 60.8s ("by giving small chunk documents"): Stagger chunk cards on the left
      if (chunk1 && chunk2 && chunk3) {
        masterTimeline.fromTo([chunk1, chunk2, chunk3],
          { opacity: 0, x: -16 },
          { opacity: 1, x: 0, duration: 0.32, stagger: 0.2, ease: 'power2.out' },
          60.8
        );
      }
      // 62.0s ("with necessary informations right before they answer"): Stagger 3 green checkmarks
      if (check1 && check2 && check3) {
        masterTimeline.fromTo([check1, check2, check3],
          { opacity: 0, scale: 0.88, x: 16 },
          { opacity: 1, scale: 1.0, x: 0, duration: 0.38, stagger: 0.22, ease: 'back.out(1.7)' },
          62.0
        );
      }
      // Smooth fade out at 64.8s to cleanly finish before next beat at 65.22s
      masterTimeline.to(ragSimplestStage, { opacity: 0, y: -10, duration: 0.32, ease: 'power2.in' }, 64.8);
      masterTimeline.set(ragSimplestStage, { display: 'none' }, 65.15);
    }

    /* ── BEAT 9 (65.22s -> 72.34s): No Re-Training — Fresh Verified Reference Pages ── */
    // Narration: "Instead of re-training the model — we hand them fresh, verified reference pages the exact moment they're needed."
    if (noRetrainStage) {
      masterTimeline.set(noRetrainStage, { display: 'flex' }, 65.22);
      // 65.4s ("Instead of re-training the model"): Stage appears
      masterTimeline.fromTo(noRetrainStage,
        { opacity: 0, y: 16, scale: 0.95 },
        { opacity: 1, y: 0, scale: 1.0, duration: 0.5, ease: 'back.out(1.4)' },
        65.4
      );
      // 70.2s ("the exact moment they're needed"): Live badge pulses with neon glow
      if (liveBadge) {
        masterTimeline.fromTo(liveBadge,
          { scale: 0.94, filter: 'brightness(1.0)' },
          { scale: 1.06, filter: 'brightness(1.25)', duration: 0.25, yoyo: true, repeat: 2, ease: 'power2.out' },
          70.2
        );
      }
      // Fade out at 71.8s so stage is 100% gone before grand finale at 72.34s
      masterTimeline.to(noRetrainStage, { opacity: 0, y: -10, duration: 0.32, ease: 'power2.in' }, 71.8);
      masterTimeline.set(noRetrainStage, { display: 'none' }, 72.15);
    }

    /* ── BEAT 10 & 11 (72.34s -> 79.44s): Retrieval-Augmented Generation Grand Finale Ribbon ── */
    // Narration: "That's the whole idea behind Retrieval-Augmented Generation: non-parametric memory, delivered exactly when it's needed."
    if (grandRibbonStage) {
      masterTimeline.set(grandRibbonStage, { display: 'flex' }, 72.34);
      // 72.34s ("That's the whole idea behind Retrieval-Augmented Generation"): Ribbon appears cleanly
      masterTimeline.fromTo(grandRibbonStage,
        { opacity: 0, y: 14, scale: 0.96 },
        { opacity: 1, y: 0, scale: 1.0, duration: 0.45, ease: 'back.out(1.4)' },
        72.34
      );
      if (ribbonParam) {
        masterTimeline.fromTo(ribbonParam,
          { opacity: 0, x: -14 },
          { opacity: 1, x: 0, duration: 0.4, ease: 'power2.out' },
          72.5
        );
      }
      if (ribbonOp) {
        masterTimeline.fromTo(ribbonOp,
          { opacity: 0, scale: 0 },
          { opacity: 1, scale: 1, duration: 0.3, ease: 'back.out(2)' },
          74.2
        );
      }
      // 76.1s ("non-parametric memory"): External verified memory locks in with vibrant emerald focus glow
      if (ribbonNonParam) {
        masterTimeline.fromTo(ribbonNonParam,
          { opacity: 0, scale: 0.88, y: 6 },
          { opacity: 1, scale: 1.0, y: 0, duration: 0.45, ease: 'back.out(1.8)' },
          76.1
        );
        masterTimeline.fromTo(ribbonNonParam,
          { boxShadow: '0 0 0 rgba(16, 185, 129, 0)' },
          { boxShadow: '0 0 22px rgba(16, 185, 129, 0.45)', duration: 0.32, yoyo: true, repeat: 1 },
          76.35
        );
      }
      if (ribbonArrow) {
        masterTimeline.fromTo(ribbonArrow,
          { opacity: 0, scale: 0 },
          { opacity: 1, scale: 1, duration: 0.3, ease: 'back.out(2)' },
          76.8
        );
      }
      // 77.2s ("delivered exactly when it's needed"): Grounded result card locks in & live badge drops down
      if (ribbonResult) {
        masterTimeline.fromTo(ribbonResult,
          { opacity: 0, scale: 0.88, x: 12 },
          { opacity: 1, scale: 1.0, x: 0, duration: 0.45, ease: 'back.out(1.8)' },
          77.2
        );
      }
      if (grandLiveBadge) {
        masterTimeline.fromTo(grandLiveBadge,
          { opacity: 0, y: 6, scale: 0.94 },
          { opacity: 1, y: 0, scale: 1.0, duration: 0.4, ease: 'back.out(1.6)' },
          77.4
        );
      }
    }
  }

  root.mountSlide01KineticOverlay = mountSlide01KineticOverlay;
})(window);
