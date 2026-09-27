/* ═══════════════════════════════════════════════════════════════════
   Manodemy RAG Studio — Slide 02 Kinetic Motion Overlay Engine
   100% GSAP Master Timeline-Driven Micro-Animations
   The 5-Stage Conveyor Belt: Ingest → Chunk → Embed → Retrieve → Generate
   ═══════════════════════════════════════════════════════════════════ */

(function(root) {
  'use strict';

  const STYLE_ID = 'rag-slide02-styles';

  function injectStyles() {
    if (document.getElementById(STYLE_ID)) return;
    const style = document.createElement('style');
    style.id = STYLE_ID;
    style.textContent = `
      /* ── Slide 02 Kinetic Host Container ── */
      .s2-overlay-container {
        position: absolute;
        inset: 0;
        pointer-events: none;
        overflow: hidden;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        z-index: 10;
      }

      /* ── Stage Conveyor Track (Bottom HUD Ribbon) ── */
      .s2-conveyor-ribbon {
        position: absolute;
        bottom: 20px;
        left: 50%;
        transform: translateX(-50%) translateY(24px);
        display: flex;
        align-items: center;
        gap: 6px;
        background: rgba(255, 255, 255, 0.94);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border: 1.5px solid rgba(226, 232, 240, 0.9);
        border-radius: 12px;
        padding: 6px 10px;
        box-shadow: 0 12px 36px rgba(15, 23, 42, 0.12), 0 2px 6px rgba(0, 0, 0, 0.04);
        pointer-events: auto;
        user-select: none;
        z-index: 20;
        overflow: visible;
        opacity: 0;
        transition: opacity 0.4s cubic-bezier(0.16, 1, 0.3, 1), transform 0.4s cubic-bezier(0.16, 1, 0.3, 1);
      }

      .s2-conveyor-ribbon.is-visible {
        opacity: 1;
        transform: translateX(-50%) translateY(0);
      }

      .s2-stage-node {
        display: flex;
        align-items: center;
        gap: 7px;
        padding: 6px 12px;
        border-radius: 8px;
        background: rgba(241, 245, 249, 0.6);
        border: 1px solid rgba(203, 213, 225, 0.6);
        cursor: pointer;
        opacity: 0.6;
        transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
      }

      .s2-stage-node:hover {
        opacity: 0.9;
        background: #ffffff;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(15, 23, 42, 0.08);
      }

      .s2-stage-node.is-active {
        opacity: 1;
        background: #ffffff;
        border-color: #6366f1;
        box-shadow: 0 4px 16px rgba(99, 102, 241, 0.25), 0 0 0 2px rgba(99, 102, 241, 0.2);
        transform: translateY(-2px) scale(1.04);
      }

      .s2-stage-badge {
        font-size: 10px;
        font-weight: 800;
        padding: 2px 5px;
        border-radius: 4px;
        background: #e2e8f0;
        color: #475569;
        letter-spacing: 0.4px;
      }

      .s2-stage-node.is-active .s2-stage-badge {
        background: #4f46e5;
        color: #ffffff;
      }

      .s2-stage-title {
        font-size: 11.5px;
        font-weight: 700;
        color: #334155;
        letter-spacing: -0.01em;
      }

      .s2-stage-node.is-active .s2-stage-title {
        color: #4338ca;
      }

      .s2-stage-arrow {
        color: #94a3b8;
        display: flex;
        align-items: center;
        opacity: 0.6;
      }

      /* ── Simplified Floating Card Anchored Directly Above Active Point ── */
      .s2-inspect-card {
        position: absolute;
        bottom: calc(100% + 14px);
        left: 50px;
        transform: translateX(-50%) translateY(6px);
        width: 240px;
        background: rgba(255, 255, 255, 0.98);
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        border: 1.5px solid rgba(99, 102, 241, 0.32);
        border-radius: 12px;
        padding: 9px 13px;
        box-shadow: 0 14px 34px rgba(15, 23, 42, 0.16), 0 2px 6px rgba(99, 102, 241, 0.08);
        pointer-events: auto;
        opacity: 0;
        visibility: hidden;
        transition: left 0.35s cubic-bezier(0.16, 1, 0.3, 1), opacity 0.25s ease, transform 0.35s cubic-bezier(0.16, 1, 0.3, 1), visibility 0.25s;
        z-index: 30;
        text-align: left;
      }

      .s2-inspect-card.is-visible {
        opacity: 1;
        visibility: visible;
        transform: translateX(-50%) translateY(0);
      }

      /* Downward pointer caret directly over the active node */
      .s2-inspect-card::after {
        content: '';
        position: absolute;
        top: 100%;
        left: 50%;
        transform: translateX(-50%);
        border-width: 7px 7px 0 7px;
        border-style: solid;
        border-color: rgba(255, 255, 255, 0.98) transparent transparent transparent;
        filter: drop-shadow(0 2px 2px rgba(15, 23, 42, 0.06));
      }

      .s2-card-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 4px;
      }

      .s2-card-icon {
        font-size: 14px;
      }

      .s2-card-title {
        font-size: 12.5px;
        font-weight: 800;
        color: #1e1b4b;
        letter-spacing: -0.01em;
      }

      .s2-card-num {
        font-size: 9.5px;
        font-weight: 800;
        color: #4f46e5;
        background: #eef2ff;
        border: 1px solid rgba(99, 102, 241, 0.25);
        border-radius: 4px;
        padding: 1px 5px;
      }

      .s2-card-what {
        font-size: 11px;
        color: #475569;
        line-height: 1.38;
        margin-bottom: 6px;
      }

      .s2-card-flow-row {
        display: flex;
        align-items: center;
        gap: 5px;
        background: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 6px;
        padding: 3px 7px;
      }

      .s2-card-flow-label {
        font-size: 8.5px;
        font-weight: 800;
        color: #64748b;
        text-transform: uppercase;
        letter-spacing: 0.4px;
      }

      .s2-card-flow-val {
        font-size: 10px;
        font-weight: 700;
        color: #059669;
        font-family: 'JetBrains Mono', 'SFMono-Regular', Consolas, monospace;
      }

      /* ── Final Pipeline Summary Card (Beat 8 Climax) ── */
      .s2-summary-card {
        position: absolute;
        top: 17%;
        left: 50%;
        transform: translateX(-50%) translateY(12px) scale(0.96);
        background: rgba(255, 255, 255, 0.98);
        backdrop-filter: blur(24px);
        -webkit-backdrop-filter: blur(24px);
        border: 1.5px solid rgba(99, 102, 241, 0.35);
        border-radius: 16px;
        padding: 16px 24px;
        box-shadow: 0 20px 48px rgba(15, 23, 42, 0.14), 0 0 0 1px rgba(255, 255, 255, 0.9);
        text-align: center;
        opacity: 0;
        visibility: hidden;
        pointer-events: auto;
        z-index: 25;
        max-width: 680px;
        width: 92%;
        box-sizing: border-box;
        transition: opacity 0.35s ease, transform 0.35s cubic-bezier(0.16, 1, 0.3, 1), visibility 0.35s;
      }

      .s2-summary-card.is-visible {
        opacity: 1;
        visibility: visible;
        transform: translateX(-50%) translateY(0) scale(1);
      }

      .s2-summary-pipeline {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-wrap: nowrap;
        gap: 6px;
        margin: 10px 0 12px;
        padding: 6px 10px;
        background: rgba(248, 250, 252, 0.85);
        border: 1px solid #e2e8f0;
        border-radius: 10px;
      }

      .s2-summary-pill {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        font-size: 11px;
        font-weight: 800;
        border-radius: 6px;
        padding: 5px 10px;
        white-space: nowrap;
        letter-spacing: -0.01em;
        opacity: 0.35;
        transform: scale(0.96);
        filter: grayscale(40%);
        transition: all 0.28s cubic-bezier(0.16, 1, 0.3, 1);
      }

      .s2-summary-pill.p-ingest   { color: #4338ca; background: #eef2ff; border: 1px solid #c7d2fe; }
      .s2-summary-pill.p-chunk    { color: #6d28d9; background: #f5f3ff; border: 1px solid #ddd6fe; }
      .s2-summary-pill.p-embed    { color: #0284c7; background: #f0f9ff; border: 1px solid #bae6fd; }
      .s2-summary-pill.p-retrieve { color: #b45309; background: #fffbeb; border: 1px solid #fde68a; }
      .s2-summary-pill.p-generate { color: #059669; background: #ecfdf5; border: 1px solid #a7f3d0; }

      /* Spoken & Highlighted State for Beat 8 Audio Words */
      .s2-summary-pill.is-spoken {
        opacity: 1;
        transform: scale(1.08);
        filter: grayscale(0%);
      }

      .s2-summary-pill.p-ingest.is-spoken   { box-shadow: 0 4px 14px rgba(79, 70, 229, 0.4), 0 0 0 2px rgba(79, 70, 229, 0.2); }
      .s2-summary-pill.p-chunk.is-spoken    { box-shadow: 0 4px 14px rgba(109, 40, 217, 0.4), 0 0 0 2px rgba(109, 40, 217, 0.2); }
      .s2-summary-pill.p-embed.is-spoken    { box-shadow: 0 4px 14px rgba(2, 132, 199, 0.4), 0 0 0 2px rgba(2, 132, 199, 0.2); }
      .s2-summary-pill.p-retrieve.is-spoken { box-shadow: 0 4px 14px rgba(217, 119, 6, 0.4), 0 0 0 2px rgba(217, 119, 6, 0.2); }
      .s2-summary-pill.p-generate.is-spoken { box-shadow: 0 4px 14px rgba(5, 150, 105, 0.4), 0 0 0 2px rgba(5, 150, 105, 0.2); }

      .s2-summary-pill.is-all-active {
        opacity: 1;
        transform: scale(1.0);
        filter: none;
      }

      .s2-summary-arrow {
        color: #94a3b8;
        font-size: 11px;
        display: flex;
        align-items: center;
      }

      .s2-summary-quote {
        font-size: 13.5px;
        font-weight: 700;
        color: #64748b;
        line-height: 1.45;
        font-style: italic;
        margin-bottom: 8px;
        padding: 6px 12px;
        border-radius: 8px;
        border: 1.5px solid transparent;
        transition: all 0.35s ease;
      }

      .s2-summary-quote.is-highlighted {
        color: #1e1b4b;
        background: rgba(238, 242, 255, 0.7);
        border-color: rgba(99, 102, 241, 0.35);
        box-shadow: 0 4px 16px rgba(99, 102, 241, 0.12);
      }

      .s2-summary-tags {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        opacity: 0;
        transform: translateY(6px);
        transition: all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
      }

      .s2-summary-tags.is-visible {
        opacity: 1;
        transform: translateY(0);
      }

      .s2-summary-tag {
        font-size: 10px;
        font-weight: 800;
        letter-spacing: 0.3px;
        padding: 2px 9px;
        border-radius: 999px;
        text-transform: uppercase;
      }

      .s2-summary-tag.tag-evidence {
        color: #059669;
        background: #ecfdf5;
        border: 1px solid rgba(16, 185, 129, 0.3);
      }

      .s2-summary-tag.tag-grounded {
        color: #4338ca;
        background: #eef2ff;
        border: 1px solid rgba(99, 102, 241, 0.25);
      }
    `;
    document.head.appendChild(style);
  }

  const STAGE_DETAILS = [
    {
      num: '01',
      icon: '📄',
      title: 'Ingestion',
      what: 'Parses PDFs, docs & manuals into clean text.',
      flow: 'Raw Files ➔ Clean Text',
      approxCenterPct: 10
    },
    {
      num: '02',
      icon: '✂️',
      title: 'Chunking',
      what: 'Splits text into meaningful passages with overlap.',
      flow: 'Full Text ➔ Semantic Passages',
      approxCenterPct: 30
    },
    {
      num: '03',
      icon: '🧭',
      title: 'Embedding',
      what: 'Converts text chunks into numerical vector coordinates.',
      flow: 'Passages ➔ Dense Vectors',
      approxCenterPct: 50
    },
    {
      num: '04',
      icon: '🎯',
      title: 'Retrieval',
      what: 'Compares query vector with stored vectors to pull top chunks.',
      flow: 'Query ➔ Top Chunks',
      approxCenterPct: 70
    },
    {
      num: '05',
      icon: '💡',
      title: 'Generation',
      what: 'Injects context into LLM prompt to generate grounded answers.',
      flow: 'Context + Query ➔ Grounded Answer',
      approxCenterPct: 90
    }
  ];

  class Slide02KineticOverlay {
    constructor() {
      this.container = null;
      this.currentStageIndex = -1;
      injectStyles();
    }

    mount(hostElement) {
      this.destroy();
      if (!hostElement) return;

      this.container = document.createElement('div');
      this.container.className = 's2-overlay-container';
      this.container.id = 'slide02OverlayHost';

      // ── Build Inspector Card Anchored Above Ribbon Nodes ──
      const inspectHtml = `
        <div class="s2-inspect-card" id="s2InspectCard">
          <div class="s2-card-head">
            <div style="display: flex; align-items: center; gap: 5px;">
              <span class="s2-card-icon" id="s2CardIcon">📄</span>
              <span class="s2-card-title" id="s2CardTitle">Ingestion</span>
            </div>
            <span class="s2-card-num" id="s2CardNum">01</span>
          </div>
          <div class="s2-card-what" id="s2CardWhat">Parses PDFs, docs & manuals into clean text.</div>
          <div class="s2-card-flow-row">
            <span class="s2-card-flow-label">Flow</span>
            <span class="s2-card-flow-val" id="s2CardFlow">Raw Files ➔ Clean Text</span>
          </div>
        </div>
      `;

      // ── Build Conveyor Ribbon HTML with Popover Inside ──
      const ribbonHtml = `
        <div class="s2-conveyor-ribbon" id="s2ConveyorRibbon">
          ${inspectHtml}
          <div class="s2-stage-node" id="s2Node0" onclick="window.Slide02KineticOverlay && window.Slide02KineticOverlay.manualSelect(0)">
            <span class="s2-stage-badge">01</span>
            <span class="s2-stage-title">Ingest</span>
          </div>
          <span class="s2-stage-arrow">➔</span>
          <div class="s2-stage-node" id="s2Node1" onclick="window.Slide02KineticOverlay && window.Slide02KineticOverlay.manualSelect(1)">
            <span class="s2-stage-badge">02</span>
            <span class="s2-stage-title">Chunk</span>
          </div>
          <span class="s2-stage-arrow">➔</span>
          <div class="s2-stage-node" id="s2Node2" onclick="window.Slide02KineticOverlay && window.Slide02KineticOverlay.manualSelect(2)">
            <span class="s2-stage-badge">03</span>
            <span class="s2-stage-title">Embed</span>
          </div>
          <span class="s2-stage-arrow">➔</span>
          <div class="s2-stage-node" id="s2Node3" onclick="window.Slide02KineticOverlay && window.Slide02KineticOverlay.manualSelect(3)">
            <span class="s2-stage-badge">04</span>
            <span class="s2-stage-title">Retrieve</span>
          </div>
          <span class="s2-stage-arrow">➔</span>
          <div class="s2-stage-node" id="s2Node4" onclick="window.Slide02KineticOverlay && window.Slide02KineticOverlay.manualSelect(4)">
            <span class="s2-stage-badge">05</span>
            <span class="s2-stage-title">Generate</span>
          </div>
        </div>
      `;

      // ── Build Summary Card HTML ──
      const summaryHtml = `
        <div class="s2-summary-card" id="s2SummaryCard">
          <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 3px;">
            <span style="font-size: 10px; font-weight: 800; letter-spacing: 0.8px; color: #4f46e5; background: #eef2ff; border: 1px solid rgba(99, 102, 241, 0.25); border-radius: 999px; padding: 2px 10px; text-transform: uppercase;">
              Production Architecture
            </span>
          </div>

          <div class="s2-summary-pipeline">
            <span class="s2-summary-pill p-ingest" id="s2PillIngest">📄 1. Ingest</span>
            <span class="s2-summary-arrow">➔</span>
            <span class="s2-summary-pill p-chunk" id="s2PillChunk">✂️ 2. Chunk</span>
            <span class="s2-summary-arrow">➔</span>
            <span class="s2-summary-pill p-embed" id="s2PillEmbed">🧭 3. Embed</span>
            <span class="s2-summary-arrow">➔</span>
            <span class="s2-summary-pill p-retrieve" id="s2PillRetrieve">🎯 4. Retrieve</span>
            <span class="s2-summary-arrow">➔</span>
            <span class="s2-summary-pill p-generate" id="s2PillGenerate">💡 5. Generate</span>
          </div>

          <div class="s2-summary-quote" id="s2SummaryQuote">
            "That's RAG — finding the right information, right when the model needs it."
          </div>

          <div class="s2-summary-tags" id="s2SummaryTags">
            <span class="s2-summary-tag tag-evidence">🛡️ Zero Hallucinations</span>
            <span class="s2-summary-tag tag-grounded">⚡ Real-Time External Evidence</span>
          </div>
        </div>
      `;

      this.container.innerHTML = ribbonHtml + summaryHtml;
      hostElement.appendChild(this.container);
      this.currentStageIndex = -1;
      this.syncToTime(0);
    }

    /**
     * Frame-exact continuous time sync
     * Guaranteed 100% resilient across playback, seeking, scrubbing, fast-forwarding
     */
    syncToTime(t) {
      if (!this.container) return;
      const ribbon = document.getElementById('s2ConveyorRibbon');
      const card = document.getElementById('s2InspectCard');
      const summary = document.getElementById('s2SummaryCard');

      // 1. Ribbon entrance: hidden during 0.0s - 4.10s cold open; enters smoothly at 4.10s
      if (ribbon) {
        if (t < 4.10) {
          ribbon.classList.remove('is-visible');
        } else {
          ribbon.classList.add('is-visible');
        }
      }

      // 2. Determine active stage based on Whisper word timestamps
      let activeStage = -1;
      let isSummaryMode = false;

      if (t < 9.94) {
        activeStage = -1; // Overview mode (4.10 - 9.94)
      } else if (t < 17.28) {
        activeStage = 0;  // Stage 1: Ingest (9.94 - 17.28)
      } else if (t < 23.72) {
        activeStage = 1;  // Stage 2: Chunk (17.28 - 23.72)
      } else if (t < 36.66) {
        activeStage = 2;  // Stage 3: Embed (23.72 - 36.66)
      } else if (t < 45.02) {
        activeStage = 3;  // Stage 4: Retrieve (36.66 - 45.02)
      } else if (t < 53.42) {
        activeStage = 4;  // Stage 5: Generate (45.02 - 53.42)
      } else {
        activeStage = -1; // Summary recap mode (53.42 - 62.96)
        isSummaryMode = true;
      }

      // Apply ribbon node states & inspect card
      this.applyStage(activeStage);

      // 3. Handle Beat 8 Summary Card & Spoken Pill Stagger Sync
      if (summary) {
        if (isSummaryMode) {
          summary.classList.add('is-visible');

          const pillIngest   = document.getElementById('s2PillIngest');
          const pillChunk    = document.getElementById('s2PillChunk');
          const pillEmbed    = document.getElementById('s2PillEmbed');
          const pillRetrieve = document.getElementById('s2PillRetrieve');
          const pillGenerate = document.getElementById('s2PillGenerate');
          const quoteEl      = document.getElementById('s2SummaryQuote');
          const tagsEl       = document.getElementById('s2SummaryTags');

          const pills = [pillIngest, pillChunk, pillEmbed, pillRetrieve, pillGenerate];

          // Exact Whisper word timestamps for the rapid 5-stage countdown:
          // 55.14s: "Ingest,"
          // 56.00s: "chunk,"
          // 56.52s: "embed,"
          // 57.66s: "retrieve,"
          // 58.36s: "generate."
          // 59.08s: "That's RAG..." (Grand finale unified illumination)
          const pillWordTimes = [55.14, 56.00, 56.52, 57.66, 58.36];

          if (t >= 59.08) {
            // Climax: All pills glowing together in full color
            pills.forEach(p => {
              if (p) {
                p.classList.add('is-all-active');
                p.classList.remove('is-spoken');
              }
            });
            if (quoteEl) quoteEl.classList.add('is-highlighted');
            if (tagsEl) tagsEl.classList.add('is-visible');
          } else {
            if (quoteEl) quoteEl.classList.remove('is-highlighted');
            if (tagsEl) tagsEl.classList.remove('is-visible');

            pills.forEach((p, idx) => {
              if (!p) return;
              p.classList.remove('is-all-active');
              if (t >= pillWordTimes[idx]) {
                p.classList.add('is-spoken');
              } else {
                p.classList.remove('is-spoken');
              }
            });
          }
        } else {
          summary.classList.remove('is-visible');
        }
      }
    }

    applyStage(stageIndex) {
      this.currentStageIndex = stageIndex;
      if (!this.container) return;

      const card = document.getElementById('s2InspectCard');

      // Update Ribbon Node Classes
      for (let i = 0; i < 5; i++) {
        const node = document.getElementById(`s2Node${i}`);
        if (node) {
          node.classList.toggle('is-active', i === stageIndex);
        }
      }

      if (stageIndex >= 0 && stageIndex < 5) {
        const node = document.getElementById(`s2Node${stageIndex}`);
        const d = STAGE_DETAILS[stageIndex];

        const iconEl = document.getElementById('s2CardIcon');
        const titEl = document.getElementById('s2CardTitle');
        const numEl = document.getElementById('s2CardNum');
        const whatEl = document.getElementById('s2CardWhat');
        const flowEl = document.getElementById('s2CardFlow');

        if (iconEl) iconEl.textContent = d.icon;
        if (titEl) titEl.textContent = d.title;
        if (numEl) numEl.textContent = d.num;
        if (whatEl) whatEl.textContent = d.what;
        if (flowEl) flowEl.textContent = d.flow;

        if (card) {
          if (node && node.offsetWidth > 0) {
            const nodeCenter = node.offsetLeft + (node.offsetWidth / 2);
            card.style.left = `${nodeCenter}px`;
          } else if (d.approxCenterPct) {
            card.style.left = `${d.approxCenterPct}%`;
          }
          card.classList.add('is-visible');
        }
      } else {
        if (card) card.classList.remove('is-visible');
      }
    }

    setStageActive(stageIndex) {
      this.applyStage(stageIndex);
    }

    showSummary(show = true) {
      const summary = document.getElementById('s2SummaryCard');
      const card = document.getElementById('s2InspectCard');
      if (show) {
        if (card) card.classList.remove('is-visible');
        if (summary) summary.classList.add('is-visible');
      } else {
        if (summary) summary.classList.remove('is-visible');
      }
    }

    manualSelect(stageIndex) {
      const stageTimings = [9.94, 17.28, 23.72, 36.66, 45.02];
      if (window.ragAnimator && typeof window.ragAnimator.seek === 'function' && stageTimings[stageIndex] !== undefined) {
        window.ragAnimator.seek(stageTimings[stageIndex] + 0.05);
      } else {
        this.applyStage(stageIndex);
      }
    }

    destroy() {
      if (this.container && this.container.parentNode) {
        this.container.parentNode.removeChild(this.container);
      }
      this.container = null;
    }
  }

  const overlayInstance = new Slide02KineticOverlay();
  root.Slide02KineticOverlay = overlayInstance;

  function mountSlide02KineticOverlay(container, masterTimeline) {
    if (!container) return;
    overlayInstance.mount(container);

    if (masterTimeline) {
      // Continuous timeline sync hook (runs on every tick & seek)
      masterTimeline.to({}, {
        duration: 63.0,
        onUpdate: function() {
          const t = masterTimeline.time();
          overlayInstance.syncToTime(t);
        }
      }, 0.0);
    }
  }

  root.mountSlide02KineticOverlay = mountSlide02KineticOverlay;
})(window);
