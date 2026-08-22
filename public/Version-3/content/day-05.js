// Day 05 — Aggregate Functions: Turning Rows into Insights
if (!window.COURSE_CONTENT) window.COURSE_CONTENT = {};
window.COURSE_CONTENT['day05'] = {
  "day": 5,
  "title": "Aggregate Functions",
  "db": "retail",
  "emoji": "📊",
  "slides": [
    {
      "title": "Aggregate Functions — Turning Rows into Insights",
      "duration": "7:30",
      "html": "<h2>📊 Aggregate Functions — Turning Rows into Insights</h2>\n\n        <div class=\"info-box\" id=\"day05LearningObj\">\n          <div style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;\">\n            <strong style=\"color: #0f766e;\">🎯 Learning Objective</strong>\n          </div>\n          <p style=\"margin: 0; font-size: 0.88rem; line-height: 1.4;\">\n            Summarize raw transactional rows into executive KPIs (Total Revenue, Active Headcount, Average Order Value) without silent calculation errors caused by <code>NULL</code> values.\n          </p>\n        </div>\n\n        <!-- ── SECTION 01 ── -->\n        <div class=\"slide-section\" id=\"day05Section01\">\n          <h3 class=\"heading-with-audio\" id=\"day05WhyAgg\">\n            01. Why Aggregation Matters — From Rows to KPIs\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio01.mp3', this)\" title=\"Play narration\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </h3>\n          <p>Database tables store individual transactions. Business stakeholders need <strong>summary metrics</strong>. Aggregate functions take <strong>N input rows</strong> and collapse them into <strong>1 output metric</strong>.</p>\n\n          <div class=\"heading-with-audio\" id=\"day05AggRefTable\" style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 14px;\">\n            <small style=\"flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;\">The Big 5 Aggregate Functions</small>\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio02.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </div>\n          <div class=\"db-mock-table-wrap\" id=\"day05AggTableWrap\">\n            <table class=\"db-table-mock db-table-mock--compact\">\n              <thead><tr><th>Function</th><th>Purpose</th><th>NULL Handling</th><th>Analyst Use Case</th></tr></thead>\n              <tbody>\n                <tr id=\"day05AggRow1\"><td><code>COUNT(*)</code></td><td>Total row count</td><td>Counts ALL rows (including NULLs)</td><td>Total orders / signups</td></tr>\n                <tr id=\"day05AggRow2\"><td><code>COUNT(col)</code></td><td>Count populated rows</td><td><strong>Ignores NULLs</strong></td><td>Verified emails / commissions</td></tr>\n                <tr id=\"day05AggRow3\"><td><code>SUM(col)</code></td><td>Total sum of column</td><td><strong>Ignores NULLs</strong></td><td>Gross revenue / total payroll</td></tr>\n                <tr id=\"day05AggRow4\"><td><code>AVG(col)</code></td><td>Arithmetic mean</td><td><strong>Ignores NULLs</strong> in divisor</td><td>Average Order Value (AOV)</td></tr>\n                <tr id=\"day05AggRow5\"><td><code>MIN(col)</code> / <code>MAX(col)</code></td><td>Smallest / Largest value</td><td><strong>Ignores NULLs</strong></td><td>Earliest order / Top salary</td></tr>\n              </tbody>\n            </table>\n          </div>\n\n          <div class=\"info-box\" id=\"day05FiveAggs\">\n            <div style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;\">\n              <strong style=\"color: #0f766e;\">💡 Core Rule of Thumb</strong>\n              <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio03.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n                <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n              </button>\n            </div>\n            <p style=\"margin: 0;\"><strong>Every aggregate function ignores NULL values</strong> — except <code>COUNT(*)</code>, which always counts the physical rows.</p>\n          </div>\n        </div>\n\n        <!-- ── SECTION 02 ── -->\n        <div class=\"slide-section\" id=\"day05Section02\">\n          <h3 class=\"heading-with-audio\" id=\"day05Count\">\n            02. COUNT — Counting Rows vs Counting Values\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio04.mp3', this)\" title=\"Play narration\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </h3>\n          <p>Always choose your <code>COUNT</code> variant based on what you are measuring:</p>\n          <ul style=\"margin: 6px 0 10px 18px; padding: 0; font-size: 0.85rem; color: #cbd5e1; line-height: 1.5;\">\n            <li id=\"day05CountLi1\"><code>COUNT(*)</code> $\\rightarrow$ <strong>Volume:</strong> \"How many total records exist?\"</li>\n            <li id=\"day05CountLi2\"><code>COUNT(col)</code> $\\rightarrow$ <strong>Completeness:</strong> \"How many rows have a value in this column?\"</li>\n            <li id=\"day05CountLi3\"><code>COUNT(DISTINCT col)</code> $\\rightarrow$ <strong>Unique Entities:</strong> \"How many unique customers/departments?\"</li>\n          </ul>\n\n          <div class=\"heading-with-audio\" id=\"day05CountExamples\" style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;\">\n            <small style=\"flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;\">COUNT Variations in Practice</small>\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio05.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </div>\n          <div class=\"code-block-container\" id=\"day05CountCode\">\n            <div class=\"code-subblock\" id=\"day05CountQuery1\">\n              <pre><code><span class=\"code-comment\">-- 1. Total headcount (counts all 15 rows)</span>\n<span class=\"code-keyword\">SELECT</span> COUNT(*) <span class=\"code-keyword\">AS</span> total_employees\n<span class=\"code-keyword\">FROM</span>   employees;</code></pre>\n            </div>\n            <div class=\"code-subblock\" id=\"day05CountQuery2\">\n              <pre><code><span class=\"code-comment\">-- 2. Count staff with commissions (skips NULLs -> returns 6)</span>\n<span class=\"code-keyword\">SELECT</span> COUNT(commission) <span class=\"code-keyword\">AS</span> commission_earners\n<span class=\"code-keyword\">FROM</span>   employees;</code></pre>\n            </div>\n            <div class=\"code-subblock\" id=\"day05CountQuery3\">\n              <pre><code><span class=\"code-comment\">-- 3. Count unique departments with active staff</span>\n<span class=\"code-keyword\">SELECT</span> COUNT(DISTINCT department_id) <span class=\"code-keyword\">AS</span> active_depts\n<span class=\"code-keyword\">FROM</span>   employees;</code></pre>\n            </div>\n          </div>\n\n          <div class=\"pro-tip-box\" id=\"day05CountInfo\">\n            <div style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;\">\n              <strong style=\"color: #b45309;\">📊 Data Quality Audit Formula</strong>\n              <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio06.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n                <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n              </button>\n            </div>\n            <p style=\"margin: 0;\">Find missing/NULL values instantly: <code>COUNT(*) - COUNT(col) = Missing Rows</code>.</p>\n          </div>\n        </div>\n\n        <!-- ── SECTION 03 ── -->\n        <div class=\"slide-section\" id=\"day05Section03\">\n          <h3 class=\"heading-with-audio\" id=\"day05SumAvg\">\n            03. SUM & AVG — The Dangerous NULL Denominator Trap\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio07.mp3', this)\" title=\"Play narration\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </h3>\n          <p><code>AVG(col)</code> calculates <code>SUM(col) / COUNT(col)</code>. It does <strong>not</strong> divide by <code>COUNT(*)</code>. If 4 out of 15 employees have NULL commissions, <code>AVG(commission)</code> divides by <strong>11</strong>, not 15.</p>\n\n          <div class=\"heading-with-audio\" id=\"day05SumAvgCode\" style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;\">\n            <small style=\"flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;\">Comparing Averages With &amp; Without NULLs</small>\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio08.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </div>\n          <div class=\"code-block-container\" id=\"day05SumAvgContainer\">\n            <div class=\"code-subblock\" id=\"day05SumAvgQuery1\">\n              <pre><code><span class=\"code-comment\">-- 1. Summary stats across all employees</span>\n<span class=\"code-keyword\">SELECT</span> SUM(salary) <span class=\"code-keyword\">AS</span> payroll,\n       AVG(salary) <span class=\"code-keyword\">AS</span> avg_sal,\n       MIN(salary) <span class=\"code-keyword\">AS</span> min_sal,\n       MAX(salary) <span class=\"code-keyword\">AS</span> max_sal\n<span class=\"code-keyword\">FROM</span>   employees;</code></pre>\n            </div>\n            <div class=\"code-subblock\" id=\"day05SumAvgQuery2\">\n              <pre><code><span class=\"code-comment\">-- 2. Average among commission earners ONLY (divisor = 6)</span>\n<span class=\"code-keyword\">SELECT</span> AVG(commission) <span class=\"code-keyword\">AS</span> avg_earned_commission\n<span class=\"code-keyword\">FROM</span>   employees;</code></pre>\n            </div>\n            <div class=\"code-subblock\" id=\"day05SumAvgQuery3\">\n              <pre><code><span class=\"code-comment\">-- 3. Average across ALL employees (treat NULL as 0 -> divisor = 15)</span>\n<span class=\"code-keyword\">SELECT</span> AVG(COALESCE(commission, 0)) <span class=\"code-keyword\">AS</span> avg_companywide_commission\n<span class=\"code-keyword\">FROM</span>   employees;</code></pre>\n            </div>\n          </div>\n\n          <div class=\"warn-box\" id=\"day05AvgNullWarn\">\n            <div style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;\">\n              <strong style=\"color: #b91c1c;\">⚠️ Interview Gotcha</strong>\n              <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio09.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n                <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n              </button>\n            </div>\n            <p style=\"margin: 0;\">When asked for <em>\"average bonus across the entire company\"</em>, always use <code>AVG(COALESCE(bonus, 0))</code> so employees with zero bonus are included in the denominator.</p>\n          </div>\n        </div>\n\n        <!-- ── SECTION 04 ── -->\n        <div class=\"slide-section\" id=\"day05Section04\">\n          <h3 class=\"heading-with-audio\" id=\"day05Coalesce\">\n            04. The COALESCE Safety Net — Inside vs Outside\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio10.mp3', this)\" title=\"Play narration\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </h3>\n          <p>Placing <code>COALESCE</code> <strong>inside</strong> vs <strong>outside</strong> an aggregate solves two completely different business problems:</p>\n\n          <div class=\"heading-with-audio\" id=\"day05CoalesceCode\" style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;\">\n            <small style=\"flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;\">Inside vs Outside COALESCE</small>\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio11.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </div>\n          <div class=\"code-block-container\" id=\"day05CoalesceContainer\">\n            <div class=\"code-subblock\" id=\"day05CoalesceQuery1\">\n              <pre><code><span class=\"code-comment\">-- PATTERN A (Inside): Convert NULLs to 0 before calculating the mean</span>\n<span class=\"code-keyword\">SELECT</span> AVG(COALESCE(commission, 0)) <span class=\"code-keyword\">AS</span> avg_all_staff\n<span class=\"code-keyword\">FROM</span>   employees;</code></pre>\n            </div>\n            <div class=\"code-subblock\" id=\"day05CoalesceQuery2\">\n              <pre><code><span class=\"code-comment\">-- PATTERN B (Outside): Prevent NULL output when query matches 0 rows</span>\n<span class=\"code-keyword\">SELECT</span> COALESCE(AVG(salary), 0) <span class=\"code-keyword\">AS</span> avg_sal_dept99\n<span class=\"code-keyword\">FROM</span>   employees\n<span class=\"code-keyword\">WHERE</span>  department_id = 99;   <span class=\"code-comment\">-- empty set -> returns 0 instead of NULL</span></code></pre>\n            </div>\n          </div>\n\n          <div class=\"info-box\" id=\"day05CoalesceTip\">\n            <div style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;\">\n              <strong style=\"color: #0f766e;\">💡 Summary: Inside vs Outside</strong>\n              <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio12.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n                <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n              </button>\n            </div>\n            <p style=\"margin: 0;\"><strong>Inside:</strong> <code>AVG(COALESCE(x, 0))</code> adjusts the average by counting zeroes.<br/>\n            <strong>Outside:</strong> <code>COALESCE(SUM(x), 0)</code> ensures dashboard cards show <code>0</code> instead of a blank <code>NULL</code> when filtered to empty results.</p>\n          </div>\n        </div>\n\n        <!-- ── SECTION 05 ── -->\n        <div class=\"slide-section\" id=\"day05Section05\">\n          <h3 class=\"heading-with-audio\" id=\"day05MinMax\">\n            05. MIN & MAX — Beyond Numbers (Dates & Text)\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio13.mp3', this)\" title=\"Play narration\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </h3>\n          <p><code>MIN</code> and <code>MAX</code> find boundary values across all SQL data types using natural ordering:</p>\n          <ul style=\"margin: 6px 0 10px 18px; padding: 0; font-size: 0.85rem; color: #cbd5e1; line-height: 1.5;\">\n            <li id=\"day05MinMaxLi1\"><strong>Numeric:</strong> Smallest and largest amounts ($/₹).</li>\n            <li id=\"day05MinMaxLi2\"><strong>Dates:</strong> <code>MIN</code> = Earliest date; <code>MAX</code> = Most recent date.</li>\n            <li id=\"day05MinMaxLi3\"><strong>Strings:</strong> Alphabetical first ('A...') and last ('Z...').</li>\n          </ul>\n\n          <div class=\"heading-with-audio\" id=\"day05MinMaxCode\" style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;\">\n            <small style=\"flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;\">MIN/MAX Across Types</small>\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio14.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </div>\n          <div class=\"code-block-container\" id=\"day05MinMaxContainer\">\n            <div class=\"code-subblock\" id=\"day05MinMaxQuery1\">\n              <pre><code><span class=\"code-comment\">-- 1. Numbers: Price boundaries</span>\n<span class=\"code-keyword\">SELECT</span> MIN(unit_price) <span class=\"code-keyword\">AS</span> cheapest, MAX(unit_price) <span class=\"code-keyword\">AS</span> priciest\n<span class=\"code-keyword\">FROM</span>   products;</code></pre>\n            </div>\n            <div class=\"code-subblock\" id=\"day05MinMaxQuery2\">\n              <pre><code><span class=\"code-comment\">-- 2. Dates: Tenure range (earliest & latest hires)</span>\n<span class=\"code-keyword\">SELECT</span> MIN(hire_date) <span class=\"code-keyword\">AS</span> oldest_hire, MAX(hire_date) <span class=\"code-keyword\">AS</span> newest_hire\n<span class=\"code-keyword\">FROM</span>   employees;</code></pre>\n            </div>\n            <div class=\"code-subblock\" id=\"day05MinMaxQuery3\">\n              <pre><code><span class=\"code-comment\">-- 3. Strings: Alphabetical boundaries</span>\n<span class=\"code-keyword\">SELECT</span> MIN(first_name) <span class=\"code-keyword\">AS</span> first_name_a, MAX(first_name) <span class=\"code-keyword\">AS</span> last_name_z\n<span class=\"code-keyword\">FROM</span>   customers;</code></pre>\n            </div>\n          </div>\n\n          <div class=\"pro-tip-box\" id=\"day05MinMaxTip\">\n            <div style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;\">\n              <strong style=\"color: #b45309;\">💡 ISO-8601 Date Standard</strong>\n              <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio15.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n                <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n              </button>\n            </div>\n            <p style=\"margin: 0;\">Because dates are stored in <code>YYYY-MM-DD</code> format, alphabetical sorting matches chronological order perfectly.</p>\n          </div>\n        </div>\n\n        <!-- ── SECTION 06 ── -->\n        <div class=\"slide-section\" id=\"day05Section06\">\n          <h3 class=\"heading-with-audio\" id=\"day05Stacking\">\n            06. Stacking Aggregates & Expressions in One SELECT\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio16.mp3', this)\" title=\"Play narration\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </h3>\n          <p>Stack multiple aggregates in a single <code>SELECT</code> to generate a complete executive dashboard in a <strong>single table scan</strong>. You can also place mathematical expressions inside aggregate functions.</p>\n\n          <div class=\"heading-with-audio\" id=\"day05StackCode\" style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;\">\n            <small style=\"flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;\">One-Row Executive KPI Dashboard</small>\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio17.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </div>\n          <div class=\"code-block-container\" id=\"day05StackContainer\">\n            <div class=\"code-subblock\" id=\"day05StackQuery1\">\n              <pre><code><span class=\"code-comment\">-- Executive Overview Dashboard</span>\n<span class=\"code-keyword\">SELECT</span> COUNT(*)                    <span class=\"code-keyword\">AS</span> total_headcount,\n       SUM(salary)                 <span class=\"code-keyword\">AS</span> total_payroll,\n       ROUND(AVG(salary), 2)       <span class=\"code-keyword\">AS</span> avg_salary,\n       MIN(hire_date)              <span class=\"code-keyword\">AS</span> company_founded,\n       SUM(stock_qty * unit_price) <span class=\"code-keyword\">AS</span> total_inventory_value\n<span class=\"code-keyword\">FROM</span>   employees, products;</code></pre>\n            </div>\n          </div>\n\n          <div class=\"info-box\" id=\"day05StackInfo\">\n            <div style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;\">\n              <strong style=\"color: #0f766e;\">💡 Row-Level Expression Evaluation</strong>\n              <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio18.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n                <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n              </button>\n            </div>\n            <p style=\"margin: 0;\">In <code>SUM(stock_qty * unit_price)</code>, SQL multiplies the quantity and price for each row first, then sums the calculated results.</p>\n          </div>\n        </div>\n\n        <!-- ── SECTION 07 ── -->\n        <div class=\"slide-section\" id=\"day05Section07\">\n          <h3 class=\"heading-with-audio\" id=\"day05NullDeep\">\n            07. NULL Deep Dive — Aggregation Edge Cases Cheat Sheet\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio19.mp3', this)\" title=\"Play narration\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </h3>\n          <p>Master these 6 edge cases to ace technical interviews and prevent reporting bugs:</p>\n\n          <div class=\"heading-with-audio\" id=\"day05NullBehavTable\" style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;\">\n            <small style=\"flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;\">Aggregation &amp; NULL Truth Matrix</small>\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio20.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </div>\n          <div class=\"db-mock-table-wrap\" id=\"day05NullTableWrap\">\n            <table class=\"db-table-mock db-table-mock--compact\">\n              <thead><tr><th>Scenario</th><th>Function</th><th>Result</th><th>Explanation</th></tr></thead>\n              <tbody>\n                <tr id=\"day05NullRow1\"><td>Table has 15 rows (4 NULLs)</td><td><code>COUNT(*)</code></td><td><strong>15</strong></td><td>Counts rows regardless of content</td></tr>\n                <tr id=\"day05NullRow2\"><td>Table has 15 rows (4 NULLs)</td><td><code>COUNT(commission)</code></td><td><strong>11</strong></td><td>Skips 4 NULL entries</td></tr>\n                <tr id=\"day05NullRow3\"><td>Table has 15 rows (4 NULLs)</td><td><code>AVG(commission)</code></td><td><strong>SUM / 11</strong></td><td>Divides only by populated entries</td></tr>\n                <tr id=\"day05NullRow4\"><td>Column is 100% NULL</td><td><code>SUM(col)</code> / <code>AVG(col)</code></td><td><strong>NULL</strong></td><td>No valid numeric data to aggregate</td></tr>\n                <tr id=\"day05NullRow5\"><td>Empty result set (0 rows matched)</td><td><code>COUNT(*)</code></td><td><strong>0</strong></td><td>Zero rows counted</td></tr>\n                <tr id=\"day05NullRow6\"><td>Empty result set (0 rows matched)</td><td><code>SUM(col)</code> / <code>AVG(col)</code></td><td><strong>NULL</strong></td><td>Nothing exists to sum or average</td></tr>\n              </tbody>\n            </table>\n          </div>\n\n          <div class=\"heading-with-audio\" id=\"day05NullDemoCode\" style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;\">\n            <small style=\"flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;\">Live Demonstration Query</small>\n            <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio21.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n              <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n            </button>\n          </div>\n          <div class=\"code-block-container\" id=\"day05NullDemoContainer\">\n            <div class=\"code-subblock\" id=\"day05NullDemoQuery1\">\n              <pre><code><span class=\"code-comment\">-- Side-by-side comparison of NULL handling</span>\n<span class=\"code-keyword\">SELECT</span> COUNT(*)                   <span class=\"code-keyword\">AS</span> total_rows,\n       COUNT(commission)           <span class=\"code-keyword\">AS</span> count_populated,\n       AVG(commission)             <span class=\"code-keyword\">AS</span> avg_earners_only,\n       AVG(COALESCE(commission,0)) <span class=\"code-keyword\">AS</span> avg_all_employees,\n       COALESCE(SUM(commission),0) <span class=\"code-keyword\">AS</span> safe_total_payout\n<span class=\"code-keyword\">FROM</span>   employees;</code></pre>\n            </div>\n          </div>\n\n          <div class=\"pro-tip-box\" id=\"day05NullTip\">\n            <div style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;\">\n              <strong style=\"color: #b45309;\">💡 Pro-Tip: Missing Value Audit</strong>\n              <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio22.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n                <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n              </button>\n            </div>\n            <p style=\"margin: 0;\">Always run <code>COUNT(*) - COUNT(col)</code> during initial EDA (Exploratory Data Analysis) to measure dataset cleanliness.</p>\n          </div>\n\n          <div class=\"warn-box\" id=\"day05DistinctWarn\">\n            <div style=\"display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;\">\n              <strong style=\"color: #b91c1c;\">⚠️ Caution with SUM(DISTINCT col)</strong>\n              <button class=\"audio-play-btn\" onclick=\"playAudio('Day05/New_Day5Part1audio23.mp3', this)\" title=\"Play narration\" style=\"flex-shrink: 0;\">\n                <svg class=\"play-icon\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"currentColor\"><path d=\"M8 5v14l11-7z\"/></svg>\n              </button>\n            </div>\n            <p style=\"margin: 0;\"><code>COUNT(DISTINCT col)</code> is essential for counting unique users. But <code>SUM(DISTINCT salary)</code> will discard legitimate identical salaries (e.g. two engineers making ₹80k), corrupting financial totals.</p>\n          </div>\n        </div>\n\n        <!-- ── SECTION 08: INTERVIEW Q&A ── -->\n        <div class=\"slide-section\" id=\"day05QASection\">\n          <div class=\"interview-box\">\n            <h4 id=\"day05QAHeading\" style=\"margin: 0 0 12px 0; font-size: 1rem; color: #38bdf8; display: flex; align-items: center; gap: 6px;\">\n              <span>🎯</span> Top 25 SQL Interview Q&amp;A — Aggregate Functions\n            </h4>\n\n            <div id=\"day05QA1\">\n              <p><strong>Q1: What is the difference between <code>COUNT(*)</code> and <code>COUNT(column)</code>?</strong></p>\n              <p><em>A: <code>COUNT(*)</code> counts every physical row including rows with NULLs. <code>COUNT(column)</code> counts only rows where that specific column is non-NULL. They differ only when the column contains NULL values.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA2\">\n              <p><strong>Q2: What does <code>COUNT(DISTINCT col)</code> do, and when is it used?</strong></p>\n              <p><em>A: It counts the number of unique, non-NULL values in a column. Common use cases include counting unique active customers, distinct product categories, or unique login dates.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA3\">\n              <p><strong>Q3: How does <code>AVG(col)</code> handle NULL values?</strong></p>\n              <p><em>A: <code>AVG</code> ignores NULLs in both the numerator and denominator: <code>AVG(col) = SUM(col) / COUNT(col)</code>. To include NULLs as zeros in the average, use <code>AVG(COALESCE(col, 0))</code>.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA4\">\n              <p><strong>Q4: Why can't you use an aggregate function inside a WHERE clause?</strong></p>\n              <p><em>A: Due to SQL logical execution order: <code>WHERE</code> (Step 3) filters rows before aggregation (Step 4) happens. To filter aggregated results, use <code>HAVING</code> (Step 5) or wrap the aggregate in a subquery.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA5\">\n              <p><strong>Q5: What does <code>SUM()</code> return if all values in the column are NULL?</strong></p>\n              <p><em>A: It returns <code>NULL</code>, not <code>0</code>. To safely return zero for dashboards, wrap the result with <code>COALESCE(SUM(col), 0)</code>.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA6\">\n              <p><strong>Q6: How do <code>MIN()</code> and <code>MAX()</code> work on TEXT and DATE columns?</strong></p>\n              <p><em>A: They use natural sorting order. For TEXT, they return alphabetical first and last ('A' to 'Z'). For ISO-8601 dates (<code>YYYY-MM-DD</code>), they return the earliest and latest dates.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA7\">\n              <p><strong>Q7: Can you place mathematical expressions inside aggregate functions?</strong></p>\n              <p><em>A: Yes. Aggregates evaluate the inner expression row-by-row first, then aggregate. For example, <code>SUM(qty * unit_price)</code> computes line totals before calculating gross inventory value.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA8\">\n              <p><strong>Q8: What is the risk of using <code>SUM(DISTINCT salary)</code>?</strong></p>\n              <p><em>A: It deduplicates values before summing. If multiple employees earn the exact same salary, duplicate amounts are dropped, leading to severely underreported financial figures.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA9\">\n              <p><strong>Q9: Why does <code>SELECT department_id, COUNT(*) FROM employees;</code> fail without GROUP BY?</strong></p>\n              <p><em>A: Standard SQL disallows mixing non-aggregated columns with aggregate functions unless all non-aggregated columns appear in a <code>GROUP BY</code> clause.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA10\">\n              <p><strong>Q10: What is the performance cost of <code>COUNT(*)</code> on large tables?</strong></p>\n              <p><em>A: In transactional engines with MVCC (like PostgreSQL or MySQL InnoDB), <code>COUNT(*)</code> performs a full index or table scan. For large tables, maintain pre-computed summary tables or use table metadata.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA11\">\n              <p><strong>Q11: How do you calculate a weighted average in SQL?</strong></p>\n              <p><em>A: Use <code>SUM(value * weight) * 1.0 / NULLIF(SUM(weight), 0)</code>. Always guard the denominator with <code>NULLIF</code> to prevent divide-by-zero crashes on empty sets.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA12\">\n              <p><strong>Q12: What do <code>GROUP_CONCAT</code> (SQLite/MySQL) and <code>STRING_AGG</code> (PostgreSQL) do?</strong></p>\n              <p><em>A: They concatenate text values across rows into a single delimited string (e.g., combining employee names into a comma-separated list per department).</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA13\">\n              <p><strong>Q13: Can you nest aggregate functions like <code>MAX(COUNT(*))</code>?</strong></p>\n              <p><em>A: No, SQL does not allow direct nesting of aggregates. You must compute the inner aggregate inside a subquery or CTE first, then aggregate over that result.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA14\">\n              <p><strong>Q14: What is the result of <code>COUNT(*)</code> versus <code>AVG()</code> over an empty table?</strong></p>\n              <p><em>A: <code>COUNT(*)</code> returns <code>0</code> because counting zero rows is well-defined. <code>AVG()</code>, <code>SUM()</code>, <code>MIN()</code>, and <code>MAX()</code> all return <code>NULL</code>.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA15\">\n              <p><strong>Q15: How does conditional aggregation work with <code>CASE WHEN</code>?</strong></p>\n              <p><em>A: You place a <code>CASE</code> expression inside an aggregate: <code>SUM(CASE WHEN status = 'Shipped' THEN amount ELSE 0 END)</code>. This pivots multiple row categories into column metrics in a single query.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA16\">\n              <p><strong>Q16: What is the difference between an aggregate function and a window function?</strong></p>\n              <p><em>A: Aggregate functions collapse multiple rows into one summary row. Window functions compute summary metrics while preserving each original row using the <code>OVER()</code> clause.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA17\">\n              <p><strong>Q17: How do you find the second highest salary using aggregates?</strong></p>\n              <p><em>A: Use a subquery: <code>SELECT MAX(salary) FROM employees WHERE salary &lt; (SELECT MAX(salary) FROM employees);</code>. Alternatively, use <code>DENSE_RANK()</code> window functions.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA18\">\n              <p><strong>Q18: Does <code>COUNT(col)</code> count empty string values (<code>''</code>)?</strong></p>\n              <p><em>A: Yes. An empty string is a valid text value, not a <code>NULL</code>. <code>COUNT(col)</code> only skips genuine <code>NULL</code> entries.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA19\">\n              <p><strong>Q19: What is the fastest way to check if a table has any rows?</strong></p>\n              <p><em>A: Use <code>SELECT 1 FROM table LIMIT 1</code> or <code>WHERE EXISTS (...)</code>. Avoid <code>COUNT(*) &gt; 0</code> because it forces a full table scan.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA20\">\n              <p><strong>Q20: How do <code>MIN()</code> and <code>MAX()</code> treat NULL values?</strong></p>\n              <p><em>A: They completely ignore <code>NULL</code> values and evaluate only non-NULL entries. If all rows are NULL, both functions return <code>NULL</code>.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA21\">\n              <p><strong>Q21: Why does <code>AVG(col)</code> equal <code>SUM(col) / COUNT(col)</code>, but not <code>SUM(col) / COUNT(*)</code>?</strong></p>\n              <p><em>A: Because both <code>AVG</code> and <code>COUNT(col)</code> ignore NULLs. <code>COUNT(*)</code> counts all rows including NULLs, which would artificially lower the calculated average.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA22\">\n              <p><strong>Q22: How is the median calculated in standard SQL?</strong></p>\n              <p><em>A: SQLite has no native <code>MEDIAN()</code> aggregate. Standard SQL uses <code>PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY col)</code>, or window ranking functions like <code>ROW_NUMBER()</code>.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA23\">\n              <p><strong>Q23: Can aggregate functions run without a GROUP BY clause?</strong></p>\n              <p><em>A: Yes. Without <code>GROUP BY</code>, the entire table is treated as a single group, returning exactly one summary row (e.g. <code>SELECT COUNT(*), AVG(salary) FROM employees;</code>).</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA24\">\n              <p><strong>Q24: Can you use multiple columns inside <code>COUNT(DISTINCT a, b)</code>?</strong></p>\n              <p><em>A: Most standard SQL engines reject multiple arguments in <code>COUNT(DISTINCT)</code>. Instead, concatenate the columns: <code>COUNT(DISTINCT col1 || '-' || col2)</code> or use a subquery.</em></p>\n            </div>\n            <hr style=\"border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;\" />\n\n            <div id=\"day05QA25\">\n              <p><strong>Q25: How do you compute a percentage of the total in SQL?</strong></p>\n              <p><em>A: Divide the group sum by the grand total: <code>SUM(salary) * 100.0 / (SELECT SUM(salary) FROM employees)</code> or using window functions: <code>SUM(salary) * 100.0 / SUM(SUM(salary)) OVER ()</code>.</em></p>\n            </div>\n          </div>\n        </div>"
    }
  ],
  "practiceQuestions": [
    {
      "id": 1,
      "prompt": "<strong>[Easy] Company Payroll Overview</strong><br/>HR leadership is conducting an annual budget review. Write a query from <code>employees</code> to calculate the total payroll spend (<code>total_payroll</code>), average salary (<code>avg_salary</code>), lowest salary (<code>min_salary</code>), and highest salary (<code>max_salary</code>).",
      "referenceSql": "SELECT SUM(salary) AS total_payroll,\n       AVG(salary) AS avg_salary,\n       MIN(salary) AS min_salary,\n       MAX(salary) AS max_salary\nFROM   employees;",
      "questionAudio": "Day05/New_Day5Question01.mp3",
      "solutionAudio": "Day05/New_Day5Question01sol.mp3",
      "solutionEvents": {
        "code": "SELECT SUM(salary) AS total_payroll,\n       AVG(salary) AS avg_salary,\n       MIN(salary) AS min_salary,\n       MAX(salary) AS max_salary\nFROM   employees;",
        "segments": [
          {
            "text": "SELECT SUM(salary) AS total_payroll,\n",
            "start": 0.8,
            "end": 3.75,
            "charInterval": 80
          },
          {
            "text": "       AVG(salary) AS avg_salary,\n",
            "start": 3.75,
            "end": 6.46,
            "charInterval": 80
          },
          {
            "text": "       MIN(salary) AS min_salary,\n",
            "start": 6.46,
            "end": 9.17,
            "charInterval": 80
          },
          {
            "text": "       MAX(salary) AS max_salary\n",
            "start": 9.17,
            "end": 11.8,
            "charInterval": 80
          },
          {
            "text": "FROM   employees;",
            "start": 11.8,
            "end": 13.15,
            "charInterval": 80
          }
        ],
        "scrollAt": 13.44
      }
    },
    {
      "id": 2,
      "prompt": "<strong>[Easy] Active Workforce Headcount</strong><br/>To audit organizational capacity, determine how many employees are currently active (<code>is_active = 1</code>). Return the count aliased as <code>active_employees</code>.",
      "referenceSql": "SELECT COUNT(*) AS active_employees\nFROM   employees\nWHERE  is_active = 1;",
      "questionAudio": "Day05/New_Day5Question02.mp3",
      "solutionAudio": "Day05/New_Day5Question02sol.mp3",
      "solutionEvents": {
        "code": "SELECT COUNT(*) AS active_employees\nFROM   employees\nWHERE  is_active = 1;",
        "segments": [
          {
            "text": "SELECT COUNT(*) AS active_employees\n",
            "start": 0.8,
            "end": 3.61,
            "charInterval": 80
          },
          {
            "text": "FROM   employees\n",
            "start": 3.61,
            "end": 4.94,
            "charInterval": 80
          },
          {
            "text": "WHERE  is_active = 1;",
            "start": 4.94,
            "end": 6.58,
            "charInterval": 80
          }
        ],
        "scrollAt": 6.88
      }
    },
    {
      "id": 3,
      "prompt": "<strong>[Easy] Catalog Price Extremes</strong><br/>The merchandising team needs to identify the price boundaries of the catalog. From <code>products</code>, return the lowest unit price as <code>cheapest</code> and the highest unit price as <code>most_expensive</code>.",
      "referenceSql": "SELECT MIN(unit_price) AS cheapest,\n       MAX(unit_price) AS most_expensive\nFROM   products;",
      "questionAudio": "Day05/New_Day5Question03.mp3",
      "solutionAudio": "Day05/New_Day5Question03sol.mp3",
      "solutionEvents": {
        "code": "SELECT MIN(unit_price) AS cheapest,\n       MAX(unit_price) AS most_expensive\nFROM   products;",
        "segments": [
          {
            "text": "SELECT MIN(unit_price) AS cheapest,\n",
            "start": 0.8,
            "end": 3.55,
            "charInterval": 80
          },
          {
            "text": "       MAX(unit_price) AS most_expensive\n",
            "start": 3.55,
            "end": 6.68,
            "charInterval": 80
          },
          {
            "text": "FROM   products;",
            "start": 6.68,
            "end": 7.9,
            "charInterval": 80
          }
        ],
        "scrollAt": 8.2
      }
    },
    {
      "id": 4,
      "prompt": "<strong>[Medium] Commission Data Quality Audit</strong><br/>Perform a data completeness check on employee compensation. In a single query from <code>employees</code>, return <code>total</code> (all employees), <code>has_commission</code> (employees with non-NULL commissions), and <code>no_commission</code> (employees missing commission data).",
      "referenceSql": "SELECT COUNT(*) AS total,\n       COUNT(commission) AS has_commission,\n       COUNT(*) - COUNT(commission) AS no_commission\nFROM   employees;",
      "questionAudio": "Day05/New_Day5Question04.mp3",
      "solutionAudio": "Day05/New_Day5Question04sol.mp3",
      "solutionEvents": {
        "code": "SELECT COUNT(*) AS total,\n       COUNT(commission) AS has_commission,\n       COUNT(*) - COUNT(commission) AS no_commission\nFROM   employees;",
        "segments": [
          {
            "text": "SELECT COUNT(*) AS total,\n",
            "start": 0.8,
            "end": 2.41,
            "charInterval": 60
          },
          {
            "text": "       COUNT(commission) AS has_commission,\n",
            "start": 2.41,
            "end": 5.14,
            "charInterval": 60
          },
          {
            "text": "       COUNT(*) - COUNT(commission) AS no_commission\n",
            "start": 5.14,
            "end": 8.43,
            "charInterval": 60
          },
          {
            "text": "FROM   employees;",
            "start": 8.43,
            "end": 9.48,
            "charInterval": 60
          }
        ],
        "scrollAt": 9.78
      }
    },
    {
      "id": 5,
      "prompt": "<strong>[Easy] Realized Shipped Revenue</strong><br/>Finance only recognizes revenue once orders have been dispatched. Calculate the total monetary value from <code>orders</code> where <code>status = 'Shipped'</code>, aliased as <code>shipped_revenue</code>.",
      "referenceSql": "SELECT SUM(total_amount) AS shipped_revenue\nFROM   orders\nWHERE  status = 'Shipped';",
      "questionAudio": "Day05/New_Day5Question05.mp3",
      "solutionAudio": "Day05/New_Day5Question05sol.mp3",
      "solutionEvents": {
        "code": "SELECT SUM(total_amount) AS shipped_revenue\nFROM   orders\nWHERE  status = 'Shipped';",
        "segments": [
          {
            "text": "SELECT SUM(total_amount) AS shipped_revenue\n",
            "start": 0.8,
            "end": 3.71,
            "charInterval": 70
          },
          {
            "text": "FROM   orders\n",
            "start": 3.71,
            "end": 4.64,
            "charInterval": 70
          },
          {
            "text": "WHERE  status = 'Shipped';",
            "start": 4.64,
            "end": 6.36,
            "charInterval": 70
          }
        ],
        "scrollAt": 6.66
      }
    },
    {
      "id": 6,
      "prompt": "<strong>[Easy] Active Department Representation</strong><br/>Management wants to know how many distinct departments currently have staff assigned. Count the number of unique <code>department_id</code> values in <code>employees</code>, aliased as <code>num_departments</code>.",
      "referenceSql": "SELECT COUNT(DISTINCT department_id) AS num_departments\nFROM   employees;",
      "questionAudio": "Day05/New_Day5Question06.mp3",
      "solutionAudio": "Day05/New_Day5Question06sol.mp3",
      "solutionEvents": {
        "code": "SELECT COUNT(DISTINCT department_id) AS num_departments\nFROM   employees;",
        "segments": [
          {
            "text": "SELECT COUNT(DISTINCT department_id) AS num_departments\n",
            "start": 0.8,
            "end": 4.74,
            "charInterval": 70
          },
          {
            "text": "FROM   employees;",
            "start": 4.74,
            "end": 5.94,
            "charInterval": 70
          }
        ],
        "scrollAt": 6.24
      }
    },
    {
      "id": 7,
      "prompt": "<strong>[Medium] Total Warehouse Valuation</strong><br/>Supply chain requires a balance-sheet asset valuation of all physical inventory. Compute the total inventory value as <code>SUM(stock_qty * unit_price)</code> across all items in <code>products</code>, aliased as <code>inventory_value</code>.",
      "referenceSql": "SELECT SUM(stock_qty * unit_price) AS inventory_value\nFROM   products;",
      "questionAudio": "Day05/New_Day5Question07.mp3",
      "solutionAudio": "Day05/New_Day5Question07sol.mp3",
      "solutionEvents": {
        "code": "SELECT SUM(stock_qty * unit_price) AS inventory_value\nFROM   products;",
        "segments": [
          {
            "text": "SELECT SUM(stock_qty * unit_price) AS inventory_value\n",
            "start": 0.8,
            "end": 6.45,
            "charInterval": 100
          },
          {
            "text": "FROM   products;",
            "start": 6.45,
            "end": 8.12,
            "charInterval": 100
          }
        ],
        "scrollAt": 8.42
      }
    },
    {
      "id": 8,
      "prompt": "<strong>[Medium] Commission Averages: Earners vs Company-Wide</strong><br/>Compensation analysis requires two views of commission. From <code>employees</code>, compute <code>avg_non_null</code> (average among staff who earned commission) and <code>avg_all</code> (average across all employees, treating NULL as 0 via <code>COALESCE</code>).",
      "referenceSql": "SELECT AVG(commission) AS avg_non_null,\n       AVG(COALESCE(commission, 0)) AS avg_all\nFROM   employees;",
      "questionAudio": "Day05/New_Day5Question08.mp3",
      "solutionAudio": "Day05/New_Day5Question08sol.mp3",
      "solutionEvents": {
        "code": "SELECT AVG(commission) AS avg_non_null,\n       AVG(COALESCE(commission, 0)) AS avg_all\nFROM   employees;",
        "segments": [
          {
            "text": "SELECT AVG(commission) AS avg_non_null,\n",
            "start": 0.8,
            "end": 4.04,
            "charInterval": 80
          },
          {
            "text": "       AVG(COALESCE(commission, 0)) AS avg_all\n",
            "start": 4.04,
            "end": 7.85,
            "charInterval": 80
          },
          {
            "text": "FROM   employees;",
            "start": 7.85,
            "end": 9.23,
            "charInterval": 80
          }
        ],
        "scrollAt": 9.52
      }
    },
    {
      "id": 9,
      "prompt": "<strong>[Easy] Luxury Product Tier Count</strong><br/>Marketing is planning a luxury goods campaign. Count how many items in <code>products</code> have a <code>unit_price</code> strictly greater than 5000, aliased as <code>premium_count</code>.",
      "referenceSql": "SELECT COUNT(*) AS premium_count\nFROM   products\nWHERE  unit_price > 5000;",
      "questionAudio": "Day05/New_Day5Question09.mp3",
      "solutionAudio": "Day05/New_Day5Question09sol.mp3",
      "solutionEvents": {
        "code": "SELECT COUNT(*) AS premium_count\nFROM   products\nWHERE  unit_price > 5000;",
        "segments": [
          {
            "text": "SELECT COUNT(*) AS premium_count\n",
            "start": 0.8,
            "end": 3.51,
            "charInterval": 80
          },
          {
            "text": "FROM   products\n",
            "start": 3.51,
            "end": 4.82,
            "charInterval": 80
          },
          {
            "text": "WHERE  unit_price > 5000;",
            "start": 4.82,
            "end": 6.87,
            "charInterval": 80
          }
        ],
        "scrollAt": 7.17
      }
    },
    {
      "id": 10,
      "prompt": "<strong>[Medium] Safe Average on Unmatched Filters</strong><br/>Write a fault-tolerant query to calculate <code>avg_salary</code> for <code>department_id = 99</code> (a non-existent department). Use <code>COALESCE</code> to ensure the query returns <code>0</code> instead of a blank <code>NULL</code> when no rows match.",
      "referenceSql": "SELECT COALESCE(AVG(salary), 0) AS avg_salary\nFROM   employees\nWHERE  department_id = 99;",
      "questionAudio": "Day05/New_Day5Question10.mp3",
      "solutionAudio": "Day05/New_Day5Question10sol.mp3",
      "solutionEvents": {
        "code": "SELECT COALESCE(AVG(salary), 0) AS avg_salary\nFROM   employees\nWHERE  department_id = 99;",
        "segments": [
          {
            "text": "SELECT COALESCE(AVG(salary), 0) AS avg_salary\n",
            "start": 0.8,
            "end": 4.99,
            "charInterval": 90
          },
          {
            "text": "FROM   employees\n",
            "start": 4.99,
            "end": 6.54,
            "charInterval": 90
          },
          {
            "text": "WHERE  department_id = 99;",
            "start": 6.54,
            "end": 8.91,
            "charInterval": 90
          }
        ],
        "scrollAt": 9.2
      }
    },
    {
      "id": 11,
      "prompt": "<strong>[Easy] Peak Transaction Value</strong><br/>Risk management needs to monitor large transaction thresholds. Find the single largest order amount across all records in <code>orders</code>, aliased as <code>largest_order</code>.",
      "referenceSql": "SELECT MAX(total_amount) AS largest_order\nFROM   orders;",
      "questionAudio": "Day05/New_Day5Question11.mp3",
      "solutionAudio": "Day05/New_Day5Question11sol.mp3",
      "solutionEvents": {
        "code": "SELECT MAX(total_amount) AS largest_order\nFROM   orders;",
        "segments": [
          {
            "text": "SELECT MAX(total_amount) AS largest_order\n",
            "start": 0.8,
            "end": 3.89,
            "charInterval": 70
          },
          {
            "text": "FROM   orders;",
            "start": 3.89,
            "end": 4.92,
            "charInterval": 70
          }
        ],
        "scrollAt": 5.22
      }
    },
    {
      "id": 12,
      "prompt": "<strong>[Easy] Geographic Reach Metric</strong><br/>Determine the geographic footprint of our customer base. From <code>customers</code>, count the number of unique regions represented, aliased as <code>num_regions</code>.",
      "referenceSql": "SELECT COUNT(DISTINCT region) AS num_regions\nFROM   customers;",
      "questionAudio": "Day05/New_Day5Question12.mp3",
      "solutionAudio": "Day05/New_Day5Question12sol.mp3",
      "solutionEvents": {
        "code": "SELECT COUNT(DISTINCT region) AS num_regions\nFROM   customers;",
        "segments": [
          {
            "text": "SELECT COUNT(DISTINCT region) AS num_regions\n",
            "start": 0.8,
            "end": 3.73,
            "charInterval": 70
          },
          {
            "text": "FROM   customers;",
            "start": 3.73,
            "end": 4.84,
            "charInterval": 70
          }
        ],
        "scrollAt": 5.14
      }
    },
    {
      "id": 13,
      "prompt": "<strong>[Hard] Single-Pass Revenue Segmentation</strong><br/>Without using GROUP BY or multiple queries, write a conditional aggregation from <code>orders</code> returning <code>shipped_rev</code> (total for 'Shipped' orders) and <code>processing_rev</code> (total for 'Processing' orders) using <code>SUM(CASE WHEN...)</code>.",
      "referenceSql": "SELECT SUM(CASE WHEN status = 'Shipped' THEN total_amount ELSE 0 END) AS shipped_rev,\n       SUM(CASE WHEN status = 'Processing' THEN total_amount ELSE 0 END) AS processing_rev\nFROM   orders;",
      "questionAudio": "Day05/New_Day5Question13.mp3",
      "solutionAudio": "Day05/New_Day5Question13sol.mp3",
      "solutionEvents": {
        "code": "SELECT SUM(CASE WHEN status = 'Shipped' THEN total_amount ELSE 0 END) AS shipped_rev,\n       SUM(CASE WHEN status = 'Processing' THEN total_amount ELSE 0 END) AS processing_rev\nFROM   orders;",
        "segments": [
          {
            "text": "SELECT SUM(CASE WHEN status = 'Shipped' THEN total_amount ELSE 0 END) AS shipped_rev,\n",
            "start": 0.8,
            "end": 7.38,
            "charInterval": 80
          },
          {
            "text": "       SUM(CASE WHEN status = 'Processing' THEN total_amount ELSE 0 END) AS processing_rev\n",
            "start": 7.38,
            "end": 14.35,
            "charInterval": 80
          },
          {
            "text": "FROM   orders;",
            "start": 14.35,
            "end": 15.42,
            "charInterval": 80
          }
        ],
        "scrollAt": 15.72
      }
    },
    {
      "id": 14,
      "prompt": "<strong>[Hard] Volume-Weighted Average Price (WASP)</strong><br/>Calculate the volume-weighted average price across all ordered items: <code>SUM(unit_price * qty) * 1.0 / SUM(qty)</code>. Round the final result to 2 decimal places and alias as <code>weighted_avg_price</code>.",
      "referenceSql": "SELECT ROUND(SUM(unit_price * qty) * 1.0 / SUM(qty), 2) AS weighted_avg_price\nFROM   order_items;",
      "questionAudio": "Day05/New_Day5Question14.mp3",
      "solutionAudio": "Day05/New_Day5Question14sol.mp3",
      "solutionEvents": {
        "code": "SELECT ROUND(SUM(unit_price * qty) * 1.0 / SUM(qty), 2) AS weighted_avg_price\nFROM   order_items;",
        "segments": [
          {
            "text": "SELECT ROUND(SUM(unit_price * qty) * 1.0 / SUM(qty), 2) AS weighted_avg_price\n",
            "start": 0.8,
            "end": 9.13,
            "charInterval": 110
          },
          {
            "text": "FROM   order_items;",
            "start": 9.13,
            "end": 11.16,
            "charInterval": 110
          }
        ],
        "scrollAt": 11.46
      }
    },
    {
      "id": 15,
      "prompt": "<strong>[Medium] Department Staff Concatenation</strong><br/>Data reporting requires a single concatenated list of employee names. Use <code>GROUP_CONCAT</code> on <code>first_name</code> with a comma separator (<code>', '</code>) from <code>employees</code>, aliased as <code>all_names</code>.",
      "referenceSql": "SELECT GROUP_CONCAT(first_name, ', ') AS all_names\nFROM   employees;",
      "questionAudio": "Day05/New_Day5Question15.mp3",
      "solutionAudio": "Day05/New_Day5Question15sol.mp3",
      "solutionEvents": {
        "code": "SELECT GROUP_CONCAT(first_name, ', ') AS all_names\nFROM   employees;",
        "segments": [
          {
            "text": "SELECT GROUP_CONCAT(first_name, ', ') AS all_names\n",
            "start": 0.8,
            "end": 5.81,
            "charInterval": 100
          },
          {
            "text": "FROM   employees;",
            "start": 5.81,
            "end": 7.48,
            "charInterval": 100
          }
        ],
        "scrollAt": 7.78
      }
    }
  ],
  "testQuestions": [
    {
      "id": 1,
      "prompt": "Count the total number of rows in the <code>employees</code> table.",
      "ref": "SELECT COUNT(*) FROM employees;"
    },
    {
      "id": 2,
      "prompt": "Find the average salary from <code>employees</code>.",
      "ref": "SELECT AVG(salary) FROM employees;"
    },
    {
      "id": 3,
      "prompt": "Find the total <code>total_amount</code> from all orders.",
      "ref": "SELECT SUM(total_amount) FROM orders;"
    },
    {
      "id": 4,
      "prompt": "Find the minimum and maximum <code>unit_price</code> from <code>products</code>.",
      "ref": "SELECT MIN(unit_price) AS min_price, MAX(unit_price) AS max_price FROM products;"
    },
    {
      "id": 5,
      "prompt": "Count the number of employees WITH a commission (non-NULL).",
      "ref": "SELECT COUNT(commission) AS has_commission FROM employees;"
    },
    {
      "id": 6,
      "prompt": "Count the number of employees WITHOUT a commission (NULL commission).",
      "ref": "SELECT COUNT(*) - COUNT(commission) AS no_commission FROM employees;"
    },
    {
      "id": 7,
      "prompt": "Find the average salary of active employees (<code>is_active = 1</code>).",
      "ref": "SELECT AVG(salary) FROM employees WHERE is_active = 1;"
    },
    {
      "id": 8,
      "prompt": "Find the total stock value (SUM of stock_qty * unit_price) across all products.",
      "ref": "SELECT SUM(stock_qty * unit_price) AS total_stock_value FROM products;"
    },
    {
      "id": 9,
      "prompt": "Find the earliest <code>order_date</code> and the latest <code>order_date</code> from <code>orders</code>.",
      "ref": "SELECT MIN(order_date) AS earliest, MAX(order_date) AS latest FROM orders;"
    },
    {
      "id": 10,
      "prompt": "Find the average commission, treating NULLs as 0.",
      "ref": "SELECT AVG(COALESCE(commission, 0)) AS avg_commission FROM employees;"
    },
    {
      "id": 11,
      "prompt": "Count the number of distinct <code>region</code> values in <code>customers</code>.",
      "ref": "SELECT COUNT(DISTINCT region) FROM customers;"
    },
    {
      "id": 12,
      "prompt": "Count how many orders have a <code>shipped_date</code> recorded (not NULL).",
      "ref": "SELECT COUNT(shipped_date) AS shipped_count FROM orders;"
    },
    {
      "id": 13,
      "prompt": "Find the maximum <code>total_amount</code> from orders with status 'Shipped'.",
      "ref": "SELECT MAX(total_amount) FROM orders WHERE status = 'Shipped';"
    },
    {
      "id": 14,
      "prompt": "Find the minimum salary in the Engineering department (department_id = 10).",
      "ref": "SELECT MIN(salary) FROM employees WHERE department_id = 10;"
    },
    {
      "id": 15,
      "prompt": "Find the total sum of all <code>commission</code> values (ignoring NULLs).",
      "ref": "SELECT SUM(commission) FROM employees;"
    },
    {
      "id": 16,
      "prompt": "Find the average unit_price of products in category_id = 5.",
      "ref": "SELECT AVG(unit_price) FROM products WHERE category_id = 5;"
    },
    {
      "id": 17,
      "prompt": "Count the number of products with <code>stock_qty</code> greater than 50.",
      "ref": "SELECT COUNT(*) FROM products WHERE stock_qty > 50;"
    },
    {
      "id": 18,
      "prompt": "Find the total salary payroll for employees hired after 2021-01-01.",
      "ref": "SELECT SUM(salary) FROM employees WHERE hire_date > '2021-01-01';"
    },
    {
      "id": 19,
      "prompt": "Find the max and min <code>total_amount</code> among orders placed in 2024.",
      "ref": "SELECT MAX(total_amount), MIN(total_amount) FROM orders WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';"
    },
    {
      "id": 20,
      "prompt": "Find the average number of order items (qty) per product from <code>order_items</code>.",
      "ref": "SELECT AVG(qty) AS avg_qty FROM order_items;"
    },
    {
      "id": 21,
      "prompt": "Count the number of distinct <code>job_title</code> values in <code>employees</code>.",
      "ref": "SELECT COUNT(DISTINCT job_title) FROM employees;"
    },
    {
      "id": 22,
      "prompt": "Find the total revenue from orders placed by customer_id = 1.",
      "ref": "SELECT SUM(total_amount) FROM orders WHERE customer_id = 1;"
    },
    {
      "id": 23,
      "prompt": "Find the average cost_price of products in category_id = 6.",
      "ref": "SELECT AVG(cost_price) FROM products WHERE category_id = 6;"
    },
    {
      "id": 24,
      "prompt": "Find the maximum salary among employees with a commission greater than 5000.",
      "ref": "SELECT MAX(salary) FROM employees WHERE commission > 5000;"
    },
    {
      "id": 25,
      "prompt": "Count all orders and all orders with a shipped_date, and compare (null shipments).",
      "ref": "SELECT COUNT(*) AS total_orders, COUNT(shipped_date) AS shipped_orders FROM orders;"
    }
  ],
  "topics": [
    {
      "id": "topic-1",
      "label": "Topic 1: COUNT, SUM, AVG, MIN, MAX",
      "recordingKey": null
    }
  ]
};
