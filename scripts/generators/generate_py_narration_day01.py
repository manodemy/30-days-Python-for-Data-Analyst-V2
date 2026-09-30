"""
Master Narration Script Generator for Python Day 01
Aligns 100% with the current py-day-01.js slide sections and practice questions.
"""

import json
import sys
from pathlib import Path

if sys.platform == "win32":
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

# 5 Lecture Audio Scripts matching the 5 slide sections
LECTURE_NARRATIONS = {
    "New_PyDay01Audio01.mp3": (
        "Welcome to Day 01 of Python for Data Analysis! Python is an interpreted, high-level language created by Guido van Rossum in 1991. "
        "As a data analyst, Python gives you five indispensable superpowers: first, loading and transforming massive datasets of 10 million rows or more where Excel freezes; "
        "second, building end-to-end automated ETL pipelines that run overnight without manual effort; "
        "third, executing advanced statistical modeling, grouping, and regex data cleaning with Pandas and NumPy; "
        "fourth, rendering interactive dashboards and charts with Seaborn and Plotly; "
        "and fifth, acting as your direct gateway into machine learning and modern generative AI."
    ),
    "New_PyDay01Audio02.mp3": (
        "Let's examine the Analytics Tool Matrix: SQL versus Excel versus Python. "
        "Excel is your agile scratchpad for ad-hoc exploration, quick formulas, and executive summaries under 100,000 rows. "
        "SQL is your enterprise database workhorse, lightning-fast at filtering, joining, and aggregating billions of records directly inside the warehouse. "
        "Python is your automation engine and analytical powerhouse, excelling at complex multi-step transformations, statistical algorithms, API integrations, and predictive modeling. "
        "The highest-paid modern data analysts don't pick just one; they extract with SQL, engineer and analyze with Python, and communicate insights with executive dashboards."
    ),
    "New_PyDay01Audio03.mp3": (
        "Now let's explore Object Mutability: Mutable versus Immutable objects. "
        "In Python, every value is an object allocated in computer RAM. "
        "Mutable objects, such as lists, dictionaries, and sets, can be modified in-place without changing their memory address. "
        "Immutable objects, including integers, floats, strings, and tuples, can never be changed once created. Any modification generates a brand new object at a new memory address. "
        "Watch out for the dangerous Shared Reference Pitfall: writing clean data equals raw data does not create a copy, it creates an alias pointing to the exact same memory! "
        "Modifying clean data will silently corrupt your raw source. Always use dot copy to safeguard your analytical pipelines."
    ),
    "New_PyDay01Audio04.mp3": (
        "Here is the Master Data Types Reference matrix for data analysts. "
        "Numeric types include arbitrary-precision integers, IEEE-754 double precision floats, and complex numbers for scientific computing. "
        "Sequence types include immutable Unicode strings, ordered mutable lists for row collections, locked immutable tuples for fixed records, and range generators for memory-efficient iteration. "
        "Set types eliminate duplicates and perform rapid set operations like unions and intersections. "
        "Mapping types like dictionaries provide lightning-fast O of 1 lookups using hash tables. "
        "Finally, boolean flags control analytical branching, and the NoneType singleton represents missing or null data, just like NULL in SQL."
    ),
    "New_PyDay01Audio05.mp3": (
        "Let's trace how Python manages memory under the hood through our runtime execution pipeline. "
        "When you run Python code, Python first allocates object values inside heap memory. "
        "Variables are not boxes that hold values; they are lightweight pointers or name tags bound to memory addresses. "
        "When two variables are assigned the same value, they point to the exact same object in RAM. "
        "Reassigning a variable does not overwrite the old data; it simply repoints the tag to a new memory location. "
        "To test whether two variables share the exact same memory address, use the is keyword, which checks object identity via memory IDs, compared to double equals, which checks value equality. "
        "Python automatically frees unused memory using reference counting and a cyclic garbage collector."
    )
}

