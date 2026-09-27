/**
 * MANODEMY ZERO-DEPENDENCY SQL TOKENIZER, AST PARSER & STATIC SEMANTIC ANALYZER
 * Layer 1 of the v4.0 Intelligent SQL Validation Engine
 */

import {
  SqlToken,
  SqlColumnRef,
  SqlJoinClause,
  SqlWindowDef,
  SqlAst,
  AstAnalysisResult,
  QuestionGradingRules,
} from './types';

const SQL_KEYWORDS = new Set([
  'SELECT',
  'FROM',
  'WHERE',
  'GROUP',
  'BY',
  'HAVING',
  'ORDER',
  'LIMIT',
  'OFFSET',
  'JOIN',
  'INNER',
  'LEFT',
  'RIGHT',
  'FULL',
  'CROSS',
  'NATURAL',
  'OUTER',
  'ON',
  'AS',
  'DISTINCT',
  'WITH',
  'RECURSIVE',
  'UNION',
  'ALL',
  'INTERSECT',
  'EXCEPT',
  'AND',
  'OR',
  'NOT',
  'IN',
  'IS',
  'NULL',
  'BETWEEN',
  'LIKE',
  'EXISTS',
  'CASE',
  'WHEN',
  'THEN',
  'ELSE',
  'END',
  'OVER',
  'PARTITION',
  'ROWS',
  'RANGE',
  'PRECEDING',
  'FOLLOWING',
  'UNBOUNDED',
  'CURRENT',
  'ROW',
  'ASC',
  'DESC',
  'CAST',
  'COALESCE',
  'NULLIF',
  'ROUND',
  'COUNT',
  'SUM',
  'AVG',
  'MIN',
  'MAX',
  'RANK',
  'DENSE_RANK',
  'ROW_NUMBER',
  'NTILE',
  'LAG',
  'LEAD',
  'FIRST_VALUE',
  'LAST_VALUE',
  'TOP',
]);

/**
 * Tokenize an incoming SQL string with exact line and column tracking
 */
