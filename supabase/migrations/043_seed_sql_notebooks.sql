-- ═══════════════════════════════════════════════════════════════
-- Seed Notebook Content: SQL Days 01 to 20
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.notebook_content (day_id, title, html_body, sections, cells)
VALUES
('sql-day01', 'SQL Day 01: Introduction to SQL & Databases', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Introduction to SQL & Databases</h2>
<p>Understand RDBMS concepts, tables, columns, rows, and write your first SELECT statements to retrieve data.</p>
<h3>📋 Database Source: <code>retail.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. What is a Database? : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Understanding RDBMS and Tables</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>A database is an organized collection of structured data. A Relational Database Management System (RDBMS) stores data in tables consisting of columns (attributes) and rows (records). Unlike spreadsheets, databases enforce data types, handle millions of rows efficiently, and prevent duplicates through constraints.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Look at the schema of the sales table
SELECT * FROM sales LIMIT 5;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Basic Querying-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Basic Querying</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a query to retrieve all columns from the <code>products</code> table.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Retrieve only the <code>name</code> and <code>unit_price</code> columns from the <code>products</code> table.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Retrieve the <code>product</code> and <code>amount</code> from the <code>sales</code> table, aliasing <code>product</code> as <code>product_name</code> and <code>amount</code> as <code>sale_value</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> List all unique (distinct) product categories from the <code>sales</code> table.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a query to find all unique regions from the <code>sales</code> table.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Categories Sold):</strong> Write a query to list all unique product categories sold from the <code>sales</code> table.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a query to show all details of products, but rename <code>stock_qty</code> to <code>available_units</code>.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 1 Executive Summary</h2></div>
<p>You have mastered Day 1 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 2</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Introduction to SQL & Databases"}, {"anchor": "sec-1", "title": "1. What is a Database? : Understanding RDBMS and Tables"}, {"anchor": "checks-Basic Querying-3", "title": "🧪 Checks: Basic Querying"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day02', 'SQL Day 02: Filtering Data with WHERE', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Filtering Data with WHERE</h2>
<p>Filter query results using conditional statements, logical operators, and value list checking.</p>
<h3>📋 Database Source: <code>retail.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. The WHERE Clause : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Conditional Filtering</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>The WHERE clause is used to filter records that meet specific conditions. You can use operators like <code>=</code>, <code>!=</code>, <code>></code>, <code><</code>, <code>>=</code>, <code><=</code>, as well as logical operators <code>AND</code>, <code>OR</code>, <code>NOT</code>. Precedence can be controlled using parentheses.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Find sales in the &#x27;North&#x27; region where amount is greater than 1000
SELECT * FROM sales WHERE region = &#x27;North&#x27; AND amount &gt; 1000;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-WHERE Filters-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>WHERE Filters</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Find all sales where the <code>category</code> is ''Electronics''.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find all sales where the <code>amount</code> is between 5000 and 10000 (inclusive) using <code>BETWEEN</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Get all products in the <code>products</code> table where <code>unit_price</code> is less than or equal to 2000.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Find sales in ''South'' or ''West'' regions using the <code>IN</code> operator.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Find sales that are NOT in the ''North'' region.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (High Value North):</strong> Find all sales over ₹5,000 in the ''North'' region.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Select all products with a unit price strictly greater than 5000 and stock quantity greater than 20.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 2 Executive Summary</h2></div>
<p>You have mastered Day 2 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 3</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Filtering Data with WHERE"}, {"anchor": "sec-1", "title": "1. The WHERE Clause : Conditional Filtering"}, {"anchor": "checks-WHERE Filters-3", "title": "🧪 Checks: WHERE Filters"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day03', 'SQL Day 03: Pattern Matching & NULL Handling', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Pattern Matching & NULL Handling</h2>
<p>Perform text search using wildcards and understand how to handle missing (NULL) values correctly.</p>
<h3>📋 Database Source: <code>retail.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. LIKE & NULLs : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Wildcards and Missing Data</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>The <code>LIKE</code> operator is used with <code>%</code> (any characters) and <code>_</code> (single character) for pattern matching. <code>NULL</code> represents missing or unknown values, which must be checked with <code>IS NULL</code> or <code>IS NOT NULL</code> (not <code>= NULL</code>). <code>COALESCE</code> replaces NULLs with fallback values.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Find customers with names containing &#x27;Kumar&#x27;
SELECT * FROM sales WHERE customer_name LIKE &#x27;%Kumar%&#x27;;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Wildcards & NULL Handling-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Wildcards & NULL Handling</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Find all sales records where <code>customer_name</code> starts with the letter ''A''.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find all sales records where <code>customer_email</code> is NULL.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Find all sales records where <code>customer_email</code> is NOT NULL.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a query using <code>COALESCE</code> to display the customer''s email, or the text ''No Email'' if it is NULL.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Find sales where the product name ends with ''Book''.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Customer Search):</strong> Find all customers whose names start with ''A'' or have a NULL email.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a query to find all products where name starts with ''Wireless'' and category is ''Electronics''.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 3 Executive Summary</h2></div>
<p>You have mastered Day 3 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 4</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Pattern Matching & NULL Handling"}, {"anchor": "sec-1", "title": "1. LIKE & NULLs : Wildcards and Missing Data"}, {"anchor": "checks-Wildcards & NULL Handling-3", "title": "🧪 Checks: Wildcards & NULL Handling"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day04', 'SQL Day 04: Sorting & Limiting Results', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Sorting & Limiting Results</h2>
<p>Control the display order of rows and restrict output size for pagination or top-N analysis.</p>
<h3>📋 Database Source: <code>retail.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Sorting & Limits : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">ORDER BY and LIMIT</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>The <code>ORDER BY</code> clause sorts results by one or more columns in ascending (ASC) or descending (DESC) order. <code>LIMIT</code> restricts the number of returned rows. <code>OFFSET</code> skips a specified number of rows, useful for pagination.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Sort products by price descending and limit to top 3
SELECT * FROM products ORDER BY unit_price DESC LIMIT 3;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Sorting and Limiting-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Sorting and Limiting</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Sort the <code>sales</code> table by <code>amount</code> in descending order.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Sort the <code>sales</code> table by <code>region</code> ascending, and then by <code>amount</code> descending.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Get the top 5 highest sales amount records.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Get the 5 next highest sales amount records (skipping the top 5) using <code>OFFSET</code>.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Sort the <code>products</code> table by <code>stock_qty</code> ascending, placing any NULL stock values last.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Top Sales):</strong> Get the top 10 highest-value sales, most recent first.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Find the single cheapest product that is in stock (stock quantity > 0).</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 4 Executive Summary</h2></div>
<p>You have mastered Day 4 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 5</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Sorting & Limiting Results"}, {"anchor": "sec-1", "title": "1. Sorting & Limits : ORDER BY and LIMIT"}, {"anchor": "checks-Sorting and Limiting-3", "title": "🧪 Checks: Sorting and Limiting"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day05', 'SQL Day 05: Aggregate Functions', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Aggregate Functions</h2>
<p>Calculate summary metrics like counts, sums, averages, minimums, and maximums across datasets.</p>
<h3>📋 Database Source: <code>retail.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Aggregations : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">COUNT, SUM, AVG, MIN, MAX</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>Aggregate functions perform calculations on a set of values and return a single summary value. <code>COUNT(*)</code> counts all rows, while <code>COUNT(column)</code> ignores NULL values. <code>SUM</code>, <code>AVG</code>, <code>MIN</code>, and <code>MAX</code> provide general statistics.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Count sales and find total revenue
SELECT COUNT(*) as total_orders, SUM(amount) as total_revenue, AVG(amount) as avg_order_value FROM sales;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Basic Aggregations-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Basic Aggregations</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Count the total number of products in the <code>products</code> table.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find the total stock quantity of all products combined.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Find the average price of products in the ''Electronics'' category.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Find the lowest and highest unit prices in the <code>products</code> table.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Count the number of sales that occurred in the ''North'' region.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Category Average):</strong> Calculate the average sale value in the ''Books'' category.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a query to calculate the average sale amount, total sale amount, and number of orders for customer_id = 5.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 5 Executive Summary</h2></div>
<p>You have mastered Day 5 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 6</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Aggregate Functions"}, {"anchor": "sec-1", "title": "1. Aggregations : COUNT, SUM, AVG, MIN, MAX"}, {"anchor": "checks-Basic Aggregations-3", "title": "🧪 Checks: Basic Aggregations"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day06', 'SQL Day 06: GROUP BY & HAVING', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: GROUP BY & HAVING</h2>
<p>Group data rows by matching column values and filter aggregated summaries using HAVING.</p>
<h3>📋 Database Source: <code>retail.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Grouping and HAVING : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">GROUP BY and HAVING</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>The <code>GROUP BY</code> statement groups rows that have the same values into summary rows. The <code>HAVING</code> clause filters groups based on aggregate conditions (like <code>SUM(amount) > 10000</code>), whereas <code>WHERE</code> filters rows before grouping.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Find total sales revenue per region
SELECT region, SUM(amount) as total_sales FROM sales GROUP BY region HAVING total_sales &gt; 100000;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Group By & Having-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Group By & Having</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Group <code>sales</code> by <code>category</code> and find the total count of sales for each.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Group <code>sales</code> by <code>region</code> and find the average sale amount per region.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Find product categories with total sales revenue greater than 50,000.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Find the number of orders placed by each customer_id.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Show regions that have more than 20 sales transactions.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (High Value Groups):</strong> Find categories with more than 30 orders and average sale > ₹3,000.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a query to find the customer_ids who have spent more than ₹15,000 in total across all their purchases.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 6 Executive Summary</h2></div>
<p>You have mastered Day 6 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 7</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: GROUP BY & HAVING"}, {"anchor": "sec-1", "title": "1. Grouping and HAVING : GROUP BY and HAVING"}, {"anchor": "checks-Group By & Having-3", "title": "🧪 Checks: Group By & Having"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day07', 'SQL Day 07: Data Types, Casting & Expressions', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Data Types, Casting & Expressions</h2>
<p>Perform mathematical operations, concatenate string fields, and explicitly convert data types.</p>
<h3>📋 Database Source: <code>retail.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Casting & Operations : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Casts and Mathematical Calculations</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>SQL allows arithmetic calculations in the SELECT clause. Standard text strings can be merged using concatenation (the <code>||</code> operator). Data types can be explicitly converted using <code>CAST(expression AS type)</code>.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Concatenate region and manager, and calculate a 10% discount price
SELECT name || &#x27; (Manager: &#x27; || manager || &#x27;)&#x27; as region_info, zone FROM regions;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Expressions & Casting-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Expressions & Casting</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Calculate a 10% VAT tax for each product in the <code>products</code> table (unit_price * 0.10).</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Retrieve product names and calculate their total value in stock (<code>unit_price * stock_qty</code>).</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Explicitly cast the <code>amount</code> column in the <code>sales</code> table as an INTEGER.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Concatenate product <code>name</code> and <code>category</code> from the <code>products</code> table separated by a hyphen.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a query to find the modulus (remainder) of <code>stock_qty</code> divided by 10 for all products.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Revenue Tier):</strong> Calculate a custom ''projected_price'' for each product if it rises by 15%.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a query that divides <code>unit_price</code> by <code>stock_qty</code> but casts both to REAL to avoid integer division issues.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 7 Executive Summary</h2></div>
<p>You have mastered Day 7 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 8</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Data Types, Casting & Expressions"}, {"anchor": "sec-1", "title": "1. Casting & Operations : Casts and Mathematical Calculations"}, {"anchor": "checks-Expressions & Casting-3", "title": "🧪 Checks: Expressions & Casting"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day08', 'SQL Day 08: CASE WHEN (Conditional Logic)', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: CASE WHEN (Conditional Logic)</h2>
<p>Write conditional flow logic directly in SQL statements to classify data values dynamically.</p>
<h3>📋 Database Source: <code>retail.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Conditional CASE : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">CASE WHEN / THEN / ELSE</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>The <code>CASE</code> expression is SQL''s version of if-then-else logic. It evaluates conditions and returns a value when the first condition is met. If no conditions are met, it returns the value in the <code>ELSE</code> clause (or NULL if omitted).</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Classify products based on price
SELECT name, unit_price, CASE WHEN unit_price &gt; 10000 THEN &#x27;Premium&#x27; WHEN unit_price &gt; 2000 THEN &#x27;Mid-range&#x27; ELSE &#x27;Budget&#x27; END as price_tier FROM products;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-CASE Expressions-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>CASE Expressions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Classify sales amounts as ''Small'' (under 2000), ''Medium'' (2000 to 8000), and ''Large'' (above 8000).</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a query displaying product name, stock quantity, and status: ''Out of Stock'' (stock_qty = 0), ''Low Stock'' (under 20), ''In Stock'' (otherwise).</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use a CASE statement inside <code>SUM</code> to count how many sales occurred in the ''North'' region.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Pivot sales: write a query displaying total amount for ''Electronics'' and total amount for ''Books'' as two separate columns.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Classify regions: if region is ''North'' or ''East'' then ''Group A'', else ''Group B''.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Tier Counts):</strong> Classify each sale as ''Low'', ''Medium'', ''High'' value; count the number of sales in each tier.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a query that labels any sale of ''Python Course Book'' or ''Data Science Bundle'' as ''Course Materials'', and others as ''Hardware/Accessories''.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 8 Executive Summary</h2></div>
<p>You have mastered Day 8 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 9</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: CASE WHEN (Conditional Logic)"}, {"anchor": "sec-1", "title": "1. Conditional CASE : CASE WHEN / THEN / ELSE"}, {"anchor": "checks-CASE Expressions-3", "title": "🧪 Checks: CASE Expressions"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day09', 'SQL Day 09: Understanding Relationships & INNER JOIN', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Understanding Relationships & INNER JOIN</h2>
<p>Establish data relationships and combine data records from multiple tables based on primary/foreign keys.</p>
<h3>📋 Database Source: <code>company.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. INNER JOIN : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Matching Keys Across Tables</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>Tables in relational databases are linked by foreign keys matching primary keys. An <code>INNER JOIN</code> selects records that have matching values in both tables. Tables can be aliased to keep queries readable.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Get employees with their department name
SELECT e.name as employee_name, d.name as department_name FROM employees e INNER JOIN departments d ON e.dept_id = d.id;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-INNER JOIN-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>INNER JOIN</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Join <code>employees</code> and <code>departments</code> to list employee names, department names, and department budgets.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Join <code>employees</code> and <code>salaries</code> to find the current salary amount for each employee (effective_date = hire_date or matching dates).</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Retrieve employee name, project name, and role for all assigned projects by joining <code>employees</code>, <code>emp_projects</code>, and <code>projects</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Find the names of employees in the ''Engineering'' department.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a query displaying employee name and their current salary, filtering for salaries above 80000.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Department Salaries):</strong> Get each employee''s name with their department name and salary.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Retrieve names of all employees who are working on the project ''Alpha Analytics''.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 9 Executive Summary</h2></div>
<p>You have mastered Day 9 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 10</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Understanding Relationships & INNER "}, {"anchor": "sec-1", "title": "1. INNER JOIN : Matching Keys Across Tables"}, {"anchor": "checks-INNER JOIN-3", "title": "🧪 Checks: INNER JOIN"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day10', 'SQL Day 10: LEFT, RIGHT & FULL OUTER JOIN', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: LEFT, RIGHT & FULL OUTER JOIN</h2>
<p>Use OUTER JOINs to keep unmatched records from either table and detect orphaned rows.</p>
<h3>📋 Database Source: <code>company.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Outer Joins : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">LEFT, RIGHT and FULL Joins</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>Unlike INNER JOIN, OUTER JOINs keep records even if there are no matches. A <code>LEFT JOIN</code> returns all records from the left table, and matching records from the right (with NULLs for non-matches). SQLite natively supports LEFT JOIN (use LEFT JOIN and order of tables to simulate RIGHT/FULL).</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Find all departments and any employees assigned to them (even if empty)
SELECT d.name as department, e.name as employee FROM departments d LEFT JOIN employees e ON d.id = e.dept_id;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Outer Joins-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Outer Joins</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a query using a <code>LEFT JOIN</code> to list all departments and their employee count.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find all employees who are NOT assigned to any project by LEFT joining <code>employees</code> to <code>emp_projects</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> List all projects and any employee names assigned to them, including projects with no employees.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use a LEFT JOIN and a WHERE condition to list departments that have NO employees assigned.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Display employees and their salaries using a LEFT JOIN, showing NULL for any employee without a salary record.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Empty Departments):</strong> Find all departments that have NO employees assigned.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Explain the difference between INNER JOIN and LEFT JOIN with a simple SQL example.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 10 Executive Summary</h2></div>
<p>You have mastered Day 10 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 11</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: LEFT, RIGHT & FULL OUTER JOIN"}, {"anchor": "sec-1", "title": "1. Outer Joins : LEFT, RIGHT and FULL Joins"}, {"anchor": "checks-Outer Joins-3", "title": "🧪 Checks: Outer Joins"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day11', 'SQL Day 11: SELF JOIN & Multi-Table Queries', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: SELF JOIN & Multi-Table Queries</h2>
<p>Join a table to itself to query hierarchical structures and write complex multi-table queries.</p>
<h3>📋 Database Source: <code>company.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Self Joins : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Hierarchies and Self Referencing</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>A self join is a regular join, but the table is joined with itself. It is useful for querying hierarchical data (like employees and their managers). You must alias the table twice to distinguish them.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Find employees and their managers
SELECT emp.name as employee, mgr.name as manager FROM employees emp LEFT JOIN employees mgr ON emp.manager_id = mgr.id;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Self Joins & Hierarchies-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Self Joins & Hierarchies</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a query to find all employees managed by ''Rajesh Sen''.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find employees who do NOT have any manager (top of the hierarchy).</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a SELF JOIN to find pairs of employees who work in the same department (excluding pairing an employee with themselves).</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Find employees whose manager works in a different department (dept_id differs).</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Find the names of managers who manage more than 2 employees.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Manager Names):</strong> List every employee with their manager''s name.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a query to show employee name, department name, manager name, and project name in a single query.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 11 Executive Summary</h2></div>
<p>You have mastered Day 11 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 12</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: SELF JOIN & Multi-Table Queries"}, {"anchor": "sec-1", "title": "1. Self Joins : Hierarchies and Self Referencing"}, {"anchor": "checks-Self Joins & Hierarchies-3", "title": "🧪 Checks: Self Joins & Hierarchies"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day12', 'SQL Day 12: Subqueries', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Subqueries</h2>
<p>Embed queries inside SELECT, WHERE, or FROM clauses to perform multi-stage lookups.</p>
<h3>📋 Database Source: <code>ecommerce.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Subqueries : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Queries within Queries</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>A subquery is a query nested inside another query. Scalar subqueries return a single value. Subqueries can also return a list of values for use with <code>IN</code> or <code>EXISTS</code>. Correlated subqueries reference columns in the outer query.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Find products with price above average product cost
SELECT name, cost_price FROM products WHERE cost_price &gt; (SELECT AVG(cost_price) FROM products);</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Subqueries-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Subqueries</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Find customers who signed up after ''Sneha Patel'' signed up.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find products in the <code>products</code> table that have never been ordered using <code>NOT IN</code> or <code>NOT EXISTS</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Get the names of customers who have placed at least one order.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Get the maximum order quantity of any product in a single order item.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Find all order IDs that contain the product ''MacBook Pro''.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Above Average Spend):</strong> Find customers who ordered more than the average order value.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Explain when you would use a subquery instead of a JOIN, and the performance differences.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 12 Executive Summary</h2></div>
<p>You have mastered Day 12 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 13</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Subqueries"}, {"anchor": "sec-1", "title": "1. Subqueries : Queries within Queries"}, {"anchor": "checks-Subqueries-3", "title": "🧪 Checks: Subqueries"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day13', 'SQL Day 13: CTEs (Common Table Expressions)', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: CTEs (Common Table Expressions)</h2>
<p>Define temporary result sets using WITH to write cleaner, modular, and readable queries.</p>
<h3>📋 Database Source: <code>ecommerce.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. CTEs : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Modular SQL with WITH</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>A Common Table Expression (CTE) is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. CTEs act like virtual tables that exist only during query execution, greatly improving query readability.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Use a CTE to calculate total sales by product and filter high values
WITH ProductRevenue AS (
    SELECT product_id, SUM(qty * unit_price) as revenue
    FROM order_items
    GROUP BY product_id
)
SELECT p.name, pr.revenue
FROM ProductRevenue pr
JOIN products p ON pr.product_id = p.id
WHERE pr.revenue &gt; 10000;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Common Table Expressions-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Common Table Expressions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a CTE named <code>CustomerOrders</code> that counts orders per customer, then select all columns from it.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use a CTE to calculate the average price of products ordered in each category, then join it to <code>categories</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a query with two chained CTEs: one calculating product costs, and the second ranking them.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Rewrite a subquery that retrieves products costing more than average cost using a CTE instead.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use a CTE to find customers with more than 2 orders.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Category Ranks):</strong> Use a CTE to calculate total revenue for each product, then join with products to display product name and revenue.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>What is a CTE, and why is it preferred over nested subqueries for complex reports?</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 13 Executive Summary</h2></div>
<p>You have mastered Day 13 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 14</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: CTEs (Common Table Expressions)"}, {"anchor": "sec-1", "title": "1. CTEs : Modular SQL with WITH"}, {"anchor": "checks-Common Table Expressions-3", "title": "🧪 Checks: Common Table Expressions"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day14', 'SQL Day 14: Window Functions Part 1 (Ranking)', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Window Functions Part 1 (Ranking)</h2>
<p>Perform calculations across a set of table rows related to the current row, and assign ranks.</p>
<h3>📋 Database Source: <code>ecommerce.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Ranking Window Functions : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">OVER, PARTITION BY, ROW_NUMBER, RANK, DENSE_RANK</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>Window functions perform calculations across a partition of rows. Unlike GROUP BY, they do not collapse rows. <code>ROW_NUMBER()</code> assigns sequential numbers. <code>RANK()</code> leaves gaps on ties, whereas <code>DENSE_RANK()</code> does not.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Rank products by cost price within categories
SELECT name, category_id, cost_price, DENSE_RANK() OVER(PARTITION BY category_id ORDER BY cost_price DESC) as price_rank FROM products;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Ranking Window Functions-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Ranking Window Functions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Assign a sequential row number to all customers ordered by their <code>signup_date</code>.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Rank products globally by <code>cost_price</code> descending using <code>RANK()</code> and <code>DENSE_RANK()</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Partition customers by <code>region</code> and rank them by <code>signup_date</code> ascending.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a query using <code>NTILE(4)</code> to divide products into 4 price quartiles.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>ROW_NUMBER()</code> inside a subquery or CTE to find the oldest customer in each region.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Spend Rankings):</strong> Rank customers by total order spend within each region.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Explain the exact difference between ROW_NUMBER(), RANK(), and DENSE_RANK() with respect to duplicate values.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 14 Executive Summary</h2></div>
<p>You have mastered Day 14 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 15</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Window Functions Part 1 (Ranking)"}, {"anchor": "sec-1", "title": "1. Ranking Window Functions : OVER, PARTITION BY, ROW_NUMBER, RANK, DENSE_RANK"}, {"anchor": "checks-Ranking Window Functions-3", "title": "🧪 Checks: Ranking Window Functions"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day15', 'SQL Day 15: Window Functions Part 2 (Analytic)', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Window Functions Part 2 (Analytic)</h2>
<p>Compute running aggregates, moving averages, and offset values (LAG/LEAD) for trend analysis.</p>
<h3>📋 Database Source: <code>ecommerce.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Analytic Window Functions : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">LAG, LEAD, Running Totals</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>Analytic window functions allow referencing values from surrounding rows. <code>LAG()</code> reads a previous row''s value, and <code>LEAD()</code> reads a next row''s value. Running aggregates are created by adding an <code>ORDER BY</code> clause inside <code>OVER()</code>.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Running total of order items quantity ordered by id
SELECT id, order_id, qty, SUM(qty) OVER (ORDER BY id) as running_qty FROM order_items;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Analytic Window Functions-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Analytic Window Functions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Use <code>LAG()</code> to show the signup date of the previous customer registered on the system.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>LEAD()</code> to show the signup date of the next customer registered on the system.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Calculate a running sum of order revenue grouped by customer, ordered by order date.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>FIRST_VALUE()</code> to display the first product ordered by each customer.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Calculate a 3-period moving average of product costs using <code>ROWS BETWEEN 2 PRECEDING AND CURRENT ROW</code>.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Growth Analysis):</strong> Calculate the difference in cost price between each product and the next most expensive product using LEAD.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>How do you calculate a month-over-month growth metric in SQL? Outline the required query structure.</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 15 Executive Summary</h2></div>
<p>You have mastered Day 15 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 16</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Window Functions Part 2 (Analytic)"}, {"anchor": "sec-1", "title": "1. Analytic Window Functions : LAG, LEAD, Running Totals"}, {"anchor": "checks-Analytic Window Functions-3", "title": "🧪 Checks: Analytic Window Functions"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day16', 'SQL Day 16: String Functions', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: String Functions</h2>
<p>Clean and format text data using upper/lower casing, trimming, replacing, and substring extraction.</p>
<h3>📋 Database Source: <code>ecommerce.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. SQL String Functions : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Trimming, Replacing, Substrings</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>SQL includes built-in functions to manipulate text. Common functions include <code>UPPER()</code>, <code>LOWER()</code>, <code>TRIM()</code> (removes leading/trailing spaces), <code>REPLACE(str, old, new)</code>, and <code>SUBSTR(str, start, length)</code> to extract text parts.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Trim names and normalize emails
SELECT TRIM(name) as clean_name, LOWER(email) as clean_email FROM customers;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-String Functions-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>String Functions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Convert customer names to uppercase and emails to lowercase.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Trim extra spaces from customer names and replace the domain ''@gmail.com'' with ''@googlemail.com''.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Extract the first 3 characters of each customer''s region using <code>SUBSTR</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Find the character position of ''@'' in each customer''s email using <code>INSTR</code>.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Find the length (number of characters) of customer emails.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Standardize Names):</strong> Standardize the customer names column to remove spaces and convert to uppercase.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a query to extract the username part of an email address (everything before the ''@'' symbol).</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 16 Executive Summary</h2></div>
<p>You have mastered Day 16 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 17</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: String Functions"}, {"anchor": "sec-1", "title": "1. SQL String Functions : Trimming, Replacing, Substrings"}, {"anchor": "checks-String Functions-3", "title": "🧪 Checks: String Functions"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day17', 'SQL Day 17: Date & Time Functions', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Date & Time Functions</h2>
<p>Extract parts of date values, perform date arithmetic, and filter transactions by date intervals.</p>
<h3>📋 Database Source: <code>ecommerce.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Dates & Times : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Formatting and Intervals</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>SQLite stores dates as TEXT (ISO 8601), REAL, or INTEGER. Use <code>STRFTIME(format, date)</code> to format and extract parts: <code>%Y</code> (year), <code>%m</code> (month), <code>%d</code> (day), <code>%w</code> (day of week: 0=Sunday). Date difference is computed using <code>JULIANDAY</code>.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Extract year and month from order dates
SELECT id, order_date, STRFTIME(&#x27;%Y&#x27;, order_date) as year, STRFTIME(&#x27;%m&#x27;, order_date) as month FROM orders;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Date & Time Functions-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Date & Time Functions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Find all orders placed in the year 2022.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find all orders placed in the month of October.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Find orders placed on weekends (STRFTIME ''%w'' is ''0'' or ''6'').</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Calculate the number of days between customer signup date and their first order date.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> List all customers who signed up in Q4 of 2022 (Oct, Nov, Dec).</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Q4 Weekends):</strong> Find all orders placed on weekends in Q4 of 2022.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>How does SQLite store date and time fields? What are the implications for comparing dates?</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 17 Executive Summary</h2></div>
<p>You have mastered Day 17 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 18</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Date & Time Functions"}, {"anchor": "sec-1", "title": "1. Dates & Times : Formatting and Intervals"}, {"anchor": "checks-Date & Time Functions-3", "title": "🧪 Checks: Date & Time Functions"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day18', 'SQL Day 18: UNION, INTERSECT & EXCEPT (SET Operations)', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: UNION, INTERSECT & EXCEPT (SET Operations)</h2>
<p>Combine, intersect, or subtract result sets from different queries using SET operators.</p>
<h3>📋 Database Source: <code>ecommerce.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Set Operations : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">UNION, INTERSECT, EXCEPT</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>Set operators combine results from multiple queries. <code>UNION</code> merges results and removes duplicates. <code>UNION ALL</code> merges results keeping duplicates. <code>INTERSECT</code> finds common rows. <code>EXCEPT</code> finds rows in the first query not in the second. Column counts and types must match.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Combine customer regions and product categories (illustrative set logic)
SELECT region as label FROM customers
UNION
SELECT name as label FROM categories;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Set Operations-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Set Operations</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Get a unique list of all customer names and employee names (cross-database conceptually, but here combine customer names and product names for syntax practice).</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find customer IDs who ordered both in October and in December using <code>INTERSECT</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> List all customers who registered on the system but have placed NO orders using <code>EXCEPT</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Combine order items with product cost price and sale price, maintaining duplicates via <code>UNION ALL</code>.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Find customer IDs who ordered in 2022 but did not order in 2023.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Customer Activity Sets):</strong> Find customer IDs who signed up in 2022 and ordered in 2022.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Explain the exact difference between UNION and UNION ALL. Which is faster and why?</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 18 Executive Summary</h2></div>
<p>You have mastered Day 18 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 19</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: UNION, INTERSECT & EXCEPT (SET Opera"}, {"anchor": "sec-1", "title": "1. Set Operations : UNION, INTERSECT, EXCEPT"}, {"anchor": "checks-Set Operations-3", "title": "🧪 Checks: Set Operations"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day19', 'SQL Day 19: Query Optimization & Best Practices', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: Query Optimization & Best Practices</h2>
<p>Read execution plans, identify bottlenecks, avoid full table scans, and optimize query structure.</p>
<h3>📋 Database Source: <code>ecommerce.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. SQL Optimization : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Explain Plan and Indexes</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>Optimization involves writing queries that run quickly. Use <code>EXPLAIN QUERY PLAN</code> in SQLite to see if the engine uses indexes or does full table scans. Best practices: avoid <code>SELECT *</code>, filter early with WHERE, index foreign keys, and write readable formatted SQL.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- Explain query plan for customer lookup
EXPLAIN QUERY PLAN SELECT * FROM customers WHERE id = 3;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Optimization Basics-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Optimization Basics</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Run an <code>EXPLAIN QUERY PLAN</code> on a query that joins <code>orders</code> and <code>customers</code>.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Run <code>EXPLAIN QUERY PLAN</code> on a query searching customer names by a LIKE pattern (<code>customer_name LIKE ''%Sharma%'')</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Rewrite a query containing <code>SELECT *</code> to retrieve only required columns.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Explain what indexing does and when it can slow down operations.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Identify why filtering on a function (e.g. <code>WHERE UPPER(name) = ''AMIT''</code>) might bypass standard indexes.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Read Plans):</strong> Run EXPLAIN QUERY PLAN on a query that calculates the total spend per customer.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>What is a full table scan? How do you avoid it in a production database?</h3>
</div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 19 Executive Summary</h2></div>
<p>You have mastered Day 19 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day 20</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Query Optimization & Best Practices"}, {"anchor": "sec-1", "title": "1. SQL Optimization : Explain Plan and Indexes"}, {"anchor": "checks-Optimization Basics-3", "title": "🧪 Checks: Optimization Basics"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}]'::jsonb),
('sql-day20', 'SQL Day 20: SQL Capstone Project', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective: SQL Capstone Project</h2>
<p>Build a comprehensive Business Intelligence report from an extended relational schema, answering core business questions.</p>
<h3>📋 Database Source: <code>capstone_retail.db</code></h3>
<p>Every cell in this notebook runs against this database on the server.</p>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Capstone Overview : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Retail Business Intelligence</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<p>In this final capstone, you will run complex multi-table joins, subqueries, CTEs, date functions, and window functions on the <code>capstone_retail.db</code> to extract critical business KPIs.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">-- View count of sales, orders, and total revenue in capstone db
SELECT COUNT(*) as total_sales, SUM(amount) as total_rev FROM sales;</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Capstone Questions-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Capstone Questions</code></b>
</h3></div>
<div class="question"><p><strong>Q1. Monthly Trend:</strong> Calculate total revenue and order count by month (using <code>sale_date</code>).</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2. Top Products:</strong> Find the top 10 products by revenue, displaying product name and category.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3. Repeat Buyers:</strong> Count customer segmentation: how many customers placed 1 order vs repeat buyers (2+ orders)?</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4. Regional Performance:</strong> List revenue, average order value, and count of sales reps in each region.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5. Return Rates:</strong> Calculate the return rate (orders returned / total orders) for each product category.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q6. Sales Rep Ranks:</strong> Rank sales reps by revenue generated within their assigned region using window functions.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q7. Cohort Analysis:</strong> Group customers by signup month and find their Lifetime Value (LTV).</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q8. Day-of-Week:</strong> Find which day of the week (Sunday-Saturday) generates the highest average sale amount.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Write SQL queries to solve the following tasks.</p>
<div class="question task"><p><strong>Task 1 (Final Query):</strong> Write a query to retrieve the overall return percentage of the retail business.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-24">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Walk through how you structured your queries in the SQL Capstone to handle date parsing and window ranking.</h3>
</div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11">-- Write your SQL query here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 20 Executive Summary</h2></div>
<p>You have mastered Day 20 concepts. Complete all checks, tasks, and interview questions to verify your database skills.</p>
<p><strong>Next Up: SQL Day Complete</strong></p>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: SQL Capstone Project"}, {"anchor": "sec-1", "title": "1. Capstone Overview : Retail Business Intelligence"}, {"anchor": "checks-Capstone Questions-3", "title": "🧪 Checks: Capstone Questions"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-24", "title": "Q1."}, {"anchor": "summary", "title": "📊 Executive Summary"}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}, {"type": "markdown"}, {"id": "cell-9", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-10", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-11", "type": "code"}, {"type": "markdown"}]'::jsonb);
