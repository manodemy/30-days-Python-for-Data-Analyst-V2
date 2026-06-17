"""
generate_day_pages.py
Generates fully-populated HTML day pages for the SQL (20 days) and Excel (12 days) courses.
Output: sql/dayNN.html, excel/dayNN.html, public/sql/dayNN.html, public/excel/dayNN.html
"""

import os
import html as html_lib

# ─────────────────────────────────────────────────────────────────────────────
# SQL CURRICULUM (20 days)
# ─────────────────────────────────────────────────────────────────────────────
SQL_CURRICULUM = [
    {
        "day": 1, "title": "Introduction to SQL & Databases", "db": "retail.db", "emoji": "🗄️",
        "objective": "Understand RDBMS concepts, tables, columns, rows, and write your first SELECT statements to retrieve data.",
        "sections": [{
            "num": 1, "title": "What is a Database?", "subtitle": "Understanding RDBMS and Tables",
            "theory": "A database is an organized collection of structured data. A Relational Database Management System (RDBMS) stores data in tables consisting of columns (attributes) and rows (records). Unlike spreadsheets, databases enforce data types, handle millions of rows efficiently, and prevent duplicates through constraints.",
            "demo": "-- Look at the schema of the sales table\nSELECT * FROM sales LIMIT 5;",
            "cc": "Basic Querying",
            "questions": [
                "Write a query to retrieve all columns from the <code>products</code> table.",
                "Retrieve only the <code>name</code> and <code>unit_price</code> columns from the <code>products</code> table.",
                "Retrieve the <code>product</code> and <code>amount</code> from the <code>sales</code> table, aliasing <code>product</code> as <code>product_name</code> and <code>amount</code> as <code>sale_value</code>.",
                "List all unique (distinct) product categories from the <code>sales</code> table.",
                "Write a query to find all unique regions from the <code>sales</code> table."
            ]
        }],
        "tasks": [{"name": "Categories Sold", "desc": "Write a query to list all unique product categories sold from the <code>sales</code> table."}],
        "interviews": ["Write a query to show all details of products, but rename <code>stock_qty</code> to <code>available_units</code>."],
        "summary": "Today you learned that SQL (Structured Query Language) is the universal language for querying relational databases. The <code>SELECT</code> statement lets you fetch columns, <code>DISTINCT</code> removes duplicates, and column aliases (<code>AS</code>) make results more readable. Mastering these basics is the foundation of every data analyst's toolkit."
    },
    {
        "day": 2, "title": "Filtering Data with WHERE", "db": "retail.db", "emoji": "🔍",
        "objective": "Filter query results using conditional statements, logical operators, and value list checking.",
        "sections": [{
            "num": 1, "title": "The WHERE Clause", "subtitle": "Conditional Filtering",
            "theory": "The WHERE clause is used to filter records that meet specific conditions. You can use operators like <code>=</code>, <code>!=</code>, <code>&gt;</code>, <code>&lt;</code>, <code>&gt;=</code>, <code>&lt;=</code>, as well as logical operators <code>AND</code>, <code>OR</code>, <code>NOT</code>. Precedence can be controlled using parentheses. The <code>BETWEEN</code> operator is inclusive on both ends, and <code>IN</code> lets you check against a list of values.",
            "demo": "-- Find sales in the 'North' region where amount is greater than 1000\nSELECT * FROM sales WHERE region = 'North' AND amount > 1000;",
            "cc": "WHERE Filters",
            "questions": [
                "Find all sales where the <code>category</code> is 'Electronics'.",
                "Find all sales where the <code>amount</code> is between 5000 and 10000 (inclusive) using <code>BETWEEN</code>.",
                "Get all products in the <code>products</code> table where <code>unit_price</code> is less than or equal to 2000.",
                "Find sales in 'South' or 'West' regions using the <code>IN</code> operator.",
                "Find sales that are NOT in the 'North' region."
            ]
        }],
        "tasks": [{"name": "High Value North", "desc": "Find all sales over ₹5,000 in the 'North' region."}],
        "interviews": ["Select all products with a unit price strictly greater than 5000 and stock quantity greater than 20."],
        "summary": "The <code>WHERE</code> clause is the primary filtering tool in SQL. Combining <code>AND</code>/<code>OR</code> logic with comparison operators gives you fine-grained control. Remember that <code>BETWEEN</code> is inclusive, <code>IN</code> eliminates long OR chains, and <code>NOT</code> negates any condition."
    },
    {
        "day": 3, "title": "Pattern Matching & NULL Handling", "db": "retail.db", "emoji": "📝",
        "objective": "Perform text search using wildcards and understand how to handle missing (NULL) values correctly.",
        "sections": [{
            "num": 1, "title": "LIKE & NULLs", "subtitle": "Wildcards and Missing Data",
            "theory": "The <code>LIKE</code> operator is used with <code>%</code> (any characters) and <code>_</code> (single character) for pattern matching. <code>NULL</code> represents missing or unknown values, which must be checked with <code>IS NULL</code> or <code>IS NOT NULL</code> (not <code>= NULL</code>). <code>COALESCE</code> replaces NULLs with fallback values.",
            "demo": "-- Find customers with names containing 'Kumar'\nSELECT * FROM sales WHERE customer_name LIKE '%Kumar%';",
            "cc": "Wildcards & NULL Handling",
            "questions": [
                "Find all sales records where <code>customer_name</code> starts with the letter 'A'.",
                "Find all sales records where <code>customer_email</code> is NULL.",
                "Find all sales records where <code>customer_email</code> is NOT NULL.",
                "Write a query using <code>COALESCE</code> to display the customer's email, or the text 'No Email' if it is NULL.",
                "Find sales where the product name ends with 'Book'."
            ]
        }],
        "tasks": [{"name": "Customer Search", "desc": "Find all customers whose names start with 'A' or have a NULL email."}],
        "interviews": ["Write a query to find all products where name starts with 'Wireless' and category is 'Electronics'."],
        "summary": "Pattern matching with <code>LIKE</code> is essential for fuzzy text searches. Never use <code>= NULL</code> — always use <code>IS NULL</code> or <code>IS NOT NULL</code> since NULL is not a value but the absence of one. <code>COALESCE</code> is your go-to function for replacing NULLs with sensible defaults."
    },
    {
        "day": 4, "title": "Sorting & Limiting Results", "db": "retail.db", "emoji": "📈",
        "objective": "Control the display order of rows and restrict output size for pagination or top-N analysis.",
        "sections": [{
            "num": 1, "title": "Sorting & Limits", "subtitle": "ORDER BY and LIMIT",
            "theory": "The <code>ORDER BY</code> clause sorts results by one or more columns in ascending (ASC) or descending (DESC) order. <code>LIMIT</code> restricts the number of returned rows. <code>OFFSET</code> skips a specified number of rows, useful for pagination. Multi-column sorting applies the second sort only when the first values are tied.",
            "demo": "-- Sort products by price descending and limit to top 3\nSELECT * FROM products ORDER BY unit_price DESC LIMIT 3;",
            "cc": "Sorting and Limiting",
            "questions": [
                "Sort the <code>sales</code> table by <code>amount</code> in descending order.",
                "Sort the <code>sales</code> table by <code>region</code> ascending, and then by <code>amount</code> descending.",
                "Get the top 5 highest sales amount records.",
                "Get the 5 next highest sales amount records (skipping the top 5) using <code>OFFSET</code>.",
                "Sort the <code>products</code> table by <code>stock_qty</code> ascending."
            ]
        }],
        "tasks": [{"name": "Top Sales", "desc": "Get the top 10 highest-value sales, most recent first."}],
        "interviews": ["Find the single cheapest product that is in stock (stock quantity > 0)."],
        "summary": "<code>ORDER BY</code> combined with <code>LIMIT</code>/<code>OFFSET</code> is the SQL pattern for pagination and top-N analysis. Multi-column sorts are processed left to right. Always use <code>ORDER BY</code> with <code>LIMIT</code> to get predictable results."
    },
    {
        "day": 5, "title": "Aggregate Functions", "db": "retail.db", "emoji": "📊",
        "objective": "Calculate summary metrics like counts, sums, averages, minimums, and maximums across datasets.",
        "sections": [{
            "num": 1, "title": "Aggregations", "subtitle": "COUNT, SUM, AVG, MIN, MAX",
            "theory": "Aggregate functions perform calculations on a set of values and return a single summary value. <code>COUNT(*)</code> counts all rows, while <code>COUNT(column)</code> ignores NULL values. <code>SUM</code>, <code>AVG</code>, <code>MIN</code>, and <code>MAX</code> provide general statistics. These functions collapse multiple rows into one result row.",
            "demo": "-- Count sales and find total revenue\nSELECT COUNT(*) as total_orders, SUM(amount) as total_revenue, AVG(amount) as avg_order_value FROM sales;",
            "cc": "Basic Aggregations",
            "questions": [
                "Count the total number of products in the <code>products</code> table.",
                "Find the total stock quantity of all products combined.",
                "Find the average price of products in the 'Electronics' category.",
                "Find the lowest and highest unit prices in the <code>products</code> table.",
                "Count the number of sales that occurred in the 'North' region."
            ]
        }],
        "tasks": [{"name": "Category Average", "desc": "Calculate the average sale value in the 'Books' category."}],
        "interviews": ["Write a query to calculate the average sale amount, total sale amount, and number of orders for customer_id = 5."],
        "summary": "Aggregate functions are the core of analytical SQL. <code>COUNT(*)</code> counts rows while <code>COUNT(col)</code> skips NULLs. Combine multiple aggregates in one query to build powerful summary reports. These become even more useful when combined with <code>GROUP BY</code> tomorrow."
    },
    {
        "day": 6, "title": "GROUP BY & HAVING", "db": "retail.db", "emoji": "🗃️",
        "objective": "Group data rows by matching column values and filter aggregated summaries using HAVING.",
        "sections": [{
            "num": 1, "title": "Grouping and HAVING", "subtitle": "GROUP BY and HAVING",
            "theory": "The <code>GROUP BY</code> statement groups rows that have the same values into summary rows. The <code>HAVING</code> clause filters groups based on aggregate conditions (like <code>SUM(amount) &gt; 10000</code>), whereas <code>WHERE</code> filters rows before grouping. Rule: <code>WHERE</code> filters rows → <code>GROUP BY</code> groups → <code>HAVING</code> filters groups.",
            "demo": "-- Find total sales revenue per region\nSELECT region, SUM(amount) as total_sales FROM sales GROUP BY region HAVING total_sales > 100000;",
            "cc": "Group By & Having",
            "questions": [
                "Group <code>sales</code> by <code>category</code> and find the total count of sales for each.",
                "Group <code>sales</code> by <code>region</code> and find the average sale amount per region.",
                "Find product categories with total sales revenue greater than 50,000.",
                "Find the number of orders placed by each customer_id.",
                "Show regions that have more than 20 sales transactions."
            ]
        }],
        "tasks": [{"name": "High Value Groups", "desc": "Find categories with more than 30 orders and average sale > ₹3,000."}],
        "interviews": ["Write a query to find the customer_ids who have spent more than ₹15,000 in total across all their purchases."],
        "summary": "<code>GROUP BY</code> is the backbone of all reporting queries. Remember the SQL clause order: <code>WHERE</code> → <code>GROUP BY</code> → <code>HAVING</code> → <code>ORDER BY</code>. Use <code>HAVING</code> only when filtering on aggregated values — never use it instead of <code>WHERE</code> for row-level filters."
    },
    {
        "day": 7, "title": "Data Types, Casting & Expressions", "db": "retail.db", "emoji": "➕",
        "objective": "Perform mathematical operations, concatenate string fields, and explicitly convert data types.",
        "sections": [{
            "num": 1, "title": "Casting & Operations", "subtitle": "Casts and Mathematical Calculations",
            "theory": "SQL allows arithmetic calculations in the SELECT clause. Standard text strings can be merged using concatenation (the <code>||</code> operator). Data types can be explicitly converted using <code>CAST(expression AS type)</code>. SQLite is dynamically typed, but explicit casting ensures predictable results in arithmetic operations.",
            "demo": "-- Concatenate region and manager, and calculate a 10% discount price\nSELECT name || ' (Manager: ' || manager || ')' as region_info, zone FROM regions;",
            "cc": "Expressions & Casting",
            "questions": [
                "Calculate a 10% VAT tax for each product in the <code>products</code> table (unit_price * 0.10).",
                "Retrieve product names and calculate their total value in stock (<code>unit_price * stock_qty</code>).",
                "Explicitly cast the <code>amount</code> column in the <code>sales</code> table as an INTEGER.",
                "Concatenate product <code>name</code> and <code>category</code> from the <code>products</code> table separated by a hyphen.",
                "Write a query to find the modulus (remainder) of <code>stock_qty</code> divided by 10 for all products."
            ]
        }],
        "tasks": [{"name": "Revenue Tier", "desc": "Calculate a custom 'projected_price' for each product if it rises by 15%."}],
        "interviews": ["Write a query that divides <code>unit_price</code> by <code>stock_qty</code> but casts both to REAL to avoid integer division issues."],
        "summary": "SQL expressions let you compute derived columns on the fly. Use <code>CAST()</code> to prevent integer division surprises (e.g., 5/2 = 2, but CAST(5 AS REAL)/2 = 2.5). The <code>||</code> concatenation operator is SQLite-specific; other databases use <code>CONCAT()</code>."
    },
    {
        "day": 8, "title": "CASE WHEN (Conditional Logic)", "db": "retail.db", "emoji": "🔀",
        "objective": "Write conditional flow logic directly in SQL statements to classify data values dynamically.",
        "sections": [{
            "num": 1, "title": "Conditional CASE", "subtitle": "CASE WHEN / THEN / ELSE",
            "theory": "The <code>CASE</code> expression is SQL's version of if-then-else logic. It evaluates conditions and returns a value when the first condition is met. If no conditions are met, it returns the value in the <code>ELSE</code> clause (or NULL if omitted). <code>CASE</code> can appear inside <code>SELECT</code>, <code>WHERE</code>, <code>ORDER BY</code>, or even inside aggregate functions.",
            "demo": "-- Classify products based on price\nSELECT name, unit_price,\n  CASE\n    WHEN unit_price > 10000 THEN 'Premium'\n    WHEN unit_price > 2000 THEN 'Mid-range'\n    ELSE 'Budget'\n  END as price_tier\nFROM products;",
            "cc": "CASE Expressions",
            "questions": [
                "Classify sales amounts as 'Small' (under 2000), 'Medium' (2000 to 8000), and 'Large' (above 8000).",
                "Write a query displaying product name, stock quantity, and status: 'Out of Stock' (stock_qty = 0), 'Low Stock' (under 20), 'In Stock' (otherwise).",
                "Use a CASE statement inside <code>SUM</code> to count how many sales occurred in the 'North' region.",
                "Pivot sales: write a query displaying total amount for 'Electronics' and total amount for 'Books' as two separate columns.",
                "Classify regions: if region is 'North' or 'East' then 'Group A', else 'Group B'."
            ]
        }],
        "tasks": [{"name": "Tier Counts", "desc": "Classify each sale as 'Low', 'Medium', 'High' value; count the number of sales in each tier."}],
        "interviews": ["Write a query that labels any sale of 'Python Course Book' or 'Data Science Bundle' as 'Course Materials', and others as 'Hardware/Accessories'."],
        "summary": "<code>CASE WHEN</code> turns SQL into a decision-making engine. Using it inside <code>SUM()</code> is the classic technique for pivoting data — counting or summing only rows meeting a condition. Always include an <code>ELSE</code> clause to handle unexpected values gracefully."
    },
    {
        "day": 9, "title": "Understanding Relationships & INNER JOIN", "db": "company.db", "emoji": "🔗",
        "objective": "Establish data relationships and combine data records from multiple tables based on primary/foreign keys.",
        "sections": [{
            "num": 1, "title": "INNER JOIN", "subtitle": "Matching Keys Across Tables",
            "theory": "Tables in relational databases are linked by foreign keys matching primary keys. An <code>INNER JOIN</code> selects records that have matching values in both tables. Tables can be aliased to keep queries readable. Only rows with matches in BOTH tables appear in the result — unmatched rows are dropped.",
            "demo": "-- Get employees with their department name\nSELECT e.name as employee_name, d.name as department_name\nFROM employees e\nINNER JOIN departments d ON e.dept_id = d.id;",
            "cc": "INNER JOIN",
            "questions": [
                "Join <code>employees</code> and <code>departments</code> to list employee names, department names, and department budgets.",
                "Join <code>employees</code> and <code>salaries</code> to find the current salary amount for each employee.",
                "Retrieve employee name, project name, and role for all assigned projects by joining <code>employees</code>, <code>emp_projects</code>, and <code>projects</code>.",
                "Find the names of employees in the 'Engineering' department.",
                "Write a query displaying employee name and their current salary, filtering for salaries above 80000."
            ]
        }],
        "tasks": [{"name": "Department Salaries", "desc": "Get each employee's name with their department name and salary."}],
        "interviews": ["Retrieve names of all employees who are working on the project 'Alpha Analytics'."],
        "summary": "<code>INNER JOIN</code> is the most common join type. It only returns rows that have a match on both sides — making it perfect when you need clean, complete data. Always use table aliases to keep multi-table queries readable, and check for correct foreign key relationships before joining."
    },
    {
        "day": 10, "title": "LEFT, RIGHT & FULL OUTER JOIN", "db": "company.db", "emoji": "🔄",
        "objective": "Use OUTER JOINs to keep unmatched records from either table and detect orphaned rows.",
        "sections": [{
            "num": 1, "title": "Outer Joins", "subtitle": "LEFT, RIGHT and FULL Joins",
            "theory": "Unlike INNER JOIN, OUTER JOINs keep records even if there are no matches. A <code>LEFT JOIN</code> returns all records from the left table, and matching records from the right (with NULLs for non-matches). SQLite natively supports LEFT JOIN. To simulate a RIGHT JOIN, swap the table order and use LEFT JOIN. FULL OUTER JOIN can be simulated with UNION of LEFT and RIGHT JOINs.",
            "demo": "-- Find all departments and any employees assigned to them (even if empty)\nSELECT d.name as department, e.name as employee\nFROM departments d\nLEFT JOIN employees e ON d.id = e.dept_id;",
            "cc": "Outer Joins",
            "questions": [
                "Write a query using a <code>LEFT JOIN</code> to list all departments and their employee count.",
                "Find all employees who are NOT assigned to any project by LEFT joining <code>employees</code> to <code>emp_projects</code>.",
                "List all projects and any employee names assigned to them, including projects with no employees.",
                "Use a LEFT JOIN and a WHERE condition to list departments that have NO employees assigned.",
                "Display employees and their salaries using a LEFT JOIN, showing NULL for any employee without a salary record."
            ]
        }],
        "tasks": [{"name": "Empty Departments", "desc": "Find all departments that have NO employees assigned."}],
        "interviews": ["Explain the difference between INNER JOIN and LEFT JOIN with a simple SQL example."],
        "summary": "The pattern <code>LEFT JOIN ... WHERE right.id IS NULL</code> is the classic SQL technique for finding unmatched rows — e.g., customers with no orders, departments with no employees. In SQLite, use LEFT JOIN with swapped table order to simulate a RIGHT JOIN."
    },
    {
        "day": 11, "title": "SELF JOIN & Multi-Table Queries", "db": "company.db", "emoji": "👥",
        "objective": "Join a table to itself to query hierarchical structures and write complex multi-table queries.",
        "sections": [{
            "num": 1, "title": "Self Joins", "subtitle": "Hierarchies and Self Referencing",
            "theory": "A self join is a regular join, but the table is joined with itself. It is useful for querying hierarchical data (like employees and their managers). You must alias the table twice to distinguish them. Self-joins are also used to compare rows within the same table.",
            "demo": "-- Find employees and their managers\nSELECT emp.name as employee, mgr.name as manager\nFROM employees emp\nLEFT JOIN employees mgr ON emp.manager_id = mgr.id;",
            "cc": "Self Joins & Hierarchies",
            "questions": [
                "Write a query to find all employees managed by 'Rajesh Sen'.",
                "Find employees who do NOT have any manager (top of the hierarchy).",
                "Write a SELF JOIN to find pairs of employees who work in the same department (excluding pairing an employee with themselves).",
                "Find employees whose manager works in a different department.",
                "Find the names of managers who manage more than 2 employees."
            ]
        }],
        "tasks": [{"name": "Manager Names", "desc": "List every employee with their manager's name."}],
        "interviews": ["Write a query to show employee name, department name, manager name, and project name in a single query."],
        "summary": "Self joins reveal hierarchical relationships hidden within a single table. The key trick is aliasing the same table with two different names to represent two different 'roles' (e.g., <code>emp</code> and <code>mgr</code>). Self joins combined with LEFT JOIN are perfect for org-chart style queries."
    },
    {
        "day": 12, "title": "Subqueries", "db": "ecommerce.db", "emoji": "🧠",
        "objective": "Embed queries inside SELECT, WHERE, or FROM clauses to perform multi-stage lookups.",
        "sections": [{
            "num": 1, "title": "Subqueries", "subtitle": "Queries within Queries",
            "theory": "A subquery is a query nested inside another query. Scalar subqueries return a single value. Subqueries can also return a list of values for use with <code>IN</code> or <code>EXISTS</code>. Correlated subqueries reference columns in the outer query and re-execute for each row. Subqueries in the FROM clause are called derived tables.",
            "demo": "-- Find products with price above average product cost\nSELECT name, cost_price\nFROM products\nWHERE cost_price > (SELECT AVG(cost_price) FROM products);",
            "cc": "Subqueries",
            "questions": [
                "Find customers who signed up after 'Sneha Patel' signed up.",
                "Find products in the <code>products</code> table that have never been ordered using <code>NOT IN</code> or <code>NOT EXISTS</code>.",
                "Get the names of customers who have placed at least one order.",
                "Get the maximum order quantity of any product in a single order item.",
                "Find all order IDs that contain the product 'MacBook Pro'."
            ]
        }],
        "tasks": [{"name": "Above Average Spend", "desc": "Find customers who ordered more than the average order value."}],
        "interviews": ["Explain when you would use a subquery instead of a JOIN, and the performance differences."],
        "summary": "Subqueries are powerful but can be slow if correlated (re-executed per row). Use scalar subqueries for single-value comparisons, <code>IN</code> subqueries for list membership, and <code>EXISTS</code> for existence checks. For complex multi-step logic, CTEs (Day 13) are often cleaner."
    },
    {
        "day": 13, "title": "CTEs (Common Table Expressions)", "db": "ecommerce.db", "emoji": "🏗️",
        "objective": "Define temporary result sets using WITH to write cleaner, modular, and readable queries.",
        "sections": [{
            "num": 1, "title": "CTEs", "subtitle": "Modular SQL with WITH",
            "theory": "A Common Table Expression (CTE) is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. CTEs act like virtual tables that exist only during query execution, greatly improving query readability. Multiple CTEs can be chained using commas.",
            "demo": "-- Use a CTE to calculate total sales by product and filter high values\nWITH ProductRevenue AS (\n  SELECT product_id, SUM(qty * unit_price) as revenue\n  FROM order_items\n  GROUP BY product_id\n)\nSELECT p.name, pr.revenue\nFROM ProductRevenue pr\nJOIN products p ON pr.product_id = p.id\nWHERE pr.revenue > 10000;",
            "cc": "Common Table Expressions",
            "questions": [
                "Write a CTE named <code>CustomerOrders</code> that counts orders per customer, then select all columns from it.",
                "Use a CTE to calculate the average price of products ordered in each category, then join it to <code>categories</code>.",
                "Write a query with two chained CTEs: one calculating product costs, and the second ranking them.",
                "Rewrite a subquery that retrieves products costing more than average cost using a CTE instead.",
                "Use a CTE to find customers with more than 2 orders."
            ]
        }],
        "tasks": [{"name": "Category Ranks", "desc": "Use a CTE to calculate total revenue for each product, then join with products to display product name and revenue."}],
        "interviews": ["What is a CTE, and why is it preferred over nested subqueries for complex reports?"],
        "summary": "CTEs replace messy nested subqueries with named, readable building blocks. They execute once and can be referenced multiple times. Chain multiple CTEs with commas after <code>WITH</code>. When you need recursive CTEs (e.g., traversing org charts), the <code>RECURSIVE</code> keyword enables depth traversal."
    },
    {
        "day": 14, "title": "Window Functions Part 1 (Ranking)", "db": "ecommerce.db", "emoji": "🔢",
        "objective": "Perform calculations across a set of table rows related to the current row, and assign ranks.",
        "sections": [{
            "num": 1, "title": "Ranking Window Functions", "subtitle": "OVER, PARTITION BY, ROW_NUMBER, RANK, DENSE_RANK",
            "theory": "Window functions perform calculations across a partition of rows. Unlike GROUP BY, they do not collapse rows. <code>ROW_NUMBER()</code> assigns sequential numbers. <code>RANK()</code> leaves gaps on ties, whereas <code>DENSE_RANK()</code> does not. The <code>OVER()</code> clause defines the window, and <code>PARTITION BY</code> resets numbering per group.",
            "demo": "-- Rank products by cost price within categories\nSELECT name, category_id, cost_price,\n  DENSE_RANK() OVER(PARTITION BY category_id ORDER BY cost_price DESC) as price_rank\nFROM products;",
            "cc": "Ranking Window Functions",
            "questions": [
                "Assign a sequential row number to all customers ordered by their <code>signup_date</code>.",
                "Rank products globally by <code>cost_price</code> descending using <code>RANK()</code> and <code>DENSE_RANK()</code>.",
                "Partition customers by <code>region</code> and rank them by <code>signup_date</code> ascending.",
                "Write a query using <code>NTILE(4)</code> to divide products into 4 price quartiles.",
                "Use <code>ROW_NUMBER()</code> inside a subquery or CTE to find the oldest customer in each region."
            ]
        }],
        "tasks": [{"name": "Spend Rankings", "desc": "Rank customers by total order spend within each region."}],
        "interviews": ["Explain the exact difference between ROW_NUMBER(), RANK(), and DENSE_RANK() with respect to duplicate values."],
        "summary": "Window functions let you have your cake and eat it too — you get per-row granularity AND group-level calculations simultaneously. <code>ROW_NUMBER()</code> is unique per row. <code>RANK()</code> skips numbers on ties (1,1,3), <code>DENSE_RANK()</code> does not (1,1,2). Use <code>NTILE(n)</code> to create evenly-sized buckets."
    },
    {
        "day": 15, "title": "Window Functions Part 2 (Analytic)", "db": "ecommerce.db", "emoji": "📈",
        "objective": "Compute running aggregates, moving averages, and offset values (LAG/LEAD) for trend analysis.",
        "sections": [{
            "num": 1, "title": "Analytic Window Functions", "subtitle": "LAG, LEAD, Running Totals",
            "theory": "Analytic window functions allow referencing values from surrounding rows. <code>LAG()</code> reads a previous row's value, and <code>LEAD()</code> reads a next row's value. Running aggregates are created by adding an <code>ORDER BY</code> clause inside <code>OVER()</code>. The frame clause (<code>ROWS BETWEEN ... AND CURRENT ROW</code>) controls how many rows are included in the window.",
            "demo": "-- Running total of order items quantity ordered by id\nSELECT id, order_id, qty,\n  SUM(qty) OVER (ORDER BY id) as running_qty\nFROM order_items;",
            "cc": "Analytic Window Functions",
            "questions": [
                "Use <code>LAG()</code> to show the signup date of the previous customer registered on the system.",
                "Use <code>LEAD()</code> to show the signup date of the next customer registered on the system.",
                "Calculate a running sum of order revenue grouped by customer, ordered by order date.",
                "Use <code>FIRST_VALUE()</code> to display the first product ordered by each customer.",
                "Calculate a 3-period moving average of product costs using <code>ROWS BETWEEN 2 PRECEDING AND CURRENT ROW</code>."
            ]
        }],
        "tasks": [{"name": "Growth Analysis", "desc": "Calculate the difference in cost price between each product and the next most expensive product using LEAD."}],
        "interviews": ["How do you calculate a month-over-month growth metric in SQL? Outline the required query structure."],
        "summary": "<code>LAG()</code> and <code>LEAD()</code> are powerful for period-over-period comparisons without self-joins. Running totals (<code>SUM() OVER (ORDER BY ...)</code>) enable cumulative analysis. The <code>ROWS BETWEEN</code> frame clause lets you define rolling windows like moving averages."
    },
    {
        "day": 16, "title": "String Functions", "db": "ecommerce.db", "emoji": "🧹",
        "objective": "Clean and format text data using upper/lower casing, trimming, replacing, and substring extraction.",
        "sections": [{
            "num": 1, "title": "SQL String Functions", "subtitle": "Trimming, Replacing, Substrings",
            "theory": "SQL includes built-in functions to manipulate text. Common functions include <code>UPPER()</code>, <code>LOWER()</code>, <code>TRIM()</code> (removes leading/trailing spaces), <code>REPLACE(str, old, new)</code>, and <code>SUBSTR(str, start, length)</code> to extract text parts. <code>LENGTH()</code> returns the character count of a string.",
            "demo": "-- Trim names and normalize emails\nSELECT TRIM(name) as clean_name, LOWER(email) as clean_email FROM customers;",
            "cc": "String Functions",
            "questions": [
                "Convert customer names to uppercase and emails to lowercase.",
                "Trim extra spaces from customer names and replace the domain '@gmail.com' with '@googlemail.com'.",
                "Extract the first 3 characters of each customer's region using <code>SUBSTR</code>.",
                "Find the character position of '@' in each customer's email using <code>INSTR</code>.",
                "Find the length (number of characters) of customer emails."
            ]
        }],
        "tasks": [{"name": "Standardize Names", "desc": "Standardize the customer names column to remove spaces and convert to uppercase."}],
        "interviews": ["Write a query to extract the username part of an email address (everything before the '@' symbol)."],
        "summary": "String functions are indispensable for data cleaning and standardization. <code>TRIM()</code> + <code>UPPER()</code>/<code>LOWER()</code> normalize casing and whitespace. <code>REPLACE()</code> handles bulk substitutions. <code>SUBSTR(str, 1, INSTR(str,'@')-1)</code> is the classic pattern for extracting email usernames."
    },
    {
        "day": 17, "title": "Date & Time Functions", "db": "ecommerce.db", "emoji": "📅",
        "objective": "Extract parts of date values, perform date arithmetic, and filter transactions by date intervals.",
        "sections": [{
            "num": 1, "title": "Dates & Times", "subtitle": "Formatting and Intervals",
            "theory": "SQLite stores dates as TEXT (ISO 8601), REAL, or INTEGER. Use <code>STRFTIME(format, date)</code> to format and extract parts: <code>%Y</code> (year), <code>%m</code> (month), <code>%d</code> (day), <code>%w</code> (day of week: 0=Sunday). Date difference is computed using <code>JULIANDAY</code>. <code>DATE('now')</code> returns today's date.",
            "demo": "-- Extract year and month from order dates\nSELECT id, order_date,\n  STRFTIME('%Y', order_date) as year,\n  STRFTIME('%m', order_date) as month\nFROM orders;",
            "cc": "Date & Time Functions",
            "questions": [
                "Find all orders placed in the year 2022.",
                "Find all orders placed in the month of October.",
                "Find orders placed on weekends (STRFTIME '%w' is '0' or '6').",
                "Calculate the number of days between customer signup date and their first order date.",
                "List all customers who signed up in Q4 of 2022 (Oct, Nov, Dec)."
            ]
        }],
        "tasks": [{"name": "Q4 Weekends", "desc": "Find all orders placed on weekends in Q4 of 2022."}],
        "interviews": ["How does SQLite store date and time fields? What are the implications for comparing dates?"],
        "summary": "SQLite date handling via <code>STRFTIME()</code> is flexible but requires strings in ISO 8601 format (<code>'YYYY-MM-DD'</code>). Use <code>JULIANDAY(date2) - JULIANDAY(date1)</code> for date differences in days. <code>STRFTIME('%w', date)</code> returns '0' for Sunday through '6' for Saturday."
    },
    {
        "day": 18, "title": "UNION, INTERSECT & EXCEPT (SET Operations)", "db": "ecommerce.db", "emoji": "🥞",
        "objective": "Combine, intersect, or subtract result sets from different queries using SET operators.",
        "sections": [{
            "num": 1, "title": "Set Operations", "subtitle": "UNION, INTERSECT, EXCEPT",
            "theory": "Set operators combine results from multiple queries. <code>UNION</code> merges results and removes duplicates. <code>UNION ALL</code> merges results keeping duplicates. <code>INTERSECT</code> finds common rows. <code>EXCEPT</code> finds rows in the first query not in the second. Column counts and types must match across all combined queries.",
            "demo": "-- Combine customer regions and product categories\nSELECT region as label FROM customers\nUNION\nSELECT name as label FROM categories;",
            "cc": "Set Operations",
            "questions": [
                "Get a unique combined list of customer names and product names using <code>UNION</code>.",
                "Find customer IDs who ordered both in October and in December using <code>INTERSECT</code>.",
                "List all customers who registered on the system but have placed NO orders using <code>EXCEPT</code>.",
                "Combine order items with product cost price and sale price, maintaining duplicates via <code>UNION ALL</code>.",
                "Find customer IDs who ordered in 2022 but did not order in 2023."
            ]
        }],
        "tasks": [{"name": "Customer Activity Sets", "desc": "Find customer IDs who signed up in 2022 and ordered in 2022."}],
        "interviews": ["Explain the exact difference between UNION and UNION ALL. Which is faster and why?"],
        "summary": "<code>UNION</code> deduplicates (slower), <code>UNION ALL</code> is faster and keeps all rows. <code>INTERSECT</code> is a clean alternative to a correlated subquery for finding overlap. <code>EXCEPT</code> is perfect for finding rows 'in A but not B' — like unordered customers or unassigned projects."
    },
    {
        "day": 19, "title": "Query Optimization & Best Practices", "db": "ecommerce.db", "emoji": "⚡",
        "objective": "Read execution plans, identify bottlenecks, avoid full table scans, and optimize query structure.",
        "sections": [{
            "num": 1, "title": "SQL Optimization", "subtitle": "Explain Plan and Indexes",
            "theory": "Optimization involves writing queries that run quickly. Use <code>EXPLAIN QUERY PLAN</code> in SQLite to see if the engine uses indexes or does full table scans. Best practices: avoid <code>SELECT *</code>, filter early with WHERE, index foreign keys, and write readable formatted SQL. Functions in WHERE clauses can bypass indexes.",
            "demo": "-- Explain query plan for customer lookup\nEXPLAIN QUERY PLAN SELECT * FROM customers WHERE id = 3;",
            "cc": "Optimization Basics",
            "questions": [
                "Run an <code>EXPLAIN QUERY PLAN</code> on a query that joins <code>orders</code> and <code>customers</code>.",
                "Run <code>EXPLAIN QUERY PLAN</code> on a query searching customer names by a LIKE pattern.",
                "Rewrite a query containing <code>SELECT *</code> to retrieve only required columns.",
                "Explain what indexing does and when it can slow down operations.",
                "Identify why filtering on a function (e.g. <code>WHERE UPPER(name) = 'AMIT'</code>) might bypass standard indexes."
            ]
        }],
        "tasks": [{"name": "Read Plans", "desc": "Run EXPLAIN QUERY PLAN on a query that calculates the total spend per customer."}],
        "interviews": ["What is a full table scan? How do you avoid it in a production database?"],
        "summary": "Fast SQL starts with understanding how the engine executes your query. <code>EXPLAIN QUERY PLAN</code> reveals whether an index is used. Key rules: select only needed columns, filter early, avoid functions on indexed columns in WHERE, and add indexes on frequently JOINed or filtered columns."
    },
    {
        "day": 20, "title": "SQL Capstone Project", "db": "capstone_retail.db", "emoji": "🏆",
        "objective": "Build a comprehensive Business Intelligence report from an extended relational schema, answering core business questions.",
        "sections": [{
            "num": 1, "title": "Capstone Overview", "subtitle": "Retail Business Intelligence",
            "theory": "In this final capstone, you will run complex multi-table joins, subqueries, CTEs, date functions, and window functions on the <code>capstone_retail.db</code> to extract critical business KPIs. The database has <code>sales</code>, <code>products</code>, <code>customers</code>, <code>regions</code>, and <code>sales_reps</code> tables. Apply everything you have learned across Days 1–19.",
            "demo": "-- View count of sales, orders, and total revenue in capstone db\nSELECT COUNT(*) as total_sales, SUM(amount) as total_rev FROM sales;",
            "cc": "Capstone Questions",
            "questions": [
                "<strong>Monthly Trend:</strong> Calculate total revenue and order count by month (using <code>sale_date</code>).",
                "<strong>Top Products:</strong> Find the top 10 products by revenue, displaying product name and category.",
                "<strong>Repeat Buyers:</strong> Count customer segmentation: how many customers placed 1 order vs repeat buyers (2+ orders)?",
                "<strong>Regional Performance:</strong> List revenue, average order value, and count of sales reps in each region.",
                "<strong>Return Rates:</strong> Calculate the return rate (orders returned / total orders) for each product category.",
                "<strong>Sales Rep Ranks:</strong> Rank sales reps by revenue generated within their assigned region using window functions.",
                "<strong>Cohort Analysis:</strong> Group customers by signup month and find their Lifetime Value (LTV).",
                "<strong>Day-of-Week:</strong> Find which day of the week (Sunday–Saturday) generates the highest average sale amount."
            ]
        }],
        "tasks": [{"name": "Final Query", "desc": "Write a query to retrieve the overall return percentage of the retail business."}],
        "interviews": ["Walk through how you structured your queries in the SQL Capstone to handle date parsing and window ranking."],
        "summary": "🎉 Congratulations on completing the 20-Day SQL for Data Analyst course! You have progressed from basic SELECT statements to writing production-grade analytical queries with CTEs, window functions, and optimization techniques. The skills you have built — filtering, joining, aggregating, and optimizing — are used every day by data analysts at top companies worldwide."
    },
]