# 15 Practice Questions matching py-day-01.js
QUESTION_NARRATIONS = {
    "New_PyDay01Question01.mp3": "Welcome to your first Python exercise! Use Python's built-in print function to output the greeting: Hello, Python for Data Analysis to the console.",
    "New_PyDay01Question01sol.mp3": "Here is the solution. We call the print function and pass the string Hello, Python for Data Analysis inside quotation marks. When run, Python displays this text in the terminal.",
    
    "New_PyDay01Question02.mp3": "Let's perform calculations with print! The print function can directly calculate math expressions. Use print to compute and display the sum of 150 plus 250.",
    "New_PyDay01Question02sol.mp3": "Here is the solution. We write print opening parenthesis, 150 plus 250, closing parenthesis. Python calculates the arithmetic expression first and outputs 400.",
    
    "New_PyDay01Question03.mp3": "Printing multiple values! You can print multiple items in a single line separated by commas. Use print to output the label 'Total Records:' followed by the number 500.",
    "New_PyDay01Question03sol.mp3": "Here is the solution. We pass two arguments into print separated by a comma: the string label 'Total Records:' and the number 500. Python formats them separated by a space.",
    
    "New_PyDay01Question04.mp3": "Creating an integer variable! Integers store whole numbers without decimals. Create a variable named employee count set to 150, and print it with the label 'Employee Count:'.",
    "New_PyDay01Question04sol.mp3": "Here is the solution. We assign employee count equals 150, then call print passing the label and variable. Python looks up the variable's integer pointer and displays 150.",
    
    "New_PyDay01Question05.mp3": "Creating a float variable! Floats store decimal numbers. Create a float variable named average salary set to 75450.50, and print it with the label 'Average Salary:'.",
    "New_PyDay01Question05sol.mp3": "Here is the solution. We assign average salary equals 75450.50, then print it with its label. Python stores decimal numbers as 64-bit IEEE double-precision floats.",
    
    "New_PyDay01Question06.mp3": "Creating a string variable! Strings store text enclosed in quotation marks. Create a string variable named company name set to 'Manodemy', and print it with its label.",
    "New_PyDay01Question06sol.mp3": "Here is the solution. We assign company name equals 'Manodemy' in quotes, then print it with the label. Python creates an immutable string object in memory.",
    
    "New_PyDay01Question07.mp3": "Creating a boolean variable! Booleans represent truth values and must be capitalized: True or False. Create a variable named is full time set to True, and print it with its label.",
    "New_PyDay01Question07sol.mp3": "Here is the solution. We write is full time equals True with a capital T, and print it. Python booleans are singletons used for conditional logic.",
    
    "New_PyDay01Question08.mp3": "Creating a list! Lists are ordered, mutable sequences defined inside square brackets. Create a list named sales figures containing 1200, 1450, and 1800, and print it with its label.",
    "New_PyDay01Question08sol.mp3": "Here is the solution. We write sales figures equals opening bracket, 1200, 1450, 1800, closing bracket. Lists allow you to add, remove, and modify elements in place.",
    
    "New_PyDay01Question09.mp3": "Creating a tuple! Tuples are ordered, immutable sequences defined in parentheses. Create a tuple named server location with 'Mumbai', 19.07, and 72.87, and print it with its label.",
    "New_PyDay01Question09sol.mp3": "Here is the solution. We define server location equals parentheses containing 'Mumbai', 19.07, and 72.87. Tuples protect coordinates and dimensions from accidental modification.",
    
    "New_PyDay01Question10.mp3": "Creating a dictionary! Dictionaries store key-value pairs in curly braces. Create a dictionary named customer profile with name 'Aarav' and orders 5, and print it with its label.",
    "New_PyDay01Question10sol.mp3": "Here is the solution. We assign customer profile equals curly braces, key 'name' colon 'Aarav', comma, key 'orders' colon 5. Dictionaries provide fast O of 1 lookups by key.",
    
    "New_PyDay01Question11.mp3": "Creating a set! Sets store unique elements inside curly braces. Create a set named unique tags containing 'python', 'sql', and 'analytics', and print it with its label.",
    "New_PyDay01Question11sol.mp3": "Here is the solution. We assign unique tags equals curly braces containing 'python', 'sql', and 'analytics'. Sets automatically discard duplicate entries.",
    
    "New_PyDay01Question12.mp3": "The NoneType singleton! In Python, None represents missing or null data. Create a variable named bonus amount set to None with a capital N, and print it with its label.",
    "New_PyDay01Question12sol.mp3": "Here is the solution. We write bonus amount equals None with a capital N. None is Python's standard singleton for representing the absence of a value.",
    
    "New_PyDay01Question13.mp3": "Composite fraud detection! Group transaction amounts across multi-dimensional keys user id, device, and ip using a tuple-keyed defaultdict of float.",
    "New_PyDay01Question13sol.mp3": "Here is the solution. We import defaultdict from collections. We loop through each transaction, construct a composite tuple key of user id, device, and ip, and aggregate amounts into the map.",
    
    "New_PyDay01Question14.mp3": "Recursive dict flattener! Write a recursive function to flatten a nested dictionary into dot-separated keys, coalescing any None values to the string N/A.",
    "New_PyDay01Question14sol.mp3": "Here is the solution. We recursively traverse the dictionary. If a value is another dictionary, we call flatten dict with an updated prefix. Otherwise, we coalesce None to 'N/A' and store the key.",
    
    "New_PyDay01Question15.mp3": "Dynamic list allocator tracking! Append 20 numbers to an empty list and track each time sys dot getsizeof jumps due to dynamic memory over-allocation.",
    "New_PyDay01Question15sol.mp3": "Here is the solution. We measure the initial size of an empty list with sys dot getsizeof. In a loop from 0 to 20, whenever the size increases, we log the append index and new byte allocation."
}

