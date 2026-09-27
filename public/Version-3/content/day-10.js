// Day 10 — Joins Fundamentals: INNER JOIN, LEFT JOIN, and Relational Keys
if (!window.COURSE_CONTENT) window.COURSE_CONTENT = {};
window.COURSE_CONTENT['day10'] = {
  "day": 10,
  "title": "Joins Fundamentals",
  "db": "retail",
  "emoji": "🔗",
  "slides": [
    {
      "title": "Joins Fundamentals — Combining Relational Tables",
      "duration": "9:15",
      "html": `<h2>🔗 Joins Fundamentals — Combining Relational Tables</h2>

        <!-- ── Section 01: Relational Architecture ── -->
        <div class="slide-section" id="day10RelationalSection">
          <h3 class="heading-with-audio" id="day10Relational">
            01. Why Joins? — Relational Data Design
          </h3>
          <p>In relational database design, data is normalized across specialized tables to eliminate redundancy and maintain integrity. Joins allow you to stitch these separate tables back together during query execution based on common relationship keys.</p>
        </div>

        <div class="slide-section" id="day10KeysSection">
          <div class="info-box" id="day10Keys">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color:var(--ink-teal); flex: 1;">🔑 Key Relationships in Retail DB:</strong>
            </div>
            <ul style="margin: 4px 0 0 16px; padding: 0; font-size: 0.88rem; line-height: 1.6;">
              <li><code>orders.customer_id</code> ➔ <code>customers.customer_id</code> (Foreign Key ➔ Primary Key)</li>
              <li><code>order_items.order_id</code> ➔ <code>orders.order_id</code></li>
              <li><code>order_items.product_id</code> ➔ <code>products.product_id</code></li>
              <li><code>products.category_id</code> ➔ <code>categories.id</code></li>
              <li><code>employees.department_id</code> ➔ <code>departments.department_id</code></li>
            </ul>
          </div>
        </div>

        <!-- ── Section 02: INNER JOIN Mechanics ── -->
        <div class="slide-section" id="day10InnerJoinSection">
          <h3 class="heading-with-audio" id="day10InnerJoin">
            02. INNER JOIN — Matching Records Only
          </h3>
          <p><code>INNER JOIN</code> compares keys from both tables and returns only rows that satisfy the <code>ON</code> join condition in <strong>both tables</strong>. Any unmatched row from either side is completely excluded.</p>
        </div>

        <div class="slide-section" id="day10AliasesSection">
          <div class="info-box" id="day10Aliases">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color:var(--ink-teal); flex: 1;">⚡ Table Aliases:</strong>
            </div>
            <p style="margin: 0;">Always assign short, meaningful aliases (e.g., <code>orders o</code>, <code>customers c</code>) to eliminate ambiguity when referencing identical column names across tables.</p>
          </div>
        </div>

        <div class="slide-section" id="day10InnerExamplesSection">
          <div class="terminal-card" id="day10InnerExamples">
            <div class="terminal-header">
              <span class="terminal-title">Query 1 — Orders with Customer Names (INNER JOIN)</span>
            </div>
            <div class="terminal-body">
              <pre><code>SELECT o.order_id,
       c.first_name,
       c.last_name,
       o.order_date,
       o.total_amount
FROM   orders o
INNER JOIN customers c
   ON  o.customer_id = c.customer_id;</code></pre>
            </div>
          </div>
        </div>

        <!-- ── Section 03: Multi-Table Joins ── -->
        <div class="slide-section" id="day10MultiTableSection">
          <h3 class="heading-with-audio" id="day10MultiTable">
            03. Multi-Table Joins (Chaining Tables)
          </h3>
          <p>Production queries often link 3, 4, or more tables together. SQL executes these joins sequentially, creating intermediate datasets that connect subsequent tables.</p>
        </div>

        <div class="slide-section" id="day10MultiExamplesSection">
          <div class="terminal-card" id="day10MultiExamples">
            <div class="terminal-header">
              <span class="terminal-title">Query 2 — Three-Table Join (Order Items ➔ Orders ➔ Products)</span>
            </div>
            <div class="terminal-body">
              <pre><code>SELECT oi.order_id,
       o.order_date,
       p.name AS product_name,
       oi.qty,
       oi.unit_price
FROM   order_items oi
INNER JOIN orders o
   ON  oi.order_id = o.order_id
INNER JOIN products p
   ON  oi.product_id = p.product_id;</code></pre>
            </div>
          </div>
        </div>

        <!-- ── Section 04: Joins with Aggregations ── -->
        <div class="slide-section" id="day10JoinAggSection">
          <h3 class="heading-with-audio" id="day10JoinAgg">
            04. Joins with GROUP BY Aggregations
          </h3>
          <p>Connecting joined datasets with <code>GROUP BY</code> powers core business metrics like customer lifetime value, category sales volume, and departmental payroll summaries.</p>
        </div>

        <!-- ── Section 05: LEFT OUTER JOIN ── -->
        <div class="slide-section" id="day10LeftJoinSection">
          <h3 class="heading-with-audio" id="day10LeftJoin">
            05. LEFT JOIN — Preserving Left Records
          </h3>
          <p>Unlike <code>INNER JOIN</code>, a <code>LEFT JOIN</code> (or <code>LEFT OUTER JOIN</code>) preserves <strong>every single row</strong> from the left table, even if no matching record exists in the right table.</p>
        </div>

        <div class="slide-section" id="day10NullPaddingSection">
          <div class="info-box" id="day10NullPadding">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color:var(--ink-teal); flex: 1;">🛡️ NULL-Padding Mechanics:</strong>
            </div>
            <p style="margin: 0;">When a left row has no match, the database populates all columns from the right table with <code>NULL</code> values. This makes <code>LEFT JOIN</code> essential when you need complete catalog or customer rosters without dropping inactive items.</p>
          </div>
        </div>

        <div class="slide-section" id="day10LeftExamplesSection">
          <div class="terminal-card" id="day10LeftExamples">
            <div class="terminal-header">
              <span class="terminal-title">Query 3 — All Customers &amp; Order Counts (LEFT JOIN)</span>
            </div>
            <div class="terminal-body">
              <pre><code>SELECT c.customer_id,
       c.first_name,
       COUNT(o.order_id) AS order_count
FROM   customers c
LEFT JOIN orders o
   ON  c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY order_count DESC;</code></pre>
            </div>
          </div>
        </div>

        <!-- ── Section 06: The Anti-Join Pattern ── -->
        <div class="slide-section" id="day10AntiJoinSection">
          <h3 class="heading-with-audio" id="day10AntiJoin">
            06. The Anti-Join Pattern
          </h3>
          <p>To find rows in Table A that have <strong>no corresponding records</strong> in Table B, use a <code>LEFT JOIN</code> combined with <code>WHERE right_table.key IS NULL</code>. This is one of the most frequently tested patterns in technical SQL interviews.</p>
        </div>

        <div class="slide-section" id="day10AntiExamplesSection">
          <div class="terminal-card" id="day10AntiExamples">
            <div class="terminal-header">
              <span class="terminal-title">Query 4 — Finding Inactive Customers (Anti-Join)</span>
            </div>
            <div class="terminal-body">
              <pre><code>SELECT c.customer_id,
       c.first_name,
       c.email
FROM   customers c
LEFT JOIN orders o
   ON  c.customer_id = o.customer_id
WHERE  o.order_id IS NULL;</code></pre>
            </div>
          </div>
        </div>

        <!-- ── Section 07: ON vs WHERE Gotcha ── -->
        <div class="slide-section" id="day10OnVsWhereSection">
          <div class="warn-box" id="day10OnVsWhere">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color:var(--ink-amber); flex: 1;">⚠️ The ON vs WHERE Clause Trap:</strong>
            </div>
            <p style="margin: 0;">If you filter right-table columns in the <code>WHERE</code> clause (e.g. <code>WHERE o.status = 'Shipped'</code>), any NULL-padded row from the left table fails the check! This silently converts your <code>LEFT JOIN</code> into an <code>INNER JOIN</code>! Always place right-table filtering conditions directly inside the <code>ON</code> clause to preserve left rows.</p>
          </div>
        </div>

        <div class="slide-section" id="day10VennSection">
          <div class="info-box" id="day10Venn">
            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px; width: 100%;">
              <strong style="color:var(--ink-teal); flex: 1;">🌐 Cross-Engine Join Capabilities:</strong>
            </div>
            <p style="margin: 0;">SQLite and MySQL natively support <code>INNER JOIN</code>, <code>LEFT JOIN</code>, and <code>CROSS JOIN</code>. Full outer joins (<code>FULL JOIN</code>) and <code>RIGHT JOIN</code> are supported in PostgreSQL, SQL Server, and Snowflake.</p>
          </div>
        </div>

        <!-- ── Section 08: Top 25 Interview Q&A ── -->
        <div class="slide-section" id="day10QASection">
          <div class="interview-box">
            <h4 id="day10QAHeading" style="margin: 0 0 12px 0; font-size: 1rem; color: #38bdf8; display: flex; align-items: center; gap: 6px;">
              <span>🎯</span> Top 25 SQL Interview Q&amp;A — Joins Fundamentals
            </h4>

            <div id="day10QA1">
              <p><strong>Q1: What rows are returned by an INNER JOIN between Table A and Table B?</strong></p>
              <p><em>A: Only rows where the join predicate evaluates to TRUE in both tables. Any unmatched row from either Table A or Table B is completely excluded.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA2">
              <p><strong>Q2: What happens to rows in the left table that have no matching records in the right table during a LEFT JOIN?</strong></p>
              <p><em>A: They are preserved in the result set. All columns originating from the right table are padded with NULL values for those unmatched left rows.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA3">
              <p><strong>Q3: How do you identify records in Table A that have no matching records in Table B using an Anti-Join?</strong></p>
              <p><em>A: Perform a <code>LEFT JOIN</code> from Table A to Table B on the foreign key relationship, and add a <code>WHERE right_table.primary_key IS NULL</code> filter.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA4">
              <p><strong>Q4: What is the critical consequence of placing a right-table filter in the WHERE clause of a LEFT JOIN query?</strong></p>
              <p><em>A: It silently converts the <code>LEFT JOIN</code> into an <code>INNER JOIN</code>. Since unmatched left rows have NULL for right-table attributes, any comparison (like <code>WHERE o.status = 'Shipped'</code>) evaluates to UNKNOWN and drops them. Always place right-table filters inside the <code>ON</code> clause.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA5">
              <p><strong>Q5: In a relational database schema, what is the role of a Foreign Key?</strong></p>
              <p><em>A: A Foreign Key is a column (or set of columns) in one table that references the Primary Key of another table, enforcing referential integrity and linking related entities.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA6">
              <p><strong>Q6: If Table A has 10 rows and Table B has 5 rows, what is the minimum number of rows an INNER JOIN can return?</strong></p>
              <p><em>A: 0 rows. If no records satisfy the join condition between the two tables, an INNER JOIN returns an empty result set.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA7">
              <p><strong>Q7: If Table A has 10 rows and Table B has 5 rows, what is the minimum number of rows a LEFT JOIN from A to B can return?</strong></p>
              <p><em>A: 10 rows. A LEFT JOIN unconditionally preserves every row from the left table (assuming no 1-to-many Cartesian multiplication).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA8">
              <p><strong>Q8: Why are table aliases (e.g. orders AS o) strongly recommended in multi-table queries?</strong></p>
              <p><em>A: Aliases prevent ambiguous column errors when tables share column names (like <code>id</code> or <code>created_at</code>), make complex join conditions readable, and are strictly required in self-joins.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA9">
              <p><strong>Q9: When counting records in a LEFT JOIN query, why should you write COUNT(o.order_id) instead of COUNT(*)?</strong></p>
              <p><em>A: <code>COUNT(*)</code> counts physical rows, returning 1 for customers with 0 orders because their customer row was preserved. <code>COUNT(o.order_id)</code> ignores NULL values and correctly reports 0 orders.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA10">
              <p><strong>Q10: What type of join returns all possible combinations of rows between two tables without a join condition?</strong></p>
              <p><em>A: <code>CROSS JOIN</code> (Cartesian product). If Table A has M rows and Table B has N rows, it produces M × N total rows.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA11">
              <p><strong>Q11: Can you join a table to itself in SQL (Self-Join)?</strong></p>
              <p><em>A: Yes, by referencing the table twice with two distinct aliases (e.g. <code>FROM employees emp INNER JOIN employees mgr ON emp.manager_id = mgr.employee_id</code>).</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA12">
              <p><strong>Q12: What is the result of joining on two columns that both contain NULL?</strong></p>
              <p><em>A: They do not match. In SQL three-valued logic, <code>NULL = NULL</code> evaluates to UNKNOWN (not TRUE), so standard join predicates discard rows where both join keys are NULL.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA13">
              <p><strong>Q13: What is a 1-to-Many relationship in a relational database?</strong></p>
              <p><em>A: A relationship where a single record in the parent table can relate to zero, one, or multiple records in the child table (e.g. one customer can place many orders), but each child record references at most one parent.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA14">
              <p><strong>Q14: Which join clause evaluates matching rows between Table A and Table B and preserves unmatched rows from BOTH tables?</strong></p>
              <p><em>A: <code>FULL OUTER JOIN</code>. It preserves unmatched rows from both the left and right tables, padding missing columns on either side with NULLs.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA15">
              <p><strong>Q15: In a 3-table join: orders JOIN order_items JOIN products, in what order does SQL join the tables?</strong></p>
              <p><em>A: The database query optimizer dynamically analyzes table statistics, index structures, and selective filter predicates to determine the most cost-effective join order, regardless of the written textual order.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA16">
              <p><strong>Q16: What is the keyword used to specify the join condition in SQL?</strong></p>
              <p><em>A: <code>ON</code> (e.g. <code>ON a.customer_id = b.customer_id</code>) or <code>USING (customer_id)</code> when both tables share identical column names.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA17">
              <p><strong>Q17: What happens if you omit the ON condition in an INNER JOIN?</strong></p>
              <p><em>A: In standard ANSI SQL it raises a syntax error; in dialects that permit it, it degenerates into a Cartesian cross-product.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA18">
              <p><strong>Q18: Which function is frequently used with LEFT JOIN to replace NULL totals with 0?</strong></p>
              <p><em>A: <code>COALESCE()</code>. For example: <code>COALESCE(SUM(o.total_amount), 0)</code> ensures non-purchasing customers display 0 instead of NULL in KPI reports.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA19">
              <p><strong>Q19: Can you use aggregate functions (like SUM or COUNT) inside the ON clause of a JOIN?</strong></p>
              <p><em>A: No. Join conditions are evaluated row-by-row during the relational scan stage before group-level aggregation happens. Aggregates must be evaluated in subqueries or CTEs first.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA20">
              <p><strong>Q20: In SQLite, what is the standard equivalent of a RIGHT JOIN?</strong></p>
              <p><em>A: Reversing the order of the tables in a <code>LEFT JOIN</code>. <code>A RIGHT JOIN B</code> is logically identical to <code>B LEFT JOIN A</code>.</em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA21">
              <p><strong>Q21: How do you join orders and customers to return customer email?</strong></p>
              <p><em>A: <code>SELECT o.order_id, c.email FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;</code></em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA22">
              <p><strong>Q22: How do you join products and categories returning product name and category name?</strong></p>
              <p><em>A: <code>SELECT p.name, c.name AS category_name FROM products p INNER JOIN categories c ON p.category_id = c.id;</code></em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA23">
              <p><strong>Q23: How do you perform a LEFT JOIN from customers to orders?</strong></p>
              <p><em>A: <code>SELECT c.customer_id, o.order_id FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;</code></em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA24">
              <p><strong>Q24: How do you write an Anti-Join finding customers without any orders?</strong></p>
              <p><em>A: <code>SELECT c.customer_id, c.first_name FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL;</code></em></p>
            </div>
            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin: 10px 0;" />

            <div id="day10QA25">
              <p><strong>Q25: How do you aggregate department headcount across joined tables?</strong></p>
              <p><em>A: <code>SELECT d.department_name, COUNT(e.employee_id) AS headcount FROM departments d INNER JOIN employees e ON d.department_id = e.department_id GROUP BY d.department_name;</code></em></p>
            </div>
          </div>
        </div>`
    }
  ],

  "practiceQuestions": [
    {
      "id": 1,
      "title": "Orders with Customer Names",
      "prompt": "Perform an <code>INNER JOIN</code> between <code>orders</code> and <code>customers</code> on <code>customer_id</code>. Return <code>order_id</code>, <code>first_name</code>, <code>last_name</code>, <code>order_date</code>, and <code>total_amount</code>.",
      "starterSql": "SELECT o.order_id,\n       o.order_date,\n       o.total_amount\nFROM   orders o;",
      "referenceSql": "SELECT o.order_id,\n       c.first_name,\n       c.last_name,\n       o.order_date,\n       o.total_amount\nFROM   orders o\nINNER JOIN customers c\n   ON  o.customer_id = c.customer_id;",
      "solutionAudio": "Day10/New_Day10Question01sol.mp3"
    },
    {
      "id": 2,
      "title": "Products with Category Names",
      "prompt": "Join <code>products</code> with <code>categories</code> where <code>p.category_id = c.id</code>. Return <code>product_id</code>, <code>product_name</code> (p.name), <code>category_name</code> (c.name), and <code>unit_price</code>.",
      "starterSql": "SELECT p.product_id,\n       p.name AS product_name,\n       p.unit_price\nFROM   products p;",
      "referenceSql": "SELECT p.product_id,\n       p.name AS product_name,\n       c.name AS category_name,\n       p.unit_price\nFROM   products p\nINNER JOIN categories c\n   ON  p.category_id = c.id;",
      "solutionAudio": "Day10/New_Day10Question02sol.mp3"
    },
    {
      "id": 3,
      "title": "Employees with Department Names",
      "prompt": "Join <code>employees</code> with <code>departments</code> on <code>department_id</code>. Return <code>employee_id</code>, <code>first_name</code>, <code>last_name</code>, <code>job_title</code>, and <code>department_name</code>.",
      "starterSql": "SELECT e.employee_id,\n       e.first_name,\n       e.last_name,\n       e.job_title\nFROM   employees e;",
      "referenceSql": "SELECT e.employee_id,\n       e.first_name,\n       e.last_name,\n       e.job_title,\n       d.department_name\nFROM   employees e\nINNER JOIN departments d\n   ON  e.department_id = d.department_id;",
      "solutionAudio": "Day10/New_Day10Question03sol.mp3"
    },
    {
      "id": 4,
      "title": "Three-Table Line Items Join",
      "prompt": "Join <code>order_items</code> with <code>orders</code> and <code>products</code>. Return <code>order_id</code>, <code>order_date</code>, <code>product_name</code> (p.name), <code>qty</code>, and <code>unit_price</code> (oi.unit_price).",
      "starterSql": "SELECT oi.order_id,\n       oi.qty,\n       oi.unit_price\nFROM   order_items oi;",
      "referenceSql": "SELECT oi.order_id,\n       o.order_date,\n       p.name AS product_name,\n       oi.qty,\n       oi.unit_price\nFROM   order_items oi\nINNER JOIN orders o\n   ON  oi.order_id = o.order_id\nINNER JOIN products p\n   ON  oi.product_id = p.product_id;",
      "solutionAudio": "Day10/New_Day10Question04sol.mp3"
    },
    {
      "id": 5,
      "title": "Total Customer Spending",
      "prompt": "Join <code>customers</code> with <code>orders</code>, grouping by customer to return <code>customer_id</code>, <code>first_name</code>, <code>last_name</code>, and <code>total_spent</code> (sum of o.total_amount), ordered by spending descending.",
      "starterSql": "SELECT c.customer_id,\n       c.first_name,\n       c.last_name\nFROM   customers c;",
      "referenceSql": "SELECT c.customer_id,\n       c.first_name,\n       c.last_name,\n       SUM(o.total_amount) AS total_spent\nFROM   customers c\nINNER JOIN orders o\n   ON  c.customer_id = o.customer_id\nGROUP BY c.customer_id, c.first_name, c.last_name\nORDER BY total_spent DESC;",
      "solutionAudio": "Day10/New_Day10Question05sol.mp3"
    },
    {
      "id": 6,
      "title": "Category Catalog Summary",
      "prompt": "Join <code>categories</code> with <code>products</code> on <code>c.id = p.category_id</code>, returning <code>category_name</code> (c.name), <code>product_count</code> (count of p.product_id), and <code>avg_price</code> rounded to 2 decimals, ordered by product count descending.",
      "starterSql": "SELECT c.name AS category_name\nFROM   categories c;",
      "referenceSql": "SELECT c.name AS category_name,\n       COUNT(p.product_id) AS product_count,\n       ROUND(AVG(p.unit_price), 2) AS avg_price\nFROM   categories c\nINNER JOIN products p\n   ON  c.id = p.category_id\nGROUP BY c.name\nORDER BY product_count DESC;",
      "solutionAudio": "Day10/New_Day10Question06sol.mp3"
    },
    {
      "id": 7,
      "title": "Auditing All Customers with LEFT JOIN",
      "prompt": "Perform a <code>LEFT JOIN</code> from <code>customers</code> to <code>orders</code> on <code>customer_id</code>. Return <code>customer_id</code>, <code>first_name</code>, and <code>order_count</code> (count of o.order_id), including customers with 0 orders, ordered by order count descending.",
      "starterSql": "SELECT c.customer_id,\n       c.first_name\nFROM   customers c;",
      "referenceSql": "SELECT c.customer_id,\n       c.first_name,\n       COUNT(o.order_id) AS order_count\nFROM   customers c\nLEFT JOIN orders o\n   ON  c.customer_id = o.customer_id\nGROUP BY c.customer_id, c.first_name\nORDER BY order_count DESC;",
      "solutionAudio": "Day10/New_Day10Question07sol.mp3"
    },
    {
      "id": 8,
      "title": "Identify Inactive Customers (Anti-Join)",
      "prompt": "Find customers who have never placed an order using an Anti-Join (LEFT JOIN from <code>customers</code> to <code>orders</code> where <code>o.order_id IS NULL</code>). Return <code>customer_id</code>, <code>first_name</code>, and <code>email</code>.",
      "starterSql": "SELECT c.customer_id,\n       c.first_name,\n       c.email\nFROM   customers c;",
      "referenceSql": "SELECT c.customer_id,\n       c.first_name,\n       c.email\nFROM   customers c\nLEFT JOIN orders o\n   ON  c.customer_id = o.customer_id\nWHERE  o.order_id IS NULL;",
      "solutionAudio": "Day10/New_Day10Question08sol.mp3"
    },
    {
      "id": 9,
      "title": "Audit Empty Categories with LEFT JOIN",
      "prompt": "Perform a <code>LEFT JOIN</code> from <code>categories</code> to <code>products</code> on <code>c.id = p.category_id</code>. Return <code>category_id</code> (c.id), <code>category_name</code> (c.name), and <code>product_count</code> (COUNT of p.product_id), ordered by count ascending.",
      "starterSql": "SELECT c.id AS category_id,\n       c.name AS category_name\nFROM   categories c;",
      "referenceSql": "SELECT c.id AS category_id,\n       c.name AS category_name,\n       COUNT(p.product_id) AS product_count\nFROM   categories c\nLEFT JOIN products p\n   ON  c.id = p.category_id\nGROUP BY c.id, c.name\nORDER BY product_count ASC;",
      "solutionAudio": "Day10/New_Day10Question09sol.mp3"
    },
    {
      "id": 10,
      "title": "Order Line Totals",
      "prompt": "Join <code>order_items</code> with <code>products</code> on <code>product_id</code>. Return <code>order_id</code>, <code>product_name</code> (p.name), <code>qty</code>, <code>unit_price</code> (oi.unit_price), and calculated <code>line_total</code> (oi.qty * oi.unit_price).",
      "starterSql": "SELECT oi.order_id,\n       oi.qty,\n       oi.unit_price\nFROM   order_items oi;",
      "referenceSql": "SELECT oi.order_id,\n       p.name AS product_name,\n       oi.qty,\n       oi.unit_price,\n       oi.qty * oi.unit_price AS line_total\nFROM   order_items oi\nINNER JOIN products p\n   ON  oi.product_id = p.product_id;",
      "solutionAudio": "Day10/New_Day10Question10sol.mp3"
    },
    {
      "id": 11,
      "title": "Department Headcount with LEFT JOIN",
      "prompt": "Perform a <code>LEFT JOIN</code> from <code>departments</code> to <code>employees</code> on <code>department_id</code>. Return <code>department_name</code>, <code>headcount</code> (COUNT of e.employee_id), and <code>total_payroll</code> (COALESCE of sum of salary, 0), ordered by payroll descending.",
      "starterSql": "SELECT d.department_name\nFROM   departments d;",
      "referenceSql": "SELECT d.department_name,\n       COUNT(e.employee_id) AS headcount,\n       COALESCE(SUM(e.salary), 0) AS total_payroll\nFROM   departments d\nLEFT JOIN employees e\n   ON  d.department_id = e.department_id\nGROUP BY d.department_name\nORDER BY total_payroll DESC;",
      "solutionAudio": "Day10/New_Day10Question11sol.mp3"
    },
    {
      "id": 12,
      "title": "Joined Orders in Calendar Year 2024",
      "prompt": "Join <code>orders</code> with <code>customers</code> for orders placed in the year 2024 (between '2024-01-01' and '2024-12-31'). Return <code>order_id</code>, customer <code>first_name</code>, <code>order_date</code>, and <code>total_amount</code>, ordered chronologically.",
      "starterSql": "SELECT o.order_id,\n       o.order_date,\n       o.total_amount\nFROM   orders o;",
      "referenceSql": "SELECT o.order_id,\n       c.first_name,\n       o.order_date,\n       o.total_amount\nFROM   orders o\nINNER JOIN customers c\n   ON  o.customer_id = c.customer_id\nWHERE  o.order_date >= '2024-01-01'\n  AND  o.order_date <= '2024-12-31'\nORDER BY o.order_date;",
      "solutionAudio": "Day10/New_Day10Question12sol.mp3"
    },
    {
      "id": 13,
      "title": "High-Value Customer Orders",
      "prompt": "Join <code>orders</code> with <code>customers</code> for orders where <code>total_amount &gt;= 50000</code>. Return <code>order_id</code>, <code>first_name</code>, <code>region</code>, and <code>total_amount</code>, ordered by amount descending.",
      "starterSql": "SELECT o.order_id,\n       o.total_amount\nFROM   orders o;",
      "referenceSql": "SELECT o.order_id,\n       c.first_name,\n       c.region,\n       o.total_amount\nFROM   orders o\nINNER JOIN customers c\n   ON  o.customer_id = c.customer_id\nWHERE  o.total_amount >= 50000\nORDER BY o.total_amount DESC;",
      "solutionAudio": "Day10/New_Day10Question13sol.mp3"
    },
    {
      "id": 14,
      "title": "Unsold Catalog Products (Anti-Join)",
      "prompt": "Identify catalog products that have never been purchased. Perform a <code>LEFT JOIN</code> from <code>products</code> to <code>order_items</code> on <code>product_id</code> where <code>oi.id IS NULL</code>. Return <code>product_id</code>, <code>product_name</code> (p.name), and <code>unit_price</code>.",
      "starterSql": "SELECT p.product_id,\n       p.name AS product_name,\n       p.unit_price\nFROM   products p;",
      "referenceSql": "SELECT p.product_id,\n       p.name AS product_name,\n       p.unit_price\nFROM   products p\nLEFT JOIN order_items oi\n   ON  p.product_id = oi.product_id\nWHERE  oi.id IS NULL;",
      "solutionAudio": "Day10/New_Day10Question14sol.mp3"
    },
    {
      "id": 15,
      "title": "Regional Revenue Rollup",
      "prompt": "Join <code>customers</code> with <code>orders</code> to aggregate performance by customer <code>region</code>. Return <code>region</code>, <code>total_orders</code> (COUNT of order_id), and <code>regional_revenue</code> (SUM of total_amount), ordered by revenue descending.",
      "starterSql": "SELECT c.region\nFROM   customers c;",
      "referenceSql": "SELECT c.region,\n       COUNT(o.order_id) AS total_orders,\n       SUM(o.total_amount) AS regional_revenue\nFROM   customers c\nINNER JOIN orders o\n   ON  c.customer_id = o.customer_id\nGROUP BY c.region\nORDER BY regional_revenue DESC;",
      "solutionAudio": "Day10/New_Day10Question15sol.mp3"
    }
  ],

  "testQuestions": [
    { "id": 1, "type": "mcq", "question": "What rows are returned by an INNER JOIN between Table A and Table B?", "options": ["All rows from Table A, plus matching rows from Table B", "Only rows where the join condition evaluates to true in both tables", "All rows from both tables, with NULLs for unmatched rows", "The Cartesian cross-product of both tables"], "answer": "Only rows where the join condition evaluates to true in both tables", "explanation": "INNER JOIN requires matches in both tables based on the join predicate." },
    { "id": 2, "type": "mcq", "question": "What happens to rows in the left table that have no matching records in the right table during a LEFT JOIN?", "options": ["They are dropped from the result set", "They are preserved in the result set, with NULL values filled in for all right-table columns", "SQL raises a ConstraintViolationError", "They are assigned values from the first row of the right table"], "answer": "They are preserved in the result set, with NULL values filled in for all right-table columns", "explanation": "LEFT JOIN keeps all rows from the left table and pads missing right-table columns with NULL." },
    { "id": 3, "type": "mcq", "question": "How do you identify records in Table A that have no matching records in Table B using an Anti-Join?", "options": ["SELECT * FROM A INNER JOIN B ON A.id = B.id WHERE B.id IS NOT NULL", "SELECT * FROM A LEFT JOIN B ON A.id = B.id WHERE B.id IS NULL", "SELECT * FROM A RIGHT JOIN B ON A.id = B.id WHERE A.id IS NULL", "SELECT * FROM A FULL JOIN B ON A.id = B.id"], "answer": "SELECT * FROM A LEFT JOIN B ON A.id = B.id WHERE B.id IS NULL", "explanation": "The Anti-Join pattern performs a LEFT JOIN and filters for rows where the right table's primary key IS NULL." },
    { "id": 4, "type": "mcq", "question": "What is the critical consequence of placing a right-table filter in the WHERE clause of a LEFT JOIN query?", "options": ["It improves query performance by 2x", "It silently converts the LEFT JOIN into an INNER JOIN because NULL-padded rows fail the WHERE predicate", "It produces duplicate rows", "It raises an AmbiguousColumnException"], "answer": "It silently converts the LEFT JOIN into an INNER JOIN because NULL-padded rows fail the WHERE predicate", "explanation": "Because NULL = 'value' evaluates to UNKNOWN, any row with NULL in the right-table column is discarded, defeating the purpose of the LEFT JOIN." },
    { "id": 5, "type": "mcq", "question": "In a database schema, what is the role of a Foreign Key?", "options": ["To encrypt sensitive table columns", "To reference the Primary Key of another table, ensuring referential integrity", "To index columns for faster sorting", "To prevent NULL values in a table"], "answer": "To reference the Primary Key of another table, ensuring referential integrity", "explanation": "A Foreign Key establishes a relationship by referencing the Primary Key of another table." },
    { "id": 6, "type": "mcq", "question": "If Table A has 10 rows and Table B has 5 rows, what is the minimum number of rows an INNER JOIN can return?", "options": ["0", "5", "10", "50"], "answer": "0", "explanation": "If no rows satisfy the join predicate, an INNER JOIN returns zero rows." },
    { "id": 7, "type": "mcq", "question": "If Table A has 10 rows and Table B has 5 rows, what is the minimum number of rows a LEFT JOIN from A to B can return?", "options": ["0", "5", "10", "15"], "answer": "10", "explanation": "A LEFT JOIN preserves every row from the left table, so it will return at least 10 rows (assuming no 1-to-many multiplication)." },
    { "id": 8, "type": "mcq", "question": "Why are table aliases (e.g., orders AS o) strongly recommended in multi-table queries?", "options": ["They are required by the ANSI SQL compiler", "They avoid column name ambiguity and make the query more readable", "They speed up query execution", "They prevent Cartesian products"], "answer": "They avoid column name ambiguity and make the query more readable", "explanation": "Aliases prefix columns cleanly (e.g. o.order_id vs oi.order_id) and prevent ambiguous column reference errors." },
    { "id": 9, "type": "mcq", "question": "When counting records in a LEFT JOIN query (e.g. customers LEFT JOIN orders), why should you write COUNT(o.order_id) instead of COUNT(*)?", "options": ["COUNT(*) counts the row itself, returning 1 for customers with 0 orders; COUNT(o.order_id) correctly returns 0", "COUNT(*) is invalid with LEFT JOIN", "COUNT(o.order_id) is faster", "COUNT(*) only works in INNER JOIN"], "answer": "COUNT(*) counts the row itself, returning 1 for customers with 0 orders; COUNT(o.order_id) correctly returns 0", "explanation": "COUNT(*) counts the preserved customer row even when order_id is NULL. COUNT(column) ignores NULLs, correctly returning 0." },
    { "id": 10, "type": "mcq", "question": "What type of join returns all possible combinations of rows between two tables without a join condition?", "options": ["INNER JOIN", "CROSS JOIN", "NATURAL JOIN", "LEFT JOIN"], "answer": "CROSS JOIN", "explanation": "A CROSS JOIN produces the Cartesian product of two tables (rows in A multiplied by rows in B)." },
    { "id": 11, "type": "mcq", "question": "Can you join a table to itself in SQL (Self-Join)?", "options": ["No, a table can only be joined to a different table", "Yes, by assigning distinct aliases to the two instances of the table", "Only with CTEs", "Only in MySQL"], "answer": "Yes, by assigning distinct aliases to the two instances of the table", "explanation": "Self-joins are common for hierarchical data (e.g., employees joined with employees to match manager_id to employee_id)." },
    { "id": 12, "type": "mcq", "question": "What is the result of joining on two columns that both contain NULL?", "options": ["They match and return the row", "They do not match because in SQL, NULL = NULL evaluates to UNKNOWN", "An error is raised", "They match only if CAST to text"], "answer": "They do not match because in SQL, NULL = NULL evaluates to UNKNOWN", "explanation": "Join conditions evaluate equality; since NULL = NULL is not TRUE, NULL values do not match in standard joins." },
    { "id": 13, "type": "mcq", "question": "What is a 1-to-Many relationship in a relational database?", "options": ["One row in Table A can relate to multiple rows in Table B, but each row in B relates to only one row in A", "Both tables have identical primary keys", "Multiple rows in A relate to multiple rows in B", "A table references itself"], "answer": "One row in Table A can relate to multiple rows in Table B, but each row in B relates to only one row in A", "explanation": "For example, one customer can have many orders, but each order belongs to exactly one customer." },
    { "id": 14, "type": "mcq", "question": "Which join clause evaluates matching rows between Table A and Table B and preserves unmatched rows from BOTH tables?", "options": ["INNER JOIN", "FULL OUTER JOIN", "CROSS JOIN", "NATURAL JOIN"], "answer": "FULL OUTER JOIN", "explanation": "FULL OUTER JOIN preserves unmatched rows from both the left and right tables." },
    { "id": 15, "type": "mcq", "question": "In a 3-table join: orders JOIN order_items JOIN products, in what order does SQL join the tables?", "options": ["Always in reverse alphabetical order", "The SQL query planner evaluates table statistics and determines the most efficient join order", "Strictly from right to left", "All three are joined simultaneously"], "answer": "The SQL query planner evaluates table statistics and determines the most efficient join order", "explanation": "The database cost-based optimizer determines the join tree based on row counts, index availability, and filters." },
    { "id": 16, "type": "mcq", "question": "What is the keyword used to specify the join condition in SQL?", "options": ["ON", "USING", "WHERE", "Both ON and USING are valid"], "answer": "Both ON and USING are valid", "explanation": "You can specify join predicates using ON (e.g. ON a.id = b.id) or USING (e.g. USING (customer_id)) when column names match." },
    { "id": 17, "type": "mcq", "question": "What happens if you omit the ON condition in an INNER JOIN?", "options": ["SQL defaults to matching identical column names", "SQL raises a syntax error or performs a CROSS JOIN depending on SQL dialect", "It performs an anti-join", "It joins only primary keys"], "answer": "SQL raises a syntax error or performs a CROSS JOIN depending on SQL dialect", "explanation": "Standard SQL requires an ON clause for INNER JOIN; omitting it is either a syntax error or creates a Cartesian product." },
    { "id": 18, "type": "mcq", "question": "Which function is frequently used with LEFT JOIN to replace NULL totals with 0?", "options": ["REPLACE()", "COALESCE()", "NULLIF()", "TRIM()"], "answer": "COALESCE()", "explanation": "COALESCE(SUM(amount), 0) replaces NULL sums with 0 for left rows that have no right-table matches." },
    { "id": 19, "type": "mcq", "question": "Can you use aggregate functions (like SUM or COUNT) inside the ON clause of a JOIN?", "options": ["Yes, always", "No, aggregate functions cannot appear in the ON clause", "Only with HAVING", "Only in subqueries"], "answer": "No, aggregate functions cannot appear in the ON clause", "explanation": "The ON clause evaluates row-level predicates before aggregation takes place." },
    { "id": 20, "type": "mcq", "question": "In SQLite, what is the equivalent of a RIGHT JOIN?", "options": ["Reversing the order of tables in a LEFT JOIN", "Using RIGHT OUTER JOIN keyword", "SQLite does not support any outer joins", "Using CROSS JOIN with WHERE"], "answer": "Reversing the order of tables in a LEFT JOIN", "explanation": "Because SQLite historically does not support the RIGHT JOIN keyword, switching table positions in a LEFT JOIN produces the identical result." },
    { "id": 21, "type": "code", "question": "Write an INNER JOIN between `orders` and `customers` on `customer_id` returning `order_id` and customer `email`.", "answer": "SELECT o.order_id, c.email FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;" },
    { "id": 22, "type": "code", "question": "Write an INNER JOIN between `products` and `categories` on `p.category_id = c.id` returning product `name` and category `name` AS category_name.", "answer": "SELECT p.name, c.name AS category_name FROM products p INNER JOIN categories c ON p.category_id = c.id;" },
    { "id": 23, "type": "code", "question": "Write a LEFT JOIN from `customers` to `orders` on `customer_id` returning `customer_id` and `order_id`.", "answer": "SELECT c.customer_id, o.order_id FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;" },
    { "id": 24, "type": "code", "question": "Write an Anti-Join finding `customer_id` and `first_name` of customers who have no orders in `orders`.", "answer": "SELECT c.customer_id, c.first_name FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL;" },
    { "id": 25, "type": "code", "question": "Write a query joining `departments` and `employees` on `department_id` returning `department_name` and count of employees as `headcount`.", "answer": "SELECT d.department_name, COUNT(e.employee_id) AS headcount FROM departments d INNER JOIN employees e ON d.department_id = e.department_id GROUP BY d.department_name;" }
  ]
};