# ─────────────────────────────────────────────────────────────────────────────
# EXCEL CURRICULUM (12 days)
# ─────────────────────────────────────────────────────────────────────────────
EXCEL_CURRICULUM = [
    {
        "day": 1, "title": "Excel Orientation & Essential Formulas", "emoji": "📊",
        "objective": "Learn spreadsheet coordinate navigation, cell references, basic arithmetic operators, and essential function syntax.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Quantity)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Price)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">C (Tax)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="10" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">10</td>
        <td id="cell-B1" data-val="150" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">150</td>
        <td id="cell-C1" data-val="15" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">15</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="5" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">5</td>
        <td id="cell-B2" data-val="300" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">300</td>
        <td id="cell-C2" data-val="30" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">30</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">3</td>
        <td id="cell-A3" data-val="2" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">2</td>
        <td id="cell-B3" data-val="1200" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">1200</td>
        <td id="cell-C3" data-val="120" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">120</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "Spreadsheet Coordinates", "subtitle": "Columns, Rows and Operators",
            "theory": "Excel stores data in columns (A, B, C...) and rows (1, 2, 3...). Every formula starts with an equals sign (=). You can perform standard arithmetic (+, -, *, /) and use ranges (A1:B3) inside functions. Cell references update automatically when you copy formulas — this is called relative referencing.",
            "demo": "=A1*B1+C1",
            "cc": "Basic Formulas",
            "questions": [
                "Calculate the product of A2 and B2.",
                "Sum the quantities in cells A1, A2, and A3 using basic addition (+).",
                "Subtract tax C1 from price B1.",
                "Divide price B2 by quantity A2.",
                "Calculate total price including tax for item 3 (A3 * B3 + C3)."
            ]
        }],
        "tasks": [{"name": "Aggregate Quantity", "desc": "Calculate the sum of all quantities from A1 to A3 using the SUM function."}],
        "interviews": ["Write the formula to calculate the average price of items 1, 2, and 3 using the AVERAGE function."],
        "summary": "Every Excel formula starts with <code>=</code>. Cell references like <code>A1</code> are the building blocks of all spreadsheet logic. Basic operators (+, -, *, /) combined with functions like <code>SUM()</code> and <code>AVERAGE()</code> allow you to build powerful calculations across ranges of data."
    },
    {
        "day": 2, "title": "Formatting, Sorting & Filtering", "emoji": "🎨",
        "objective": "Understand how formatting styles cells, and sort or filter a data grid by specific column constraints.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Product)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Rating)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">C (Price)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="Phone" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Phone</td>
        <td id="cell-B1" data-val="4.5" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">4.5</td>
        <td id="cell-C1" data-val="50000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">50000</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="Book" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Book</td>
        <td id="cell-B2" data-val="4.8" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">4.8</td>
        <td id="cell-C2" data-val="500" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">500</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">3</td>
        <td id="cell-A3" data-val="Laptop" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Laptop</td>
        <td id="cell-B3" data-val="4.2" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">4.2</td>
        <td id="cell-C3" data-val="80000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">80000</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "Grid Sorting and Filtering", "subtitle": "Formatting and Data Ordering",
            "theory": "Excel lets you sort data A–Z, Z–A, or by custom rules on any column. AutoFilter adds dropdown arrows that let you filter rows by value, color, or formula criteria. Number formatting (currency, percentage, decimal places) does not change the underlying value — it only affects display. Conditional Formatting applies color rules based on cell values.",
            "demo": "=SUM(C1:C3)",
            "cc": "Basic Formulas",
            "questions": [
                "Find the total price of all items in column C using <code>SUM(C1:C3)</code>.",
                "Find the average rating of items in column B using the <code>AVERAGE</code> function.",
                "Count the number of items listed by counting ratings in column B using <code>COUNT</code>.",
                "Find the maximum price in column C using <code>MAX</code>.",
                "Find the minimum rating in column B using <code>MIN</code>."
            ]
        }],
        "tasks": [{"name": "Total Rating", "desc": "Calculate the sum of all ratings from B1 to B3."}],
        "interviews": ["Write a formula to calculate the average of the ratings in B1, B2, and B3."],
        "summary": "Sorting (Data → Sort) and filtering (Data → AutoFilter) are Excel's primary data exploration tools. <code>MAX()</code> and <code>MIN()</code> help you quickly find extremes. Conditional Formatting visually highlights outliers — making it easy to spot trends without formulas."
    },
    {
        "day": 3, "title": "Data Cleaning Essentials", "emoji": "🧹",
        "objective": "Remove unwanted whitespace, normalize text casing, and handle blanks and duplicates to create clean, usable datasets.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Dirty Text)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Number)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="  Delhi" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">  Delhi</td>
        <td id="cell-B1" data-val="100" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">100</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="Mumbai " style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Mumbai </td>
        <td id="cell-B2" data-val="250" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">250</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "Text Trimming & Casing", "subtitle": "Formatting Cases and Cleaning Spacing",
            "theory": "Raw data is rarely clean. <code>TRIM(cell)</code> removes all leading and trailing spaces. <code>UPPER(cell)</code> converts to uppercase, <code>LOWER(cell)</code> to lowercase, and <code>PROPER(cell)</code> capitalizes each word. <code>COUNTA(range)</code> counts non-empty cells. <code>IFERROR(formula, fallback)</code> replaces formula errors with a default value.",
            "demo": "=UPPER(A1)",
            "cc": "Basic Cleaning",
            "questions": [
                "Convert text in A2 to lowercase using <code>LOWER</code>.",
                "Convert text in A1 to uppercase using <code>UPPER</code>.",
                "Find the total values in B1 and B2.",
                "Use <code>TRIM</code> to clean the spaces from A1.",
                "Use <code>PROPER</code> to title-case the text in A2."
            ]
        }],
        "tasks": [{"name": "Total Values", "desc": "Calculate the sum of all numerical cell values from B1 to B2."}],
        "interviews": ["Write a formula that trims whitespace AND converts cell A1 to proper case in a single formula."],
        "summary": "<code>TRIM()</code> is the single most-used data cleaning function — trailing spaces cause lookup failures and sort errors. Chain cleaning functions: <code>=TRIM(PROPER(A1))</code>. <code>COUNTA()</code> counts non-blanks to quickly audit how many records have data in a given column."
    },
    {
        "day": 4, "title": "Excel Tables", "emoji": "📋",
        "objective": "Convert data ranges into structured Excel Tables to unlock auto-expansion, structured references, and quick aggregation.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Base Salary)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Bonus)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="5000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">5000</td>
        <td id="cell-B1" data-val="500" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">500</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="6000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">6000</td>
        <td id="cell-B2" data-val="800" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">800</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "Structured Tables", "subtitle": "Aggregations Over Ranges",
            "theory": "Excel Tables (Insert → Table or Ctrl+T) transform a plain data range into a powerful structured object. Tables auto-expand when new rows are added, support structured references like <code>TableName[ColumnName]</code>, and have built-in filter dropdowns. The Total Row can instantly compute SUM, AVERAGE, COUNT, and more for each column.",
            "demo": "=SUM(A1:B2)",
            "cc": "Table Formulas",
            "questions": [
                "Calculate sum of A1 and B1 (total compensation for row 1).",
                "Calculate sum of A2 and B2 (total compensation for row 2).",
                "Calculate total base salary in range A1:A2.",
                "Calculate total bonus in range B1:B2.",
                "Calculate average base salary across A1:A2."
            ]
        }],
        "tasks": [{"name": "Total Earnings", "desc": "Calculate total compensation (base + bonus) across both rows using SUM(A1:B2)."}],
        "interviews": ["Calculate total bonus in range B1:B2 and explain why Excel Tables are better than plain ranges for growing datasets."],
        "summary": "Excel Tables are the professional way to manage data. They auto-expand, support structured references, and make formulas self-documenting. Always convert raw data to a Table before building PivotTables or VLOOKUP references — it prevents broken references when data grows."
    },
    {
        "day": 5, "title": "Lookup & Reference Functions", "emoji": "🔍",
        "objective": "Perform vertical and horizontal index searching across tables to retrieve related data from lookup tables.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Item ID)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Item Name)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">C (Price)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="101" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">101</td>
        <td id="cell-B1" data-val="Tablet" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Tablet</td>
        <td id="cell-C1" data-val="25000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">25000</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="102" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">102</td>
        <td id="cell-B2" data-val="Phone" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Phone</td>
        <td id="cell-C2" data-val="50000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">50000</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "VLOOKUP & INDEX/MATCH", "subtitle": "Lookup and Matching Functions",
            "theory": "<code>VLOOKUP(lookup_value, table_array, col_index, FALSE)</code> searches the first column of a table for a value and returns a value from another column. Always use FALSE for exact match. <code>INDEX(array, MATCH(value, column, 0))</code> is more flexible — it can look left, handles reordered columns, and is generally faster on large datasets.",
            "demo": "=VLOOKUP(101, A1:C2, 2, FALSE)",
            "cc": "Lookup Functions",
            "questions": [
                "Use VLOOKUP to find the name of item with ID 101.",
                "Use VLOOKUP to find the price of item with ID 102.",
                "Calculate the sum of prices in C1:C2.",
                "Find the maximum price in C1:C2.",
                "Convert the item name in B1 to uppercase."
            ]
        }],
        "tasks": [{"name": "Price Lookup", "desc": "Use VLOOKUP to find the price of item ID 102 from the lookup table A1:C2."}],
        "interviews": ["Explain why INDEX+MATCH is often preferred over VLOOKUP. When would you choose VLOOKUP?"],
        "summary": "<code>VLOOKUP</code> is the most recognized Excel function in job interviews. Always use <code>FALSE</code> for exact match. Its weakness: it only looks right from the lookup column. <code>INDEX(MATCH())</code> solves this — it can look left/right/up/down, making it the professional's choice."
    },
    {
        "day": 6, "title": "Logic Functions", "emoji": "🔀",
        "objective": "Apply logical flow control statements such as IF, AND, and OR to spreadsheet computations.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Grade)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Attendance %)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="85" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">85</td>
        <td id="cell-B1" data-val="90" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">90</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="45" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">45</td>
        <td id="cell-B2" data-val="70" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">70</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "Logical Formulas", "subtitle": "IF, AND, OR Conditionals",
            "theory": "The <code>IF(condition, value_if_true, value_if_false)</code> function is the foundation of conditional logic in Excel. <code>AND(cond1, cond2)</code> requires all conditions to be TRUE. <code>OR(cond1, cond2)</code> requires any one condition to be TRUE. <code>IFS(cond1, val1, cond2, val2, ...)</code> handles multiple conditions without nesting.",
            "demo": "=IF(A1>=50, \"Pass\", \"Fail\")",
            "cc": "Logic Functions",
            "questions": [
                "Check if student 1 grade A1 is >= 50. Return 'Pass' if true, else 'Fail'.",
                "Check if student 2 grade A2 is >= 50. Return 'Pass' if true, else 'Fail'.",
                "Check if student 1 attendance B1 is >= 75. Return 'Good' if true, else 'Poor'.",
                "Use AND to check if student 1 both passed (A1>=50) AND has good attendance (B1>=75).",
                "Use OR to check if student 2 either passed (A2>=50) OR has good attendance (B2>=75)."
            ]
        }],
        "tasks": [{"name": "Pass Check", "desc": "Check if student 2 grade in A2 is >= 50, returning 'Pass' if true and 'Fail' if false."}],
        "interviews": ["Write a nested IF formula that returns 'Distinction' if A1>=75, 'Pass' if A1>=50, and 'Fail' otherwise."],
        "summary": "<code>IF()</code> is Excel's most powerful single function. Avoid deep nesting (>3 levels) — use <code>IFS()</code> instead. <code>AND()</code>/<code>OR()</code> enable multi-condition logic. A common pattern: <code>=IF(AND(A1>=50, B1>=75), \"Eligible\", \"Not Eligible\")</code> for eligibility checks."
    },
    {
        "day": 7, "title": "Text Functions", "emoji": "📝",
        "objective": "Join strings, extract substrings, and modify character cases dynamically using Excel text operations.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (First Name)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Last Name)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="Rahul" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Rahul</td>
        <td id="cell-B1" data-val="Sharma" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Sharma</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="Amit" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Amit</td>
        <td id="cell-B2" data-val="Verma" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Verma</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "Text Manipulation", "subtitle": "Concatenation, Extraction and Casing",
            "theory": "<code>CONCAT(A1, \" \", B1)</code> or <code>A1&\" \"&B1</code> joins text values. <code>LEFT(text, n)</code> extracts the first n characters. <code>RIGHT(text, n)</code> extracts the last n. <code>MID(text, start, length)</code> extracts from a middle position. <code>LEN(text)</code> returns the total character count. <code>FIND(substring, text)</code> returns the position of a character.",
            "demo": "=CONCAT(A1, \" \", B1)",
            "cc": "Text Functions",
            "questions": [
                "Join first and last name in row 2 with a space between using CONCAT.",
                "Convert first name in A1 to uppercase.",
                "Convert last name in B2 to lowercase.",
                "Extract the first 3 characters of A1 using LEFT.",
                "Find the length (number of characters) of the full name A1 & B1."
            ]
        }],
        "tasks": [{"name": "Full Name", "desc": "Join Rahul (A1) and Sharma (B1) with a space between using CONCAT."}],
        "interviews": ["Write a formula to extract only the first name from a cell containing a full name 'Rahul Sharma' (assume single space separation)."],
        "summary": "Text functions are key for data transformation. The ampersand <code>&</code> operator and <code>CONCAT()</code> join strings. <code>LEFT()</code>/<code>RIGHT()</code>/<code>MID()</code> extract parts. A powerful combo: <code>=LEFT(A1, FIND(\" \", A1)-1)</code> extracts the first name from any full name."
    },
    {
        "day": 8, "title": "Date & Time Functions", "emoji": "📅",
        "objective": "Understand date serial numbers, extract date parts, and calculate time differences between dates.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Start Date as Days)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (End Date as Days)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="10" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">10</td>
        <td id="cell-B1" data-val="35" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">35</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="20" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">20</td>
        <td id="cell-B2" data-val="60" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">60</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "Date & Time Calculations", "subtitle": "Date Arithmetic and Extraction",
            "theory": "Excel stores dates as serial numbers (January 1, 1900 = 1). This means you can add/subtract days from dates directly. <code>TODAY()</code> returns today's date. <code>YEAR(date)</code>, <code>MONTH(date)</code>, <code>DAY(date)</code> extract parts. <code>DATEDIF(start, end, unit)</code> calculates the difference in days ('D'), months ('M'), or years ('Y').",
            "demo": "=B1-A1",
            "cc": "Date Calculations",
            "questions": [
                "Calculate the difference (in days) between B1 and A1.",
                "Calculate the difference (in days) between B2 and A2.",
                "Find the sum of start days A1 and A2.",
                "Find the average of end days B1 and B2.",
                "Find the maximum end day value in B1:B2."
            ]
        }],
        "tasks": [{"name": "Date Difference", "desc": "Calculate B2 minus A2 to find the number of days in period 2."}],
        "interviews": ["Explain how Excel stores dates internally and how this makes date arithmetic straightforward."],
        "summary": "Excel's date serial number system makes date math simple: just subtract dates to get days. Key functions: <code>TODAY()</code> for today's date, <code>YEAR()</code>/<code>MONTH()</code>/<code>DAY()</code> for extraction, and <code>DATEDIF()</code> for differences in months or years. Always check cell formatting when working with dates."
    },
    {
        "day": 9, "title": "Conditional Aggregation", "emoji": "🧮",
        "objective": "Perform logical count, sum, and average aggregations depending on single or multiple cell criteria.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Amount)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Status)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="1000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">1000</td>
        <td id="cell-B1" data-val="Paid" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Paid</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="2500" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">2500</td>
        <td id="cell-B2" data-val="Pending" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Pending</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">3</td>
        <td id="cell-A3" data-val="3000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">3000</td>
        <td id="cell-B3" data-val="Paid" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Paid</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "Conditional Aggregation", "subtitle": "COUNTIF, SUMIF, AVERAGEIF",
            "theory": "<code>COUNTIF(range, criteria)</code> counts cells meeting a condition. <code>SUMIF(range, criteria, sum_range)</code> sums cells in a sum_range where the criteria range matches. <code>AVERAGEIF(range, criteria, avg_range)</code> averages matching values. The multi-condition versions <code>COUNTIFS</code>, <code>SUMIFS</code>, and <code>AVERAGEIFS</code> accept multiple range/criteria pairs.",
            "demo": "=SUMIF(B1:B3, \"Paid\", A1:A3)",
            "cc": "Conditional Math",
            "questions": [
                "Use SUMIF to calculate the total amount of 'Paid' transactions.",
                "Use COUNTIF to count how many transactions have status 'Paid'.",
                "Find the sum of all amounts in range A1:A3.",
                "Use AVERAGEIF to find the average amount of 'Paid' transactions.",
                "Use IF to check if status B3 is 'Paid', returning A3 if true and 0 if false."
            ]
        }],
        "tasks": [{"name": "Paid Amount", "desc": "Use SUMIF to calculate the total amount of all 'Paid' transactions from A1:A3 where B1:B3 = 'Paid'."}],
        "interviews": ["Explain the difference between SUMIF and SUMIFS. Give an example where SUMIFS is necessary."],
        "summary": "<code>SUMIF</code>/<code>COUNTIF</code>/<code>AVERAGEIF</code> are the conditional aggregation trinity in Excel. For multiple conditions, use the IFS variants: <code>SUMIFS(sum_range, range1, crit1, range2, crit2)</code>. These functions power virtually all business reporting in Excel — revenue by region, count by status, average by category."
    },
    {
        "day": 10, "title": "PivotTables Core Mechanics", "emoji": "⚙️",
        "objective": "Build PivotTables to cross-tabulate categories and create aggregate summaries without writing formulas.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Category)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Revenue)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="Hardware" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Hardware</td>
        <td id="cell-B1" data-val="15000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">15000</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="Software" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Software</td>
        <td id="cell-B2" data-val="25000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">25000</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "PivotTable Basics", "subtitle": "Cross Tabulations and Summarization",
            "theory": "A PivotTable (Insert → PivotTable) dynamically summarizes data by dragging fields into Rows, Columns, Values, and Filters areas. It can group, count, sum, average, and rank data without any formulas. Refreshing a PivotTable (right-click → Refresh) updates it when source data changes. Row fields define the grouping dimension; Value fields define what is calculated.",
            "demo": "=SUM(B1:B2)",
            "cc": "PivotTable Formulas",
            "questions": [
                "Calculate the total revenue across B1 and B2.",
                "Find the average revenue of values in range B1:B2.",
                "Find the maximum revenue value in B1:B2.",
                "Convert category in A1 to uppercase.",
                "Calculate 10% of the total revenue (SUM(B1:B2) * 0.10)."
            ]
        }],
        "tasks": [{"name": "Total Revenue", "desc": "Calculate total revenue across both categories using SUM(B1:B2)."}],
        "interviews": ["Explain what a PivotTable Rows field, Values field, and Filters field do. Give a real-world example of each."],
        "summary": "PivotTables are the most powerful feature in Excel for data analysis — no formulas needed. Drag a category field to Rows, a numeric field to Values (set to SUM or COUNT), and instantly get a summary report. Always ensure your source data has headers and no blank rows before inserting a PivotTable."
    },
    {
        "day": 11, "title": "PivotTables Advanced & Charts", "emoji": "📈",
        "objective": "Build calculated fields, use slicers to interactively filter PivotTables, and visualize data with PivotCharts.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Project)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Hours)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="Alpha" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Alpha</td>
        <td id="cell-B1" data-val="120" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">120</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="Beta" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Beta</td>
        <td id="cell-B2" data-val="80" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">80</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "Advanced PivotTable Features", "subtitle": "Calculated Fields, Slicers and Charts",
            "theory": "Calculated Fields (PivotTable Analyze → Fields, Items & Sets → Calculated Field) let you create new measures using existing field formulas — e.g., Profit = Revenue - Cost. Slicers are visual filter buttons that let users click to filter PivotTables interactively. PivotCharts link directly to a PivotTable and automatically update when filters change.",
            "demo": "=SUM(B1:B2)",
            "cc": "Advanced Aggregations",
            "questions": [
                "Calculate total hours worked across B1:B2.",
                "Find the average hours worked across B1:B2.",
                "Use IF to check if project in A1 is 'Alpha', returning B1 if true and 0 if false.",
                "Find the maximum hours in B1:B2.",
                "Join project names A1 and A2 using CONCAT with a comma separator."
            ]
        }],
        "tasks": [{"name": "Total Hours", "desc": "Calculate the total hours across both projects using SUM(B1:B2)."}],
        "interviews": ["What is a Calculated Field in a PivotTable? Give an example of when you would use one."],
        "summary": "Calculated Fields transform a PivotTable into a mini reporting engine — computing profit margins, growth percentages, or conversion rates dynamically. Slicers make dashboards interactive without VBA. PivotCharts update in real-time when slicer filters change, enabling one-click executive dashboards."
    },
    {
        "day": 12, "title": "Data Validation, What-If & Capstone", "emoji": "🏆",
        "objective": "Build validation rules for data entry, use What-If scenarios for business modelling, and complete the Excel Capstone challenge.",
        "grid_html": """<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead><tr style="background-color: #161f30; color: #9ab4e9;">
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Cost)</th>
      <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Revenue)</th>
    </tr></thead>
    <tbody>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="10000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">10000</td>
        <td id="cell-B1" data-val="15000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">15000</td></tr>
      <tr><td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="20000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">20000</td>
        <td id="cell-B2" data-val="32000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">32000</td></tr>
    </tbody>
  </table>
</div>""",
        "sections": [{
            "num": 1, "title": "Capstone: Validation & What-If", "subtitle": "Data Integrity and Business Modelling",
            "theory": "Data Validation (Data → Data Validation) restricts cell input — e.g., allowing only numbers between 1 and 100, or a dropdown list of approved values. Goal Seek (What-If Analysis → Goal Seek) finds the input value needed to achieve a target formula result. Scenario Manager stores multiple what-if scenarios (e.g., Best Case / Worst Case) for side-by-side comparison.",
            "demo": "=B1-A1",
            "cc": "Capstone Formulas",
            "questions": [
                "Calculate profit for project 1 (B1 - A1).",
                "Calculate profit for project 2 (B2 - A2).",
                "Calculate total cost across A1:A2.",
                "Calculate total revenue across B1:B2.",
                "Calculate the profit margin percentage for project 1: ((B1-A1)/B1)*100."
            ]
        }],
        "tasks": [{"name": "Total Profit", "desc": "Calculate total profit across both projects: (B1 - A1) + (B2 - A2)."}],
        "interviews": ["What is Goal Seek in Excel? Describe a real-world scenario where you would use it."],
        "summary": "🎉 Congratulations on completing the 12-Day Excel for Data Analyst course! You have mastered formulas, lookups, logic, text/date functions, SUMIF, PivotTables, and business modelling tools. These skills — especially VLOOKUP, SUMIFS, and PivotTables — are the backbone of data work in finance, marketing, operations, and virtually every industry."
    },
]