def main():
    # 1. Save narrations/py-day-01.json
    narration_data = {
        "day": 1,
        "title": "Python Day 01 — Data Types & Memory Management",
        "lecture": LECTURE_NARRATIONS,
        "questions": QUESTION_NARRATIONS
    }
    
    json_path = Path("narrations/py-day-01.json")
    json_path.parent.mkdir(parents=True, exist_ok=True)
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(narration_data, f, indent=2, ensure_ascii=False)
    print(f"✓ Saved {json_path} with {len(LECTURE_NARRATIONS)} lecture and {len(QUESTION_NARRATIONS)} question entries.")

    # 2. Update public/python/content/py-narrations.js
    js_path = Path("public/python/content/py-narrations.js")
    
    # Read existing py-narrations.js to preserve Day02 narrations
    day02_entries = {}
    if js_path.exists():
        with open(js_path, "r", encoding="utf-8") as f:
            content = f.read()
        import re
        matches = re.findall(r'["\'](New_PyDay02[^"\']+)["\']\s*:\s*["\']([^"\']+)["\']', content)
        for k, v in matches:
            day02_entries[k] = v

    # Build new py-narrations.js
    all_narrations = {**LECTURE_NARRATIONS, **QUESTION_NARRATIONS}
    
    lines = [
        "// Master Narration Dictionary for Python Learning Engine",
        "if (!window.PYTHON_NARRATIONS) window.PYTHON_NARRATIONS = {};",
        "",
        "window.PYTHON_NARRATIONS = Object.assign(window.PYTHON_NARRATIONS, {"
    ]
    
    for k, v in all_narrations.items():
        escaped_v = v.replace('"', '\\"')
        lines.append(f'  "{k}": "{escaped_v}",')
    
    for k, v in day02_entries.items():
        escaped_v = v.replace('"', '\\"')
        lines.append(f'  "{k}": "{escaped_v}",')
        
    lines.append("});")
    lines.append("")
    
    with open(js_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"✓ Saved {js_path} with {len(all_narrations)} Day 01 narrations + {len(day02_entries)} Day 02 narrations.")

if __name__ == "__main__":
    main()
