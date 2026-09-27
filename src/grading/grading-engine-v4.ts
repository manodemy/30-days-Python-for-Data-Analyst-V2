/**
 * MANODEMY MASTER SQL GRADING & PEDAGOGICAL DIAGNOSTIC ENGINE (v4.0)
 * Unified 4-Layer Architecture (AST + Dual Sandbox + Cognitive Traps + Pedagogical Diffs)
 */

import {
  QuestionSpec,
  DatabaseAdapter,
  GradingReport,
  DiagnosticContext,
} from './types';
import {
  parseSqlAst,
  validateStructuralConstraints,
} from './sql-ast-parser';
import {
  executeInSandbox,
  compareResultSets,
} from './dual-sandbox-executor';
import { globalDiagnosticRegistry } from './diagnostic-registry';
import { DiffFormatter } from './diff-formatter';

/**
 * Master Grading Function: Evaluates a student's SQL query against the canonical specification
 * across all 4 architectural layers.
 */
export function gradeSubmission(
  studentSql: string,
  question: QuestionSpec,
  db: DatabaseAdapter,
  edgeDb?: DatabaseAdapter
): GradingReport {
  const refSql = question.referenceSql || question.ref || '';
  const gradingRules = question.grading || {};

  // ═══════════════════════════════════════════════════════════════
  // 0. SANITIZATION & SAFETY CHECK
  // ═══════════════════════════════════════════════════════════════
  const trimmed = (studentSql || '').trim();
  if (
    !trimmed ||
    trimmed === '-- Write your answer here' ||
    trimmed === '-- Write your query here\n' ||
    trimmed === '-- Write your query here'
  ) {
    return {
      passed: false,
      status: 'SYNTAX_ERROR',
      score: 0,
      badge: '📝 Empty Submission',
      summary: 'Submission is empty.',
      explanation: 'Please write an active SQL query before running validation.',
      actionable_hint: 'Start by writing a SELECT query (e.g. `SELECT * FROM ...;`).',
      error: 'Submission query is empty.',
    };
  }

  const destructiveMatch = /\b(DROP|ALTER|DELETE|UPDATE|TRUNCATE|ATTACH|PRAGMA|DETACH|VACUUM)\b/i.exec(trimmed);
  if (destructiveMatch) {
    return {
      passed: false,
      status: 'EXECUTION_ERROR',
      score: 0,
      badge: '🛡️ Safety Guardrail Triggered',
      summary: `Forbidden operation: ${destructiveMatch[1].toUpperCase()}`,
      explanation:
        'This interactive learning environment is strictly read-only. Modification statements (DROP, ALTER, DELETE, UPDATE, TRUNCATE, PRAGMA) are blocked.',
      actionable_hint: 'Reformulate your solution as a read-only SELECT or CTE query.',
      error: 'Unsafe statement detected.',
    };
  }

  // ═══════════════════════════════════════════════════════════════
  // LAYER 1: AST & STATIC SEMANTIC ANALYSIS
  // ═══════════════════════════════════════════════════════════════
  const studentAstResult = parseSqlAst(studentSql);
  if (!studentAstResult.valid && studentAstResult.syntaxError) {
    const syn = studentAstResult.syntaxError;
    return {
      passed: false,
      status: 'SYNTAX_ERROR',
      score: 0,
      badge: '⚡ Syntax Error Detected',
      summary: syn.message,
      explanation: `Syntax analysis failed before execution:\n\n\`\`\`\n${syn.visualPointer}\n\`\`\``,
      actionable_hint: 'Review your query syntax around the highlighted caret position.',
      ast_analysis: studentAstResult,
      error: syn.message,
    };
  }

  const studentAst = studentAstResult.ast!;

  // Structural Constraint Verification (CTEs, Window Functions, JOINs, DISTINCT)
  const structuralCheck = validateStructuralConstraints(studentAst, gradingRules);
  if (!structuralCheck.passed) {
    const firstViolation = structuralCheck.violations[0];
    return {
      passed: false,
      status: 'STRUCTURAL_MISMATCH',
      score: 0,
      badge: '⚠️ Structural Requirement Missing',
      summary: firstViolation.message,
      explanation: `Your query does not satisfy the structural constraints required for this challenge:\n\n- **Expected Construct:** \`${firstViolation.expected}\`\n- **Found:** \`${firstViolation.actual}\``,
      actionable_hint: firstViolation.message,
      ast_analysis: studentAstResult,
      error: firstViolation.message,
    };
  }

  // ═══════════════════════════════════════════════════════════════
  // LAYER 2: DUAL SANDBOX DYNAMIC EXECUTION (BASE FIXTURE)
  // ═══════════════════════════════════════════════════════════════
  const refExec = executeInSandbox(refSql, db);
  if (refExec.error) {
    return {
      passed: false,
      status: 'EXECUTION_ERROR',
      score: 0,
      badge: '🔧 Reference Query Error',
      summary: 'Internal error: Canonical solution query failed.',
      explanation: `The reference solution failed to execute: ${refExec.error}`,
      actionable_hint: 'Please contact platform support.',
      error: refExec.error,
    };
  }

  const studentExec = executeInSandbox(studentSql, db);
  const refResult = refExec.result!;

  // If student query produced runtime error
  if (studentExec.error) {
    // Run diagnostics against runtime error
    const diagCtx: DiagnosticContext = {
      studentSql,
      referenceSql: refSql,
      studentAst,
      refResult,
      errorMessage: studentExec.error,
      questionSpec: question,
    };
    const diagnostics = globalDiagnosticRegistry.runDiagnostics(diagCtx);
    const topDiag = diagnostics[0];

    return {
      passed: false,
      status: topDiag ? 'TRAP_CAUGHT' : 'EXECUTION_ERROR',
      score: 0,
      badge: topDiag ? topDiag.badge : '❌ Runtime SQLite Error',
      summary: topDiag ? topDiag.header : studentExec.error,
      explanation: topDiag
        ? topDiag.explanation
        : `SQLite Runtime Error:\n\`\`\`\n${studentExec.error}\n\`\`\``,
      actionable_hint: topDiag
        ? topDiag.actionableHint
        : 'Check table names, column names, and syntax.',
      diagnostics,
      remediation: topDiag?.remediation || null,
      error: studentExec.error,
      execution_metrics: {
        baseExecutionTimeMs: studentExec.executionTimeMs,
        studentRowCount: 0,
        expectedRowCount: refResult.rowCount,
        studentColCount: 0,
        expectedColCount: refResult.columnCount,
      },
    };
  }

  const studentResult = studentExec.result!;

  // ═══════════════════════════════════════════════════════════════
  // LAYER 2.5: MULTI-FIXTURING & MUTATION TESTING (EDGE-CASE SANDBOX)
  // ═══════════════════════════════════════════════════════════════
  let studentEdgeResult = undefined;
  let refEdgeResult = undefined;
  let edgeExecutionTimeMs = undefined;

  if (edgeDb) {
    const refEdgeExec = executeInSandbox(refSql, edgeDb);
    const stuEdgeExec = executeInSandbox(studentSql, edgeDb);
    edgeExecutionTimeMs = stuEdgeExec.executionTimeMs;

    if (!refEdgeExec.error && !stuEdgeExec.error) {
      refEdgeResult = refEdgeExec.result;
      studentEdgeResult = stuEdgeExec.result;
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // LAYER 3: INVARIANT RESULT SET COMPARISON & COGNITIVE TRAPS
  // ═══════════════════════════════════════════════════════════════
  const baseComparison = compareResultSets(refResult, studentResult, gradingRules);

  // Check edge fixture invariants if available
  let edgeComparison = { passed: true, diff: null as any };
  if (refEdgeResult && studentEdgeResult) {
    edgeComparison = compareResultSets(refEdgeResult, studentEdgeResult, gradingRules);
  }

  const isAllPassed = baseComparison.passed && edgeComparison.passed;

  // Build Diagnostic Context
  const diagCtx: DiagnosticContext = {
    studentSql,
    referenceSql: refSql,
    studentAst,
    studentResult,
    refResult,
    studentEdgeResult,
    refEdgeResult,
    questionSpec: question,
  };

  const diagnostics = globalDiagnosticRegistry.runDiagnostics(diagCtx);
  const activeTrap = diagnostics.find(d => d.category === 'cognitive_trap' || d.severity === 'HIGH') || diagnostics[0];

  // If Invariant Diff or Trap caught
  if (!isAllPassed || activeTrap) {
    const primaryDiff = baseComparison.diff || edgeComparison.diff;
    const isTrap = Boolean(activeTrap);

    const visualMarkdown = DiffFormatter.toMarkdown(refResult, studentResult, primaryDiff);
    const visualHtml = DiffFormatter.toHtml(refResult, studentResult, primaryDiff);
    const visualAnsi = DiffFormatter.toAnsi(refResult, studentResult, primaryDiff);

    let badge = '⚠️ Semantic Result Mismatch';
    let summary = primaryDiff?.summary || 'Your query output does not match the expected dataset.';
    let explanation = `The query executed successfully without runtime errors, but the resulting dataset diverged from the expected solution.`;
    let hint = 'Review your WHERE filter bounds, JOIN predicates, or ORDER BY specifications.';

    if (activeTrap) {
      badge = activeTrap.badge;
      summary = activeTrap.header;
      explanation = activeTrap.explanation;
      hint = activeTrap.actionableHint;
    } else if (!edgeComparison.passed && baseComparison.passed) {
      badge = '🧪 Edge-Case Invariant Failure';
      summary = 'Your query passed standard data but failed edge cases (NULLs, duplicate ties, or extreme values).';
      explanation = `While your query returned matching rows on standard curriculum data, it broke when evaluated against edge-case mutations (e.g. tie handling, NULL presence).`;
      hint = 'Ensure your logic gracefully handles ties, NULLs, and boundary conditions.';
    }

    return {
      passed: false,
      status: isTrap ? 'TRAP_CAUGHT' : 'SEMANTIC_MISMATCH',
      score: 0,
      badge,
      summary,
      explanation,
      actionable_hint: hint,
      ast_analysis: studentAstResult,
      diagnostics,
      diff: primaryDiff,
      visual_diff_markdown: visualMarkdown,
      visual_diff_html: visualHtml,
      visual_diff_ansi: visualAnsi,
      remediation: activeTrap?.remediation || null,
      execution_metrics: {
        baseExecutionTimeMs: studentExec.executionTimeMs,
        edgeExecutionTimeMs,
        studentRowCount: studentResult.rowCount,
        expectedRowCount: refResult.rowCount,
        studentColCount: studentResult.columnCount,
        expectedColCount: refResult.columnCount,
      },
    };
  }

  // ═══════════════════════════════════════════════════════════════
  // LAYER 4: SUCCESS / PASSED REPORT
  // ═══════════════════════════════════════════════════════════════
  const visualMarkdown = DiffFormatter.toMarkdown(refResult, studentResult, null);
  const visualHtml = DiffFormatter.toHtml(refResult, studentResult, null);
  const visualAnsi = DiffFormatter.toAnsi(refResult, studentResult, null);

  return {
    passed: true,
    status: 'PASSED',
    score: 1.0,
    badge: '✨ Solution Verified: 100% Accurate',
    summary: `Query passed all invariant checks across ${studentResult.rowCount} rows.`,
    explanation:
      'Excellent job! Your SQL solution satisfies all AST structural rules, column invariants, and edge-case multi-fixturing tests.',
    actionable_hint: 'Ready for the next challenge!',
    ast_analysis: studentAstResult,
    diagnostics: [],
    diff: null,
    visual_diff_markdown: visualMarkdown,
    visual_diff_html: visualHtml,
    visual_diff_ansi: visualAnsi,
    remediation: null,
    execution_metrics: {
      baseExecutionTimeMs: studentExec.executionTimeMs,
      edgeExecutionTimeMs,
      studentRowCount: studentResult.rowCount,
      expectedRowCount: refResult.rowCount,
      studentColCount: studentResult.columnCount,
      expectedColCount: refResult.columnCount,
    },
  };
}