export function tokenizeSql(sql: string): SqlToken[] {
  const tokens: SqlToken[] = [];
  let index = 0;
  let line = 1;
  let column = 1;
  const len = sql.length;

  function advance(count: number = 1) {
    for (let i = 0; i < count; i++) {
      if (sql[index + i] === '\n') {
        line++;
        column = 1;
      } else {
        column++;
      }
    }
    index += count;
  }

  while (index < len) {
    const start = index;
    const startLine = line;
    const startCol = column;
    const char = sql[index];

    // Whitespace
    if (/\s/.test(char)) {
      let val = '';
      while (index < len && /\s/.test(sql[index])) {
        val += sql[index];
        advance(1);
      }
      tokens.push({
        type: 'WHITESPACE',
        value: val,
        line: startLine,
        column: startCol,
        start,
        end: index,
      });
      continue;
    }

    // Line comment -- ...
    if (char === '-' && index + 1 < len && sql[index + 1] === '-') {
      let val = '';
      while (index < len && sql[index] !== '\n') {
        val += sql[index];
        advance(1);
      }
      tokens.push({
        type: 'COMMENT',
        value: val,
        line: startLine,
        column: startCol,
        start,
        end: index,
      });
      continue;
    }

    // Block comment /* ... */
    if (char === '/' && index + 1 < len && sql[index + 1] === '*') {
      let val = '/*';
      advance(2);
      while (index < len && !(sql[index] === '*' && index + 1 < len && sql[index + 1] === '/')) {
        val += sql[index];
        advance(1);
      }
      if (index < len) {
        val += '*/';
        advance(2);
      }
      tokens.push({
        type: 'COMMENT',
        value: val,
        line: startLine,
        column: startCol,
        start,
        end: index,
      });
      continue;
    }

    // String literal '...'
    if (char === "'") {
      let val = "'";
      advance(1);
      while (index < len) {
        if (sql[index] === "'") {
          if (index + 1 < len && sql[index + 1] === "'") {
            val += "''";
            advance(2);
          } else {
            val += "'";
            advance(1);
            break;
          }
        } else {
          val += sql[index];
          advance(1);
        }
      }
      tokens.push({
        type: 'STRING',
        value: val,
        line: startLine,
        column: startCol,
        start,
        end: index,
      });
      continue;
    }

    // Quoted identifier `...` or "..." or [...]
    if (char === '`' || char === '"' || char === '[') {
      const closeChar = char === '[' ? ']' : char;
      let val = char;
      advance(1);
      while (index < len && sql[index] !== closeChar) {
        val += sql[index];
        advance(1);
      }
      if (index < len) {
        val += closeChar;
        advance(1);
      }
      tokens.push({
        type: 'IDENTIFIER',
        value: val,
        line: startLine,
        column: startCol,
        start,
        end: index,
      });
      continue;
    }

    // Numbers
    if (/[0-9]/.test(char) || (char === '.' && index + 1 < len && /[0-9]/.test(sql[index + 1]))) {
      let val = '';
      let hasDot = false;
      while (index < len && (/[0-9]/.test(sql[index]) || (sql[index] === '.' && !hasDot))) {
        if (sql[index] === '.') hasDot = true;
        val += sql[index];
        advance(1);
      }
      tokens.push({
        type: 'NUMBER',
        value: val,
        line: startLine,
        column: startCol,
        start,
        end: index,
      });
      continue;
    }

    // Multi-char operators
    const twoChar = sql.substring(index, index + 2);
    if (
      twoChar === '!=' ||
      twoChar === '<>' ||
      twoChar === '<=' ||
      twoChar === '>=' ||
      twoChar === ':=' ||
      twoChar === '||'
    ) {
      advance(2);
      tokens.push({
        type: 'OPERATOR',
        value: twoChar,
        line: startLine,
        column: startCol,
        start,
        end: index,
      });
      continue;
    }

    // Single-char operators & punctuation
    if (['=', '<', '>', '+', '-', '*', '/', '%'].includes(char)) {
      advance(1);
      tokens.push({
        type: 'OPERATOR',
        value: char,
        line: startLine,
        column: startCol,
        start,
        end: index,
      });
      continue;
    }

    if ([',', ';', '(', ')', '.'].includes(char)) {
      advance(1);
      tokens.push({
        type: 'PUNCTUATION',
        value: char,
        line: startLine,
        column: startCol,
        start,
        end: index,
      });
      continue;
    }

    // Identifiers and keywords
    if (/[a-zA-Z_]/.test(char)) {
      let val = '';
      while (index < len && /[a-zA-Z0-9_]/.test(sql[index])) {
        val += sql[index];
        advance(1);
      }
      const upper = val.toUpperCase();
      const isKw = SQL_KEYWORDS.has(upper);
      tokens.push({
        type: isKw ? 'KEYWORD' : 'IDENTIFIER',
        value: val,
        line: startLine,
        column: startCol,
        start,
        end: index,
      });
      continue;
    }

    // Unknown character fallback
    advance(1);
    tokens.push({
      type: 'PUNCTUATION',
      value: char,
      line: startLine,
      column: startCol,
      start,
      end: index,
    });
  }

  return tokens;
}

/**
 * Generate a beautiful visual error pointer
 * e.g.
 * Line 2, Column 8:
 *   SELECT id, name FORM employees;
 *                   ^
 *   Syntax Error: Unexpected keyword 'FORM'. Did you mean 'FROM'?
 */
export function formatVisualErrorPointer(
  sql: string,
  line: number,
  column: number,
  message: string
): string {
  const lines = sql.split('\n');
  const targetLineIdx = Math.max(0, Math.min(lines.length - 1, line - 1));
  const targetLineStr = lines[targetLineIdx] || '';
  const caretCol = Math.max(1, column);
  const padding = ' '.repeat(Math.max(0, caretCol - 1));

  return `Line ${line}, Column ${column}:\n  ${targetLineStr}\n  ${padding}^\n  ${message}`;
}

