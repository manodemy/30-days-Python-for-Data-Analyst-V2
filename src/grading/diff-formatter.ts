/**
 * MANODEMY VISUAL RESULT-SET & INVARIANT DIFF FORMATTER
 * Layer 4 Component of the v4.0 Intelligent SQL Validation Engine
 */

import { NormalizedResultSet, DiffReport } from './types';

export class DiffFormatter {
  /**
   * Generate a Markdown-formatted visual table diff
   */
  public static toMarkdown(
    expected: NormalizedResultSet,
    actual: NormalizedResultSet,
    diff?: DiffReport | null
  ): string {
    const maxRows = 10;
    const lines: string[] = [];

    lines.push('### 📊 Visual Result Set Comparison');
    lines.push('');

    // Column Header Diff
    if (diff?.type === 'COLUMN_COUNT_MISMATCH' || diff?.type === 'COLUMN_NAME_MISMATCH') {
      lines.push('| Source | Columns |');
      lines.push('| :--- | :--- |');
      lines.push(`| **Expected** | \`${expected.columns.join('` \\| `')}\` |`);
      lines.push(`| **Your Query** | \`${actual.columns.join('` \\| `')}\` |`);
      lines.push('');
    }

    // Row comparison table
    const headers = ['#', 'Status', ...expected.columns];
    lines.push(`| ${headers.join(' | ')} |`);
    lines.push(`| ${headers.map(() => ':---').join(' | ')} |`);

    const limit = Math.min(Math.max(expected.rowCount, actual.rowCount), maxRows);

    for (let r = 0; r < limit; r++) {
      const expRow = expected.rows[r];
      const actRow = actual.rows[r];

      if (expRow && actRow) {
        // Compare values in this row
        const isMatch = expRow.every((v, idx) => String(v).trim() === String(actRow[idx]).trim());
        const statusIcon = isMatch ? '✅' : '⚠️';
        const formattedCells = expRow.map((v, idx) => {
          const actV = actRow[idx];
          if (String(v).trim() === String(actV).trim()) {
            return formatCell(actV);
          }
          return `~~${formatCell(actV)}~~ **${formatCell(v)}**`;
        });
        lines.push(`| ${r + 1} | ${statusIcon} | ${formattedCells.join(' | ')} |`);
      } else if (expRow && !actRow) {
        // Missing row in student result
        lines.push(`| ${r + 1} | ❌ *(Missing)* | ${expRow.map(v => `**+ ${formatCell(v)}**`).join(' | ')} |`);
      } else if (!expRow && actRow) {
        // Extra row in student result
        lines.push(`| ${r + 1} | ❌ *(Extra)* | ${actRow.map(v => `* - ${formatCell(v)}*`).join(' | ')} |`);
      }
    }

    if (Math.max(expected.rowCount, actual.rowCount) > maxRows) {
      lines.push(`| ... | ... | *(Showing first ${maxRows} of ${Math.max(expected.rowCount, actual.rowCount)} rows)* |`);
    }

    return lines.join('\n');
  }

