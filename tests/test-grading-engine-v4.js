/**
 * MANODEMY SQL QUERY VALIDATION & PEDAGOGICAL DIAGNOSTIC ENGINE (v4.0)
 * Comprehensive Automated Test Suite
 */

const Database = require('better-sqlite3');
const {
  gradeSubmission,
  parseSqlAst,
  validateStructuralConstraints,
  tokenizeSql,
} = require('../public/Version-3/grading-engine.js');

// ═══════════════════════════════════════════════════════════════
// TEST HARNESS & IN-MEMORY TEST DATABASE SETUP
// ═══════════════════════════════════════════════════════════════

function createBaseDatabase() {
  const db = new Database(':memory:');
  
  // Standard Schema
  db.exec(`
    CREATE TABLE employees (
      employee_id INTEGER PRIMARY KEY,
      first_name TEXT NOT NULL,
      last_name TEXT NOT NULL,
      department_id INTEGER,
      salary REAL NOT NULL,
      hire_date DATE,
      commission REAL
    );

    CREATE TABLE departments (
      department_id INTEGER PRIMARY KEY,
      department_name TEXT NOT NULL
    );

    CREATE TABLE sales_transactions (
      transaction_id INTEGER PRIMARY KEY,
      employee_id INTEGER,
      amount REAL NOT NULL,
      transaction_date DATE NOT NULL
    );

    INSERT INTO departments VALUES
      (10, 'Engineering'),
      (20, 'Data Science'),
      (30, 'Marketing'),
      (40, 'Sales');

    INSERT INTO employees VALUES
      (1, 'Rajesh', 'Sen', 10, 120000, '2020-01-15', NULL),
      (2, 'Priya', 'Nair', 20, 110000, '2020-06-01', 15000),
      (3, 'Amit', 'Kumar', 10, 95000, '2021-03-10', NULL),
      (4, 'Sneha', 'Patel', 20, 80000, '2021-02-15', 8000),
      (5, 'Rahul', 'Sharma', 20, 75000, '2021-08-20', 5000),
      (6, 'Vikram', 'Malhotra', 30, 70000, '2021-11-05', 12000);

    INSERT INTO sales_transactions VALUES
      (101, 2, 5000, '2024-01-10'),
      (102, 2, 8000, '2024-01-15'),
      (103, 4, 3000, '2024-01-15'),
      (104, 5, 4500, '2024-01-20');
  `);

  return {
    exec: (sql) => {
      // Compatibility adapter for better-sqlite3
      const stmt = db.prepare(sql);
      if (sql.trim().toUpperCase().startsWith('SELECT') || sql.trim().toUpperCase().startsWith('WITH')) {
        return stmt.all();
      }
      return stmt.run();
    },
    rawDb: db
  };
}

function createEdgeMutationDatabase() {
  const db = new Database(':memory:');

  // Edge Mutation Schema with NULL department, tie scores, identical timestamps
  db.exec(`
    CREATE TABLE employees (
      employee_id INTEGER PRIMARY KEY,
      first_name TEXT NOT NULL,
      last_name TEXT NOT NULL,
      department_id INTEGER,
      salary REAL NOT NULL,
      hire_date DATE,
      commission REAL
    );

    CREATE TABLE inactive_depts (
      dept_id INTEGER
    );

    CREATE TABLE scores (
      student_id INTEGER PRIMARY KEY,
      score INTEGER NOT NULL,
      created_at DATE NOT NULL
    );

    -- Inactive departments containing NULL!
    INSERT INTO inactive_depts VALUES (30), (NULL), (40);

    -- Employees with identical tie salaries
    INSERT INTO employees VALUES
      (1, 'Rajesh', 'Sen', 10, 100000, '2020-01-15', NULL),
      (2, 'Priya', 'Nair', 20, 100000, '2020-06-01', 15000),
      (3, 'Amit', 'Kumar', 10, 80000, '2021-03-10', NULL),
      (4, 'Sneha', 'Patel', 20, 80000, '2021-02-15', NULL);

    -- Scores with duplicate timestamps (peer ties)
    INSERT INTO scores VALUES
      (1, 95, '2024-01-01'),
      (2, 95, '2024-01-01'),
      (3, 85, '2024-01-02'),
      (4, 70, '2024-01-03');
  `);

  return {
    exec: (sql) => {
      const stmt = db.prepare(sql);
      if (sql.trim().toUpperCase().startsWith('SELECT') || sql.trim().toUpperCase().startsWith('WITH')) {
        return stmt.all();
      }
      return stmt.run();
    },
    rawDb: db
  };
}

