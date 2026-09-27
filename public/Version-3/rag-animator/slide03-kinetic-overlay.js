/* ═══════════════════════════════════════════════════════════════════
   Manodemy RAG Studio — Slide 03 Kinetic Motion Overlay Engine (v7.0)
   World-Class Asymmetric Motion Design (Left 55% Unobstructed Cinema Zone)
   100% GSAP Master Timeline-Driven Micro-Animations (Continuous 1s Cadence)
   ═══════════════════════════════════════════════════════════════════ */

(function(root) {
  'use strict';

  const STYLE_ID = 'rag-slide03-styles-v7';

  function injectStyles() {
    if (document.getElementById(STYLE_ID)) return;
    const style = document.createElement('style');
    style.id = STYLE_ID;
    style.textContent = `
      /* ── Host Container ── */
      .s3-overlay-container {
        position: absolute;
        inset: 0;
        pointer-events: none;
        overflow: hidden;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        z-index: 10;
      }

      /* ── Pulse Keyframes for Continuous 1s Micro-Animations ── */
      @keyframes s3GlowPulse {
        0%, 100% { box-shadow: 0 0 0 0 rgba(239, 68, 68, 0.4); }
        50% { box-shadow: 0 0 0 8px rgba(239, 68, 68, 0); }
      }

      @keyframes s3GreenPulse {
        0%, 100% { box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.4); }
        50% { box-shadow: 0 0 0 8px rgba(16, 185, 129, 0); }
      }

      @keyframes s3BadgePop {
        0% { transform: scale(0.92); opacity: 0; }
        60% { transform: scale(1.08); }
        100% { transform: scale(1); opacity: 1; }
      }

      @keyframes s3CaretBlink {
        0%, 100% { opacity: 1; }
        50% { opacity: 0; }
      }

      @keyframes s3StampSlam {
        0% { transform: scale(2.2) rotate(-15deg); opacity: 0; filter: blur(4px); }
        70% { transform: scale(0.95) rotate(-3deg); opacity: 1; filter: blur(0); }
        85% { transform: scale(1.04) rotate(-3deg); }
        100% { transform: scale(1) rotate(-3deg); opacity: 1; }
      }

      @keyframes s3ShockRing {
        0% { transform: scale(0.8); opacity: 0.8; }
        100% { transform: scale(1.6); opacity: 0; }
      }

      /* ── Right-Side Floating HUD Container (Preserves Left 55% Cinema View) ── */
      .s3-right-hud-card {
        position: absolute;
        right: 28px;
        top: 15%;
        width: 420px;
        background: rgba(255, 255, 255, 0.88);
        backdrop-filter: blur(18px);
        -webkit-backdrop-filter: blur(18px);
        border: 1.5px solid rgba(226, 232, 240, 0.85);
        border-radius: 16px;
        padding: 16px 20px;
        box-shadow: 0 20px 48px rgba(15, 23, 42, 0.12), 0 4px 12px rgba(15, 23, 42, 0.04);
        opacity: 0;
        visibility: hidden;
        transform: translateX(24px) scale(0.97);
        transition: all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
        pointer-events: auto;
        z-index: 25;
      }

      .s3-right-hud-card.is-visible {
        opacity: 1;
        visibility: visible;
        transform: translateX(0) scale(1);
      }

      /* ── Beat 2: Notebook Flashback Success Card (Bottom Right Corner) ── */
      .s3-notebook-card {
        top: auto;
        bottom: 24px;
        right: 28px;
        border-color: rgba(16, 185, 129, 0.35);
        background: rgba(255, 255, 255, 0.94);
      }

      .s3-success-stat-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: #f0fdf4;
        border: 1px solid #bbf7d0;
        border-radius: 10px;
        padding: 10px 14px;
        margin-top: 10px;
      }

      .s3-success-meter {
        width: 100%;
        height: 6px;
        background: #e2e8f0;
        border-radius: 999px;
        overflow: hidden;
        margin-top: 8px;
      }

      .s3-success-fill {
        width: 100%;
        height: 100%;
        background: #10b981;
        border-radius: 999px;
        transform-origin: left;
        animation: s3BadgePop 0.8s ease-out;
      }

      /* ── Beat 3: Executive Query & Hallucination Modal ── */
      .s3-chat-bubble {
        padding: 10px 14px;
        border-radius: 12px;
        font-size: 12.5px;
        line-height: 1.45;
        margin-bottom: 10px;
        transition: all 0.3s ease;
      }

      .s3-bubble-user {
        background: #f8fafc;
        border: 1px solid #e2e8f0;
        color: #1e293b;
        margin-left: 20px;
        border-bottom-right-radius: 2px;
      }

      .s3-bubble-bot {
        background: #fff1f2;
        border: 1.5px solid rgba(244, 63, 94, 0.4);
        color: #881337;
        margin-right: 20px;
        border-bottom-left-radius: 2px;
        position: relative;
        overflow: visible;
      }

      .s3-stamp-badge {
        display: inline-block;
        padding: 5px 12px;
        border: 2px solid #dc2626;
        border-radius: 6px;
        color: #dc2626;
        font-size: 11px;
        font-weight: 900;
        letter-spacing: 0.6px;
        text-transform: uppercase;
        background: rgba(254, 226, 226, 0.95);
        box-shadow: 0 4px 14px rgba(220, 38, 38, 0.25);
        opacity: 0;
        transform: scale(1.6) rotate(-8deg);
        transition: all 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        margin-top: 8px;
      }

      .s3-stamp-badge.is-stamped {
        opacity: 1;
        animation: s3StampSlam 0.45s cubic-bezier(0.16, 1, 0.3, 1) forwards;
      }

      /* ── Beat 4: Live Auto-Scrolling Slack War Room ── */
      .s3-slack-window {
        padding: 0;
        overflow: hidden;
      }

      .s3-slack-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 16px;
        background: rgba(248, 250, 252, 0.95);
        border-bottom: 1px solid #e2e8f0;
      }

      .s3-slack-channel-title {
        font-size: 12px;
        font-weight: 800;
        color: #0f172a;
        display: flex;
        align-items: center;
        gap: 6px;
      }

      .s3-slack-channel-title span {
        color: #64748b;
        font-weight: 600;
      }

      .s3-slack-unread-pill {
        font-size: 10px;
        font-weight: 800;
        background: #ef4444;
        color: #ffffff;
        padding: 2px 8px;
        border-radius: 999px;
        letter-spacing: 0.3px;
        box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);
        transition: transform 0.2s cubic-bezier(0.34, 1.56, 0.64, 1);
      }

      .s3-slack-unread-pill.is-popped {
        animation: s3BadgePop 0.4s ease-out;
      }

      .s3-slack-messages-body {
        padding: 12px 16px;
        max-height: 230px;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
        gap: 12px;
        scroll-behavior: smooth;
      }

      .s3-slack-msg {
        display: flex;
        gap: 10px;
        opacity: 0;
        transform: translateY(10px);
        transition: all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
      }

      .s3-slack-msg.is-dropped {
        opacity: 1;
        transform: translateY(0);
      }

      .s3-slack-avatar {
        width: 28px;
        height: 28px;
        border-radius: 6px;
        background: #e2e8f0;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 13px;
        flex-shrink: 0;
      }

      .s3-slack-msg-content {
        flex: 1;
      }

      .s3-slack-msg-author {
        display: flex;
        align-items: baseline;
        gap: 6px;
        margin-bottom: 2px;
      }

      .s3-slack-msg-author span:first-child {
        font-size: 11.5px;
        font-weight: 800;
        color: #0f172a;
      }

      .s3-slack-msg-time {
        font-size: 9.5px;
        color: #94a3b8;
      }

      .s3-slack-msg-text {
        font-size: 11.5px;
        color: #334155;
        line-height: 1.4;
      }

      .s3-slack-screenshot-card {
        margin-top: 6px;
        background: #ffffff;
        border: 1px solid #cbd5e1;
        border-radius: 6px;
        padding: 6px 10px;
        font-size: 10px;
        color: #b91c1c;
        display: flex;
        flex-direction: column;
        gap: 2px;
      }

      .s3-slack-reactions {
        display: flex;
        gap: 4px;
        margin-top: 6px;
      }

      .s3-slack-react-badge {
        font-size: 10px;
        padding: 2px 6px;
        background: #f1f5f9;
        border: 1px solid #e2e8f0;
        border-radius: 999px;
        color: #475569;
        font-weight: 700;
      }

      /* ── Beat 5: Frantic Prompt Editor Simulation ── */
      .s3-prompt-codebox {
        background: #0f172a;
        border: 1px solid #1e293b;
        border-radius: 10px;
        padding: 12px 14px;
        font-family: 'JetBrains Mono', monospace;
        font-size: 11px;
        color: #e2e8f0;
        line-height: 1.5;
        margin-top: 10px;
      }

      .s3-caret {
        display: inline-block;
        width: 7px;
        height: 13px;
        background: #38bdf8;
        vertical-align: middle;
        margin-left: 2px;
        animation: s3CaretBlink 0.8s infinite;
      }

      /* ── Beat 6: Minimalist Golden Teleprompter Thesis (Top Center Ribbon) ── */
      @keyframes s3ShineSweep {
        0% { background-position: 200% 0; }
        100% { background-position: -200% 0; }
      }

      .s3-thesis-ribbon {
        position: absolute;
        top: 60px;
        left: 50%;
        transform: translateX(-50%) translateY(-10px) scale(0.96);
        width: 88%;
        max-width: 660px;
        background: linear-gradient(90deg, rgba(255, 255, 255, 0.95) 0%, rgba(254, 243, 199, 0.98) 50%, rgba(255, 255, 255, 0.95) 100%);
        background-size: 200% 100%;
        animation: s3ShineSweep 5s infinite linear;
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        border: 1.5px solid rgba(245, 158, 11, 0.6);
        border-radius: 999px;
        padding: 8px 24px;
        box-shadow: 0 14px 36px rgba(245, 158, 11, 0.18), 0 0 16px rgba(245, 158, 11, 0.12);
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 16px;
        opacity: 0;
        visibility: hidden;
        transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        z-index: 30;
      }

      .s3-thesis-ribbon.is-visible {
        opacity: 1;
        visibility: visible;
        transform: translateX(-50%) translateY(0) scale(1);
      }

      .s3-thesis-side {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 12px;
        font-weight: 800;
      }

      /* ── Beats 7-9: 3 Diagnostic Zone Telemetry Cards ── */
      .s3-zone-card {
        position: absolute;
        right: 28px;
        top: 15%;
        width: 420px;
        background: rgba(255, 255, 255, 0.92);
        backdrop-filter: blur(18px);
        -webkit-backdrop-filter: blur(18px);
        border: 1.5px solid rgba(226, 232, 240, 0.9);
        border-radius: 16px;
        padding: 16px 20px;
        box-shadow: 0 20px 48px rgba(15, 23, 42, 0.14);
        opacity: 0;
        visibility: hidden;
        transform: translateX(24px) scale(0.97);
        transition: all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
        pointer-events: auto;
        z-index: 25;
      }

      .s3-zone-card.is-visible {
        opacity: 1;
        visibility: visible;
        transform: translateX(0) scale(1);
      }

      .s3-zone-1 { border-left: 5px solid #ef4444; }
      .s3-zone-2 { border-left: 5px solid #f59e0b; }
      .s3-zone-3 { border-left: 5px solid #8b5cf6; }

      /* Zone 1: Sentence Slicing Micro-Animation */
      .s3-chunk-split-wrap {
        display: flex;
        gap: 8px;
        font-family: 'JetBrains Mono', monospace;
        font-size: 10.5px;
        transition: all 0.4s ease;
        position: relative;
        margin: 6px 0;
      }

      .s3-chunk-block {
        flex: 1;
        border-radius: 6px;
        padding: 8px;
        transition: all 0.45s cubic-bezier(0.16, 1, 0.3, 1);
      }

      .s3-chunk-left {
        background: #fef2f2;
        border: 1px solid #fecaca;
        color: #991b1b;
      }

      .s3-chunk-right {
        background: #f8fafc;
        border: 1px solid #cbd5e1;
        color: #475569;
      }

      .s3-chunk-crack-badge {
        position: absolute;
        top: -9px;
        left: 50%;
        transform: translateX(-50%) scale(0.6);
        background: #dc2626;
        color: #ffffff;
        font-size: 8.5px;
        font-weight: 900;
        padding: 2px 7px;
        border-radius: 4px;
        letter-spacing: 0.5px;
        box-shadow: 0 2px 8px rgba(220, 38, 38, 0.4);
        opacity: 0;
        pointer-events: none;
        transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
        z-index: 5;
      }

      .s3-chunk-split-wrap.is-split {
        gap: 16px;
      }

      .s3-chunk-split-wrap.is-split .s3-chunk-left {
        transform: translateX(-3px);
        border-color: #ef4444;
        box-shadow: 0 0 12px rgba(239, 68, 68, 0.22);
      }

      .s3-chunk-split-wrap.is-split .s3-chunk-right {
        transform: translateX(3px);
        opacity: 0.65;
        border-style: dashed;
      }

      .s3-chunk-split-wrap.is-split .s3-chunk-crack-badge {
        opacity: 1;
        transform: translateX(-50%) scale(1);
      }

      /* Zone 2: Cosine Similarity Gauge Micro-Animation */
      .s3-cosine-gauge-track {
        width: 100%;
        height: 8px;
        background: #fef3c7;
        border: 1px solid #fde68a;
        border-radius: 999px;
        position: relative;
        margin-top: 6px;
        overflow: hidden;
      }

      .s3-cosine-gauge-fill {
        height: 100%;
        width: 0%;
        background: #f59e0b;
        border-radius: 999px;
        transition: width 0.9s cubic-bezier(0.16, 1, 0.3, 1), background 0.4s ease;
      }

      .s3-cosine-threshold-marker {
        position: absolute;
        left: 75%;
        top: 0;
        bottom: 0;
        width: 2px;
        background: #dc2626;
        z-index: 2;
      }

      /* Zone 3: Attention Dilution Micro-Animation */
      .s3-attention-strip {
        display: flex;
        gap: 4px;
        margin: 6px 0;
      }

      .s3-token-cell {
        flex: 1;
        height: 18px;
        border-radius: 4px;
        background: #c084fc;
        transition: all 0.5s ease;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 8.5px;
        color: #ffffff;
        font-weight: 700;
      }

      .s3-token-cell.edge {
        background: #9333ea;
      }

      .s3-token-cell.target {
        background: #e11d48;
        box-shadow: 0 0 8px rgba(225, 29, 72, 0.5);
      }

      .s3-attention-strip.is-diluted .s3-token-cell:not(.edge):not(.target) {
        opacity: 0.2;
        background: #cbd5e1;
      }

      .s3-attention-strip.is-diluted .s3-token-cell.target {
        animation: s3BadgePop 0.8s infinite alternate;
      }

      /* ── Bottom Master Triage Ribbon ── */
      .s3-triage-ribbon {
        position: absolute;
        bottom: 14px;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 7px 18px;
        border-radius: 999px;
        background: rgba(255, 255, 255, 0.92);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border: 1.5px solid rgba(226, 232, 240, 0.9);
        box-shadow: 0 8px 28px rgba(15, 23, 42, 0.08);
        opacity: 0;
        visibility: hidden;
        transition: all 0.35s ease;
        z-index: 25;
      }

      .s3-triage-ribbon.is-visible {
        opacity: 1;
        visibility: visible;
      }

      .s3-triage-ribbon.is-finale {
        border-color: rgba(16, 185, 129, 0.85);
        box-shadow: 0 0 32px rgba(16, 185, 129, 0.35), 0 8px 28px rgba(15, 23, 42, 0.12);
        background: rgba(255, 255, 255, 0.98);
      }

      .s3-triage-node {
        display: flex;
        align-items: center;
        gap: 6px;
        padding: 5px 12px;
        border-radius: 999px;
        font-size: 11px;
        font-weight: 800;
        color: #64748b;
        background: #f8fafc;
        border: 1px solid #e2e8f0;
        transition: all 0.25s ease;
        cursor: pointer;
        pointer-events: auto;
      }

      .s3-triage-node.node-1.is-active { color: #dc2626; border-color: #ef4444; background: #fef2f2; box-shadow: 0 2px 10px rgba(239, 68, 68, 0.2); }
      .s3-triage-node.node-2.is-active { color: #d97706; border-color: #f59e0b; background: #fffbeb; box-shadow: 0 2px 10px rgba(245, 158, 11, 0.2); }
      .s3-triage-node.node-3.is-active { color: #7c3aed; border-color: #8b5cf6; background: #faf5ff; box-shadow: 0 2px 10px rgba(139, 92, 246, 0.2); }

      .s3-triage-node.is-finale-glow {
        border-color: #10b981 !important;
        background: #ecfdf5 !important;
        color: #047857 !important;
        box-shadow: 0 0 14px rgba(16, 185, 129, 0.4) !important;
        transform: scale(1.05);
      }
    `;
    document.head.appendChild(style);
  }

  class Slide03KineticOverlay {
    constructor() {
      this.container = null;
      injectStyles();
    }

    mount(hostElement) {
      this.destroy();
      if (!hostElement) return;

      this.container = document.createElement('div');
      this.container.className = 's3-overlay-container';
      this.container.id = 'slide03OverlayHost';

      // ── Beat 2: Notebook Flashback Success HUD Card ──
      const notebookHtml = `
        <div class="s3-right-hud-card s3-notebook-card" id="s3NotebookCard">
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
            <span style="font-size: 12px; font-weight: 800; color: #047857; text-transform: uppercase; letter-spacing: 0.5px;">
              ⚡ Local Validation Passed
            </span>
            <span style="font-size: 10px; font-weight: 700; color: #065f46; background: #dcfce7; padding: 2px 8px; border-radius: 4px;">
              Jupyter Notebook
            </span>
          </div>
          <div style="font-size: 12.5px; color: #334155; line-height: 1.45;">
            20 clean queries tested in sandbox. 100% test accuracy. Everything looked ready for production:
          </div>
          <div class="s3-success-stat-row">
            <span style="font-size: 11.5px; font-weight: 700; color: #065f46;">✅ Test Queries Passed:</span>
            <strong style="font-size: 13px; color: #047857; font-family: monospace;">20 / 20 (100%)</strong>
          </div>
          <div class="s3-success-meter">
            <div class="s3-success-fill"></div>
          </div>
          <div style="margin-top: 8px; font-size: 10.5px; color: #059669; font-weight: 700;">
            🚀 Status: Deployed to Live Production
          </div>
        </div>
      `;

      // ── Beat 3: Executive Hallucination Chat Modal ──
      const hallucinationHtml = `
        <div class="s3-right-hud-card" id="s3HallucinationModal" style="border-left: 5px solid #e11d48;">
          <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 12px; border-bottom: 1px solid #f1f5f9; padding-bottom: 8px;">
            <div style="font-size: 11px; font-weight: 800; color: #64748b; text-transform: uppercase; letter-spacing: 0.5px;">
              💬 Production Chat Audit • Acme HR Bot
            </div>
            <span style="font-size: 10px; font-weight: 700; color: #e11d48; background: #ffe4e6; padding: 2px 7px; border-radius: 4px;">
              +30m Into Prod
            </span>
          </div>

          <div class="s3-chat-bubble s3-bubble-user" id="s3UserBubble">
            <span style="font-weight: 800; color: #4338ca;">👤 VP Operations:</span> "What is our company policy on parental leave?"
          </div>

          <div class="s3-chat-bubble s3-bubble-bot" id="s3BotBubble" style="opacity: 0; transform: translateY(8px); transition: all 0.3s ease;">
            <span style="font-weight: 800; color: #9f1239;">🤖 Acme HR Bot:</span> "Under Section 4.2 of the Acme Handbook, all full-time employees are entitled to <strong style='color: #be123c; text-decoration: underline;'>six months of fully paid parental leave</strong>, effective immediately."
            <div>
              <span class="s3-stamp-badge" id="s3StampBadge">❌ Clause Does Not Exist (Hallucination)</span>
            </div>
          </div>
        </div>
      `;

      // ── Beat 4: Live Scrolling Slack War Room ──
      const slackHtml = `
        <div class="s3-right-hud-card s3-slack-window" id="s3SlackWindow" style="border-left: 5px solid #dc2626;">
          <div class="s3-slack-head">
            <div class="s3-slack-channel-title">
              <span>#</span> incident-rag-war-room
            </div>
            <span class="s3-slack-unread-pill" id="s3SlackBadge">12 unread</span>
          </div>

          <div class="s3-slack-messages-body" id="s3SlackBody">
            <!-- Message 1 (Alex VP Ops with screenshot) -->
            <div class="s3-slack-msg" id="s3SlackMsg1">
              <div class="s3-slack-avatar">👔</div>
              <div class="s3-slack-msg-content">
                <div class="s3-slack-msg-author">
                  <span>Alex (VP Operations)</span>
                  <span class="s3-slack-msg-time">10:31 AM</span>
                </div>
                <div class="s3-slack-msg-text">
                  Did the bot just promise 6 months of paid leave?! Look at this:
                </div>
                <div class="s3-slack-screenshot-card">
                  <span>📎 screenshot_hr_bot.png</span>
                  <strong>"6 months fully paid parental leave"</strong>
                </div>
                <div class="s3-slack-reactions">
                  <span class="s3-slack-react-badge">😱 9</span>
                  <span class="s3-slack-react-badge">🚨 14</span>
                </div>
              </div>
            </div>

            <!-- Message 2 (Sarah Legal Counsel) -->
            <div class="s3-slack-msg" id="s3SlackMsg2">
              <div class="s3-slack-avatar" style="background: #ffe4e6;">⚖️</div>
              <div class="s3-slack-msg-content">
                <div class="s3-slack-msg-author">
                  <span style="color: #be123c;">Sarah (Legal Counsel)</span>
                  <span class="s3-slack-msg-time">10:32 AM</span>
                </div>
                <div class="s3-slack-msg-text" style="color: #991b1b; font-weight: 700;">
                  🚨 @here Who authorized this?? Our policy is strictly 12 weeks unpaid. Sent straight to Legal!
                </div>
                <div class="s3-slack-reactions">
                  <span class="s3-slack-react-badge" style="background: #fef2f2; color: #dc2626; border-color: #fecaca;">⚠️ 18</span>
                </div>
              </div>
            </div>

            <!-- Message 3 (DevOps Lead) -->
            <div class="s3-slack-msg" id="s3SlackMsg3">
              <div class="s3-slack-avatar" style="background: #fef3c7;">🚨</div>
              <div class="s3-slack-msg-content">
                <div class="s3-slack-msg-author">
                  <span style="color: #b45309;">Dave (On-Call SRE)</span>
                  <span class="s3-slack-msg-time">10:33 AM</span>
                </div>
                <div class="s3-slack-msg-text" style="color: #475569;">
                  Shutting down inference gateway. Sev-1 incident ticket created.
                </div>
              </div>
            </div>
          </div>
        </div>
      `;

      // ── Beat 5: Prompt Tweak Simulation ──
      const promptHtml = `
        <div class="s3-right-hud-card" id="s3PromptSim" style="border-left: 5px solid #6366f1;">
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="font-size: 11.5px; font-weight: 800; color: #4338ca; text-transform: uppercase;">
              ⚠️ Frantic Instinct: Prompt Tweaking
            </span>
            <span style="font-size: 10px; font-weight: 700; color: #4338ca; background: #e0e7ff; padding: 2px 7px; border-radius: 4px;">
              System Prompt Sandbox
            </span>
          </div>
          <div style="font-size: 12px; color: #475569; margin-top: 6px;">
            Your first reflex is to type frantic instructions to force truthfulness:
          </div>
          <div class="s3-prompt-codebox">
            <span style="color: #94a3b8;"># Attempting to prompt away the hallucination...</span><br>
            <span style="color: #f472b6;">system_prompt</span> = <span style="color: #a5f3fc;">"""</span><br>
            &nbsp;&nbsp;<span id="s3TypedText" style="color: #fde047; font-weight: 600;"></span><span class="s3-caret"></span><br>
            <span style="color: #a5f3fc;">"""</span>
          </div>
          <div id="s3PromptEffectBadge" style="margin-top: 8px; font-size: 10.5px; font-weight: 700; color: #dc2626; opacity: 0; transition: opacity 0.3s ease;">
            ❌ Result: Changes Nothing. The bot keeps making things up!
          </div>
        </div>
      `;

      // ── Beat 6: Golden Pipeline Teleprompter Ribbon (Top-Center) ──
      const thesisHtml = `
        <div class="s3-thesis-ribbon" id="s3ThesisBanner">
          <div class="s3-thesis-side" style="color: #b45309;">
            <span>🎭</span>
            <span>The LLM is just the final Actor</span>
          </div>
          <span style="color: #d97706; font-weight: 900; font-size: 14px;">➔</span>
          <div class="s3-thesis-side" style="color: #047857;">
            <span>📜</span>
            <span>The Pipeline is the Teleprompter</span>
          </div>
        </div>
      `;

      // ── Beats 7-9: 3 Diagnostic Zone Telemetry Cards ──
      const zonesHtml = `
        <!-- Zone 1: Indexing & Boundary Slicing -->
        <div class="s3-zone-card s3-zone-1" id="s3ZoneCard1">
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
            <span style="font-size: 13.5px; font-weight: 800; color: #b91c1c;">
              Zone 1: Indexing Breakdown (Chunk Slicing)
            </span>
            <span style="font-size: 10px; font-weight: 800; color: #b91c1c; background: #fee2e2; padding: 2px 7px; border-radius: 4px;">
              Data Prep Error
            </span>
          </div>
          <div style="font-size: 12px; color: #334155; line-height: 1.45; margin-bottom: 6px;">
            The chunker sliced a critical sentence in half before any query was even asked:
          </div>
          <div class="s3-chunk-split-wrap" id="s3ChunkSplit">
            <div class="s3-chunk-crack-badge" id="s3ChunkCrack">⚡ SENTENCE SPLIT IN HALF</div>
            <div class="s3-chunk-block s3-chunk-left" id="s3Chunk41">
              <span style="font-weight: 700; color: #b91c1c;">Chunk #41:</span><br>
              "Employees are entitled to unlimited leave..."
            </div>
            <div class="s3-chunk-block s3-chunk-right" id="s3Chunk42">
              <span style="font-weight: 700; color: #0f172a;">Chunk #42:</span><br>
              "...upon written VP approval and unpaid only."
            </div>
          </div>
          <div style="font-size: 10.5px; font-weight: 700; color: #dc2626; margin-top: 6px;">
            ⚠️ Damage was already done at ingestion time — No prompt can fix this!
          </div>
        </div>

        <!-- Zone 2: Retrieval & Semantic Blind Spot -->
        <div class="s3-zone-card s3-zone-2" id="s3ZoneCard2">
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
            <span style="font-size: 13.5px; font-weight: 800; color: #b45309;">
              Zone 2: Retrieval Breakdown (Semantic Blind Spot)
            </span>
            <span style="font-size: 10px; font-weight: 800; color: #b45309; background: #fef3c7; padding: 2px 7px; border-radius: 4px;">
              Search Miss
            </span>
          </div>
          <div style="font-size: 12px; color: #334155; line-height: 1.45; margin-bottom: 6px;">
            The policy was in the vector DB, but vocabulary mismatch missed the top-k cutoff:
          </div>
          <div style="background: #fffbeb; border: 1px solid #fde68a; border-radius: 8px; padding: 8px 12px;">
            <div style="display: flex; justify-content: space-between; align-items: center;">
              <div style="font-size: 10.5px; color: #78350f;">
                <strong>Query:</strong> "time off policy"<br>
                <strong>Handbook:</strong> "accrued statutory leave"
              </div>
              <div style="text-align: right;">
                <span id="s3CosineValue" style="font-size: 11px; font-weight: 900; color: #b45309; font-family: monospace;">Cosine: 0.52 ❌</span><br>
                <span style="font-size: 9px; color: #92400e;">(Cutoff: 0.75)</span>
              </div>
            </div>
            <!-- Dynamic Cosine Similarity Gauge -->
            <div class="s3-cosine-gauge-track">
              <div class="s3-cosine-threshold-marker" title="0.75 Top-K Cutoff"></div>
              <div class="s3-cosine-gauge-fill" id="s3CosineBar"></div>
            </div>
            <div style="display: flex; justify-content: space-between; font-size: 8.5px; color: #92400e; margin-top: 2px;">
              <span>0.00 (Unrelated)</span>
              <span style="color: #dc2626; font-weight: 800;">Threshold: 0.75</span>
              <span>1.00 (Exact)</span>
            </div>
          </div>
          <div style="font-size: 10.5px; font-weight: 700; color: #b45309; margin-top: 6px;">
            ⚠️ Low cosine similarity pulled cafeteria policy chunks instead!
          </div>
        </div>

        <!-- Zone 3: Generation & Attention Dilution -->
        <div class="s3-zone-card s3-zone-3" id="s3ZoneCard3">
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
            <span style="font-size: 13.5px; font-weight: 800; color: #6d28d9;">
              Zone 3: Generation Breakdown (Attention Drift)
            </span>
            <span style="font-size: 10px; font-weight: 800; color: #6d28d9; background: #f3e8ff; padding: 2px 7px; border-radius: 4px;">
              Lost in the Middle
            </span>
          </div>
          <div style="font-size: 12px; color: #334155; line-height: 1.45; margin-bottom: 6px;">
            Retrieval succeeded, but the correct chunk was buried inside 8,000 prompt tokens:
          </div>
          <div style="background: #faf5ff; border: 1px solid #e9d5ff; border-radius: 8px; padding: 8px 12px; font-size: 10.5px;">
            <div style="display: flex; justify-content: space-between; color: #6b21a8; font-weight: 700; margin-bottom: 4px;">
              <span>Context Window: 8,000 Tokens</span>
              <span id="s3AttentionStatus" style="font-size: 9.5px; font-weight: 800; color: #7c3aed;">Attention Dilution Active</span>
            </div>
            <!-- Dynamic Token Attention Strip -->
            <div class="s3-attention-strip" id="s3AttentionStrip">
              <div class="s3-token-cell edge" title="System Prompt">SYS</div>
              <div class="s3-token-cell edge" title="Early Tokens">DOC</div>
              <div class="s3-token-cell" title="Token Noise">#1k</div>
              <div class="s3-token-cell" title="Token Noise">#2k</div>
              <div class="s3-token-cell" title="Token Noise">#3k</div>
              <div class="s3-token-cell target" id="s3TargetToken" title="Target Needle #4,200">📌</div>
              <div class="s3-token-cell" title="Token Noise">#5k</div>
              <div class="s3-token-cell" title="Token Noise">#6k</div>
              <div class="s3-token-cell" title="Token Noise">#7k</div>
              <div class="s3-token-cell edge" title="Query & Instructions">USER</div>
            </div>
            <div style="background: #ffffff; border: 1px solid #d8b4fe; border-radius: 4px; padding: 4px 8px; color: #581c87; font-size: 10px; margin-top: 4px;">
              Target Needle buried at #4,200 ➔ Attention heads dilute ➔ Model falls back on guessing!
            </div>
          </div>
          <div style="font-size: 10.5px; font-weight: 700; color: #6b21a8; margin-top: 6px;">
            ⚠️ Ground truth was right inside context, but LLM lost the needle and hallucinated!
          </div>
        </div>
      `;

      // ── Bottom Master Diagnostic Ribbon ──
      const ribbonHtml = `
        <div class="s3-triage-ribbon" id="s3TriageRibbon">
          <div class="s3-triage-node node-1" id="s3Node1" onclick="window.Slide03KineticOverlay && window.Slide03KineticOverlay.manualSelect(1)">
            <span>✂️ 1. Indexing Audit</span>
          </div>
          <span style="color: #94a3b8; font-size: 11px;">➔</span>
          <div class="s3-triage-node node-2" id="s3Node2" onclick="window.Slide03KineticOverlay && window.Slide03KineticOverlay.manualSelect(2)">
            <span>🧭 2. Retrieval Audit</span>
          </div>
          <span style="color: #94a3b8; font-size: 11px;">➔</span>
          <div class="s3-triage-node node-3" id="s3Node3" onclick="window.Slide03KineticOverlay && window.Slide03KineticOverlay.manualSelect(3)">
            <span>💡 3. Generation Audit</span>
          </div>
        </div>
      `;

      this.container.innerHTML = notebookHtml + hallucinationHtml + slackHtml + promptHtml + thesisHtml + zonesHtml + ribbonHtml;
      hostElement.appendChild(this.container);
      this.syncToTime(0);
    }

    /**
     * Precision Narration Synchronization & Micro-Animations
     * Driven by Whisper Word Timestamps for RAG_Day01_Slide03.mp3 (131.10s)
     */
    syncToTime(t) {
      if (!this.container) return;

      const notebookCard = document.getElementById('s3NotebookCard');
      const hallModal = document.getElementById('s3HallucinationModal');
      const botBubble = document.getElementById('s3BotBubble');
      const stamp = document.getElementById('s3StampBadge');
      const slackWin = document.getElementById('s3SlackWindow');
      const slackBadge = document.getElementById('s3SlackBadge');
      const slackBody = document.getElementById('s3SlackBody');
      const msg1 = document.getElementById('s3SlackMsg1');
      const msg2 = document.getElementById('s3SlackMsg2');
      const msg3 = document.getElementById('s3SlackMsg3');
      const promptSim = document.getElementById('s3PromptSim');
      const typedText = document.getElementById('s3TypedText');
      const promptEffect = document.getElementById('s3PromptEffectBadge');
      const thesis = document.getElementById('s3ThesisBanner');
      const zone1 = document.getElementById('s3ZoneCard1');
      const chunkSplit = document.getElementById('s3ChunkSplit');
      const zone2 = document.getElementById('s3ZoneCard2');
      const cosineBar = document.getElementById('s3CosineBar');
      const cosineValue = document.getElementById('s3CosineValue');
      const zone3 = document.getElementById('s3ZoneCard3');
      const attentionStrip = document.getElementById('s3AttentionStrip');
      const ribbon = document.getElementById('s3TriageRibbon');
      const node1 = document.getElementById('s3Node1');
      const node2 = document.getElementById('s3Node2');
      const node3 = document.getElementById('s3Node3');

      // ── 1. Beat 2: Notebook Flashback Success Card (14.66s -> 25.90s) ──
      if (notebookCard) {
        if (t >= 14.66 && t < 25.90) notebookCard.classList.add('is-visible');
        else notebookCard.classList.remove('is-visible');
      }

      // ── 2. Beat 3: Executive Hallucination Modal (25.90s -> 38.14s) ──
      if (hallModal) {
        if (t >= 25.90 && t < 38.14) {
          hallModal.classList.add('is-visible');
          if (botBubble) {
            if (t >= 28.40) {
              botBubble.style.opacity = '1';
              botBubble.style.transform = 'translateY(0)';
            } else {
              botBubble.style.opacity = '0';
              botBubble.style.transform = 'translateY(8px)';
            }
          }
          // Exact audio cue for "six months fully paid": word "six" starts at 35.48s
          if (stamp) {
            if (t >= 35.48) stamp.classList.add('is-stamped');
            else stamp.classList.remove('is-stamped');
          }
        } else {
          hallModal.classList.remove('is-visible');
        }
      }

      // ── 3. Beat 4: Live Scrolling Slack War Room (38.14s -> 48.08s) ──
      if (slackWin) {
        if (t >= 38.14 && t < 48.08) {
          slackWin.classList.add('is-visible');

          // Dynamic unread badge increments (40.5s: 18 unread, 44.0s: 24 unread)
          if (slackBadge) {
            if (t >= 44.0) {
              slackBadge.textContent = '24 unread';
              slackBadge.classList.add('is-popped');
            } else if (t >= 40.5) {
              slackBadge.textContent = '18 unread';
              slackBadge.classList.add('is-popped');
            } else {
              slackBadge.textContent = '12 unread';
              slackBadge.classList.remove('is-popped');
            }
          }

          // Message 1: VP Ops screenshot drops at exact cue "Someone took a screenshot of the answer" (41.74s)
          if (msg1) {
            if (t >= 41.74) msg1.classList.add('is-dropped');
            else msg1.classList.remove('is-dropped');
          }

          // Message 2: Sarah Legal Counsel at exact cue "and sent it straight to Legal" (43.80s)
          if (msg2) {
            if (t >= 43.80) {
              msg2.classList.add('is-dropped');
              if (slackBody) slackBody.scrollTop = 75;
            } else {
              msg2.classList.remove('is-dropped');
              if (slackBody) slackBody.scrollTop = 0;
            }
          }

          // Message 3: Dave DevOps at 45.40s with final scroll
          if (msg3) {
            if (t >= 45.40) {
              msg3.classList.add('is-dropped');
              if (slackBody) slackBody.scrollTop = 160;
            } else {
              msg3.classList.remove('is-dropped');
            }
          }
        } else {
          slackWin.classList.remove('is-visible');
        }
      }

      // ── 4. Beat 5: Prompt Tweak Simulation (48.08s -> 60.22s) ──
      if (promptSim) {
        if (t >= 48.08 && t < 60.22) {
          promptSim.classList.add('is-visible');
          if (typedText) {
            const phrase1 = "You are a truthful assistant.";
            const phrase2 = " Under no circumstances should you lie.";

            if (t < 52.56) {
              typedText.textContent = "";
            } else if (t < 53.94) {
              // Typing Phrase 1 (52.56s to 53.94s - narrator says "You are a truthful assistant")
              const p = (t - 52.56) / (53.94 - 52.56);
              typedText.textContent = phrase1.substring(0, Math.floor(p * phrase1.length));
            } else if (t < 54.20) {
              typedText.textContent = phrase1;
            } else if (t < 56.20) {
              // Typing Phrase 2 (54.20s to 56.20s - narrator says "Under no circumstances should you lie")
              const p = (t - 54.20) / (56.20 - 54.20);
              typedText.textContent = phrase1 + phrase2.substring(0, Math.floor(p * phrase2.length));
            } else {
              typedText.textContent = phrase1 + phrase2;
            }
          }

          // Warning badge pops at exact cue "It changes nothing" (56.60s)
          if (promptEffect) {
            promptEffect.style.opacity = t >= 56.60 ? '1' : '0';
          }
        } else {
          promptSim.classList.remove('is-visible');
        }
      }

      // ── 5. Beat 6: Minimalist Golden Teleprompter Thesis (60.22s -> 73.78s) ──
      if (thesis) {
        if (t >= 60.22 && t < 73.78) thesis.classList.add('is-visible');
        else thesis.classList.remove('is-visible');
      }

      // ── 6. Beat 7: Zone 1 Indexing Breakdown (73.78s -> 86.42s) ──
      if (zone1) {
        if (t >= 73.78 && t < 86.42) {
          zone1.classList.add('is-visible');
          // Chunk splitting animation at cue "sliced a sentence in half" (75.80s)
          if (chunkSplit) {
            if (t >= 75.80) chunkSplit.classList.add('is-split');
            else chunkSplit.classList.remove('is-split');
          }
        } else {
          zone1.classList.remove('is-visible');
          if (chunkSplit) chunkSplit.classList.remove('is-split');
        }
      }

      // ── 7. Beat 8: Zone 2 Retrieval Breakdown (86.42s -> 106.64s) ──
      if (zone2) {
        if (t >= 86.42 && t < 106.64) {
          zone2.classList.add('is-visible');
          // Dynamic Cosine Gauge fills and turns red at cue "Low cosine similarity" (98.50s - 101.40s)
          if (cosineBar) {
            if (t >= 101.40) {
              cosineBar.style.width = '52%';
              cosineBar.style.background = '#ef4444';
            } else if (t >= 98.50) {
              cosineBar.style.width = '52%';
              cosineBar.style.background = '#f59e0b';
            } else {
              cosineBar.style.width = '0%';
            }
          }
          if (cosineValue) {
            cosineValue.style.color = t >= 101.40 ? '#dc2626' : '#b45309';
          }
        } else {
          zone2.classList.remove('is-visible');
          if (cosineBar) cosineBar.style.width = '0%';
        }
      }

      // ── 8. Beat 9: Zone 3 Generation Breakdown (106.64s -> 125.58s) ──
      if (zone3) {
        if (t >= 106.64 && t < 125.58) {
          zone3.classList.add('is-visible');
          // Attention Dilution activates at cue "surrounded by thousands of competing tokens" (118.52s)
          if (attentionStrip) {
            if (t >= 118.52) attentionStrip.classList.add('is-diluted');
            else attentionStrip.classList.remove('is-diluted');
          }
        } else {
          zone3.classList.remove('is-visible');
          if (attentionStrip) attentionStrip.classList.remove('is-diluted');
        }
      }

      // ── 9. Bottom Master Triage Ribbon & Beat 10 Golden Finale (73.04s -> 131.10s) ──
      if (ribbon) {
        if (t >= 73.04) {
          ribbon.classList.add('is-visible');

          if (t >= 125.58) {
            // Beat 10 Finale: The Golden Climax — all 3 nodes illuminate together in unison!
            ribbon.classList.add('is-finale');
            if (node1) { node1.classList.remove('is-active'); node1.classList.add('is-finale-glow'); }
            if (node2) { node2.classList.remove('is-active'); node2.classList.add('is-finale-glow'); }
            if (node3) { node3.classList.remove('is-active'); node3.classList.add('is-finale-glow'); }
          } else {
            ribbon.classList.remove('is-finale');
            if (node1) {
              node1.classList.remove('is-finale-glow');
              node1.classList.toggle('is-active', t >= 73.78 && t < 86.42);
            }
            if (node2) {
              node2.classList.remove('is-finale-glow');
              node2.classList.toggle('is-active', t >= 86.42 && t < 106.64);
            }
            if (node3) {
              node3.classList.remove('is-finale-glow');
              node3.classList.toggle('is-active', t >= 106.64 && t < 125.58);
            }
          }
        } else {
          ribbon.classList.remove('is-visible');
          ribbon.classList.remove('is-finale');
          if (node1) { node1.classList.remove('is-active', 'is-finale-glow'); }
          if (node2) { node2.classList.remove('is-active', 'is-finale-glow'); }
          if (node3) { node3.classList.remove('is-active', 'is-finale-glow'); }
        }
      }
    }

    manualSelect(zoneIdx) {
      const timings = { 1: 73.78, 2: 86.42, 3: 106.64 };
      if (window.ragAnimator && typeof window.ragAnimator.seek === 'function' && timings[zoneIdx]) {
        window.ragAnimator.seek(timings[zoneIdx] + 0.1);
      }
    }

    destroy() {
      if (this.container && this.container.parentNode) {
        this.container.parentNode.removeChild(this.container);
      }
      this.container = null;
    }
  }

  const overlayInstance = new Slide03KineticOverlay();
  root.Slide03KineticOverlay = overlayInstance;

  function mountSlide03KineticOverlay(container, masterTimeline) {
    if (!container) return;
    overlayInstance.mount(container);

    if (masterTimeline) {
      // Continuous timeline sync hook (runs on every frame & seek)
      masterTimeline.to({}, {
        duration: 131.10,
        onUpdate: function() {
          const t = masterTimeline.time();
          overlayInstance.syncToTime(t);
        }
      }, 0.0);
    }
  }

  root.mountSlide03KineticOverlay = mountSlide03KineticOverlay;
})(window);
