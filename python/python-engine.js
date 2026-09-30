// ═══════════════════════════════════════════════════════════════
// MANODEMY — PYTHON STUDIO ENGINE (100% Parity with SQL Engine)
// Pyodide-powered runtime with slides, Whisper sync, dark/light theme,
// dual CodeMirror editors, 25-question test portal, and scorecards.
// ═══════════════════════════════════════════════════════════════

'use strict';

// ── Global State ──────────────────────────────────────────────
let pyodide = null;
let pyodideReady = false;

let currentDayId = null;
let currentDayData = null;
let currentSlideIndex = 0;
let currentQuestionIndex = 0;

// Test portal state
let testEditor = null;
let testTimerInterval = null;
let testSecondsLeft = 7200; // 120 mins
let testAnswers = {}; // { questionId: { code, passed, message, stdout } }
let currentTestQuestionIndex = 0;

// Main editor
let mainEditor = null;

// Narration / Playback State
let isCombinedPlaying = false;
let combinedTrackIndex = 0;
let combinedTracks = [];
let combinedTrackDurations = [];
let totalCombinedDuration = 0;
let currentCombinedTime = 0;
let currentPlaybackRate = 1.0;
let currentPlaybackVolume = 1.0;
let ttsUtterance = null;
let playbackTimerInterval = null;
let isMuted = false;

// Audio playback instance
let currentPlayingAudio = null;
let currentPlayingBtn = null;
let typewriterTimer = null;

// Drawing canvas state
let isDrawing = false;
let drawMode = 'pen'; // 'pen' | 'rect' | 'laser'
let drawStrokes = [];

// Persistence key

const STORAGE_KEY = 'manodemy_python_progress';

// ── Track Registries (100% Parity with SQL Engine) ────────────
const PYTHON_DAY_TRACKS = {
  'pyDay01': {
    tracks: [
  {
    "src": "Day01/New_PyDay01Audio01.mp3",
    "target": "#day01IntSection",
    "title": "01. Integers & Arbitrary Precision",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio02.mp3",
    "target": "#day01IntTableSection",
    "title": "Integer Operations & Memory Table",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio03.mp3",
    "target": "#day01IntCodeSection",
    "title": "Integer Arithmetic & Currency Example",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio04.mp3",
    "target": "#day01IntWarnSection",
    "title": "Negative Floor Division Trap",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio05.mp3",
    "target": "#day01FloatSection",
    "title": "02. Floats, IEEE-754 & Precision",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio06.mp3",
    "target": "#day01FloatTableSection",
    "title": "Float Traps & Safe Comparison Toolkit",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio07.mp3",
    "target": "#day01FloatCodeSection",
    "title": "Financial Calculations: Floats vs Decimal",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio08.mp3",
    "target": "#day01FloatInfoSection",
    "title": "Banker's Rounding Pro-Tip",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio09.mp3",
    "target": "#day01StrSection",
    "title": "03. Strings & Unicode (PEP 393)",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio10.mp3",
    "target": "#day01StrTableSection",
    "title": "String Slicing & Methods Matrix",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio11.mp3",
    "target": "#day01StrCodeSection",
    "title": "Log Parsing & String Join",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio12.mp3",
    "target": "#day01BoolSection",
    "title": "04. Booleans & The NoneType Singleton",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio13.mp3",
    "target": "#day01BoolTableSection",
    "title": "The Definitive Truthiness Matrix",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio14.mp3",
    "target": "#day01BoolWarnSection",
    "title": "Identity (is) vs Equality (==)",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio15.mp3",
    "target": "#day01SeqSection",
    "title": "05. Sequences: List vs Tuple",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio16.mp3",
    "target": "#day01SeqTableSection",
    "title": "List vs Tuple Architecture",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio17.mp3",
    "target": "#day01SeqCodeSection",
    "title": "Memory Footprint & Shallow vs Deep Copy",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio18.mp3",
    "target": "#day01HashSection",
    "title": "06. Hash Tables: Set & Dict",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio19.mp3",
    "target": "#day01HashTableSection",
    "title": "Set Algebra & Fast Lookups Reference",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Audio20.mp3",
    "target": "#day01HashCodeSection",
    "title": "Cohort Churn Analysis with Sets",
    "type": "narration"
  },
  {
    "src": "Day01/New_PyDay01Question01.mp3",
    "target": "#questionBar",
    "title": "Question 1",
    "type": "question",
    "qId": 1
  },
  {
    "src": "Day01/New_PyDay01Question01sol.mp3",
    "target": "#questionBar",
    "title": "Q1 Solution Walkthrough",
    "type": "solution",
    "qId": 1
  },
  {
    "src": "Day01/New_PyDay01Question02.mp3",
    "target": "#questionBar",
    "title": "Question 2",
    "type": "question",
    "qId": 2
  },
  {
    "src": "Day01/New_PyDay01Question02sol.mp3",
    "target": "#questionBar",
    "title": "Q2 Solution Walkthrough",
    "type": "solution",
    "qId": 2
  },
  {
    "src": "Day01/New_PyDay01Question03.mp3",
    "target": "#questionBar",
    "title": "Question 3",
    "type": "question",
    "qId": 3
  },
  {
    "src": "Day01/New_PyDay01Question03sol.mp3",
    "target": "#questionBar",
    "title": "Q3 Solution Walkthrough",
    "type": "solution",
    "qId": 3
  },
  {
    "src": "Day01/New_PyDay01Question04.mp3",
    "target": "#questionBar",
    "title": "Question 4",
    "type": "question",
    "qId": 4
  },
  {
    "src": "Day01/New_PyDay01Question04sol.mp3",
    "target": "#questionBar",
    "title": "Q4 Solution Walkthrough",
    "type": "solution",
    "qId": 4
  },
  {
    "src": "Day01/New_PyDay01Question05.mp3",
    "target": "#questionBar",
    "title": "Question 5",
    "type": "question",
    "qId": 5
  },
  {
    "src": "Day01/New_PyDay01Question05sol.mp3",
    "target": "#questionBar",
    "title": "Q5 Solution Walkthrough",
    "type": "solution",
    "qId": 5
  },
  {
    "src": "Day01/New_PyDay01Question06.mp3",
    "target": "#questionBar",
    "title": "Question 6",
    "type": "question",
    "qId": 6
  },
  {
    "src": "Day01/New_PyDay01Question06sol.mp3",
    "target": "#questionBar",
    "title": "Q6 Solution Walkthrough",
    "type": "solution",
    "qId": 6
  },
  {
    "src": "Day01/New_PyDay01Question07.mp3",
    "target": "#questionBar",
    "title": "Question 7",
    "type": "question",
    "qId": 7
  },
  {
    "src": "Day01/New_PyDay01Question07sol.mp3",
    "target": "#questionBar",
    "title": "Q7 Solution Walkthrough",
    "type": "solution",
    "qId": 7
  },
  {
    "src": "Day01/New_PyDay01Question08.mp3",
    "target": "#questionBar",
    "title": "Question 8",
    "type": "question",
    "qId": 8
  },
  {
    "src": "Day01/New_PyDay01Question08sol.mp3",
    "target": "#questionBar",
    "title": "Q8 Solution Walkthrough",
    "type": "solution",
    "qId": 8
  },
  {
    "src": "Day01/New_PyDay01Question09.mp3",
    "target": "#questionBar",
    "title": "Question 9",
    "type": "question",
    "qId": 9
  },
  {
    "src": "Day01/New_PyDay01Question09sol.mp3",
    "target": "#questionBar",
    "title": "Q9 Solution Walkthrough",
    "type": "solution",
    "qId": 9
  },
  {
    "src": "Day01/New_PyDay01Question10.mp3",
    "target": "#questionBar",
    "title": "Question 10",
    "type": "question",
    "qId": 10
  },
  {
    "src": "Day01/New_PyDay01Question10sol.mp3",
    "target": "#questionBar",
    "title": "Q10 Solution Walkthrough",
    "type": "solution",
    "qId": 10
  },
  {
    "src": "Day01/New_PyDay01Question11.mp3",
    "target": "#questionBar",
    "title": "Question 11",
    "type": "question",
    "qId": 11
  },
  {
    "src": "Day01/New_PyDay01Question11sol.mp3",
    "target": "#questionBar",
    "title": "Q11 Solution Walkthrough",
    "type": "solution",
    "qId": 11
  },
  {
    "src": "Day01/New_PyDay01Question12.mp3",
    "target": "#questionBar",
    "title": "Question 12",
    "type": "question",
    "qId": 12
  },
  {
    "src": "Day01/New_PyDay01Question12sol.mp3",
    "target": "#questionBar",
    "title": "Q12 Solution Walkthrough",
    "type": "solution",
    "qId": 12
  },
  {
    "src": "Day01/New_PyDay01Question13.mp3",
    "target": "#questionBar",
    "title": "Question 13",
    "type": "question",
    "qId": 13
  },
  {
    "src": "Day01/New_PyDay01Question13sol.mp3",
    "target": "#questionBar",
    "title": "Q13 Solution Walkthrough",
    "type": "solution",
    "qId": 13
  },
  {
    "src": "Day01/New_PyDay01Question14.mp3",
    "target": "#questionBar",
    "title": "Question 14",
    "type": "question",
    "qId": 14
  },
  {
    "src": "Day01/New_PyDay01Question14sol.mp3",
    "target": "#questionBar",
    "title": "Q14 Solution Walkthrough",
    "type": "solution",
    "qId": 14
  },
  {
    "src": "Day01/New_PyDay01Question15.mp3",
    "target": "#questionBar",
    "title": "Question 15",
    "type": "question",
    "qId": 15
  },
  {
    "src": "Day01/New_PyDay01Question15sol.mp3",
    "target": "#questionBar",
    "title": "Q15 Solution Walkthrough",
    "type": "solution",
    "qId": 15
  }
],
    durations: [
  26.28,
  18.31,
  16.78,
  10.92,
  20.62,
  17.83,
  13.87,
  12.96,
  19.03,
  16.63,
  14.47,
  16.2,
  13.32,
  17.98,
  16.73,
  13.68,
  14.5,
  17.21,
  14.26,
  13.46,
  9.62,
  16.25,
  13.25,
  26.78,
  9.55,
  13.63,
  10.2,
  15.65,
  10.2,
  15.17,
  10.06,
  19.49,
  10.63,
  16.1,
  11.11,
  13.03,
  10.39,
  16.8,
  7.3,
  13.49,
  8.66,
  14.21,
  9.96,
  14.71,
  10.42,
  18.24,
  9.0,
  14.28,
  10.06,
  16.99
]
  },
  'pyDay02': {
    tracks: [
  {
    "src": "Day02/New_PyDay02Audio01.mp3",
    "target": "#day02ArithSection",
    "title": "01. Arithmetic & In-Place Assignment",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio02.mp3",
    "target": "#day02ArithTableSection",
    "title": "Arithmetic Operator Reference Table",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio03.mp3",
    "target": "#day02ArithCodeSection",
    "title": "Compound Interest & Mutability Example",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio04.mp3",
    "target": "#day02CompSection",
    "title": "02. Comparison Operators & Chaining",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio05.mp3",
    "target": "#day02CompTableSection",
    "title": "Comparison Patterns & Chaining Matrix",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio06.mp3",
    "target": "#day02CompCodeSection",
    "title": "Data Quality Validation with Chained Checks",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio07.mp3",
    "target": "#day02LogSection",
    "title": "03. Logical Operators & Short-Circuit",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio08.mp3",
    "target": "#day02LogTableSection",
    "title": "Short-Circuit Evaluation Matrix",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio09.mp3",
    "target": "#day02LogCodeSection",
    "title": "Defensive Division Guard & Fallbacks",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio10.mp3",
    "target": "#day02IdSection",
    "title": "04. Identity (is) vs Membership (in)",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio11.mp3",
    "target": "#day02IdTableSection",
    "title": "Identity vs Membership Comparison Table",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio12.mp3",
    "target": "#day02IdCodeSection",
    "title": "High-Speed Stop-Word Filter with Sets",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio13.mp3",
    "target": "#day02BitSection",
    "title": "05. Bitwise Operators & Binary Masks",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio14.mp3",
    "target": "#day02BitTableSection",
    "title": "Bitwise Operator Reference Table",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio15.mp3",
    "target": "#day02BitCodeSection",
    "title": "Role-Based Access Control (RBAC) Bitmask",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio16.mp3",
    "target": "#day02WalrusSection",
    "title": "06. Ternary & The Walrus Operator (:=)",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio17.mp3",
    "target": "#day02WalrusTableSection",
    "title": "Operator Precedence Hierarchy Table",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Audio18.mp3",
    "target": "#day02WalrusCodeSection",
    "title": "Walrus in List Comprehensions & Loops",
    "type": "narration"
  },
  {
    "src": "Day02/New_PyDay02Question01.mp3",
    "target": "#questionBar",
    "title": "Question 1",
    "type": "question",
    "qId": 1
  },
  {
    "src": "Day02/New_PyDay02Question01sol.mp3",
    "target": "#questionBar",
    "title": "Q1 Solution Walkthrough",
    "type": "solution",
    "qId": 1
  },
  {
    "src": "Day02/New_PyDay02Question02.mp3",
    "target": "#questionBar",
    "title": "Question 2",
    "type": "question",
    "qId": 2
  },
  {
    "src": "Day02/New_PyDay02Question02sol.mp3",
    "target": "#questionBar",
    "title": "Q2 Solution Walkthrough",
    "type": "solution",
    "qId": 2
  },
  {
    "src": "Day02/New_PyDay02Question03.mp3",
    "target": "#questionBar",
    "title": "Question 3",
    "type": "question",
    "qId": 3
  },
  {
    "src": "Day02/New_PyDay02Question03sol.mp3",
    "target": "#questionBar",
    "title": "Q3 Solution Walkthrough",
    "type": "solution",
    "qId": 3
  },
  {
    "src": "Day02/New_PyDay02Question04.mp3",
    "target": "#questionBar",
    "title": "Question 4",
    "type": "question",
    "qId": 4
  },
  {
    "src": "Day02/New_PyDay02Question04sol.mp3",
    "target": "#questionBar",
    "title": "Q4 Solution Walkthrough",
    "type": "solution",
    "qId": 4
  },
  {
    "src": "Day02/New_PyDay02Question05.mp3",
    "target": "#questionBar",
    "title": "Question 5",
    "type": "question",
    "qId": 5
  },
  {
    "src": "Day02/New_PyDay02Question05sol.mp3",
    "target": "#questionBar",
    "title": "Q5 Solution Walkthrough",
    "type": "solution",
    "qId": 5
  },
  {
    "src": "Day02/New_PyDay02Question06.mp3",
    "target": "#questionBar",
    "title": "Question 6",
    "type": "question",
    "qId": 6
  },
  {
    "src": "Day02/New_PyDay02Question06sol.mp3",
    "target": "#questionBar",
    "title": "Q6 Solution Walkthrough",
    "type": "solution",
    "qId": 6
  },
  {
    "src": "Day02/New_PyDay02Question07.mp3",
    "target": "#questionBar",
    "title": "Question 7",
    "type": "question",
    "qId": 7
  },
  {
    "src": "Day02/New_PyDay02Question07sol.mp3",
    "target": "#questionBar",
    "title": "Q7 Solution Walkthrough",
    "type": "solution",
    "qId": 7
  },
  {
    "src": "Day02/New_PyDay02Question08.mp3",
    "target": "#questionBar",
    "title": "Question 8",
    "type": "question",
    "qId": 8
  },
  {
    "src": "Day02/New_PyDay02Question08sol.mp3",
    "target": "#questionBar",
    "title": "Q8 Solution Walkthrough",
    "type": "solution",
    "qId": 8
  },
  {
    "src": "Day02/New_PyDay02Question09.mp3",
    "target": "#questionBar",
    "title": "Question 9",
    "type": "question",
    "qId": 9
  },
  {
    "src": "Day02/New_PyDay02Question09sol.mp3",
    "target": "#questionBar",
    "title": "Q9 Solution Walkthrough",
    "type": "solution",
    "qId": 9
  },
  {
    "src": "Day02/New_PyDay02Question10.mp3",
    "target": "#questionBar",
    "title": "Question 10",
    "type": "question",
    "qId": 10
  },
  {
    "src": "Day02/New_PyDay02Question10sol.mp3",
    "target": "#questionBar",
    "title": "Q10 Solution Walkthrough",
    "type": "solution",
    "qId": 10
  },
  {
    "src": "Day02/New_PyDay02Question11.mp3",
    "target": "#questionBar",
    "title": "Question 11",
    "type": "question",
    "qId": 11
  },
  {
    "src": "Day02/New_PyDay02Question11sol.mp3",
    "target": "#questionBar",
    "title": "Q11 Solution Walkthrough",
    "type": "solution",
    "qId": 11
  },
  {
    "src": "Day02/New_PyDay02Question12.mp3",
    "target": "#questionBar",
    "title": "Question 12",
    "type": "question",
    "qId": 12
  },
  {
    "src": "Day02/New_PyDay02Question12sol.mp3",
    "target": "#questionBar",
    "title": "Q12 Solution Walkthrough",
    "type": "solution",
    "qId": 12
  },
  {
    "src": "Day02/New_PyDay02Question13.mp3",
    "target": "#questionBar",
    "title": "Question 13",
    "type": "question",
    "qId": 13
  },
  {
    "src": "Day02/New_PyDay02Question13sol.mp3",
    "target": "#questionBar",
    "title": "Q13 Solution Walkthrough",
    "type": "solution",
    "qId": 13
  },
  {
    "src": "Day02/New_PyDay02Question14.mp3",
    "target": "#questionBar",
    "title": "Question 14",
    "type": "question",
    "qId": 14
  },
  {
    "src": "Day02/New_PyDay02Question14sol.mp3",
    "target": "#questionBar",
    "title": "Q14 Solution Walkthrough",
    "type": "solution",
    "qId": 14
  },
  {
    "src": "Day02/New_PyDay02Question15.mp3",
    "target": "#questionBar",
    "title": "Question 15",
    "type": "question",
    "qId": 15
  },
  {
    "src": "Day02/New_PyDay02Question15sol.mp3",
    "target": "#questionBar",
    "title": "Q15 Solution Walkthrough",
    "type": "solution",
    "qId": 15
  }
],
    durations: [
  23.76,
  17.64,
  14.4,
  14.98,
  13.97,
  11.33,
  12.72,
  12.94,
  13.49,
  12.12,
  12.77,
  11.26,
  11.98,
  14.18,
  12.5,
  11.93,
  15.5,
  11.45,
  9.48,
  12.55,
  9.24,
  13.66,
  10.01,
  16.06,
  8.28,
  12.84,
  8.42,
  15.77,
  8.54,
  22.37,
  9.43,
  16.7,
  8.09,
  13.94,
  8.88,
  9.7,
  9.62,
  6.6,
  7.58,
  8.02,
  9.0,
  7.37,
  8.45,
  6.82,
  9.1,
  9.02,
  8.93,
  8.5
]
  }
};


