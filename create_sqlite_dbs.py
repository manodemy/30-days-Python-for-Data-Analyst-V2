import os
import sqlite3
from datetime import datetime, timedelta
import random

def create_dbs():
    os.makedirs('public/sql-data', exist_ok=True)
    
    # ----------------------------------------------------
    # 1. retail.db
    # ----------------------------------------------------
    print("Creating retail.db...")
    conn = sqlite3.connect('public/sql-data/retail.db')
    cursor = conn.cursor()
    
    # Table sales
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS sales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        product TEXT NOT NULL,
        category TEXT NOT NULL,
        region TEXT NOT NULL,
        amount REAL NOT NULL,
        sale_date DATE NOT NULL,
        customer_id INTEGER NOT NULL,
        customer_name TEXT,
        customer_email TEXT
    )
    """)
    
    # Table products
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS products (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        category TEXT NOT NULL,
        unit_price REAL NOT NULL,
        stock_qty INTEGER NOT NULL
    )
    """)
    
    # Table regions
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS regions (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        zone TEXT NOT NULL,
        manager TEXT NOT NULL
    )
    """)
    
    # Populate regions
    regions_data = [
        (1, 'North', 'Zone-A', 'Rajesh Sharma'),
        (2, 'South', 'Zone-B', 'Priya Nair'),
        (3, 'East', 'Zone-C', 'Amit Das'),
        (4, 'West', 'Zone-D', 'Sneha Patel')
    ]
    cursor.executemany("INSERT OR REPLACE INTO regions VALUES (?, ?, ?, ?)", regions_data)
    
    # Populate products
    products_data = [
        (101, 'Python Course Book', 'Books', 1500.0, 150),
        (102, 'Data Science Bundle', 'Books', 4500.0, 80),
        (103, 'Mechanical Keyboard', 'Electronics', 6000.0, 40),
        (104, 'Noise Cancelling Headphones', 'Electronics', 12000.0, 30),
        (105, 'Ergonomic Desk Chair', 'Home', 15000.0, 15),
        (106, 'LED Monitor 24"', 'Electronics', 11000.0, 25),
        (107, 'Coffee Mug', 'Home', 500.0, 200),
        (108, 'Notebook Pack of 3', 'Books', 300.0, 300),
        (109, 'Wireless Mouse', 'Electronics', 1800.0, 100),
        (110, 'Standing Desk Converter', 'Home', 18000.0, 10)
    ]
    cursor.executemany("INSERT OR REPLACE INTO products VALUES (?, ?, ?, ?, ?)", products_data)
    
    # Generate Sales
    random.seed(42)
    categories = ['Books', 'Electronics', 'Home']
    prod_names = {
        'Books': ['Python Course Book', 'Data Science Bundle', 'Notebook Pack of 3'],
        'Electronics': ['Mechanical Keyboard', 'Noise Cancelling Headphones', 'LED Monitor 24"', 'Wireless Mouse'],
        'Home': ['Ergonomic Desk Chair', 'Coffee Mug', 'Standing Desk Converter']
    }
    prod_prices = {
        'Python Course Book': 1500.0, 'Data Science Bundle': 4500.0, 'Notebook Pack of 3': 300.0,
        'Mechanical Keyboard': 6000.0, 'Noise Cancelling Headphones': 12000.0, 'LED Monitor 24"': 11000.0, 'Wireless Mouse': 1800.0,
        'Ergonomic Desk Chair': 15000.0, 'Coffee Mug': 500.0, 'Standing Desk Converter': 18000.0
    }
    regions_list = ['North', 'South', 'East', 'West']
    
    customer_names = [
        'Amit Sharma', 'Anjali Gupta', 'Abhishek Kumar', 'Aishwarya Sen', 'Anoop Mishra',
        'Bhavna Patel', 'Chirag Reddy', 'Deepak Verma', 'Divya Teja', 'Eshwar Rao',
        'Gaurav Joshi', 'Harini Murthy', 'Ishaan Iyer', 'Jyoti Singh', 'Karthik Raja'
    ]
    
    sales_data = []
    # Ensure some sales matching Day 2 challenge: "sales over 5000 in North region"
    # Ensure some sales matching Day 3 challenge: "customer names start with A or NULL email"
    for i in range(1, 151):
        cat = random.choice(categories)
        prod = random.choice(prod_names[cat])
        price = prod_prices[prod]
        qty = random.randint(1, 3)
        amount = price * qty
        region = random.choice(regions_list)
        
        # force some high values in North
        if i % 7 == 0:
            region = 'North'
            amount = 6500.0
        
        cust_id = random.randint(1, len(customer_names))
        cust_name = customer_names[cust_id - 1]
        
        # Null email or messy names for Day 3 / Day 16
        cust_email = f"{cust_name.lower().replace(' ', '.')}@example.com"
        if cust_id % 4 == 0:
            cust_email = None # NULL email
            
        # Day 3 name starts with 'A'
        if i % 10 == 0:
            cust_name = "A" + cust_name[1:]
            
        sale_date = (datetime(2023, 1, 1) + timedelta(days=random.randint(0, 360))).strftime('%Y-%m-%d')
        sales_data.append((i, prod, cat, region, amount, sale_date, cust_id, cust_name, cust_email))
        
    cursor.executemany("INSERT OR REPLACE INTO sales VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", sales_data)
    conn.commit()
    conn.close()
    
    # ----------------------------------------------------
    # 2. company.db
    # ----------------------------------------------------
    print("Creating company.db...")
    conn = sqlite3.connect('public/sql-data/company.db')
    cursor = conn.cursor()
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS departments (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        budget REAL NOT NULL
    )
    """)
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS employees (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        dept_id INTEGER,
        manager_id INTEGER,
        hire_date DATE NOT NULL,
        FOREIGN KEY (dept_id) REFERENCES departments(id)
    )
    """)
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS salaries (
        emp_id INTEGER,
        amount REAL NOT NULL,
        effective_date DATE NOT NULL,
        PRIMARY KEY (emp_id, effective_date),
        FOREIGN KEY (emp_id) REFERENCES employees(id)
    )
    """)
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS projects (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        status TEXT NOT NULL,
        deadline DATE NOT NULL
    )
    """)
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS emp_projects (
        emp_id INTEGER,
        project_id INTEGER,
        role TEXT NOT NULL,
        PRIMARY KEY (emp_id, project_id),
        FOREIGN KEY (emp_id) REFERENCES employees(id),
        FOREIGN KEY (project_id) REFERENCES projects(id)
    )
    """)
    
    # Seed departments (keep one department without employees for Day 10 Challenge)
    depts = [
        (10, 'Engineering', 5000000.0),
        (20, 'Data Science', 3500000.0),
        (30, 'Marketing', 1500000.0),
        (40, 'Sales', 2000000.0),
        (50, 'Human Resources', 800000.0),
        (60, 'Operations & Logistics', 1200000.0) # Unassigned department
    ]
    cursor.executemany("INSERT OR REPLACE INTO departments VALUES (?, ?, ?)", depts)
    
    # Seed employees (hierarchy: Rajesh(1) is manager of Amit(2) and Priya(3). Priya is manager of Sneha(4) and Rahul(5). HR has no manager)
    emps = [
        (1, 'Rajesh Sen', 10, None, '2019-01-15'),
        (2, 'Amit Kumar', 10, 1, '2020-03-10'),
        (3, 'Priya Nair', 20, 1, '2020-06-01'),
        (4, 'Sneha Patel', 20, 3, '2021-02-15'),
        (5, 'Rahul Sharma', 20, 3, '2021-08-20'),
        (6, 'Vikram Malhotra', 30, 1, '2021-11-05'),
        (7, 'Ananya Gupta', 40, 2, '2022-01-10'),
        (8, 'Karan Johar', 50, None, '2022-05-15')
    ]
    cursor.executemany("INSERT OR REPLACE INTO employees VALUES (?, ?, ?, ?, ?)", emps)
    
    # Seed salaries
    sals = [
        (1, 150000.0, '2019-01-15'),
        (1, 160000.0, '2021-01-15'),
        (2, 90000.0, '2020-03-10'),
        (2, 95000.0, '2022-03-10'),
        (3, 110000.0, '2020-06-01'),
        (3, 120000.0, '2022-06-01'),
        (4, 80000.0, '2021-02-15'),
        (5, 75000.0, '2021-08-20'),
        (6, 70000.0, '2021-11-05'),
        (7, 65000.0, '2022-01-10'),
        (8, 55000.0, '2022-05-15')
    ]
    cursor.executemany("INSERT OR REPLACE INTO salaries VALUES (?, ?, ?)", sals)
    
    # Seed projects
    projs = [
        (101, 'Alpha Analytics', 'In Progress', '2023-12-31'),
        (102, 'Beta Cloud migration', 'Completed', '2023-06-30'),
        (103, 'Gamma Brand Refresh', 'In Progress', '2024-03-15')
    ]
    cursor.executemany("INSERT OR REPLACE INTO projects VALUES (?, ?, ?, ?)", projs)
    
    # Seed emp_projects
    emp_projs = [
        (2, 101, 'Lead Developer'),
        (3, 101, 'Data Architect'),
        (4, 101, 'Data Analyst'),
        (2, 102, 'Cloud Specialist'),
        (6, 103, 'Marketing Lead')
    ]
    cursor.executemany("INSERT OR REPLACE INTO emp_projects VALUES (?, ?, ?)", emp_projs)
    
    conn.commit()
    conn.close()
    
    # ----------------------------------------------------
    # 3. ecommerce.db
    # ----------------------------------------------------
    print("Creating ecommerce.db...")
    conn = sqlite3.connect('public/sql-data/ecommerce.db')
    cursor = conn.cursor()
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS categories (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        parent_id INTEGER
    )
    """)
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS products (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        category_id INTEGER,
        cost_price REAL NOT NULL,
        FOREIGN KEY (category_id) REFERENCES categories(id)
    )
    """)
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS customers (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        signup_date DATE NOT NULL,
        region TEXT NOT NULL
    )
    """)
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS orders (
        id INTEGER PRIMARY KEY,
        customer_id INTEGER,
        order_date DATE NOT NULL,
        status TEXT NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES customers(id)
    )
    """)
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS order_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        order_id INTEGER,
        product_id INTEGER,
        qty INTEGER NOT NULL,
        unit_price REAL NOT NULL,
        FOREIGN KEY (order_id) REFERENCES orders(id),
        FOREIGN KEY (product_id) REFERENCES products(id)
    )
    """)
    
    # Seed categories
    cats = [
        (1, 'Electronics', None),
        (2, 'Computers', 1),
        (3, 'Accessories', 1),
        (4, 'Books', None),
        (5, 'Tech Books', 4),
        (6, 'Home & Living', None)
    ]
    cursor.executemany("INSERT OR REPLACE INTO categories VALUES (?, ?, ?)", cats)
    
    # Seed products
    prods = [
        (201, 'MacBook Pro', 2, 120000.0),
        (202, 'iPad Air', 2, 50000.0),
        (203, 'Wireless Mouse', 3, 2000.0),
        (204, 'USB-C Cable', 3, 1000.0),
        (205, 'SQL Queries in 10 Minutes', 5, 800.0),
        (206, 'Python Data Science Handbook', 5, 2500.0),
        (207, 'Ergonomic Chair', 6, 15000.0)
    ]
    cursor.executemany("INSERT OR REPLACE INTO products VALUES (?, ?, ?, ?)", prods)
    
    # Seed customers (include messy names for Day 16 standardizing challenge)
    custs = [
        (1, '  amit SHARMA ', 'amit@gmail.com', '2022-01-15', 'North'),
        (2, 'priya Nair  ', 'priya@yahoo.com', '2022-03-22', 'South'),
        (3, '  Karthik Raja', 'karthik@outlook.com', '2022-06-18', 'South'),
        (4, ' rahul   SHARMA', 'rahul@gmail.com', '2022-08-05', 'North'),
        (5, 'Sneha Patel', 'sneha@example.com', '2022-10-12', 'West'),
        (6, 'Anoop M.', 'anoop@example.com', '2023-01-20', 'East')
    ]
    cursor.executemany("INSERT OR REPLACE INTO customers VALUES (?, ?, ?, ?, ?)", custs)
    
    # Seed orders & items
    # Need Q4 weekend orders (Day 17 challenge: Q4 is Oct, Nov, Dec. Weekend is Saturday=6, Sunday=0 in sqlite STRFTIME or %w)
    # Weekend dates in Q4 2022: Oct 1 (Sat), Oct 2 (Sun), Oct 8 (Sat), Oct 9 (Sun), Dec 25 (Sun) etc.
    ords = [
        (1001, 1, '2022-05-15', 'Shipped'), # Sunday
        (1002, 2, '2022-08-04', 'Shipped'), # Thursday
        (1003, 3, '2022-10-01', 'Shipped'), # Saturday (Q4 Weekend)
        (1004, 4, '2022-10-02', 'Shipped'), # Sunday (Q4 Weekend)
        (1005, 5, '2022-11-15', 'Shipped'), # Tuesday
        (1006, 1, '2022-12-25', 'Shipped'), # Sunday (Q4 Weekend)
        (1007, 2, '2023-01-05', 'Processing'),
        (1008, 6, '2023-02-14', 'Shipped')
    ]
    cursor.executemany("INSERT OR REPLACE INTO orders VALUES (?, ?, ?, ?)", ords)
    
    ord_items = [
        (1, 1001, 202, 1, 50000.0),
        (2, 1001, 203, 1, 2000.0),
        (3, 1002, 205, 2, 800.0),
        (4, 1003, 201, 1, 120000.0),
        (5, 1004, 206, 1, 2500.0),
        (6, 1004, 204, 2, 1000.0),
        (7, 1005, 207, 1, 15000.0),
        (8, 1006, 201, 1, 120000.0),
        (9, 1006, 204, 1, 1000.0),
        (10, 1007, 203, 2, 2000.0),
        (11, 1008, 206, 1, 2500.0)
    ]
    cursor.executemany("INSERT OR REPLACE INTO order_items VALUES (?, ?, ?, ?, ?)", ord_items)
    
    conn.commit()
    conn.close()
    
    # ----------------------------------------------------
    # 4. capstone_retail.db
    # ----------------------------------------------------
    print("Creating capstone_retail.db...")
    conn = sqlite3.connect('public/sql-data/capstone_retail.db')
    cursor = conn.cursor()
    
    # Copy all retail.db tables
    conn_src = sqlite3.connect('public/sql-data/retail.db')
    src_cursor = conn_src.cursor()
    
    # Create products & regions
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS products (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        category TEXT NOT NULL,
        unit_price REAL NOT NULL,
        stock_qty INTEGER NOT NULL
    )
    """)
    src_cursor.execute("SELECT * FROM products")
    cursor.executemany("INSERT OR REPLACE INTO products VALUES (?, ?, ?, ?, ?)", src_cursor.fetchall())
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS regions (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        zone TEXT NOT NULL,
        manager TEXT NOT NULL
    )
    """)
    src_cursor.execute("SELECT * FROM regions")
    cursor.executemany("INSERT OR REPLACE INTO regions VALUES (?, ?, ?, ?)", src_cursor.fetchall())
    conn_src.close()
    
    # Create sales reps
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS sales_reps (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        region_id INTEGER,
        FOREIGN KEY (region_id) REFERENCES regions(id)
    )
    """)
    reps = [
        (1, 'Rohan Mehta', 1),
        (2, 'Aditi Rao', 2),
        (3, 'Siddharth Sen', 3),
        (4, 'Neha Sharma', 4)
    ]
    cursor.executemany("INSERT OR REPLACE INTO sales_reps VALUES (?, ?, ?)", reps)
    
    # Create orders (with customer cohort signup months)
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS orders (
        id INTEGER PRIMARY KEY,
        customer_id INTEGER,
        order_date DATE NOT NULL,
        sales_rep_id INTEGER,
        FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(id)
    )
    """)
    
    # Create returns
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS returns (
        order_id INTEGER PRIMARY KEY,
        return_date DATE NOT NULL,
        reason TEXT NOT NULL,
        FOREIGN KEY (order_id) REFERENCES orders(id)
    )
    """)
    
    # Create sales (expanded for Capstone queries)
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS sales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        order_id INTEGER,
        product_id INTEGER,
        qty INTEGER NOT NULL,
        amount REAL NOT NULL,
        sale_date DATE NOT NULL,
        customer_id INTEGER NOT NULL,
        customer_signup_month TEXT NOT NULL,
        FOREIGN KEY (order_id) REFERENCES orders(id),
        FOREIGN KEY (product_id) REFERENCES products(id)
    )
    """)
    
    # Let's seed Capstone data that yields meaningful answers for all 8 queries
    # Seed 100 orders and their sales across 2023, representing different cohort months and regions.
    random.seed(88)
    
    orders_data = []
    sales_data = []
    returns_data = []
    
    # Customer signup cohorts (months from 2023-01 to 2023-06)
    cohorts = ['2023-01', '2023-02', '2023-03', '2023-04', '2023-05', '2023-06']
    customer_cohorts = {cid: random.choice(cohorts) for cid in range(1, 41)}
    
    products_list = [
        (101, 1500.0), (102, 4500.0), (103, 6000.0), (104, 12000.0), (105, 15000.0),
        (106, 11000.0), (107, 500.0), (108, 300.0), (109, 1800.0), (110, 18000.0)
    ]
    
    # Generate 150 orders
    start_date = datetime(2023, 1, 1)
    for oid in range(5001, 5151):
        cust_id = random.randint(1, 40)
        rep_id = random.randint(1, 4)
        
        # Order date spaced throughout 2023
        order_date_dt = start_date + timedelta(days=random.randint(0, 360))
        order_date = order_date_dt.strftime('%Y-%m-%d')
        
        orders_data.append((oid, cust_id, order_date, rep_id))
        
        # 1-3 items per order
        num_items = random.randint(1, 3)
        selected_prods = random.sample(products_list, num_items)
        for prod_id, price in selected_prods:
            qty = random.randint(1, 2)
            amount = qty * price
            signup_m = customer_cohorts[cust_id]
            sales_data.append((None, oid, prod_id, qty, amount, order_date, cust_id, signup_m))
            
        # 10% return rate
        if oid % 10 == 0:
            ret_date = (order_date_dt + timedelta(days=random.randint(2, 10))).strftime('%Y-%m-%d')
            reason = random.choice(['Defective', 'Wrong Item', 'Not as described', 'Changed Mind'])
            returns_data.append((oid, ret_date, reason))
            
    cursor.executemany("INSERT INTO orders VALUES (?, ?, ?, ?)", orders_data)
    cursor.executemany("INSERT INTO sales VALUES (?, ?, ?, ?, ?, ?, ?, ?)", sales_data)
    cursor.executemany("INSERT INTO returns VALUES (?, ?, ?)", returns_data)
    
    conn.commit()
    conn.close()
    print("All databases created and seeded successfully!")

if __name__ == '__main__':
    create_dbs()