# ─────────────────────────────────────────────────────────────────────────────
# HTML GENERATOR
# ─────────────────────────────────────────────────────────────────────────────

def build_dropdown(curriculum, current_day, course_type):
    lines = []
    for item in curriculum:
        d = item['day']
        active = 'active' if d == current_day else ''
        title = item['title']
        emoji = item['emoji']
        num = f"{d:02d}"
        lines.append(f'<a href="day{num}.html" class="dropdown-item {active}"><span class="day-num">Day {num}</span> <span class="day-em">{emoji}</span> {title}</a>')
    return '\n'.join(lines)


def build_toc(sections, checks_ids, has_summary=True):
    lines = []
    lines.append('<li><a href="#sec-0" class="toc-link">🎯 Enterprise Objective</a></li>')
    for sec in sections:
        lines.append(f'<li><a href="#sec-{sec["num"]}" class="toc-link">{sec["num"]}. {sec["title"]}</a></li>')
        lines.append(f'<li><a href="#{checks_ids[sec["num"]]}" class="toc-link">🧪 Checks: {sec["cc"]}</a></li>')
    lines.append('<li><a href="#practice" class="toc-link">🛠️ Practice Tasks</a></li>')
    lines.append('<li><a href="#interview" class="toc-link">💻 Interview Questions</a></li>')
    if has_summary:
        lines.append('<li><a href="#summary" class="toc-link">📊 Executive Summary</a></li>')
    return '\n'.join(lines)