function updateLoadingProgress(pct) {
  const bar = document.getElementById('pyLoadingBar');
  if (bar) bar.style.width = pct + '%';
}

async function loadPyodideRuntime() {
  try {
    updateLoadingProgress(20);
    if (typeof loadPyodide === 'function') {
      pyodide = await loadPyodide({
        indexURL: 'https://cdn.jsdelivr.net/pyodide/v0.25.0/full/'
      });
      updateLoadingProgress(70);

      // Pre-warm stdlib imports
      await pyodide.runPythonAsync(`
import sys, io, math, time, functools, copy
from collections import defaultdict, Counter, namedtuple
from decimal import Decimal
print("Python 3.11 engine ready.")
`);
      updateLoadingProgress(100);
      pyodideReady = true;

      const runBtn = document.getElementById('runBtn');
      if (runBtn) {
        runBtn.disabled = false;
        runBtn.textContent = '▶ Run';
      }
      const testRunBtn = document.getElementById('testRunBtn');
      if (testRunBtn) {
        testRunBtn.disabled = false;
        testRunBtn.textContent = '▶ Run';
      }

      const initMsg = document.getElementById('outputInitMsg');
      if (initMsg) initMsg.textContent = '⚡ Python 3.11 engine ready. Write code and click Run!';
    }
  } catch (err) {
    console.warn('Pyodide background loading notice:', err);
    const initMsg = document.getElementById('outputInitMsg');
    if (initMsg && !pyodideReady) initMsg.textContent = '⚠️ Python runtime loading in background...';
  }
}

// ── Initialisation ────────────────────────────────────────────

