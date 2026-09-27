/**
 * MANODEMY INTELLIGENT SQL QUERY VALIDATION & PEDAGOGICAL DIAGNOSTIC ENGINE (v4.0)
 * Core Type Definitions & Architectural Data Contracts
 */

export type GradingStatus =
  | 'PASSED'
  | 'TRAP_CAUGHT'
  | 'SYNTAX_ERROR'
  | 'STRUCTURAL_MISMATCH'
  | 'SEMANTIC_MISMATCH'
  | 'EXECUTION_ERROR';

export type DiagnosticCategory =
  | 'cognitive_trap'
  | 'syntax_anatomy'
  | 'schema_hallucination'
  | 'order_of_execution'
  | 'type_precision'
  | 'structural_omission';

export interface SqlToken {
  type:
    | 'KEYWORD'
    | 'IDENTIFIER'
    | 'STRING'
    | 'NUMBER'
    | 'OPERATOR'
    | 'PUNCTUATION'
    | 'COMMENT'
    | 'WHITESPACE';
  value: string;
  line: number;
  column: number;
  start: number;
  end: number;
}

export interface SqlColumnRef {
  raw: string;
  table?: string;
  column: string;
  alias?: string;
  isAggregate?: boolean;
  aggregateFunc?: string;
  isWindow?: boolean;
  windowFunc?: string;
}

export interface SqlJoinClause {
  type: 'INNER' | 'LEFT' | 'RIGHT' | 'FULL' | 'CROSS' | 'NATURAL' | 'JOIN';
  table: string;
  alias?: string;
  onCondition?: string;
}

export interface SqlWindowDef {
  funcName: string;
  partitionBy?: string[];
  orderBy?: string[];
  frameClause?: string; // e.g. "ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW"
}

export interface SqlAst {
  rawSql: string;
  statementType: 'SELECT' | 'WITH_SELECT' | 'UNKNOWN';
  hasWithCte: boolean;
  cteNames: string[];
  isDistinct: boolean;
  projections: SqlColumnRef[];
  fromTable?: string;
  fromTableAlias?: string;
  joins: SqlJoinClause[];
  whereClause?: string;
  groupByColumns: string[];
  havingClause?: string;
  windowFunctions: SqlWindowDef[];
  orderByColumns: { column: string; direction: 'ASC' | 'DESC' }[];
  limit?: number;
  offset?: number;
  subqueriesCount: number;
  containsNotIn: boolean;
  containsNullComparison: boolean;
  rawTokens: SqlToken[];
}

export interface AstAnalysisResult {
  valid: boolean;
  ast?: SqlAst;
  syntaxError?: {
    message: string;
    line: number;
    column: number;
    visualPointer: string;
    token?: string;
  };
  structuralViolations: {
    rule: string;
    expected: string;
    actual: string;
    message: string;
  }[];
}

export interface QuestionGradingRules {
  orderSensitive?: boolean;
  columnNameSensitive?: boolean;
  strictAliasing?: boolean;
  floatEpsilon?: number;
  requiresCte?: boolean;
  requiresWindowFunction?: string[]; // e.g. ['RANK', 'DENSE_RANK', 'ROW_NUMBER', 'SUM']
  requiresJoin?: string[]; // e.g. ['LEFT JOIN', 'INNER JOIN']
  requiresDistinct?: boolean;
  requiresGroupBy?: boolean;
  requiresHaving?: boolean;
  disallowedKeywords?: string[];
  maxRowCount?: number;
  minRowCount?: number;
  customCheckFn?: (studentAst: SqlAst, report: Partial<GradingReport>) => boolean;
}

export interface QuestionSpec {
  id?: string | number;
  prompt?: string;
  ref?: string;
  referenceSql?: string;
  grading?: QuestionGradingRules;
  edgeFixtureOverrides?: string; // Additional SQL DDL/DML to run for edge-case mutation
}

export interface DbResultRow {
  [columnName: string]: string | number | boolean | null | Uint8Array;
}

export interface NormalizedResultSet {
  columns: string[];
  rows: (string | number | boolean | null)[][];
  rowCount: number;
  columnCount: number;
}

export interface DatabaseAdapter {
  exec(sql: string): { columns?: string[]; values?: (string | number | boolean | null)[][] }[] | NormalizedResultSet;
  run?(sql: string): void;
}

export interface RemediationAction {
  actionLabel: string;
  suggestedFix?: string;
  actionReplace?: {
    from: string | RegExp;
    to: string;
  };
  reRunOnApply?: boolean;
}

export interface DiagnosticContext {
  studentSql: string;
  referenceSql?: string;
  studentAst?: SqlAst;
  refAst?: SqlAst;
  studentResult?: NormalizedResultSet;
  refResult?: NormalizedResultSet;
  studentEdgeResult?: NormalizedResultSet;
  refEdgeResult?: NormalizedResultSet;
  errorMessage?: string;
  schema?: Record<string, string[]>;
  questionSpec?: QuestionSpec;
}

export interface DiagnosticMatch {
  matched: boolean;
  trapId: string;
  badge: string;
  header: string;
  category: DiagnosticCategory;
  explanation: string;
  actionableHint: string;
  remediation?: RemediationAction;
  severity: 'HIGH' | 'MEDIUM' | 'LOW';
}

export interface DiagnosticRule {
  id: string;
  name: string;
  category: DiagnosticCategory;
  detect: (ctx: DiagnosticContext) => DiagnosticMatch | null;
}

export interface ValueMismatch {
  row: number;
  col: number;
  columnName: string;
  expected: string | number | boolean | null;
  actual: string | number | boolean | null;
  reason: 'TYPE_MISMATCH' | 'VALUE_DIFF' | 'NULL_DISCREPANCY' | 'PRECISION_ERROR';
}

export interface DiffReport {
  type:
    | 'NONE'
    | 'COLUMN_COUNT_MISMATCH'
    | 'COLUMN_NAME_MISMATCH'
    | 'ROW_COUNT_MISMATCH'
    | 'ROW_ORDER_MISMATCH'
    | 'VALUE_MISMATCH'
    | 'EDGE_CASE_FAILURE';
  summary: string;
  expectedColumns?: string[];
  actualColumns?: string[];
  expectedRowCount?: number;
  actualRowCount?: number;
  mismatches?: ValueMismatch[];
  edgeCaseDetails?: {
    fixtureName: string;
    expectedRowCount: number;
    actualRowCount: number;
    explanation: string;
  };
}

export interface ExecutionMetrics {
  baseExecutionTimeMs: number;
  edgeExecutionTimeMs?: number;
  studentRowCount: number;
  expectedRowCount: number;
  studentColCount: number;
  expectedColCount: number;
}

export interface GradingReport {
  passed: boolean;
  status: GradingStatus;
  score: number; // 0.0 to 1.0
  badge: string;
  summary: string;
  explanation: string;
  actionable_hint: string;
  ast_analysis?: AstAnalysisResult;
  diagnostics?: DiagnosticMatch[];
  diff?: DiffReport | null;
  visual_diff_markdown?: string;
  visual_diff_html?: string;
  visual_diff_ansi?: string;
  remediation?: RemediationAction | null;
  execution_metrics?: ExecutionMetrics;
  error?: string | null;
}
