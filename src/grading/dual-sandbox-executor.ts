/**
 * MANODEMY DUAL SANDBOX DYNAMIC EXECUTION & INVARIANT COMPARATOR
 * Layer 2 of the v4.0 Intelligent SQL Validation Engine
 */

import {
  DatabaseAdapter,
  NormalizedResultSet,
  QuestionGradingRules,
  DiffReport,
  ValueMismatch,
} from './types';

const DEFAULT_FLOAT_EPSILON = 0.0001;

/**
 * Standardize output from sql.js, better-sqlite3, or raw result objects
 */
export function normalizeResultSet(rawResult: any): NormalizedResultSet {
  if (!rawResult) {
    return { columns: [], rows: [], rowCount: 0, columnCount: 0 };
  }

  // 1. sql.js format: [{ columns: ['id', 'name'], values: [[1, 'Alice'], [2, 'Bob']] }]
  if (Array.isArray(rawResult)) {
    if (rawResult.length === 0) {
      return { columns: [], rows: [], rowCount: 0, columnCount: 0 };
    }
    const first = rawResult[0];
    if (first && Array.isArray(first.columns) && Array.isArray(first.values)) {
      return {
        columns: first.columns.map(String),
        rows: first.values.map(row => (Array.isArray(row) ? row : [row])),
        rowCount: first.values.length,
        columnCount: first.columns.length,
      };
    }
  }

  // 2. better-sqlite3 .all() format: [{ id: 1, name: 'Alice' }, { id: 2, name: 'Bob' }]
  if (Array.isArray(rawResult) && rawResult.length > 0 && typeof rawResult[0] === 'object') {
    const columns = Object.keys(rawResult[0]);
    const rows = rawResult.map(obj => columns.map(col => (obj as any)[col] ?? null));
    return {
      columns,
      rows,
      rowCount: rows.length,
      columnCount: columns.length,
    };
  }

  // 3. Already normalized
  if (rawResult.columns && rawResult.rows) {
    return {
      columns: rawResult.columns,
      rows: rawResult.rows,
      rowCount: rawResult.rows.length,
      columnCount: rawResult.columns.length,
    };
  }

  return { columns: [], rows: [], rowCount: 0, columnCount: 0 };
}

/**
 * Compare two individual cells with float epsilon and 3VL NULL rules
 */
export function compareCells(
  expected: any,
  actual: any,
  epsilon: number = DEFAULT_FLOAT_EPSILON
): { match: boolean; reason?: ValueMismatch['reason'] } {
  // 1. Strict NULL checks
  const isExpNull = expected === null || expected === undefined;
  const isActNull = actual === null || actual === undefined;

  if (isExpNull && isActNull) return { match: true };
  if (isExpNull !== isActNull) return { match: false, reason: 'NULL_DISCREPANCY' };

  // 2. Direct equality
  if (expected === actual) return { match: true };

  // 3. Numeric float comparison with epsilon tolerance
  const numExp = typeof expected === 'number' ? expected : parseFloat(String(expected));
  const numAct = typeof actual === 'number' ? actual : parseFloat(String(actual));

  if (!isNaN(numExp) && !isNaN(numAct)) {
    if (Math.abs(numExp - numAct) <= epsilon) {
      return { match: true };
    }
    return { match: false, reason: 'PRECISION_ERROR' };
  }

  // 4. String comparison (trimmed, normalized line endings)
  const strExp = String(expected).trim();
  const strAct = String(actual).trim();
  if (strExp === strAct) return { match: true };

  // 5. Type mismatch check
  if (typeof expected !== typeof actual) {
    return { match: false, reason: 'TYPE_MISMATCH' };
  }

  return { match: false, reason: 'VALUE_DIFF' };
}

/**
 * Deterministically serialize a row to allow order-invariant multiset comparison
 */
function serializeRow(row: any[]): string {
  return JSON.stringify(
    row.map(v => {
      if (v === null || v === undefined) return null;
      if (typeof v === 'number') return Math.round(v * 10000) / 10000;
      return String(v).trim();
    })
  );
}

/**
 * Compare two NormalizedResultSets across Column, Row, Type, and Invariant layers
 */