function init() {
  initTheme();
  updateOverallScoreUI();

  // Dismiss loading overlay smoothly so UI is immediately interactive
  setTimeout(() => {
    const overlay = document.getElementById('pyLoadingOverlay');
    if (overlay) {
      overlay.style.opacity = '0';
      overlay.style.transition = 'opacity 0.25s ease';
      setTimeout(() => { overlay.style.display = 'none'; }, 250);
    }
  }, 100);

  // Initialize CodeMirror editor
  initMainEditor();

  // Build Day Selector
  buildDaySelector();

  // Resolve current day
  const urlParams = new URLSearchParams(window.location.search);
  let pathDay = null;
  const pathMatch = window.location.pathname.match(/day(\d+)\.html/i);
  if (pathMatch) pathDay = parseInt(pathMatch[1], 10);
  const requestedDay = parseInt(urlParams.get('day'), 10) || window.COURSE_DAY || pathDay || 1;

  let initialDay = null;
  if (window.COURSE_MANIFEST && window.COURSE_MANIFEST.length > 0) {
    initialDay = window.COURSE_MANIFEST.find(d => d.day === requestedDay) || window.COURSE_MANIFEST[0];
  }
  if (initialDay) {
    loadDay(initialDay.id);
  } else {
    // Fallback direct load
    const fallbackId = requestedDay === 2 ? 'pyDay02' : 'pyDay01';
    loadDay(fallbackId);
  }

  // Setup resizable divider
  initDivider();

  // Background runtime loading
  loadPyodideRuntime();

  // Close popovers when clicking outside
  document.addEventListener('click', e => {
    const qWrapper = document.getElementById('qPickerWrapper');
    const qPopover = document.getElementById('qPickerPopover');
    if (qWrapper && !qWrapper.contains(e.target) && qPopover) {
      qPopover.style.display = 'none';
    }

    const chapBtn = document.getElementById('chapterPillBtn');
    const chapList = document.getElementById('chapterList');
    if (chapBtn && !chapBtn.contains(e.target) && chapList && !chapList.contains(e.target)) {
      chapList.style.display = 'none';
    }

    const volWrapper = document.querySelector('.volume-control-wrapper');
    const volPopover = document.getElementById('volumePopover');
    if (volWrapper && !volWrapper.contains(e.target) && volPopover) {
      volPopover.classList.remove('open');
      document.getElementById('volumeBtn')?.classList.remove('active');
    }

    const speedWrapper = document.querySelector('.speed-control-wrapper');
    const speedPopover = document.getElementById('speedPopover');
    if (speedWrapper && !speedWrapper.contains(e.target) && speedPopover) {
      speedPopover.classList.remove('open');
      document.getElementById('speedControlBtn')?.classList.remove('active');
    }
  });

  // Hotkeys: Ctrl+Enter / Cmd+Enter runs code
  document.addEventListener('keydown', e => {
    if ((e.ctrlKey || e.metaKey) && e.key === 'Enter') {
      e.preventDefault();
      const testOverlay = document.getElementById('testOverlay');
      if (testOverlay && testOverlay.style.display === 'flex') {
        runTestCode();
      } else {
        runCurrentCode();
      }
    }
  });
}

function updateLoadingProgress(pct) {
  const bar = document.getElementById('pyLoadingBar');
  if (bar) bar.style.width = pct + '%';
}

// ── Theme Engine (100% Parity with SQL Studio) ──────────────────

function initTheme() {
  try {
    const saved = localStorage.getItem('manodemy-theme') || (window.matchMedia && window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'dark');
    document.documentElement.setAttribute('data-theme', saved);
    updateThemeToggleUI(saved);
  } catch (e) {
    console.error('Error initTheme:', e);
  }
}

function updateThemeToggleUI(theme) {
  const btn = document.getElementById('themeToggleBtn');
  if (!btn) return;
  const isLight = theme === 'light';
  btn.setAttribute('aria-checked', isLight ? 'true' : 'false');
  btn.title = isLight ? 'Switch to Dark mode' : 'Switch to Light mode';
  btn.setAttribute('aria-label', isLight ? 'Switch to Dark mode' : 'Switch to Light mode');
}

function toggleTheme() {
  try {
    const currentTheme = document.documentElement.getAttribute('data-theme') || 'dark';
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';

    document.body.classList.add('theme-transitioning');
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('manodemy-theme', newTheme);
    updateThemeToggleUI(newTheme);

    const isLight = newTheme === 'light';
    const cmTheme = isLight ? 'default' : 'dracula';
    if (typeof mainEditor !== 'undefined' && mainEditor) {
      mainEditor.setOption('theme', cmTheme);
      setTimeout(() => { try { mainEditor.refresh(); } catch (e) {} }, 50);
    }
    if (typeof testEditor !== 'undefined' && testEditor) {
      testEditor.setOption('theme', cmTheme);
      setTimeout(() => { try { testEditor.refresh(); } catch (e) {} }, 50);
    }

    setTimeout(() => {
      document.body.classList.remove('theme-transitioning');
    }, 400);
  } catch (e) {
    console.error('Error toggling theme:', e);
  }
}
window.initTheme = initTheme;
window.toggleTheme = toggleTheme;
window.updateThemeToggleUI = updateThemeToggleUI;

// ── Overall Scorecard Badge (/ 1500) ──────────────────────────

function updateOverallScoreUI() {
  let totalScore = 0;
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (raw) {
      const parsed = JSON.parse(raw);
      if (parsed && parsed.days) {
        Object.keys(parsed.days).forEach(k => {
          totalScore += (parsed.days[k].bestScore || 0);
          totalScore += (parsed.days[k].marks || 0);
        });
      }
    }
  } catch (e) {}

  const scoreEls = document.querySelectorAll('#headerOverallScore, #testHeaderOverallScore, .overall-score-num');
  scoreEls.forEach(el => {
    el.textContent = Math.round(totalScore);
  });

  const fills = document.querySelectorAll('#overallScoreBarFill, #testOverallScoreBarFill, .overall-score-bar-fill');
  const pct = Math.min(100, Math.max(0, (totalScore / 1500) * 100));
  fills.forEach(f => {
    f.style.width = `${pct}%`;
  });
}
window.updateOverallScoreUI = updateOverallScoreUI;

// ── Navigation & Day Selection ─────────────────────────────────

function buildDaySelector() {
  const sel = document.getElementById('daySelect');
  if (!sel) return;
  sel.innerHTML = '';

  const manifest = window.COURSE_MANIFEST || [
    { day: 1, id: 'pyDay01', title: 'Data Types & Memory', emoji: '🔢' },
    { day: 2, id: 'pyDay02', title: 'Operators & Expressions', emoji: '⚙️' }
  ];

  manifest.forEach(item => {
    const opt = document.createElement('option');
    opt.value = item.id;
    opt.textContent = `Day ${String(item.day).padStart(2,'0')}: ${item.title}`;
    sel.appendChild(opt);
  });

  sel.onchange = () => {
    const targetDay = manifest.find(m => m.id === sel.value);
    if (targetDay) {
      window.location.href = `/python/day${String(targetDay.day).padStart(2,'0')}.html`;
    }
  };
}

function loadDay(dayId) {
  currentDayId = dayId;
  currentDayData = (window.COURSE_CONTENT && window.COURSE_CONTENT[dayId]) || null;

  if (!currentDayData) {
    console.error(`Course data for ${dayId} not found.`);
    return;
  }

  // Sync daySelect dropdown value
  const daySel = document.getElementById('daySelect');
  if (daySel) daySel.value = dayId;

  // Initialize master timeline tracks for this day
  const registry = PYTHON_DAY_TRACKS[dayId] || PYTHON_DAY_TRACKS['pyDay01'];
  combinedTracks = registry.tracks.slice();
  combinedTrackDurations = registry.durations.slice();
  totalCombinedDuration = combinedTrackDurations.reduce((acc, d) => acc + d, 0);

  const seekBar = document.getElementById('seekBar');
  if (seekBar) {
    seekBar.max = totalCombinedDuration;
    seekBar.value = 0;
  }
  const pTime = document.getElementById('playbackTime');
  if (pTime) {
    pTime.textContent = `0:00 / ${formatTime(totalCombinedDuration)}`;
  }

  // Build topic selector & chapter list
  buildTopicSelector();
  buildChapterList();
  initCustomDropdowns();

  // Render the unified continuous lesson document
  currentSlideIndex = 0;
  renderSlide(0);

  // Load first practice question
  currentQuestionIndex = 0;
  buildQPickerList();
  loadPracticeQuestion(0);

  // Update stats
  updateStatsCard();
}

function buildTopicSelector() {
  const sel = document.getElementById('topicSelect');
  if (!sel || !currentDayData) return;
  sel.innerHTML = '';

  const topics = currentDayData.topics || [
    { id: 'topic-1', label: currentDayData.title || 'Topic 1: Lesson', duration: '12:00' }
  ];

  topics.forEach(t => {
    const opt = document.createElement('option');
    opt.value = t.id;
    opt.textContent = t.label;
    sel.appendChild(opt);
  });
}

function onTopicSelectChange(topicId) {
  const target = document.getElementById(topicId);
  if (target) {
    target.scrollIntoView({ behavior: 'smooth', block: 'start' });
  } else {
    const sc = document.getElementById('slideContent');
    if (sc) sc.scrollTop = 0;
  }
}

