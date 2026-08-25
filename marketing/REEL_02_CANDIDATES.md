# 🎬 MANODEMY REEL 02: CANDIDATE CONCEPTS (READY FOR REVIEW)

Nee review panradhukaaga **Python & SQL Specialist Agents** kooda sendhu **Top 3 High-Impact Viral Reel Candidates** ready panni vachirukken da partner!

---

## 🐍 CANDIDATE 1 (RECOMMENDED FOR TOMORROW MORNING 7:07 AM):
### Topic: Python Mutable Default Argument Bug (Day 33)
### Reel ID: `PY-01-R1`

### 1. 🎨 Visual Hook & Color Science
* **Hook Line 1:** `99% PYTHON DEVS FAIL THIS 💀` *(Highlight `99%` in `#facc15` Electric Gold)*
* **Hook Line 2:** `MUTABLE DEFAULT TRAP !` *(Highlight `MUTABLE DEFAULT` in `#00f0ff` Cyber Cyan)*

### 2. 💻 Code Cards
* **Option A (The Trap):**
```python
def add_user(name, users=[]):
    users.append(name)
    return users

print(add_user("Alice"))
print(add_user("Bob"))
```
* **Option B (The Production Fix):**
```python
def add_user(name, users=None):
    if users is None:
        users = []
    users.append(name)
    return users

print(add_user("Alice"))
print(add_user("Bob"))
```

### 3. 🎙️ Multi-Chunk Voiceover Script (Edge-TTS: `en-US-AndrewNeural`)
* **Chunk 1 (Hook):** *"Ninety nine percent of Python devs fail this trap."*
* **Chunk 2 (Dilemma):** *"One of these shares memory across every function call."*
* **Chunk 3 (Timer):** *"Choose your answer. Option A or Option B?"*
* **Chunk 4 (CTA):** *"Comment your answer with reason below."*

### 4. 📝 4-Line Caption (Zero Spoilers)
```text
99% PYTHON DEVS FAIL THIS 💀
One of these silently shares memory across calls!

Can you predict what Option A prints on the 2nd call?

Drop your vote (A or B) below 👇

Follow @manodemy.in for daily Python & SQL interview traps.

#python #pythoninterview #pythontips #pythoncode #dataanalytics #dataengineer #datascience #dataanalyst #faang #techinterview #codinginterview #learnpython #programming #manodemy
```

### 5. 📌 Pinned Comment Breakdown
```text
Option A is the trap ❌ | Option B is correct ✅

Why Option A fails:
In Python, default arguments (`users=[]`) are evaluated ONCE when the function is defined — NOT every time it runs! 
So the 2nd call prints `['Alice', 'Bob']` instead of `['Bob']`!

Option B creates a fresh list on every invocation using `team = None`.

💡 Pro-tip: NEVER use mutable defaults (lists/dicts) in Python functions.

Be honest — did you know this one? 👇
```

---

## 🐬 CANDIDATE 2:
### Topic: SQL NULL Arithmetic Salary Eraser Bug (Day 04)
### Reel ID: `SQL-02-R1`

### 1. 🎨 Visual Hook & Color Science
* **Hook Line 1:** `THIS SQL QUERY ERASES SALARY 💀` *(Highlight `ERASES SALARY` in `#facc15` Gold)*
* **Hook Line 2:** `NULL ARITHMETIC TRAP !` *(Highlight `NULL ARITHMETIC` in `#00f0ff` Cyan)*

### 2. 💻 Code Cards
* **Option A (The Bug):**
```sql
SELECT employee_name,
       base_salary + bonus AS total_payout
FROM employees;
```
* **Option B (The Safe Fix):**
```sql
SELECT employee_name,
       base_salary + COALESCE(bonus, 0) AS total_payout
FROM employees;
```

### 3. 🎙️ Voiceover Script
* **Chunk 1:** *"This subtle SQL bug accidentally wipes employee salaries."*
* **Chunk 2:** *"One of these silently turns total pay into NULL."*
* **Chunk 3:** *"Choose your answer. Option A or Option B?"*
* **Chunk 4:** *"Comment your answer with reason below."*

---

## 🐬 CANDIDATE 3:
### Topic: COUNT(*) vs COUNT(column_name) (Day 04)
### Reel ID: `SQL-03-R1`

### 1. 🎨 Visual Hook & Color Science
* **Hook Line 1:** `COUNT(*) VS COUNT(bonus) 💀`
* **Hook Line 2:** `WHICH ONE IGNORES NULLS ?`

### 2. 💻 Code Cards
* **Option A:** `SELECT dept, COUNT(*) FROM employees GROUP BY dept;`
* **Option B:** `SELECT dept, COUNT(bonus) FROM employees GROUP BY dept;`
