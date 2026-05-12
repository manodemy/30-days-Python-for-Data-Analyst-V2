// ═══════════════════════════════════════════════════════════════════════
// MANO VOICE ASSISTANT v2.0 — Manodemy Intelligent Coding Tutor
// Browser-native Web Speech API — zero cost, zero lag
// Optimized: GPU-accelerated animations, cached DOM refs, zero main-thread blocking
// ═══════════════════════════════════════════════════════════════════════

const ManoVoice = (() => {
  'use strict';

  // ── STATE ──
  let muted = false;
  let streak = 0;
  let correctCount = 0;
  let lastMilestone = 0;
  let voice = null;
  let voicesReady = false;
  let toastTimer = null;
  let muteBtn = null;  // cached DOM ref

  // ── CONFIG ──
  const RATE = 0.95;
  const PITCH = 1.05;
  const TOAST_MS = 5000;

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 1: RESPONSE POOLS
  // ═══════════════════════════════════════════════════════════════════
  const R = {
    ok: [
      "Perfect! That's the right answer.",
      "Well done! You nailed it.",
      "Correct! Great job.",
      "That's exactly right. Keep going!",
      "Spot on! You're getting good at this.",
      "Brilliant! Moving on.",
      "Yes! That's correct.",
      "Nice work! You got it."
    ],
    noOut: [
      "Your code ran without errors, but there's no output. Did you forget to print your result?",
      "Almost there! Your code works, but I can't see any output. Try adding a print statement.",
      "No errors, nice! But the output is empty. Make sure you're printing your answer.",
      "Good start! But nothing was printed. Wrap your answer in a print function."
    ],
    close: [
      "You're on the right track, but not quite there yet. Re-read the question carefully.",
      "Almost! Your approach looks close, but check your logic one more time.",
      "Good thinking, but the output doesn't match what's expected. Try again.",
      "You're close! Double-check your values and try running it again.",
      "Not bad! But something's slightly off. Look at the question requirements again."
    ],
    wrong: [
      "Hmm, that doesn't seem to answer the question. Read it again and try a different approach.",
      "Your code works, but it's not solving the right problem. Check the question.",
      "That's not quite what the question is asking for. Take another look.",
      "Try re-reading the question. Your code is doing something different from what's asked."
    ],
    s3: "You're on fire! Three in a row!",
    s5: "Five in a row! You're absolutely crushing it!",
    s10: "Ten in a row! You're a Python machine!",
    brk: "Streak broken! No worries, that was a good run.",
    first: "And you're off! First question solved. Keep this momentum going.",
    half: "Halfway there! You're doing amazing. Keep pushing.",
    done: "Incredible! You've completed every question on this page. You're ready for the next day!"
  };

  const pick = a => a[(Math.random() * a.length) | 0];

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 2: ERROR HINT ENGINE (22 types, 50+ sub-variants)
  // ═══════════════════════════════════════════════════════════════════
  function hint(msg) {
    const lo = msg.toLowerCase();

    // SyntaxError
    if (lo.includes('syntaxerror')) {
      if (lo.includes('eol while scanning') || lo.includes('unterminated string'))
        return "You have an unclosed string. Make sure every opening quote has a matching closing quote.";
      if (lo.includes('unexpected eof') || lo.includes('was never closed'))
        return "You have an unclosed bracket or parenthesis. Count your opening and closing brackets.";
      if (lo.includes('unmatched'))
        return "You have a mismatched bracket. Check that every opening bracket has the correct closing bracket.";
      if (lo.includes('invalid character') || lo.includes('unexpected character'))
        return "There's an invalid character in your code. Check for smart quotes or hidden characters.";
      if (lo.includes('missing parentheses') && lo.includes('print'))
        return "In Python 3, print is a function. You need parentheses around your value.";
      if (lo.includes('f-string'))
        return "There's an issue with your f-string. Make sure your curly braces are balanced and contain valid expressions.";
      if (lo.includes("expected ':'") || lo.includes('expected colon'))
        return "You're missing a colon. If statements, loops, and function definitions need a colon at the end.";
      if (lo.includes('cannot assign') || lo.includes('cannot use assignment'))
        return "You can't use assignment here. Did you mean double equals for comparison?";
      return "You have a syntax error. Check for missing colons, unmatched brackets, or typos in your code.";
    }

    // IndentationError
    if (lo.includes('indentationerror')) {
      if (lo.includes('unexpected indent'))
        return "Python found an unexpected indent. Remove any extra spaces at the beginning of the line.";
      if (lo.includes('expected an indented block'))
        return "Python expects an indented block here. After if, for, or def, the next line must be indented by 4 spaces.";
      if (lo.includes('unindent does not match'))
        return "Your indentation levels don't match. Make sure each block uses the same number of spaces.";
      return "There's an indentation problem. Use 4 spaces for each level. Don't mix tabs and spaces.";
    }

    // TabError
    if (lo.includes('taberror'))
      return "You're mixing tabs and spaces. Python doesn't allow this. Use only spaces, 4 per indent level.";

    // NameError
    if (lo.includes('nameerror')) {
      if (lo.includes('pritn') || lo.includes('pirnt') || lo.includes('prit'))
        return "Looks like a typo! Did you mean to type print?";
      if (lo.includes('retrun') || lo.includes('reutrn') || lo.includes('retrn'))
        return "Small typo! Did you mean return?";
      if (lo.includes('ture') || lo.includes('treu'))
        return "Check your spelling! It's True with a capital T.";
      if (lo.includes('flase') || lo.includes('fasle'))
        return "Check your spelling! It's False with a capital F.";
      if (lo.includes('lenght') || lo.includes('legth'))
        return "Small typo! The correct function is len, not length.";
      if (lo.includes('defien') || lo.includes('dfe'))
        return "Typo alert! The keyword is def for defining functions.";
      if (lo.includes('inpt'))
        return "Small typo! Did you mean input?";
      return "You're using a variable that hasn't been defined. Check for typos, or make sure you defined it first.";
    }

    // TypeError
    if (lo.includes('typeerror')) {
      if (lo.includes('can only concatenate str') || (lo.includes('unsupported operand') && lo.includes('str')))
        return "You're trying to combine a string and a number. Use str to convert the number, or use an f-string.";
      if (lo.includes('is not callable'))
        return "You're trying to call something that isn't a function. Check if you used parentheses on a variable.";
      if (lo.includes('positional argument') || (lo.includes('missing') && lo.includes('required')))
        return "Wrong number of arguments. Check the function definition and match the parameters.";
      if (lo.includes('is not subscriptable'))
        return "You're trying to use square bracket indexing on something that doesn't support it.";
      if (lo.includes('is not iterable'))
        return "You're trying to loop over something that isn't iterable. Make sure it's a list, tuple, or string.";
      if (lo.includes('cannot unpack'))
        return "The unpacking doesn't match. Make sure the number of variables matches the values.";
      if (lo.includes('nonetype'))
        return "You're getting a NoneType error. Methods like sort and append return None. Don't assign their result.";
      if (lo.includes("'int' object is not iterable"))
        return "You're trying to iterate over a number. Use the range function for a sequence of numbers.";
      return "There's a type mismatch. You're using incompatible data types. Check your variable types.";
    }

    // ValueError
    if (lo.includes('valueerror')) {
      if (lo.includes('invalid literal'))
        return "You're trying to convert a string to a number, but the string isn't valid. Check your input.";
      if (lo.includes('too many values to unpack'))
        return "You have more values than variables. Add more variables on the left side.";
      if (lo.includes('not enough values to unpack'))
        return "You have fewer values than variables. Check the length of what you're unpacking.";
      if (lo.includes('math domain'))
        return "Math domain error! You might be taking the square root of a negative number or log of zero.";
      if (lo.includes('empty'))
        return "You're calling a function on an empty sequence. Make sure your list has elements.";
      return "The value you provided isn't valid for this operation. Check your input data.";
    }

    // IndexError
    if (lo.includes('indexerror')) {
      if (lo.includes('list'))
        return "List index out of range. Indexing starts at 0. A list with 5 items has indices 0 through 4.";
      if (lo.includes('tuple'))
        return "Tuple index out of range. Check the length of your tuple before accessing elements.";
      if (lo.includes('string'))
        return "String index out of range. Your string is shorter than the index you're accessing.";
      return "Index out of range. Use the len function to check the length before accessing by index.";
    }

    // KeyError
    if (lo.includes('keyerror'))
      return "That key doesn't exist in your dictionary. Check for typos, or use the get method instead.";

    // AttributeError
    if (lo.includes('attributeerror')) {
      if (lo.includes("'nonetype'"))
        return "You're calling a method on None. A previous operation returned None instead of a value.";
      if (lo.includes("'str'") && lo.includes('append'))
        return "Strings don't have append. Strings are immutable. Use concatenation or f-strings.";
      if (lo.includes("'list'"))
        return "Lists and strings have different methods. Check the right method for the right type.";
      return "This object doesn't have that method or property. Check the data type.";
    }

    // ZeroDivisionError
    if (lo.includes('zerodivisionerror'))
      return "You can't divide by zero! Add an if-check before dividing.";

    // ImportError / ModuleNotFoundError
    if (lo.includes('importerror') || lo.includes('modulenotfounderror') || lo.includes('no module named'))
      return "That module isn't available in the browser Python environment.";

    // UnboundLocalError
    if (lo.includes('unboundlocalerror'))
      return "You're using a variable inside a function before assigning it. Use the global keyword if needed.";

    // RecursionError
    if (lo.includes('recursionerror') || lo.includes('maximum recursion'))
      return "Your function is calling itself infinitely! Add a base case to stop the recursion.";

    // StopIteration
    if (lo.includes('stopiteration'))
      return "The iterator ran out of items. You called next on a generator with no more values.";

    // OverflowError
    if (lo.includes('overflowerror'))
      return "The number is too large for this operation. Try a smaller number.";

    // AssertionError
    if (lo.includes('assertionerror'))
      return "An assertion failed. The condition in your assert is False. Review your logic.";

    // RuntimeError
    if (lo.includes('runtimeerror'))
      return "A runtime error occurred. Check your code logic carefully.";

    // NotImplementedError
    if (lo.includes('notimplementederror'))
      return "This method hasn't been implemented. Override the abstract method in your class.";

    // FileNotFoundError
    if (lo.includes('filenotfounderror') || lo.includes('no such file'))
      return "File not found. This runs in your browser, local files aren't accessible.";

    // EOFError
    if (lo.includes('eoferror'))
      return "The input function doesn't work in the browser. Assign values directly instead.";

    // UnicodeError
    if (lo.includes('unicodeerror') || lo.includes('unicodedecodeerror') || lo.includes('unicodeencodeerror'))
      return "Character encoding problem. Try using UTF-8 encoding.";

    // MemoryError
    if (lo.includes('memoryerror'))
      return "Your code is using too much memory. Check for infinite loops or huge data.";

    // Fallback
    return "Something went wrong. Read the error message carefully. The last line tells you what happened.";
  }

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 3: SPEECH ENGINE
  // ═══════════════════════════════════════════════════════════════════
  function loadVoices() {
    if (voicesReady || !window.speechSynthesis) return;
    const all = speechSynthesis.getVoices();
    if (!all.length) return;
    voicesReady = true;

    // Priority cascade: en-IN female → en-US female → en-GB female → any English → default
    const tests = [
      v => v.lang.startsWith('en-IN') && /female|aditi|raveena/i.test(v.name),
      v => v.lang.startsWith('en-IN'),
      v => v.lang.startsWith('en') && /female|zira|samantha|karen|fiona|moira|victoria|susan|hazel/i.test(v.name),
      v => v.lang.startsWith('en-US'),
      v => v.lang.startsWith('en-GB'),
      v => v.lang.startsWith('en'),
    ];
    for (const fn of tests) {
      const v = all.find(fn);
      if (v) { voice = v; return; }
    }
    voice = all[0];
  }

  function say(text) {
    if (muted || !window.speechSynthesis) return;

    // Cancel current speech instantly — no queue, no delay
    speechSynthesis.cancel();

    const u = new SpeechSynthesisUtterance(text);
    u.rate = RATE;
    u.pitch = PITCH;
    u.volume = 1;
    if (voice) u.voice = voice;

    u.onstart = () => { if (muteBtn) muteBtn.classList.add('mano-speaking'); };
    u.onend = () => { if (muteBtn) muteBtn.classList.remove('mano-speaking'); };
    u.onerror = () => { if (muteBtn) muteBtn.classList.remove('mano-speaking'); };

    speechSynthesis.speak(u);
  }

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 4: VISUAL FEEDBACK (Toast + Cell Glow)
  // GPU-accelerated: uses transform + opacity only (composite-only props)
  // ═══════════════════════════════════════════════════════════════════
  function toast(cellId, msg, icon, cls) {
    // Remove previous toast instantly
    const old = document.querySelector('.mano-toast');
    if (old) old.remove();
    clearTimeout(toastTimer);

    const cell = document.getElementById(cellId);
    if (!cell) return;

    const el = document.createElement('div');
    el.className = 'mano-toast ' + cls;
    el.innerHTML = '<span class="mano-toast-icon">' + icon + '</span><span class="mano-toast-text">' + msg + '</span>';
    cell.style.position = 'relative';
    cell.appendChild(el);

    // Force reflow then animate (single rAF — no double-rAF jank)
    requestAnimationFrame(() => {
      el.classList.add('mano-toast-visible');
    });

    toastTimer = setTimeout(() => {
      el.classList.remove('mano-toast-visible');
      setTimeout(() => { if (el.parentNode) el.remove(); }, 300);
    }, TOAST_MS);
  }

  function glow(cellId, cls) {
    const cell = document.getElementById(cellId);
    if (!cell) return;
    cell.classList.remove('mano-glow-correct', 'mano-glow-partial', 'mano-glow-error', 'mano-glow-streak');
    cell.classList.add(cls);
    setTimeout(() => cell.classList.remove(cls), 2000);
  }

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 5: MUTE BUTTON (injected once, cached)
  // ═══════════════════════════════════════════════════════════════════
  function injectUI() {
    if (document.getElementById('manoMuteBtn')) return; // prevent duplicates
    const btn = document.createElement('button');
    btn.id = 'manoMuteBtn';
    btn.className = 'mano-mute-btn' + (muted ? ' mano-muted' : '');
    btn.setAttribute('aria-label', 'Toggle Mano voice assistant');
    btn.title = 'Mano Voice Assistant';
    btn.textContent = muted ? '🔇' : '🔊';
    btn.addEventListener('click', toggleMute, { passive: true });
    document.body.appendChild(btn);
    muteBtn = btn; // cache ref
  }

  function toggleMute() {
    muted = !muted;
    try { localStorage.setItem('mano_voice_muted', muted ? '1' : '0'); } catch(e) {}
    if (muteBtn) {
      muteBtn.textContent = muted ? '🔇' : '🔊';
      muteBtn.classList.toggle('mano-muted', muted);
    }
    if (muted && window.speechSynthesis) speechSynthesis.cancel();
  }

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 6: PUBLIC API (called by notebook.js hooks)
  // All methods are synchronous, non-blocking, <1ms execution
  // ═══════════════════════════════════════════════════════════════════

  function onCorrect(cellId) {
    streak++;
    correctCount++;

    let line, icon, msg;

    if (streak === 3) {
      line = R.s3; icon = '🔥'; msg = '3 in a row!';
      glow(cellId, 'mano-glow-streak');
      toast(cellId, msg, icon, 'mano-toast-streak');
    } else if (streak === 5) {
      line = R.s5; icon = '🔥'; msg = '5 in a row!';
      glow(cellId, 'mano-glow-streak');
      toast(cellId, msg, icon, 'mano-toast-streak');
    } else if (streak === 10) {
      line = R.s10; icon = '🔥'; msg = '10 in a row!';
      glow(cellId, 'mano-glow-streak');
      toast(cellId, msg, icon, 'mano-toast-streak');
    } else if (correctCount === 1) {
      line = R.first; icon = '✅'; msg = 'First one solved!';
      glow(cellId, 'mano-glow-correct');
      toast(cellId, msg, icon, 'mano-toast-correct');
    } else {
      line = pick(R.ok); icon = '✅'; msg = 'Correct!';
      glow(cellId, 'mano-glow-correct');
      toast(cellId, msg, icon, 'mano-toast-correct');
    }

    say(line);
  }

  function onPartial(cellId, type) {
    const hadStreak = streak >= 3;
    streak = 0;

    let line, icon, msg;

    if (type === 'no_output') {
      line = pick(R.noOut); icon = '💡'; msg = 'No output — try print()';
      glow(cellId, 'mano-glow-partial');
      toast(cellId, msg, icon, 'mano-toast-partial');
    } else {
      line = pick(R.close); icon = '🤔'; msg = 'Almost there!';
      glow(cellId, 'mano-glow-partial');
      toast(cellId, msg, icon, 'mano-toast-partial');
    }

    say(hadStreak ? R.brk + ' ' + line : line);
  }

  function onWrong(cellId) {
    const hadStreak = streak >= 3;
    streak = 0;
    const line = pick(R.wrong);
    glow(cellId, 'mano-glow-error');
    toast(cellId, 'Re-read the question', '❌', 'mano-toast-error');
    say(hadStreak ? R.brk + ' ' + line : line);
  }

  function onError(cellId, errorMsg) {
    const hadStreak = streak >= 3;
    streak = 0;
    const h = hint(errorMsg);
    const errType = (errorMsg.match(/^(\w*Error)/m) || ['Error'])[0];
    glow(cellId, 'mano-glow-error');
    toast(cellId, errType + ' — listen for hint', '🐛', 'mano-toast-error');
    say(hadStreak ? R.brk + ' ' + h : h);
  }

  function checkMilestone(solved, total) {
    if (total <= 0) return;
    const half = Math.ceil(total / 2);
    if (solved === half && lastMilestone < half) {
      lastMilestone = half;
      say(R.half);
    }
    if (solved === total && lastMilestone < total) {
      lastMilestone = total;
      say(R.done);
      const nb = document.querySelector('.notebook');
      if (nb) { nb.classList.add('mano-glow-celebrate'); setTimeout(() => nb.classList.remove('mano-glow-celebrate'), 3000); }
    }
  }

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 7: INIT (runs once, <5ms)
  // ═══════════════════════════════════════════════════════════════════
  function init() {
    if (!window.speechSynthesis) return; // graceful degrade

    // Restore mute state
    try { muted = localStorage.getItem('mano_voice_muted') === '1'; } catch(e) {}

    // Load voices
    loadVoices();
    if (speechSynthesis.onvoiceschanged !== undefined) {
      speechSynthesis.onvoiceschanged = loadVoices;
    }

    injectUI();
  }

  // Auto-init — non-blocking
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init, { once: true });
  } else {
    init();
  }

  return { onCorrect, onPartial, onWrong, onError, checkMilestone };
})();