// ── Custom Dropdowns Initializer (100% SQL Flagship Parity) ───────
function initCustomDropdowns() {
  const selects = document.querySelectorAll('.day-picker-pill select');
  selects.forEach(select => {
    const wrapper = select.parentElement;
    if (!wrapper) return;

    select.style.display = 'none';

    let trigger = wrapper.querySelector('.custom-select-trigger');
    let optionsMenu = wrapper.querySelector('.custom-select-options');

    // Remove legacy loose dot and chevron elements to prevent duplicate icons
    wrapper.querySelectorAll('.day-picker-dot, .day-picker-chevron').forEach(el => {
      if (!el.closest('.custom-select-trigger')) el.remove();
    });

    if (!trigger) {
      trigger = document.createElement('div');
      trigger.className = 'custom-select-trigger';
      wrapper.appendChild(trigger);
    }

    if (!trigger.querySelector('.selected-text')) {
      trigger.innerHTML = `
        <span class="selected-text"></span>
        <span class="day-picker-chevron">
          <svg width="10" height="6" viewBox="0 0 10 6" fill="none"><path d="M1 1.5L5 5L9 1.5" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
        </span>
      `;
    }

    if (!optionsMenu) {
      optionsMenu = document.createElement('div');
      optionsMenu.className = 'custom-select-options';
      wrapper.appendChild(optionsMenu);
    }

    function updateTriggerText() {
      const textSpan = trigger.querySelector('.selected-text');
      if (!textSpan) return;

      if (select.id === 'daySelect') {
        const val = select.value || currentDayId || 'pyDay01';
        let dayNumStr = '01';
        if (val.toLowerCase().includes('02') || val.toLowerCase().includes('day2')) dayNumStr = '02';
        else if (val.toLowerCase().includes('01') || val.toLowerCase().includes('day1')) dayNumStr = '01';
        else {
          const match = val.match(/\d+/);
          if (match) dayNumStr = String(match[0]).padStart(2, '0');
        }

        const svgIcons = window.SVG_TRACK_ICONS || {};
        const iconHtml = svgIcons.python || '<span class="track-logo-badge track-logo-python" title="Python Track"><svg viewBox="45.9 0 367.2 459" fill="none" style="width:14px;height:14px;"><path fill="#306998" d="M229.5 0C161.4 0 122.4 15.6 122.4 53.6v34.4h107.1v15.3H122.4c-47.8 0-76.5 30.6-76.5 76.5v61.2c0 45.9 28.7 76.5 76.5 76.5h30.6v-45.9c0-51 41.3-91.8 91.8-91.8h107.1V107.1c0-53.6-47.8-107.1-122.4-107.1zM175.9 30.6c8.4 0 15.3 6.9 15.3 15.3s-6.9 15.3-15.3 15.3-15.3-6.9-15.3-15.3 6.9-15.3 15.3-15.3z" /><path fill="#FFE873" d="M229.5 459c68.1 0 107.1-15.6 107.1-53.6v-34.4H229.5v-15.3h107.1c47.8 0 76.5-30.6 76.5-76.5v-61.2c0-45.9-28.7-76.5-76.5-76.5h-30.6v45.9c0 51-41.3 91.8-91.8 91.8H122.4V351.9c0 53.6 47.8 107.1 22.4 107.1zm53.6-30.6c-8.4 0-15.3-6.9-15.3-15.3s6.9-15.3 15.3-15.3 15.3-6.9 15.3-15.3z" /></svg></span>';

        textSpan.innerHTML = `
          <span style="display:inline-flex;align-items:center;gap:6px;">
            ${iconHtml}
            <strong>Day ${dayNumStr}</strong>
          </span>
        `;
      } else if (select.id === 'topicSelect') {
        const topics = (currentDayData && currentDayData.topics) || [];
        const activeTopic = topics.find(t => t.id === select.value) || topics[0];
        const topicTitle = activeTopic ? activeTopic.label : (currentDayData ? currentDayData.title : 'Overview');
        const topicDuration = activeTopic && activeTopic.duration ? activeTopic.duration : (currentDayData && currentDayData.slides[0]?.duration ? currentDayData.slides[0].duration : '12:00');

        textSpan.innerHTML = `
          <span class="trigger-title">${topicTitle}</span>
          <span class="trigger-duration-badge">${topicDuration}</span>
        `;
      }
    }

    function populateOptions() {
      optionsMenu.innerHTML = '';
      const svgIcons = window.SVG_TRACK_ICONS || {};
      const allDays = window.COURSE_MANIFEST_60 || [];

      if (select.id === 'daySelect' && allDays.length > 0) {
        // Group all 60 days into 3 categorized sections
        const tracks = [
          { key: 'sql', label: '🗄️ SQL Mastery (Days 01–18)', days: allDays.filter(d => d.track === 'sql') },
          { key: 'excel', label: '📊 Advanced Excel & BI (Days 19–30)', days: allDays.filter(d => d.track === 'excel') },
          { key: 'python', label: '🐍 Python for Data Analysis (Days 31–60)', days: allDays.filter(d => d.track === 'python') }
        ];

        tracks.forEach(trackGroup => {
          const header = document.createElement('div');
          header.className = 'dropdown-section-header';
          header.innerHTML = `<span>${trackGroup.label}</span>`;
          optionsMenu.appendChild(header);

          trackGroup.days.forEach(d => {
            const isSelected = (select.value === d.id || currentDayId === d.id || (currentDayId === 'pyDay01' && d.id === 'pyDay01') || (currentDayId === 'pyDay02' && d.id === 'pyDay02'));
            const isLocked = (!d.prepared && !d.free);
            const optionItem = document.createElement('div');
            optionItem.className = `custom-select-option${isSelected ? ' selected' : ''}${isLocked ? ' is-locked' : ''}`;

            const iconSvg = svgIcons[d.track] || '';
            const dayNumStr = String(d.trackDay || d.globalDay).padStart(2, '0');

            let badgeHtml = '';
            if (isLocked) {
              badgeHtml = '<span class="day-coming-soon-badge" title="Under active development">Coming Soon</span>';
            } else if (d.free) {
              badgeHtml = '<span class="day-free-badge">FREE</span>';
            }

            optionItem.innerHTML = `
              <span class="option-day-tag">
                <span class="track-icon-wrap">${iconSvg}</span>
                <span style="display:flex;flex-direction:column;gap:1px;overflow:hidden;">
                  <strong>Day ${dayNumStr}</strong>
                  <span class="option-day-title">${d.title}</span>
                </span>
              </span>
              ${badgeHtml}
            `;

            optionItem.dataset.value = d.id;
            optionItem.addEventListener('click', (e) => {
              e.stopPropagation();
              if (isLocked) {
                alert(`Day ${dayNumStr} (${d.title}) is currently under active preparation and coming soon!`);
                return;
              }
              window.location.href = d.url;
            });
            optionsMenu.appendChild(optionItem);
          });
        });
      } else if (select.id === 'topicSelect') {
        const topics = (currentDayData && currentDayData.topics) || [];
        topics.forEach((t, idx) => {
          const optionItem = document.createElement('div');
          const isSelected = (select.value === t.id || (!select.value && idx === 0));
          optionItem.className = `custom-select-option${isSelected ? ' selected' : ''}`;
          optionItem.innerHTML = `
            <span class="option-title">${t.label}</span>
            <span class="option-duration">${t.duration || '2:00'}</span>
          `;
          optionItem.dataset.value = t.id;
          optionItem.addEventListener('click', (e) => {
            e.stopPropagation();
            select.value = t.id;
            select.dispatchEvent(new Event('change'));
            optionsMenu.classList.remove('open');
            wrapper.classList.remove('open');
            trigger.classList.remove('open');

            // Smooth scroll directly to the selected section
            const sec = document.getElementById(t.id);
            if (sec) {
              sec.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
          });
          optionsMenu.appendChild(optionItem);
        });
      }

      wrapper.onclick = (e) => {
        e.stopPropagation();
        const isOpen = optionsMenu.classList.contains('open');
        document.querySelectorAll('.custom-select-options').forEach(menu => {
          menu.classList.remove('open');
          menu.parentElement.classList.remove('open');
          if (menu.previousElementSibling) menu.previousElementSibling.classList.remove('open');
        });
        if (!isOpen) {
          optionsMenu.classList.add('open');
          wrapper.classList.add('open');
          trigger.classList.add('open');
        }
      };

      updateTriggerText();
    }

    populateOptions();

    select.addEventListener('change', () => {
      updateTriggerText();
      optionsMenu.querySelectorAll('.custom-select-option').forEach(el => {
        if (el.dataset.value === select.value) {
          el.classList.add('selected');
        } else {
          el.classList.remove('selected');
        }
      });
    });

    const observer = new MutationObserver(() => {
      populateOptions();
    });
    observer.observe(select, { childList: true });

    if (!Object.getOwnPropertyDescriptor(select, 'value')) {
      const descriptor = Object.getOwnPropertyDescriptor(HTMLSelectElement.prototype, 'value');
      Object.defineProperty(select, 'value', {
        configurable: true,
        get() {
          return descriptor.get.call(this);
        },
        set(val) {
          descriptor.set.call(this, val);
          updateTriggerText();
          optionsMenu.querySelectorAll('.custom-select-option').forEach(el => {
            if (el.dataset.value === String(val)) {
              el.classList.add('selected');
            } else {
              el.classList.remove('selected');
            }
          });
        }
      });
    }
  });

  // Global click outside listener to close dropdown menus
  document.addEventListener('click', () => {
    document.querySelectorAll('.custom-select-options').forEach(menu => {
      menu.classList.remove('open');
      menu.parentElement.classList.remove('open');
      if (menu.previousElementSibling) menu.previousElementSibling.classList.remove('open');
    });
  });
}
window.initCustomDropdowns = initCustomDropdowns;

function buildChapterList() {
  const list = document.getElementById('chapterList');
  if (!list || !combinedTracks || combinedTracks.length === 0) return;
  list.innerHTML = '';

  const typeIcons = { narration: '▶', question: '❓', solution: '✅', completion: '🏆' };
  let elapsed = 0;

  combinedTracks.forEach((t, idx) => {
    const dur = combinedTrackDurations[idx] || 0;
    const item = document.createElement('div');
    item.className = 'chapter-item' + (idx === combinedTrackIndex ? ' active' : '');
    item.dataset.idx = idx;
    item.setAttribute('role', 'option');
    item.innerHTML = `
      <span class="chapter-item__icon">${typeIcons[t.type] || '▶'}</span>
      <span class="chapter-item__time">${formatTime(elapsed)}</span>
      <span class="chapter-item__title">${t.title}</span>`;
    item.addEventListener('click', (e) => {
      e.stopPropagation();
      seekCombinedPlayback(elapsed);
      if (!isCombinedPlaying) playCombinedPlayback();
      list.style.display = 'none';
    });
    list.appendChild(item);
    elapsed += dur;
  });
}

function updateChapterListActive() {
  const listEl = document.getElementById('chapterList');
  if (listEl) {
    listEl.querySelectorAll('.chapter-item').forEach(item => {
      item.classList.toggle('active', parseInt(item.dataset.idx, 10) === combinedTrackIndex);
    });
  }
  const titleEl = document.getElementById('activeChapterTitle');
  if (titleEl && combinedTracks && combinedTracks[combinedTrackIndex]) {
    titleEl.textContent = combinedTracks[combinedTrackIndex].title || 'In this lesson';
  }
}

function toggleChapterList(event) {
  if (event && event.stopPropagation) event.stopPropagation();
  const list = document.getElementById('chapterList');
  if (!list) return;
  list.style.display = list.style.display === 'none' ? 'block' : 'none';
  if (list.style.display === 'block') {
    buildChapterList();
    updateChapterListActive();
  }
}

function renderSlide(index) {
  if (!currentDayData || !currentDayData.slides || !currentDayData.slides[index]) return;
  currentSlideIndex = index;
  const slide = currentDayData.slides[index];

  // Update header text
  const slideHeader = document.getElementById('slideHeader');
  if (slideHeader) {
    const h2 = slideHeader.querySelector('h2');
    if (h2) h2.textContent = slide.title;
  }
  const activeChapterTitle = document.getElementById('activeChapterTitle');
  if (activeChapterTitle) {
    activeChapterTitle.textContent = slide.title.length > 28 ? slide.title.substring(0, 26) + '…' : slide.title;
  }

  // Render unified continuous document
  const bodyText = document.getElementById('slideBodyText');
  if (bodyText) {
    bodyText.innerHTML = slide.html;
    const skel = document.getElementById('slideSkeleton');
    if (skel) skel.style.display = 'none';
  }

  updateChapterListActive();
}

function playAudio(src, btn) {
  if (!src) return;
  const audioSrc = src.startsWith('http') || src.startsWith('/') ? src : `/python/${src}`;

  // Toggle pause if already playing this file
  if (currentPlayingAudio && currentPlayingAudio.src.endsWith(src)) {
    if (currentPlayingAudio.paused) {
      currentPlayingAudio.play().catch(e => console.warn(e));
      if (btn) {
        btn.innerHTML = `<svg class="pause-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z"/></svg>`;
        btn.classList.add('playing');
      }
    } else {
      currentPlayingAudio.pause();
      if (btn) {
        btn.innerHTML = `<svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>`;
        btn.classList.remove('playing');
      }
    }
    return;
  }

  if (currentPlayingAudio) {
    currentPlayingAudio.pause();
    if (currentPlayingBtn) {
      currentPlayingBtn.innerHTML = `<svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>`;
      currentPlayingBtn.classList.remove('playing');
    }
  }

  currentPlayingAudio = new Audio(audioSrc);
  currentPlayingBtn = btn;
  currentPlayingAudio.playbackRate = currentPlaybackRate;
  currentPlayingAudio.volume = isMuted ? 0 : currentPlaybackVolume;

  currentPlayingAudio.onplay = () => {
    if (btn) {
      btn.innerHTML = `<svg class="pause-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z"/></svg>`;
      btn.classList.add('playing');
    }
  };

  currentPlayingAudio.onpause = () => {
    if (btn) {
      btn.innerHTML = `<svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>`;
      btn.classList.remove('playing');
    }
  };

  currentPlayingAudio.onended = () => {
    if (btn) {
      btn.innerHTML = `<svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>`;
      btn.classList.remove('playing');
    }
    currentPlayingAudio = null;
    currentPlayingBtn = null;
  };

  currentPlayingAudio.onerror = (err) => {
    console.warn("Audio file error:", src, err);
    if (btn) {
      btn.innerHTML = `<svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>`;
      btn.classList.remove('playing');
    }
  };

  currentPlayingAudio.play().catch(e => {
    console.warn("Audio play blocked:", e.message);
  });
}

function playQuestionAudio(btn) {
  const q = currentDayData && currentDayData.practiceQuestions && currentDayData.practiceQuestions[currentQuestionIndex];
  if (!q) return;
  const dayNum = String(currentDayData.day).padStart(2,'0');
  const qNum = String(currentQuestionIndex + 1).padStart(2,'0');
  const src = q.questionAudio || `Day${dayNum}/New_PyDay${dayNum}Question${qNum}.mp3`;
  playAudio(src, btn);
}

function playSolutionAudioFromBtn(btn) {
  const q = currentDayData && currentDayData.practiceQuestions && currentDayData.practiceQuestions[currentQuestionIndex];
  if (!q) return;
  const dayNum = String(currentDayData.day).padStart(2,'0');
  const qNum = String(currentQuestionIndex + 1).padStart(2,'0');
  const src = q.solutionAudio || `Day${dayNum}/New_PyDay${dayNum}Question${qNum}sol.mp3`;

  // Animate typewriter code in sync!
  if (q.ref && mainEditor) {
    typewriterCode(q.ref);
  }

  playAudio(src, btn);
}

function typewriterCode(targetCode) {
  if (!mainEditor) return;
  if (typewriterTimer) clearInterval(typewriterTimer);
  mainEditor.setValue('');
  let idx = 0;
  typewriterTimer = setInterval(() => {
    if (idx < targetCode.length) {
      mainEditor.setValue(targetCode.substring(0, idx + 1));
      mainEditor.setCursor(mainEditor.lineCount(), 0);
      idx++;
    } else {
      clearInterval(typewriterTimer);
      typewriterTimer = null;
    }
  }, 20);
}

// ── Master Timeline & Combined Playback ────────────────────────

let activeCombinedAudio = null;

function toggleCombinedPlayback() {
  if (isCombinedPlaying) {
    pauseCombinedPlayback();
  } else {
    playCombinedPlayback();
  }
}

function playCombinedPlayback() {
  isCombinedPlaying = true;
  updatePlayButtonStates(true);
  playTrackSegment(combinedTrackIndex);
}

function pauseCombinedPlayback() {
  isCombinedPlaying = false;
  updatePlayButtonStates(false);

  if (activeCombinedAudio) {
    try { activeCombinedAudio.pause(); } catch(e) {}
  }
  if (playbackTimerInterval) {
    clearInterval(playbackTimerInterval);
    playbackTimerInterval = null;
  }
}

function playTrackSegment(trackIdx) {
  if (!isCombinedPlaying) return;
  if (trackIdx < 0 || trackIdx >= combinedTracks.length) {
    onCombinedPlaybackEnded();
    return;
  }

  combinedTrackIndex = trackIdx;
  const track = combinedTracks[trackIdx];
  updateChapterListActive();

  // Scroll and illuminate active content
  if (track.type === 'question' && track.qId) {
    loadPracticeQuestion(track.qId - 1);
    const qBar = document.getElementById('questionBar');
    if (qBar) qBar.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
  } else if (track.type === 'solution' && track.qId) {
    loadPracticeQuestion(track.qId - 1);
    const q = currentDayData.practiceQuestions && currentDayData.practiceQuestions[track.qId - 1];
    if (q && q.ref && mainEditor) {
      typewriterCode(q.ref);
    }
    const qBar = document.getElementById('questionBar');
    if (qBar) qBar.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
  } else {
    // Theory narration track
    const targetEl = track.target ? document.querySelector(track.target) : null;
    document.querySelectorAll('.slide-section').forEach(sec => {
      sec.classList.remove('active-narration');
    });
    if (targetEl) {
      const sec = targetEl.closest('.slide-section') || targetEl;
      sec.classList.add('active-narration');
      sec.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }
  }

  // Caption banner
  const captionBox = document.getElementById('workspaceVpCaption');
  if (captionBox) {
    captionBox.style.display = 'block';
    captionBox.textContent = `📢 Narrator: "${track.title}"`;
  }

  let startOffset = 0;
  for (let i = 0; i < trackIdx; i++) {
    startOffset += combinedTrackDurations[i];
  }
  currentCombinedTime = startOffset;
  updateProgressUI();

  if (activeCombinedAudio) {
    try { activeCombinedAudio.pause(); } catch(e) {}
    activeCombinedAudio = null;
  }

  const audioSrc = track.src.startsWith('http') || track.src.startsWith('/') ? track.src : `/python/${track.src}`;
  activeCombinedAudio = new Audio(audioSrc);
  activeCombinedAudio.playbackRate = currentPlaybackRate;
  activeCombinedAudio.volume = isMuted ? 0 : currentPlaybackVolume;

  activeCombinedAudio.ontimeupdate = () => {
    if (isCombinedPlaying && activeCombinedAudio) {
      currentCombinedTime = startOffset + activeCombinedAudio.currentTime;
      updateProgressUI();
    }
  };

  activeCombinedAudio.onended = () => {
    if (isCombinedPlaying && combinedTrackIndex === trackIdx) {
      if (track.type === 'solution') {
        if (typeof runCurrentCode === 'function') {
          runCurrentCode();
        }
      }
      playTrackSegment(trackIdx + 1);
    }
  };

  activeCombinedAudio.onerror = (err) => {
    console.warn("Audio error for track:", track.src, err);
    if (isCombinedPlaying && combinedTrackIndex === trackIdx) {
      playTrackSegment(trackIdx + 1);
    }
  };

  activeCombinedAudio.play().catch(e => {
    console.warn("Audio play blocked:", e.message);
    if (isCombinedPlaying && combinedTrackIndex === trackIdx) {
      playTrackSegment(trackIdx + 1);
    }
  });
}

function seekCombinedPlayback(val) {
  const targetTime = parseFloat(val);
  let elapsed = 0;
  let trackIdx = 0;

  for (let i = 0; i < combinedTrackDurations.length; i++) {
    const dur = combinedTrackDurations[i];
    if (targetTime < elapsed + dur) {
      trackIdx = i;
      break;
    }
    elapsed += dur;
    if (i === combinedTrackDurations.length - 1) {
      trackIdx = i;
    }
  }

  currentCombinedTime = targetTime;
  updateProgressUI();

  if (activeCombinedAudio) {
    try { activeCombinedAudio.pause(); } catch(e) {}
  }
  if ('speechSynthesis' in window) {
    window.speechSynthesis.cancel();
  }

  if (isCombinedPlaying) {
    playTrackSegment(trackIdx);
  } else {
    combinedTrackIndex = trackIdx;
  }
}

function skipCombined(seconds) {
  if (!totalCombinedDuration) return;
  const target = Math.max(0, Math.min(totalCombinedDuration, currentCombinedTime + seconds));
  seekCombinedPlayback(target);
}

function onCombinedPlaybackEnded() {
  isCombinedPlaying = false;
  currentCombinedTime = 0;
  combinedTrackIndex = 0;
  if (playbackTimerInterval) {
    clearInterval(playbackTimerInterval);
    playbackTimerInterval = null;
  }
  updatePlayButtonStates(false);
  updateProgressUI();

  combinedTracks.forEach(t => {
    t.element.classList.remove('active-narration');
    t.element.classList.remove('inactive-narration');
  });

  const captionBox = document.getElementById('workspaceVpCaption');
  if (captionBox) captionBox.style.display = 'none';
}

function updateProgressUI() {
  const seekBar = document.getElementById('seekBar');
  const playbackTime = document.getElementById('playbackTime');
  const tooltip = document.getElementById('timelineHoverTooltip');

  if (seekBar) {
    seekBar.max = totalCombinedDuration || 100;
    seekBar.value = currentCombinedTime;
  }
  if (playbackTime) {
    playbackTime.textContent = `${formatTime(currentCombinedTime)} / ${formatTime(totalCombinedDuration)}`;
  }
  if (tooltip) {
    tooltip.textContent = formatTime(currentCombinedTime);
  }
}

function formatTime(secs) {
  const m = Math.floor(secs / 60);
  const s = Math.floor(secs % 60);
  return `${m}:${s < 10 ? '0' : ''}${s}`;
}

function updatePlayButtonStates(isPlaying) {
  const navBtn = document.getElementById('navPlayBtn');
  const barBtn = document.getElementById('playPauseBtn');

  if (navBtn) {
    navBtn.innerHTML = isPlaying
      ? `<span class="btn-icon">⏸</span> <span class="btn-text">Pause Lesson</span>`
      : `<span class="btn-icon">▶</span> <span class="btn-text">Play Lesson</span>`;
  }
  if (barBtn) {
    barBtn.innerHTML = isPlaying
      ? `<span class="btn-icon" aria-hidden="true">⏸</span><span class="btn-text">Pause Lesson</span>`
      : `<span class="btn-icon" aria-hidden="true">&#9654;</span><span class="btn-text">Play Lesson</span>`;
    barBtn.setAttribute('aria-pressed', isPlaying ? 'true' : 'false');
  }
}

function toggleVolumePopover(event) {
  event.stopPropagation();
  const popover = document.getElementById('volumePopover');
  const volBtn = document.getElementById('volumeBtn');
  popover?.classList.toggle('open');
  volBtn?.classList.toggle('active');
}

function toggleSpeedPopover(event) {
  event.stopPropagation();
  const popover = document.getElementById('speedPopover');
  const speedBtn = document.getElementById('speedControlBtn');
  popover?.classList.toggle('open');
  speedBtn?.classList.toggle('active');
}

function setPlaybackVolume(val) {
  currentPlaybackVolume = parseFloat(val) / 100;
  isMuted = currentPlaybackVolume === 0;
  const label = document.getElementById('volumeValue');
  if (label) label.textContent = `${Math.round(val)}%`;
  if (currentPlayingAudio) currentPlayingAudio.volume = currentPlaybackVolume;
}

function selectSpeedOption(rate, label) {
  currentPlaybackRate = rate;
  const speedLabel = document.getElementById('speedValueLabel');
  if (speedLabel) speedLabel.textContent = label;

  const options = document.querySelectorAll('.speed-option');
  options.forEach(opt => {
    opt.classList.toggle('active', opt.textContent.trim() === label);
  });

  const popover = document.getElementById('speedPopover');
  popover?.classList.remove('open');
  document.getElementById('speedControlBtn')?.classList.remove('active');

  if (currentPlayingAudio) currentPlayingAudio.playbackRate = rate;
}

// ── Practice Questions & CodeMirror Workbench ──────────────────

function initMainEditor() {
  const wrap = document.getElementById('mainEditorWrap');
  if (!wrap || mainEditor) return;

  const isLight = document.documentElement.getAttribute('data-theme') === 'light';

  mainEditor = CodeMirror(wrap, {
    value: '',
    mode: 'python',
    theme: isLight ? 'default' : 'dracula',
    lineNumbers: true,
    autoCloseBrackets: true,
    matchBrackets: true,
    indentUnit: 4,
    tabSize: 4,
    indentWithTabs: false,
    extraKeys: {
      Tab: cm => cm.execCommand('indentMore'),
      'Shift-Tab': cm => cm.execCommand('indentLess'),
      'Ctrl-Enter': () => runCurrentCode(),
      'Cmd-Enter': () => runCurrentCode(),
    },
    lineWrapping: true,
  });
  window.mainEditor = mainEditor;
}

function buildQPickerList() {
  const list = document.getElementById('qPickerList');
  if (!list || !currentDayData || !currentDayData.practiceQuestions) return;
  list.innerHTML = '';

  const headerEl = document.querySelector('#qPickerPopover .q-picker-header');
  let solvedCount = 0;
  const questions = currentDayData.practiceQuestions;

  // Retrieve saved solved questions from localStorage
  let solvedIds = [];
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    const data = raw ? JSON.parse(raw) : { days: {} };
    if (data.days && data.days[currentDayId] && data.days[currentDayId].solved) {
      solvedIds = data.days[currentDayId].solved;
    }
  } catch (e) {}

  questions.forEach((q, idx) => {
    const isSolved = solvedIds.includes(q.id);
    if (isSolved) solvedCount++;
    const isActive = idx === currentQuestionIndex;

    // Extract clean title and badge from prompt
    let title = '';
    let badge = '';

    const strongMatch = (q.prompt || '').match(/<strong>(.*?)<\/strong>/i);
    if (strongMatch) {
      let rawTitle = strongMatch[1].replace(/<[^>]*>/g, '').trim();
      const tagMatch = rawTitle.match(/^\[(.*?)\]\s*(.*)$/);
      if (tagMatch) {
        badge = tagMatch[1];
        title = tagMatch[2];
      } else if (rawTitle.toLowerCase().startsWith('task:')) {
        title = rawTitle.substring(5).trim();
      } else {
        title = rawTitle;
      }
    }

    if (!title) {
      const clean = (q.prompt || '')
        .replace(/<\/(p|div|strong|h\d)>|<br\s*\/?>/gi, ' ')
        .replace(/<[^>]*>/g, '')
        .replace(/\s+/g, ' ')
        .trim();
      title = clean.length > 55 ? clean.substring(0, 52) + '…' : clean;
    }

    const qNum = String(q.id || idx + 1).padStart(2, '0');

    const btn = document.createElement('button');
    btn.className = 'q-picker-item' + (isActive ? ' q-picker-item--active active' : '');
    btn.setAttribute('role', 'option');
    btn.setAttribute('aria-selected', isActive ? 'true' : 'false');
    btn.setAttribute('data-idx', idx);
    btn.title = `Question ${qNum}: ${title}`;

    const esc = str => (str || '').replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

    btn.innerHTML = `
      <span class="q-picker-item-num">Q${qNum}</span>
      <div class="q-picker-item-main">
        <span class="q-picker-item-title">${esc(title)}</span>
        ${badge ? `<span class="q-picker-item-badge">${esc(badge)}</span>` : ''}
      </div>
      <span class="q-picker-item-status ${isSolved ? 'is-solved' : ''}">
        ${isSolved ? `<svg width="12" height="12" viewBox="0 0 16 16" fill="none">
          <circle cx="8" cy="8" r="7" fill="rgba(34, 197, 94, 0.2)" stroke="#16a34a" stroke-width="1.5"/>
          <path d="M5 8.2l2 2 4.2-4.2" stroke="#16a34a" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>` : `<span class="q-picker-item-dot"></span>`}
      </span>
    `;
    btn.onclick = () => {
      selectQuestion(idx);
      closeQPicker();
    };
    list.appendChild(btn);
  });

  if (headerEl) {
    headerEl.innerHTML = `<span>Practice Questions (${questions.length})</span> <span class="q-picker-count-badge">${solvedCount}/${questions.length} Solved</span>`;
  }

  // Auto scroll active into view
  setTimeout(() => {
    const activeItem = list.querySelector('.q-picker-item--active, .q-picker-item.active');
    if (activeItem) activeItem.scrollIntoView({ block: 'nearest' });
  }, 10);
}