// ═══════════════════════════════════════════════════════════════
// TEST RUNNER
// ═══════════════════════════════════════════════════════════════

let totalTests = 0;
let passedTests = 0;

function assert(condition, name, details = '') {
  totalTests++;
  if (condition) {
    console.log(`  \x1b[32m✔ PASS\x1b[0m ${name}`);
    passedTests++;
  } else {
    console.error(`  \x1b[31m✖ FAIL\x1b[0m ${name}`);
    if (details) console.error(`    ${details}`);
  }
}

console.log('\n\x1b[1m\x1b[36m===============================================================');
console.log('🧪 RUNNING SQL GRADING & PEDAGOGICAL ENGINE v4.0 TEST SUITE');
console.log('===============================================================\x1b[0m\n');

const baseDb = createBaseDatabase();
const edgeDb = createEdgeMutationDatabase();

// ─────────────────────────────────────────────────────────────
// SUITE 1: LAYER 1 — AST & STATIC SYNTAX ANALYSIS
// ─────────────────────────────────────────────────────────────
console.log('\x1b[1m[Suite 1] Layer 1: AST Tokenization, Syntax Pointers & Constraints\x1b[0m');

// 1.1 Tokenizer correctness
const tokens = tokenizeSql("SELECT id, name FROM employees WHERE salary > 50000;");
assert(tokens.length > 5, 'Tokenizer parses identifiers, keywords, numbers, operators');

// 1.2 Keyword Typo catch
const typoAst = parseSqlAst("SELECT id, salary FORM employees;");
assert(!typoAst.valid, "Detects 'FORM' keyword typo");
assert(typoAst.syntaxError && typoAst.syntaxError.visualPointer.includes('^'), 'Generates visual caret error pointer');

// 1.3 Unclosed Parentheses
const parenAst = parseSqlAst("SELECT (salary * 12 FROM employees;");
assert(!parenAst.valid, 'Detects unclosed parenthesis');

// 1.4 Structural CTE requirement check
const cteQuestion = {
  ref: "WITH HighEarners AS (SELECT * FROM employees WHERE salary > 90000) SELECT * FROM HighEarners;",
  grading: { requiresCte: true }
};
const studentWithoutCte = "SELECT * FROM employees WHERE salary > 90000;";
const cteReport = gradeSubmission(studentWithoutCte, cteQuestion, baseDb);
assert(!cteReport.passed && cteReport.status === 'STRUCTURAL_MISMATCH', 'Catches missing mandatory CTE (WITH clause)');

// 1.5 Structural Window Function requirement check
const winQuestion = {
  ref: "SELECT first_name, salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rnk FROM employees;",
  grading: { requiresWindowFunction: ['DENSE_RANK', 'RANK'] }
};
const studentWithoutWin = "SELECT first_name, salary FROM employees ORDER BY salary DESC;";
const winReport = gradeSubmission(studentWithoutWin, winQuestion, baseDb);
assert(!winReport.passed && winReport.status === 'STRUCTURAL_MISMATCH', 'Catches missing mandatory Window Function');

// ─────────────────────────────────────────────────────────────
// SUITE 2: LAYER 2 — DUAL SANDBOX EXECUTION & INVARIANTS
// ─────────────────────────────────────────────────────────────
console.log('\n\x1b[1m[Suite 2] Layer 2: Dual Sandbox Execution & Invariant Comparison\x1b[0m');

// 2.1 Perfect Submission (Score 1.0)
const validQ = {
  ref: "SELECT first_name, salary FROM employees WHERE salary > 80000 ORDER BY salary DESC;",
  grading: { orderSensitive: true }
};
const validStudent = "SELECT first_name, salary FROM employees WHERE salary > 80000 ORDER BY salary DESC;";
const validReport = gradeSubmission(validStudent, validQ, baseDb);
assert(validReport.passed && validReport.score === 1.0 && validReport.status === 'PASSED', 'Grades perfect submission as 100% PASSED');

