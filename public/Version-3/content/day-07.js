// Day 07 — Single-Row Functions: String & Numeric Transformations
if (!window.COURSE_CONTENT) window.COURSE_CONTENT = {};
window.COURSE_CONTENT['day07'] = {
  "day": 7,
  "title": "Single-Row Functions",
  "db": "retail",
  "emoji": "🧵",
  "slides": [
    {
      "title": "Single-Row Functions — String & Numeric Transformations",
      "duration": "8:30",
      "html": `<h2>🧵 Single-Row Functions — String &amp; Numeric Transformations</h2>

        <!-- ── Section 01: Scalar vs Aggregate ── -->
        <div class="slide-section" id="day07ScalarSection">
          <h3 class="heading-with-audio" id="day07Scalar">
            01. What Are Single-Row Functions?
          </h3>
          <p>Single-row (scalar) functions operate on <strong>one row at a time</strong> and return <strong>one result per row</strong>. Unlike aggregate functions (which collapse many rows into one), single-row functions transform individual values row-by-row. They can appear in <code>SELECT</code>, <code>WHERE</code>, <code>ORDER BY</code>, and <code>GROUP BY</code>.</p>
        </div>

        <div class="slide-section" id="day07WhereClausesAllowedSection">
          <div class="info-box" id="day07WhereClausesAllowed">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color:var(--ink-teal); flex: 1;">💡 Anywhere in SQL:</strong>
            </div>
            <p style="margin: 0;">Scalar functions can format columns in <code>SELECT</code>, filter computed values in <code>WHERE</code>, order rows dynamically in <code>ORDER BY</code>, or partition records in <code>GROUP BY</code>.</p>
          </div>
        </div>

        <!-- ── Section 02: Essential String Functions ── -->
        <div class="slide-section" id="day07StringSection">
          <h3 class="heading-with-audio" id="day07String">
            02. Essential String Functions
          </h3>
          <p>String functions clean, format, and parse text columns across enterprise datasets:</p>
        </div>

        <div class="slide-section" id="day07StringRefTableSection">
          <div class="db-mock-table-wrap" id="day07StringRefTable">
            <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px; margin-bottom: 6px; padding: 0 4px;">
              <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">String Functions Reference</h4>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Function</th><th>Purpose</th><th>Example</th><th>Result</th></tr></thead>
              <tbody>
                <tr id="day07StrRow1"><td><code>UPPER(str)</code></td><td>Converts text to uppercase</td><td><code>UPPER('hello')</code></td><td>'HELLO'</td></tr>
                <tr id="day07StrRow2"><td><code>LOWER(str)</code></td><td>Converts text to lowercase</td><td><code>LOWER('HELLO')</code></td><td>'hello'</td></tr>
                <tr id="day07StrRow3"><td><code>LENGTH(str)</code></td><td>Character count</td><td><code>LENGTH('Data')</code></td><td>4</td></tr>
                <tr id="day07StrRow4"><td><code>TRIM(str)</code></td><td>Strips leading &amp; trailing whitespace</td><td><code>TRIM('  hi  ')</code></td><td>'hi'</td></tr>
                <tr id="day07StrRow5"><td><code>REPLACE(s, f, r)</code></td><td>Replaces substring occurrences</td><td><code>REPLACE('a-b', '-', '/')</code></td><td>'a/b'</td></tr>
                <tr id="day07StrRow6"><td><code>SUBSTR(s, p, l)</code></td><td>Extracts substring (1-indexed!)</td><td><code>SUBSTR('Hello', 2, 3)</code></td><td>'ell'</td></tr>
                <tr id="day07StrRow7"><td><code>INSTR(str, sub)</code></td><td>Returns 1-based character position</td><td><code>INSTR('dev@m.com', '@')</code></td><td>4</td></tr>
                <tr id="day07StrRow8"><td><code>str1 || str2</code></td><td>Standard ANSI concatenation</td><td><code>'A' || ' ' || 'B'</code></td><td>'A B'</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day07StringExamplesSection">
          <div class="heading-with-audio" style="display: flex; align-items: center; gap: 8px; margin-bottom: 6px; margin-top: 4px;">
            <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">String Functions in Practice</h4>
          </div>
          <div class="code-block-container" id="day07StringExamples">
            <div class="code-subblock" id="day07StringQuery1">
              <pre><code><span class="code-comment">-- 1. Full name concatenation, uppercase email &amp; username extraction</span>
<span class="kw">SELECT</span> first_name || ' ' || last_name       <span class="kw">AS</span> full_name,
       UPPER(email)                          <span class="kw">AS</span> upper_email,
       LENGTH(first_name)                    <span class="kw">AS</span> name_length,
       REPLACE(email, '@manodemy.com', '')   <span class="kw">AS</span> username
<span class="kw">FROM</span>   employees;</code></pre>
            </div>
            <div class="code-subblock" id="day07StringQuery2">
              <pre><code><span class="code-comment">-- 2. Filter employees by cleansed username length in WHERE</span>
<span class="kw">SELECT</span> first_name, email
<span class="kw">FROM</span>   employees
<span class="kw">WHERE</span>  LENGTH(REPLACE(email, '@manodemy.com', '')) &lt; 10;</code></pre>
            </div>
          </div>
        </div>

        <!-- ── Section 03: SUBSTR & INSTR ── -->
        <div class="slide-section" id="day07SubstrSection">
          <h3 class="heading-with-audio" id="day07Substr">
            03. SUBSTR &amp; INSTR — Precision String Slicing
          </h3>
          <p><code>SUBSTR(string, start_position, length)</code> slices text. In SQL, strings are <strong>1-indexed</strong>: the first character starts at index <code>1</code>, not <code>0</code>!</p>
        </div>

        <div class="slide-section" id="day07SubstrExamplesSection">
          <div class="heading-with-audio" style="display: flex; align-items: center; gap: 8px; margin-bottom: 6px; margin-top: 4px;">
            <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">Substrings &amp; Dynamic Parsing</h4>
          </div>
          <div class="code-block-container" id="day07SubstrExamples">
            <div class="code-subblock" id="day07SubstrQuery1">
              <pre><code><span class="code-comment">-- 1. 3-Letter name abbreviation &amp; Date slicing</span>
<span class="kw">SELECT</span> first_name,
       SUBSTR(first_name, 1, 3) <span class="kw">AS</span> name_abbr,
       SUBSTR(hire_date, 1, 4)  <span class="kw">AS</span> hire_year,
       SUBSTR(hire_date, 6, 2)  <span class="kw">AS</span> hire_month
<span class="kw">FROM</span>   employees;</code></pre>
            </div>
            <div class="code-subblock" id="day07SubstrQuery2">
              <pre><code><span class="code-comment">-- 2. Dynamic email domain extraction with INSTR</span>
<span class="kw">SELECT</span> email,
       SUBSTR(email, INSTR(email, '@') + 1) <span class="kw">AS</span> domain_name
<span class="kw">FROM</span>   employees;</code></pre>
            </div>
          </div>
        </div>

        <div class="slide-section" id="day07IndexOneWarnSection">
          <div class="warn-box" id="day07IndexOneWarn">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color:var(--ink-neg); flex: 1;">⚠️ 1-Based Indexing Trap:</strong>
            </div>
            <p style="margin: 0;">Developers coming from Python, Java, or JavaScript frequently write <code>SUBSTR(str, 0, 3)</code>. In SQL, starting at 0 is treated as index 1 in SQLite, but in Oracle and other engines it can cause off-by-one errors. Always start at <strong>1</strong>!</p>
          </div>
        </div>

        <!-- ── Section 04: Numeric Functions ── -->
        <div class="slide-section" id="day07NumericSection">
          <h3 class="heading-with-audio" id="day07Numeric">
            04. Numeric Functions — Precision Rounding &amp; Math
          </h3>
          <p>Financial reporting and analytics require exact rounding and absolute calculations:</p>
        </div>

        <div class="slide-section" id="day07NumericRefTableSection">
          <div class="db-mock-table-wrap" id="day07NumericRefTable">
            <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px; margin-bottom: 6px; padding: 0 4px;">
              <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">Numeric Functions Reference</h4>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Function</th><th>Operation</th><th>Example</th><th>Result</th></tr></thead>
              <tbody>
                <tr id="day07NumRow1"><td><code>ROUND(n, d)</code></td><td>Rounds to <code>d</code> decimal places</td><td><code>ROUND(3.14159, 2)</code></td><td>3.14</td></tr>
                <tr id="day07NumRow2"><td><code>CEIL(n)</code></td><td>Rounds UP to nearest integer</td><td><code>CEIL(3.1)</code></td><td>4</td></tr>
                <tr id="day07NumRow3"><td><code>FLOOR(n)</code></td><td>Rounds DOWN to nearest integer</td><td><code>FLOOR(3.9)</code></td><td>3</td></tr>
                <tr id="day07NumRow4"><td><code>ABS(n)</code></td><td>Absolute magnitude (removes sign)</td><td><code>ABS(-150)</code></td><td>150</td></tr>
                <tr id="day07NumRow5"><td><code>a % b</code> / <code>MOD(a, b)</code></td><td>Remainder of division</td><td><code>17 % 5</code></td><td>2</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day07NumericExamplesSection">
          <div class="heading-with-audio" style="display: flex; align-items: center; gap: 8px; margin-bottom: 6px; margin-top: 4px;">
            <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">Numeric Calculations in Action</h4>
          </div>
          <div class="code-block-container" id="day07NumericExamples">
            <div class="code-subblock" id="day07NumericQuery1">
              <pre><code><span class="code-comment">-- Compensation adjustments, monthly pay &amp; baseline deviations</span>
<span class="kw">SELECT</span> first_name,
       salary,
       ROUND(salary, -3)       <span class="kw">AS</span> salary_nearest_1k,
       ROUND(salary / 12.0, 2) <span class="kw">AS</span> monthly_salary,
       ABS(salary - 70000)     <span class="kw">AS</span> deviation_from_70k
<span class="kw">FROM</span>   employees;</code></pre>
            </div>
          </div>
        </div>

        <!-- ── Section 05: Modulo & Partitioning ── -->
        <div class="slide-section" id="day07ModuloSection">
          <h3 class="heading-with-audio" id="day07Modulo">
            05. Modulo Arithmetic &amp; Data Partitioning
          </h3>
          <p>The modulo operator (<code>%</code>) returns the remainder of integer division. It is heavily utilized in distributed data pipelines to partition workloads across workers or isolate odd and even identifiers.</p>
        </div>

        <div class="slide-section" id="day07ModuloExamplesSection">
          <div class="heading-with-audio" style="display: flex; align-items: center; gap: 8px; margin-bottom: 6px; margin-top: 4px;">
            <h4 style="margin: 0; font-size: 1.0rem; font-weight: 800; letter-spacing: -0.015em; flex: 1;">Odd / Even Partitioning</h4>
          </div>
          <div class="code-block-container" id="day07ModuloExamples">
            <div class="code-subblock" id="day07ModuloQuery1">
              <pre><code><span class="code-comment">-- Filter orders into Batch A (even IDs) and Batch B (odd IDs)</span>
<span class="kw">SELECT</span> order_id, customer_id, total_amount
<span class="kw">FROM</span>   orders
<span class="kw">WHERE</span>  order_id % 2 = 0; <span class="code-comment">-- Even IDs</span></code></pre>
            </div>
          </div>
        </div>

        <div class="slide-section" id="day07NullScalarWarnSection">
          <div class="warn-box" id="day07NullScalarWarn">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color:var(--ink-neg); flex: 1;">⚠️ NULL Contagion in Scalar Functions:</strong>
            </div>
            <p style="margin: 0;">If any input to a scalar function is <code>NULL</code>, the result is almost always <code>NULL</code>! For instance: <code>LENGTH(NULL)</code> evaluates to <code>NULL</code> (not 0). Always wrap nullable columns with <code>COALESCE</code> if you require safe defaults.</p>
          </div>
        </div>

        <!-- ── Section 06: Performance & Sargability ── -->
        <div class="slide-section" id="day07SargabilitySection">
          <h3 class="heading-with-audio" id="day07Sargability">
            06. Performance &amp; Sargability Trap
          </h3>
          <p>Applying scalar functions to indexed columns inside a <code>WHERE</code> clause prevents the database optimizer from using B-Tree indexes, triggering costly full table scans:</p>
          <div class="vs-block" style="margin-top: 10px;">
            <div class="vs-card" id="day07NonSargCard" style="flex: 1;">
              <h4 style="margin: 0 0 6px; font-size: 0.95rem; color: #ef4444;">❌ Non-Sargable (Slow Full Scan)</h4>
              <p style="margin: 0; font-size: 0.82rem; font-family: monospace;">WHERE UPPER(email) = 'AMIT@MANODEMY.COM'</p>
              <p style="margin: 4px 0 0; font-size: 0.80rem; color: #94a3b8;">Forces the engine to run <code>UPPER()</code> on every single row in the table.</p>
            </div>
            <div class="vs-card" id="day07SargCard" style="flex: 1;">
              <h4 style="margin: 0 0 6px; font-size: 0.95rem; color: #16a34a;">✅ Sargable (Fast Index Scan)</h4>
              <p style="margin: 0; font-size: 0.82rem; font-family: monospace;">WHERE email = 'amit@manodemy.com'</p>
              <p style="margin: 4px 0 0; font-size: 0.80rem; color: #94a3b8;">Uses the B-Tree index directly for sub-millisecond lookup.</p>
            </div>
          </div>
        </div>

        <!-- ── Section 07: Top 25 Interview Q&A ── -->
        <div class="slide-section" id="day07QASection">
          <div class="interview-box">
            <h4 id="day07QAHeading" style="margin: 0 0 12px 0; font-size: 1rem; color: #38bdf8; display: flex; align-items: center; gap: 6px;">
              <span>🎯</span> Top 25 SQL Interview Q&amp;A — Single-Row Functions
            </h4>

            <div id="day07QA1">
              <p><strong>Q1: What is the primary difference between Single-Row (Scalar) and Aggregate functions?</strong></p>
              <p><em>A: Single-row functions transform data row-by-row and return one value for every input row. Aggregate functions evaluate multiple rows and collapse them into a single summary metric.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA2">
              <p><strong>Q2: Is string indexing in SQL 0-based or 1-based?</strong></p>
              <p><em>A: String indexing in standard SQL is 1-based. Position 1 represents the first character in the string.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA3">
              <p><strong>Q3: How do you concatenate strings in SQLite versus MySQL?</strong></p>
              <p><em>A: SQLite and PostgreSQL use the double pipe operator (first_name || ' ' || last_name). MySQL uses the CONCAT(first_name, ' ', last_name) function.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA4">
              <p><strong>Q4: What does ROUND(salary, -2) do?</strong></p>
              <p><em>A: A negative second argument rounds to the left of the decimal point, rounding the number to the nearest hundred (e.g. 85,420 becomes 85,400).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA5">
              <p><strong>Q5: What is the difference between CEIL() and FLOOR()?</strong></p>
              <p><em>A: CEIL() rounds upwards towards positive infinity (CEIL(3.1) = 4), while FLOOR() rounds downwards towards negative infinity (FLOOR(3.9) = 3).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA6">
              <p><strong>Q6: What happens when LENGTH(NULL) is evaluated?</strong></p>
              <p><em>A: It returns NULL, not 0. In SQL, scalar functions propagate NULLs unless specifically handled by COALESCE or IFNULL.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA7">
              <p><strong>Q7: How does INSTR(string, substring) behave if the substring is not found?</strong></p>
              <p><em>A: If the substring is not found, INSTR returns 0. If it is found, it returns the 1-based index of its first character.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA8">
              <p><strong>Q8: What does REPLACE('2026-09-28', '-', '/') return?</strong></p>
              <p><em>A: It replaces all occurrences of the hyphen with a slash, returning '2026/09/28'.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA9">
              <p><strong>Q9: Why does WHERE UPPER(name) = 'ALICE' perform poorly on large datasets?</strong></p>
              <p><em>A: Applying a function to an indexed column disables B-Tree index lookups, forcing the database to perform a full table scan. This is called a non-sargable query.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA10">
              <p><strong>Q10: What is the difference between TRIM(), LTRIM(), and RTRIM()?</strong></p>
              <p><em>A: TRIM removes whitespace from both ends. LTRIM removes whitespace from the left side only. RTRIM removes whitespace from the right side only.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA11">
              <p><strong>Q11: Can SUBSTR take a negative start position?</strong></p>
              <p><em>A: In SQLite and Oracle, yes: a negative start position counts backwards from the end of the string (e.g. SUBSTR('Hello', -2) returns 'lo').</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA12">
              <p><strong>Q12: How do you calculate integer division without truncation in SQLite?</strong></p>
              <p><em>A: Multiply the numerator or denominator by 1.0 (e.g. salary * 1.0 / 12) to force floating-point arithmetic.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA13">
              <p><strong>Q13: How can you dynamically extract a domain name from an email address?</strong></p>
              <p><em>A: Combine SUBSTR with INSTR: SUBSTR(email, INSTR(email, '@') + 1).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA14">
              <p><strong>Q14: How does the ABS() function behave with positive numbers and zero?</strong></p>
              <p><em>A: ABS returns positive numbers and zero unchanged. For negative numbers, it flips the sign to positive.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA15">
              <p><strong>Q15: Can scalar functions be nested within other scalar functions?</strong></p>
              <p><em>A: Yes, scalar functions can be deeply nested (e.g. UPPER(TRIM(REPLACE(email, ' ', '')))).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA16">
              <p><strong>Q16: How do you format a phone number or ID with leading zeros?</strong></p>
              <p><em>A: In SQLite, use PRINTF('%05d', id). In MySQL, use LPAD(id, 5, '0').</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA17">
              <p><strong>Q17: What does MOD(10, 3) or 10 % 3 return?</strong></p>
              <p><em>A: It returns 1 (the remainder of 10 divided by 3).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA18">
              <p><strong>Q18: What is the return type of LENGTH('12345')?</strong></p>
              <p><em>A: It returns an INTEGER representing the character count.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA19">
              <p><strong>Q19: How do you convert a string to title case (capitalizing first letter of each word)?</strong></p>
              <p><em>A: Standard SQL does not have a native INITCAP() in SQLite. PostgreSQL provides INITCAP(str). In SQLite, it requires string concatenation and SUBSTR tricks.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA20">
              <p><strong>Q20: Can scalar functions be placed inside GROUP BY?</strong></p>
              <p><em>A: Yes! For example, GROUP BY UPPER(city) or GROUP BY SUBSTR(hire_date, 1, 4) groups rows by the transformed scalar value.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA21">
              <p><strong>Q21: How do you mask sensitive strings like credit cards or emails in SQL?</strong></p>
              <p><em>A: Use SUBSTR and string concatenation: SUBSTR(card, 1, 4) || '****' || SUBSTR(card, -4).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA22">
              <p><strong>Q22: What happens if SUBSTR length exceeds the remaining string length?</strong></p>
              <p><em>A: It extracts all remaining characters up to the end of the string without error.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA23">
              <p><strong>Q23: How do you remove all occurrences of a character, such as dashes from an SSN?</strong></p>
              <p><em>A: Use REPLACE(ssn, '-', '').</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA24">
              <p><strong>Q24: Can scalar functions be used in the HAVING clause?</strong></p>
              <p><em>A: Yes, provided they wrap aggregate functions (e.g. HAVING ROUND(AVG(salary), 2) &gt; 50000).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day07QA25">
              <p><strong>Q25: What is function-based indexing?</strong></p>
              <p><em>A: An index created directly on the result of a function: CREATE INDEX idx_upper_email ON employees(UPPER(email)). This allows WHERE UPPER(email) = '...' to perform fast index scans!</em></p>
            </div>
          </div>
        </div>`
    }
  ],
  "practiceQuestions": [
    {
      "id": 1,
      "prompt": "<strong>[Easy] Full Employee Name Concatenation</strong><br/>HR requires a clean directory display. From <code>employees</code>, concatenate <code>first_name</code> and <code>last_name</code> separated by a space into <code>full_name</code> using the double pipe (<code>||</code>) operator, returning <code>employee_id</code> and <code>full_name</code>.",
      "referenceSql": "SELECT employee_id,\n       first_name || ' ' || last_name AS full_name\nFROM   employees;",
      "questionAudio": "Day07/New_Day7Question01.mp3",
      "solutionAudio": "Day07/New_Day7Question01sol.mp3"
    },
    {
      "id": 2,
      "prompt": "<strong>[Easy] Standardized Email Casing</strong><br/>Directory services require capitalized contact identifiers. Return <code>employee_id</code>, <code>first_name</code>, and their <code>email</code> address converted to uppercase as <code>upper_email</code> from <code>employees</code>.",
      "referenceSql": "SELECT employee_id,\n       first_name,\n       UPPER(email) AS upper_email\nFROM   employees;",
      "questionAudio": "Day07/New_Day7Question02.mp3",
      "solutionAudio": "Day07/New_Day7Question02sol.mp3"
    },
    {
      "id": 3,
      "prompt": "<strong>[Easy] Clean Corporate Username Extraction</strong><br/>Security administration needs internal system handles. From <code>employees</code>, return <code>first_name</code>, <code>email</code>, and their email with <code>@manodemy.com</code> stripped out using <code>REPLACE</code> aliased as <code>username</code>.",
      "referenceSql": "SELECT first_name,\n       email,\n       REPLACE(email, '@manodemy.com', '') AS username\nFROM   employees;",
      "questionAudio": "Day07/New_Day7Question03.mp3",
      "solutionAudio": "Day07/New_Day7Question03sol.mp3"
    },
    {
      "id": 4,
      "prompt": "<strong>[Easy] Character Length Audit</strong><br/>Database quality audit: Measure character length variations. Return <code>first_name</code> and the character length of <code>first_name</code> as <code>name_length</code> from <code>employees</code>, sorted by <code>name_length</code> descending.",
      "referenceSql": "SELECT first_name,\n       LENGTH(first_name) AS name_length\nFROM   employees\nORDER BY name_length DESC;",
      "questionAudio": "Day07/New_Day7Question04.mp3",
      "solutionAudio": "Day07/New_Day7Question04sol.mp3"
    },
    {
      "id": 5,
      "prompt": "<strong>[Easy] Catalog Price Rounding</strong><br/>E-commerce merchandising display: Return <code>product_id</code>, <code>name</code>, and <code>unit_price</code> rounded to 1 decimal place as <code>rounded_price</code> from the <code>products</code> table.",
      "referenceSql": "SELECT product_id,\n       name,\n       ROUND(unit_price, 1) AS rounded_price\nFROM   products;",
      "questionAudio": "Day07/New_Day7Question05.mp3",
      "solutionAudio": "Day07/New_Day7Question05sol.mp3"
    },
    {
      "id": 6,
      "prompt": "<strong>[Medium] 3-Letter Name Abbreviation Codes</strong><br/>Generate badge identifiers for operations staff. Return <code>employee_id</code>, <code>first_name</code>, and the first 3 characters of <code>first_name</code> using <code>SUBSTR</code> as <code>name_code</code> from <code>employees</code>.",
      "referenceSql": "SELECT employee_id,\n       first_name,\n       SUBSTR(first_name, 1, 3) AS name_code\nFROM   employees;",
      "questionAudio": "Day07/New_Day7Question06.mp3",
      "solutionAudio": "Day07/New_Day7Question06sol.mp3"
    },
    {
      "id": 7,
      "prompt": "<strong>[Medium] Estimated Monthly Compensation</strong><br/>Payroll projections: For each employee in <code>employees</code>, return <code>first_name</code>, annual <code>salary</code>, and salary divided by 12 rounded to 2 decimal places as <code>monthly_salary</code>.",
      "referenceSql": "SELECT first_name,\n       salary,\n       ROUND(salary / 12.0, 2) AS monthly_salary\nFROM   employees;",
      "questionAudio": "Day07/New_Day7Question07.mp3",
      "solutionAudio": "Day07/New_Day7Question07sol.mp3"
    },
    {
      "id": 8,
      "prompt": "<strong>[Medium] Absolute Salary Benchmark Variance</strong><br/>Compensation audit: Return <code>first_name</code>, <code>salary</code>, and the absolute difference between <code>salary</code> and the ₹70,000 baseline using <code>ABS</code> as <code>salary_variance</code> from <code>employees</code>.",
      "referenceSql": "SELECT first_name,\n       salary,\n       ABS(salary - 70000) AS salary_variance\nFROM   employees;",
      "questionAudio": "Day07/New_Day7Question08.mp3",
      "solutionAudio": "Day07/New_Day7Question08sol.mp3"
    },
    {
      "id": 9,
      "prompt": "<strong>[Medium] Dynamic Email Domain Extraction</strong><br/>Customer provider analytics: Using <code>SUBSTR</code> and <code>INSTR</code>, extract everything after the <code>@</code> symbol in <code>customers.email</code> as <code>email_domain</code>. Return <code>customer_id</code> and <code>email_domain</code>.",
      "referenceSql": "SELECT customer_id,\n       SUBSTR(email, INSTR(email, '@') + 1) AS email_domain\nFROM   customers;",
      "questionAudio": "Day07/New_Day7Question09.mp3",
      "solutionAudio": "Day07/New_Day7Question09sol.mp3"
    },
    {
      "id": 10,
      "prompt": "<strong>[Medium] Even Order ID Partitioning</strong><br/>Data pipeline load balancing: Return <code>order_id</code>, <code>customer_id</code>, and <code>total_amount</code> from <code>orders</code> for orders with an even <code>order_id</code> using the modulo operator (<code>order_id % 2 = 0</code>).",
      "referenceSql": "SELECT order_id,\n       customer_id,\n       total_amount\nFROM   orders\nWHERE  order_id % 2 = 0;",
      "questionAudio": "Day07/New_Day7Question10.mp3",
      "solutionAudio": "Day07/New_Day7Question10sol.mp3"
    },
    {
      "id": 11,
      "prompt": "<strong>[Hard] Filtering on String Length</strong><br/>Security name validation: Find all employees whose <code>last_name</code> has 6 or more characters using <code>LENGTH</code>. Return <code>first_name</code>, <code>last_name</code>, and <code>last_name_length</code>.",
      "referenceSql": "SELECT first_name,\n       last_name,\n       LENGTH(last_name) AS last_name_length\nFROM   employees\nWHERE  LENGTH(last_name) >= 6;",
      "questionAudio": "Day07/New_Day7Question11.mp3",
      "solutionAudio": "Day07/New_Day7Question11sol.mp3"
    },
    {
      "id": 12,
      "prompt": "<strong>[Hard] Address Whitespace Sanitization</strong><br/>ETL data cleansing: Customer records have erratic leading and trailing spacing. Return <code>customer_id</code>, <code>city</code>, and <code>city</code> with whitespace removed using <code>TRIM</code> as <code>clean_city</code> from <code>customers</code>.",
      "referenceSql": "SELECT customer_id,\n       city,\n       TRIM(city) AS clean_city\nFROM   customers;",
      "questionAudio": "Day07/New_Day7Question12.mp3",
      "solutionAudio": "Day07/New_Day7Question12sol.mp3"
    },
    {
      "id": 13,
      "prompt": "<strong>[Hard] Logistics Package Tier Ceiling</strong><br/>Packaging calculation: For products with <code>unit_price &gt; 500</code>, return <code>name</code>, <code>unit_price</code>, and <code>CEIL(unit_price / 100.0)</code> as <code>package_rating</code> from <code>products</code>.",
      "referenceSql": "SELECT name,\n       unit_price,\n       CEIL(unit_price / 100.0) AS package_rating\nFROM   products\nWHERE  unit_price > 500;",
      "questionAudio": "Day07/New_Day7Question13.mp3",
      "solutionAudio": "Day07/New_Day7Question13sol.mp3"
    },
    {
      "id": 14,
      "prompt": "<strong>[Hard] Privacy-Masked Email Generator</strong><br/>Compliance masking: Display the first 2 characters of customer email, followed by <code>'***'</code>, followed by the domain portion starting at <code>@</code> using <code>SUBSTR</code> and <code>INSTR</code>. Return <code>customer_id</code>, <code>email</code>, and <code>masked_email</code>.",
      "referenceSql": "SELECT customer_id,\n       email,\n       SUBSTR(email, 1, 2) || '***' || SUBSTR(email, INSTR(email, '@')) AS masked_email\nFROM   customers;",
      "questionAudio": "Day07/New_Day7Question14.mp3",
      "solutionAudio": "Day07/New_Day7Question14sol.mp3"
    },
    {
      "id": 15,
      "prompt": "<strong>[Hard] Combined Lowercase &amp; Floor Valuation</strong><br/>Catalog formatting: Return product <code>name</code> converted to lowercase as <code>lower_name</code>, <code>unit_price</code>, and <code>FLOOR(unit_price)</code> as <code>floor_price</code> for category 1 products, ordered by <code>floor_price</code> descending.",
      "referenceSql": "SELECT LOWER(name) AS lower_name,\n       unit_price,\n       FLOOR(unit_price) AS floor_price\nFROM   products\nWHERE  category_id = 1\nORDER BY floor_price DESC;",
      "questionAudio": "Day07/New_Day7Question15.mp3",
      "solutionAudio": "Day07/New_Day7Question15sol.mp3"
    }
  ],
  "testQuestions": [
    { "id": 1, "prompt": "Concatenate first_name and last_name as <code>full_name</code> from employees.", "ref": "SELECT first_name || ' ' || last_name AS full_name FROM employees;" },
    { "id": 2, "prompt": "Convert all product names to UPPERCASE.", "ref": "SELECT UPPER(name) AS name_upper FROM products;" },
    { "id": 3, "prompt": "Retrieve the LENGTH of each employee's first_name.", "ref": "SELECT first_name, LENGTH(first_name) AS name_len FROM employees;" },
    { "id": 4, "prompt": "Compute monthly salary (salary / 12 rounded to 2 decimal places) for all employees.", "ref": "SELECT first_name, ROUND(salary / 12.0, 2) AS monthly_salary FROM employees;" },
    { "id": 5, "prompt": "Extract the first 3 characters of each employee's first_name.", "ref": "SELECT first_name, SUBSTR(first_name, 1, 3) AS abbr FROM employees;" },
    { "id": 6, "prompt": "Replace '@manodemy.com' with '' to extract the username from employee emails.", "ref": "SELECT email, REPLACE(email, '@manodemy.com', '') AS username FROM employees;" },
    { "id": 7, "prompt": "Retrieve employees whose first_name in UPPER case equals 'PRIYA'.", "ref": "SELECT * FROM employees WHERE UPPER(first_name) = 'PRIYA';" },
    { "id": 8, "prompt": "Round the unit_price of each product to the nearest hundred (ROUND(price, -2)).", "ref": "SELECT name, ROUND(unit_price, -2) AS rounded_price FROM products;" },
    { "id": 9, "prompt": "Find the absolute difference between each employee's salary and 80000.", "ref": "SELECT first_name, ABS(salary - 80000) AS diff_from_80k FROM employees;" },
    { "id": 10, "prompt": "Retrieve the LOWER version of each customer's email.", "ref": "SELECT first_name, LOWER(email) AS email_lower FROM customers;" },
    { "id": 11, "prompt": "Find all products whose name starts with 'P' (using UPPER for case-insensitivity).", "ref": "SELECT * FROM products WHERE UPPER(name) LIKE 'P%';" },
    { "id": 12, "prompt": "Extract hire year (first 4 chars of hire_date) and count employees hired per year.", "ref": "SELECT SUBSTR(hire_date, 1, 4) AS hire_year, COUNT(*) AS cnt FROM employees GROUP BY hire_year;" },
    { "id": 13, "prompt": "Find products where TRIM(name) != name (has leading/trailing spaces).", "ref": "SELECT * FROM products WHERE TRIM(name) <> name;" },
    { "id": 14, "prompt": "Compute CEIL(salary / 10000.0) as a salary band for each employee.", "ref": "SELECT first_name, salary, CEIL(salary / 10000.0) AS salary_band FROM employees;" },
    { "id": 15, "prompt": "Find employees whose email username (before '@') has more than 10 characters.", "ref": "SELECT * FROM employees WHERE LENGTH(REPLACE(email, '@manodemy.com', '')) > 10;" },
    { "id": 16, "prompt": "Concatenate region and first_name as 'region: name' for customers.", "ref": "SELECT region || ': ' || first_name AS region_name FROM customers;" },
    { "id": 17, "prompt": "Find the FLOOR of each product's unit_price divided by 1000.", "ref": "SELECT name, FLOOR(unit_price / 1000.0) AS price_tier FROM products;" },
    { "id": 18, "prompt": "Extract the month from hire_date (characters 6-7) for all employees.", "ref": "SELECT first_name, SUBSTR(hire_date, 6, 2) AS hire_month FROM employees;" },
    { "id": 19, "prompt": "Find products whose name contains 'Chair' (case-insensitive with UPPER).", "ref": "SELECT * FROM products WHERE UPPER(name) LIKE '%CHAIR%';" },
    { "id": 20, "prompt": "Compute the profit margin percentage (rounded to 0 decimals) for each product.", "ref": "SELECT name, ROUND((unit_price - cost_price) * 100.0 / unit_price, 0) AS margin_pct FROM products;" },
    { "id": 21, "prompt": "Find employees with first_name length greater than 5.", "ref": "SELECT * FROM employees WHERE LENGTH(first_name) > 5;" },
    { "id": 22, "prompt": "Get the position of '@' in each employee's email using INSTR.", "ref": "SELECT email, INSTR(email, '@') AS at_position FROM employees;" },
    { "id": 23, "prompt": "Retrieve product name in LOWER case and its length.", "ref": "SELECT LOWER(name) AS name_lower, LENGTH(name) AS name_len FROM products;" },
    { "id": 24, "prompt": "Replace 'Ergonomic' with 'Premium' in all product names.", "ref": "SELECT REPLACE(name, 'Ergonomic', 'Premium') AS new_name FROM products;" },
    { "id": 25, "prompt": "Compute salary + ABS(commission - 5000) for employees with commission IS NOT NULL.", "ref": "SELECT first_name, salary + ABS(commission - 5000) AS adjusted_comp FROM employees WHERE commission IS NOT NULL;" }
  ],
  "topics": [
    { "id": "topic-1", "label": "Topic 1: String & Numeric Single-Row Functions", "recordingKey": null }
  ]
};
