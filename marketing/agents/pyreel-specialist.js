/**
 * 🐍 PYTHON VIRAL REEL SPECIALIST (AGENT)
 * ─────────────────────────────────────────────────────────────
 * Autonomous specialist for Manodemy 60-Day Python for Data Analysts Track (Day 31-60)
 */

const { generateReelPack } = require('../engine');

const PYTHON_CURRICULUM_TRAPS = [
  {
    id: 'pyreel_01_mutable_default',
    day: '33',
    topic: 'Mutable Default Argument Bug',
    language: 'Python',
    hookTitle: '95% OF PYTHON DEVS FAIL THIS BUG 💀',
    codeA: `def add_emp(name, team=[]):\n    team.append(name)\n    return team`,
    codeB: `def add_emp(name, team=None):\n    if team is None:\n        team = []\n    team.append(name)\n    return team`,
    timerSeconds: 5,
    correctOption: 'B',
    answerExplanation: 'Default arguments in Python are evaluated ONCE when the function is defined, NOT each time it is called. Option A shares the same list across multiple calls, accumulating unwanted data. Option B creates a fresh list on every invocation.',
    playgroundUrl: 'https://www.manodemy.com/go/python_day33',
    hashtags: ['#python', '#datascience', '#pythonprogramming', '#dataanalyst', '#codinginterview', '#manodemy']
  },
  {
    id: 'pyreel_02_is_vs_equality',
    day: '31',
    topic: 'Identity (is) vs Equality (==) Trap',
    language: 'Python',
    hookTitle: 'IS VS == IN PYTHON: SPOT THE TRAP 💀',
    codeA: `a = [1, 2, 3]\nb = [1, 2, 3]\nprint(a is b)  # True or False?`,
    codeB: `a = [1, 2, 3]\nb = [1, 2, 3]\nprint(a == b)  # True or False?`,
    timerSeconds: 5,
    correctOption: 'B',
    answerExplanation: '\'is\' checks memory identity (id(a) == id(b)), which is False because a and b are two separate list objects in memory. \'==\' checks value equality, which evaluates to True.',
    playgroundUrl: 'https://www.manodemy.com/go/python_day31',
    hashtags: ['#pythontips', '#pythoncode', '#dataanalytics', '#pythondeveloper', '#manodemy']
  },
  {
    id: 'pyreel_03_pandas_loc_iloc',
    day: '42',
    topic: 'Pandas loc vs iloc Integer Slicing Trap',
    language: 'Python',
    hookTitle: 'PANDAS SLICING TRAP: WHICH ONE PASSES? 🐼',
    codeA: `import pandas as pd\ndf = pd.DataFrame({'val': [10, 20, 30]})\nres = df.loc[0:2]   # 2 or 3 rows?`,
    codeB: `import pandas as pd\ndf = pd.DataFrame({'val': [10, 20, 30]})\nres = df.iloc[0:2]  # 2 or 3 rows?`,
    timerSeconds: 5,
    correctOption: 'B',
    answerExplanation: 'In Pandas, .loc includes BOTH start and end index (inclusive: 3 rows!). .iloc follows standard Python positional slicing where the upper bound is exclusive (2 rows!).',
    playgroundUrl: 'https://www.manodemy.com/go/pandas_day42',
    hashtags: ['#pandas', '#datascience', '#dataanalytics', '#pythonforbeginners', '#manodemy']
  }
];

function generatePythonReel(indexOrSpec) {
  if (typeof indexOrSpec === 'object') {
    return generateReelPack({ ...indexOrSpec, language: 'Python' });
  }
  const trap = PYTHON_CURRICULUM_TRAPS[indexOrSpec || 0] || PYTHON_CURRICULUM_TRAPS[0];
  return generateReelPack(trap);
}

if (require.main === module) {
  const targetIndex = process.argv[2] ? parseInt(process.argv[2], 10) : 0;
  console.log(`🤖 [PyReel Specialist] Triggered for Python Trap #${targetIndex}`);
  generatePythonReel(targetIndex);
}

module.exports = { generatePythonReel, PYTHON_CURRICULUM_TRAPS };
