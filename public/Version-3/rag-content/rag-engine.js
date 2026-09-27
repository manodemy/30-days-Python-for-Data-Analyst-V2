/* ═══════════════════════════════════════════════════════════════════
   Manodemy Advanced RAG Studio — Unified Client Engine (v1.0)
   Coordinates: Pyodide WASM Runtime, CodeMirror 5, Slide Navigation,
   Deterministic Grading Harness, Coach Diagnostics, & Local Storage
   ═══════════════════════════════════════════════════════════════════ */

(function(root) {
  'use strict';

  // ── Application State ──
  const state = {
    dayId: 'rag-day01',
    dayData: null,
    worker: null,
    isWorkerReady: false,
    editor: null,
    currentQuestionIndex: 0,
    currentSlideIndex: 0,
    solvedQuestions: new Set(),
    executionCounter: 0,
    pendingExecutions: new Map(),
    isPlayingNarration: false,
    audioEl: null
  };

  // ── Local Storage Key ──
  function getStorageKey() {
    return `manodemy_rag_${state.dayId}_progress`;
  }

  function loadProgress() {
    try {
      const raw = localStorage.getItem(getStorageKey());
      if (raw) {
        const parsed = JSON.parse(raw);
        if (Array.isArray(parsed.solved)) {
          state.solvedQuestions = new Set(parsed.solved);
        }
      }
    } catch (e) {
      console.warn('Could not load RAG progress from localStorage', e);
    }
  }

  function saveProgress() {
    try {
      localStorage.setItem(getStorageKey(), JSON.stringify({
        solved: Array.from(state.solvedQuestions),
        lastUpdated: Date.now()
      }));
    } catch (e) {
      console.warn('Could not save RAG progress to localStorage', e);
    }
  }

  // ── Pyodide Web Worker Initialization ──
  function initPyodideWorker() {
    const statusText = document.getElementById('pyodideStatusText');
    const statusDot = document.getElementById('pyodideStatusDot');
    if (statusText) statusText.textContent = 'Booting Python...';

    state.worker = new Worker('/Version-3/rag-content/pyodide-worker.js?v=' + Date.now());

    state.worker.onmessage = function(e) {
      const msg = e.data;
      switch (msg.type) {
        case 'ready':
          state.isWorkerReady = true;
          if (statusText) statusText.textContent = 'Python 3.11 Ready';
          if (statusDot) statusDot.className = 'status-dot online';
          const runBtn = document.getElementById('runBtn');
          const gradeBtn = document.getElementById('gradeBtn');
          if (runBtn) runBtn.disabled = false;
          if (gradeBtn) gradeBtn.disabled = false;
          appendOutput('🐍 Pyodide Python 3.11 Runtime Ready (numpy loaded)\n', 'output-info');
          break;

        case 'result': {
          const p = state.pendingExecutions.get(msg.executionId);
          if (p) {
            state.pendingExecutions.delete(msg.executionId);
            p.resolve(msg);
          }
          break;
        }

        case 'error': {
          const p = state.pendingExecutions.get(msg.executionId);
          if (p) {
            state.pendingExecutions.delete(msg.executionId);
            p.reject(new Error(msg.error || 'Execution failed'));
          }
          break;
        }

        case 'boot-error':
          if (statusText) statusText.textContent = 'Python Error';
          if (statusDot) statusDot.className = 'status-dot error';
          appendOutput(`❌ Runtime Boot Error: ${msg.error}\n`, 'output-error');
          break;
      }
    };

    state.worker.postMessage({ type: 'init' });
  }

  // ── Execute Python Code in Worker ──
  function executePythonCode(code) {
    return new Promise((resolve, reject) => {
      if (!state.isWorkerReady) {
        return reject(new Error('Python runtime is still loading. Please wait...'));
      }
      const id = ++state.executionCounter;
      state.pendingExecutions.set(id, { resolve, reject });
      state.worker.postMessage({ type: 'execute', code, executionId: id });

      // 10s safety timeout
      setTimeout(() => {
        if (state.pendingExecutions.has(id)) {
          state.pendingExecutions.delete(id);
          reject(new Error('⏱️ Execution timed out after 10s. Check for infinite loops.'));
        }
      }, 10000);
    });
  }

  // ── CodeMirror Editor Setup ──
  function initCodeEditor() {
    const wrap = document.getElementById('mainEditorWrap');
    if (!wrap) return;

    state.editor = CodeMirror(wrap, {
      value: '# Python 3.11 Interactive Editor\n',
      mode: 'python',
      theme: 'dracula',
      lineNumbers: true,
      matchBrackets: true,
      autoCloseBrackets: true,
      indentUnit: 4,
      tabSize: 4,
      indentWithTabs: false,
      extraKeys: {
        'Shift-Enter': function() {
          runCurrentCode();
        },
        'Ctrl-Enter': function() {
          gradeCurrentSubmission();
        }
      }
    });

    // Auto-refresh layout when container resizes
    setTimeout(() => {
      if (state.editor) state.editor.refresh();
    }, 150);
  }

  // ── Terminal Output Helpers ──
  function clearOutput() {
    const term = document.getElementById('mainOutputBody');
    if (term) term.innerHTML = '';
  }

  function appendOutput(text, className = '') {
    const term = document.getElementById('mainOutputBody');
    if (!term) return;
    const span = document.createElement('span');
    span.className = className;
    span.textContent = text;
    term.appendChild(span);
    term.scrollTop = term.scrollHeight;
  }

  // ── UI Updates: Stats, Solved Count, Marks ──
  function updateStatsUI() {
    const total = state.dayData?.practiceQuestions?.length || 5;
    const solved = state.solvedQuestions.size;
    const marksPerQ = 100 / total;
    const marks = (solved * marksPerQ).toFixed(1);

    const solvedNum = document.getElementById('solvedCount');
    const totalNum = document.getElementById('totalQuestions');
    const marksNum = document.getElementById('marksCount');
    const totalMarksNum = document.getElementById('totalMarks');
    const progressFill = document.getElementById('statsProgressFill');
    const overallScoreNum = document.getElementById('headerOverallScore');
    const overallBarFill = document.getElementById('overallScoreBarFill');

    if (solvedNum) solvedNum.textContent = solved;
    if (totalNum) totalNum.textContent = total;
    if (marksNum) marksNum.textContent = marks;
    if (totalMarksNum) totalMarksNum.textContent = '100.0';
    if (progressFill) progressFill.style.width = `${(solved / total) * 100}%`;
    if (overallScoreNum) overallScoreNum.textContent = Math.round(solved * marksPerQ);
    if (overallBarFill) overallBarFill.style.width = `${(solved / total) * 100}%`;
  }

  // ── Question Loader & Navigation ──
  function loadQuestion(index) {
    if (!state.dayData || !state.dayData.practiceQuestions) return;
    const questions = state.dayData.practiceQuestions;
    if (index < 0) index = 0;
    if (index >= questions.length) index = questions.length - 1;
    state.currentQuestionIndex = index;

    // Stop any active audio / typewriter when navigating challenges
    if (activeQuestionAudio) {
      activeQuestionAudio.pause();
      activeQuestionAudio = null;
      const qAudioBtn = document.getElementById('questionAudioBtn');
      if (qAudioBtn) {
        qAudioBtn.innerHTML = '🎧 Question Audio';
        qAudioBtn.classList.remove('active');
      }
    }
    if (root.pythonTypewriter) {
      root.pythonTypewriter.stop();
    }

    const q = questions[index];

    // Update Counter & Prompt
    const qCounter = document.getElementById('qCounter');
    const promptEl = document.getElementById('questionPrompt');
    const statusBadge = document.getElementById('questionStatusBadge');

    if (qCounter) qCounter.textContent = `Challenge 0${q.id} / 0${questions.length}`;
    if (promptEl) promptEl.innerHTML = q.prompt;

    const isSolved = state.solvedQuestions.has(q.id);
    if (statusBadge) {
      statusBadge.textContent = isSolved ? '✅ SOLVED' : 'UNSOLVED';
      statusBadge.className = `q-badge ${isSolved ? 'solved' : 'unsolved'}`;
    }

    // Set editor text
    if (state.editor) {
      state.editor.setValue(q.starterCode || '# Write your solution\n');
      state.editor.clearHistory();
      setTimeout(() => state.editor.refresh(), 50);
    }

    // Reset Coach Box
    const coachBox = document.getElementById('ragCoachTip');
    if (coachBox) coachBox.style.display = 'none';

    clearOutput();
    appendOutput(`📝 Loaded Challenge ${q.id}: ${q.topic}\nPress Shift+Enter to Run, or click Grade to evaluate against test suite.\n`, 'output-info');
  }

  function nextQuestion() {
    loadQuestion(state.currentQuestionIndex + 1);
  }

  function prevQuestion() {
    loadQuestion(state.currentQuestionIndex - 1);
  }

  // ── Slide Loader & Navigation ──
  function loadSlide(index) {
    if (!state.dayData || !state.dayData.slides) return;
    const slides = state.dayData.slides;
    if (index < 0) index = 0;
    if (index >= slides.length) index = slides.length - 1;
    state.currentSlideIndex = index;

    const topicSelect = document.getElementById('topicSelect');
    if (topicSelect) {
      topicSelect.value = `slide-${index + 1}`;
    }

    // Mount full-bleed animation cinema directly
    if (root.ragAnimator) {
      root.ragAnimator.mount(index);
    }

    // Update timeline progress
    const timelineFill = document.getElementById('timelineFill');
    if (timelineFill) {
      timelineFill.style.width = `${((index + 1) / slides.length) * 100}%`;
    }
  }

  function nextSlide() {
    loadSlide(state.currentSlideIndex + 1);
  }

  function prevSlide() {
    loadSlide(state.currentSlideIndex - 1);
  }

  // ── Interactive Conveyor Belt Widget (Slide 2) ──
  const conveyorStages = {
    1: {
      tag: "STAGE 1: INGESTION",
      latency: "Avg Latency: 120ms",
      title: "Unstructured Document Parsing",
      desc: "Extracts raw text, table hierarchies, and metadata from heterogeneous PDFs, HTML pages, and Word docs. Strips noise and boilerplate.",
      input: "Raw PDF binary (annual_report_2024.pdf)",
      output: "Cleaned markdown text + {page, author, title} metadata"
    },
    2: {
      tag: "STAGE 2: CHUNKING",
      latency: "Avg Latency: 15ms",
      title: "Semantic Text Segmentation",
      desc: "Splits continuous documents into discrete passages with overlap to avoid severed sentences and semantic loss.",
      input: "50,000-char markdown string",
      output: "Array of 120 chunks × 400 chars (overlap: 50)"
    },
    3: {
      tag: "STAGE 3: EMBEDDING",
      latency: "Avg Latency: 45ms",
      title: "Dense Vector Representation",
      desc: "Passes each chunk through an embedding transformer (e.g. bge-base-en) to output a 384-dimensional dense coordinate array.",
      input: "\"The company reported revenue of $4.2B...\"",
      output: "Float32Array[384] normalized coordinates"
    },
    4: {
      tag: "STAGE 4: RETRIEVAL",
      latency: "Avg Latency: 18ms",
      title: "Vector Similarity / Hybrid Search",
      desc: "Computes cosine distance or HNSW graph nearest neighbors between the query vector and millions of stored chunk vectors.",
      input: "Query vector + k=5 top chunks requested",
      output: "Top 5 most semantically relevant chunks with scores"
    },
    5: {
      tag: "STAGE 5: SYNTHESIS",
      latency: "Avg Latency: 450ms",
      title: "Grounded LLM Generation",
      desc: "Assembles prompt with verified chunks as opaque context; grounds the LLM to synthesize an answer with direct citations.",
      input: "System prompt + 5 retrieved chunks + User Question",
      output: "Factual verified answer with [Source: Chunk 3] citation"
    }
  };

  function initConveyorWidget() {
    root.selectConveyorStage = function(stageNum) {
      const data = conveyorStages[stageNum];
      if (!data) return;

      // Update active pills
      document.querySelectorAll('.conveyor-step').forEach(el => {
        el.classList.toggle('active', parseInt(el.dataset.step) === stageNum);
      });

      // Update text in inspector
      const tagEl = document.getElementById('inspectorStageTag');
      const latEl = document.getElementById('inspectorStageLatency');
      const titleEl = document.getElementById('inspectorStageTitle');
      const descEl = document.getElementById('inspectorStageDescription');
      const inEl = document.getElementById('inspectorInput');
      const outEl = document.getElementById('inspectorOutput');

      if (tagEl) tagEl.textContent = data.tag;
      if (latEl) latEl.textContent = data.latency;
      if (titleEl) titleEl.textContent = data.title;
      if (descEl) descEl.textContent = data.desc;
      if (inEl) inEl.textContent = data.input;
      if (outEl) outEl.textContent = data.output;
    };
  }

  // ── Run Current Code (Shift+Enter) ──
  async function runCurrentCode() {
    if (!state.editor) return;
    const code = state.editor.getValue();
    clearOutput();
    appendOutput('▶ Executing Python code...\n', 'output-info');

    const runBtn = document.getElementById('runBtn');
    if (runBtn) runBtn.disabled = true;

    try {
      const res = await executePythonCode(code);
      if (res.stdout) appendOutput(res.stdout, 'output-success');
      appendOutput(`\n⏱️ Execution complete in ${res.execTimeMs}ms\n`, 'output-info');
    } catch (err) {
      appendOutput(`\n❌ ${err.message}\n`, 'output-error');
      showCoachDiagnostic(err.message);
    } finally {
      if (runBtn) runBtn.disabled = false;
    }
  }

  // ── Grade Current Submission (Ctrl+Enter or Grade Button) ──
  async function gradeCurrentSubmission() {
    if (!state.editor || !state.dayData) return;
    const q = state.dayData.practiceQuestions[state.currentQuestionIndex];
    if (!q) return;

    const studentCode = state.editor.getValue();
    clearOutput();
    appendOutput(`🧪 Evaluating Challenge ${q.id} against test suite...\n`, 'output-info');

    const gradeBtn = document.getElementById('gradeBtn');
    if (gradeBtn) gradeBtn.disabled = true;

    // Combine student code with test harness assertions
    const fullTestScript = `${studentCode}\n\n# --- AUTOMATED TEST HARNESS ---\n${q.testHarness}\n`;

    try {
      const res = await executePythonCode(fullTestScript);

      if (res.stdout) appendOutput(res.stdout, 'output-success');
      appendOutput(`\n🎉 100% CORRECT! Challenge ${q.id} PASSED!\n`, 'output-success');

      // Mark solved
      state.solvedQuestions.add(q.id);
      saveProgress();
      updateStatsUI();

      const statusBadge = document.getElementById('questionStatusBadge');
      if (statusBadge) {
        statusBadge.textContent = '✅ SOLVED';
        statusBadge.className = 'q-badge solved';
      }

      // Hide coach error tip
      const coachBox = document.getElementById('ragCoachTip');
      if (coachBox) coachBox.style.display = 'none';

      // Confetti effect / visual cue
      showCelebrationBanner();

    } catch (err) {
      appendOutput(`\n❌ TEST FAILURE: ${err.message}\n`, 'output-error');
      showCoachDiagnostic(err.message);
    } finally {
      if (gradeBtn) gradeBtn.disabled = false;
    }
  }

  // ── RAG Coach Diagnostic Display ──
  function showCoachDiagnostic(errorMsg) {
    const coachBox = document.getElementById('ragCoachTip');
    const coachText = document.getElementById('coachTipText');
    if (!coachBox || !coachText) return;

    let tip = "Make sure your function signature matches the prompt and returns the expected type.";

    if (errorMsg.includes('AssertionError')) {
      tip = `Assertion failed: The output didn't match the expected ground truth. ${errorMsg.split('AssertionError:')[1] || ''}`;
    } else if (errorMsg.includes('NameError')) {
      tip = "You referenced a variable or function name that isn't defined yet. Check for spelling typos.";
    } else if (errorMsg.includes('SyntaxError')) {
      tip = "Syntax Error: Check for missing colons at the end of 'def' or 'if' statements, or mismatched parentheses.";
    } else if (errorMsg.includes('TypeError')) {
      tip = "Type Error: Ensure you're returning the correct data type (e.g. list vs dict vs str) and not passing wrong argument counts.";
    } else if (errorMsg.includes('timed out')) {
      tip = "Infinite loop detected: Ensure your while loops have proper termination conditions.";
    }

    coachText.innerHTML = `💡 <strong>RAG Coach Hint:</strong> ${tip}`;
    coachBox.style.display = 'block';
  }

  function showCelebrationBanner() {
    const banner = document.getElementById('celebrationBanner');
    if (!banner) return;
    banner.classList.add('show');
    setTimeout(() => {
      banner.classList.remove('show');
    }, 3500);
  }

  // ── Question Audio Player ──
  let activeQuestionAudio = null;
  function toggleQuestionAudio() {
    const q = state.dayData?.practiceQuestions[state.currentQuestionIndex];
    if (!q) return;
    const btn = document.getElementById('questionAudioBtn');
    const qNumStr = String(q.id).padStart(2, '0');
    const audioSrc = `/Version-3/RAG-Day01/RAG_Day01_Q${qNumStr}.mp3`;

    if (activeQuestionAudio && !activeQuestionAudio.paused) {
      activeQuestionAudio.pause();
      activeQuestionAudio = null;
      if (btn) {
        btn.innerHTML = '🎧 Question Audio';
        btn.classList.remove('active');
      }
      return;
    }

    if (activeQuestionAudio) activeQuestionAudio.pause();

    activeQuestionAudio = new Audio(audioSrc);
    const speed = root.ragAnimator?.playbackRate || 1.0;
    activeQuestionAudio.playbackRate = speed;
    activeQuestionAudio.play().catch(e => console.warn(e));

    if (btn) {
      btn.innerHTML = '⏸ Stop Audio';
      btn.classList.add('active');
    }

    activeQuestionAudio.onended = () => {
      if (btn) {
        btn.innerHTML = '🎧 Question Audio';
        btn.classList.remove('active');
      }
      activeQuestionAudio = null;
    };
  }

  // ── Scrimba Solution Walkthrough (Voice + CodeMirror Typewriter + Pyodide Auto-Execution) ──
  function toggleSolutionWalkthrough() {
    const q = state.dayData?.practiceQuestions[state.currentQuestionIndex];
    if (!q || !root.pythonTypewriter) return;

    if (root.pythonTypewriter.isTyping) {
      root.pythonTypewriter.stop();
      return;
    }

    const qNumStr = String(q.id).padStart(2, '0');
    const audioSrc = `RAG-Day01/RAG_Day01_Q${qNumStr}sol.mp3`;
    root.pythonTypewriter.playSolutionWalkthrough(q.id, q.solutionCode, audioSrc);
  }

  // ── Reset Starter Code ──
  function resetStarterCode() {
    if (!state.dayData || !state.editor) return;
    const q = state.dayData.practiceQuestions[state.currentQuestionIndex];
    if (q) {
      if (root.pythonTypewriter) root.pythonTypewriter.stop();
      state.editor.setValue(q.starterCode || '');
      clearOutput();
      appendOutput('🔄 Starter code restored.\n', 'output-info');
    }
  }

  // ── Knowledge Base / Corpus Inspector Modal ──
  function toggleCorpusModal() {
    const modal = document.getElementById('corpusModal');
    if (modal) {
      modal.style.display = modal.style.display === 'flex' ? 'none' : 'flex';
    }
  }

  // ── Master Playback / Top Nav Audio ──
  function toggleLessonAudio() {
    if (root.ragAnimator) {
      root.ragAnimator.togglePlay();
    }
  }

  // ── Split Panel Resizer ──
  function initResizer() {
    const divider = document.getElementById('divider');
    const left = document.getElementById('panelLeft');
    const right = document.getElementById('panelRight');
    if (!divider || !left || !right) return;

    let isDragging = false;

    divider.addEventListener('mousedown', (e) => {
      isDragging = true;
      document.body.style.cursor = 'col-resize';
      document.body.style.userSelect = 'none';
    });

    window.addEventListener('mousemove', (e) => {
      if (!isDragging) return;
      const container = document.getElementById('workspaceContainer');
      if (!container) return;
      const rect = container.getBoundingClientRect();
      const pct = ((e.clientX - rect.left) / rect.width) * 100;
      if (pct > 20 && pct < 80) {
        left.style.flex = `0 0 ${pct}%`;
        right.style.flex = `0 0 ${100 - pct}%`;
        if (state.editor) state.editor.refresh();
      }
    });

    window.addEventListener('mouseup', () => {
      if (isDragging) {
        isDragging = false;
        document.body.style.cursor = '';
        document.body.style.userSelect = '';
        if (state.editor) state.editor.refresh();
      }
    });
  }

  // ── Global Bootstrapper ──
  function bootstrap() {
    state.dayData = window.COURSE_CONTENT['rag-day01'];
    loadProgress();

    initPyodideWorker();
    initCodeEditor();
    initResizer();

    // Initialize Python Typewriter Engine
    if (root.PythonTypewriterSync) {
      root.pythonTypewriter = new root.PythonTypewriterSync({ editor: state.editor });
      root.pythonTypewriter.setEditor(state.editor);
    }

    // Initialize Full-Bleed RAG Animator Engine
    if (root.RagAnimatorEngine && root.DAY_01_ANIMATIONS) {
      root.ragAnimator = new root.RagAnimatorEngine({ containerId: 'panelRight' });
      root.ragAnimator.registerDayAnimations(root.DAY_01_ANIMATIONS);
    }

    // Fetch Whisper timestamps.json
    fetch('/Version-3/RAG-Day01/timestamps.json?v=' + Date.now())
      .then(r => r.ok ? r.json() : null)
      .then(ts => {
        if (ts) {
          if (root.ragAnimator) root.ragAnimator.setTimestamps(ts);
          if (root.pythonTypewriter) root.pythonTypewriter.setTimestamps(ts);
        }
      })
      .catch(e => console.warn('Could not load timestamps.json:', e));

    loadQuestion(0);
    loadSlide(0);
    updateStatsUI();

    // Wire global handlers
    root.initConveyorWidget = initConveyorWidget;
    root.nextQuestion = nextQuestion;
    root.prevQuestion = prevQuestion;
    root.nextSlide = nextSlide;
    root.prevSlide = prevSlide;
    root.loadSlide = loadSlide;
    root.runCurrentCode = runCurrentCode;
    root.gradeCurrentSubmission = gradeCurrentSubmission;
    root.toggleQuestionAudio = toggleQuestionAudio;
    root.toggleSolutionWalkthrough = toggleSolutionWalkthrough;
    root.resetStarterCode = resetStarterCode;
    root.toggleCorpusModal = toggleCorpusModal;
    root.toggleLessonAudio = toggleLessonAudio;

    // Wire topic select in header
    const topicSelect = document.getElementById('topicSelect');
    if (topicSelect) {
      topicSelect.addEventListener('change', (e) => {
        const val = e.target.value;
        const slideNum = parseInt(val.replace('slide-', ''), 10) - 1;
        if (!isNaN(slideNum)) loadSlide(slideNum);
      });
    }

    // Wire mobile tabs
    root.setMobileTab = function(tabName) {
      const container = document.getElementById('workspaceContainer');
      const tabPractice = document.getElementById('tabBtnPractice');
      const tabTheory = document.getElementById('tabBtnTheory');

      if (tabName === 'practice') {
        container?.classList.remove('mobile-show-theory');
        container?.classList.add('mobile-show-practice');
        tabPractice?.classList.add('active');
        tabTheory?.classList.remove('active');
        if (state.editor) state.editor.refresh();
      } else {
        container?.classList.remove('mobile-show-practice');
        container?.classList.add('mobile-show-theory');
        tabTheory?.classList.add('active');
        tabPractice?.classList.remove('active');
      }
    };
  }

  // Run bootstrap on load
  if (document.readyState !== 'loading') {
    bootstrap();
  } else {
    document.addEventListener('DOMContentLoaded', bootstrap);
  }

})(window);
