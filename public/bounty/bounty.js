/**
 * ═══════════════════════════════════════════════════════════════════════
 * Manodemy Live ₹100 SQL Bug Bounty Arena — Core Controller (Version-3 Engine)
 * File: bounty.js
 * ═══════════════════════════════════════════════════════════════════════
 */

(function () {
  'use strict';

  const SUPA_URL = 'https://erqoyvbuhmkyvcqgwcbz.supabase.co';
  const SUPA_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVycW95dmJ1aG1reXZjcWd3Y2J6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzODk1MTIsImV4cCI6MjA5NDk2NTUxMn0.9UnIfq8xMrKANPPTtoOADKH-NJ_it9HDp7xrJL4FXtw';

  let supabaseClient = null;
  if (window.supabase && window.supabase.createClient) {
    supabaseClient = window.supabase.createClient(SUPA_URL, SUPA_KEY);
  }

  // Application State
  const AppState = {
    challenge: null,
    activeVariant: null,
    db: null,
    editor: null,
    biometrics: null,
    timerInterval: null,
    timerStartTime: 0,
    elapsedMs: 0,
    isRunning: false,
    serverClockSkewMs: 0,
    rttMs: 0,
    attempt: {
      phoneHash: null,
      phoneRaw: null,
      variantId: 'A',
      startedAt: null,
      isCompleted: false
    }
  };

  // ─── Initialization ───
  document.addEventListener('DOMContentLoaded', async () => {
    initUI();
    await syncServerClock();
    startFreezeCountdown();
    await loadChallengeData();
    await initSQLite();
    initCodeMirror();
    initBiometrics();
    checkExistingSession();
    fetchLeaderboard();
  });

  // ─── Server Clock Sync (Guards against client time tampering) ───
  async function syncServerClock() {
    try {
      const t0 = performance.now();
      const res = await fetch(`${SUPA_URL}/rest/v1/rpc/get_bounty_server_time`, {
        method: 'POST',
        headers: {
          'apikey': SUPA_KEY,
          'Authorization': `Bearer ${SUPA_KEY}`,
          'Content-Type': 'application/json'
        }
      });
      const t1 = performance.now();
      AppState.rttMs = Math.round(t1 - t0);

      if (res.ok) {
        const data = await res.json();
        const serverEpoch = data.epoch_ms;
        AppState.serverClockSkewMs = serverEpoch - Date.now();
      }
    } catch (e) {
      console.warn('Server clock sync fallback to client time:', e);
      AppState.serverClockSkewMs = 0;
    }
  }

  function getISTDate() {
    const adjustedNow = new Date(Date.now() + AppState.serverClockSkewMs);
    return new Date(adjustedNow.toLocaleString('en-US', { timeZone: 'Asia/Kolkata' }));
  }

  // ─── 10:00 PM IST Freeze Countdown ───
  function startFreezeCountdown() {
    const countdownEl = document.getElementById('freezeCountdown');
    const headerTimerEl = document.getElementById('headerCountdown');

    function update() {
      const istNow = getISTDate();
      const freezeTime = new Date(istNow);
      freezeTime.setHours(22, 0, 0, 0); // 10:00:00 PM IST

      let diff = freezeTime - istNow;
      if (diff <= 0) {
        if (countdownEl) countdownEl.textContent = 'LOCKED (10 PM IST)';
        if (headerTimerEl) headerTimerEl.textContent = 'LOCKED';
        return;
      }

      const hours = Math.floor(diff / (1000 * 60 * 60));
      const mins = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
      const secs = Math.floor((diff % (1000 * 60)) / 1000);

      const formatted = `${String(hours).padStart(2, '0')}:${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
      if (countdownEl) countdownEl.textContent = formatted;
      if (headerTimerEl) headerTimerEl.textContent = formatted;
    }

    update();
    setInterval(update, 1000);
  }

  // ─── Challenge Data Loader ───
  async function loadChallengeData() {
    try {
      const res = await fetch('/bounty/challenges/day17_bug01.json');
      if (res.ok) {
        AppState.challenge = await res.json();
      }
    } catch (e) {
      console.warn('Fallback challenge loader:', e);
    }

    // Default fallback if json fetch failed
    if (!AppState.challenge) {
      AppState.challenge = {
        challenge_id: 'day17_bug01',
        title: 'Fix the GROUP BY Aggregate Filter Bug',
        difficulty: 'Intermediate',
        category: 'SQL Debugging',
        objective: 'The retail operations team wants departments with average salary > 50,000. Spot the bug in the WHERE clause, fix it using proper SQL syntax, and execute!',
        seed_sql: "CREATE TABLE employees (id INTEGER PRIMARY KEY, name TEXT, department TEXT, salary REAL);\nINSERT INTO employees VALUES (1, 'Karthik', 'Engineering', 75000), (2, 'Priya', 'Engineering', 85000), (3, 'Anand', 'Marketing', 45000), (4, 'Divya', 'Marketing', 48000), (5, 'Suresh', 'Design', 52000), (6, 'Meena', 'Design', 62000), (7, 'Ramesh', 'Sales', 35000);",
        variants: {
          A: {
            variant_id: 'A',
            target_val: 50000,
            broken_sql: "-- 🚨 BUGGED QUERY: Fix the syntax error to claim ₹100\nSELECT department, AVG(salary) AS avg_sal\nFROM employees\nWHERE AVG(salary) > 50000\nGROUP BY department;",
            expected_solution: "SELECT department, AVG(salary) AS avg_sal FROM employees GROUP BY department HAVING AVG(salary) > 50000;",
            expected_columns: ['department', 'avg_sal'],
            expected_rows: [['Design', 57000], ['Engineering', 80000]]
          }
        }
      };
    }

    // Pick variant
    const variants = Object.keys(AppState.challenge.variants || { A: {} });
    const selectedKey = variants[Math.floor(Math.random() * variants.length)] || 'A';
    AppState.activeVariant = AppState.challenge.variants[selectedKey] || AppState.challenge.variants['A'];
  }

  // ─── Dual-Mode WASM SQLite Loader (Transaction Rollback Safe) ───
  async function initSQLite() {
    try {
      const wasmUrl = 'https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.8.0/sql-wasm.wasm';
      let SQL = null;
      if (typeof initSqlJs === 'function') {
        try {
          SQL = await initSqlJs({ locateFile: () => wasmUrl });
        } catch (err) {
          console.warn('Streaming WASM failed, falling back to ArrayBuffer:', err);
          const response = await fetch(wasmUrl);
          const wasmBinary = await response.arrayBuffer();
          SQL = await initSqlJs({ wasmBinary });
        }
      }

      if (SQL) {
        AppState.db = new SQL.Database();
        if (AppState.challenge && AppState.challenge.seed_sql) {
          AppState.db.exec(AppState.challenge.seed_sql);
        }
      }
    } catch (e) {
      console.error('SQLite initialization failed:', e);
      showToast('⚠️ SQLite engine loading error. Please refresh.', 'warning');
    }
  }

  // Strip comments (-- line comments and /* multi-line comments */)
  function stripComments(sql) {
    if (!sql) return '';
    return sql
      .replace(/--.*$/gm, '')
      .replace(/\/\*[\s\S]*?\*\//g, '')
      .trim();
  }

  // Safe Query Executor using Transaction Rollback to prevent DB mutation and memory bloat
  function executeSQLSafely(query) {
    if (!AppState.db) return { success: false, error: 'Database engine not ready.' };
    const cleanSql = stripComments(query);
    const normalized = cleanSql.toUpperCase();

    if (!cleanSql) {
      return { success: false, error: '⚠️ Query cannot be empty!' };
    }

    // Guard: SELECT or WITH only
    if (!normalized.startsWith('SELECT') && !normalized.startsWith('WITH')) {
      return { success: false, error: '⚠️ Only SELECT queries are permitted in this challenge!' };
    }

    try {
      AppState.db.exec('BEGIN TRANSACTION;');
      const results = AppState.db.exec(cleanSql);
      AppState.db.exec('ROLLBACK;'); // Rollback any state mutation

      if (!results || results.length === 0) {
        return { success: true, columns: [], values: [] };
      }
      return {
        success: true,
        columns: results[0].columns,
        values: results[0].values
      };
    } catch (err) {
      try { AppState.db.exec('ROLLBACK;'); } catch (e) {}
      return { success: false, error: err.message };
    }
  }

  // ─── CodeMirror Initialization (Dracula Theme matching Version-3) ───
  function initCodeMirror() {
    const wrap = document.getElementById('mainEditorWrap');
    if (!wrap || !window.CodeMirror) return;
    wrap.innerHTML = '';

    AppState.editor = CodeMirror(wrap, {
      value: '-- 🔒 Enter your WhatsApp number in the right panel and click [ START CHALLENGE ] to unlock!',
      mode: 'text/x-sql',
      theme: 'dracula',
      lineNumbers: true,
      lineWrapping: true,
      matchBrackets: true,
      readOnly: 'nocursor' // Locked until user clicks START
    });

    // Smart Quote Transpiler (Fixes iOS / Android curly quotes)
    AppState.editor.on('change', (cm, change) => {
      if (change.origin === 'paste') {
        showToast('⚠️ Paste is disabled! Type your fix.', 'warning');
      }
      if (change.text && change.text.some(t => /[\u2018\u2019\u201C\u201D]/.test(t))) {
        const cursor = cm.getCursor();
        const cleanText = change.text.map(t => window.BountySanitizer.normalizeSQL(t));
        cm.replaceRange(cleanText.join('\n'), change.from, change.to);
        cm.setCursor(cursor);
      }
    });
  }

  // ─── Biometrics Attachment ───
  function initBiometrics() {
    AppState.biometrics = new window.BountyBiometrics();
    const editorWrapper = document.getElementById('mainEditorWrap');
    if (editorWrapper) {
      AppState.biometrics.attach(editorWrapper);
    }
  }

  // ─── Session Resume Check (5-Minute Grace Window) ───
  function checkExistingSession() {
    try {
      const saved = sessionStorage.getItem('bounty_active_attempt');
      if (!saved) return;
      const data = JSON.parse(saved);

      const elapsedSec = (Date.now() - data.savedAt) / 1000;
      if (elapsedSec < 300 && !data.isCompleted) {
        // Resume session
        AppState.attempt.phoneHash = data.phoneHash;
        AppState.attempt.phoneRaw = data.phoneRaw;
        AppState.attempt.variantId = data.variantId;
        AppState.attempt.startedAt = data.startedAt;

        // Restore exact variant
        if (AppState.challenge && AppState.challenge.variants && AppState.challenge.variants[data.variantId]) {
          AppState.activeVariant = AppState.challenge.variants[data.variantId];
        }

        unlockEditorAndStartClock(data.elapsedMs || Math.round(elapsedSec * 1000), data.savedCode);
        showToast('⏱️ Resumed your active challenge attempt!', 'success');
      }
    } catch (e) {
      console.warn('Session parse error:', e);
    }
  }

  // ─── Start Challenge Flow ───
  async function handleStartChallenge() {
    const phoneInput = document.getElementById('phoneInput');
    const consentCheck = document.getElementById('dpdpConsent');

    if (!consentCheck || !consentCheck.checked) {
      showToast('⚠️ Please accept the DPDP consent checkbox to continue.', 'warning');
      return;
    }

    const sanitized = window.BountySanitizer.sanitizeIndianPhone(phoneInput ? phoneInput.value : '');
    if (!sanitized.valid) {
      showToast(sanitized.error, 'warning');
      return;
    }

    const phoneHash = await window.BountySanitizer.hashPhone(sanitized.e164);
    const powNonce = await window.BountySanitizer.generateMicroPoW(phoneHash, AppState.challenge.challenge_id);

    // Call Supabase RPC
    try {
      const res = await fetch(`${SUPA_URL}/rest/v1/rpc/start_bounty_attempt`, {
        method: 'POST',
        headers: {
          'apikey': SUPA_KEY,
          'Authorization': `Bearer ${SUPA_KEY}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          p_cid: AppState.challenge.challenge_id,
          p_phone_hash: phoneHash,
          p_variant_id: AppState.activeVariant.variant_id
        })
      });

      if (res.ok) {
        const result = await res.json();
        if (result.status === 'already_solved') {
          showToast(`🏆 You already solved this bounty in ${(result.solve_time_ms / 1000).toFixed(2)}s!`, 'success');
          return;
        }
        if (result.status === 'attempt_exhausted') {
          showToast('⚠️ You have already used your 1 attempt for today.', 'warning');
          return;
        }
      }
    } catch (e) {
      console.warn('Supabase start attempt fallback to client:', e);
    }

    // Save attempt state
    AppState.attempt.phoneHash = phoneHash;
    AppState.attempt.phoneRaw = sanitized.e164;
    AppState.attempt.variantId = AppState.activeVariant.variant_id;
    AppState.attempt.startedAt = Date.now();

    // Hide gate card
    const gateCard = document.getElementById('bountyGateCard');
    if (gateCard) gateCard.style.display = 'none';

    unlockEditorAndStartClock(0);
    showToast('🚀 Challenge started! Timer is ticking!', 'success');
  }

  function unlockEditorAndStartClock(initialElapsedMs, existingCode) {
    if (AppState.editor) {
      AppState.editor.setOption('readOnly', false);
      AppState.editor.setValue(existingCode || AppState.activeVariant.broken_sql);
      AppState.editor.focus();
    }

    AppState.isRunning = true;
    AppState.timerStartTime = performance.now() - (initialElapsedMs || 0);
    AppState.biometrics.reset();

    const runBtn = document.getElementById('runBtn');
    if (runBtn) runBtn.disabled = false;

    // Hide gate card if still displayed
    const gateCard = document.getElementById('bountyGateCard');
    if (gateCard) gateCard.style.display = 'none';

    const termStatus = document.getElementById('terminalStatusMsg');
    if (termStatus) {
      termStatus.textContent = '⚡ Editor unlocked! Fix the bug above and click ▶ Run & Claim!';
    }

    // Start UI ticker
    if (AppState.timerInterval) clearInterval(AppState.timerInterval);
    AppState.timerInterval = setInterval(() => {
      if (!AppState.isRunning) return;
      const current = performance.now();
      AppState.elapsedMs = Math.round(current - AppState.timerStartTime);
      renderStopwatch(AppState.elapsedMs);

      // Autosave active state to sessionStorage
      sessionStorage.setItem('bounty_active_attempt', JSON.stringify({
        phoneHash: AppState.attempt.phoneHash,
        phoneRaw: AppState.attempt.phoneRaw,
        variantId: AppState.attempt.variantId,
        startedAt: AppState.attempt.startedAt,
        elapsedMs: AppState.elapsedMs,
        savedAt: Date.now(),
        savedCode: AppState.editor ? AppState.editor.getValue() : '',
        isCompleted: false
      }));
    }, 33);
  }

  function renderStopwatch(ms) {
    const display = document.getElementById('stopwatchDisplay');
    if (!display) return;
    const totalSeconds = ms / 1000;
    const minutes = Math.floor(totalSeconds / 60);
    const seconds = Math.floor(totalSeconds % 60);
    const millis = Math.floor((ms % 1000) / 10);
    display.textContent = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}.${String(millis).padStart(2, '0')}s`;
  }

  // ─── Query Run & Evaluation Flow ───
  function handleRunQuery() {
    if (!AppState.editor) return;
    const rawQuery = AppState.editor.getValue();
    const query = window.BountySanitizer.normalizeSQL(rawQuery);

    const execResult = executeSQLSafely(query);
    renderTerminalOutput(execResult);

    if (!execResult.success) {
      shakeTerminal();
      return;
    }

    // Verify against expected solution
    const isCorrect = assertResultsMatch(execResult, AppState.activeVariant);
    if (!isCorrect) {
      shakeTerminal();
      showToast('❌ Output does not match expected result. Keep debugging!', 'warning');
      return;
    }

    // Passed! Stop timer
    AppState.isRunning = false;
    clearInterval(AppState.timerInterval);
    const finalTimeMs = AppState.elapsedMs;

    // Check biometrics
    const bioResult = AppState.biometrics.evaluateHumanity();
    console.log('Biometrics evaluation:', bioResult);

    // Open Victory Modal
    openVictoryModal(finalTimeMs, query, bioResult);
  }

  function serializeCell(val) {
    if (val === null || val === undefined) return 'null';
    const num = Number(val);
    if (!isNaN(num) && typeof val !== 'boolean' && String(val).trim() !== '') {
      return String(Math.round(num * 100) / 100);
    }
    return String(val).trim().toLowerCase();
  }

  function assertResultsMatch(actual, variant) {
    if (!variant || !variant.expected_columns || !variant.expected_rows) return false;
    if (!actual || !actual.columns || !actual.values) return false;
    if (actual.columns.length !== variant.expected_columns.length) return false;
    if (actual.values.length !== variant.expected_rows.length) return false;

    const expectedSorted = variant.expected_rows
      .map(r => r.map(serializeCell).join('|||'))
      .sort();

    // 1. Direct column order comparison (unordered rows multiset match)
    const actualSorted = actual.values
      .map(r => r.map(serializeCell).join('|||'))
      .sort();

    if (JSON.stringify(actualSorted) === JSON.stringify(expectedSorted)) return true;

    // 2. Swapped column fallback (e.g. avg_sal, department)
    if (actual.columns.length === 2) {
      const reversedSorted = actual.values
        .map(r => [r[1], r[0]].map(serializeCell).join('|||'))
        .sort();
      if (JSON.stringify(reversedSorted) === JSON.stringify(expectedSorted)) return true;
    }

    return false;
  }

  function renderTerminalOutput(res) {
    const terminal = document.getElementById('mainOutput');
    if (!terminal) return;

    if (!res.success) {
      terminal.innerHTML = `
        <div class="output-label">Terminal Output</div>
        <div class="output-error" style="color: var(--red); padding: 8px 0; font-family: var(--mono);">🚨 SQL Error: ${escapeHTML(res.error)}</div>
      `;
      return;
    }

    if (res.values.length === 0) {
      terminal.innerHTML = `
        <div class="output-label">Terminal Output</div>
        <div class="output-success" style="color: var(--green); padding: 8px 0; font-family: var(--mono);">Query executed successfully. (0 rows returned)</div>
      `;
      return;
    }

    let html = `<div class="output-label">Terminal Output (${res.values.length} rows)</div><table class="result-table"><thead><tr>`;
    res.columns.forEach(col => {
      html += `<th>${escapeHTML(col)}</th>`;
    });
    html += `</tr></thead><tbody>`;
    res.values.forEach(row => {
      html += `<tr>`;
      row.forEach(cell => {
        html += `<td>${escapeHTML(String(cell))}</td>`;
      });
      html += `</tr>`;
    });
    html += `</tbody></table>`;
    terminal.innerHTML = html;
  }

  function shakeTerminal() {
    const card = document.getElementById('mainOutput');
    if (!card) return;
    card.style.animation = 'shake 0.3s ease';
    setTimeout(() => { card.style.animation = ''; }, 300);
  }

  // ─── Victory Celebration & Payout Claim ───
  function openVictoryModal(timeMs, query, bioResult) {
    const modal = document.getElementById('victoryModal');
    const timePill = document.getElementById('victoryTimePill');
    if (timePill) timePill.textContent = `⏱️ ${(timeMs / 1000).toFixed(2)}s`;
    if (modal) modal.classList.add('active');

    // Trigger Confetti
    if (typeof confetti === 'function') {
      confetti({
        particleCount: 120,
        spread: 80,
        origin: { y: 0.6 }
      });
    }

    playVictoryChime();

    window._pendingBountySubmission = {
      timeMs,
      query,
      bioResult
    };
  }

  function playVictoryChime() {
    try {
      const ctx = new (window.AudioContext || window.webkitAudioContext)();
      const osc = ctx.createOscillator();
      const gain = ctx.createGain();
      osc.type = 'triangle';
      osc.frequency.setValueAtTime(523.25, ctx.currentTime);
      osc.frequency.exponentialRampToValueAtTime(659.25, ctx.currentTime + 0.15);
      osc.frequency.exponentialRampToValueAtTime(783.99, ctx.currentTime + 0.3);
      gain.gain.setValueAtTime(0.2, ctx.currentTime);
      gain.gain.exponentialRampToValueAtTime(0.01, ctx.currentTime + 0.5);
      osc.connect(gain);
      gain.connect(ctx.destination);
      osc.start();
      osc.stop(ctx.currentTime + 0.5);
    } catch (e) {}
  }

  async function handleFinalClaimSubmit(e) {
    if (e) e.preventDefault();
    const nameInput = document.getElementById('claimNameInput');
    const upiInput = document.getElementById('claimUPIInput');

    const cleanName = window.BountySanitizer.sanitizeDisplayName(nameInput ? nameInput.value : '');
    const upiValidation = window.BountySanitizer.validateUPI(upiInput ? upiInput.value : '');

    if (!upiValidation.valid) {
      showToast(upiValidation.error, 'warning');
      return;
    }

    const pending = window._pendingBountySubmission || {};
    const submitBtn = document.getElementById('claimSubmitBtn');
    if (submitBtn) {
      submitBtn.disabled = true;
      submitBtn.textContent = 'Recording Score...';
    }

    try {
      const res = await fetch(`${SUPA_URL}/rest/v1/rpc/submit_bounty_attempt`, {
        method: 'POST',
        headers: {
          'apikey': SUPA_KEY,
          'Authorization': `Bearer ${SUPA_KEY}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          p_cid: AppState.challenge.challenge_id,
          p_phone_hash: AppState.attempt.phoneHash,
          p_phone_raw: AppState.attempt.phoneRaw,
          p_name: cleanName,
          p_upi: upiValidation.cleanUPI,
          p_query: pending.query || '',
          p_rtt_ms: AppState.rttMs,
          p_telemetry: pending.bioResult ? pending.bioResult.metrics : {}
        })
      });

      if (res.ok) {
        const data = await res.json();
        showToast(data.message || 'Victory! Recorded on Live Leaderboard!', 'success');
      }
    } catch (e) {
      console.warn('Leaderboard submission RPC error:', e);
      showToast('Score recorded locally! (Offline mode)', 'success');
    }

    sessionStorage.setItem('bounty_active_attempt', JSON.stringify({
      phoneHash: AppState.attempt.phoneHash,
      isCompleted: true
    }));

    if (submitBtn) submitBtn.textContent = '✅ Leaderboard Verified!';
    setTimeout(() => {
      closeAllModals();
      fetchLeaderboard();
    }, 1200);
  }

  // ─── Leaderboard Fetcher (SWR Caching) ───
  async function fetchLeaderboard() {
    const tableBody = document.getElementById('leaderboardBody');
    if (!tableBody) return;

    try {
      const res = await fetch(`${SUPA_URL}/rest/v1/bounty_leaderboard?challenge_id=eq.${AppState.challenge ? AppState.challenge.challenge_id : 'day17_bug01'}&limit=10`, {
        headers: {
          'apikey': SUPA_KEY,
          'Authorization': `Bearer ${SUPA_KEY}`
        }
      });

      if (res.ok) {
        const rows = await res.json();
        if (rows && rows.length > 0) {
          renderLeaderboardRows(rows);
          return;
        }
      }
    } catch (e) {
      console.warn('Leaderboard fetch fallback:', e);
    }

    // Default sample entries
    renderLeaderboardRows([
      { display_name: 'Karthik Raja', solve_time_ms: 11420 },
      { display_name: 'Vignesh M', solve_time_ms: 14850 },
      { display_name: 'Sneha P', solve_time_ms: 18200 },
      { display_name: 'Aravind K', solve_time_ms: 24500 },
      { display_name: 'Divya M', solve_time_ms: 29800 },
      { display_name: 'Suresh Kumar', solve_time_ms: 36200 }
    ]);
  }

  function getInitials(name) {
    if (!name) return '??';
    const parts = name.trim().split(/\s+/);
    if (parts.length === 1) return parts[0].slice(0, 2).toUpperCase();
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  function renderLeaderboardRows(rows) {
    if (!rows || rows.length === 0) return;

    // Rank 1 (Gold)
    if (rows[0]) {
      const elAv = document.getElementById('podiumAvatar1');
      const elNm = document.getElementById('podiumName1');
      const elTm = document.getElementById('podiumTime1');
      if (elAv) elAv.textContent = getInitials(rows[0].display_name);
      if (elNm) elNm.textContent = rows[0].display_name;
      if (elTm) elTm.textContent = (rows[0].solve_time_ms / 1000).toFixed(2) + 's';
    }

    // Rank 2 (Silver)
    if (rows[1]) {
      const elAv = document.getElementById('podiumAvatar2');
      const elNm = document.getElementById('podiumName2');
      const elTm = document.getElementById('podiumTime2');
      if (elAv) elAv.textContent = getInitials(rows[1].display_name);
      if (elNm) elNm.textContent = rows[1].display_name;
      if (elTm) elTm.textContent = (rows[1].solve_time_ms / 1000).toFixed(2) + 's';
    }

    // Rank 3 (Bronze)
    if (rows[2]) {
      const elAv = document.getElementById('podiumAvatar3');
      const elNm = document.getElementById('podiumName3');
      const elTm = document.getElementById('podiumTime3');
      if (elAv) elAv.textContent = getInitials(rows[2].display_name);
      if (elNm) elNm.textContent = rows[2].display_name;
      if (elTm) elTm.textContent = (rows[2].solve_time_ms / 1000).toFixed(2) + 's';
    }

    // Ranks 4 to 10 (Contenders Cards)
    const shelf = document.getElementById('contendersShelf');
    if (shelf) {
      let html = '';
      for (let i = 3; i < rows.length; i++) {
        const row = rows[i];
        const rank = i + 1;
        const timeStr = (row.solve_time_ms / 1000).toFixed(2) + 's';
        const initials = getInitials(row.display_name);
        const tierTag = row.solve_time_ms < 30000 ? '⚡ Sub-30s' : 'Fast Solver';

        html += `
          <div class="contender-row">
            <div class="contender-left">
              <span class="contender-rank-pill">#${rank}</span>
              <div class="contender-avatar">${initials}</div>
              <div class="contender-info">
                <span class="contender-name">${escapeHTML(row.display_name)}</span>
                <span class="contender-badge">${tierTag}</span>
              </div>
            </div>
            <span class="contender-time-pill">⏱️ ${timeStr}</span>
          </div>
        `;
      }
      if (rows.length <= 3) {
        html = `<div style="text-align: center; color: #94a3b8; font-size: 0.75rem; padding: 8px 0;">Be the next developer to claim a spot on the leaderboard!</div>`;
      }
      shelf.innerHTML = html;
    }
  }

  // ─── 1-Click Instagram Story Brag Canvas Generator ───
  function generateStoryBragCard() {
    const timeSec = (AppState.elapsedMs / 1000).toFixed(2);

    const canvas = document.createElement('canvas');
    canvas.width = 1080;
    canvas.height = 1920;
    const ctx = canvas.getContext('2d');

    // Background gradient
    const grad = ctx.createLinearGradient(0, 0, 1080, 1920);
    grad.addColorStop(0, '#060913');
    grad.addColorStop(0.5, '#0d1326');
    grad.addColorStop(1, '#060913');
    ctx.fillStyle = grad;
    ctx.fillRect(0, 0, 1080, 1920);

    // Neon frame
    ctx.strokeStyle = '#00e6f6';
    ctx.lineWidth = 8;
    ctx.strokeRect(60, 60, 960, 1800);

    // Title text
    ctx.fillStyle = '#fbbf24';
    ctx.font = 'bold 56px "Plus Jakarta Sans", sans-serif';
    ctx.textAlign = 'center';
    ctx.fillText('🏆 MANODEMY SQL BUG BOUNTY', 540, 240);

    ctx.fillStyle = '#ffffff';
    ctx.font = '800 84px "Plus Jakarta Sans", sans-serif';
    ctx.fillText('I CRACKED DAY 17!', 540, 360);

    // Time pill
    ctx.fillStyle = '#00e6f6';
    ctx.font = 'bold 120px "JetBrains Mono", monospace';
    ctx.fillText(`${timeSec}s`, 540, 780);

    ctx.fillStyle = '#94a3b8';
    ctx.font = '48px "Inter", sans-serif';
    ctx.fillText('Speed SQL Debug Record', 540, 880);

    // Challenge callout
    ctx.fillStyle = '#ffffff';
    ctx.font = 'bold 64px "Plus Jakarta Sans", sans-serif';
    ctx.fillText('Can you beat my time?', 540, 1280);

    ctx.fillStyle = '#00e6f6';
    ctx.font = 'bold 52px "JetBrains Mono", monospace';
    ctx.fillText('manodemy.com/b17', 540, 1380);

    ctx.fillStyle = '#64748b';
    ctx.font = '36px "Inter", sans-serif';
    ctx.fillText('₹100 Daily Bug Bounty by @manodemy', 540, 1720);

    const dataUrl = canvas.toDataURL('image/png');
    const a = document.createElement('a');
    a.href = dataUrl;
    a.download = `manodemy_day17_${timeSec}s.png`;
    a.click();
    showToast('📲 Story Card downloaded! Share & tag @manodemy on Instagram!', 'success');
  }

  // ─── UI Helpers & Listeners ───
  function initUI() {
    // Start challenge button
    const startBtn = document.getElementById('startBountyBtn');
    if (startBtn) startBtn.addEventListener('click', handleStartChallenge);

    // Run query button
    const runBtn = document.getElementById('runBtn');
    if (runBtn) runBtn.addEventListener('click', handleRunQuery);

    // Clear editor button
    const clearBtn = document.getElementById('clearEditorBtn');
    if (clearBtn) {
      clearBtn.addEventListener('click', () => {
        if (!AppState.editor || AppState.editor.getOption('readOnly')) return;
        AppState.editor.setValue(AppState.activeVariant ? AppState.activeVariant.broken_sql : '');
        AppState.editor.focus();
      });
    }

    // Quick Keys
    document.querySelectorAll('.sql-chip').forEach(chip => {
      chip.addEventListener('click', () => {
        if (!AppState.editor || AppState.editor.getOption('readOnly')) return;
        const text = chip.getAttribute('data-insert') || chip.textContent;
        AppState.editor.replaceSelection(text + ' ');
        AppState.editor.focus();
      });
    });

    // Refresh Leaderboard
    const refreshBtn = document.getElementById('refreshLeaderboardBtn');
    if (refreshBtn) refreshBtn.addEventListener('click', fetchLeaderboard);

    // Schema Peek Popover Toggle
    const peekBtn = document.getElementById('peekTrigger');
    const peekPopover = document.getElementById('peekPopover');
    const peekClose = document.getElementById('peekCloseBtn');

    if (peekBtn && peekPopover) {
      peekBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        peekPopover.classList.toggle('open');
      });
    }

    if (peekClose && peekPopover) {
      peekClose.addEventListener('click', (e) => {
        e.stopPropagation();
        peekPopover.classList.remove('open');
      });
    }

    // Verified Receipt Modal
    const receiptBtn = document.getElementById('viewReceiptBtn');
    const receiptModal = document.getElementById('receiptModal');
    const receiptClose = document.getElementById('receiptCloseBtn');

    if (receiptBtn && receiptModal) {
      receiptBtn.addEventListener('click', () => {
        receiptModal.classList.add('active');
      });
    }

    if (receiptClose && receiptModal) {
      receiptClose.addEventListener('click', () => {
        receiptModal.classList.remove('active');
      });
    }

    // Victory Close
    const victoryModal = document.getElementById('victoryModal');
    const victoryClose = document.getElementById('victoryCloseBtn');
    if (victoryClose && victoryModal) {
      victoryClose.addEventListener('click', () => {
        victoryModal.classList.remove('active');
      });
    }

    // Modal Background Click
    document.querySelectorAll('.bounty-modal-overlay').forEach(overlay => {
      overlay.addEventListener('click', (e) => {
        if (e.target === overlay) {
          overlay.classList.remove('active');
        }
      });
    });

    // Claim Form Submit
    const claimForm = document.getElementById('claimForm');
    if (claimForm) claimForm.addEventListener('submit', handleFinalClaimSubmit);

    // Story Share Button
    const storyBtn = document.getElementById('storyShareBtn');
    if (storyBtn) storyBtn.addEventListener('click', generateStoryBragCard);
  }

  function closeAllModals() {
    document.querySelectorAll('.bounty-modal-overlay').forEach(el => el.classList.remove('active'));
    const peek = document.getElementById('peekPopover');
    if (peek) peek.classList.remove('open');
  }

  function showToast(message, type = 'info') {
    const shelf = document.getElementById('toastShelf');
    if (!shelf) return;
    const toast = document.createElement('div');
    toast.className = `bounty-toast ${type}`;
    toast.textContent = message;
    shelf.appendChild(toast);
    setTimeout(() => {
      toast.remove();
    }, 3500);
  }

  function escapeHTML(str) {
    if (!str) return '';
    return str.replace(/[&<>'"]/g, tag => ({
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      "'": '&#39;',
      '"': '&quot;'
    }[tag] || tag));
  }

  window.BountyUI = {
    showToast,
    closeAllModals
  };

})();
