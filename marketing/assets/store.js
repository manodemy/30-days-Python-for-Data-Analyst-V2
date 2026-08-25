/* ============================================================
   MANODEMY REEL STORE
   Tiny localStorage-backed data layer shared by studio.html and
   library.html so reels created in one page show up in the other.
   Also exposes JSON export/import so reels can be backed up or
   moved between browsers where storage isn't shared.
   ============================================================ */
(function(window){
  const KEY = 'manodemy.reels.v1';

  const SEED = [
    {
      id:'day04-null-trap',
      reelNo:'SQL-04-R1',
      day:'DAY 04',
      badge:'SQL · NULL Trap',
      hook:'90% FAIL THIS SQL TRAP 💀\nRETURNS "0" ROWS ?',
      hookHighlights:[{ text:'90%', color:'#facc15' }, { text:'"0" ROWS ?', color:'#ff007a' }],
      lang:'sql',
      codeA:"SELECT *\nFROM employees\nWHERE dept_id NOT IN (\n  SELECT dept_id\n  FROM departments\n)",
      codeB:"SELECT *\nFROM employees\nWHERE dept_id NOT IN (\n  SELECT dept_id\n  FROM departments\n  WHERE dept_id IS NOT NULL\n)",
      pollInstr:'TAP YOUR VOTE IN COMMENTS \u{1F447}',
      voiceScript:"Ninety eight percent fail this FAANG SQL trap. Option A, or Option B? One of these silently returns zero rows. Comment your answer below.",
      caption:"98% fail this FAANG SQL interview trap \u{1F480}\n\nOption A vs Option B — both LOOK identical. One of them silently returns ZERO rows because of a single NULL sitting in the subquery.\n\nDrop your vote (A or B) in the comments before you scroll \u{1F447} Full breakdown + the free simulator link is pinned below.\n\n#SQL #DataAnalyst #FAANGInterview #SQLTips #Manodemy #LearnSQL #TechInterview #DataAnalytics",
      pinnedAnswer:"PINNED ANSWER — Day 04 (NOT IN + NULL trap)\n\nOption A is the trap. NOT IN treats the subquery's result set literally — if even ONE row in (SELECT dept_id FROM departments) is NULL, the entire NOT IN comparison becomes UNKNOWN for every row, and the outer query returns ZERO rows. No error, no warning — it just silently fails.\n\nOption B filters out the NULL with `WHERE dept_id IS NOT NULL` before the NOT IN runs, so the comparison is safe again.\n\nRule of thumb: NEVER use NOT IN against a subquery that can contain NULLs. Use NOT EXISTS instead — it doesn't have this failure mode.\n\nTry it yourself free → link below.",
      link:'https://manodemy.io/play/day04-null-trap',
      updatedAt: Date.now()
    },
    {
      id:'day12-salary-wipe',
      reelNo:'#12',
      day:'DAY 12',
      badge:'SQL · Missing WHERE',
      hook:"THIS QUERY QUIETLY WIPES EVERY SALARY \u{1F631} SPOT THE BUG",
      hookHighlights:['WIPES','SPOT THE BUG'],
      lang:'sql',
      codeA:"UPDATE employees\nSET salary = salary * 1.10\nWHERE department = 'Sales';\n\nUPDATE employees\nSET bonus = 500",
      codeB:"UPDATE employees\nSET salary = salary * 1.10\nWHERE department = 'Sales';\n\nUPDATE employees\nSET bonus = 500\nWHERE department = 'Sales'",
      pollInstr:'TAP YOUR VOTE IN COMMENTS \u{1F447}',
      voiceScript:"This query quietly wipes every salary in the table. Option A, or Option B — which one actually has the missing WHERE clause? Comment your pick.",
      caption:"This one has cost real interns their offer letters \u{1F631}\n\nBoth queries look like a clean two-step raise + bonus update. Only ONE of them forgets a WHERE clause — and it doesn't throw an error, it just quietly updates every single row in the table.\n\nVote A or B in the comments before you check the pinned answer \u{1F447}\n\n#SQL #DataAnalyst #SQLTips #Manodemy #TechInterview #DatabaseDesign #LearnToCode",
      pinnedAnswer:"PINNED ANSWER — Day 12 (missing WHERE trap)\n\nOption A is the dangerous one. The second UPDATE statement has no WHERE clause, so `SET bonus = 500` applies to every row in the employees table — not just Sales. Option B correctly scopes both updates to `WHERE department = 'Sales'`.\n\nHabit to build: always write your WHERE clause FIRST, or wrap risky UPDATEs in a transaction with a SELECT * check before you commit.\n\nFree simulator (safe sandbox, no real data) → link below.",
      link:'https://manodemy.io/play/day12-salary-wipe',
      updatedAt: Date.now()
    },
    {
      id:'day33-mutable-default',
      day:'DAY 33',
      badge:'Python · Mutable Default',
      hook:"THIS PYTHON BUG HAUNTS EVERY DATA PIPELINE \u{1F47B} A OR B?",
      hookHighlights:['HAUNTS','A OR B'],
      lang:'python',
      codeA:"def add_row(row, table=[]):\n    table.append(row)\n    return table",
      codeB:"def add_row(row, table=None):\n    if table is None:\n        table = []\n    table.append(row)\n    return table",
      pollInstr:'TAP YOUR VOTE IN COMMENTS \u{1F447}',
      voiceScript:"This Python bug haunts every data pipeline. Option A, or Option B — one of these keeps the same list alive across every function call. Comment your answer.",
      caption:"This bug has broken production pipelines for YEARS and most analysts never see it coming \u{1F47B}\n\nOne of these functions reuses the SAME default list across every call — so your \"empty\" table quietly keeps growing every time you call it without an argument.\n\nVote A or B before you check the pinned answer \u{1F447}\n\n#Python #DataAnalyst #PythonTips #Manodemy #LearnPython #DataEngineering #CodingTips",
      pinnedAnswer:"PINNED ANSWER — Day 33 (mutable default argument trap)\n\nOption A is the trap. Default arguments in Python are evaluated ONCE, at function definition time — not on every call. So `table=[]` creates a single list object that's reused and mutated across every call where you don't pass your own table.\n\nOption B fixes it with the `table=None` + `if table is None: table = []` pattern, which creates a fresh list every call.\n\nThis exact bug has caused real duplicate-row incidents in production ETL jobs. Free simulator → link below.",
      link:'https://manodemy.io/play/day33-mutable-default',
      updatedAt: Date.now()
    }
  ];

  function uid(){ return 'reel-' + Date.now().toString(36) + '-' + Math.random().toString(36).slice(2,7); }

  function normalizeReel(r){
    if(!r) return r;
    if(!r.reelNo || r.reelNo.startsWith('#')){
      const dayNum = (r.day || 'DAY 04').replace(/\D/g,'') || '04';
      const pad = dayNum.length === 1 ? '0' + dayNum : dayNum;
      const langPrefix = (r.lang || 'sql').toUpperCase() === 'PYTHON' ? 'PY' : ((r.lang || 'sql').toUpperCase() === 'EXCEL' ? 'XLS' : 'SQL');
      r.reelNo = `${langPrefix}-${pad}-R1`;
    }
    return r;
  }

  function readAll(){
    try{
      const raw = localStorage.getItem(KEY);
      if(!raw){
        const seeded = SEED.map(normalizeReel);
        localStorage.setItem(KEY, JSON.stringify(seeded));
        return seeded;
      }
      const parsed = JSON.parse(raw);
      return (Array.isArray(parsed) ? parsed : SEED.slice()).map(normalizeReel);
    }catch(e){
      return SEED.slice().map(normalizeReel);
    }
  }

  function writeAll(list){
    try{ localStorage.setItem(KEY, JSON.stringify(list)); }catch(e){}
  }

  function getAll(){
    return readAll().sort((a,b)=> (b.updatedAt||0) - (a.updatedAt||0));
  }

  function getById(id){
    return readAll().find(r=>r.id === id) || null;
  }

  function upsert(reel){
    const list = readAll();
    const idx = list.findIndex(r=>r.id === reel.id);
    reel.updatedAt = Date.now();
    if(idx === -1){
      if(!reel.id) reel.id = uid();
      list.push(reel);
    } else {
      list[idx] = Object.assign({}, list[idx], reel);
    }
    writeAll(list);
    return reel;
  }

  function remove(id){
    writeAll(readAll().filter(r=>r.id !== id));
  }

  function duplicate(id){
    const src = getById(id);
    if(!src) return null;
    const copy = Object.assign({}, src, {
      id: uid(),
      day: src.day + ' COPY',
      updatedAt: Date.now()
    });
    const list = readAll();
    list.push(copy);
    writeAll(list);
    return copy;
  }

  function blank(){
    return {
      id: uid(),
      day:'DAY 00',
      badge:'SQL · New Trap',
      hook:'YOUR HOOK GOES HERE — MAKE IT UNMISSABLE',
      hookHighlights:[],
      lang:'sql',
      codeA:'SELECT *\nFROM table_a',
      codeB:'SELECT *\nFROM table_b',
      pollInstr:'TAP YOUR VOTE IN COMMENTS \u{1F447}',
      voiceScript:'Which one is right, option A or option B? Comment your answer below.',
      caption:'Write your Instagram caption + hashtags here.',
      pinnedAnswer:'Write the full pinned-comment explanation here.',
      link:'https://manodemy.io/play/new-reel',
      updatedAt: Date.now()
    };
  }

  function exportJSON(){
    return JSON.stringify(readAll(), null, 2);
  }

  function importJSON(text){
    const parsed = JSON.parse(text);
    if(!Array.isArray(parsed)) throw new Error('Expected a JSON array of reels');
    const list = readAll();
    parsed.forEach(r=>{
      if(!r.id) r.id = uid();
      const idx = list.findIndex(x=>x.id === r.id);
      if(idx === -1) list.push(r); else list[idx] = Object.assign({}, list[idx], r);
    });
    writeAll(list);
    return list.length;
  }

  window.ReelStore = { getAll, getById, upsert, remove, duplicate, blank, exportJSON, importJSON, uid };
})(window);
