/**
 * 💾 SQL VIRAL REEL SPECIALIST (AGENT)
 * ─────────────────────────────────────────────────────────────
 * Autonomous specialist for Manodemy 60-Day SQL for Data Analysts Track (Day 01-18)
 */

const { generateReelPack } = require('../engine');

const SQL_CURRICULUM_TRAPS = [
  {
    id: 'sqlreel_01_precedence_bug',
    day: '03',
    topic: 'Operator Precedence (AND before OR)',
    language: 'SQL',
    hookTitle: 'WHICH QUERY AVOIDS THE SILENT DATA LEAK? 💀',
    codeA: `SELECT name FROM employees\nWHERE dept = 'Tech'\n   OR dept = 'Sales'\n  AND is_active = 1;`,
    codeB: `SELECT name FROM employees\nWHERE (dept = 'Tech'\n   OR dept = 'Sales')\n  AND is_active = 1;`,
    timerSeconds: 5,
    correctOption: 'B',
    answerExplanation: 'AND has higher operator precedence than OR. Option A evaluates (dept=\'Sales\' AND is_active=1) first, leaking all inactive Tech staff. Option B uses parentheses to correctly enforce department groupings.',
    playgroundUrl: 'https://www.manodemy.com/go/day03_free',
    hashtags: ['#sql', '#datascience', '#dataanalyst', '#codinginterview', '#sqltips', '#manodemy']
  },
  {
    id: 'sqlreel_02_null_equality',
    day: '02',
    topic: 'NULL Comparison (= NULL vs IS NULL)',
    language: 'SQL',
    hookTitle: '90% OF FRESHERS WRITE THIS SQL BUG 💀',
    codeA: `SELECT customer_name FROM orders\nWHERE discount_code = NULL;`,
    codeB: `SELECT customer_name FROM orders\nWHERE discount_code IS NULL;`,
    timerSeconds: 5,
    correctOption: 'B',
    answerExplanation: 'In SQL, NULL represents an unknown value. `= NULL` always evaluates to UNKNOWN/FALSE. You must use `IS NULL` to check for missing values.',
    playgroundUrl: 'https://www.manodemy.com/go/day02_free',
    hashtags: ['#sql', '#sqlserver', '#postgresql', '#dataanalytics', '#manodemy']
  },
  {
    id: 'sqlreel_03_count_star_vs_column',
    day: '04',
    topic: 'COUNT(*) vs COUNT(column) with NULLs',
    language: 'SQL',
    hookTitle: 'COUNT(*) VS COUNT(bonus): SPOT THE DIFFERENCE ⚡',
    codeA: `SELECT dept, COUNT(*)\nFROM employees\nGROUP BY dept;`,
    codeB: `SELECT dept, COUNT(bonus)\nFROM employees\nGROUP BY dept;`,
    timerSeconds: 5,
    correctOption: 'A',
    answerExplanation: 'COUNT(*) counts every row in the group regardless of NULLs. COUNT(column) ignores NULL values in that specific column and only counts non-null rows.',
    playgroundUrl: 'https://www.manodemy.com/go/day04_free',
    hashtags: ['#sqlqueries', '#bigdata', '#database', '#dataanalysis', '#manodemy']
  },
  {
    id: 'sqlreel_04_null_propagation_salary',
    day: '04',
    topic: 'NULL Propagation in Arithmetic (Total Salary Bug)',
    language: 'SQL',
    hookTitle: 'ONE QUERY ACCIDENTALLY WIPES EMPLOYEE SALARIES 💀',
    codeA: `SELECT name, \n       salary + commission AS total_pay\nFROM employees;`,
    codeB: `SELECT name, \n       salary + COALESCE(commission, 0) AS total_pay\nFROM employees;`,
    timerSeconds: 5,
    correctOption: 'B',
    answerExplanation: 'In SQL, any arithmetic with NULL yields NULL (e.g. 50000 + NULL = NULL!). Option A returns NULL total_pay for every employee without a commission. Option B uses COALESCE to safely treat NULL as 0.',
    playgroundUrl: 'https://www.manodemy.com/go/day04_free',
    hashtags: ['#sql', '#sqlserver', '#datascience', '#dataanalyst', '#codinginterview', '#manodemy']
  },
  {
    id: 'sqlreel_04_not_in_null_trap',
    day: '04',
    topic: 'The Deadly NOT IN with NULL Subquery Trap',
    language: 'SQL',
    hookTitle: '98% FAIL THIS FAANG SQL TRAP: 0 ROWS RETURNED? 💀',
    codeA: `SELECT name FROM employees\nWHERE salary NOT IN (\n  SELECT commission FROM employees\n);`,
    codeB: `SELECT name FROM employees\nWHERE salary NOT IN (\n  SELECT commission FROM employees\n  WHERE commission IS NOT NULL\n);`,
    timerSeconds: 5,
    correctOption: 'B',
    answerExplanation: 'If a subquery contains even a single NULL, `x NOT IN (...)` evaluates to UNKNOWN for EVERY single row, silently returning ZERO rows! Option B filters out NULLs to ensure the comparison works.',
    playgroundUrl: 'https://www.manodemy.com/go/day04_free',
    hashtags: ['#sql', '#faang', '#codinginterview', '#dataanalytics', '#sqltricks', '#manodemy']
  }
];

function generateSqlReel(indexOrSpec) {
  if (typeof indexOrSpec === 'object') {
    return generateReelPack({ ...indexOrSpec, language: 'SQL' });
  }
  const trap = SQL_CURRICULUM_TRAPS[indexOrSpec || 0] || SQL_CURRICULUM_TRAPS[0];
  return generateReelPack(trap);
}

if (require.main === module) {
  const targetIndex = process.argv[2] ? parseInt(process.argv[2], 10) : 0;
  console.log(`🤖 [SQLReel Specialist] Triggered for SQL Trap #${targetIndex}`);
  generateSqlReel(targetIndex);
}

module.exports = { generateSqlReel, SQL_CURRICULUM_TRAPS };