// 2.2 Order Invariant vs Order Sensitive
const orderQ = {
  ref: "SELECT first_name, salary FROM employees WHERE department_id = 20;",
  grading: { orderSensitive: false }
};
const permutedStudent = "SELECT first_name, salary FROM employees WHERE department_id = 20 ORDER BY salary ASC;";
const permutedReport = gradeSubmission(permutedStudent, orderQ, baseDb);
assert(permutedReport.passed, 'Order-invariant multiset comparator accepts valid permutation');

// 2.3 Float Epsilon Tolerance
const floatQ = {
  ref: "SELECT employee_id, salary * 1.10 AS revised_salary FROM employees WHERE employee_id = 1;",
  grading: { floatEpsilon: 0.01 }
};
const floatStudent = "SELECT employee_id, 132000.00001 AS revised_salary FROM employees WHERE employee_id = 1;";
const floatReport = gradeSubmission(floatStudent, floatQ, baseDb);
assert(floatReport.passed, 'Float epsilon tolerance correctly validates floating point calculations');

// ─────────────────────────────────────────────────────────────
// SUITE 3: LAYER 3 — COGNITIVE ANTI-PATTERN TRAPS (OPTION A vs B)
// ─────────────────────────────────────────────────────────────
console.log('\n\x1b[1m[Suite 3] Layer 3: Cognitive Anti-Pattern Detectors & Remediation\x1b[0m');

// 3.1 NOT IN with Subquery NULL Trap
const notInQuestion = {
  ref: "SELECT first_name FROM employees WHERE department_id NOT IN (SELECT dept_id FROM inactive_depts WHERE dept_id IS NOT NULL);",
};
const notInTrapStudent = "SELECT first_name FROM employees WHERE department_id NOT IN (SELECT dept_id FROM inactive_depts);";
const notInReport = gradeSubmission(notInTrapStudent, notInQuestion, edgeDb);
assert(!notInReport.passed && notInReport.status === 'TRAP_CAUGHT', 'Detects NOT IN with Subquery NULL trap');
assert(notInReport.badge.includes('NULL in Subquery'), 'Emits specific pedagogical badge for 3VL trap');

// 3.2 LEFT JOIN Nullification Trap
const leftJoinQ = {
  ref: "SELECT e.first_name, s.amount FROM employees e LEFT JOIN sales_transactions s ON e.employee_id = s.employee_id AND s.amount > 4000;",
};
const leftJoinTrapStudent = "SELECT e.first_name, s.amount FROM employees e LEFT JOIN sales_transactions s ON e.employee_id = s.employee_id WHERE s.amount > 4000;";
const leftJoinReport = gradeSubmission(leftJoinTrapStudent, leftJoinQ, baseDb);
assert(!leftJoinReport.passed && leftJoinReport.status === 'TRAP_CAUGHT', 'Detects LEFT JOIN Nullification bug in WHERE clause');

// 3.3 COUNT(*) vs COUNT(column) NULL Trap
const countQ = {
  ref: "SELECT COUNT(*) FROM employees;",
};
const countColStudent = "SELECT COUNT(commission) FROM employees;";
const countReport = gradeSubmission(countColStudent, countQ, baseDb);
assert(!countReport.passed && countReport.status === 'TRAP_CAUGHT', 'Detects COUNT(col) vs COUNT(*) NULL discrepancy');

// 3.4 GROUP BY Non-Aggregated Projection Trap
const groupByQ = {
  ref: "SELECT department_id, COUNT(*), MAX(salary) FROM employees GROUP BY department_id;",
};
const groupByTrapStudent = "SELECT department_id, first_name, COUNT(*) FROM employees GROUP BY department_id;";
const groupByReport = gradeSubmission(groupByTrapStudent, groupByQ, baseDb);
assert(!groupByReport.passed && groupByReport.status === 'TRAP_CAUGHT', 'Detects unaggregated projection in GROUP BY');

// 3.5 Window Framing Default Drift on Duplicate Ties
const windowTieQ = {
  ref: "SELECT student_id, score, SUM(score) OVER (ORDER BY created_at ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_total FROM scores;",
};
const windowDriftStudent = "SELECT student_id, score, SUM(score) OVER (ORDER BY created_at) as running_total FROM scores;";
const windowDriftReport = gradeSubmission(windowDriftStudent, windowTieQ, edgeDb);
assert(!windowDriftReport.passed && windowDriftReport.status === 'TRAP_CAUGHT', 'Detects Window Framing Default Drift on duplicate timestamp ties');