function openQPicker() {
  const popover = document.getElementById('qPickerPopover');
  const trigger = document.getElementById('qPickerTrigger');
  if (!popover) return;
  buildQPickerList();
  popover.style.display = 'flex';
  if (trigger) trigger.setAttribute('aria-expanded', 'true');
  setTimeout(() => {
    document.addEventListener('click', _qPickerOutsideClick, { once: true });
  }, 0);
}

function closeQPicker() {
  const popover = document.getElementById('qPickerPopover');
  const trigger = document.getElementById('qPickerTrigger');
  if (popover) popover.style.display = 'none';
  if (trigger) trigger.setAttribute('aria-expanded', 'false');
  document.removeEventListener('click', _qPickerOutsideClick);
}

function _qPickerOutsideClick(e) {
  const wrapper = document.getElementById('qPickerWrapper');
  if (wrapper && !wrapper.contains(e.target)) {
    closeQPicker();
  } else {
    const popover = document.getElementById('qPickerPopover');
    if (popover && popover.style.display !== 'none') {
      document.addEventListener('click', _qPickerOutsideClick, { once: true });
    }
  }
}

function toggleQPicker(event) {
  if (event) event.stopPropagation();
  const popover = document.getElementById('qPickerPopover');
  if (popover && popover.style.display !== 'none') {
    closeQPicker();
  } else {
    openQPicker();
  }
}

