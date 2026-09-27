// Day 08 — Date & Time Functions: ISO-8601, strftime & Temporal Analytics
if (!window.COURSE_CONTENT) window.COURSE_CONTENT = {};
window.COURSE_CONTENT['day08'] = {
  "day": 8,
  "title": "Date & Time Functions",
  "db": "retail",
  "emoji": "📅",
  "slides": [
    {
      "title": "Date & Time Functions — Temporal Analytics in SQL",
      "duration": "8:15",
      "html": `<h2>📅 Date &amp; Time Functions — Temporal Analytics</h2>

        <!-- ── Section 01: Temporal Data Storage ── -->
        <div class="slide-section" id="day08StorageSection">
          <h3 class="heading-with-audio" id="day08Storage">
            01. Date Storage in SQL &amp; SQLite
          </h3>
          <p>Relational databases store timestamps according to standard ISO-8601 formatting: <code>YYYY-MM-DD</code> for calendar dates and <code>YYYY-MM-DD HH:MM:SS</code> for timestamps. SQLite stores dates as TEXT strings and provides specialized functions to parse, calculate, and format dates reliably.</p>
        </div>

        <div class="slide-section" id="day08StorageInfoSection">
          <div class="info-box" id="day08StorageInfo">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color:var(--ink-teal); flex: 1;">ℹ️ Cross-Engine Date Types:</strong>
            </div>
            <p style="margin: 0;"><strong>MySQL:</strong> <code>DATE</code>, <code>DATETIME</code>, <code>TIMESTAMP</code>.<br/><strong>PostgreSQL:</strong> <code>DATE</code>, <code>TIMESTAMP WITH TIME ZONE</code>.<br/><strong>SQLite:</strong> ISO TEXT strings manipulated via <code>strftime()</code>, <code>date()</code>, and <code>julianday()</code>.</p>
          </div>
        </div>

        <!-- ── Section 02: Current Date & Time ── -->
        <div class="slide-section" id="day08CurrentSection">
          <h3 class="heading-with-audio" id="day08Current">
            02. Getting Current Date &amp; Time
          </h3>
          <p>Retrieve dynamic system timestamps using standard SQLite date functions:</p>
        </div>

        <div class="slide-section" id="day08CurrentExamplesSection">
          <div class="heading-with-audio" style="display: flex; align-items: center; gap: 8px; margin-bottom: 6px; margin-top: 4px;">
            <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">Current Timestamps &amp; Days Ago</h4>
          </div>
          <div class="code-block-container" id="day08CurrentExamples">
            <div class="code-subblock" id="day08CurrentQuery1">
              <pre><code><span class="code-comment">-- 1. System date, time and full timestamp</span>
<span class="kw">SELECT</span> date('now')     <span class="kw">AS</span> today_date,
       time('now')     <span class="kw">AS</span> current_time,
       datetime('now') <span class="kw">AS</span> current_timestamp;</code></pre>
            </div>
            <div class="code-subblock" id="day08CurrentQuery2">
              <pre><code><span class="code-comment">-- 2. Elapsed days since order was placed</span>
<span class="kw">SELECT</span> order_id,
       order_date,
       CAST(julianday('now') - julianday(order_date) <span class="kw">AS</span> INTEGER) <span class="kw">AS</span> days_since_order
<span class="kw">FROM</span>   orders;</code></pre>
            </div>
          </div>
        </div>

        <!-- ── Section 03: Date Differences (julianday) ── -->
        <div class="slide-section" id="day08DiffSection">
          <h3 class="heading-with-audio" id="day08Diff">
            03. Calculating Intervals with julianday()
          </h3>
          <p>In SQLite, <code>julianday()</code> converts any ISO date into continuous day counts since 4714 BC. Subtracting two Julian day numbers yields the exact elapsed days between them.</p>
        </div>

        <div class="slide-section" id="day08DiffExamplesSection">
          <div class="heading-with-audio" style="display: flex; align-items: center; gap: 8px; margin-bottom: 6px; margin-top: 4px;">
            <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">Fulfillment Duration &amp; Staff Tenure</h4>
          </div>
          <div class="code-block-container" id="day08DiffExamples">
            <div class="code-subblock" id="day08DiffQuery1">
              <pre><code><span class="code-comment">-- 1. Shipping SLA fulfillment latency (shipped_date - order_date)</span>
<span class="kw">SELECT</span> order_id,
       order_date,
       shipped_date,
       CAST(julianday(shipped_date) - julianday(order_date) <span class="kw">AS</span> INTEGER) <span class="kw">AS</span> fulfillment_days
<span class="kw">FROM</span>   orders
<span class="kw">WHERE</span>  shipped_date <span class="kw">IS NOT NULL</span>;</code></pre>
            </div>
            <div class="code-subblock" id="day08DiffQuery2">
              <pre><code><span class="code-comment">-- 2. Employee tenure calculation in days</span>
<span class="kw">SELECT</span> first_name,
       hire_date,
       CAST(julianday('now') - julianday(hire_date) <span class="kw">AS</span> INTEGER) <span class="kw">AS</span> tenure_days
<span class="kw">FROM</span>   employees;</code></pre>
            </div>
          </div>
        </div>

        <!-- ── Section 04: Date Arithmetic & Modifiers ── -->
        <div class="slide-section" id="day08ArithSection">
          <h3 class="heading-with-audio" id="day08Arith">
            04. Date Arithmetic &amp; Modifiers
          </h3>
          <p>Add or subtract calendar intervals using the <code>date(base, modifier)</code> function:</p>
        </div>

        <div class="slide-section" id="day08ArithExamplesSection">
          <div class="heading-with-audio" style="display: flex; align-items: center; gap: 8px; margin-bottom: 6px; margin-top: 4px;">
            <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">Projecting Deadlines &amp; Rolling Lookbacks</h4>
          </div>
          <div class="code-block-container" id="day08ArithExamples">
            <div class="code-subblock" id="day08ArithQuery1">
              <pre><code><span class="code-comment">-- 1. Project 30-day delivery deadline</span>
<span class="kw">SELECT</span> order_id,
       order_date,
       date(order_date, '+30 days') <span class="kw">AS</span> delivery_deadline
<span class="kw">FROM</span>   orders;</code></pre>
            </div>
            <div class="code-subblock" id="day08ArithQuery2">
              <pre><code><span class="code-comment">-- 2. Rolling 90-day order lookback filter</span>
<span class="kw">SELECT</span> order_id, order_date, total_amount
<span class="kw">FROM</span>   orders
<span class="kw">WHERE</span>  order_date &gt;= date('now', '-90 days');</code></pre>
            </div>
          </div>
        </div>

        <!-- ── Section 05: strftime Formatting ── -->
        <div class="slide-section" id="day08StrftimeSection">
          <h3 class="heading-with-audio" id="day08Strftime">
            05. strftime() — Date Component Extraction
          </h3>
          <p><code>strftime(format, date)</code> parses and formats date strings into discrete temporal components:</p>
        </div>

        <div class="slide-section" id="day08StrftimeRefTableSection">
          <div class="db-mock-table-wrap" id="day08StrftimeRefTable">
            <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px; margin-bottom: 6px; padding: 0 4px;">
              <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">strftime Format Directives</h4>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Code</th><th>Component</th><th>Sample Output</th></tr></thead>
              <tbody>
                <tr id="day08FmtRow1"><td><code>%Y</code></td><td>4-digit calendar year</td><td>2024</td></tr>
                <tr id="day08FmtRow2"><td><code>%m</code></td><td>2-digit month (01–12)</td><td>08</td></tr>
                <tr id="day08FmtRow3"><td><code>%d</code></td><td>2-digit day of month (01–31)</td><td>15</td></tr>
                <tr id="day08FmtRow4"><td><code>%w</code></td><td>Day of week (0=Sunday, 6=Saturday)</td><td>0</td></tr>
                <tr id="day08FmtRow5"><td><code>%H</code></td><td>Hour in 24-hour format (00–23)</td><td>14</td></tr>
                <tr id="day08FmtRow6"><td><code>%M</code></td><td>Minute (00–59)</td><td>30</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day08StrftimeExamplesSection">
          <div class="heading-with-audio" style="display: flex; align-items: center; gap: 8px; margin-bottom: 6px; margin-top: 4px;">
            <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">Date Slicing &amp; Group Rollups</h4>
          </div>
          <div class="code-block-container" id="day08StrftimeExamples">
            <div class="code-subblock" id="day08StrftimeQuery1">
              <pre><code><span class="code-comment">-- 1. Extract distinct year, month, and day components</span>
<span class="kw">SELECT</span> order_id,
       order_date,
       strftime('%Y', order_date) <span class="kw">AS</span> order_year,
       strftime('%m', order_date) <span class="kw">AS</span> order_month,
       strftime('%d', order_date) <span class="kw">AS</span> order_day
<span class="kw">FROM</span>   orders;</code></pre>
            </div>
            <div class="code-subblock" id="day08StrftimeQuery2">
              <pre><code><span class="code-comment">-- 2. Annual order count and revenue summary</span>
<span class="kw">SELECT</span> strftime('%Y', order_date) <span class="kw">AS</span> order_year,
       COUNT(*)                   <span class="kw">AS</span> total_orders,
       SUM(total_amount)          <span class="kw">AS</span> total_revenue
<span class="kw">FROM</span>   orders
<span class="kw">GROUP BY</span> order_year
<span class="kw">ORDER BY</span> order_year;</code></pre>
            </div>
          </div>
        </div>

        <!-- ── Section 06: Monthly & Cohort Trends ── -->
        <div class="slide-section" id="day08MonthlySection">
          <h3 class="heading-with-audio" id="day08Monthly">
            06. Monthly Rollups &amp; Sargability
          </h3>
          <p>Group by <code>strftime('%Y-%m', order_date)</code> to generate time-series monthly revenue trends:</p>
        </div>

        <div class="slide-section" id="day08MonthlyExamplesSection">
          <div class="heading-with-audio" style="display: flex; align-items: center; gap: 8px; margin-bottom: 6px; margin-top: 4px;">
            <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">Monthly Cohorts &amp; Index Sargability</h4>
          </div>
          <div class="code-block-container" id="day08MonthlyExamples">
            <div class="code-subblock" id="day08MonthlyQuery1">
              <pre><code><span class="code-comment">-- Monthly revenue run-rate</span>
<span class="kw">SELECT</span> strftime('%Y-%m', order_date) <span class="kw">AS</span> order_month,
       COUNT(*)                      <span class="kw">AS</span> order_volume,
       SUM(total_amount)             <span class="kw">AS</span> monthly_revenue
<span class="kw">FROM</span>   orders
<span class="kw">GROUP BY</span> order_month
<span class="kw">ORDER BY</span> order_month;</code></pre>
            </div>
          </div>
        </div>

        <div class="slide-section" id="day08SargWarnSection">
          <div class="warn-box" id="day08SargWarn">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color:var(--ink-warn); flex: 1;">💡 Sargability in Date Filtering:</strong>
            </div>
            <p style="margin: 0;">Writing <code>WHERE strftime('%Y', order_date) = '2024'</code> is <strong>non-sargable</strong>. To leverage a B-Tree index on <code>order_date</code>, write: <code>WHERE order_date &gt;= '2024-01-01' AND order_date &lt; '2025-01-01'</code>!</p>
          </div>
        </div>

        <!-- ── Section 07: Top 25 Interview Q&A ── -->
        <div class="slide-section" id="day08QASection">
          <div class="interview-box">
            <h4 id="day08QAHeading" style="margin: 0 0 12px 0; font-size: 1rem; color: #38bdf8; display: flex; align-items: center; gap: 6px;">
              <span>🎯</span> Top 25 SQL Interview Q&amp;A — Date &amp; Time Functions
            </h4>

            <div id="day08QA1">
              <p><strong>Q1: How are dates stored in SQLite?</strong></p>
              <p><em>A: SQLite does not have a dedicated DATE data type. It stores dates as TEXT strings in ISO-8601 format (YYYY-MM-DD), REAL (Julian day numbers), or INTEGER (Unix epoch seconds).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA2">
              <p><strong>Q2: What is the equivalent of MySQL's NOW() or CURDATE() in SQLite?</strong></p>
              <p><em>A: In SQLite, use date('now') for current calendar date and datetime('now') for current timestamp.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA3">
              <p><strong>Q3: How do you calculate the number of days between two dates in SQLite versus MySQL?</strong></p>
              <p><em>A: In SQLite, subtract Julian day numbers: CAST(julianday(d2) - julianday(d1) AS INTEGER). In MySQL, use DATEDIFF(d2, d1).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA4">
              <p><strong>Q4: What does strftime('%w', date) return?</strong></p>
              <p><em>A: It returns the day of the week as an integer string from 0 (Sunday) to 6 (Saturday).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA5">
              <p><strong>Q5: How do you add 30 days to a date column in SQLite?</strong></p>
              <p><em>A: Use date(order_date, '+30 days').</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA6">
              <p><strong>Q6: How do you extract the 4-digit year from a date column?</strong></p>
              <p><em>A: In SQLite, use strftime('%Y', date_col). In PostgreSQL/MySQL, use EXTRACT(YEAR FROM date_col) or YEAR(date_col).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA7">
              <p><strong>Q7: Why is filtering with BETWEEN on datetime columns tricky?</strong></p>
              <p><em>A: BETWEEN '2024-01-01' AND '2024-01-31' evaluates up to '2024-01-31 00:00:00', inadvertently omitting orders placed during January 31st afternoon! Use &gt;= '2024-01-01' AND &lt; '2024-02-01' instead.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA8">
              <p><strong>Q8: How do you group data by year and month together?</strong></p>
              <p><em>A: Format the date string as strftime('%Y-%m', date_col) and place it in the GROUP BY clause.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA9">
              <p><strong>Q9: How do you find orders placed on weekends?</strong></p>
              <p><em>A: Use WHERE strftime('%w', order_date) IN ('0', '6').</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA10">
              <p><strong>Q10: What is the difference between TIMESTAMP and DATE?</strong></p>
              <p><em>A: DATE stores calendar date only (YYYY-MM-DD). TIMESTAMP stores date and time of day (YYYY-MM-DD HH:MM:SS), frequently including timezone offsets.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA11">
              <p><strong>Q11: How do you convert a Unix epoch timestamp to a human-readable date in SQLite?</strong></p>
              <p><em>A: Use datetime(epoch_column, 'unixepoch').</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA12">
              <p><strong>Q12: How do you find the first day of the current month in SQLite?</strong></p>
              <p><em>A: Use date('now', 'start of month').</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA13">
              <p><strong>Q13: How do you calculate an employee's age or tenure in whole years?</strong></p>
              <p><em>A: CAST((julianday('now') - julianday(hire_date)) / 365.25 AS INTEGER).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA14">
              <p><strong>Q14: What is UTC and why should database timestamps always be stored in UTC?</strong></p>
              <p><em>A: Coordinated Universal Time (UTC) is timezone-independent. Storing in UTC avoids daylight saving discrepancies and cross-region reporting errors.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA15">
              <p><strong>Q15: How do you convert UTC to local time in SQLite?</strong></p>
              <p><em>A: Use datetime(col, 'localtime').</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA16">
              <p><strong>Q16: How do you filter records from the last 7 days?</strong></p>
              <p><em>A: WHERE order_date &gt;= date('now', '-7 days').</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA17">
              <p><strong>Q17: Why does alphabetical string comparison work on ISO dates?</strong></p>
              <p><em>A: Because ISO-8601 orders from largest unit (Year) to smallest (Month, Day). '2024-05-01' is alphabetically greater than '2024-04-30'.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA18">
              <p><strong>Q18: What is the quarter calculation formula from a date?</strong></p>
              <p><em>A: CASE WHEN strftime('%m', col) IN ('01','02','03') THEN 'Q1' ... or (CAST(strftime('%m', col) AS INTEGER) + 2) / 3.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA19">
              <p><strong>Q19: How do you extract the hour component from a timestamp in SQLite?</strong></p>
              <p><em>A: strftime('%H', timestamp_col).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA20">
              <p><strong>Q20: What happens if julianday() receives an invalid date string?</strong></p>
              <p><em>A: It returns NULL.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA21">
              <p><strong>Q21: How do you find the last day of the current month?</strong></p>
              <p><em>A: date('now', 'start of month', '+1 month', '-1 day').</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA22">
              <p><strong>Q22: Can you subtract dates directly without functions in SQLite?</strong></p>
              <p><em>A: Direct subtraction (d2 - d1) performs string subtraction resulting in 0. You must use julianday() difference.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA23">
              <p><strong>Q23: How do you format a date as DD/MM/YYYY for presentation?</strong></p>
              <p><em>A: strftime('%d/%m/%Y', order_date).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA24">
              <p><strong>Q24: How do you compute Day-over-Day or Month-over-Month growth in SQL?</strong></p>
              <p><em>A: Group by temporal period, then use the LAG() window function to calculate the percentage change from the preceding period.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day08QA25">
              <p><strong>Q25: What is a Date Dimension (Calendar Table) in Data Warehousing?</strong></p>
              <p><em>A: A dedicated lookup table pre-populated with dates, fiscal quarters, holidays, and weekend flags. Joining on it simplifies analytics and avoids complex runtime date logic.</em></p>
            </div>
          </div>
        </div>`
    }
  ],
  "practiceQuestions": [
    {
      "id": 1,
      "prompt": "<strong>[Easy] Current System Date Retrieval</strong><br/>Audit time stamp verification: Write a query to return today's system date using SQLite's <code>date('now')</code> function aliased as <code>today</code>.",
      "referenceSql": "SELECT date('now') AS today;",
      "questionAudio": "Day08/New_Day8Question01.mp3",
      "solutionAudio": "Day08/New_Day8Question01sol.mp3"
    },
    {
      "id": 2,
      "prompt": "<strong>[Easy] Four-Digit Order Year Extraction</strong><br/>Financial reporting: From <code>orders</code>, return <code>order_id</code>, <code>order_date</code>, and the 4-digit calendar year extracted using <code>strftime('%Y', order_date)</code> aliased as <code>order_year</code>.",
      "referenceSql": "SELECT order_id,\n       order_date,\n       strftime('%Y', order_date) AS order_year\nFROM   orders;",
      "questionAudio": "Day08/New_Day8Question02.mp3",
      "solutionAudio": "Day08/New_Day8Question02sol.mp3"
    },
    {
      "id": 3,
      "prompt": "<strong>[Easy] Orders Placed in Calendar Year 2024</strong><br/>Annual revenue audit: Return <code>order_id</code>, <code>customer_id</code>, <code>order_date</code>, and <code>total_amount</code> from <code>orders</code> for orders placed in the year 2024 using <code>strftime</code>.",
      "referenceSql": "SELECT order_id,\n       customer_id,\n       order_date,\n       total_amount\nFROM   orders\nWHERE  strftime('%Y', order_date) = '2024';",
      "questionAudio": "Day08/New_Day8Question03.mp3",
      "solutionAudio": "Day08/New_Day8Question03sol.mp3"
    },
    {
      "id": 4,
      "prompt": "<strong>[Easy] 7-Day Projected Delivery Deadline</strong><br/>Logistics planning: For each order in <code>orders</code>, return <code>order_id</code>, <code>order_date</code>, and projected delivery deadline computed by adding 7 days using <code>date(order_date, '+7 days')</code> as <code>deadline</code>.",
      "referenceSql": "SELECT order_id,\n       order_date,\n       date(order_date, '+7 days') AS deadline\nFROM   orders;",
      "questionAudio": "Day08/New_Day8Question04.mp3",
      "solutionAudio": "Day08/New_Day8Question04sol.mp3"
    },
    {
      "id": 5,
      "prompt": "<strong>[Easy] Employee Seniority Tenure in Days</strong><br/>HR headcount audit: Return <code>employee_id</code>, <code>first_name</code>, <code>hire_date</code>, and total tenure in days calculated using <code>CAST(julianday('now') - julianday(hire_date) AS INTEGER)</code> as <code>tenure_days</code> from <code>employees</code>.",
      "referenceSql": "SELECT employee_id,\n       first_name,\n       hire_date,\n       CAST(julianday('now') - julianday(hire_date) AS INTEGER) AS tenure_days\nFROM   employees;",
      "questionAudio": "Day08/New_Day8Question05.mp3",
      "solutionAudio": "Day08/New_Day8Question05sol.mp3"
    },
    {
      "id": 6,
      "prompt": "<strong>[Medium] Fulfillment SLA Turnaround Days</strong><br/>Fulfillment performance: From <code>orders</code>, calculate shipping duration between <code>order_date</code> and <code>shipped_date</code> as <code>fulfillment_days</code> for all shipped orders (where <code>shipped_date IS NOT NULL</code>). Return <code>order_id</code>, <code>order_date</code>, <code>shipped_date</code>, and <code>fulfillment_days</code>.",
      "referenceSql": "SELECT order_id,\n       order_date,\n       shipped_date,\n       CAST(julianday(shipped_date) - julianday(order_date) AS INTEGER) AS fulfillment_days\nFROM   orders\nWHERE  shipped_date IS NOT NULL;",
      "questionAudio": "Day08/New_Day8Question06.mp3",
      "solutionAudio": "Day08/New_Day8Question06sol.mp3"
    },
    {
      "id": 7,
      "prompt": "<strong>[Medium] Monthly Revenue &amp; Volume Cohorts</strong><br/>Financial trajectory: Group <code>orders</code> by month formatted as <code>YYYY-MM</code> using <code>strftime('%Y-%m', order_date)</code> as <code>order_month</code>. Return <code>order_month</code>, total orders as <code>total_orders</code>, and aggregate <code>total_revenue</code>, sorted chronologically.",
      "referenceSql": "SELECT strftime('%Y-%m', order_date) AS order_month,\n       COUNT(*) AS total_orders,\n       SUM(total_amount) AS total_revenue\nFROM   orders\nGROUP BY order_month\nORDER BY order_month;",
      "questionAudio": "Day08/New_Day8Question07.mp3",
      "solutionAudio": "Day08/New_Day8Question07sol.mp3"
    },
    {
      "id": 8,
      "prompt": "<strong>[Medium] Weekend Shopping Behavioral Trends</strong><br/>Consumer analytics: Find all orders placed on a weekend, where <code>strftime('%w', order_date) IN ('0', '6')</code> (0=Sunday, 6=Saturday). Return <code>order_id</code>, <code>order_date</code>, and <code>total_amount</code>.",
      "referenceSql": "SELECT order_id,\n       order_date,\n       total_amount\nFROM   orders\nWHERE  strftime('%w', order_date) IN ('0', '6');",
      "questionAudio": "Day08/New_Day8Question08.mp3",
      "solutionAudio": "Day08/New_Day8Question08sol.mp3"
    },
    {
      "id": 9,
      "prompt": "<strong>[Medium] Annual Transaction Volume Summary</strong><br/>Executive summary: Group <code>orders</code> by year using <code>strftime('%Y', order_date)</code> as <code>order_year</code>. Return <code>order_year</code> and total order transactions as <code>total_orders</code>, sorted by <code>order_year</code>.",
      "referenceSql": "SELECT strftime('%Y', order_date) AS order_year,\n       COUNT(*) AS total_orders\nFROM   orders\nGROUP BY order_year\nORDER BY order_year;",
      "questionAudio": "Day08/New_Day8Question09.mp3",
      "solutionAudio": "Day08/New_Day8Question09sol.mp3"
    },
    {
      "id": 10,
      "prompt": "<strong>[Medium] Senior Staff Milestone (&gt;700 Days)</strong><br/>Long-service award audit: From <code>employees</code>, return <code>first_name</code>, <code>hire_date</code>, and <code>tenure_days</code> for all employees who have been employed for more than 700 days, ordered with the longest-tenured first.",
      "referenceSql": "SELECT first_name,\n       hire_date,\n       CAST(julianday('now') - julianday(hire_date) AS INTEGER) AS tenure_days\nFROM   employees\nWHERE  (julianday('now') - julianday(hire_date)) > 700\nORDER BY tenure_days DESC;",
      "questionAudio": "Day08/New_Day8Question10.mp3",
      "solutionAudio": "Day08/New_Day8Question10sol.mp3"
    },
    {
      "id": 11,
      "prompt": "<strong>[Hard] High Shipping Lag Alert (&gt;3 Days)</strong><br/>Supply chain bottleneck detection: Identify orders where shipping fulfillment took more than 3 days. Return <code>order_id</code>, <code>customer_id</code>, <code>order_date</code>, and <code>fulfillment_days</code>, sorted with the slowest fulfillment first.",
      "referenceSql": "SELECT order_id,\n       customer_id,\n       order_date,\n       CAST(julianday(shipped_date) - julianday(order_date) AS INTEGER) AS fulfillment_days\nFROM   orders\nWHERE  shipped_date IS NOT NULL\n  AND  (julianday(shipped_date) - julianday(order_date)) > 3\nORDER BY fulfillment_days DESC;",
      "questionAudio": "Day08/New_Day8Question11.mp3",
      "solutionAudio": "Day08/New_Day8Question11sol.mp3"
    },
    {
      "id": 12,
      "prompt": "<strong>[Hard] Day-of-Week Revenue Distribution</strong><br/>Weekly revenue pattern: Group <code>orders</code> by day of week using <code>strftime('%w', order_date)</code> as <code>day_of_week</code>. Return <code>day_of_week</code>, <code>total_orders</code>, and the average order value rounded to 2 decimal places as <code>avg_order_val</code>, sorted by <code>day_of_week</code>.",
      "referenceSql": "SELECT strftime('%w', order_date) AS day_of_week,\n       COUNT(*) AS total_orders,\n       ROUND(AVG(total_amount), 2) AS avg_order_val\nFROM   orders\nGROUP BY day_of_week\nORDER BY day_of_week;",
      "questionAudio": "Day08/New_Day8Question12.mp3",
      "solutionAudio": "Day08/New_Day8Question12sol.mp3"
    },
    {
      "id": 13,
      "prompt": "<strong>[Hard] 30-Day Customer Return Deadline</strong><br/>Customer warranty window: For all completed orders (<code>status = 'Completed'</code>), return <code>order_id</code>, <code>total_amount</code>, and date 30 days after <code>order_date</code> as <code>return_deadline</code> using <code>date(order_date, '+30 days')</code>.",
      "referenceSql": "SELECT order_id,\n       total_amount,\n       date(order_date, '+30 days') AS return_deadline\nFROM   orders\nWHERE  status = 'Completed';",
      "questionAudio": "Day08/New_Day8Question13.mp3",
      "solutionAudio": "Day08/New_Day8Question13sol.mp3"
    },
    {
      "id": 14,
      "prompt": "<strong>[Hard] Annual Performance by Order Status</strong><br/>Multi-column temporal breakdown: Group <code>orders</code> by calendar year (<code>order_year</code>) and <code>status</code>. Return <code>order_year</code>, <code>status</code>, <code>order_count</code>, and <code>total_revenue</code>, sorted by <code>order_year</code> and <code>status</code>.",
      "referenceSql": "SELECT strftime('%Y', order_date) AS order_year,\n       status,\n       COUNT(*) AS order_count,\n       SUM(total_amount) AS total_revenue\nFROM   orders\nGROUP BY order_year, status\nORDER BY order_year, status;",
      "questionAudio": "Day08/New_Day8Question14.mp3",
      "solutionAudio": "Day08/New_Day8Question14sol.mp3"
    },
    {
      "id": 15,
      "prompt": "<strong>[Hard] Customer Lifetime Order Boundaries</strong><br/>Customer engagement audit: For customers who have placed more than 1 order, return <code>customer_id</code>, <code>order_count</code>, their earliest order date as <code>first_order</code>, and their most recent order date as <code>last_order</code>, ordered by <code>order_count</code> descending.",
      "referenceSql": "SELECT customer_id,\n       COUNT(*) AS order_count,\n       MIN(order_date) AS first_order,\n       MAX(order_date) AS last_order\nFROM   orders\nGROUP BY customer_id\nHAVING COUNT(*) > 1\nORDER BY order_count DESC;",
      "questionAudio": "Day08/New_Day8Question15.mp3",
      "solutionAudio": "Day08/New_Day8Question15sol.mp3"
    }
  ],
  "testQuestions": [
    { "id": 1, "prompt": "Get the current date in SQLite using <code>date('now')</code>.", "ref": "SELECT date('now') AS today;" },
    { "id": 2, "prompt": "Find how many days have passed since each order was placed.", "ref": "SELECT order_id, CAST(julianday('now') - julianday(order_date) AS INTEGER) AS days_ago FROM orders;" },
    { "id": 3, "prompt": "Compute fulfillment days (shipped_date - order_date) for all shipped orders.", "ref": "SELECT order_id, CAST(julianday(shipped_date) - julianday(order_date) AS INTEGER) AS fulfillment_days FROM orders WHERE shipped_date IS NOT NULL;" },
    { "id": 4, "prompt": "Extract the year from each employee's hire_date.", "ref": "SELECT first_name, strftime('%Y', hire_date) AS hire_year FROM employees;" },
    { "id": 5, "prompt": "Extract the month from each order's order_date.", "ref": "SELECT order_id, strftime('%m', order_date) AS month FROM orders;" },
    { "id": 6, "prompt": "Find all employees hired in 2021.", "ref": "SELECT * FROM employees WHERE strftime('%Y', hire_date) = '2021';" },
    { "id": 7, "prompt": "Add 30 days to each order's order_date as a delivery_deadline.", "ref": "SELECT order_id, order_date, date(order_date, '+30 days') AS delivery_deadline FROM orders;" },
    { "id": 8, "prompt": "Find orders placed in the last 180 days.", "ref": "SELECT * FROM orders WHERE order_date >= date('now', '-180 days');" },
    { "id": 9, "prompt": "Find orders placed in December (month = '12').", "ref": "SELECT * FROM orders WHERE strftime('%m', order_date) = '12';" },
    { "id": 10, "prompt": "Calculate employee tenure in years (approximate: days / 365).", "ref": "SELECT first_name, ROUND((julianday('now') - julianday(hire_date)) / 365.0, 1) AS tenure_years FROM employees;" },
    { "id": 11, "prompt": "Count orders placed per month.", "ref": "SELECT strftime('%m', order_date) AS month, COUNT(*) AS order_count FROM orders GROUP BY month;" },
    { "id": 12, "prompt": "Find orders placed before 2024-06-01 and shipped after 2024-06-10.", "ref": "SELECT * FROM orders WHERE order_date < '2024-06-01' AND shipped_date > '2024-06-10';" },
    { "id": 13, "prompt": "Format hire_date as DD-MM-YYYY for all employees.", "ref": "SELECT first_name, strftime('%d-%m-%Y', hire_date) AS formatted_date FROM employees;" },
    { "id": 14, "prompt": "Find employees hired in the first half of the year (months 01-06).", "ref": "SELECT * FROM employees WHERE strftime('%m', hire_date) <= '06';" },
    { "id": 15, "prompt": "Compute a contract expiry date as hire_date + 3 years for all employees.", "ref": "SELECT first_name, hire_date, date(hire_date, '+3 years') AS contract_expiry FROM employees;" },
    { "id": 16, "prompt": "Find orders with fulfillment time more than 5 days.", "ref": "SELECT * FROM orders WHERE shipped_date IS NOT NULL AND CAST(julianday(shipped_date) - julianday(order_date) AS INTEGER) > 5;" },
    { "id": 17, "prompt": "Find total revenue per year from orders.", "ref": "SELECT strftime('%Y', order_date) AS year, SUM(total_amount) AS revenue FROM orders GROUP BY year;" },
    { "id": 18, "prompt": "Find employees who have been employed for more than 3 years.", "ref": "SELECT * FROM employees WHERE julianday('now') - julianday(hire_date) > 3 * 365;" },
    { "id": 19, "prompt": "Count customers who signed up per year.", "ref": "SELECT strftime('%Y', signup_date) AS year, COUNT(*) AS signups FROM customers GROUP BY year;" },
    { "id": 20, "prompt": "Find orders placed on weekends (day of week 0=Sunday, 6=Saturday).", "ref": "SELECT * FROM orders WHERE strftime('%w', order_date) IN ('0', '6');" },
    { "id": 21, "prompt": "Compute the number of days between customer signup_date and today.", "ref": "SELECT first_name, CAST(julianday('now') - julianday(signup_date) AS INTEGER) AS days_since_signup FROM customers;" },
    { "id": 22, "prompt": "Find the month with the highest total revenue from orders.", "ref": "SELECT strftime('%m', order_date) AS month, SUM(total_amount) AS revenue FROM orders GROUP BY month ORDER BY revenue DESC LIMIT 1;" },
    { "id": 23, "prompt": "Find orders placed between 2024-10-01 and 2024-12-31.", "ref": "SELECT * FROM orders WHERE order_date BETWEEN '2024-10-01' AND '2024-12-31';" },
    { "id": 24, "prompt": "Find employees hired in Q1 (Jan, Feb, Mar) of any year.", "ref": "SELECT * FROM employees WHERE strftime('%m', hire_date) IN ('01', '02', '03');" },
    { "id": 25, "prompt": "Compute average fulfillment days across all shipped orders.", "ref": "SELECT ROUND(AVG(julianday(shipped_date) - julianday(order_date)), 1) AS avg_fulfillment_days FROM orders WHERE shipped_date IS NOT NULL;" }
  ],
  "topics": [
    { "id": "topic-1", "label": "Topic 1: Date & Time Functions", "recordingKey": null }
  ]
};
