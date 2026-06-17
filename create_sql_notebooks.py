import os
import json

def generate_notebooks():
    os.makedirs('notebooks/sql', exist_ok=True)
    
    curriculum = [
        # Day 01
        {
            "day": 1,
            "title": "Introduction to SQL & Databases",
            "db": "retail.db",
            "emoji": "🗄️",
            "objective": "Understand RDBMS concepts, tables, columns, rows, and write your first SELECT statements to retrieve data.",
            "sections": [
                {
                    "num": 1,
                    "title": "What is a Database?",
                    "subtitle": "Understanding RDBMS and Tables",
                    "theory": "A database is an organized collection of structured data. A Relational Database Management System (RDBMS) stores data in tables consisting of columns (attributes) and rows (records). Unlike spreadsheets, databases enforce data types, handle millions of rows efficiently, and prevent duplicates through constraints.",
                    "demo": "-- Look at the schema of the sales table\nSELECT * FROM sales LIMIT 5;",
                    "cc": "Basic Querying",
                    "questions": [
                        "### **Q1.** Write a query to retrieve all columns from the `products` table.",
                        "### **Q2.** Retrieve only the `name` and `unit_price` columns from the `products` table.",
                        "### **Q3.** Retrieve the `product` and `amount` from the `sales` table, aliasing `product` as `product_name` and `amount` as `sale_value`.",
                        "### **Q4.** List all unique (distinct) product categories from the `sales` table.",
                        "### **Q5.** Write a query to find all unique regions from the `sales` table."
                    ]
                }
            ],
            "tasks": [
                {"name": "Categories Sold", "desc": "Write a query to list all unique product categories sold from the `sales` table."}
            ],
            "interviews": [
                "Write a query to show all details of products, but rename `stock_qty` to `available_units`."
            ]
        },
        # Day 02
        {
            "day": 2,
            "title": "Filtering Data with WHERE",
            "db": "retail.db",
            "emoji": "🔍",
            "objective": "Filter query results using conditional statements, logical operators, and value list checking.",
            "sections": [
                {
                    "num": 1,
                    "title": "The WHERE Clause",
                    "subtitle": "Conditional Filtering",
                    "theory": "The WHERE clause is used to filter records that meet specific conditions. You can use operators like `=`, `!=`, `>`, `<`, `>=`, `<=`, as well as logical operators `AND`, `OR`, `NOT`. Precedence can be controlled using parentheses.",
                    "demo": "-- Find sales in the 'North' region where amount is greater than 1000\nSELECT * FROM sales WHERE region = 'North' AND amount > 1000;",
                    "cc": "WHERE Filters",
                    "questions": [
                        "### **Q1.** Find all sales where the `category` is 'Electronics'.",
                        "### **Q2.** Find all sales where the `amount` is between 5000 and 10000 (inclusive) using `BETWEEN`.",
                        "### **Q3.** Get all products in the `products` table where `unit_price` is less than or equal to 2000.",
                        "### **Q4.** Find sales in 'South' or 'West' regions using the `IN` operator.",
                        "### **Q5.** Find sales that are NOT in the 'North' region."
                    ]
                }
            ],
            "tasks": [
                {"name": "High Value North", "desc": "Find all sales over ₹5,000 in the 'North' region."}
            ],
            "interviews": [
                "Select all products with a unit price strictly greater than 5000 and stock quantity greater than 20."
            ]
        },
        # Day 03
        {
            "day": 3,
            "title": "Pattern Matching & NULL Handling",
            "db": "retail.db",
            "emoji": "📝",
            "objective": "Perform text search using wildcards and understand how to handle missing (NULL) values correctly.",
            "sections": [
                {
                    "num": 1,
                    "title": "LIKE & NULLs",
                    "subtitle": "Wildcards and Missing Data",
                    "theory": "The `LIKE` operator is used with `%` (any characters) and `_` (single character) for pattern matching. `NULL` represents missing or unknown values, which must be checked with `IS NULL` or `IS NOT NULL` (not `= NULL`). `COALESCE` replaces NULLs with fallback values.",
                    "demo": "-- Find customers with names containing 'Kumar'\nSELECT * FROM sales WHERE customer_name LIKE '%Kumar%';",
                    "cc": "Wildcards & NULL Handling",
                    "questions": [
                        "### **Q1.** Find all sales records where `customer_name` starts with the letter 'A'.",
                        "### **Q2.** Find all sales records where `customer_email` is NULL.",
                        "### **Q3.** Find all sales records where `customer_email` is NOT NULL.",
                        "### **Q4.** Write a query using `COALESCE` to display the customer's email, or the text 'No Email' if it is NULL.",
                        "### **Q5.** Find sales where the product name ends with 'Book'."
                    ]
                }
            ],
            "tasks": [
                {"name": "Customer Search", "desc": "Find all customers whose names start with 'A' or have a NULL email."}
            ],
            "interviews": [
                "Write a query to find all products where name starts with 'Wireless' and category is 'Electronics'."
            ]
        },
        # Day 04
        {
            "day": 4,
            "title": "Sorting & Limiting Results",
            "db": "retail.db",
            "emoji": "📈",
            "objective": "Control the display order of rows and restrict output size for pagination or top-N analysis.",
            "sections": [
                {
                    "num": 1,
                    "title": "Sorting & Limits",
                    "subtitle": "ORDER BY and LIMIT",
                    "theory": "The `ORDER BY` clause sorts results by one or more columns in ascending (ASC) or descending (DESC) order. `LIMIT` restricts the number of returned rows. `OFFSET` skips a specified number of rows, useful for pagination.",
                    "demo": "-- Sort products by price descending and limit to top 3\nSELECT * FROM products ORDER BY unit_price DESC LIMIT 3;",
                    "cc": "Sorting and Limiting",
                    "questions": [
                        "### **Q1.** Sort the `sales` table by `amount` in descending order.",
                        "### **Q2.** Sort the `sales` table by `region` ascending, and then by `amount` descending.",
                        "### **Q3.** Get the top 5 highest sales amount records.",
                        "### **Q4.** Get the 5 next highest sales amount records (skipping the top 5) using `OFFSET`.",
                        "### **Q5.** Sort the `products` table by `stock_qty` ascending, placing any NULL stock values last."
                    ]
                }
            ],
            "tasks": [
                {"name": "Top Sales", "desc": "Get the top 10 highest-value sales, most recent first."}
            ],
            "interviews": [
                "Find the single cheapest product that is in stock (stock quantity > 0)."
            ]
        },
        # Day 05
        {
            "day": 5,
            "title": "Aggregate Functions",
            "db": "retail.db",
            "emoji": "📊",
            "objective": "Calculate summary metrics like counts, sums, averages, minimums, and maximums across datasets.",
            "sections": [
                {
                    "num": 1,
                    "title": "Aggregations",
                    "subtitle": "COUNT, SUM, AVG, MIN, MAX",
                    "theory": "Aggregate functions perform calculations on a set of values and return a single summary value. `COUNT(*)` counts all rows, while `COUNT(column)` ignores NULL values. `SUM`, `AVG`, `MIN`, and `MAX` provide general statistics.",
                    "demo": "-- Count sales and find total revenue\nSELECT COUNT(*) as total_orders, SUM(amount) as total_revenue, AVG(amount) as avg_order_value FROM sales;",
                    "cc": "Basic Aggregations",
                    "questions": [
                        "### **Q1.** Count the total number of products in the `products` table.",
                        "### **Q2.** Find the total stock quantity of all products combined.",
                        "### **Q3.** Find the average price of products in the 'Electronics' category.",
                        "### **Q4.** Find the lowest and highest unit prices in the `products` table.",
                        "### **Q5.** Count the number of sales that occurred in the 'North' region."
                    ]
                }
            ],
            "tasks": [
                {"name": "Category Average", "desc": "Calculate the average sale value in the 'Books' category."}
            ],
            "interviews": [
                "Write a query to calculate the average sale amount, total sale amount, and number of orders for customer_id = 5."
            ]
        },
        # Day 06
        {
            "day": 6,
            "title": "GROUP BY & HAVING",
            "db": "retail.db",
            "emoji": "🗃️",
            "objective": "Group data rows by matching column values and filter aggregated summaries using HAVING.",
            "sections": [
                {
                    "num": 1,
                    "title": "Grouping and HAVING",
                    "subtitle": "GROUP BY and HAVING",
                    "theory": "The `GROUP BY` statement groups rows that have the same values into summary rows. The `HAVING` clause filters groups based on aggregate conditions (like `SUM(amount) > 10000`), whereas `WHERE` filters rows before grouping.",
                    "demo": "-- Find total sales revenue per region\nSELECT region, SUM(amount) as total_sales FROM sales GROUP BY region HAVING total_sales > 100000;",
                    "cc": "Group By & Having",
                    "questions": [
                        "### **Q1.** Group `sales` by `category` and find the total count of sales for each.",
                        "### **Q2.** Group `sales` by `region` and find the average sale amount per region.",
                        "### **Q3.** Find product categories with total sales revenue greater than 50,000.",
                        "### **Q4.** Find the number of orders placed by each customer_id.",
                        "### **Q5.** Show regions that have more than 20 sales transactions."
                    ]
                }
            ],
            "tasks": [
                {"name": "High Value Groups", "desc": "Find categories with more than 30 orders and average sale > ₹3,000."}
            ],
            "interviews": [
                "Write a query to find the customer_ids who have spent more than ₹15,000 in total across all their purchases."
            ]
        },
        # Day 07
        {
            "day": 7,
            "title": "Data Types, Casting & Expressions",
            "db": "retail.db",
            "emoji": "➕",
            "objective": "Perform mathematical operations, concatenate string fields, and explicitly convert data types.",
            "sections": [
                {
                    "num": 1,
                    "title": "Casting & Operations",
                    "subtitle": "Casts and Mathematical Calculations",
                    "theory": "SQL allows arithmetic calculations in the SELECT clause. Standard text strings can be merged using concatenation (the `||` operator). Data types can be explicitly converted using `CAST(expression AS type)`.",
                    "demo": "-- Concatenate region and manager, and calculate a 10% discount price\nSELECT name || ' (Manager: ' || manager || ')' as region_info, zone FROM regions;",
                    "cc": "Expressions & Casting",
                    "questions": [
                        "### **Q1.** Calculate a 10% VAT tax for each product in the `products` table (unit_price * 0.10).",
                        "### **Q2.** Retrieve product names and calculate their total value in stock (`unit_price * stock_qty`).",
                        "### **Q3.** Explicitly cast the `amount` column in the `sales` table as an INTEGER.",
                        "### **Q4.** Concatenate product `name` and `category` from the `products` table separated by a hyphen.",
                        "### **Q5.** Write a query to find the modulus (remainder) of `stock_qty` divided by 10 for all products."
                    ]
                }
            ],
            "tasks": [
                {"name": "Revenue Tier", "desc": "Calculate a custom 'projected_price' for each product if it rises by 15%."}
            ],
            "interviews": [
                "Write a query that divides `unit_price` by `stock_qty` but casts both to REAL to avoid integer division issues."
            ]
        },
        # Day 08
        {
            "day": 8,
            "title": "CASE WHEN (Conditional Logic)",
            "db": "retail.db",
            "emoji": "🔀",
            "objective": "Write conditional flow logic directly in SQL statements to classify data values dynamically.",
            "sections": [
                {
                    "num": 1,
                    "title": "Conditional CASE",
                    "subtitle": "CASE WHEN / THEN / ELSE",
                    "theory": "The `CASE` expression is SQL's version of if-then-else logic. It evaluates conditions and returns a value when the first condition is met. If no conditions are met, it returns the value in the `ELSE` clause (or NULL if omitted).",
                    "demo": "-- Classify products based on price\nSELECT name, unit_price, CASE WHEN unit_price > 10000 THEN 'Premium' WHEN unit_price > 2000 THEN 'Mid-range' ELSE 'Budget' END as price_tier FROM products;",
                    "cc": "CASE Expressions",
                    "questions": [
                        "### **Q1.** Classify sales amounts as 'Small' (under 2000), 'Medium' (2000 to 8000), and 'Large' (above 8000).",
                        "### **Q2.** Write a query displaying product name, stock quantity, and status: 'Out of Stock' (stock_qty = 0), 'Low Stock' (under 20), 'In Stock' (otherwise).",
                        "### **Q3.** Use a CASE statement inside `SUM` to count how many sales occurred in the 'North' region.",
                        "### **Q4.** Pivot sales: write a query displaying total amount for 'Electronics' and total amount for 'Books' as two separate columns.",
                        "### **Q5.** Classify regions: if region is 'North' or 'East' then 'Group A', else 'Group B'."
                    ]
                }
            ],
            "tasks": [
                {"name": "Tier Counts", "desc": "Classify each sale as 'Low', 'Medium', 'High' value; count the number of sales in each tier."}
            ],
            "interviews": [
                "Write a query that labels any sale of 'Python Course Book' or 'Data Science Bundle' as 'Course Materials', and others as 'Hardware/Accessories'."
            ]
        },
        # Day 09
        {
            "day": 9,
            "title": "Understanding Relationships & INNER JOIN",
            "db": "company.db",
            "emoji": "🔗",
            "objective": "Establish data relationships and combine data records from multiple tables based on primary/foreign keys.",
            "sections": [
                {
                    "num": 1,
                    "title": "INNER JOIN",
                    "subtitle": "Matching Keys Across Tables",
                    "theory": "Tables in relational databases are linked by foreign keys matching primary keys. An `INNER JOIN` selects records that have matching values in both tables. Tables can be aliased to keep queries readable.",
                    "demo": "-- Get employees with their department name\nSELECT e.name as employee_name, d.name as department_name FROM employees e INNER JOIN departments d ON e.dept_id = d.id;",
                    "cc": "INNER JOIN",
                    "questions": [
                        "### **Q1.** Join `employees` and `departments` to list employee names, department names, and department budgets.",
                        "### **Q2.** Join `employees` and `salaries` to find the current salary amount for each employee (effective_date = hire_date or matching dates).",
                        "### **Q3.** Retrieve employee name, project name, and role for all assigned projects by joining `employees`, `emp_projects`, and `projects`.",
                        "### **Q4.** Find the names of employees in the 'Engineering' department.",
                        "### **Q5.** Write a query displaying employee name and their current salary, filtering for salaries above 80000."
                    ]
                }
            ],
            "tasks": [
                {"name": "Department Salaries", "desc": "Get each employee's name with their department name and salary."}
            ],
            "interviews": [
                "Retrieve names of all employees who are working on the project 'Alpha Analytics'."
            ]
        },
        # Day 10
        {
            "day": 10,
            "title": "LEFT, RIGHT & FULL OUTER JOIN",
            "db": "company.db",
            "emoji": "🔄",
            "objective": "Use OUTER JOINs to keep unmatched records from either table and detect orphaned rows.",
            "sections": [
                {
                    "num": 1,
                    "title": "Outer Joins",
                    "subtitle": "LEFT, RIGHT and FULL Joins",
                    "theory": "Unlike INNER JOIN, OUTER JOINs keep records even if there are no matches. A `LEFT JOIN` returns all records from the left table, and matching records from the right (with NULLs for non-matches). SQLite natively supports LEFT JOIN (use LEFT JOIN and order of tables to simulate RIGHT/FULL).",
                    "demo": "-- Find all departments and any employees assigned to them (even if empty)\nSELECT d.name as department, e.name as employee FROM departments d LEFT JOIN employees e ON d.id = e.dept_id;",
                    "cc": "Outer Joins",
                    "questions": [
                        "### **Q1.** Write a query using a `LEFT JOIN` to list all departments and their employee count.",
                        "### **Q2.** Find all employees who are NOT assigned to any project by LEFT joining `employees` to `emp_projects`.",
                        "### **Q3.** List all projects and any employee names assigned to them, including projects with no employees.",
                        "### **Q4.** Use a LEFT JOIN and a WHERE condition to list departments that have NO employees assigned.",
                        "### **Q5.** Display employees and their salaries using a LEFT JOIN, showing NULL for any employee without a salary record."
                    ]
                }
            ],
            "tasks": [
                {"name": "Empty Departments", "desc": "Find all departments that have NO employees assigned."}
            ],
            "interviews": [
                "Explain the difference between INNER JOIN and LEFT JOIN with a simple SQL example."
            ]
        },
        # Day 11
        {
            "day": 11,
            "title": "SELF JOIN & Multi-Table Queries",
            "db": "company.db",
            "emoji": "👥",
            "objective": "Join a table to itself to query hierarchical structures and write complex multi-table queries.",
            "sections": [
                {
                    "num": 1,
                    "title": "Self Joins",
                    "subtitle": "Hierarchies and Self Referencing",
                    "theory": "A self join is a regular join, but the table is joined with itself. It is useful for querying hierarchical data (like employees and their managers). You must alias the table twice to distinguish them.",
                    "demo": "-- Find employees and their managers\nSELECT emp.name as employee, mgr.name as manager FROM employees emp LEFT JOIN employees mgr ON emp.manager_id = mgr.id;",
                    "cc": "Self Joins & Hierarchies",
                    "questions": [
                        "### **Q1.** Write a query to find all employees managed by 'Rajesh Sen'.",
                        "### **Q2.** Find employees who do NOT have any manager (top of the hierarchy).",
                        "### **Q3.** Write a SELF JOIN to find pairs of employees who work in the same department (excluding pairing an employee with themselves).",
                        "### **Q4.** Find employees whose manager works in a different department (dept_id differs).",
                        "### **Q5.** Find the names of managers who manage more than 2 employees."
                    ]
                }
            ],
            "tasks": [
                {"name": "Manager Names", "desc": "List every employee with their manager's name."}
            ],
            "interviews": [
                "Write a query to show employee name, department name, manager name, and project name in a single query."
            ]
        },
        # Day 12
        {
            "day": 12,
            "title": "Subqueries",
            "db": "ecommerce.db",
            "emoji": "🧠",
            "objective": "Embed queries inside SELECT, WHERE, or FROM clauses to perform multi-stage lookups.",
            "sections": [
                {
                    "num": 1,
                    "title": "Subqueries",
                    "subtitle": "Queries within Queries",
                    "theory": "A subquery is a query nested inside another query. Scalar subqueries return a single value. Subqueries can also return a list of values for use with `IN` or `EXISTS`. Correlated subqueries reference columns in the outer query.",
                    "demo": "-- Find products with price above average product cost\nSELECT name, cost_price FROM products WHERE cost_price > (SELECT AVG(cost_price) FROM products);",
                    "cc": "Subqueries",
                    "questions": [
                        "### **Q1.** Find customers who signed up after 'Sneha Patel' signed up.",
                        "### **Q2.** Find products in the `products` table that have never been ordered using `NOT IN` or `NOT EXISTS`.",
                        "### **Q3.** Get the names of customers who have placed at least one order.",
                        "### **Q4.** Get the maximum order quantity of any product in a single order item.",
                        "### **Q5.** Find all order IDs that contain the product 'MacBook Pro'."
                    ]
                }
            ],
            "tasks": [
                {"name": "Above Average Spend", "desc": "Find customers who ordered more than the average order value."}
            ],
            "interviews": [
                "Explain when you would use a subquery instead of a JOIN, and the performance differences."
            ]
        },
        # Day 13
        {
            "day": 13,
            "title": "CTEs (Common Table Expressions)",
            "db": "ecommerce.db",
            "emoji": "🏗️",
            "objective": "Define temporary result sets using WITH to write cleaner, modular, and readable queries.",
            "sections": [
                {
                    "num": 1,
                    "title": "CTEs",
                    "subtitle": "Modular SQL with WITH",
                    "theory": "A Common Table Expression (CTE) is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. CTEs act like virtual tables that exist only during query execution, greatly improving query readability.",
                    "demo": "-- Use a CTE to calculate total sales by product and filter high values\nWITH ProductRevenue AS (\n    SELECT product_id, SUM(qty * unit_price) as revenue\n    FROM order_items\n    GROUP BY product_id\n)\nSELECT p.name, pr.revenue\nFROM ProductRevenue pr\nJOIN products p ON pr.product_id = p.id\nWHERE pr.revenue > 10000;",
                    "cc": "Common Table Expressions",
                    "questions": [
                        "### **Q1.** Write a CTE named `CustomerOrders` that counts orders per customer, then select all columns from it.",
                        "### **Q2.** Use a CTE to calculate the average price of products ordered in each category, then join it to `categories`.",
                        "### **Q3.** Write a query with two chained CTEs: one calculating product costs, and the second ranking them.",
                        "### **Q4.** Rewrite a subquery that retrieves products costing more than average cost using a CTE instead.",
                        "### **Q5.** Use a CTE to find customers with more than 2 orders."
                    ]
                }
            ],
            "tasks": [
                {"name": "Category Ranks", "desc": "Use a CTE to calculate total revenue for each product, then join with products to display product name and revenue."}
            ],
            "interviews": [
                "What is a CTE, and why is it preferred over nested subqueries for complex reports?"
            ]
        },
        # Day 14
        {
            "day": 14,
            "title": "Window Functions Part 1 (Ranking)",
            "db": "ecommerce.db",
            "emoji": "🔢",
            "objective": "Perform calculations across a set of table rows related to the current row, and assign ranks.",
            "sections": [
                {
                    "num": 1,
                    "title": "Ranking Window Functions",
                    "subtitle": "OVER, PARTITION BY, ROW_NUMBER, RANK, DENSE_RANK",
                    "theory": "Window functions perform calculations across a partition of rows. Unlike GROUP BY, they do not collapse rows. `ROW_NUMBER()` assigns sequential numbers. `RANK()` leaves gaps on ties, whereas `DENSE_RANK()` does not.",
                    "demo": "-- Rank products by cost price within categories\nSELECT name, category_id, cost_price, DENSE_RANK() OVER(PARTITION BY category_id ORDER BY cost_price DESC) as price_rank FROM products;",
                    "cc": "Ranking Window Functions",
                    "questions": [
                        "### **Q1.** Assign a sequential row number to all customers ordered by their `signup_date`.",
                        "### **Q2.** Rank products globally by `cost_price` descending using `RANK()` and `DENSE_RANK()`.",
                        "### **Q3.** Partition customers by `region` and rank them by `signup_date` ascending.",
                        "### **Q4.** Write a query using `NTILE(4)` to divide products into 4 price quartiles.",
                        "### **Q5.** Use `ROW_NUMBER()` inside a subquery or CTE to find the oldest customer in each region."
                    ]
                }
            ],
            "tasks": [
                {"name": "Spend Rankings", "desc": "Rank customers by total order spend within each region."}
            ],
            "interviews": [
                "Explain the exact difference between ROW_NUMBER(), RANK(), and DENSE_RANK() with respect to duplicate values."
            ]
        },
        # Day 15
        {
            "day": 15,
            "title": "Window Functions Part 2 (Analytic)",
            "db": "ecommerce.db",
            "emoji": "📈",
            "objective": "Compute running aggregates, moving averages, and offset values (LAG/LEAD) for trend analysis.",
            "sections": [
                {
                    "num": 1,
                    "title": "Analytic Window Functions",
                    "subtitle": "LAG, LEAD, Running Totals",
                    "theory": "Analytic window functions allow referencing values from surrounding rows. `LAG()` reads a previous row's value, and `LEAD()` reads a next row's value. Running aggregates are created by adding an `ORDER BY` clause inside `OVER()`.",
                    "demo": "-- Running total of order items quantity ordered by id\nSELECT id, order_id, qty, SUM(qty) OVER (ORDER BY id) as running_qty FROM order_items;",
                    "cc": "Analytic Window Functions",
                    "questions": [
                        "### **Q1.** Use `LAG()` to show the signup date of the previous customer registered on the system.",
                        "### **Q2.** Use `LEAD()` to show the signup date of the next customer registered on the system.",
                        "### **Q3.** Calculate a running sum of order revenue grouped by customer, ordered by order date.",
                        "### **Q4.** Use `FIRST_VALUE()` to display the first product ordered by each customer.",
                        "### **Q5.** Calculate a 3-period moving average of product costs using `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`."
                    ]
                }
            ],
            "tasks": [
                {"name": "Growth Analysis", "desc": "Calculate the difference in cost price between each product and the next most expensive product using LEAD."}
            ],
            "interviews": [
                "How do you calculate a month-over-month growth metric in SQL? Outline the required query structure."
            ]
        },
        # Day 16
        {
            "day": 16,
            "title": "String Functions",
            "db": "ecommerce.db",
            "emoji": "🧹",
            "objective": "Clean and format text data using upper/lower casing, trimming, replacing, and substring extraction.",
            "sections": [
                {
                    "num": 1,
                    "title": "SQL String Functions",
                    "subtitle": "Trimming, Replacing, Substrings",
                    "theory": "SQL includes built-in functions to manipulate text. Common functions include `UPPER()`, `LOWER()`, `TRIM()` (removes leading/trailing spaces), `REPLACE(str, old, new)`, and `SUBSTR(str, start, length)` to extract text parts.",
                    "demo": "-- Trim names and normalize emails\nSELECT TRIM(name) as clean_name, LOWER(email) as clean_email FROM customers;",
                    "cc": "String Functions",
                    "questions": [
                        "### **Q1.** Convert customer names to uppercase and emails to lowercase.",
                        "### **Q2.** Trim extra spaces from customer names and replace the domain '@gmail.com' with '@googlemail.com'.",
                        "### **Q3.** Extract the first 3 characters of each customer's region using `SUBSTR`.",
                        "### **Q4.** Find the character position of '@' in each customer's email using `INSTR`.",
                        "### **Q5.** Find the length (number of characters) of customer emails."
                    ]
                }
            ],
            "tasks": [
                {"name": "Standardize Names", "desc": "Standardize the customer names column to remove spaces and convert to uppercase."}
            ],
            "interviews": [
                "Write a query to extract the username part of an email address (everything before the '@' symbol)."
            ]
        },
        # Day 17
        {
            "day": 17,
            "title": "Date & Time Functions",
            "db": "ecommerce.db",
            "emoji": "📅",
            "objective": "Extract parts of date values, perform date arithmetic, and filter transactions by date intervals.",
            "sections": [
                {
                    "num": 1,
                    "title": "Dates & Times",
                    "subtitle": "Formatting and Intervals",
                    "theory": "SQLite stores dates as TEXT (ISO 8601), REAL, or INTEGER. Use `STRFTIME(format, date)` to format and extract parts: `%Y` (year), `%m` (month), `%d` (day), `%w` (day of week: 0=Sunday). Date difference is computed using `JULIANDAY`.",
                    "demo": "-- Extract year and month from order dates\nSELECT id, order_date, STRFTIME('%Y', order_date) as year, STRFTIME('%m', order_date) as month FROM orders;",
                    "cc": "Date & Time Functions",
                    "questions": [
                        "### **Q1.** Find all orders placed in the year 2022.",
                        "### **Q2.** Find all orders placed in the month of October.",
                        "### **Q3.** Find orders placed on weekends (STRFTIME '%w' is '0' or '6').",
                        "### **Q4.** Calculate the number of days between customer signup date and their first order date.",
                        "### **Q5.** List all customers who signed up in Q4 of 2022 (Oct, Nov, Dec)."
                    ]
                }
            ],
            "tasks": [
                {"name": "Q4 Weekends", "desc": "Find all orders placed on weekends in Q4 of 2022."}
            ],
            "interviews": [
                "How does SQLite store date and time fields? What are the implications for comparing dates?"
            ]
        },
        # Day 18
        {
            "day": 18,
            "title": "UNION, INTERSECT & EXCEPT (SET Operations)",
            "db": "ecommerce.db",
            "emoji": "🥞",
            "objective": "Combine, intersect, or subtract result sets from different queries using SET operators.",
            "sections": [
                {
                    "num": 1,
                    "title": "Set Operations",
                    "subtitle": "UNION, INTERSECT, EXCEPT",
                    "theory": "Set operators combine results from multiple queries. `UNION` merges results and removes duplicates. `UNION ALL` merges results keeping duplicates. `INTERSECT` finds common rows. `EXCEPT` finds rows in the first query not in the second. Column counts and types must match.",
                    "demo": "-- Combine customer regions and product categories (illustrative set logic)\nSELECT region as label FROM customers\nUNION\nSELECT name as label FROM categories;",
                    "cc": "Set Operations",
                    "questions": [
                        "### **Q1.** Get a unique list of all customer names and employee names (cross-database conceptually, but here combine customer names and product names for syntax practice).",
                        "### **Q2.** Find customer IDs who ordered both in October and in December using `INTERSECT`.",
                        "### **Q3.** List all customers who registered on the system but have placed NO orders using `EXCEPT`.",
                        "### **Q4.** Combine order items with product cost price and sale price, maintaining duplicates via `UNION ALL`.",
                        "### **Q5.** Find customer IDs who ordered in 2022 but did not order in 2023."
                    ]
                }
            ],
            "tasks": [
                {"name": "Customer Activity Sets", "desc": "Find customer IDs who signed up in 2022 and ordered in 2022."}
            ],
            "interviews": [
                "Explain the exact difference between UNION and UNION ALL. Which is faster and why?"
            ]
        },
        # Day 19
        {
            "day": 19,
            "title": "Query Optimization & Best Practices",
            "db": "ecommerce.db",
            "emoji": "⚡",
            "objective": "Read execution plans, identify bottlenecks, avoid full table scans, and optimize query structure.",
            "sections": [
                {
                    "num": 1,
                    "title": "SQL Optimization",
                    "subtitle": "Explain Plan and Indexes",
                    "theory": "Optimization involves writing queries that run quickly. Use `EXPLAIN QUERY PLAN` in SQLite to see if the engine uses indexes or does full table scans. Best practices: avoid `SELECT *`, filter early with WHERE, index foreign keys, and write readable formatted SQL.",
                    "demo": "-- Explain query plan for customer lookup\nEXPLAIN QUERY PLAN SELECT * FROM customers WHERE id = 3;",
                    "cc": "Optimization Basics",
                    "questions": [
                        "### **Q1.** Run an `EXPLAIN QUERY PLAN` on a query that joins `orders` and `customers`.",
                        "### **Q2.** Run `EXPLAIN QUERY PLAN` on a query searching customer names by a LIKE pattern (`customer_name LIKE '%Sharma%')`.",
                        "### **Q3.** Rewrite a query containing `SELECT *` to retrieve only required columns.",
                        "### **Q4.** Explain what indexing does and when it can slow down operations.",
                        "### **Q5.** Identify why filtering on a function (e.g. `WHERE UPPER(name) = 'AMIT'`) might bypass standard indexes."
                    ]
                }
            ],
            "tasks": [
                {"name": "Read Plans", "desc": "Run EXPLAIN QUERY PLAN on a query that calculates the total spend per customer."}
            ],
            "interviews": [
                "What is a full table scan? How do you avoid it in a production database?"
            ]
        },
        # Day 20
        {
            "day": 20,
            "title": "SQL Capstone Project",
            "db": "capstone_retail.db",
            "emoji": "🏆",
            "objective": "Build a comprehensive Business Intelligence report from an extended relational schema, answering core business questions.",
            "sections": [
                {
                    "num": 1,
                    "title": "Capstone Overview",
                    "subtitle": "Retail Business Intelligence",
                    "theory": "In this final capstone, you will run complex multi-table joins, subqueries, CTEs, date functions, and window functions on the `capstone_retail.db` to extract critical business KPIs.",
                    "demo": "-- View count of sales, orders, and total revenue in capstone db\nSELECT COUNT(*) as total_sales, SUM(amount) as total_rev FROM sales;",
                    "cc": "Capstone Questions",
                    "questions": [
                        "### **Q1. Monthly Trend:** Calculate total revenue and order count by month (using `sale_date`).",
                        "### **Q2. Top Products:** Find the top 10 products by revenue, displaying product name and category.",
                        "### **Q3. Repeat Buyers:** Count customer segmentation: how many customers placed 1 order vs repeat buyers (2+ orders)?",
                        "### **Q4. Regional Performance:** List revenue, average order value, and count of sales reps in each region.",
                        "### **Q5. Return Rates:** Calculate the return rate (orders returned / total orders) for each product category.",
                        "### **Q6. Sales Rep Ranks:** Rank sales reps by revenue generated within their assigned region using window functions.",
                        "### **Q7. Cohort Analysis:** Group customers by signup month and find their Lifetime Value (LTV).",
                        "### **Q8. Day-of-Week:** Find which day of the week (Sunday-Saturday) generates the highest average sale amount."
                    ]
                }
            ],
            "tasks": [
                {"name": "Final Query", "desc": "Write a query to retrieve the overall return percentage of the retail business."}
            ],
            "interviews": [
                "Walk through how you structured your queries in the SQL Capstone to handle date parsing and window ranking."
            ]
        }
    ]
    
    for item in curriculum:
        day_num = item['day']
        formatted_day = f"Day{day_num:02d}"
        filename = f"{formatted_day}_SQL_Blank.ipynb"
        
        # Build cells list
        cells = []
        
        # Cell 0: Objective
        cells.append({
            "cell_type": "markdown",
            "metadata": {},
            "source": [
                "---\n",
                f"## 🎯 Enterprise Objective: {item['title']}\n",
                f"{item['objective']}\n\n",
                f"### 📋 Database Source: `{item['db']}`\n\n",
                "Every cell in this notebook runs against this database on the server.\n"
            ]
        })
        
        # Sections
        for sec in item['sections']:
            # Header + theory
            theory_md = (
                f"<h2 style=\"color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;\">\n"
                f"    <b>{sec['num']}. {sec['title']} : <span style=\"color: #070707ff; font-size: 0.85em; font-weight: normal;\">{sec['subtitle']}</span></b>\n"
                f"</h2>\n\n"
                f"<div style=\"border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;\">\n"
                f"    <b>🔍 Concept</b><br>\n"
                f"    {sec['theory']}\n"
                f"</div>"
            )
            cells.append({
                "cell_type": "markdown",
                "metadata": {},
                "source": [theory_md]
            })
            
            # Demo code cell
            cells.append({
                "cell_type": "code",
                "metadata": {},
                "source": [sec['demo']],
                "outputs": [],
                "execution_count": None
            })
            
            # Concept check header
            cc_hdr = (
                f"<h3 style=\"color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);\">\n"
                f"    <b>🧪 Concept Checks: <code>{sec['cc']}</code></b>\n"
                f"</h3>"
            )
            cells.append({
                "cell_type": "markdown",
                "metadata": {},
                "source": [cc_hdr]
            })
            
            # Questions and code boxes
            for q in sec['questions']:
                cells.append({
                    "cell_type": "markdown",
                    "metadata": {},
                    "source": [q]
                })
                cells.append({
                    "cell_type": "code",
                    "metadata": {},
                    "source": ["-- Write your SQL query here\n"],
                    "outputs": [],
                    "execution_count": None
                })
                
        # Practice tasks
        cells.append({
            "cell_type": "markdown",
            "metadata": {},
            "source": [
                "---\n",
                "# 🛠️ Professional Practice Tasks\n",
                "Write SQL queries to solve the following tasks.\n"
            ]
        })
        for i, task in enumerate(item['tasks'], 1):
            cells.append({
                "cell_type": "markdown",
                "metadata": {},
                "source": [f"### **Task {i} ({task['name']}):** {task['desc']}\n"]
            })
            cells.append({
                "cell_type": "code",
                "metadata": {},
                "source": ["-- Write your SQL query here\n"],
                "outputs": [],
                "execution_count": None
            })
            
        # Interview Questions
        cells.append({
            "cell_type": "markdown",
            "metadata": {},
            "source": [
                "---\n",
                "# 💻 Pure Coding Interview Questions\n"
            ]
        })
        for i, q in enumerate(item['interviews'], 1):
            cells.append({
                "cell_type": "markdown",
                "metadata": {},
                "source": [f"---\n## Q{i}.\n### {q}\n"]
            })
            cells.append({
                "cell_type": "code",
                "metadata": {},
                "source": ["-- Write your SQL query here\n"],
                "outputs": [],
                "execution_count": None
            })
            
        # Final Summary
        cells.append({
            "cell_type": "markdown",
            "metadata": {},
            "source": [
                "---\n",
                f"# 📊 Day {day_num} Executive Summary\n\n",
                f"You have mastered Day {day_num} concepts. Complete all checks, tasks, and interview questions to verify your database skills.\n",
                f"\n",
                f"**Next Up: SQL Day {day_num + 1 if day_num < 20 else 'Complete'}**\n"
            ]
        })
        
        # Build full JSON notebook structure
        notebook_data = {
            "nbformat": 4,
            "nbformat_minor": 5,
            "metadata": {
                "kernelspec": {
                    "display_name": "SQL",
                    "language": "sql",
                    "name": "sql"
                },
                "language_info": {
                    "name": "sql"
                },
                "database": item['db']
            },
            "cells": cells
        }
        
        # Save to notebooks/sql/
        filepath = os.path.join('notebooks/sql', filename)
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(notebook_data, f, indent=1, ensure_ascii=False)
            
        print(f"Generated {filepath} successfully with {len(cells)} cells.")

if __name__ == '__main__':
    generate_notebooks()