function selectQuestion(idx) {
  currentQuestionIndex = idx;
  loadPracticeQuestion(idx);
}

function prevQuestion() {
  if (currentQuestionIndex > 0) {
    selectQuestion(currentQuestionIndex - 1);
  }
}

function nextQuestion() {
  if (currentDayData && currentDayData.practiceQuestions && currentQuestionIndex < currentDayData.practiceQuestions.length - 1) {
    selectQuestion(currentQuestionIndex + 1);
  }
}

function loadPracticeQuestion(idx) {
  if (!currentDayData || !currentDayData.practiceQuestions || !currentDayData.practiceQuestions[idx]) return;
  const q = currentDayData.practiceQuestions[idx];

  // Update prompt
  const promptEl = document.getElementById('questionPrompt');
  if (promptEl) promptEl.innerHTML = q.prompt;

  // Update counter
  const counter = document.getElementById('qCounter');
  if (counter) counter.textContent = `Question-${String(q.id).padStart(2, '0')}`;

  // Update editor with saved user code or starterCode (never preload default boilerplate)
  const saved = getSavedQuestionCode(currentDayId, q.id);
  let initialCode = '';
  const isStaleBoilerplate = saved && (
    saved.startsWith('# Q') ||
    saved.startsWith('# Write your') ||
    saved.includes('# TODO:') ||
    saved.includes('Loading question...')
  );

  if (saved && !isStaleBoilerplate) {
    initialCode = saved;
  } else if (q.starterCode && q.starterCode.trim() !== '') {
    initialCode = q.starterCode;
  } else {
    initialCode = '';
  }

  if (mainEditor) {
    mainEditor.setValue(initialCode);
    mainEditor.clearHistory();
  }

  // Update picker list active state
  const list = document.getElementById('qPickerList');
  if (list) {
    const items = list.querySelectorAll('.q-picker-item');
    items.forEach((it, i) => it.classList.toggle('active', i === idx));
  }

  // Clear output terminal
  clearOutput();
}

function peekSolution() {
  const q = currentDayData && currentDayData.practiceQuestions && currentDayData.practiceQuestions[currentQuestionIndex];
  if (!q || !q.ref || !mainEditor) return;
  mainEditor.setValue(q.ref);
}

function resetCode() {
  const q = currentDayData && currentDayData.practiceQuestions && currentDayData.practiceQuestions[currentQuestionIndex];
  if (!mainEditor) return;
  const starter = (q && q.starterCode && q.starterCode.trim() !== '') ? q.starterCode : '';
  mainEditor.setValue(starter);
  mainEditor.clearHistory();
  clearOutput();
}

function clearEditor() {
  if (mainEditor) {
    mainEditor.setValue('');
    mainEditor.clearHistory();
  }
}

function clearOutput() {
  const out = document.getElementById('mainOutput');
  if (out) {
    out.innerHTML = '<div class="output-label">Terminal Output</div><span class="output-success">⚡ Write your Python code above and click "Run" to execute it!</span>';
  }
}

async function runCurrentCode() {
  if (!pyodideReady) {
    renderOutput({ stdout: '', stderr: '' }, document.getElementById('mainOutput'), false, 'Python engine still loading… please wait a moment.');
    return;
  }

  const q = currentDayData && currentDayData.practiceQuestions && currentDayData.practiceQuestions[currentQuestionIndex];
  if (!q) return;

  const code = mainEditor ? mainEditor.getValue() : '';
  const outDiv = document.getElementById('mainOutput');

  if (!code || code.trim() === '') {
    renderOutput({ stdout: '', stderr: '' }, outDiv, false, '⚠️ Please enter your Python code before running.');
    return;
  }

  // Save draft
  saveQuestionCode(currentDayId, q.id, code);

  // Execute in Pyodide
  const start = performance.now();
  const out = await executePython(code);
  const duration = Math.round(performance.now() - start);

  // Grade submission if grader available
  let passed = false;
  let gradeMsg = '';
  if (typeof window.pyGradeSubmission === 'function') {
    const grade = await window.pyGradeSubmission(code, q, pyodide, out);
    passed = grade.passed;
    gradeMsg = grade.message;
  } else {
    // Fallback: check no error
    passed = !out.error;
    gradeMsg = passed ? '✅ Code executed successfully.' : '⚠️ Execution encountered an error.';
  }

  // Render output
  renderOutput(out, outDiv, passed, gradeMsg, duration);

  if (passed) {
    markQuestionSolved(currentDayId, q.id);
    updateStatsCard();
    updateOverallScoreUI();
  }
}

