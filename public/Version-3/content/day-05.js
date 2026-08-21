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
      "html": `
        <h2>📊 Aggregate Functions — Turning Rows into Insights</h2>

        <div class="info-box" id="day05LearningObj">
          <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
            <strong style="color: #0f766e;">🎯 Learning Objective</strong>
          </div>
          <p style="margin: 0; font-size: 0.88rem; line-height: 1.4;">
            Summarize raw transactional rows into executive KPIs (Total Revenue, Active Headcount, Average Order Value) without silent calculation errors caused by <code>NULL</code> values.
          </p>
        </div>

        <!-- ── SECTION 01 ── -->
        <div class="slide-section">
          <h3 class="heading-with-audio" id="day05WhyAgg">
            01. Why Aggregation Matters — From Rows to KPIs
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio01.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </h3>
          <p>Database tables store individual transactions. Business stakeholders need <strong>summary metrics</strong>. Aggregate functions take <strong>N input rows</strong> and collapse them into <strong>1 output metric</strong>.</p>

          <div class="heading-with-audio" id="day05AggRefTable" style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 14px;">
            <small style="flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">The Big 5 Aggregate Functions</small>
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio02.mp3', this)" title="Play narration" style="flex-shrink: 0;">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="db-mock-table-wrap">
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Function</th><th>Purpose</th><th>NULL Handling</th><th>Analyst Use Case</th></tr></thead>
              <tbody>
                <tr><td><code>COUNT(*)</code></td><td>Total row count</td><td>Counts ALL rows (including NULLs)</td><td>Total orders / signups</td></tr>
                <tr><td><code>COUNT(col)</code></td><td>Count populated rows</td><td><strong>Ignores NULLs</strong></td><td>Verified emails / commissions</td></tr>
                <tr><td><code>SUM(col)</code></td><td>Total sum of column</td><td><strong>Ignores NULLs</strong></td><td>Gross revenue / total payroll</td></tr>
                <tr><td><code>AVG(col)</code></td><td>Arithmetic mean</td><td><strong>Ignores NULLs</strong> in divisor</td><td>Average Order Value (AOV)</td></tr>
                <tr><td><code>MIN(col)</code> / <code>MAX(col)</code></td><td>Smallest / Largest value</td><td><strong>Ignores NULLs</strong></td><td>Earliest order / Top salary</td></tr>
              </tbody>
            </table>
          </div>

          <div class="info-box" id="day05FiveAggs">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color: #0f766e;">💡 Core Rule of Thumb</strong>
              <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio03.mp3', this)" title="Play narration" style="flex-shrink: 0;">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p style="margin: 0;"><strong>Every aggregate function ignores NULL values</strong> — except <code>COUNT(*)</code>, which always counts the physical rows.</p>
          </div>
        </div>

        <!-- ── SECTION 02 ── -->
        <div class="slide-section">
          <h3 class="heading-with-audio" id="day05Count">
            02. COUNT — Counting Rows vs Counting Values
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio04.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </h3>
          <p>Always choose your <code>COUNT</code> variant based on what you are measuring:</p>
          <ul style="margin: 6px 0 10px 18px; padding: 0; font-size: 0.85rem; color: #cbd5e1; line-height: 1.5;">
            <li><code>COUNT(*)</code> $\rightarrow$ <strong>Volume:</strong> "How many total records exist?"</li>
            <li><code>COUNT(col)</code> $\rightarrow$ <strong>Completeness:</strong> "How many rows have a value in this column?"</li>
            <li><code>COUNT(DISTINCT col)</code> $\rightarrow$ <strong>Unique Entities:</strong> "How many unique customers/departments?"</li>
          </ul>

          <div class="heading-with-audio" id="day05CountExamples" style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;">
            <small style="flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;">COUNT Variations in Practice</small>
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio05.mp3', this)" title="Play narration" style="flex-shrink: 0;">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <pre id="day05CountCode"><code>-- 1. Total headcount (counts all 15 rows)
SELECT COUNT(*) AS total_employees FROM employees;

-- 2. Count staff with commissions (skips NULLs -> returns 6)
SELECT COUNT(commission) AS commission_earners FROM employees;

-- 3. Count unique departments with active staff
SELECT COUNT(DISTINCT department_id) AS active_depts FROM employees;</code></pre>

          <div class="pro-tip-box" id="day05CountInfo">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color: #b45309;">📊 Data Quality Audit Formula</strong>
              <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio06.mp3', this)" title="Play narration" style="flex-shrink: 0;">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p style="margin: 0;">Find missing/NULL values instantly: <code>COUNT(*) - COUNT(col) = Missing Rows</code>.</p>
          </div>
        </div>

        <!-- ── SECTION 03 ── -->
        <div class="slide-section">
          <h3 class="heading-with-audio" id="day05SumAvg">
            03. SUM & AVG — The Dangerous NULL Denominator Trap
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio07.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </h3>
          <p><code>AVG(col)</code> calculates <code>SUM(col) / COUNT(col)</code>. It does <strong>not</strong> divide by <code>COUNT(*)</code>. If 4 out of 15 employees have NULL commissions, <code>AVG(commission)</code> divides by <strong>11</strong>, not 15.</p>

          <div class="heading-with-audio" id="day05SumAvgCode" style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;">
            <small style="flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;">Comparing Averages With &amp; Without NULLs</small>
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio08.mp3', this)" title="Play narration" style="flex-shrink: 0;">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <pre id="day05SumAvgExample"><code>-- Summary stats across all employees
SELECT SUM(salary) AS payroll,
       AVG(salary) AS avg_sal,
       MIN(salary) AS min_sal,
       MAX(salary) AS max_sal
FROM   employees;

-- Average among commission earners ONLY (divisor = 6)
SELECT AVG(commission) AS avg_earned_commission FROM employees;

-- Average across ALL employees (treat NULL as 0 -> divisor = 15)
SELECT AVG(COALESCE(commission, 0)) AS avg_companywide_commission FROM employees;</code></pre>

          <div class="warn-box" id="day05AvgNullWarn">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color: #b91c1c;">⚠️ Interview Gotcha</strong>
              <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio09.mp3', this)" title="Play narration" style="flex-shrink: 0;">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p style="margin: 0;">When asked for <em>"average bonus across the entire company"</em>, always use <code>AVG(COALESCE(bonus, 0))</code> so employees with zero bonus are included in the denominator.</p>
          </div>
        </div>

        <!-- ── SECTION 04 ── -->
        <div class="slide-section">
          <h3 class="heading-with-audio" id="day05Coalesce">
            04. The COALESCE Safety Net — Inside vs Outside
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio10.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </h3>
          <p>Placing <code>COALESCE</code> <strong>inside</strong> vs <strong>outside</strong> an aggregate solves two completely different business problems:</p>

          <div class="heading-with-audio" id="day05CoalesceCode" style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;">
            <small style="flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;">Inside vs Outside COALESCE</small>
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio11.mp3', this)" title="Play narration" style="flex-shrink: 0;">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <pre id="day05CoalesceExample"><code>-- PATTERN A (Inside): Convert NULLs to 0 before calculating the mean
SELECT AVG(COALESCE(commission, 0)) AS avg_all_staff
FROM   employees;

-- PATTERN B (Outside): Prevent NULL output when query matches 0 rows
SELECT COALESCE(AVG(salary), 0) AS avg_sal_dept99
FROM   employees
WHERE  department_id = 99;   -- empty set -> returns 0 instead of NULL</code></pre>

          <div class="info-box" id="day05CoalesceTip">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color: #0f766e;">💡 Summary: Inside vs Outside</strong>
              <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio12.mp3', this)" title="Play narration" style="flex-shrink: 0;">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p style="margin: 0;"><strong>Inside:</strong> <code>AVG(COALESCE(x, 0))</code> adjusts the average by counting zeroes.<br/>
            <strong>Outside:</strong> <code>COALESCE(SUM(x), 0)</code> ensures dashboard cards show <code>0</code> instead of a blank <code>NULL</code> when filtered to empty results.</p>
          </div>
        </div>

        <!-- ── SECTION 05 ── -->
        <div class="slide-section">
          <h3 class="heading-with-audio" id="day05MinMax">
            05. MIN & MAX — Beyond Numbers (Dates & Text)
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio13.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </h3>
          <p><code>MIN</code> and <code>MAX</code> find boundary values across all SQL data types using natural ordering:</p>
          <ul style="margin: 6px 0 10px 18px; padding: 0; font-size: 0.85rem; color: #cbd5e1; line-height: 1.5;">
            <li><strong>Numeric:</strong> Smallest and largest amounts ($/₹).</li>
            <li><strong>Dates:</strong> <code>MIN</code> = Earliest date; <code>MAX</code> = Most recent date.</li>
            <li><strong>Strings:</strong> Alphabetical first ('A...') and last ('Z...').</li>
          </ul>

          <div class="heading-with-audio" id="day05MinMaxCode" style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;">
            <small style="flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;">MIN/MAX Across Types</small>
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio14.mp3', this)" title="Play narration" style="flex-shrink: 0;">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <pre id="day05MinMaxExample"><code>-- Numbers: Price boundaries
SELECT MIN(unit_price) AS cheapest, MAX(unit_price) AS priciest FROM products;

-- Dates: Tenure range (earliest & latest hires)
SELECT MIN(hire_date) AS oldest_hire, MAX(hire_date) AS newest_hire FROM employees;

-- Strings: Alphabetical boundaries
SELECT MIN(first_name) AS first_name_a, MAX(first_name) AS last_name_z FROM customers;</code></pre>

          <div class="pro-tip-box" id="day05MinMaxTip">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color: #b45309;">💡 ISO-8601 Date Standard</strong>
              <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio15.mp3', this)" title="Play narration" style="flex-shrink: 0;">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p style="margin: 0;">Because dates are stored in <code>YYYY-MM-DD</code> format, alphabetical sorting matches chronological order perfectly.</p>
          </div>
        </div>

        <!-- ── SECTION 06 ── -->
        <div class="slide-section">
          <h3 class="heading-with-audio" id="day05Stacking">
            06. Stacking Aggregates & Expressions in One SELECT
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio16.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </h3>
          <p>Stack multiple aggregates in a single <code>SELECT</code> to generate a complete executive dashboard in a <strong>single table scan</strong>. You can also place mathematical expressions inside aggregate functions.</p>

          <div class="heading-with-audio" id="day05StackCode" style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;">
            <small style="flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;">One-Row Executive KPI Dashboard</small>
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio17.mp3', this)" title="Play narration" style="flex-shrink: 0;">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <pre id="day05StackExample"><code>-- Executive Overview Dashboard
SELECT COUNT(*)                          AS total_headcount,
       SUM(salary)                       AS total_payroll,
       ROUND(AVG(salary), 2)            AS avg_salary,
       MIN(hire_date)                    AS company_founded,
       SUM(stock_qty * unit_price)       AS total_inventory_value
FROM   employees, products;</code></pre>

          <div class="info-box" id="day05StackInfo">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color: #0f766e;">💡 Row-Level Expression Evaluation</strong>
              <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio18.mp3', this)" title="Play narration" style="flex-shrink: 0;">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p style="margin: 0;">In <code>SUM(stock_qty * unit_price)</code>, SQL multiplies the quantity and price for each row first, then sums the calculated results.</p>
          </div>
        </div>

        <!-- ── SECTION 07 ── -->
        <div class="slide-section">
          <h3 class="heading-with-audio" id="day05NullDeep">
            07. NULL Deep Dive — Aggregation Edge Cases Cheat Sheet
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio19.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </h3>
          <p>Master these 6 edge cases to ace technical interviews and prevent reporting bugs:</p>

          <div class="heading-with-audio" id="day05NullBehavTable" style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;">
            <small style="flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;">Aggregation &amp; NULL Truth Matrix</small>
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio20.mp3', this)" title="Play narration" style="flex-shrink: 0;">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="db-mock-table-wrap">
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Scenario</th><th>Function</th><th>Result</th><th>Explanation</th></tr></thead>
              <tbody>
                <tr><td>Table has 15 rows (4 NULLs)</td><td><code>COUNT(*)</code></td><td><strong>15</strong></td><td>Counts rows regardless of content</td></tr>
                <tr><td>Table has 15 rows (4 NULLs)</td><td><code>COUNT(commission)</code></td><td><strong>11</strong></td><td>Skips 4 NULL entries</td></tr>
                <tr><td>Table has 15 rows (4 NULLs)</td><td><code>AVG(commission)</code></td><td><strong>SUM / 11</strong></td><td>Divides only by populated entries</td></tr>
                <tr><td>Column is 100% NULL</td><td><code>SUM(col)</code> / <code>AVG(col)</code></td><td><strong>NULL</strong></td><td>No valid numeric data to aggregate</td></tr>
                <tr><td>Empty result set (0 rows matched)</td><td><code>COUNT(*)</code></td><td><strong>0</strong></td><td>Zero rows counted</td></tr>
                <tr><td>Empty result set (0 rows matched)</td><td><code>SUM(col)</code> / <code>AVG(col)</code></td><td><strong>NULL</strong></td><td>Nothing exists to sum or average</td></tr>
              </tbody>
            </table>
          </div>

          <div class="heading-with-audio" id="day05NullDemoCode" style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; margin-top: 10px;">
            <small style="flex: 1; color: #64748b; font-size: 0.75rem; font-weight: 600;">Live Demonstration Query</small>
            <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio21.mp3', this)" title="Play narration" style="flex-shrink: 0;">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <pre id="day05NullDemoExample"><code>-- Side-by-side comparison of NULL handling
SELECT COUNT(*)                    AS total_rows,
       COUNT(commission)            AS count_populated,
       AVG(commission)              AS avg_earners_only,
       AVG(COALESCE(commission,0))  AS avg_all_employees,
       COALESCE(SUM(commission),0)  AS safe_total_payout
FROM   employees;</code></pre>

          <div class="pro-tip-box" id="day05NullTip">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color: #b45309;">💡 Pro-Tip: Missing Value Audit</strong>
              <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio22.mp3', this)" title="Play narration" style="flex-shrink: 0;">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p style="margin: 0;">Always run <code>COUNT(*) - COUNT(col)</code> during initial EDA (Exploratory Data Analysis) to measure dataset cleanliness.</p>
          </div>

          <div class="warn-box" id="day05DistinctWarn">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color: #b91c1c;">⚠️ Caution with SUM(DISTINCT col)</strong>
              <button class="audio-play-btn" onclick="playAudio('Day05/New_Day5Part1audio23.mp3', this)" title="Play narration" style="flex-shrink: 0;">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p style="margin: 0;"><code>COUNT(DISTINCT col)</code> is essential for counting unique users. But <code>SUM(DISTINCT salary)</code> will discard legitimate identical salaries (e.g. two engineers making ₹80k), corrupting financial totals.</p>
          </div>
        </div>

        <!-- ── SECTION 08: INTERVIEW Q&A ── -->
        <div class="slide-section">
          <div class="interview-box">
            <h4 style="margin: 0 0 12px 0; font-size: 1rem; color: #38bdf8; display: flex; align-items: center; gap: 6px;">
              <span>🎯</span> Top 25 SQL Interview Q&amp;A — Aggregate Functions
            </h4>

            <p><strong>Q1: What is the difference between <code>COUNT(*)</code> and <code>COUNT(column)</code>?</strong></p>
            <p><em>A: <code>COUNT(*)</code> counts every physical row including rows with NULLs. <code>COUNT(column)</code> counts only rows where that specific column is non-NULL. They differ only when the column contains NULL values.</em></p>

            <p><strong>Q2: What does <code>COUNT(DISTINCT col)</code> do, and when is it used?</strong></p>
            <p><em>A: It counts the number of unique, non-NULL values in a column. Common use cases include counting unique active customers, distinct product categories, or unique login dates.</em></p>

            <p><strong>Q3: How does <code>AVG(col)</code> handle NULL values?</strong></p>
            <p><em>A: <code>AVG</code> ignores NULLs in both the numerator and denominator: <code>AVG(col) = SUM(col) / COUNT(col)</code>. To include NULLs as zeros in the average, use <code>AVG(COALESCE(col, 0))</code>.</em></p>

            <p><strong>Q4: Why can't you use an aggregate function inside a WHERE clause?</strong></p>
            <p><em>A: Due to SQL logical execution order: <code>WHERE</code> (Step 3) filters rows before aggregation (Step 4) happens. To filter aggregated results, use <code>HAVING</code> (Step 5) or wrap the aggregate in a subquery.</em></p>

            <p><strong>Q5: What does <code>SUM()</code> return if all values in the column are NULL?</strong></p>
            <p><em>A: It returns <code>NULL</code>, not <code>0</code>. To safely return zero for dashboards, wrap the result with <code>COALESCE(SUM(col), 0)</code>.</em></p>

            <p><strong>Q6: How do <code>MIN()</code> and <code>MAX()</code> work on TEXT and DATE columns?</strong></p>
            <p><em>A: They use natural sorting order. For TEXT, they return alphabetical first and last ('A' to 'Z'). For ISO-8601 dates (<code>YYYY-MM-DD</code>), they return the earliest and latest dates.</em></p>

            <p><strong>Q7: Can you place mathematical expressions inside aggregate functions?</strong></p>
            <p><em>A: Yes. Aggregates evaluate the inner expression row-by-row first, then aggregate. For example, <code>SUM(qty * unit_price)</code> computes line totals before calculating gross inventory value.</em></p>

            <p><strong>Q8: What is the risk of using <code>SUM(DISTINCT salary)</code>?</strong></p>
            <p><em>A: It deduplicates values before summing. If multiple employees earn the exact same salary, duplicate amounts are dropped, leading to severely underreported financial figures.</em></p>

            <p><strong>Q9: Why does <code>SELECT department_id, COUNT(*) FROM employees;</code> fail without GROUP BY?</strong></p>
            <p><em>A: Standard SQL disallows mixing non-aggregated columns with aggregate functions unless all non-aggregated columns appear in a <code>GROUP BY</code> clause.</em></p>

            <p><strong>Q10: What is the performance cost of <code>COUNT(*)</code> on large tables?</strong></p>
            <p><em>A: In transactional engines with MVCC (like PostgreSQL or MySQL InnoDB), <code>COUNT(*)</code> performs a full index or table scan. For large tables, maintain pre-computed summary tables or use table metadata.</em></p>

            <p><strong>Q11: How do you calculate a weighted average in SQL?</strong></p>
            <p><em>A: Use <code>SUM(value * weight) * 1.0 / NULLIF(SUM(weight), 0)</code>. Always guard the denominator with <code>NULLIF</code> to prevent divide-by-zero crashes on empty sets.</em></p>

            <p><strong>Q12: What do <code>GROUP_CONCAT</code> (SQLite/MySQL) and <code>STRING_AGG</code> (PostgreSQL) do?</strong></p>
            <p><em>A: They concatenate text values across rows into a single delimited string (e.g., combining employee names into a comma-separated list per department).</em></p>

            <p><strong>Q13: Can you nest aggregate functions like <code>MAX(COUNT(*))</code>?</strong></p>
            <p><em>A: No, SQL does not allow direct nesting of aggregates. You must compute the inner aggregate inside a subquery or CTE first, then aggregate over that result.</em></p>

            <p><strong>Q14: What is the result of <code>COUNT(*)</code> versus <code>AVG()</code> over an empty table?</strong></p>
            <p><em>A: <code>COUNT(*)</code> returns <code>0</code> because counting zero rows is well-defined. <code>AVG()</code>, <code>SUM()</code>, <code>MIN()</code>, and <code>MAX()</code> all return <code>NULL</code>.</em></p>

            <p><strong>Q15: How does conditional aggregation work with <code>CASE WHEN</code>?</strong></p>
            <p><em>A: You place a <code>CASE</code> expression inside an aggregate: <code>SUM(CASE WHEN status = 'Shipped' THEN amount ELSE 0 END)</code>. This pivots multiple row categories into column metrics in a single query.</em></p>

            <p><strong>Q16: What is the difference between an aggregate function and a window function?</strong></p>
            <p><em>A: Aggregate functions collapse multiple rows into one summary row. Window functions compute summary metrics while preserving each original row using the <code>OVER()</code> clause.</em></p>

            <p><strong>Q17: How do you find the second highest salary using aggregates?</strong></p>
            <p><em>A: Use a subquery: <code>SELECT MAX(salary) FROM employees WHERE salary &lt; (SELECT MAX(salary) FROM employees);</code>. Alternatively, use <code>DENSE_RANK()</code> window functions.</em></p>

            <p><strong>Q18: Does <code>COUNT(col)</code> count empty string values (<code>''</code>)?</strong></p>
            <p><em>A: Yes. An empty string is a valid text value, not a <code>NULL</code>. <code>COUNT(col)</code> only skips genuine <code>NULL</code> entries.</em></p>

            <p><strong>Q19: What is the fastest way to check if a table has any rows?</strong></p>
            <p><em>A: Use <code>SELECT 1 FROM table LIMIT 1</code> or <code>WHERE EXISTS (...)</code>. Avoid <code>COUNT(*) &gt; 0</code> because it forces a full table scan.</em></p>

            <p><strong>Q20: How do <code>MIN()</code> and <code>MAX()</code> treat NULL values?</strong></p>
            <p><em>A: They completely ignore <code>NULL</code> values and evaluate only non-NULL entries. If all rows are NULL, both functions return <code>NULL</code>.</em></p>

            <p><strong>Q21: Why does <code>AVG(col)</code> equal <code>SUM(col) / COUNT(col)</code>, but not <code>SUM(col) / COUNT(*)</code>?</strong></p>
            <p><em>A: Because both <code>AVG</code> and <code>COUNT(col)</code> ignore NULLs. <code>COUNT(*)</code> counts all rows including NULLs, which would artificially lower the calculated average.</em></p>

            <p><strong>Q22: How is the median calculated in standard SQL?</strong></p>
            <p><em>A: SQLite has no native <code>MEDIAN()</code> aggregate. Standard SQL uses <code>PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY col)</code>, or window ranking functions like <code>ROW_NUMBER()</code>.</em></p>

            <p><strong>Q23: Can aggregate functions run without a GROUP BY clause?</strong></p>
            <p><em>A: Yes. Without <code>GROUP BY</code>, the entire table is treated as a single group, returning exactly one summary row (e.g. <code>SELECT COUNT(*), AVG(salary) FROM employees;</code>).</em></p>

            <p><strong>Q24: Can you use multiple columns inside <code>COUNT(DISTINCT a, b)</code>?</strong></p>
            <p><em>A: Most standard SQL engines reject multiple arguments in <code>COUNT(DISTINCT)</code>. Instead, concatenate the columns: <code>COUNT(DISTINCT col1 || '-' || col2)</code> or use a subquery.</em></p>

            <p><strong>Q25: How do you compute a percentage of the total in SQL?</strong></p>
            <p><em>A: Divide the group sum by the grand total: <code>SUM(salary) * 100.0 / (SELECT SUM(salary) FROM employees)</code> or using window functions: <code>SUM(salary) * 100.0 / SUM(SUM(salary)) OVER ()</code>.</em></p>
          </div>
        </div>
      `
    }
  ],
  "practiceQuestions": [
    {
      "id": 1,
      "prompt": "<strong>Task: Payroll Summary</strong><br/>Find the total payroll (<code>SUM</code>), average salary (<code>AVG</code>), minimum, and maximum salary from the <code>employees</code> table.",
      "referenceSql": "SELECT SUM(salary) AS total_payroll, AVG(salary) AS avg_salary, MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM employees;",
      "questionAudio": "Day05/New_Day5Question01.mp3",
      "solutionAudio": "Day05/New_Day5Question01sol.mp3"
    },
    {
      "id": 2,
      "prompt": "<strong>Task: Active Employee Count</strong><br/>Count how many employees are currently active (<code>is_active = 1</code>).",
      "referenceSql": "SELECT COUNT(*) AS active_employees FROM employees WHERE is_active = 1;",
      "questionAudio": "Day05/New_Day5Question02.mp3",
      "solutionAudio": "Day05/New_Day5Question02sol.mp3"
    },
    {
      "id": 3,
      "prompt": "<strong>Task: Product Price Range</strong><br/>Find the cheapest (<code>MIN</code>) and most expensive (<code>MAX</code>) <code>unit_price</code> from the <code>products</code> table.",
      "referenceSql": "SELECT MIN(unit_price) AS cheapest, MAX(unit_price) AS most_expensive FROM products;",
      "questionAudio": "Day05/New_Day5Question03.mp3",
      "solutionAudio": "Day05/New_Day5Question03sol.mp3"
    },
    {
      "id": 4,
      "prompt": "<strong>Task: Commission Coverage</strong><br/>How many employees have a commission assigned? How many do NOT? Use <code>COUNT(*)</code> and <code>COUNT(commission)</code> in one query.",
      "referenceSql": "SELECT COUNT(*) AS total, COUNT(commission) AS has_commission, COUNT(*) - COUNT(commission) AS no_commission FROM employees;",
      "questionAudio": "Day05/New_Day5Question04.mp3",
      "solutionAudio": "Day05/New_Day5Question04sol.mp3"
    },
    {
      "id": 5,
      "prompt": "<strong>Task: Shipped Revenue</strong><br/>Calculate the total <code>total_amount</code> from orders where status = 'Shipped'.",
      "referenceSql": "SELECT SUM(total_amount) AS shipped_revenue FROM orders WHERE status = 'Shipped';",
      "questionAudio": "Day05/New_Day5Question05.mp3",
      "solutionAudio": "Day05/New_Day5Question05sol.mp3"
    },
    {
      "id": 6,
      "prompt": "<strong>Task: Distinct Department Count</strong><br/>Count how many distinct <code>department_id</code> values appear in the <code>employees</code> table.",
      "referenceSql": "SELECT COUNT(DISTINCT department_id) AS num_departments FROM employees;",
      "questionAudio": "Day05/New_Day5Question06.mp3",
      "solutionAudio": "Day05/New_Day5Question06sol.mp3"
    },
    {
      "id": 7,
      "prompt": "<strong>Task: Inventory Value</strong><br/>Compute the total inventory value as <code>SUM(stock_qty * unit_price)</code> across all products.",
      "referenceSql": "SELECT SUM(stock_qty * unit_price) AS inventory_value FROM products;",
      "questionAudio": "Day05/New_Day5Question07.mp3",
      "solutionAudio": "Day05/New_Day5Question07sol.mp3"
    },
    {
      "id": 8,
      "prompt": "<strong>Task: Average Commission Two Ways</strong><br/>Show both <code>AVG(commission)</code> (over non-NULL only) and <code>AVG(COALESCE(commission, 0))</code> (treating NULL as 0) side by side.",
      "referenceSql": "SELECT AVG(commission) AS avg_non_null, AVG(COALESCE(commission, 0)) AS avg_all FROM employees;",
      "questionAudio": "Day05/New_Day5Question08.mp3",
      "solutionAudio": "Day05/New_Day5Question08sol.mp3"
    },
    {
      "id": 9,
      "prompt": "<strong>Task: Premium Product Count</strong><br/>Count how many products have <code>unit_price &gt; 5000</code>.",
      "referenceSql": "SELECT COUNT(*) AS premium_count FROM products WHERE unit_price > 5000;",
      "questionAudio": "Day05/New_Day5Question09.mp3",
      "solutionAudio": "Day05/New_Day5Question09sol.mp3"
    },
    {
      "id": 10,
      "prompt": "<strong>Task: Safe Average Over Empty Set</strong><br/>Compute <code>AVG(salary)</code> for employees in <code>department_id = 99</code> (which is empty), wrapping the result with COALESCE to show 0 instead of NULL.",
      "referenceSql": "SELECT COALESCE(AVG(salary), 0) AS avg_salary FROM employees WHERE department_id = 99;",
      "questionAudio": "Day05/New_Day5Question10.mp3",
      "solutionAudio": "Day05/New_Day5Question10sol.mp3"
    },
    {
      "id": 11,
      "prompt": "<strong>Task: Highest Order Total</strong><br/>Find the maximum <code>total_amount</code> across all orders.",
      "referenceSql": "SELECT MAX(total_amount) AS largest_order FROM orders;",
      "questionAudio": "Day05/New_Day5Question11.mp3",
      "solutionAudio": "Day05/New_Day5Question11sol.mp3"
    },
    {
      "id": 12,
      "prompt": "<strong>Task: Distinct Regions</strong><br/>Count how many distinct <code>region</code> values exist in the <code>customers</code> table.",
      "referenceSql": "SELECT COUNT(DISTINCT region) AS num_regions FROM customers;",
      "questionAudio": "Day05/New_Day5Question12.mp3",
      "solutionAudio": "Day05/New_Day5Question12sol.mp3"
    },
    {
      "id": 13,
      "prompt": "<strong>Task: Conditional Revenue Split</strong><br/>In a single query, compute the total revenue for Shipped orders and the total revenue for Processing orders using <code>SUM(CASE WHEN...)</code>.",
      "referenceSql": "SELECT SUM(CASE WHEN status = 'Shipped' THEN total_amount ELSE 0 END) AS shipped_rev, SUM(CASE WHEN status = 'Processing' THEN total_amount ELSE 0 END) AS processing_rev FROM orders;",
      "questionAudio": "Day05/New_Day5Question13.mp3",
      "solutionAudio": "Day05/New_Day5Question13sol.mp3"
    },
    {
      "id": 14,
      "prompt": "<strong>Task: Weighted Average Price</strong><br/>Compute the weighted average unit price across all order items, where the weight is the quantity ordered: <code>SUM(unit_price * qty) * 1.0 / SUM(qty)</code>.",
      "referenceSql": "SELECT ROUND(SUM(unit_price * qty) * 1.0 / SUM(qty), 2) AS weighted_avg_price FROM order_items;",
      "questionAudio": "Day05/New_Day5Question14.mp3",
      "solutionAudio": "Day05/New_Day5Question14sol.mp3"
    },
    {
      "id": 15,
      "prompt": "<strong>Task: Employee Names Concatenated</strong><br/>Use <code>GROUP_CONCAT</code> to produce a single comma-separated string of all employee <code>first_name</code> values from the <code>employees</code> table.",
      "referenceSql": "SELECT GROUP_CONCAT(first_name, ', ') AS all_names FROM employees;",
      "questionAudio": "Day05/New_Day5Question15.mp3",
      "solutionAudio": "Day05/New_Day5Question15sol.mp3"
    }
  ],
  "testQuestions": [
    { "id": 1, "prompt": "Count the total number of rows in the <code>employees</code> table.", "ref": "SELECT COUNT(*) FROM employees;" },
    { "id": 2, "prompt": "Find the average salary from <code>employees</code>.", "ref": "SELECT AVG(salary) FROM employees;" },
    { "id": 3, "prompt": "Find the total <code>total_amount</code> from all orders.", "ref": "SELECT SUM(total_amount) FROM orders;" },
    { "id": 4, "prompt": "Find the minimum and maximum <code>unit_price</code> from <code>products</code>.", "ref": "SELECT MIN(unit_price) AS min_price, MAX(unit_price) AS max_price FROM products;" },
    { "id": 5, "prompt": "Count the number of employees WITH a commission (non-NULL).", "ref": "SELECT COUNT(commission) AS has_commission FROM employees;" },
    { "id": 6, "prompt": "Count the number of employees WITHOUT a commission (NULL commission).", "ref": "SELECT COUNT(*) - COUNT(commission) AS no_commission FROM employees;" },
    { "id": 7, "prompt": "Find the average salary of active employees (<code>is_active = 1</code>).", "ref": "SELECT AVG(salary) FROM employees WHERE is_active = 1;" },
    { "id": 8, "prompt": "Find the total stock value (SUM of stock_qty * unit_price) across all products.", "ref": "SELECT SUM(stock_qty * unit_price) AS total_stock_value FROM products;" },
    { "id": 9, "prompt": "Find the earliest <code>order_date</code> and the latest <code>order_date</code> from <code>orders</code>.", "ref": "SELECT MIN(order_date) AS earliest, MAX(order_date) AS latest FROM orders;" },
    { "id": 10, "prompt": "Find the average commission, treating NULLs as 0.", "ref": "SELECT AVG(COALESCE(commission, 0)) AS avg_commission FROM employees;" },
    { "id": 11, "prompt": "Count the number of distinct <code>region</code> values in <code>customers</code>.", "ref": "SELECT COUNT(DISTINCT region) FROM customers;" },
    { "id": 12, "prompt": "Count how many orders have a <code>shipped_date</code> recorded (not NULL).", "ref": "SELECT COUNT(shipped_date) AS shipped_count FROM orders;" },
    { "id": 13, "prompt": "Find the maximum <code>total_amount</code> from orders with status 'Shipped'.", "ref": "SELECT MAX(total_amount) FROM orders WHERE status = 'Shipped';" },
    { "id": 14, "prompt": "Find the minimum salary in the Engineering department (department_id = 10).", "ref": "SELECT MIN(salary) FROM employees WHERE department_id = 10;" },
    { "id": 15, "prompt": "Find the total sum of all <code>commission</code> values (ignoring NULLs).", "ref": "SELECT SUM(commission) FROM employees;" },
    { "id": 16, "prompt": "Find the average unit_price of products in category_id = 5.", "ref": "SELECT AVG(unit_price) FROM products WHERE category_id = 5;" },
    { "id": 17, "prompt": "Count the number of products with <code>stock_qty</code> greater than 50.", "ref": "SELECT COUNT(*) FROM products WHERE stock_qty > 50;" },
    { "id": 18, "prompt": "Find the total salary payroll for employees hired after 2021-01-01.", "ref": "SELECT SUM(salary) FROM employees WHERE hire_date > '2021-01-01';" },
    { "id": 19, "prompt": "Find the max and min <code>total_amount</code> among orders placed in 2024.", "ref": "SELECT MAX(total_amount), MIN(total_amount) FROM orders WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';" },
    { "id": 20, "prompt": "Find the average number of order items (qty) per product from <code>order_items</code>.", "ref": "SELECT AVG(qty) AS avg_qty FROM order_items;" },
    { "id": 21, "prompt": "Count the number of distinct <code>job_title</code> values in <code>employees</code>.", "ref": "SELECT COUNT(DISTINCT job_title) FROM employees;" },
    { "id": 22, "prompt": "Find the total revenue from orders placed by customer_id = 1.", "ref": "SELECT SUM(total_amount) FROM orders WHERE customer_id = 1;" },
    { "id": 23, "prompt": "Find the average cost_price of products in category_id = 6.", "ref": "SELECT AVG(cost_price) FROM products WHERE category_id = 6;" },
    { "id": 24, "prompt": "Find the maximum salary among employees with a commission greater than 5000.", "ref": "SELECT MAX(salary) FROM employees WHERE commission > 5000;" },
    { "id": 25, "prompt": "Count all orders and all orders with a shipped_date, and compare (null shipments).", "ref": "SELECT COUNT(*) AS total_orders, COUNT(shipped_date) AS shipped_orders FROM orders;" }
  ],
  "topics": [
    { "id": "topic-1", "label": "Topic 1: COUNT, SUM, AVG, MIN, MAX", "recordingKey": null }
  ]
};