/**
 * Filter out comments and whitespace to produce a stream of meaningful syntactic tokens
 */
function getMeaningfulTokens(tokens: SqlToken[]): SqlToken[] {
  return tokens.filter(t => t.type !== 'WHITESPACE' && t.type !== 'COMMENT');
}

/**
 * Parse an SQL string into a structured AST representation with static checks
 */
export function parseSqlAst(sql: string): AstAnalysisResult {
  if (!sql || sql.trim().length === 0) {
    return {
      valid: false,
      syntaxError: {
        message: 'Submission query is empty.',
        line: 1,
        column: 1,
        visualPointer: 'Line 1, Column 1:\n  (empty)\n  ^\n  Query is empty.',
      },
      structuralViolations: [],
    };
  }

  const rawTokens = tokenizeSql(sql);
  const tokens = getMeaningfulTokens(rawTokens);

  if (tokens.length === 0) {
    return {
      valid: false,
      syntaxError: {
        message: 'Submission query contains only comments or whitespace.',
        line: 1,
        column: 1,
        visualPointer: 'Line 1, Column 1:\n  -- only comments\n  ^\n  Query contains no executable statements.',
      },
      structuralViolations: [],
    };
  }

  // Common Syntax Anomaly Detectors before full AST walk
  // 1. Keyword typos like "FORM" instead of "FROM"
  for (let i = 0; i < tokens.length; i++) {
    const t = tokens[i];
    const upper = t.value.toUpperCase();
    if (upper === 'FORM' && i > 0 && tokens[i - 1].value.toUpperCase() !== 'SELECT') {
      const pointer = formatVisualErrorPointer(
        sql,
        t.line,
        t.column,
        "Unexpected token 'FORM'. Did you mean 'FROM'?"
      );
      return {
        valid: false,
        syntaxError: {
          message: "Keyword Typo: Found 'FORM', did you mean 'FROM'?",
          line: t.line,
          column: t.column,
          visualPointer: pointer,
          token: t.value,
        },
        structuralViolations: [],
      };
    }
    if (upper === 'SELEC' || upper === 'SELEST' || upper === 'SELCT') {
      const pointer = formatVisualErrorPointer(
        sql,
        t.line,
        t.column,
        `Unexpected token '${t.value}'. Did you mean 'SELECT'?`
      );
      return {
        valid: false,
        syntaxError: {
          message: `Keyword Typo: Found '${t.value}', did you mean 'SELECT'?`,
          line: t.line,
          column: t.column,
          visualPointer: pointer,
          token: t.value,
        },
        structuralViolations: [],
      };
    }
  }

  // Check unclosed quotes or parentheses
  let parenBalance = 0;
  let lastOpenParen: SqlToken | null = null;
  for (const t of tokens) {
    if (t.value === '(') {
      parenBalance++;
      lastOpenParen = t;
    } else if (t.value === ')') {
      parenBalance--;
      if (parenBalance < 0) {
        const pointer = formatVisualErrorPointer(
          sql,
          t.line,
          t.column,
          "Unexpected closing parenthesis ')' with no matching opening '('."
        );
        return {
          valid: false,
          syntaxError: {
            message: "Unmatched closing parenthesis ')'",
            line: t.line,
            column: t.column,
            visualPointer: pointer,
            token: t.value,
          },
          structuralViolations: [],
        };
      }
    }
  }

  if (parenBalance > 0 && lastOpenParen) {
    const pointer = formatVisualErrorPointer(
      sql,
      lastOpenParen.line,
      lastOpenParen.column,
      "Unclosed opening parenthesis '('."
    );
    return {
      valid: false,
      syntaxError: {
        message: "Unclosed opening parenthesis '('",
        line: lastOpenParen.line,
        column: lastOpenParen.column,
        visualPointer: pointer,
        token: '(',
      },
      structuralViolations: [],
    };
  }

  // Build the AST model
  const ast: SqlAst = {
    rawSql: sql,
    statementType: 'UNKNOWN',
    hasWithCte: false,
    cteNames: [],
    isDistinct: false,
    projections: [],
    joins: [],
    groupByColumns: [],
    windowFunctions: [],
    orderByColumns: [],
    subqueriesCount: 0,
    containsNotIn: false,
    containsNullComparison: false,
    rawTokens,
  };

  let tokenIdx = 0;

  // 1. WITH CTE Parsing
  if (tokens[tokenIdx]?.value.toUpperCase() === 'WITH') {
    ast.hasWithCte = true;
    tokenIdx++;
    if (tokens[tokenIdx]?.value.toUpperCase() === 'RECURSIVE') {
      tokenIdx++;
    }
    while (tokenIdx < tokens.length) {
      const cteNameToken = tokens[tokenIdx];
      if (cteNameToken && cteNameToken.type === 'IDENTIFIER') {
        ast.cteNames.push(cteNameToken.value);
        tokenIdx++;
        if (tokens[tokenIdx]?.value.toUpperCase() === 'AS') {
          tokenIdx++;
        }
        if (tokens[tokenIdx]?.value === '(') {
          let depth = 1;
          tokenIdx++;
          while (tokenIdx < tokens.length && depth > 0) {
            if (tokens[tokenIdx].value === '(') depth++;
            else if (tokens[tokenIdx].value === ')') depth--;
            tokenIdx++;
          }
        }
      }
      if (tokens[tokenIdx]?.value === ',') {
        tokenIdx++;
        continue;
      }
      break;
    }
  }

  // 2. Main Statement Type
  if (tokens[tokenIdx]?.value.toUpperCase() === 'SELECT') {
    ast.statementType = ast.hasWithCte ? 'WITH_SELECT' : 'SELECT';
    tokenIdx++;
  }

  // 3. DISTINCT check
  if (tokens[tokenIdx]?.value.toUpperCase() === 'DISTINCT') {
    ast.isDistinct = true;
    tokenIdx++;
  }

  // 4. Projections parsing up to FROM or EOF
  const projectionTokens: SqlToken[] = [];
  while (tokenIdx < tokens.length) {
    const t = tokens[tokenIdx];
    const upper = t.value.toUpperCase();
    if (upper === 'FROM') {
      break;
    }
    // Handle subqueries in projection list
    if (t.value === '(') {
      let depth = 1;
      projectionTokens.push(t);
      tokenIdx++;
      while (tokenIdx < tokens.length && depth > 0) {
        if (tokens[tokenIdx].value === '(') depth++;
        else if (tokens[tokenIdx].value === ')') depth--;
        projectionTokens.push(tokens[tokenIdx]);
        tokenIdx++;
      }
      continue;
    }
    projectionTokens.push(t);
    tokenIdx++;
  }

  ast.projections = parseProjections(projectionTokens);

  // Extract Window Functions from projections
  ast.windowFunctions = extractWindowFunctions(projectionTokens);

  // 5. FROM table parsing
  if (tokens[tokenIdx]?.value.toUpperCase() === 'FROM') {
    tokenIdx++;
    if (tokenIdx < tokens.length) {
      const fromTok = tokens[tokenIdx];
      if (fromTok.value === '(') {
        ast.fromTable = '(subquery)';
        ast.subqueriesCount++;
        let depth = 1;
        tokenIdx++;
        while (tokenIdx < tokens.length && depth > 0) {
          if (tokens[tokenIdx].value === '(') depth++;
          else if (tokens[tokenIdx].value === ')') depth--;
          tokenIdx++;
        }
      } else {
        ast.fromTable = fromTok.value;
        tokenIdx++;
      }

      // Check for AS or implicit table alias
      if (tokenIdx < tokens.length) {
        const nextTok = tokens[tokenIdx];
        const nextUpper = nextTok.value.toUpperCase();
        if (nextUpper === 'AS' && tokenIdx + 1 < tokens.length) {
          tokenIdx++;
          ast.fromTableAlias = tokens[tokenIdx].value;
          tokenIdx++;
        } else if (
          nextTok.type === 'IDENTIFIER' &&
          !SQL_KEYWORDS.has(nextUpper)
        ) {
          ast.fromTableAlias = nextTok.value;
          tokenIdx++;
        }
      }
    }
  }

  // 6. JOINs, WHERE, GROUP BY, HAVING, ORDER BY, LIMIT loop
  while (tokenIdx < tokens.length) {
    const t = tokens[tokenIdx];
    const upper = t.value.toUpperCase();

    // JOINs
    if (
      upper === 'JOIN' ||
      upper === 'INNER' ||
      upper === 'LEFT' ||
      upper === 'RIGHT' ||
      upper === 'FULL' ||
      upper === 'CROSS' ||
      upper === 'NATURAL'
    ) {
      let joinType: SqlJoinClause['type'] = 'INNER';
      if (upper === 'LEFT') {
        joinType = 'LEFT';
        tokenIdx++;
        if (tokens[tokenIdx]?.value.toUpperCase() === 'OUTER') tokenIdx++;
      } else if (upper === 'RIGHT') {
        joinType = 'RIGHT';
        tokenIdx++;
        if (tokens[tokenIdx]?.value.toUpperCase() === 'OUTER') tokenIdx++;
      } else if (upper === 'FULL') {
        joinType = 'FULL';
        tokenIdx++;
        if (tokens[tokenIdx]?.value.toUpperCase() === 'OUTER') tokenIdx++;
      } else if (upper === 'CROSS') {
        joinType = 'CROSS';
      } else if (upper === 'NATURAL') {
        joinType = 'NATURAL';
      }

      if (tokens[tokenIdx]?.value.toUpperCase() === 'JOIN') {
        tokenIdx++;
      }

      const joinTableTok = tokens[tokenIdx];
      let joinTableName = joinTableTok ? joinTableTok.value : '';
      tokenIdx++;

      let joinAlias: string | undefined;
      if (tokenIdx < tokens.length) {
        if (tokens[tokenIdx]?.value.toUpperCase() === 'AS') {
          tokenIdx++;
          joinAlias = tokens[tokenIdx]?.value;
          tokenIdx++;
        } else if (
          tokens[tokenIdx]?.type === 'IDENTIFIER' &&
          !SQL_KEYWORDS.has(tokens[tokenIdx]?.value.toUpperCase())
        ) {
          joinAlias = tokens[tokenIdx]?.value;
          tokenIdx++;
        }
      }

      let onCond = '';
      if (tokens[tokenIdx]?.value.toUpperCase() === 'ON') {
        tokenIdx++;
        while (
          tokenIdx < tokens.length &&
          !['WHERE', 'GROUP', 'HAVING', 'ORDER', 'LIMIT', 'JOIN', 'LEFT', 'RIGHT', 'INNER', 'CROSS'].includes(
            tokens[tokenIdx].value.toUpperCase()
          )
        ) {
          onCond += (onCond ? ' ' : '') + tokens[tokenIdx].value;
          tokenIdx++;
        }
      }

      ast.joins.push({
        type: joinType,
        table: joinTableName,
        alias: joinAlias,
        onCondition: onCond,
      });
      continue;
    }

    // WHERE Clause
    if (upper === 'WHERE') {
      tokenIdx++;
      let whereStr = '';
      while (
        tokenIdx < tokens.length &&
        !['GROUP', 'HAVING', 'ORDER', 'LIMIT', 'UNION', 'INTERSECT', 'EXCEPT'].includes(
          tokens[tokenIdx].value.toUpperCase()
        )
      ) {
        whereStr += (whereStr ? ' ' : '') + tokens[tokenIdx].value;
        tokenIdx++;
      }
      ast.whereClause = whereStr;
      continue;
    }

    // GROUP BY Clause
    if (upper === 'GROUP' && tokens[tokenIdx + 1]?.value.toUpperCase() === 'BY') {
      tokenIdx += 2;
      while (
        tokenIdx < tokens.length &&
        !['HAVING', 'ORDER', 'LIMIT', 'UNION', 'INTERSECT', 'EXCEPT'].includes(
          tokens[tokenIdx].value.toUpperCase()
        )
      ) {
        const colTok = tokens[tokenIdx];
        if (colTok.value !== ',') {
          ast.groupByColumns.push(colTok.value);
        }
        tokenIdx++;
      }
      continue;
    }

    // HAVING Clause
    if (upper === 'HAVING') {
      tokenIdx++;
      let havingStr = '';
      while (
        tokenIdx < tokens.length &&
        !['ORDER', 'LIMIT', 'UNION', 'INTERSECT', 'EXCEPT'].includes(
          tokens[tokenIdx].value.toUpperCase()
        )
      ) {
        havingStr += (havingStr ? ' ' : '') + tokens[tokenIdx].value;
        tokenIdx++;
      }
      ast.havingClause = havingStr;
      continue;
    }

    // ORDER BY Clause
    if (upper === 'ORDER' && tokens[tokenIdx + 1]?.value.toUpperCase() === 'BY') {
      tokenIdx += 2;
      while (
        tokenIdx < tokens.length &&
        !['LIMIT', 'OFFSET', 'UNION', 'INTERSECT', 'EXCEPT'].includes(
          tokens[tokenIdx].value.toUpperCase()
        )
      ) {
        const colTok = tokens[tokenIdx];
        if (colTok.value !== ',') {
          let dir: 'ASC' | 'DESC' = 'ASC';
          if (tokens[tokenIdx + 1]?.value.toUpperCase() === 'DESC') {
            dir = 'DESC';
            tokenIdx++;
          } else if (tokens[tokenIdx + 1]?.value.toUpperCase() === 'ASC') {
            dir = 'ASC';
            tokenIdx++;
          }
          ast.orderByColumns.push({ column: colTok.value, direction: dir });
        }
        tokenIdx++;
      }
      continue;
    }

    // LIMIT
    if (upper === 'LIMIT') {
      tokenIdx++;
      if (tokens[tokenIdx]?.type === 'NUMBER') {
        ast.limit = parseInt(tokens[tokenIdx].value, 10);
        tokenIdx++;
      }
      continue;
    }

    // OFFSET
    if (upper === 'OFFSET') {
      tokenIdx++;
      if (tokens[tokenIdx]?.type === 'NUMBER') {
        ast.offset = parseInt(tokens[tokenIdx].value, 10);
        tokenIdx++;
      }
      continue;
    }

    tokenIdx++;
  }

  // Anti-pattern and Trap static scans
  const upperSql = sql.toUpperCase();
  ast.containsNotIn = /\bNOT\s+IN\s*\(/i.test(sql);
  ast.containsNullComparison = /(=|!=|<>)\s*NULL\b/i.test(sql);

  return {
    valid: true,
    ast,
    structuralViolations: [],
  };
}

/**
 * Parse projection columns and aliases
 */
function parseProjections(tokens: SqlToken[]): SqlColumnRef[] {
  const projections: SqlColumnRef[] = [];
  let currentTokens: SqlToken[] = [];

  for (let i = 0; i < tokens.length; i++) {
    const t = tokens[i];
    if (t.value === ',') {
      if (currentTokens.length > 0) {
        projections.push(resolveSingleProjection(currentTokens));
        currentTokens = [];
      }
    } else {
      currentTokens.push(t);
    }
  }

  if (currentTokens.length > 0) {
    projections.push(resolveSingleProjection(currentTokens));
  }

  return projections;
}

function resolveSingleProjection(tokens: SqlToken[]): SqlColumnRef {
  const raw = tokens.map(t => t.value).join(' ');
  const rawUpper = raw.toUpperCase();

  let alias: string | undefined;
  let exprTokens = [...tokens];

  // Check for AS alias or trailing identifier
  const asIdx = exprTokens.findIndex(t => t.value.toUpperCase() === 'AS');
  if (asIdx !== -1 && asIdx < exprTokens.length - 1) {
    alias = exprTokens[exprTokens.length - 1].value;
    exprTokens = exprTokens.slice(0, asIdx);
  } else if (
    exprTokens.length >= 2 &&
    exprTokens[exprTokens.length - 1].type === 'IDENTIFIER' &&
    !SQL_KEYWORDS.has(exprTokens[exprTokens.length - 1].value.toUpperCase())
  ) {
    // Check if previous token is a closing paren or expression
    const prev = exprTokens[exprTokens.length - 2];
    if (prev.value === ')' || prev.type === 'IDENTIFIER') {
      alias = exprTokens[exprTokens.length - 1].value;
      exprTokens = exprTokens.slice(0, exprTokens.length - 1);
    }
  }

  const exprStr = exprTokens.map(t => t.value).join('');

  // Check aggregate
  const aggMatch = rawUpper.match(/\b(COUNT|SUM|AVG|MIN|MAX|GROUP_CONCAT)\s*\(/);
  const isAggregate = Boolean(aggMatch);
  const aggregateFunc = aggMatch ? aggMatch[1] : undefined;

  // Check window function
  const isWindow = /\bOVER\s*\(/i.test(raw);
  let windowFunc: string | undefined;
  if (isWindow) {
    const winMatch = rawUpper.match(/\b(RANK|DENSE_RANK|ROW_NUMBER|NTILE|LAG|LEAD|SUM|AVG|COUNT|MIN|MAX)\s*\(/);
    windowFunc = winMatch ? winMatch[1] : undefined;
  }

  // Check table.column
  let table: string | undefined;
  let column = exprStr;
  if (exprStr.includes('.')) {
    const parts = exprStr.split('.');
    table = parts[0];
    column = parts.slice(1).join('.');
  }

  return {
    raw,
    table,
    column,
    alias,
    isAggregate,
    aggregateFunc,
    isWindow,
    windowFunc,
  };
}

/**
 * Extract Window Function definitions from SQL projection tokens
 */
function extractWindowFunctions(tokens: SqlToken[]): SqlWindowDef[] {
  const defs: SqlWindowDef[] = [];
  const raw = tokens.map(t => t.value).join(' ');
  const overRegex = /\b(RANK|DENSE_RANK|ROW_NUMBER|NTILE|LAG|LEAD|SUM|AVG|COUNT|MIN|MAX)\s*\([^)]*\)\s+OVER\s*\(([^)]*)\)/gi;

  let match;
  while ((match = overRegex.exec(raw)) !== null) {
    const funcName = match[1].toUpperCase();
    const insideOver = match[2].trim();

    let partitionBy: string[] | undefined;
    let orderBy: string[] | undefined;
    let frameClause: string | undefined;

    const partMatch = insideOver.match(/PARTITION\s+BY\s+([^ORDER|ROWS|RANGE]+)/i);
    if (partMatch) {
      partitionBy = partMatch[1]
        .split(',')
        .map(s => s.trim())
        .filter(Boolean);
    }

    const orderMatch = insideOver.match(/ORDER\s+BY\s+([^ROWS|RANGE]+)/i);
    if (orderMatch) {
      orderBy = orderMatch[1]
        .split(',')
        .map(s => s.trim())
        .filter(Boolean);
    }

    const frameMatch = insideOver.match(/(ROWS|RANGE)\s+BETWEEN\s+[\s\S]+/i);
    if (frameMatch) {
      frameClause = frameMatch[0].trim();
    }

    defs.push({
      funcName,
      partitionBy,
      orderBy,
      frameClause,
    });
  }

  return defs;
}

/**
 * Check structural constraints required by the specific question specification
 */
export function validateStructuralConstraints(
  ast: SqlAst,
  rules: QuestionGradingRules = {}
): { passed: boolean; violations: AstAnalysisResult['structuralViolations'] } {
  const violations: AstAnalysisResult['structuralViolations'] = [];

  // 1. Mandatory CTE Requirement
  if (rules.requiresCte && !ast.hasWithCte) {
    violations.push({
      rule: 'requiresCte',
      expected: 'Common Table Expression (WITH ... AS (...))',
      actual: 'Standard SELECT query',
      message: 'This question requires formulating your solution using a Common Table Expression (CTE / WITH clause).',
    });
  }

  // 2. Mandatory Window Function Requirement
  if (rules.requiresWindowFunction && rules.requiresWindowFunction.length > 0) {
    const presentFuncs = ast.windowFunctions.map(w => w.funcName);
    const hasRequired = rules.requiresWindowFunction.some(wf =>
      presentFuncs.includes(wf.toUpperCase())
    );
    if (!hasRequired) {
      violations.push({
        rule: 'requiresWindowFunction',
        expected: `Window function (${rules.requiresWindowFunction.join(' or ')})`,
        actual: presentFuncs.length > 0 ? presentFuncs.join(', ') : 'None',
        message: `This question requires using a window function (${rules.requiresWindowFunction.join(' or ')}) with an OVER (...) clause.`,
      });
    }
  }

  // 3. Mandatory JOIN Requirement
  if (rules.requiresJoin && rules.requiresJoin.length > 0) {
    const presentJoins = ast.joins.map(j => `${j.type} JOIN`);
    const hasRequiredJoin = rules.requiresJoin.some(req =>
      presentJoins.some(pj => pj.includes(req.toUpperCase()))
    );
    if (!hasRequiredJoin) {
      violations.push({
        rule: 'requiresJoin',
        expected: rules.requiresJoin.join(' or '),
        actual: presentJoins.length > 0 ? presentJoins.join(', ') : 'No JOIN used',
        message: `This challenge requires explicitly combining tables using a ${rules.requiresJoin.join(' or ')}.`,
      });
    }
  }

  // 4. Mandatory DISTINCT Requirement
  if (rules.requiresDistinct && !ast.isDistinct) {
    violations.push({
      rule: 'requiresDistinct',
      expected: 'DISTINCT',
      actual: 'Non-distinct query',
      message: 'This question requires de-duplicating results with SELECT DISTINCT.',
    });
  }

  // 5. Mandatory GROUP BY Requirement
  if (rules.requiresGroupBy && ast.groupByColumns.length === 0) {
    violations.push({
      rule: 'requiresGroupBy',
      expected: 'GROUP BY clause',
      actual: 'No GROUP BY clause',
      message: 'This question requires grouping rows with a GROUP BY clause.',
    });
  }

  // 6. Disallowed Keywords Check
  if (rules.disallowedKeywords && rules.disallowedKeywords.length > 0) {
    const rawUpper = ast.rawSql.toUpperCase();
    for (const disallowed of rules.disallowedKeywords) {
      const regex = new RegExp(`\\b${disallowed.toUpperCase()}\\b`, 'i');
      if (regex.test(rawUpper)) {
        violations.push({
          rule: 'disallowedKeywords',
          expected: `Avoid using '${disallowed}'`,
          actual: `Used '${disallowed}'`,
          message: `The keyword '${disallowed}' is disallowed for this specific problem (practice using alternative constructs!).`,
        });
      }
    }
  }

  return {
    passed: violations.length === 0,
    violations,
  };
}