async function executePython(code) {
  if (!pyodide) return { stdout: '', stderr: 'Python runtime is not loaded yet. Please wait a moment.', error: true };
  if (!code || code.trim() === '') {
    return { stdout: '', stderr: 'Editor is empty. Write your Python code above and click Run.', error: true };
  }

  let stdout = '';
  let stderr = '';
  let error = false;

  try {
    pyodide.globals.set('__student_code__', code);
    await pyodide.runPythonAsync(`
import sys, io as _io, ast as _ast

_buf_stdout = _io.StringIO()
_buf_stderr = _io.StringIO()
_old_stdout = sys.stdout
_old_stderr = sys.stderr
sys.stdout = _buf_stdout
sys.stderr = _buf_stderr

_init_keys = set(globals().keys())

try:
    _parsed = _ast.parse(__student_code__)
    if _parsed.body:
        _last = _parsed.body[-1]
        if isinstance(_last, _ast.Expr):
            # Execute leading statements if any
            if len(_parsed.body) > 1:
                exec(compile(_ast.Module(body=_parsed.body[:-1], type_ignores=[]), '<student_code>', 'exec'), globals())
            # Evaluate last expression
            _eval_val = eval(compile(_ast.Expression(_last.value), '<student_code>', 'eval'), globals())
            if _eval_val is not None:
                print(_eval_val)
        else:
            exec(compile(_parsed, '<student_code>', 'exec'), globals())
            # If no stdout was produced by print(), display newly assigned user variables
            if not _buf_stdout.getvalue().strip():
                _assigned = [
                    k for k in globals().keys() 
                    if not k.startswith('_') and k not in _init_keys and k != '__student_code__'
                ]
                for _k in _assigned:
                    print(f"{_k} = {repr(globals()[_k])}")
except Exception as _err:
    import traceback
    traceback.print_exc(file=_buf_stderr)
finally:
    sys.stdout = _old_stdout
    sys.stderr = _old_stderr
`);

    stdout = String(await pyodide.runPythonAsync(`_buf_stdout.getvalue()`));
    stderr = String(await pyodide.runPythonAsync(`_buf_stderr.getvalue()`));
    if (stderr.trim()) {
      error = true;
    }
  } catch (err) {
    stderr = err.message || String(err);
    error = true;
  }

  return { stdout, stderr, error };
}

function renderOutput(out, container, passed, gradeMsg, duration) {
  if (!container) return;
  const execTimeBadge = duration ? `<span class="exec-badge" style="float:right;font-size:0.75rem;color:var(--cyan);background:rgba(0,230,246,0.1);padding:2px 8px;border-radius:4px;">⚡ ${duration}ms</span>` : '';

  let html = `<div class="output-label">Terminal Output ${execTimeBadge}</div>`;

  const hasStdout = Boolean(out && out.stdout && out.stdout.trim() !== '');
  const hasStderr = Boolean(out && out.stderr && out.stderr.trim() !== '');

  // 1. Terminal Console STDOUT (Displayed FIRST so student sees their printed output immediately)
  if (hasStdout) {
    html += `<pre class="output-stdout" style="margin:6px 0 10px 0;font-family:var(--mono, 'JetBrains Mono', monospace);font-size:0.88rem;color:var(--terminal-text, inherit);white-space:pre-wrap;line-height:1.55;background:rgba(255,255,255,0.04);border:1px solid rgba(255,255,255,0.08);border-radius:6px;padding:8px 12px;word-break:break-word;">${escHtml(out.stdout.trimEnd())}</pre>`;
  }

  // 2. Terminal Console STDERR (Displayed if runtime or syntax error)
  if (hasStderr) {
    html += `<pre class="output-stderr" style="margin:6px 0 10px 0;font-family:var(--mono, 'JetBrains Mono', monospace);font-size:0.85rem;color:#f87171;white-space:pre-wrap;line-height:1.5;background:rgba(239,68,68,0.08);border:1px solid rgba(239,68,68,0.25);border-radius:6px;padding:8px 12px;word-break:break-word;">${escHtml(out.stderr.trimEnd())}</pre>`;
  }

  // 3. Grader Evaluation Status Banner (Displayed below program output)
  if (gradeMsg) {
    const bannerColor = passed ? '#16a34a' : '#dc2626';
    const bannerBorder = passed ? '#22c55e' : '#ef4444';
    const bannerBg = passed ? 'rgba(34,197,94,0.12)' : 'rgba(239,68,68,0.12)';
    html += `<div class="terminal-grade-banner" style="background:${bannerBg};border-left:4px solid ${bannerBorder};padding:8px 12px;border-radius:6px;margin-bottom:6px;font-size:0.85rem;color:${bannerColor};font-weight:600;white-space:pre-wrap;line-height:1.45;">${gradeMsg}</div>`;
  }

  // 4. Default prompt if no output, no errors, and no grade message
  if (!hasStdout && !hasStderr && !gradeMsg) {
    html += `<span class="output-success">⚡ Write your Python code above and click "Run" to execute it!</span>`;
  }

  container.innerHTML = html;
}

function escHtml(str) {
  return (str || '').replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}

// ── Mobile Syntax Chips ────────────────────────────────────────

function insertPythonSnippet(snippet) {
  if (!mainEditor) return;
  const doc = mainEditor.getDoc();
  const cursor = doc.getCursor();
  doc.replaceRange(snippet, cursor);
  mainEditor.focus();
}
window.insertPythonSnippet = insertPythonSnippet;

// ── Timed Test Portal (25 Questions) ───────────────────────────

function openTestPortal() {
  const overlay = document.getElementById('testOverlay');
  if (!overlay || !currentDayData || !currentDayData.testQuestions) return;

  overlay.style.display = 'flex';
  document.body.style.overflow = 'hidden';

  // Build sidebar with 25 questions
  buildTestSidebar();

  // Load question 0
  currentTestQuestionIndex = 0;
  loadTestQuestion(0);

  // Start countdown timer
  startTestTimer();
}

function closeTestPortal() {
  const overlay = document.getElementById('testOverlay');
  if (overlay) overlay.style.display = 'none';
  document.body.style.overflow = '';
  if (testTimerInterval) {
    clearInterval(testTimerInterval);
    testTimerInterval = null;
  }
}

function buildTestSidebar() {
  const sidebar = document.getElementById('testSidebar');
  if (!sidebar || !currentDayData || !currentDayData.testQuestions) return;
  sidebar.innerHTML = '';

  currentDayData.testQuestions.forEach((q, idx) => {
    const btn = document.createElement('button');
    btn.className = 'test-q-btn' + (idx === currentTestQuestionIndex ? ' active' : '');
    btn.textContent = `Q${q.id}`;
    btn.onclick = () => loadTestQuestion(idx);
    sidebar.appendChild(btn);
  });
}

function loadTestQuestion(idx) {
  if (!currentDayData || !currentDayData.testQuestions || !currentDayData.testQuestions[idx]) return;
  currentTestQuestionIndex = idx;
  const q = currentDayData.testQuestions[idx];

  // Update prompt
  const promptEl = document.getElementById('testQuestionPrompt');
  if (promptEl) promptEl.innerHTML = `<strong>Question ${q.id}:</strong> ${q.prompt}`;

  // Update counter
  const qCounter = document.getElementById('testQCounter');
  if (qCounter) qCounter.textContent = `Q${q.id} / ${currentDayData.testQuestions.length}`;

  // CodeMirror instance for test
  const isLight = document.documentElement.getAttribute('data-theme') === 'light';
  const saved = testAnswers[q.id];
  const initialCode = saved ? saved.code : (q.starterCode || '');

  if (!testEditor) {
    const wrap = document.getElementById('testEditorWrap');
    if (wrap) {
      testEditor = CodeMirror(wrap, {
        value: initialCode,
        mode: 'python',
        theme: isLight ? 'default' : 'dracula',
        lineNumbers: true,
        autoCloseBrackets: true,
        matchBrackets: true,
        indentUnit: 4,
        tabSize: 4,
        indentWithTabs: false,
        lineWrapping: true,
      });
    }
  } else {
    testEditor.setValue(initialCode);
    testEditor.clearHistory();
  }
  window.testEditor = testEditor;

  // Update sidebar active buttons
  const sidebar = document.getElementById('testSidebar');
  if (sidebar) {
    const btns = sidebar.querySelectorAll('.test-q-btn');
    btns.forEach((b, i) => b.classList.toggle('active', i === idx));
  }

  // Clear test output
  const testOut = document.getElementById('testOutput');
  if (testOut) testOut.innerHTML = '<div class="output-label">Terminal Output</div><span class="output-success">Ready...</span>';
}

async function runTestCode() {
  if (!pyodideReady || !currentDayData || !currentDayData.testQuestions) return;
  const q = currentDayData.testQuestions[currentTestQuestionIndex];
  if (!q) return;

  const code = testEditor ? testEditor.getValue() : '';
  const testOut = document.getElementById('testOutput');

  const start = performance.now();
  const out = await executePython(code);
  const duration = Math.round(performance.now() - start);

  let passed = false;
  let gradeMsg = '';
  if (typeof window.pyGradeSubmission === 'function') {
    const grade = await window.pyGradeSubmission(code, q, pyodide, out);
    passed = grade.passed;
    gradeMsg = grade.message;
  } else {
    passed = !out.error;
    gradeMsg = passed ? '✅ Valid submission.' : '⚠️ Error in code.';
  }

  testAnswers[q.id] = { code, passed, message: gradeMsg, stdout: out.stdout };

  renderOutput(out, testOut, passed, gradeMsg, duration);

  // Update sidebar button style
  const sidebar = document.getElementById('testSidebar');
  if (sidebar) {
    const btn = sidebar.querySelectorAll('.test-q-btn')[currentTestQuestionIndex];
    if (btn) {
      btn.classList.add(passed ? 'answered-correct' : 'answered');
    }
  }

  updateTestProgress();
}

function clearTestEditor() {
  if (testEditor) testEditor.setValue('');
}

function updateTestProgress() {
  const attempted = Object.keys(testAnswers).length;
  const total = currentDayData && currentDayData.testQuestions ? currentDayData.testQuestions.length : 25;
  const el = document.getElementById('testProgress');
  if (el) el.textContent = `Attempted: ${attempted} / ${total}`;

  const attemptedCountEl = document.getElementById('testAttemptedCount');
  if (attemptedCountEl) attemptedCountEl.textContent = attempted;

  const fill = document.getElementById('testProgressFill');
  if (fill) fill.style.width = `${Math.round((attempted / total) * 100)}%`;
}

