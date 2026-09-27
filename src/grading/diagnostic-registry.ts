/**
 * MANODEMY COGNITIVE ANTI-PATTERN & MISCONCEPTION DIAGNOSTIC REGISTRY
 * Layer 3 of the v4.0 Intelligent SQL Validation Engine
 */

import {
  DiagnosticRule,
  DiagnosticContext,
  DiagnosticMatch,
} from './types';

export class DiagnosticRegistry {
  private rules: Map<string, DiagnosticRule> = new Map();

  constructor() {
    this.registerDefaultRules();
  }

  public register(rule: DiagnosticRule): void {
    this.rules.set(rule.id, rule);
  }

  public get(id: string): DiagnosticRule | undefined {
    return this.rules.get(id);
  }

  public getAll(): DiagnosticRule[] {
    return Array.from(this.rules.values());
  }

  /**
   * Run all diagnostic rules against the evaluation context
   */
  public runDiagnostics(ctx: DiagnosticContext): DiagnosticMatch[] {
    const matches: DiagnosticMatch[] = [];

    for (const rule of this.rules.values()) {
      try {
        const match = rule.detect(ctx);
        if (match && match.matched) {
          matches.push(match);
        }
      } catch (err) {
        // Individual diagnostic failures must never crash the grading pipeline
        console.warn(`Diagnostic rule ${rule.id} failed:`, err);
      }
    }

    // Sort by severity (HIGH -> MEDIUM -> LOW)
    const severityOrder = { HIGH: 3, MEDIUM: 2, LOW: 1 };
    return matches.sort((a, b) => severityOrder[b.severity] - severityOrder[a.severity]);
  }

