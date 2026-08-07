import os
import json

def generate_excel_notebooks():
    os.makedirs('notebooks/excel', exist_ok=True)
    
    curriculum = [
        # Day 01
        {
            "day": 1,
            "title": "Excel Orientation & Essential Formulas",
            "emoji": "📊",
            "objective": "Learn spreadsheet coordinate navigation, cell references, basic arithmetic operators, and essential function syntax.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Quantity)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Price)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">C (Tax)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="10" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">10</td>
        <td id="cell-B1" data-val="150" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">150</td>
        <td id="cell-C1" data-val="15" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">15</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="5" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">5</td>
        <td id="cell-B2" data-val="300" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">300</td>
        <td id="cell-C2" data-val="30" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">30</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">3</td>
        <td id="cell-A3" data-val="2" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">2</td>
        <td id="cell-B3" data-val="1200" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">1200</td>
        <td id="cell-C3" data-val="120" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">120</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Spreadsheet Coordinates",
                    "subtitle": "Columns, Rows and Operators",
                    "theory": "Excel stores data in columns (A, B, C...) and rows (1, 2, 3...). Every formula starts with an equals sign (=). You can perform standard calculations (+, -, *, /) and use ranges (A1:B3) inside functions.",
                    "demo": "=A1*B1+C1",
                    "cc": "Basic Formulas",
                    "questions": [
                        "### **Q1.** Calculate the product of A2 and B2.",
                        "### **Q2.** Sum the quantities in cells A1, A2, and A3 using basic addition (+).",
                        "### **Q3.** Subtract tax C1 from price B1.",
                        "### **Q4.** Divide price B2 by quantity A2.",
                        "### **Q5.** Calculate total price including tax for item 3 (A3 * B3 + C3)."
                    ]
                }
            ],
            "tasks": [
                {"name": "Aggregate Quantity", "desc": "Calculate the sum of all quantities from A1 to A3 using the SUM function."}
            ],
            "interviews": [
                "Write the formula to calculate the average price of items 1, 2, and 3 using the AVERAGE function."
            ]
        },
        # Day 02
        {
            "day": 2,
            "title": "Formatting, Sorting & Filtering",
            "emoji": "🎨",
            "objective": "Understand how formatting styles cells, and sort or filter a data grid by specific column constraints.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Product)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Rating)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">C (Price)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="Phone" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Phone</td>
        <td id="cell-B1" data-val="4.5" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">4.5</td>
        <td id="cell-C1" data-val="50000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">50000</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="Book" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Book</td>
        <td id="cell-B2" data-val="4.8" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">4.8</td>
        <td id="cell-C2" data-val="500" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">500</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">3</td>
        <td id="cell-A3" data-val="Laptop" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Laptop</td>
        <td id="cell-B3" data-val="4.2" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">4.2</td>
        <td id="cell-C3" data-val="80000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">80000</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Grid Sorting and Filtering",
                    "subtitle": "Formatting and Data Ordering",
                    "theory": "Excel grids can be dynamically filtered and sorted. Cells can store text or numbers. Standard formulas evaluate rows to help audit sorted data.",
                    "demo": "=SUM(C1:C3)",
                    "cc": "Basic Formulas",
                    "questions": [
                        "### **Q1.** Find the total price of all items in column C.",
                        "### **Q2.** Find the average rating of items in column B.",
                        "### **Q3.** Count the number of items listed in column A using the COUNT function on ratings in column B."
                    ]
                }
            ],
            "tasks": [
                {"name": "Total Rating", "desc": "Calculate the sum of all ratings from B1 to B3."}
            ],
            "interviews": [
                "Write a formula to calculate the average of the ratings in B1, B2, and B3."
            ]
        },
        # Day 03
        {
            "day": 3,
            "title": "Data Cleaning Essentials",
            "emoji": "🧹",
            "objective": "Clean trailing whitespace, adjust cases, and count non-empty values across columns.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Dirty Text)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Number)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="  Delhi" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">  Delhi</td>
        <td id="cell-B1" data-val="100" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">100</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="Mumbai " style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Mumbai </td>
        <td id="cell-B2" data-val="250" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">250</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Text Trimming",
                    "subtitle": "Formatting Cases and Cleaning Spacing",
                    "theory": "Use `UPPER(cell)` and `LOWER(cell)` to switch casing. Numbers can be aggregated with sum/average.",
                    "demo": "=UPPER(A1)",
                    "cc": "Basic Cleaning",
                    "questions": [
                        "### **Q1.** Convert text in A2 to lowercase.",
                        "### **Q2.** Convert text in A1 to uppercase.",
                        "### **Q3.** Find the total values in B1 and B2."
                    ]
                }
            ],
            "tasks": [
                {"name": "Total Values", "desc": "Calculate the sum of all numerical cell values from B1 to B2."}
            ],
            "interviews": [
                "Convert the text in A1 to lowercase."
            ]
        },
        # Day 04
        {
            "day": 4,
            "title": "Excel Tables",
            "emoji": "📋",
            "objective": "Work with formatted Excel grids, structured tables, and column ranges.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Base)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Bonus)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="5000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">5000</td>
        <td id="cell-B1" data-val="500" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">500</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="6000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">6000</td>
        <td id="cell-B2" data-val="800" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">800</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Structured Tables",
                    "subtitle": "Aggregations Over Ranges",
                    "theory": "Worksheets allow ranges representing rows. We can reference ranges like A1:B2.",
                    "demo": "=SUM(A1:B2)",
                    "cc": "Basic Formulas",
                    "questions": [
                        "### **Q1.** Calculate sum of A1 and B1.",
                        "### **Q2.** Calculate sum of A2 and B2.",
                        "### **Q3.** Calculate total base in range A1:A2."
                    ]
                }
            ],
            "tasks": [
                {"name": "Total Earnings", "desc": "Calculate total base plus bonus in range A1:B2."}
            ],
            "interviews": [
                "Calculate total bonus in range B1:B2."
            ]
        },
        # Day 05
        {
            "day": 5,
            "title": "Lookup & Reference Functions",
            "emoji": "🔍",
            "objective": "Perform vertical and horizontal index searching across tables.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Item ID)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Item Name)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="101" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">101</td>
        <td id="cell-B1" data-val="Tablet" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Tablet</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="102" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">102</td>
        <td id="cell-B2" data-val="Phone" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Phone</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Lookup References",
                    "subtitle": "Lookup and Matching Functions",
                    "theory": "Match references by evaluating criteria. Clean casing enables seamless string matching.",
                    "demo": "=UPPER(B1)",
                    "cc": "Reference Lookups",
                    "questions": [
                        "### **Q1.** Convert B2 item name to uppercase.",
                        "### **Q2.** Convert B1 item name to lowercase.",
                        "### **Q3.** Find sum of A1 and A2."
                    ]
                }
            ],
            "tasks": [
                {"name": "ID Casing", "desc": "Convert item name Tablet in B1 to uppercase."}
            ],
            "interviews": [
                "Convert item name Phone in B2 to uppercase."
            ]
        },
        # Day 06
        {
            "day": 6,
            "title": "Logic Functions",
            "emoji": "🔀",
            "objective": "Apply logical flow control statements such as IF, AND, and OR to spreadsheet computations.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Grade)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Attendance %)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="85" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">85</td>
        <td id="cell-B1" data-val="90" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">90</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="45" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">45</td>
        <td id="cell-B2" data-val="70" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">70</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Logical Formulas",
                    "subtitle": "IF, AND, OR Conditionals",
                    "theory": "The `IF(condition, trueVal, falseVal)` function lets you run conditional branches based on truth statements.",
                    "demo": "=IF(A1>=50,1,0)",
                    "cc": "Basic Logic",
                    "questions": [
                        "### **Q1.** Check if student 1 grade A1 is >= 50. Return 1 if true, else 0.",
                        "### **Q2.** Check if student 2 grade A2 is >= 50. Return 1 if true, else 0.",
                        "### **Q3.** Check if student 1 attendance B1 is >= 75. Return 1 if true, else 0."
                    ]
                }
            ],
            "tasks": [
                {"name": "Pass Check", "desc": "Check if student 2 grade in A2 is >= 50, returning 1 if true and 0 if false."}
            ],
            "interviews": [
                "Write an IF statement that checks if A1 is greater than or equal to 75, returning 1 if true and 0 if false."
            ]
        },
        # Day 07
        {
            "day": 7,
            "title": "Text Functions",
            "emoji": "📝",
            "objective": "Join strings and modify character cases dynamically using text operations.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (First Name)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Last Name)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="Rahul" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Rahul</td>
        <td id="cell-B1" data-val="Sharma" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Sharma</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="Amit" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Amit</td>
        <td id="cell-B2" data-val="Verma" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Verma</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "String Manipulation",
                    "subtitle": "Concatenation and Casing",
                    "theory": "The `CONCAT(a, b)` function joins two text values together.",
                    "demo": "=CONCAT(A1,B1)",
                    "cc": "Text Manipulation",
                    "questions": [
                        "### **Q1.** Join first and last name in row 2 using CONCAT.",
                        "### **Q2.** Convert first name in A1 to uppercase.",
                        "### **Q3.** Convert last name in B2 to lowercase."
                    ]
                }
            ],
            "tasks": [
                {"name": "Full Name", "desc": "Join Rahul and Sharma in row 1 using CONCAT."}
            ],
            "interviews": [
                "Convert the text in A2 to uppercase."
            ]
        },
        # Day 08
        {
            "day": 8,
            "title": "Date & Time Functions",
            "emoji": "📅",
            "objective": "Understand date formats and execute chronological comparisons across cells.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Start Days)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (End Days)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="10" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">10</td>
        <td id="cell-B1" data-val="35" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">35</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="20" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">20</td>
        <td id="cell-B2" data-val="60" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">60</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Numeric Operations on Dates",
                    "subtitle": "Date Differentials",
                    "theory": " spreadsheet days can be subtracted or added conceptually. Compute date ranges by calculating differences.",
                    "demo": "=B1-A1",
                    "cc": "Basic Calculations",
                    "questions": [
                        "### **Q1.** Calculate difference between B2 and A2.",
                        "### **Q2.** Find sum of start days A1 and A2.",
                        "### **Q3.** Find average of end days B1 and B2."
                    ]
                }
            ],
            "tasks": [
                {"name": "Date Difference", "desc": "Calculate B2 minus A2."}
            ],
            "interviews": [
                "Calculate B1 minus A1."
            ]
        },
        # Day 09
        {
            "day": 9,
            "title": "Conditional Aggregation",
            "emoji": "🧮",
            "objective": "Perform logical count, sum, and average aggregations depending on cell criteria.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Amount)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Status)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="1000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">1000</td>
        <td id="cell-B1" data-val="Paid" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Paid</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="2500" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">2500</td>
        <td id="cell-B2" data-val="Pending" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Pending</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">3</td>
        <td id="cell-A3" data-val="3000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">3000</td>
        <td id="cell-B3" data-val="Paid" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Paid</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Conditional aggregation",
                    "subtitle": "Conditional Summaries",
                    "theory": "Aggregate columns by specific criteria. String check allows filtering by categories.",
                    "demo": "=IF(B1=\"Paid\",A1,0)",
                    "cc": "Conditional Math",
                    "questions": [
                        "### **Q1.** Find the sum of all amounts in range A1:A3.",
                        "### **Q2.** Check if row 2 status B2 is Pending, returning A2 if true and 0 if false.",
                        "### **Q3.** Convert status B1 to uppercase."
                    ]
                }
            ],
            "tasks": [
                {"name": "Paid Amount Check", "desc": "Check if status B3 is Paid, returning amount A3 if true and 0 if false."}
            ],
            "interviews": [
                "Calculate total amount in range A1:A3."
            ]
        },
        # Day 10
        {
            "day": 10,
            "title": "PivotTables Core Mechanics",
            "emoji": "⚙️",
            "objective": "Understand how PivotTables cross-tabulate categories and build aggregate summaries.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Category)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Revenue)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="Hardware" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Hardware</td>
        <td id="cell-B1" data-val="15000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">15000</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="Software" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Software</td>
        <td id="cell-B2" data-val="25000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">25000</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Pivot Summarization",
                    "subtitle": "Cross Tabulations",
                    "theory": "PivotTables summarize categories. Formula cells allow auditing the values.",
                    "demo": "=SUM(B1:B2)",
                    "cc": "Basic Formulas",
                    "questions": [
                        "### **Q1.** Sum values in B1 and B2.",
                        "### **Q2.** Find the average of values in range B1:B2.",
                        "### **Q3.** Convert category in A1 to lowercase."
                    ]
                }
            ],
            "tasks": [
                {"name": "Total revenue", "desc": "Calculate sum of all revenues from B1 to B2."}
            ],
            "interviews": [
                "Calculate average revenue of values B1:B2."
            ]
        },
        # Day 11
        {
            "day": 11,
            "title": "PivotTables Advanced & Charts",
            "emoji": "📈",
            "objective": "Build dynamic metrics, slicers, and visualize data trends with pivot charts.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Project)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Hours)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="Alpha" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Alpha</td>
        <td id="cell-B1" data-val="120" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">120</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="Beta" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">Beta</td>
        <td id="cell-B2" data-val="80" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">80</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Advanced Aggregations",
                    "subtitle": "Dynamic Slicing and Ranges",
                    "theory": "Cross check coordinates. Combine fields using text and math helpers.",
                    "demo": "=SUM(B1:B2)",
                    "cc": "Basic Math",
                    "questions": [
                        "### **Q1.** Calculate average hours worked across B1:B2.",
                        "### **Q2.** Check if project in A1 is Alpha, returning B1 if true and 0 if false.",
                        "### **Q3.** Join A1 and A2 using CONCAT."
                    ]
                }
            ],
            "tasks": [
                {"name": "Total Hours", "desc": "Calculate the sum of all hours from B1 to B2."}
            ],
            "interviews": [
                "Calculate average hours from B1 to B2."
            ]
        },
        # Day 12
        {
            "day": 12,
            "title": "Data Validation, What-If & Capstone",
            "emoji": "🏆",
            "objective": "Build validation limits, use What-If scenarios, and solve the Final Excel Capstone Challenge.",
            "grid_html": """
<div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
  <table class="excel-grid" style="border-collapse: collapse; width: 100%; max-width: 500px; background-color: #0b0f19; border: 1px solid #1f293d; font-family: sans-serif; font-size: 14px; text-align: center;">
    <thead>
      <tr style="background-color: #161f30; color: #9ab4e9;">
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold; width: 40px;"></th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">A (Cost)</th>
        <th style="border: 1px solid #1f293d; padding: 8px; font-weight: bold;">B (Revenue)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">1</td>
        <td id="cell-A1" data-val="10000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">10000</td>
        <td id="cell-B1" data-val="15000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">15000</td>
      </tr>
      <tr>
        <td style="border: 1px solid #1f293d; padding: 8px; background-color: #161f30; color: #9ab4e9; font-weight: bold;">2</td>
        <td id="cell-A2" data-val="20000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">20000</td>
        <td id="cell-B2" data-val="32000" style="border: 1px solid #1f293d; padding: 8px; color: #e2e8f0;">32000</td>
      </tr>
    </tbody>
  </table>
</div>
""",
            "sections": [
                {
                    "num": 1,
                    "title": "Capstone Calculations",
                    "subtitle": "Final Capstone Audits",
                    "theory": "Verify final financial outcomes. Profit is calculated as Revenue minus Cost.",
                    "demo": "=B1-A1",
                    "cc": "Capstone Formulas",
                    "questions": [
                        "### **Q1.** Calculate profit for project 2 (B2 - A2).",
                        "### **Q2.** Calculate total cost across A1:A2.",
                        "### **Q3.** Calculate total revenue across B1:B2."
                    ]
                }
            ],
            "tasks": [
                {"name": "Total Profit", "desc": "Calculate total profit across both projects (B1 - A1 + B2 - A2)."}
            ],
            "interviews": [
                "Calculate total cost in range A1:A2."
            ]
        }
    ]
    
    for item in curriculum:
        day_num = item['day']
        formatted_day = f"Day{day_num:02d}"
        filename = f"{formatted_day}_Excel_Blank.ipynb"
        
        cells = []
        
        # Cell 0: Objective
        cells.append({
            "cell_type": "markdown",
            "metadata": {},
            "source": [
                "---\n",
                f"## 🎯 Enterprise Objective: {item['title']}\n",
                f"{item['objective']}\n\n",
                "### 📋 Excel Sandbox Grid:\n\n",
                "Use the dataset below to write and execute your formulas.\n",
                item['grid_html']
            ]
        })
        
        # Sections
        for sec in item['sections']:
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
                    "source": ["=Write your Excel formula here\n"],
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
                "Write Excel formulas to solve the following tasks.\n"
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
                "source": ["=Write your Excel formula here\n"],
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
                "source": ["=Write your Excel formula here\n"],
                "outputs": [],
                "execution_count": None
            })
            
        # Write notebook JSON to file
        nb_json = {
            "cells": cells,
            "metadata": {},
            "nbformat": 4,
            "nbformat_minor": 2
        }
        
        out_path = os.path.join('notebooks/excel', filename)
        with open(out_path, 'w', encoding='utf-8') as f:
            json.dump(nb_json, f, indent=1, ensure_ascii=False)
            
        print(f"Generated {out_path}")

if __name__ == '__main__':
    generate_excel_notebooks()