def generate_page(item, curriculum, course_type):
    """Generate a single fully-populated HTML day page."""
    day = item['day']
    total_days = len(curriculum)
    num = f"{day:02d}"
    title = item['title']
    emoji = item['emoji']
    objective = item['objective']

    if course_type == 'sql':
        course_name = "SQL for Data Analyst"
        kernel = "sql"
        status_bar = "🔌 Connected to SQL Server Database"
        placeholder = "-- Write your SQL query here"
        course_id = "sql-20day"
        extra_scripts = ""
        protected_regex = r"/day(0[3-9]|[12][0-9]|20)\.html/"
        home_link = "../home.html"
    else:
        course_name = "Excel for Data Analyst"
        kernel = "excel"
        status_bar = "📊 Loading Excel Formula Engine..."
        placeholder = "=Write your Excel formula here"
        course_id = "excel-12day"
        extra_scripts = '<script defer src="https://cdn.jsdelivr.net/npm/xlsx@0.18.5/dist/xlsx.full.min.js"></script>'
        protected_regex = r"/day(0[3-9]|1[0-2])\.html/"
        home_link = "../home.html"

    # Prev/Next navigation
    if day == 1:
        prev_btn = '<a href="#" class="nav-icon-btn prev-btn disabled" aria-label="Previous Day" title="Previous Day"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg></a>'
    else:
        prev_num = f"{day-1:02d}"
        prev_btn = f'<a href="day{prev_num}.html" class="nav-icon-btn prev-btn" aria-label="Previous Day" title="Previous Day"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg></a>'

    if day == total_days:
        next_btn = '<a href="../index.html" class="nav-icon-btn next-btn finish-btn" aria-label="Finish Course" title="Finish Course"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg></a>'
    else:
        next_num = f"{day+1:02d}"
        next_btn = f'<a href="day{next_num}.html" class="nav-icon-btn next-btn" aria-label="Next Day" title="Next Day"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg></a>'

    # Protected day noindex meta
    is_protected = day >= 3
    noindex_meta = '<meta name="robots" content="noindex, nofollow">\n' if is_protected else ''

    # Build notebook sections
    notebook_sections = []
    checks_ids = {}

    # sec-0: objective / grid
    if course_type == 'excel':
        grid = item.get('grid_html', '')
        sec0_content = f'''<div class="nb-section" id="sec-0">
<div class="nb-rich">{grid}</div>
</div>'''
    else:
        sec0_content = '<div class="nb-section" id="sec-0">\n</div>'
    notebook_sections.append(sec0_content)

    cell_counter = [0]

    def next_cell():
        cell_counter[0] += 1
        return f"cell-{cell_counter[0]}"

    for sec in item['sections']:
        sec_num = sec['num']
        sec_theory = sec['theory']
        sec_demo = sec['demo']
        cc_name = sec['cc']
        checks_id = f"checks-{cc_name}-{sec_num + 2}"
        checks_ids[sec_num] = checks_id

        # Theory section
        theory_html = f'''<div class="nb-section" id="sec-{sec_num}">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>{sec_num}. {sec["title"]} : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">{sec["subtitle"]}</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
    {sec_theory}
</div></div>'''

        demo_cell_id = next_cell()
        demo_run_btn = f"runCell('{demo_cell_id}')"
        demo_clear_btn = f"clearOutput('{demo_cell_id}')"
        theory_html += f'''
<div class="code-cell" id="{demo_cell_id}">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="{demo_run_btn}">▶ Run</button><button class="clear-btn" onclick="{demo_clear_btn}">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-{demo_cell_id.split('-')[1]}">{sec_demo}</textarea>
<div class="cell-output hidden"></div></div>
</div>'''
        notebook_sections.append(theory_html)

        # Concept checks section
        checks_html = f'''<div class="nb-section" id="{checks_id}">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>{cc_name}</code></b>
</h3></div>'''
        for i, q in enumerate(sec['questions'], 1):
            qcell_id = next_cell()
            qcell_num = qcell_id.split('-')[1]
            checks_html += f'''
<div class="question"><p><strong>Q{i}.</strong> {q}</p></div>
<div class="code-cell" id="{qcell_id}">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell('{qcell_id}')">▶ Run</button><button class="clear-btn" onclick="clearOutput('{qcell_id}')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-{qcell_num}">{placeholder}</textarea>
<div class="cell-output hidden"></div></div>'''
        checks_html += '\n</div>'
        notebook_sections.append(checks_html)

    # Practice tasks
    practice_html = '<div class="nb-section" id="practice">\n<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>'
    for i, task in enumerate(item['tasks'], 1):
        tcell_id = next_cell()
        tcell_num = tcell_id.split('-')[1]
        practice_html += f'''
<div class="question task"><p><strong>Task {i} ({task["name"]}):</strong> {task["desc"]}</p></div>
<div class="code-cell" id="{tcell_id}">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell('{tcell_id}')">▶ Run</button><button class="clear-btn" onclick="clearOutput('{tcell_id}')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-{tcell_num}">{placeholder}</textarea>
<div class="cell-output hidden"></div></div>'''
    practice_html += '\n</div>'
    notebook_sections.append(practice_html)

    # Interview section
    interview_html = '<div class="nb-section" id="interview">\n<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>'
    for i, q in enumerate(item['interviews'], 1):
        icell_id = next_cell()
        icell_num = icell_id.split('-')[1]
        interview_html += f'''
<div class="question interview"><p><strong>Q{i}.</strong> {q}</p></div>
<div class="code-cell" id="{icell_id}">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell('{icell_id}')">▶ Run</button><button class="clear-btn" onclick="clearOutput('{icell_id}')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-{icell_num}">{placeholder}</textarea>
<div class="cell-output hidden"></div></div>'''
    interview_html += '\n</div>'
    notebook_sections.append(interview_html)

    # Executive summary
    summary = item.get('summary', '')
    summary_html = f'''<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day {num} Executive Summary</h2></div>
<div class="nb-rich"><div style="border-left: 4px solid #22d3ee; padding-left: 16px; margin: 20px 0; color: #CBD5E1; font-size: 0.97em; line-height: 1.75;">{summary}</div></div>
</div>'''
    notebook_sections.append(summary_html)

    # TOC
    toc_items = build_toc(item['sections'], checks_ids)
    dropdown_items = build_dropdown(curriculum, day, course_type)

    html = f'''<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Day {num}: {title} — {course_name} — Manodemy</title>
<meta name="description" content="Day {num}: {title} — Interactive workbook with hands-on challenges. Part of Manodemy\'s {course_name} course.">
{noindex_meta}
<!-- Performance: Preconnect to critical origins -->
<link rel="preconnect" href="https://cdn.jsdelivr.net">
<link rel="dns-prefetch" href="https://cdn.jsdelivr.net">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="dns-prefetch" href="https://erqoyvbuhmkyvcqgwcbz.supabase.co">
<!-- Supabase SDK (deferred) -->
<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2" defer></script>
<!-- Authentication + Enrollment Route Guard -->
<script>
  document.addEventListener('DOMContentLoaded', async function PaywallGuard() {{
    const currentPath = window.location.pathname;
    const isProtectedDay = currentPath.match({protected_regex});
    const removePreload = () => {{
      const p = document.getElementById('paywall-preload-screen');
      if (p) p.remove();
    }};
    if (!isProtectedDay) {{ removePreload(); return; }}
    try {{
      if (typeof window.supabase === 'undefined') {{
        window.location.href = '../index.html?reason=sdk_blocked'; return;
      }}
      const SUPA_URL = 'https://erqoyvbuhmkyvcqgwcbz.supabase.co';
      const SUPA_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVycW95dmJ1aG1reXZjcWd3Y2J6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzODk1MTIsImV4cCI6MjA5NDk2NTUxMn0.9UnIfq8xMrKANPPTtoOADKH-NJ_it9HDp7xrJL4FXtw';
      const sb = window.supabase.createClient(SUPA_URL, SUPA_KEY);
      const {{ data: {{ session }}, error }} = await sb.auth.getSession();
      if (error || !session) {{
        window.location.href = `../index.html?redirect=${{encodeURIComponent(currentPath)}}`; return;
      }}
      const plan = session.user.user_metadata?.plan;
      const isEnrolledLocal = localStorage.getItem('manodemy_enrolled') === 'true';
      if (plan === 'pro' || isEnrolledLocal) {{ removePreload(); return; }}
      try {{
        const {{ data: enrolled }} = await sb.rpc('check_enrollment', {{ p_course_id: '{course_id}' }});
        if (enrolled) {{
          localStorage.setItem('manodemy_enrolled', 'true');
          removePreload(); return;
        }}
      }} catch (rpcErr) {{ /* RPC failed */ }}
      window.location.href = `../index.html#pricing?locked=true`;
    }} catch (err) {{ window.location.href = `../index.html`; }}
  }});
</script>
<!-- Non-render-blocking fonts -->
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800;900&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet" media="print" onload="this.media='all'">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/codemirror.min.css">
<link rel="stylesheet" href="../notebook.css">
<!-- PWA -->
<link rel="manifest" href="/manifest.json">
<link rel="icon" type="image/png" sizes="192x192" href="/icon-192x192.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="theme-color" content="#060913">
</head>
<body data-kernel="{kernel}">
<!-- Paywall Preload Screen -->
<div id="paywall-preload-screen" class="paywall-preload" aria-hidden="true">
  <div class="paywall-preload__spinner"></div>
</div>

<nav class="top-bar nav-container" id="topBar">
  <div class="nav-zone--left">
    <div class="avatar-wrapper" id="profileAvatar" role="button" tabindex="0" aria-label="Open profile card" aria-expanded="false" aria-haspopup="true">
      <div class="avatar-circle" id="avatarCircle"></div>
      <div class="avatar-status-dot" aria-hidden="true"></div>
    </div>
    <div class="nav-score-card">
      <div class="score-info">
        <span class="score-label">Solved</span>
        <span class="score-values"><span id="scoreSolved" class="score-highlight">0</span> / <span id="scoreTotal">0</span></span>
      </div>
      <div class="score-track"><div class="score-fill" id="scoreProgress" style="width:0%"></div></div>
    </div>
  </div>

  <div class="nav-center has-dropdown">
    <div class="nav-center-flex">
      {prev_btn}
      <button class="nav-dropdown-btn" id="dayDropdownBtn">
        <span class="day-badge">Day {num}</span>
        <span class="day-title">{title}</span>
        <svg class="dropdown-chevron" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"></polyline></svg>
      </button>
      {next_btn}
    </div>
    <div class="nav-dropdown-menu" id="dayDropdownMenu">
      <div class="dropdown-header">Jump to another day</div>
      <div class="dropdown-scroll">
        {dropdown_items}
      </div>
    </div>
  </div>

  <div class="nav-zone--right">
    <div class="nav-controls">
      <a href="{home_link}" class="nav-icon-btn scorecard-btn" title="Back to Dashboard" aria-label="Score Card">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="margin-right:4px;"><rect x="3" y="3" width="7" height="9"></rect><rect x="14" y="3" width="7" height="5"></rect><rect x="14" y="12" width="7" height="9"></rect><rect x="3" y="16" width="7" height="5"></rect></svg>
        Score Card
      </a>
    </div>
  </div>
</nav>

<div class="profile-card" id="profileCard" role="dialog" aria-label="User profile summary" aria-modal="false">
  <div class="profile-card__header">
    <div class="profile-card__info">
      <h2 class="profile-card__name" id="profileName">Loading...</h2>
      <p class="profile-card__email" id="profileEmail">loading@... </p>
    </div>
    <span class="profile-card__badge" id="profileBadge">Free</span>
  </div>
  <div class="profile-card__progress-section">
    <div class="profile-card__progress-labels">
      <span class="profile-card__progress-text">Overall Progress</span>
      <span class="profile-card__progress-pct" id="profileProgressPct">0%</span>
    </div>
  </div>
  <button class="profile-card__signout" id="signOutBtn">Sign Out</button>
</div>

<div class="pyodide-status" id="pyStatus">{status_bar}</div>
<div class="layout">
  <main class="notebook" id="notebook">
    <div class="nb-title"><h1>{emoji} Day {num} : {title}</h1></div>
{chr(10).join(notebook_sections)}
  </main>
  <nav class="sidebar" id="sidebar">
    <div class="sidebar-top"><div class="sidebar-header"><span class="icon">📄</span> CONTENTS</div></div>
    <ul class="toc-list">{toc_items}</ul>
    <div class="sidebar-resize" id="sidebarResize"></div>
  </nav>
</div>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/codemirror.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/mode/python/python.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/addon/edit/closebrackets.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/addon/edit/matchbrackets.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/addon/comment/comment.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/addon/selection/active-line.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/addon/fold/foldcode.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/addon/fold/foldgutter.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/addon/fold/indent-fold.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/addon/hint/show-hint.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/addon/hint/anyword-hint.min.js"></script>
{extra_scripts}
<script defer src="../notebook.js?v=2.1"></script>
<script src="../voice.js" defer></script>
<script src="../hints.js" defer></script>
<!-- PWA Service Worker Registration -->
<script>
  if ('serviceWorker' in navigator) {{
    window.addEventListener('load', () => {{
      navigator.serviceWorker.register('/sw.js')
        .then(reg => console.log('[Service Worker] Registered scope:', reg.scope))
        .catch(err => console.error('[Service Worker] Registration failed:', err));
    }});
  }}
</script>
</body>
</html>'''
    return html