  private registerDefaultRules(): void {
    // ═══════════════════════════════════════════════════════════════
    // 1. NOT IN WITH SUBQUERY NULL TRAP (3VL Pitfall)
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'NOT_IN_SUBQUERY_NULL',
      name: 'NOT IN with Subquery NULL Trap',
      category: 'cognitive_trap',
      detect: (ctx) => {
        const hasNotIn = /\bNOT\s+IN\s*\(\s*SELECT\b/i.test(ctx.studentSql);
        if (!hasNotIn) return null;

        const stuRows = ctx.studentResult?.rowCount ?? 0;
        const refRows = ctx.refResult?.rowCount ?? 0;

        // Trap symptom: Student query returns 0 rows while reference returns rows
        if (stuRows === 0 && refRows > 0) {
          return {
            matched: true,
            trapId: 'NOT_IN_SUBQUERY_NULL',
            badge: '💀 SQL Trap Detected: NULL in Subquery',
            header: 'NOT IN with NULL Subquery Trap',
            category: 'cognitive_trap',
            severity: 'HIGH',
            explanation:
              'In SQL Three-Valued Logic (3VL), <code>column NOT IN (val1, val2, NULL)</code> expands internally into <code>column != val1 AND column != val2 AND column != NULL</code>. Any comparison with <code>NULL</code> evaluates to <strong>UNKNOWN</strong>, making the entire AND-chain UNKNOWN. Because <code>WHERE</code> only retains rows that evaluate to <code>TRUE</code>, <strong>all rows are silently discarded (0 rows returned)</strong>.',
            actionableHint:
              'Add <code>WHERE column_name IS NOT NULL</code> inside your subquery filter, or rewrite the query using <code>NOT EXISTS</code> or an anti-join (<code>LEFT JOIN ... WHERE right.id IS NULL</code>).',
            remediation: {
              actionLabel: "Add 'WHERE ... IS NOT NULL' to subquery",
              suggestedFix: 'WHERE ... IS NOT NULL',
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 2. LEFT JOIN NULLIFICATION (WHERE Right Table Filter Bug)
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'LEFT_JOIN_NULLIFICATION',
      name: 'LEFT JOIN Nullification in WHERE Clause',
      category: 'cognitive_trap',
      detect: (ctx) => {
        const hasLeftJoin = /\bLEFT\s+(OUTER\s+)?JOIN\s+([a-zA-Z0-9_]+)(\s+AS\s+([a-zA-Z0-9_]+)|\s+([a-zA-Z0-9_]+))?\b/i.exec(
          ctx.studentSql
        );
        if (!hasLeftJoin) return null;

        const rightTable = hasLeftJoin[2];
        const rightAlias = hasLeftJoin[4] || hasLeftJoin[5] || rightTable;

        // Check if WHERE filters on right table without IS NULL check
        const whereRegex = new RegExp(
          `WHERE[\\s\\S]*?\\b(${rightTable}|${rightAlias})\\.([a-zA-Z0-9_]+)\\s*(=|!=|>|<|>=|<=|LIKE|BETWEEN|IN)\\s*`,
          'i'
        );

        if (whereRegex.test(ctx.studentSql)) {
          const stuRows = ctx.studentResult?.rowCount ?? 0;
          const refRows = ctx.refResult?.rowCount ?? 0;

          // Usually returns fewer rows because unmatched NULL rows are filtered out
          if (stuRows < refRows || stuRows !== refRows) {
            return {
              matched: true,
              trapId: 'LEFT_JOIN_NULLIFICATION',
              badge: '⚠️ Cognitive Bug: LEFT JOIN Nullified',
              header: 'LEFT JOIN Filter in WHERE Clause',
              category: 'cognitive_trap',
              severity: 'HIGH',
              explanation:
                `Placing filter conditions for the right table (<code>${rightAlias}</code>) inside the <code>WHERE</code> clause evaluates to <code>NULL = 'value'</code> (<strong>UNKNOWN</strong>) on unmatched rows. This unintentionally converts your <code>LEFT JOIN</code> into an <strong>INNER JOIN</strong>, silently eliminating preserving unmatched left rows!`,
              actionableHint:
                `Move the condition <code>${rightAlias}.col = ...</code> from the <code>WHERE</code> clause into the <code>LEFT JOIN ... ON</code> clause, or explicitly allow NULLs with <code>OR ${rightAlias}.col IS NULL</code>.`,
              remediation: {
                actionLabel: `Move filter to ON clause`,
              },
            };
          }
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 3. COUNT(*) vs COUNT(column) NULL DISCREPANCY
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'COUNT_STAR_VS_COL',
      name: 'COUNT(*) vs COUNT(column) NULL Confusion',
      category: 'cognitive_trap',
      detect: (ctx) => {
        const studentHasCountCol = /COUNT\s*\(\s*([a-zA-Z0-9_]+)\s*\)/i.exec(ctx.studentSql);
        const refHasCountStar = /COUNT\s*\(\s*\*\s*\)/i.test(ctx.referenceSql || '');

        if (studentHasCountCol && refHasCountStar && studentHasCountCol[1].toUpperCase() !== 'DISTINCT') {
          const colName = studentHasCountCol[1];
          return {
            matched: true,
            trapId: 'COUNT_STAR_VS_COL',
            badge: '💡 Concept Clarity: COUNT(*) vs COUNT(column)',
            header: 'COUNT(*) vs COUNT(column) NULL Mismatch',
            category: 'cognitive_trap',
            severity: 'MEDIUM',
            explanation:
              `<code>COUNT(*)</code> counts <strong>all rows</strong> in the table or group regardless of NULLs. In contrast, <code>COUNT(${colName})</code> only counts rows where <code>${colName}</code> is <strong>NOT NULL</strong>. Because this dataset contains NULL values, your count is lower than expected!`,
            actionableHint: `Use <code>COUNT(*)</code> if you want to count total records including those with NULL values.`,
            remediation: {
              actionLabel: "Change to 'COUNT(*)'",
              actionReplace: {
                from: new RegExp(`COUNT\\s*\\(\\s*${colName}\\s*\\)`, 'i'),
                to: 'COUNT(*)',
              },
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 4. GROUP BY NON-AGGREGATED PROJECTION VIOLATION
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'GROUP_BY_NON_AGGREGATED_PROJECTION',
      name: 'Non-Aggregated Projection in GROUP BY',
      category: 'cognitive_trap',
      detect: (ctx) => {
        if (!ctx.studentAst || ctx.studentAst.groupByColumns.length === 0) return null;

        const groupCols = new Set(
          ctx.studentAst.groupByColumns.map(c => c.toLowerCase().split('.').pop() || '')
        );

        const unaggregatedCols: string[] = [];
        for (const proj of ctx.studentAst.projections) {
          if (proj.isAggregate || proj.isWindow || proj.raw.includes('*')) continue;
          const colBase = proj.column.toLowerCase().split('.').pop() || '';
          if (colBase && !groupCols.has(colBase) && colBase !== '1' && colBase !== '2') {
            unaggregatedCols.push(proj.column);
          }
        }

        if (unaggregatedCols.length > 0) {
          return {
            matched: true,
            trapId: 'GROUP_BY_NON_AGGREGATED_PROJECTION',
            badge: '⚠️ SQL Anti-Pattern: Non-Aggregated Projection',
            header: 'Missing Columns in GROUP BY',
            category: 'cognitive_trap',
            severity: 'HIGH',
            explanation:
              `You projected column(s) <code>${unaggregatedCols.join(', ')}</code> in the <code>SELECT</code> clause, but they are neither enclosed in an aggregate function (like <code>SUM</code>, <code>AVG</code>, <code>MAX</code>) nor included in the <code>GROUP BY</code> clause. In standard SQL, this produces arbitrary values from indeterminate rows within each group!`,
            actionableHint:
              `Either add <code>${unaggregatedCols.join(', ')}</code> to your <code>GROUP BY</code> list or wrap them in an appropriate aggregate function.`,
            remediation: {
              actionLabel: `Add '${unaggregatedCols[0]}' to GROUP BY`,
              suggestedFix: unaggregatedCols[0],
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 5. WINDOW FRAMING DEFAULT DRIFT (RANGE vs ROWS on Ties)
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'WINDOW_DEFAULT_FRAME_DRIFT',
      name: 'Window Frame Default Drift on Duplicate Ties',
      category: 'cognitive_trap',
      detect: (ctx) => {
        const hasOverOrder = /\bOVER\s*\(\s*([^)]*ORDER\s+BY[^)]*)\)/i.exec(ctx.studentSql);
        if (!hasOverOrder) return null;

        const overContent = hasOverOrder[1].toUpperCase();
        const hasExplicitFrame = overContent.includes('ROWS') || overContent.includes('RANGE');

        // If window query uses SUM/AVG running calculation without explicit ROWS frame
        const isCumulative = /\b(SUM|AVG|COUNT)\s*\([^)]*\)\s+OVER/i.test(ctx.studentSql);
        if (isCumulative && !hasExplicitFrame) {
          return {
            matched: true,
            trapId: 'WINDOW_DEFAULT_FRAME_DRIFT',
            badge: '🎯 Window Frame Drift: RANGE vs ROWS',
            header: 'Default Window Frame on Tie Values',
            category: 'cognitive_trap',
            severity: 'MEDIUM',
            explanation:
              'When an <code>ORDER BY</code> is provided in a window function without an explicit frame clause, SQL defaults to <code>RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW</code>. If the dataset contains duplicate timestamps or identical scores (peer ties), <code>RANGE</code> calculates the total across <em>all tie peers simultaneously</em> instead of strictly accumulating row by row!',
            actionableHint:
              'Append <code>ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW</code> (or <code>ROWS UNBOUNDED PRECEDING</code>) inside your <code>OVER (...)</code> clause to force row-by-row calculation.',
            remediation: {
              actionLabel: "Add 'ROWS UNBOUNDED PRECEDING'",
              suggestedFix: 'ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW',
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 6. RANK() vs DENSE_RANK() TIE SKIPPING
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'RANK_VS_DENSE_RANK_TIE_SKIPPING',
      name: 'RANK() vs DENSE_RANK() Gap Skipping',
      category: 'cognitive_trap',
      detect: (ctx) => {
        const studentUsesRank = /\bRANK\s*\(\s*\)\s+OVER/i.test(ctx.studentSql);
        const refUsesDenseRank = /\bDENSE_RANK\s*\(\s*\)\s+OVER/i.test(ctx.referenceSql || '');

        if (studentUsesRank && refUsesDenseRank) {
          return {
            matched: true,
            trapId: 'RANK_VS_DENSE_RANK_TIE_SKIPPING',
            badge: '🏅 Ranking Function Mismatch: RANK() vs DENSE_RANK()',
            header: 'Rank Gap Skipping on Score Ties',
            category: 'cognitive_trap',
            severity: 'HIGH',
            explanation:
              '<code>RANK()</code> leaves gaps in ranking numbers after identical ties (e.g. 1, 2, 2, <strong>4</strong>). In contrast, <code>DENSE_RANK()</code> assigns consecutive rank numbers without skipping (e.g. 1, 2, 2, <strong>3</strong>).',
            actionableHint: 'Replace <code>RANK()</code> with <code>DENSE_RANK()</code> to prevent rank number skipping on ties.',
            remediation: {
              actionLabel: "Change 'RANK()' ➔ 'DENSE_RANK()'",
              actionReplace: {
                from: /\bRANK\s*\(\s*\)/gi,
                to: 'DENSE_RANK()',
              },
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 7. AGGREGATE IN WHERE CLAUSE TRAP
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'AGGREGATE_IN_WHERE',
      name: 'Aggregate Function in WHERE Clause',
      category: 'order_of_execution',
      detect: (ctx) => {
        const match = ctx.studentSql.match(
          /WHERE\s+([\s\S]*?\b(COUNT|SUM|AVG|MIN|MAX)\s*\([\s\S]*?\)\s*([><=]+|IS|BETWEEN|IN)\s*[^;\n]+)/i
        );
        if (match || (ctx.errorMessage && /misuse of aggregate/i.test(ctx.errorMessage))) {
          const aggCond = match ? match[1] : 'COUNT(*) > 1';
          return {
            matched: true,
            trapId: 'AGGREGATE_IN_WHERE',
            badge: '❌ Execution Order Error: Aggregate in WHERE',
            header: 'Aggregate in WHERE Clause',
            category: 'order_of_execution',
            severity: 'HIGH',
            explanation:
              'Aggregate functions (<code>COUNT</code>, <code>SUM</code>, <code>AVG</code>) cannot appear in a <code>WHERE</code> clause because <code>WHERE</code> filters individual candidate rows <em>before</em> aggregation happens. Filter aggregated groups using <strong>HAVING</strong> instead!',
            actionableHint: 'Replace <code>WHERE</code> with <code>HAVING</code> after your <code>GROUP BY</code> clause.',
            remediation: {
              actionLabel: "Change 'WHERE' ➔ 'HAVING'",
              actionReplace: {
                from: new RegExp(`WHERE\\s+${aggCond.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}`, 'i'),
                to: `HAVING ${aggCond}`,
              },
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 8. EQUALITY WITH NULL TRAP (= NULL or != NULL)
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'NULL_EQUALITY_TRAP',
      name: 'Direct Comparison with NULL (= NULL / != NULL)',
      category: 'type_precision',
      detect: (ctx) => {
        if (/=\s*NULL\b/i.test(ctx.studentSql)) {
          return {
            matched: true,
            trapId: 'NULL_EQUALITY_TRAP',
            badge: '💀 Three-Valued Logic: NULL Comparison Trap',
            header: 'Incorrect = NULL Comparison',
            category: 'type_precision',
            severity: 'HIGH',
            explanation:
              'In SQL, <code>= NULL</code> always evaluates to <strong>UNKNOWN</strong> (which is treated as false in WHERE clauses) because NULL signifies missing data. To check for absent values, always use <strong>IS NULL</strong>.',
            actionableHint: "Change <code>= NULL</code> to <code>IS NULL</code>.",
            remediation: {
              actionLabel: "Change '= NULL' ➔ 'IS NULL'",
              actionReplace: {
                from: /=\s*NULL\b/gi,
                to: 'IS NULL',
              },
            },
          };
        }
        if (/(!=|<>)\s*NULL\b/i.test(ctx.studentSql)) {
          return {
            matched: true,
            trapId: 'NULL_EQUALITY_TRAP',
            badge: '💀 Three-Valued Logic: NOT NULL Comparison Trap',
            header: 'Incorrect != NULL Comparison',
            category: 'type_precision',
            severity: 'HIGH',
            explanation:
              'Comparing <code>!= NULL</code> or <code>&lt;&gt; NULL</code> always produces <strong>UNKNOWN</strong> and never matches any rows. Use <strong>IS NOT NULL</strong>.',
            actionableHint: "Change <code>!= NULL</code> to <code>IS NOT NULL</code>.",
            remediation: {
              actionLabel: "Change '!= NULL' ➔ 'IS NOT NULL'",
              actionReplace: {
                from: /(!=|<>)\s*NULL\b/gi,
                to: 'IS NOT NULL',
              },
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 9. PYTHON-STYLE CHAINED COMPARISONS
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'CHAINED_COMPARISONS',
      name: 'Python-Style Chained Comparison',
      category: 'syntax_anatomy',
      detect: (ctx) => {
        if (/WHERE\s+[0-9'a-zA-Z_]+\s*[><=]+\s*[a-zA-Z0-9_]+\s*[><=]+\s*[0-9'a-zA-Z_]+/i.test(ctx.studentSql)) {
          return {
            matched: true,
            trapId: 'CHAINED_COMPARISONS',
            badge: '⚠️ Syntax Trap: Chained Comparisons',
            header: 'Chained Comparison Trap',
            category: 'syntax_anatomy',
            severity: 'HIGH',
            explanation:
              'SQL does not support mathematical chained comparisons like <code>50000 &lt; salary &lt; 100000</code>. SQL evaluates <code>(50000 &lt; salary)</code> into <code>0</code> or <code>1</code>, and then compares <code>(0 or 1) &lt; 100000</code>, returning unexpected results!',
            actionableHint: 'Split into two conditions with <code>AND</code> (e.g. <code>salary &gt; 50000 AND salary &lt; 100000</code>) or use <code>BETWEEN</code>.',
            remediation: {
              actionLabel: "Use 'BETWEEN' or 'AND'",
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 10. BETWEEN WITH OR SYNTAX
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'BETWEEN_OR',
      name: 'BETWEEN with OR Operator',
      category: 'syntax_anatomy',
      detect: (ctx) => {
        if (/BETWEEN\s+[0-9'a-zA-Z_]+\s+OR\s+/i.test(ctx.studentSql)) {
          return {
            matched: true,
            trapId: 'BETWEEN_OR',
            badge: '⚡ Syntax Error: BETWEEN with OR',
            header: 'BETWEEN Operator Syntax',
            category: 'syntax_anatomy',
            severity: 'MEDIUM',
            explanation: 'The <code>BETWEEN</code> operator connects its boundary values with <strong>AND</strong>, not <code>OR</code> (e.g. <code>BETWEEN 1000 AND 5000</code>).',
            actionableHint: "Change <code>OR</code> to <code>AND</code> in your BETWEEN expression.",
            remediation: {
              actionLabel: "Change 'OR' ➔ 'AND'",
              actionReplace: {
                from: /\bBETWEEN\s+([0-9'a-zA-Z_]+)\s+OR\s+/i,
                to: 'BETWEEN $1 AND ',
              },
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 11. LIKE WITH REGEX ASTERISK WILDCARD (*)
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'LIKE_WILDCARD_MISMATCH',
      name: 'LIKE with Regex Wildcard (* or ?)',
      category: 'syntax_anatomy',
      detect: (ctx) => {
        if (/LIKE\s+'[^']*\*[^']*'/i.test(ctx.studentSql)) {
          return {
            matched: true,
            trapId: 'LIKE_WILDCARD_MISMATCH',
            badge: '🔍 Pattern Wildcard Mismatch',
            header: 'LIKE Wildcard Mismatch',
            category: 'syntax_anatomy',
            severity: 'MEDIUM',
            explanation: 'In SQL <code>LIKE</code> clauses, use <code>%</code> for multi-character matching (not <code>*</code>) and <code>_</code> for single characters (not <code>?</code>).',
            actionableHint: "Replace <code>*</code> with <code>%</code> in your search string.",
            remediation: {
              actionLabel: "Change '*' ➔ '%'",
              actionReplace: {
                from: '*',
                to: '%',
              },
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 12. SQL SERVER TOP INSTEAD OF LIMIT
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'SQL_SERVER_TOP_LIMIT',
      name: 'SQL Server TOP Dialect Instead of LIMIT',
      category: 'syntax_anatomy',
      detect: (ctx) => {
        const match = ctx.studentSql.match(/SELECT\s+TOP\s+([0-9]+)\s+/i);
        if (match) {
          const n = match[1];
          return {
            matched: true,
            trapId: 'SQL_SERVER_TOP_LIMIT',
            badge: '⚡ SQL Dialect Notice: TOP vs LIMIT',
            header: 'TOP vs LIMIT Dialect Syntax',
            category: 'syntax_anatomy',
            severity: 'MEDIUM',
            explanation: `<code>TOP</code> is specific to Microsoft T-SQL. Standard SQLite and PostgreSQL use <strong>LIMIT ${n}</strong> at the end of the query.`,
            actionableHint: `Remove <code>TOP ${n}</code> and append <code>LIMIT ${n};</code> to the end.`,
            remediation: {
              actionLabel: `Convert TOP ${n} ➔ LIMIT ${n}`,
              actionReplace: {
                from: new RegExp(`SELECT\\s+TOP\\s+${n}\\s+`, 'i'),
                to: 'SELECT ',
              },
              suggestedFix: `LIMIT ${n};`,
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 13. STRING CONCATENATION WITH PLUS (+)
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'STRING_CONCAT_PLUS',
      name: 'String Concatenation with + Operator',
      category: 'syntax_anatomy',
      detect: (ctx) => {
        if (/SELECT[\s\S]+?'\s*\+\s*'|SELECT[\s\S]+?[a-zA-Z0-9_]+\s*\+\s*'[\s\S]+?'/i.test(ctx.studentSql)) {
          return {
            matched: true,
            trapId: 'STRING_CONCAT_PLUS',
            badge: '🔗 String Concatenation Syntax',
            header: 'String Concatenation with +',
            category: 'syntax_anatomy',
            severity: 'MEDIUM',
            explanation: "In standard ANSI SQL and SQLite, strings are concatenated using the pipe operator <code>||</code> (e.g. <code>first_name || ' ' || last_name</code>). <code>+</code> is reserved for numeric addition.",
            actionableHint: "Change <code>+</code> to <code>||</code> for string concatenation.",
            remediation: {
              actionLabel: "Change '+' ➔ '||'",
              actionReplace: {
                from: '+',
                to: '||',
              },
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 14. ASSIGNMENT OPERATOR (:=)
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'ASSIGNMENT_OPERATOR',
      name: 'Invalid Assignment Operator (:=)',
      category: 'syntax_anatomy',
      detect: (ctx) => {
        if (/:=/i.test(ctx.studentSql)) {
          return {
            matched: true,
            trapId: 'ASSIGNMENT_OPERATOR',
            badge: '⚡ Syntax Error: Assignment Operator',
            header: 'Invalid Assignment Operator :=',
            category: 'syntax_anatomy',
            severity: 'LOW',
            explanation: 'SQL equality comparisons and filter conditions use single equals <code>=</code>, not <code>:=</code>.',
            actionableHint: "Change <code>:=</code> to <code>=</code>.",
            remediation: {
              actionLabel: "Change ':=' ➔ '='",
              actionReplace: {
                from: ':=',
                to: '=',
              },
            },
          };
        }
        return null;
      },
    });

    // ═══════════════════════════════════════════════════════════════
    // 15. ORDER OF EXECUTION (ORDER BY before WHERE / LIMIT before ORDER BY)
    // ═══════════════════════════════════════════════════════════════
    this.register({
      id: 'ORDER_OF_EXECUTION_MISMATCH',
      name: 'Clause Execution Order Inversion',
      category: 'order_of_execution',
      detect: (ctx) => {
        if (/ORDER\s+BY[\s\S]+?WHERE/i.test(ctx.studentSql)) {
          return {
            matched: true,
            trapId: 'ORDER_OF_EXECUTION_MISMATCH',
            badge: '🚦 Order of Execution Error',
            header: 'ORDER BY Before WHERE',
            category: 'order_of_execution',
            severity: 'HIGH',
            explanation: 'In SQL clause structure, filtering with <code>WHERE</code> must always be declared <strong>before</strong> sorting with <code>ORDER BY</code>.',
            actionableHint: 'Move your <code>WHERE</code> clause before <code>ORDER BY</code>.',
            remediation: {
              actionLabel: 'Reorder: WHERE before ORDER BY',
            },
          };
        }
        if (/LIMIT[\s\S]+?ORDER\s+BY/i.test(ctx.studentSql)) {
          return {
            matched: true,
            trapId: 'ORDER_OF_EXECUTION_MISMATCH',
            badge: '🚦 Order of Execution Error',
            header: 'LIMIT Before ORDER BY',
            category: 'order_of_execution',
            severity: 'HIGH',
            explanation: 'Sorting (<code>ORDER BY</code>) must precede row slicing (<code>LIMIT</code>) so the database knows which top ordered records to return.',
            actionableHint: 'Move <code>ORDER BY</code> before <code>LIMIT</code>.',
            remediation: {
              actionLabel: 'Reorder: ORDER BY before LIMIT',
            },
          };
        }
        return null;
      },
    });
  }
}

// Export singleton instance
export const globalDiagnosticRegistry = new DiagnosticRegistry();