export function compareResultSets(
  expected: NormalizedResultSet,
  actual: NormalizedResultSet,
  rules: QuestionGradingRules = {}
): { passed: boolean; diff: DiffReport | null } {
  const epsilon = rules.floatEpsilon ?? DEFAULT_FLOAT_EPSILON;

  // Invariant 1: Column Count
  if (expected.columnCount !== actual.columnCount) {
    return {
      passed: false,
      diff: {
        type: 'COLUMN_COUNT_MISMATCH',
        summary: `Column count mismatch: Expected ${expected.columnCount} columns (${expected.columns.join(', ')}), but your query returned ${actual.columnCount} columns (${actual.columns.join(', ')}).`,
        expectedColumns: expected.columns,
        actualColumns: actual.columns,
        expectedRowCount: expected.rowCount,
        actualRowCount: actual.rowCount,
      },
    };
  }

  // Invariant 2: Column Names (if strict aliasing or sensitive)
  if (rules.columnNameSensitive || rules.strictAliasing) {
    for (let i = 0; i < expected.columns.length; i++) {
      const expCol = expected.columns[i].trim().toLowerCase();
      const actCol = actual.columns[i].trim().toLowerCase();
      if (expCol !== actCol) {
        return {
          passed: false,
          diff: {
            type: 'COLUMN_NAME_MISMATCH',
            summary: `Column alias mismatch at column #${i + 1}: Expected alias '${expected.columns[i]}', but got '${actual.columns[i]}'.`,
            expectedColumns: expected.columns,
            actualColumns: actual.columns,
            expectedRowCount: expected.rowCount,
            actualRowCount: actual.rowCount,
          },
        };
      }
    }
  }

  // Invariant 3: Row Count
  if (expected.rowCount !== actual.rowCount) {
    return {
      passed: false,
      diff: {
        type: 'ROW_COUNT_MISMATCH',
        summary: `Row count mismatch: Expected ${expected.rowCount} rows, but got ${actual.rowCount} rows.`,
        expectedColumns: expected.columns,
        actualColumns: actual.columns,
        expectedRowCount: expected.rowCount,
        actualRowCount: actual.rowCount,
      },
    };
  }

  // If both have 0 rows, it's an exact match!
  if (expected.rowCount === 0 && actual.rowCount === 0) {
    return { passed: true, diff: null };
  }

  // Invariant 4: Order-Sensitive Row Comparison
  if (rules.orderSensitive) {
    const mismatches: ValueMismatch[] = [];
    for (let r = 0; r < expected.rowCount; r++) {
      const expRow = expected.rows[r];
      const actRow = actual.rows[r];
      for (let c = 0; c < expected.columnCount; c++) {
        const check = compareCells(expRow[c], actRow[c], epsilon);
        if (!check.match) {
          mismatches.push({
            row: r + 1,
            col: c + 1,
            columnName: expected.columns[c] || `col_${c + 1}`,
            expected: expRow[c],
            actual: actRow[c],
            reason: check.reason || 'VALUE_DIFF',
          });
        }
      }
    }

    if (mismatches.length > 0) {
      return {
        passed: false,
        diff: {
          type: 'VALUE_MISMATCH',
          summary: `Value mismatch found in ${mismatches.length} cell(s) under ordered comparison.`,
          expectedColumns: expected.columns,
          actualColumns: actual.columns,
          expectedRowCount: expected.rowCount,
          actualRowCount: actual.rowCount,
          mismatches,
        },
      };
    }

    return { passed: true, diff: null };
  }

  // Invariant 5: Order-Invariant Multiset Comparison (preserves duplicate rows)
  const expMap = new Map<string, { count: number; originalRow: any[] }>();
  const actMap = new Map<string, { count: number; originalRow: any[] }>();

  for (const row of expected.rows) {
    const key = serializeRow(row);
    const existing = expMap.get(key);
    if (existing) {
      existing.count++;
    } else {
      expMap.set(key, { count: 1, originalRow: row });
    }
  }

  for (const row of actual.rows) {
    const key = serializeRow(row);
    const existing = actMap.get(key);
    if (existing) {
      existing.count++;
    } else {
      actMap.set(key, { count: 1, originalRow: row });
    }
  }

  // Check multiset equivalence
  let hasMultisetMismatch = false;
  const mismatches: ValueMismatch[] = [];

  for (const [key, expVal] of expMap.entries()) {
    const actVal = actMap.get(key);
    if (!actVal || actVal.count !== expVal.count) {
      hasMultisetMismatch = true;
      break;
    }
  }

  if (hasMultisetMismatch) {
    // Collect specific cell/row differences for pedagogical reporting
    for (let r = 0; r < Math.min(expected.rowCount, actual.rowCount); r++) {
      const expRow = expected.rows[r];
      const actRow = actual.rows[r];
      for (let c = 0; c < expected.columnCount; c++) {
        const check = compareCells(expRow[c], actRow[c], epsilon);
        if (!check.match) {
          mismatches.push({
            row: r + 1,
            col: c + 1,
            columnName: expected.columns[c] || `col_${c + 1}`,
            expected: expRow[c],
            actual: actRow[c],
            reason: check.reason || 'VALUE_DIFF',
          });
        }
      }
    }

    return {
      passed: false,
      diff: {
        type: 'VALUE_MISMATCH',
        summary: `Result sets do not contain identical rows (multiset difference detected).`,
        expectedColumns: expected.columns,
        actualColumns: actual.columns,
        expectedRowCount: expected.rowCount,
        actualRowCount: actual.rowCount,
        mismatches: mismatches.slice(0, 10), // Top 10 cell mismatches
      },
    };
  }

  return { passed: true, diff: null };
}

/**
 * Execute a query safely in an isolated sandbox with timing metrics
 */
export function executeInSandbox(
  sql: string,
  db: DatabaseAdapter
): { result?: NormalizedResultSet; error?: string; executionTimeMs: number } {
  const startTime = Date.now();
  try {
    const raw = db.exec(sql);
    const executionTimeMs = Date.now() - startTime;
    return {
      result: normalizeResultSet(raw),
      executionTimeMs,
    };
  } catch (err: any) {
    const executionTimeMs = Date.now() - startTime;
    return {
      error: err?.message || String(err),
      executionTimeMs,
    };
  }
}