def write_pages(curriculum, course_type):
    folder = course_type  # 'sql' or 'excel'
    public_folder = os.path.join('public', course_type)
    os.makedirs(folder, exist_ok=True)
    os.makedirs(public_folder, exist_ok=True)

    for item in curriculum:
        day = item['day']
        num = f"{day:02d}"
        html_content = generate_page(item, curriculum, course_type)
        filename = f"day{num}.html"

        # Write to source folder
        path1 = os.path.join(folder, filename)
        with open(path1, 'w', encoding='utf-8') as f:
            f.write(html_content)

        # Write to public folder (for Vercel static serving)
        path2 = os.path.join(public_folder, filename)
        with open(path2, 'w', encoding='utf-8') as f:
            f.write(html_content)

        print(f"  ✅ {course_type.upper()} Day {num}: {item['title']}")

    print(f"\n✅ Generated {len(curriculum)} {course_type.upper()} day pages → {folder}/ and {public_folder}/\n")


if __name__ == '__main__':
    print("\n🚀 Generating SQL Day Pages (20 days)...")
    write_pages(SQL_CURRICULUM, 'sql')

    print("🚀 Generating Excel Day Pages (12 days)...")
    write_pages(EXCEL_CURRICULUM, 'excel')

    print("✅ All day pages generated successfully!")