function submitTest() {
  if (!currentDayData || !currentDayData.testQuestions) return;
  const qs = currentDayData.testQuestions;
  let passedCount = 0;

  const tbody = document.getElementById('scorecardBody');
  if (tbody) tbody.innerHTML = '';

  qs.forEach(q => {
    const ans = testAnswers[q.id];
    const isPass = ans && ans.passed;
    if (isPass) passedCount++;

    if (tbody) {
      const tr = document.createElement('tr');
      const badge = isPass
        ? `<span class="badge badge-success" style="color:#22c55e;font-weight:700;">PASSED</span>`
        : `<span class="badge badge-fail" style="color:#ef4444;font-weight:700;">FAILED</span>`;
      tr.innerHTML = `<td>Q${q.id}</td><td>${badge}</td><td><code style="font-family:var(--font-mono);font-size:0.8rem;">${escHtml((ans ? ans.code : '').substring(0, 45))}…</code></td>`;
      tbody.appendChild(tr);
    }
  });

  const bigScore = document.getElementById('scoreBig');
  if (bigScore) bigScore.textContent = `${passedCount} / ${qs.length}`;

  const meta = document.getElementById('scoreMeta');
  const elapsedMins = Math.floor((7200 - testSecondsLeft) / 60);
  const elapsedSecs = (7200 - testSecondsLeft) % 60;
  if (meta) meta.textContent = `Time spent: ${String(elapsedMins).padStart(2,'0')}:${String(elapsedSecs).padStart(2,'0')} • Accuracy: ${Math.round((passedCount / qs.length) * 100)}%`;

  // Persist test best score
  saveTestScore(currentDayId, passedCount);
  updateOverallScoreUI();

  // Show scorecard modal
  const scorecard = document.getElementById('scorecardOverlay');
  if (scorecard) scorecard.style.display = 'flex';
}

function closeScorecard() {
  const scorecard = document.getElementById('scorecardOverlay');
  if (scorecard) scorecard.style.display = 'none';
  closeTestPortal();
}

function startTestTimer() {
  testSecondsLeft = 7200; // 2 hours
  if (testTimerInterval) clearInterval(testTimerInterval);

  testTimerInterval = setInterval(() => {
    if (testSecondsLeft > 0) {
      testSecondsLeft--;
      const m = Math.floor(testSecondsLeft / 60);
      const s = testSecondsLeft % 60;
      const el = document.getElementById('testTimer');
      if (el) el.textContent = `${String(m).padStart(2,'0')}:${String(s).padStart(2,'0')}`;
    } else {
      clearInterval(testTimerInterval);
      testTimerInterval = null;
      submitTest();
    }
  }, 1000);
}

// ── Progress & Persistence ─────────────────────────────────────

function markQuestionSolved(dayId, qId) {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    const data = raw ? JSON.parse(raw) : { days: {} };
    if (!data.days[dayId]) data.days[dayId] = { solved: [], marks: 0, bestScore: 0 };
    if (!data.days[dayId].solved.includes(qId)) {
      data.days[dayId].solved.push(qId);
      data.days[dayId].marks = data.days[dayId].solved.length;
    }
    localStorage.setItem(STORAGE_KEY, JSON.stringify(data));
  } catch (e) {}
}

function saveQuestionCode(dayId, qId, code) {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    const data = raw ? JSON.parse(raw) : { days: {} };
    if (!data.days[dayId]) data.days[dayId] = { solved: [], codes: {} };
    if (!data.days[dayId].codes) data.days[dayId].codes = {};
    data.days[dayId].codes[qId] = code;
    localStorage.setItem(STORAGE_KEY, JSON.stringify(data));
  } catch (e) {}
}

function getSavedQuestionCode(dayId, qId) {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) return null;
    const data = JSON.parse(raw);
    return data.days && data.days[dayId] && data.days[dayId].codes ? data.days[dayId].codes[qId] : null;
  } catch (e) {
    return null;
  }
}

function saveTestScore(dayId, score) {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    const data = raw ? JSON.parse(raw) : { days: {} };
    if (!data.days[dayId]) data.days[dayId] = { solved: [], marks: 0, bestScore: 0 };
    data.days[dayId].bestScore = Math.max(data.days[dayId].bestScore || 0, score);
    localStorage.setItem(STORAGE_KEY, JSON.stringify(data));
  } catch (e) {}
}

function updateStatsCard() {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    const data = raw ? JSON.parse(raw) : { days: {} };
    const dayData = (data.days && data.days[currentDayId]) || { solved: [], marks: 0 };

    const totalQ = currentDayData && currentDayData.practiceQuestions ? currentDayData.practiceQuestions.length : 15;
    const solvedNum = dayData.solved.length;
    const marksNum = dayData.solved.length;

    const solvedEl = document.getElementById('solvedCount');
    if (solvedEl) solvedEl.textContent = solvedNum;
    const totalQEl = document.getElementById('totalQuestions');
    if (totalQEl) totalQEl.textContent = totalQ;

    const marksEl = document.getElementById('marksCount');
    if (marksEl) marksEl.textContent = marksNum.toFixed(1);
    const totalMarksEl = document.getElementById('totalMarks');
    if (totalMarksEl) totalMarksEl.textContent = Number(totalQ).toFixed(1);

    const fill = document.getElementById('statsProgressFill');
    if (fill) fill.style.width = `${Math.min(100, Math.round((solvedNum / totalQ) * 100))}%`;
  } catch (e) {}
}

// ── Resizable Split Divider ───────────────────────────────────

function initDivider() {
  const divider = document.getElementById('divider');
  const panelLeft = document.getElementById('panelLeft');
  const panelRight = document.getElementById('panelRight');
  const container = document.getElementById('workspaceContainer');
  if (!divider || !panelLeft || !panelRight || !container) return;

  let isDragging = false;

  divider.addEventListener('mousedown', e => {
    if (e.target.closest('.divider-toggles')) return;
    isDragging = true;
    document.body.style.cursor = 'col-resize';
    document.body.style.userSelect = 'none';
  });

  document.addEventListener('mousemove', e => {
    if (!isDragging) return;
    const rect = container.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const totalWidth = rect.width;
    const leftWidth = Math.max(280, Math.min(totalWidth - 320, x));
    const rightWidth = totalWidth - leftWidth - 6;

    panelLeft.style.flex = `0 0 ${leftWidth}px`;
    panelRight.style.flex = `0 0 ${rightWidth}px`;
    if (mainEditor) mainEditor.refresh();
  });

  document.addEventListener('mouseup', () => {
    if (isDragging) {
      isDragging = false;
      document.body.style.cursor = '';
      document.body.style.userSelect = '';
      if (mainEditor) mainEditor.refresh();
    }
  });
}

function toggleLeftPanel(e) {
  if (e) e.stopPropagation();
  const panelLeft = document.getElementById('panelLeft');
  const panelRight = document.getElementById('panelRight');
  if (!panelLeft || !panelRight) return;
  panelLeft.style.flex = '0 0 0px';
  panelRight.style.flex = '1 1 auto';
  panelLeft.style.display = 'none';
  if (mainEditor) mainEditor.refresh();
}

function toggleRightPanel(e) {
  if (e) e.stopPropagation();
  const panelLeft = document.getElementById('panelLeft');
  const panelRight = document.getElementById('panelRight');
  if (!panelLeft || !panelRight) return;
  panelRight.style.flex = '0 0 0px';
  panelLeft.style.flex = '1 1 auto';
  panelRight.style.display = 'none';
  if (mainEditor) mainEditor.refresh();
}

function resetSplitScreen(e) {
  if (e) e.stopPropagation();
  const panelLeft = document.getElementById('panelLeft');
  const panelRight = document.getElementById('panelRight');
  if (!panelLeft || !panelRight) return;
  panelLeft.style.display = 'flex';
  panelRight.style.display = 'flex';
  panelLeft.style.flex = '1 1 50%';
  panelRight.style.flex = '1 1 50%';
  if (mainEditor) mainEditor.refresh();
}

function setMobileTab(tab) {
  const container = document.getElementById('workspaceContainer');
  const btnPractice = document.getElementById('tabBtnPractice');
  const btnTheory = document.getElementById('tabBtnTheory');
  if (!container) return;

  if (tab === 'practice') {
    container.classList.remove('mobile-show-theory');
    container.classList.add('mobile-show-practice');
    btnPractice?.classList.add('active');
    btnTheory?.classList.remove('active');
  } else {
    container.classList.remove('mobile-show-practice');
    container.classList.add('mobile-show-theory');
    btnTheory?.classList.add('active');
    btnPractice?.classList.remove('active');
  }
}

// Compatibility no-ops for legacy slide nav
function prevSlide() {}
function nextSlide() {}

// ── Export globals ─────────────────────────────────────────────
window.init = init;
window.loadDay = loadDay;
window.renderSlide = renderSlide;
window.prevSlide = prevSlide;
window.nextSlide = nextSlide;
window.toggleChapterList = toggleChapterList;
window.onTopicSelectChange = onTopicSelectChange;
window.toggleCombinedPlayback = toggleCombinedPlayback;
window.seekCombinedPlayback = seekCombinedPlayback;
window.skipCombined = skipCombined;
window.setPlaybackVolume = setPlaybackVolume;
window.toggleVolumePopover = toggleVolumePopover;
window.toggleSpeedPopover = toggleSpeedPopover;
window.selectSpeedOption = selectSpeedOption;
window.playAudio = playAudio;
window.playQuestionAudio = playQuestionAudio;
window.playSolutionAudioFromBtn = playSolutionAudioFromBtn;
window.prevQuestion = prevQuestion;
window.nextQuestion = nextQuestion;
window.selectQuestion = selectQuestion;
window.toggleQPicker = toggleQPicker;
window.peekSolution = peekSolution;
window.resetCode = resetCode;
window.clearEditor = clearEditor;
window.runCurrentCode = runCurrentCode;
window.openTestPortal = openTestPortal;
window.closeTestPortal = closeTestPortal;
window.loadTestQuestion = loadTestQuestion;
window.runTestCode = runTestCode;
window.clearTestEditor = clearTestEditor;
window.submitTest = submitTest;
window.closeScorecard = closeScorecard;
window.toggleLeftPanel = toggleLeftPanel;
window.toggleRightPanel = toggleRightPanel;
window.resetSplitScreen = resetSplitScreen;
window.setMobileTab = setMobileTab;

// Start on DOM ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', init);
} else {
  init();
}

// ── Mobile Theme Toggle Relocation ──
function initMobileThemeToggle() {
  const mql = window.matchMedia('(max-width: 768px)');
  function relocateToggle(e) {
    const btn = document.getElementById('themeToggleBtn');
    const dayNav = document.querySelector('.day-navigation');
    const headerRight = document.querySelector('.header-right');
    const topicPill = document.querySelector('.topic-picker-pill');
    if (!btn || !dayNav || !headerRight) return;

    if (e.matches) {
      dayNav.appendChild(btn);
    } else {
      if (headerRight.firstChild !== btn) {
        headerRight.insertBefore(btn, headerRight.firstChild);
      }
    }
  }
  mql.addEventListener('change', relocateToggle);
  relocateToggle(mql);
}
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initMobileThemeToggle);
} else {
  initMobileThemeToggle();
}