// 3.6 RANK() vs DENSE_RANK() Gap Skipping
const rankQ = {
  ref: "SELECT student_id, score, DENSE_RANK() OVER (ORDER BY score DESC) as rnk FROM scores;",
};
const rankStudent = "SELECT student_id, score, RANK() OVER (ORDER BY score DESC) as rnk FROM scores;";
const rankReport = gradeSubmission(rankStudent, rankQ, edgeDb);
assert(!rankReport.passed && rankReport.status === 'TRAP_CAUGHT', 'Detects RANK() vs DENSE_RANK() tie skipping');

// 3.7 Aggregate in WHERE Trap
const aggWhereQ = {
  ref: "SELECT department_id, COUNT(*) FROM employees GROUP BY department_id HAVING COUNT(*) > 1;",
};
const aggWhereStudent = "SELECT department_id, COUNT(*) FROM employees WHERE COUNT(*) > 1 GROUP BY department_id;";
const aggWhereReport = gradeSubmission(aggWhereStudent, aggWhereQ, baseDb);
assert(!aggWhereReport.passed && aggWhereReport.status === 'TRAP_CAUGHT', 'Detects Aggregates in WHERE clause');
assert(aggWhereReport.remediation && aggWhereReport.remediation.actionLabel.includes('HAVING'), 'Provides 1-click remediation for WHERE ➔ HAVING');

// 3.8 NULL Equality Trap (= NULL)
const nullEqQ = {
  ref: "SELECT first_name FROM employees WHERE commission IS NULL;",
};
const nullEqStudent = "SELECT first_name FROM employees WHERE commission = NULL;";
const nullEqReport = gradeSubmission(nullEqStudent, nullEqQ, baseDb);
assert(!nullEqReport.passed && nullEqReport.status === 'TRAP_CAUGHT', 'Detects = NULL equality trap');

// ─────────────────────────────────────────────────────────────
// SUITE 4: LAYER 4 — VISUAL DIFF & REMEDIATION
// ─────────────────────────────────────────────────────────────
console.log('\n\x1b[1m[Suite 4] Layer 4: Pedagogical Feedback & Visual Diffs\x1b[0m');

// 4.1 Markdown Diff generation
const mismatchQ = {
  ref: "SELECT first_name, salary FROM employees WHERE salary >= 95000;",
};
const mismatchStudent = "SELECT first_name, salary FROM employees WHERE salary > 95000;";
const diffReport = gradeSubmission(mismatchStudent, mismatchQ, baseDb);
assert(diffReport.visual_diff_markdown && diffReport.visual_diff_markdown.includes('|'), 'Generates Markdown table visual diff');
assert(diffReport.visual_diff_html && diffReport.visual_diff_html.includes('<table'), 'Generates responsive HTML visual diff');
assert(diffReport.visual_diff_ansi && diffReport.visual_diff_ansi.includes('RESULT SET DIFF'), 'Generates ANSI color diff for terminal');

// 4.2 Auto-Fix Application Simulation
const sampleCode = "SELECT * FROM employees WHERE commission = NULL;";
const fixObj = nullEqReport.remediation;
assert(fixObj && fixObj.actionReplace, 'Remediation object provides actionReplace');
const fixedCode = sampleCode.replace(fixObj.actionReplace.from, fixObj.actionReplace.to);
assert(fixedCode.includes('commission IS NULL'), 'Applying 1-click remediation produces valid fixed SQL');

// ─────────────────────────────────────────────────────────────
// SUMMARY REPORT
// ─────────────────────────────────────────────────────────────
console.log('\n\x1b[1m\x1b[36m===============================================================');
console.log(`📊 FINAL RESULT: ${passedTests}/${totalTests} TESTS PASSED (${((passedTests/totalTests)*100).toFixed(1)}%)`);
console.log('===============================================================\x1b[0m\n');

if (passedTests === totalTests) {
  console.log('\x1b[32m✨ ALL QUALITY GATES & INVARIANTS SATISFIED (GATE-COACH 100%)\x1b[0m\n');
  process.exit(0);
} else {
  console.error('\x1b[31m❌ SOME TESTS FAILED\x1b[0m\n');
  process.exit(1);
}