  /**
   * Generate high-contrast, responsive HTML visual diff for browser sandbox
   */
  public static toHtml(
    expected: NormalizedResultSet,
    actual: NormalizedResultSet,
    diff?: DiffReport | null
  ): string {
    const maxRows = 10;
    let html = '<div class="sql-visual-diff-wrap" style="font-family:Inter,monospace;font-size:12px;margin-top:12px;overflow-x:auto;">';

    html += '<div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:8px;">';
    html += '<strong style="color:#38bdf8;font-size:13px;">📊 Result Set Comparison (Expected vs Your Output)</strong>';
    html += `<span style="font-size:11px;color:#94a3b8;">Expected: ${expected.rowCount} rows | Actual: ${actual.rowCount} rows</span>`;
    html += '</div>';

    html += '<table style="width:100%;border-collapse:collapse;text-align:left;background:#0d1117;border:1px solid #30363d;border-radius:8px;overflow:hidden;">';
    html += '<thead><tr style="background:#161b22;border-bottom:1px solid #30363d;color:#8b949e;">';
    html += '<th style="padding:6px 10px;width:40px;">#</th>';
    html += '<th style="padding:6px 10px;width:50px;">Status</th>';

    const columnsToRender = expected.columns.length > 0 ? expected.columns : actual.columns;
    columnsToRender.forEach(c => {
      html += `<th style="padding:6px 10px;color:#c9d1d9;">${escapeHtml(c)}</th>`;
    });
    html += '</tr></thead><tbody>';

    const limit = Math.min(Math.max(expected.rowCount, actual.rowCount), maxRows);

    for (let r = 0; r < limit; r++) {
      const expRow = expected.rows[r];
      const actRow = actual.rows[r];

      if (expRow && actRow) {
        const isMatch = expRow.every((v, idx) => String(v).trim() === String(actRow[idx]).trim());
        const rowBg = isMatch ? 'transparent' : 'rgba(239, 68, 68, 0.08)';
        html += `<tr style="border-bottom:1px solid #21262d;background:${rowBg};">`;
        html += `<td style="padding:6px 10px;color:#6e7681;">${r + 1}</td>`;
        html += `<td style="padding:6px 10px;">${isMatch ? '✅' : '⚠️'}</td>`;

        for (let c = 0; c < columnsToRender.length; c++) {
          const ev = expRow[c];
          const av = actRow[c];
          if (String(ev).trim() === String(av).trim()) {
            html += `<td style="padding:6px 10px;color:#e6edf3;">${escapeHtml(formatCell(av))}</td>`;
          } else {
            html += `<td style="padding:6px 10px;color:#f87171;background:rgba(239, 68, 68, 0.15);border-radius:4px;">
              <div style="font-size:10px;color:#94a3b8;text-decoration:line-through;">${escapeHtml(formatCell(av))}</div>
              <div style="font-weight:700;color:#34d399;">${escapeHtml(formatCell(ev))}</div>
            </td>`;
          }
        }
        html += '</tr>';
      } else if (expRow && !actRow) {
        html += '<tr style="border-bottom:1px solid #21262d;background:rgba(16, 185, 129, 0.08);">';
        html += `<td style="padding:6px 10px;color:#6e7681;">${r + 1}</td>`;
        html += '<td style="padding:6px 10px;color:#34d399;">+ Missing</td>';
        expRow.forEach(v => {
          html += `<td style="padding:6px 10px;color:#34d399;font-weight:600;">+ ${escapeHtml(formatCell(v))}</td>`;
        });
        html += '</tr>';
      } else if (!expRow && actRow) {
        html += '<tr style="border-bottom:1px solid #21262d;background:rgba(239, 68, 68, 0.08);">';
        html += `<td style="padding:6px 10px;color:#6e7681;">${r + 1}</td>`;
        html += '<td style="padding:6px 10px;color:#f87171;">- Extra</td>';
        actRow.forEach(v => {
          html += `<td style="padding:6px 10px;color:#f87171;text-decoration:line-through;">- ${escapeHtml(formatCell(v))}</td>`;
        });
        html += '</tr>';
      }
    }

    if (Math.max(expected.rowCount, actual.rowCount) > maxRows) {
      html += `<tr><td colspan="${columnsToRender.length + 2}" style="padding:8px 10px;text-align:center;color:#6e7681;font-style:italic;">Showing first ${maxRows} rows...</td></tr>`;
    }

    html += '</tbody></table></div>';
    return html;
  }

  /**
   * Generate color-coded ANSI terminal diff for Node.js / CLI
   */
  public static toAnsi(
    expected: NormalizedResultSet,
    actual: NormalizedResultSet,
    diff?: DiffReport | null
  ): string {
    const green = '\x1b[32m';
    const red = '\x1b[31m';
    const yellow = '\x1b[33m';
    const cyan = '\x1b[36m';
    const gray = '\x1b[90m';
    const bold = '\x1b[1m';
    const reset = '\x1b[0m';

    const lines: string[] = [];
    lines.push(`${cyan}${bold}=== RESULT SET DIFF ===${reset}`);

    if (diff?.type === 'COLUMN_COUNT_MISMATCH' || diff?.type === 'COLUMN_NAME_MISMATCH') {
      lines.push(`${yellow}Expected Columns: [${expected.columns.join(', ')}]${reset}`);
      lines.push(`${red}Actual Columns:   [${actual.columns.join(', ')}]${reset}`);
    }

    const limit = Math.min(Math.max(expected.rowCount, actual.rowCount), 8);
    for (let r = 0; r < limit; r++) {
      const expRow = expected.rows[r];
      const actRow = actual.rows[r];

      if (expRow && actRow) {
        const isMatch = expRow.every((v, idx) => String(v).trim() === String(actRow[idx]).trim());
        if (isMatch) {
          lines.push(`${gray}[${r + 1}] OK: ${expRow.map(formatCell).join(' | ')}${reset}`);
        } else {
          lines.push(`${yellow}[${r + 1}] Mismatch:${reset}`);
          lines.push(`  ${green}+ Expected: ${expRow.map(formatCell).join(' | ')}${reset}`);
          lines.push(`  ${red}- Actual:   ${actRow.map(formatCell).join(' | ')}${reset}`);
        }
      } else if (expRow && !actRow) {
        lines.push(`${green}[${r + 1}] + Expected: ${expRow.map(formatCell).join(' | ')}${reset}`);
      } else if (!expRow && actRow) {
        lines.push(`${red}[${r + 1}] - Unexpected: ${actRow.map(formatCell).join(' | ')}${reset}`);
      }
    }

    return lines.join('\n');
  }
}

function formatCell(val: any): string {
  if (val === null || val === undefined) return 'NULL';
  if (typeof val === 'number') return Number.isInteger(val) ? String(val) : val.toFixed(2);
  return String(val);
}

function escapeHtml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}
