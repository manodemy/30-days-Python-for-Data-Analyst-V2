// ═══════════════════════════════════════════════════════════════════════
// MANO VOICE ASSISTANT v3.0 — Natural Voice Teaching Experience
// Optimized for human-like delivery using premium browser voices
// Microsoft Edge Natural voices | Google Chrome Premium voices
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
  let muteBtn = null;

  // ── VOICE TUNING ──
  // These values are calibrated for the most natural conversational tone.
  // Rate 0.92 = slightly slower than default, feels thoughtful not robotic.
  // Pitch 1.0 = natural female range. Higher pitch sounds artificial.
  const RATE_NORMAL = 1.0;      // Natural conversational speed
  const RATE_CELEBRATE = 1.05;  // Celebrations — upbeat energy
  const RATE_ERROR = 0.95;      // Error hints — slightly slower for clarity
  const PITCH = 1.0;            // Keep natural — don't go above 1.05
  const TOAST_MS = 5000;

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 1: NATURAL RESPONSE POOLS
  // Written in conversational English with contractions and pauses.
  // Commas = micro-pauses. Periods = natural breath breaks.
  // Short sentences sound more human than long ones.
  // ═══════════════════════════════════════════════════════════════════
  const R = {
    ok: [
      "That's right. Nice work!",
      "Perfect! You got it.",
      "Yes! That's exactly right.",
      "Well done! Keep it up.",
      "Great job! That's correct.",
      "Spot on. Moving on!",
      "Brilliant! You nailed it.",
      "Correct! You're doing great."
    ],
    noOut: [
      "Hmm, your code ran fine, but I don't see any output. Did you forget to add a print statement?",
      "No errors, that's good! But nothing was printed. Try wrapping your answer in print.",
      "Your code works, but the output is empty. Make sure you're printing the result.",
      "Almost there! Just add a print statement so I can see your answer."
    ],
    close: [
      "You're close, but not quite. Take another look at the question.",
      "Good thinking! But the output doesn't match. Check your logic again.",
      "Almost! Double check your values and give it another try.",
      "You're on the right track. Re-read the question carefully.",
      "Not bad! But something's a little off. Try again."
    ],
    wrong: [
      "Hmm, that doesn't seem to match the question. Read it again and try a different approach.",
      "Your code works, but it's not solving the right problem. Take another look.",
      "That's not quite what's being asked. Check the question one more time.",
      "Try re-reading the question. Your code is doing something different from what's expected."
    ],
    s3: "Three in a row! You're on a roll!",
    s5: "Five in a row! You're absolutely crushing it!",
    s10: "Ten in a row! You're unstoppable!",
    brk: "Streak broken. No worries, that was a good run.",
    first: "First one down! Great start. Keep this going.",
    half: "You're halfway there! Keep pushing, you're doing amazing.",
    done: "You've completed every question on this page. Incredible work! You're ready for the next day."
  };

  const pick = a => a[(Math.random() * a.length) | 0];

  // ── Anti-Repeat Memory ──
  const lastSpoken = new Map();
  function smartPick(category, arr) {
    if (arr.length <= 1) return arr[0];
    let choice;
    let attempts = 0;
    do {
      choice = arr[(Math.random() * arr.length) | 0];
      attempts++;
    } while (choice === lastSpoken.get(category) && attempts < 10);
    lastSpoken.set(category, choice);
    return choice;
  }

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 2: ERROR HINT ENGINE
  // Written like a patient, friendly teacher explaining to a student.
  // Uses contractions (you're, don't, it's) for warmth.
  // ═══════════════════════════════════════════════════════════════════
  function hint(msg) {
    const lo = msg.toLowerCase();

    const nameMatch = msg.match(/NameError: name '([^']+)' is not defined/i);
    const attrMatch = msg.match(/AttributeError: '([^']+)' object has no attribute '([^']+)'/i);
    const keyMatch = msg.match(/KeyError: '([^']+)'/i);
    const typeMatch = msg.match(/TypeError: (.*)/i);

    // SyntaxError
    if (lo.includes('syntaxerror')) {
      if (lo.includes('eol while scanning') || lo.includes('unterminated string')) {
        return smartPick('syntax_str', [
          "Looks like you have an unclosed string. Make sure every quote has a matching closing quote.",
          "Oops, did you forget a matching quote? One of your strings never ended.",
          "Hmm, check your quotes. It seems a string was left open.",
          "I see an unterminated string. Make sure every starting quote has an ending quote.",
          "Wait, the string doesn't end. Double check your quotation marks.",
          "That's a syntax error for an unclosed string. Just add the missing quote."
        ]);
      }
      if (lo.includes('unexpected eof') || lo.includes('was never closed') || lo.includes('unmatched')) {
        return smartPick('syntax_bracket', [
          "You've got an unclosed bracket. Try counting your opening and closing parentheses.",
          "Oops, a mismatched bracket. Make sure every open bracket has a closed one.",
          "Hmm, look closely at your parentheses. One of them wasn't closed properly.",
          "Check your brackets. It looks like you forgot to close one.",
          "There's an unclosed parenthesis somewhere in there. Take a careful look."
        ]);
      }
      if (lo.includes("expected ':'") || lo.includes('expected colon')) {
        return smartPick('syntax_colon', [
          "You're missing a colon. Remember, if statements, loops, and functions need a colon at the end.",
          "Oops, don't forget the colon at the end of that line.",
          "Looks like a missing colon. Python needs that to start a new block.",
          "Hmm, expected a colon there. Double check the end of your statement.",
          "Just a small typo, you missed a colon!"
        ]);
      }
      return smartPick('syntax_gen', [
        "There's a syntax error. Check for missing colons, unmatched brackets, or typos.",
        "Hmm, that looks like a syntax error. Double check your commas and grammar.",
        "Oops, Python is confused by the syntax. Take a close look at the line.",
        "Check your syntax, something isn't quite right.",
        "Python couldn't parse this. Make sure your structure is correct."
      ]);
    }

    // IndentationError
    if (lo.includes('indentationerror')) {
      return smartPick('indent', [
        "There's an indentation issue. Stick to four spaces per level, and don't mix tabs with spaces.",
        "Oops, your spaces seem misaligned. Check the start of the line.",
        "Check your indentation there. Python is very strict about spaces.",
        "Hmm, looks like an indentation error. Remember to use exactly four spaces.",
        "Watch your spaces! Make sure everything lines up perfectly.",
        "That's an indentation error. Are you accidentally mixing tabs and spaces?"
      ]);
    }

    // NameError
    if (nameMatch) {
      const n = nameMatch[1];
      return smartPick('name_regex', [
        `Wait, what is ${n}? Python doesn't recognize that name yet.`,
        `Oops, I don't see anything defined as ${n}. Did you spell it correctly?`,
        `Hmm, ${n} isn't defined. Make sure you created it before trying to use it.`,
        `Python threw a name error for ${n}. Check your capitalization and spelling.`,
        `Looks like ${n} doesn't exist yet. Did you forget to run the cell above?`
      ]);
    }
    if (lo.includes('nameerror')) {
      return smartPick('name_gen', [
        "You're using a name that hasn't been defined yet. Check for typos, or make sure you defined it first.",
        "You're calling a variable that hasn't been defined. Check for spelling mistakes.",
        "Oops, that name isn't recognized. Make sure you typed it correctly.",
        "Name error spotted! Double check your spelling and capitalization.",
        "Hmm, Python doesn't know that name. Did you forget to define it?",
        "Check your variable names. One of them isn't defined yet."
      ]);
    }

    // TypeError
    if (typeMatch && !lo.includes('can only concatenate str') && !lo.includes('unsupported operand')) {
      const tInfo = typeMatch[1].replace(/['"]/g, '');
      return smartPick('type_regex', [
        `Type error: ${tInfo}. Make sure you're using the right data type.`,
        `Oops, type mismatch. Python says: ${tInfo}. Check your variables.`,
        `Hmm, there's a type issue here. ${tInfo}.`,
        `Watch out for data types. The error is: ${tInfo}.`,
        `That operation doesn't work for these types. Python reported: ${tInfo}.`
      ]);
    }
    if (lo.includes('typeerror')) {
      if (lo.includes('can only concatenate str') || lo.includes('unsupported operand')) {
        return smartPick('type_concat', [
          "You're trying to combine a string with a number. Convert the number using str first.",
          "Oops, you can't mix numbers and strings directly. Try converting the number to a string.",
          "Hmm, trying to add a string and a number? Use the string function.",
          "You're mixing incompatible types. Remember to use str to convert numbers into strings.",
          "Type error! You can't combine text and math like that without converting them."
        ]);
      }
      return smartPick('type_gen', [
        "There's a type mismatch. You're mixing incompatible data types.",
        "Oops, a type error. Check what type each variable actually is.",
        "Hmm, Python doesn't like mixing these types. Try converting them.",
        "Make sure you're passing the correct data type into your function.",
        "Type error spotted. Double check the data you are working with."
      ]);
    }

    // ValueError
    if (lo.includes('valueerror')) {
      return smartPick('value_gen', [
        "The value isn't valid for this operation. Double check your input data.",
        "Value error! The input you gave isn't valid for this operation.",
        "Oops, Python received the right type of data, but a bad value.",
        "Hmm, check the value you're passing in. It doesn't quite fit.",
        "That's a value error. Are you trying to convert a word into a number?",
        "Double check your values. Something isn't right for this specific function."
      ]);
    }

    // IndexError
    if (lo.includes('indexerror')) {
      return smartPick('index_gen', [
        "Index out of range. Use len to check the length before accessing by index.",
        "Oops, index out of range! You're trying to reach an item that doesn't exist.",
        "Hmm, that sequence isn't that long. Remember that counting starts at zero.",
        "Index error! Double check the length of your list before accessing it.",
        "You reached too far! There's no item at that specific index.",
        "Check your numbers. The index you asked for is outside the boundaries."
      ]);
    }

    // KeyError
    if (keyMatch) {
      const k = keyMatch[1];
      return smartPick('key_regex', [
        `Key error! I don't see the key ${k} in this dictionary.`,
        `Oops, the dictionary doesn't have a key named ${k}. Check your spelling.`,
        `Hmm, ${k} is missing. Try using the dot get method to avoid this error.`,
        `Python couldn't find the key ${k}. Make sure you typed it correctly.`,
        `Wait, ${k} isn't in the dictionary. Double check the keys you added.`
      ]);
    }
    if (lo.includes('keyerror')) {
      return smartPick('key_gen', [
        "That key doesn't exist in your dictionary. Check for typos, or use the get method instead.",
        "Key error! That key doesn't exist in your dictionary.",
        "Oops, check the spelling of your dictionary key.",
        "Hmm, the dictionary is missing that key. Try the get method.",
        "Python couldn't find that key. Make sure it was actually added.",
        "Double check the keys in your dictionary. One of them is wrong."
      ]);
    }

    // AttributeError
    if (attrMatch) {
      const obj = attrMatch[1];
      const attr = attrMatch[2];
      return smartPick('attr_regex', [
        `Oops, a ${obj} object doesn't have a method named ${attr}.`,
        `Hmm, you can't use ${attr} on a ${obj}. Check your data type.`,
        `Wait, ${attr} doesn't exist for ${obj}. Did you misspell the method?`,
        `Attribute error! A ${obj} does not support the ${attr} property.`,
        `Check the documentation. ${obj} objects don't have ${attr}.`
      ]);
    }
    if (lo.includes('attributeerror')) {
      return smartPick('attr_gen', [
        "This object doesn't have that method or property. Check the data type and its available methods.",
        "Attribute error! You're trying to use a method that doesn't exist for this type.",
        "Oops, check what type of object you're working with.",
        "Hmm, that object doesn't support the property you just called.",
        "Wait, the method you're trying to use isn't valid here.",
        "Double check the method name. It might be misspelled."
      ]);
    }

    // ZeroDivisionError
    if (lo.includes('zerodivisionerror')) {
      return smartPick('zero_gen', [
        "You're dividing by zero, and Python doesn't allow that. Add a check to make sure the divisor isn't zero.",
        "Oops, you cannot divide by zero! That's mathematically impossible.",
        "Hmm, zero division error. Make sure your denominator isn't zero.",
        "Wait, the number you're dividing by turned out to be zero.",
        "Add an if-statement to check for zero before you divide.",
        "Python can't divide by zero. Check the math logic there."
      ]);
    }

    // ImportError
    if (lo.includes('importerror') || lo.includes('modulenotfounderror') || lo.includes('no module named')) {
      return smartPick('import_gen', [
        "That module isn't available in the browser environment. Some external libraries aren't installed here.",
        "Oops, Python can't find that library. Check the spelling of your import.",
        "Hmm, module not found. Make sure you typed the library name correctly.",
        "Import error! That specific module isn't available right now.",
        "Wait, I don't see that module. Did you misspell the import statement.",
        "Double check your imports. Python can't locate that package."
      ]);
    }

    // UnboundLocalError
    if (lo.includes('unboundlocalerror')) {
      return smartPick('unbound', [
        "You're using a variable inside a function before assigning it. Use the global keyword if needed.",
        "Oops, unbound local error. Make sure you assign a value to that variable before using it.",
        "Hmm, that variable is being referenced before assignment inside the function."
      ]);
    }

    // RecursionError
    if (lo.includes('recursionerror') || lo.includes('maximum recursion')) {
      return smartPick('recurse', [
        "Your function is calling itself forever. Make sure you have a base case that stops the recursion.",
        "Oops, maximum recursion depth exceeded! Check your base case.",
        "Hmm, infinite recursion detected. Make sure the function eventually stops calling itself."
      ]);
    }

    // StopIteration
    if (lo.includes('stopiteration')) {
      return "The iterator has run out of items. There are no more values to give.";
    }

    // OverflowError
    if (lo.includes('overflowerror')) {
      return "That number is too large for this operation. Try using a smaller value.";
    }

    // AssertionError
    if (lo.includes('assertionerror')) {
      return smartPick('assert', [
        "An assertion failed. The condition you're testing is False. Review your logic.",
        "Oops, the assert statement failed. Your logic condition evaluated to false.",
        "Hmm, assertion error. Double check the condition you wrote."
      ]);
    }

    // RuntimeError
    if (lo.includes('runtimeerror')) {
      return "A runtime error occurred. Take a close look at your code logic.";
    }

    // NotImplementedError
    if (lo.includes('notimplementederror')) {
      return "This method hasn't been implemented yet. Override it in your class.";
    }

    // FileNotFoundError
    if (lo.includes('filenotfounderror') || lo.includes('no such file')) {
      return "File not found. This runs in your browser, so local files aren't accessible. Use sample data in your code instead.";
    }

    // EOFError
    if (lo.includes('eoferror')) {
      return "The input function doesn't work in the browser. Assign your value directly to a variable instead.";
    }

    // UnicodeError
    if (lo.includes('unicodeerror') || lo.includes('unicodedecodeerror') || lo.includes('unicodeencodeerror')) {
      return "There's an encoding issue. Try using UTF-8, and check for special characters in your strings.";
    }

    // MemoryError
    if (lo.includes('memoryerror')) {
      return "Your code ran out of memory. You might have an infinite loop, or you're creating very large data.";
    }

    // Fallback
    return smartPick('general', [
      "Something went wrong. Read the last line of the error message carefully. It usually tells you exactly what happened.",
      "Oops, an error occurred. Fix the issue shown in red and try again.",
      "Hmm, Python threw an error. Look at the very bottom line of the error message for clues.",
      "Check your code again. That didn't run correctly.",
      "Wait, there's an error in the output. Read the red text to understand what went wrong."
    ]);
  }

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 3: PREMIUM VOICE SELECTION ENGINE
  // Priority: Microsoft Natural > Google Premium > Standard
  //
  // Microsoft Edge has "Natural" voices (Jenny, Aria, Guy) that are
  // neural TTS and sound nearly indistinguishable from a real person.
  // Chrome has "Google UK English Female" which is also very clean.
  // ═══════════════════════════════════════════════════════════════════
  function loadVoices() {
    if (voicesReady || !window.speechSynthesis) return;
    const all = speechSynthesis.getVoices();
    if (!all.length) return;
    voicesReady = true;

    // Tiered priority — best natural voices first
    const tiers = [
      // Tier 1: Microsoft Natural voices (Edge) — near-human quality
      v => /natural/i.test(v.name) && /jenny|aria|ana|sonia/i.test(v.name) && v.lang.startsWith('en'),
      v => /natural/i.test(v.name) && v.lang.startsWith('en'),
      // Tier 2: Microsoft Online voices (Edge) — high quality
      v => /online/i.test(v.name) && /zira|hazel|susan/i.test(v.name) && v.lang.startsWith('en'),
      v => /online/i.test(v.name) && v.lang.startsWith('en'),
      // Tier 3: Google Premium voices (Chrome)
      v => /google/i.test(v.name) && /uk english female/i.test(v.name),
      v => /google/i.test(v.name) && /us english/i.test(v.name),
      v => /google/i.test(v.name) && v.lang.startsWith('en'),
      // Tier 4: Apple voices (Safari)
      v => /samantha|karen|moira|fiona|victoria/i.test(v.name) && v.lang.startsWith('en'),
      // Tier 5: Any female-sounding English voice
      v => /female/i.test(v.name) && v.lang.startsWith('en'),
      // Tier 6: Indian English (for Indian users)
      v => v.lang.startsWith('en-IN'),
      // Tier 7: Any English
      v => v.lang.startsWith('en-US'),
      v => v.lang.startsWith('en-GB'),
      v => v.lang.startsWith('en'),
    ];

    for (const test of tiers) {
      const found = all.find(test);
      if (found) {
        voice = found;
        console.log('Mano Voice: Selected "' + found.name + '" (' + found.lang + ')');
        return;
      }
    }
    voice = all[0];
    console.log('Mano Voice: Fallback to "' + voice.name + '"');
  }

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 4: NATURAL SPEECH DELIVERY
  // Rate varies by context: celebrations are punchier, errors are slower.
  // Pitch stays at 1.0 to avoid the "robot" effect.
  // ═══════════════════════════════════════════════════════════════════
  function say(text, rate) {
    if (muted || !window.speechSynthesis) return;
    speechSynthesis.cancel();

    const u = new SpeechSynthesisUtterance(text);
    u.rate = rate || RATE_NORMAL;
    u.pitch = PITCH;
    u.volume = 1;
    if (voice) u.voice = voice;

    u.onstart = () => { if (muteBtn) muteBtn.classList.add('mano-speaking'); };
    u.onend = () => { if (muteBtn) muteBtn.classList.remove('mano-speaking'); };
    u.onerror = () => { if (muteBtn) muteBtn.classList.remove('mano-speaking'); };

    speechSynthesis.speak(u);
  }

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 5: VISUAL FEEDBACK
  // ═══════════════════════════════════════════════════════════════════
  function toast(cellId, msg, icon, cls) {
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

    requestAnimationFrame(() => el.classList.add('mano-toast-visible'));

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
  // SECTION 6: MUTE BUTTON
  // ═══════════════════════════════════════════════════════════════════
  function injectUI() {
    if (document.getElementById('manoMuteBtn')) return;
    const btn = document.createElement('button');
    btn.id = 'manoMuteBtn';
    btn.className = 'mano-mute-btn' + (muted ? ' mano-muted' : '');
    btn.setAttribute('aria-label', 'Toggle Mano voice assistant');
    btn.title = 'Mano Voice Assistant';
    btn.textContent = muted ? '🔇' : '🔊';
    btn.addEventListener('click', toggleMute, { passive: true });
    document.body.appendChild(btn);
    muteBtn = btn;
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
  // SECTION 7: PUBLIC API
  // ═══════════════════════════════════════════════════════════════════

  function onCorrect(cellId) {
    streak++;
    correctCount++;
    let line, icon, msg, rate = RATE_CELEBRATE;

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
    say(line, rate);
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
    say(hadStreak ? R.brk + '. ' + line : line, RATE_NORMAL);
  }

  function onWrong(cellId) {
    const hadStreak = streak >= 3;
    streak = 0;
    const line = pick(R.wrong);
    glow(cellId, 'mano-glow-error');
    toast(cellId, 'Re-read the question', '❌', 'mano-toast-error');
    say(hadStreak ? R.brk + '. ' + line : line, RATE_NORMAL);
  }

  function onError(cellId, errorMsg) {
    const hadStreak = streak >= 3;
    streak = 0;
    const h = hint(errorMsg);
    const errType = (errorMsg.match(/^(\w*Error)/m) || ['Error'])[0];
    glow(cellId, 'mano-glow-error');
    toast(cellId, errType + ' — listen for hint', '🐛', 'mano-toast-error');
    // Error hints spoken slower — patient teacher pace
    say(hadStreak ? R.brk + '. ' + h : h, RATE_ERROR);
  }

  function checkMilestone(solved, total) {
    if (total <= 0) return;
    const half = Math.ceil(total / 2);
    if (solved === half && lastMilestone < half) {
      lastMilestone = half;
      say(R.half, RATE_CELEBRATE);
    }
    if (solved === total && lastMilestone < total) {
      lastMilestone = total;
      say(R.done, RATE_CELEBRATE);
      const nb = document.querySelector('.notebook');
      if (nb) { nb.classList.add('mano-glow-celebrate'); setTimeout(() => nb.classList.remove('mano-glow-celebrate'), 3000); }
    }
  }

  // ═══════════════════════════════════════════════════════════════════
  // SECTION 8: INIT
  // ═══════════════════════════════════════════════════════════════════
  function init() {
    if (!window.speechSynthesis) return;
    try { muted = localStorage.getItem('mano_voice_muted') === '1'; } catch(e) {}

    loadVoices();
    if (speechSynthesis.onvoiceschanged !== undefined) {
      speechSynthesis.onvoiceschanged = loadVoices;
    }
    injectUI();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init, { once: true });
  } else {
    init();
  }

  return { onCorrect, onPartial, onWrong, onError, checkMilestone };
})();
