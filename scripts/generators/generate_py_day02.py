"""
Generate public/python/content/py-day-02.js
Matches the 6-pillar gold standard of SQL Day 01-10.
"""

import json
import re

with open('public/python/content/py-day-02.js', 'r', encoding='utf-8') as f:
    orig = f.read()

m = re.search(r'(testQuestions:\s*\[.*?\]\s*,\s*(?:topics|slides|practiceQuestions|\}))', orig, re.DOTALL)
if not m:
    m = re.search(r'(testQuestions:\s*\[.*\])', orig, re.DOTALL)
tq_block = m.group(1) if m else 'testQuestions: []'
if tq_block.endswith('}'):
    tq_block = tq_block.rstrip('}').strip().rstrip(',')

print(f"Extracted Day 02 testQuestions length: {len(tq_block)}")

# Define the 7 Slides for Day 02
slides_html = [
    # Slide 1: Arithmetic & In-Place Assignment
    {
        "title": "01. Arithmetic & In-Place Assignment",
        "duration": "8:45",
        "html": """
        <h2>⚙️ 01. Arithmetic & In-Place Assignment Operators</h2>

        <div class="slide-section" id="day02ArithSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">01. Numeric Operations & In-Place Mutation</h3>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio01.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>Python provides standard arithmetic operators (<code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>, <code>//</code>, <code>%</code>, <code>**</code>) and corresponding augmented assignment operators (<code>+=</code>, <code>-=</code>, <code>*=</code>, etc.). Crucially, augmented assignment on mutable objects (like lists) modifies in-place, whereas on immutable types (numbers, strings) it rebinds a new object.</p>
        </div>

        <div class="slide-section" id="day02ArithTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Arithmetic & Assignment Operator Reference</h4>
              <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio02.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Operator</th><th>Name</th><th>Example</th><th>Behavior / Result</th></tr></thead>
              <tbody>
                <tr><td><code>/</code></td><td>True Division</td><td><code>7 / 2</code></td><td>Always returns <code>float</code> (<code>3.5</code>)</td></tr>
                <tr><td><code>//</code></td><td>Floor Division</td><td><code>7 // 2</code> vs <code>-7 // 2</code></td><td><code>3</code> vs <code>-4</code> (floors towards -&infin;)</td></tr>
                <tr><td><code>%</code></td><td>Modulo</td><td><code>17 % 5</code></td><td>Remainder: <code>2</code></td></tr>
                <tr><td><code>**</code></td><td>Exponentiation</td><td><code>2 ** 3</code></td><td><code>8</code> (Right-associative: <code>2**3**2 = 512</code>)</td></tr>
                <tr><td><code>+=</code></td><td>In-Place Add</td><td><code>lst += [4]</code></td><td>Mutates list in-place (calls <code>__iadd__</code>)</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day02ArithCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Compound Interest & Mutability Nuance</h4>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio03.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code>principal = 10000.0
rate = 0.07
years = 5

<span class="code-comment"># Compound interest formula: A = P * (1 + r)**t</span>
future_val = principal * ((1 + rate) ** years)
print(f"Investment Value: ${future_val:,.2f}")

<span class="code-comment"># In-place list mutation vs reassignment:</span>
a = [1, 2]
b = a
a += [3]  <span class="code-comment"># Mutates original list! b is also [1, 2, 3]</span>
print(f"a: {a} | b: {b}")</code></pre>
            </div>
          </div>
        </div>
        """
    },

    # Slide 2: Comparison Operators & Chaining
    {
        "title": "02. Comparison Operators & Chaining",
        "duration": "9:20",
        "html": """
        <h2>🔍 02. Comparison Operators & Chaining Logic</h2>

        <div class="slide-section" id="day02CompSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">02. Relational Logic & Chained Comparisons</h3>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio04.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>Python comparison operators (<code>==</code>, <code>!=</code>, <code>&lt;</code>, <code>&gt;</code>, <code>&lt;=</code>, <code>&gt;=</code>) evaluate truth values. Uniquely, Python supports <strong>chained comparisons</strong>: an expression like <code>18 &lt;= age &lt; 65</code> translates to <code>18 &lt;= age and age &lt; 65</code> with <code>age</code> evaluated only once!</p>
        </div>

        <div class="slide-section" id="day02CompTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Comparison Patterns & Chaining Mechanics</h4>
              <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio05.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Pattern</th><th>Chained Expression</th><th>Equivalent Logical Form</th><th>Evaluation Advantage</th></tr></thead>
              <tbody>
                <tr><td>Range Check</td><td><code>0 &lt;= score &lt;= 100</code></td><td><code>0 &lt;= score and score &lt;= 100</code></td><td>Cleaner, mathematical, single evaluation</td></tr>
                <tr><td>Strict Window</td><td><code>min_val &lt; x &lt; max_val</code></td><td><code>min_val &lt; x and x &lt; max_val</code></td><td>Avoids duplicate function call if <code>x = f()</code></td></tr>
                <tr><td>Multi-Equality</td><td><code>a == b == c</code></td><td><code>a == b and b == c</code></td><td>Verifies all three variables are identical</td></tr>
                <tr><td>Lexicographical</td><td><code>"2026-01" &lt; "2026-02"</code></td><td>Compares ASCII/Unicode order</td><td>Enables date string filtering without parsing</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day02CompCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Data Quality Validation with Chained Checks</h4>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio06.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code>temperature = 37.2
status_code = 204

<span class="code-comment"># Elegant chained comparison:</span>
is_normal_temp = 36.5 <= temperature <= 37.5
is_http_success = 200 <= status_code < 300

print(f"Normal Temp: {is_normal_temp} | HTTP 2xx: {is_http_success}")</code></pre>
            </div>
          </div>
        </div>
        """
    },

    # Slide 3: Logical Operators & Short-Circuit
    {
        "title": "03. Logical Operators & Short-Circuit",
        "duration": "10:15",
        "html": """
        <h2>⚡ 03. Logical Operators & Short-Circuit Evaluation</h2>

        <div class="slide-section" id="day02LogSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">03. Boolean Algebra & Lazy Evaluation</h3>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio07.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>Python's logical operators (<code>and</code>, <code>or</code>, <code>not</code>) do not necessarily return <code>True</code> or <code>False</code>. They return the <strong>exact operand that determined the outcome</strong>, following short-circuit (lazy) rules:</p>
          <ul>
            <li><code>a and b</code>: Returns <code>a</code> if <code>a</code> is falsy; otherwise returns <code>b</code>.</li>
            <li><code>a or b</code>: Returns <code>a</code> if <code>a</code> is truthy; otherwise returns <code>b</code>.</li>
          </ul>
        </div>

        <div class="slide-section" id="day02LogTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Short-Circuit Evaluation Matrix</h4>
              <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio08.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Expression</th><th>Evaluates To</th><th>Why</th><th>Analyst Use Case</th></tr></thead>
              <tbody>
                <tr><td><code>"" or "default"</code></td><td><code>"default"</code></td><td>First operand is falsy; falls back to second</td><td>Fallback default value</td></tr>
                <tr><td><code>"Aarav" or "default"</code></td><td><code>"Aarav"</code></td><td>First operand is truthy; stops immediately</td><td>Preserve provided input</td></tr>
                <tr><td><code>None and "user"</code></td><td><code>None</code></td><td>First operand is falsy; aborts evaluation</td><td>Safe navigation without crash</td></tr>
                <tr><td><code>b != 0 and a / b</code></td><td><code>False</code> (if b=0)</td><td>Short-circuits before ZeroDivisionError!</td><td>Defensive division guard</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day02LogCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Defensive Guard & Fallback Idioms</h4>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio09.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code>raw_input = ""
clean_username = raw_input.strip() <span class="kw">or</span> "Anonymous"
print(f"User: {clean_username}") <span class="code-comment"># Output: 'Anonymous'</span>

<span class="code-comment"># Zero-division guard using 'and':</span>
divisor = 0
dividend = 100
result = (divisor != 0) <span class="kw">and</span> (dividend / divisor)
print(f"Safe Result: {result}") <span class="code-comment"># Output: False (no crash!)</span></code></pre>
            </div>
          </div>
        </div>
        """
    },

    # Slide 4: Identity & Membership
    {
        "title": "04. Identity (is) vs Membership (in)",
        "duration": "9:40",
        "html": """
        <h2>🔎 04. Identity (is) & Membership (in) Operators</h2>

        <div class="slide-section" id="day02IdSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">04. Memory Pointers vs Collection Membership</h3>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio10.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p><code>is</code> / <code>is not</code> test <strong>object identity</strong> (same pointer in RAM). <code>in</code> / <code>not in</code> test <strong>membership</strong> (whether an item exists in a sequence, set, or mapping). While <code>in</code> is $O(N)$ on lists, it is $O(1)$ on sets and dict keys.</p>
        </div>

        <div class="slide-section" id="day02IdTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Identity vs Membership Comparison</h4>
              <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio11.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Operator</th><th>Purpose</th><th>Performance</th><th>Best Practice</th></tr></thead>
              <tbody>
                <tr><td><code>is None</code></td><td>Test for singleton None</td><td>$O(1)$ pointer comparison</td><td>Always use for NULL checks</td></tr>
                <tr><td><code>x in list</code></td><td>Linear search</td><td>$O(N)$ sequential scan</td><td>Avoid inside large loops</td></tr>
                <tr><td><code>x in set</code></td><td>Hash lookup</td><td>Average $O(1)$ lookup</td><td>Convert lookup tables to sets</td></tr>
                <tr><td><code>k in dict</code></td><td>Key presence check</td><td>Average $O(1)$ lookup</td><td>Preferred over <code>dict.keys()</code></td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day02IdCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">High-Speed Stop-Word Filter with Set Membership</h4>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio12.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code>stop_words = {"the", "a", "an", "in", "on", "at", "for"}
tokens = ["the", "revenue", "in", "q3", "exceeded", "forecast"]

<span class="code-comment"># O(1) membership check per token:</span>
filtered = [t <span class="kw">for</span> t <span class="kw">in</span> tokens <span class="kw">if</span> t <span class="kw">not in</span> stop_words]
print("Keywords:", filtered) <span class="code-comment"># ['revenue', 'q3', 'exceeded', 'forecast']</span></code></pre>
            </div>
          </div>
        </div>
        """
    },

    # Slide 5: Bitwise Operators & Binary Masks
    {
        "title": "05. Bitwise Operators & Masks",
        "duration": "10:30",
        "html": """
        <h2>🎛️ 05. Bitwise Operators & Binary Masks</h2>

        <div class="slide-section" id="day02BitSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">05. Binary-Level Control & Permission Bitmasks</h3>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio13.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>Bitwise operators (<code>&</code> AND, <code>|</code> OR, <code>^</code> XOR, <code>~</code> NOT, <code>&lt;&lt;</code> left shift, <code>&gt;&gt;</code> right shift) operate directly on integer bits. In data engineering, bitwise operators are widely used for compact status flags, permission matrices, and fast parity checks.</p>
        </div>

        <div class="slide-section" id="day02BitTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Bitwise Operator Reference</h4>
              <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio14.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Operator</th><th>Name</th><th>Bitwise Trick</th><th>Example / Result</th></tr></thead>
              <tbody>
                <tr><td><code>&amp;</code></td><td>Bitwise AND</td><td>Test if bit is set</td><td><code>n &amp; 1 == 0</code> (Ultra-fast even/odd test)</td></tr>
                <tr><td><code>|</code></td><td>Bitwise OR</td><td>Enable / set a flag bit</td><td><code>perms | WRITE_FLAG</code></td></tr>
                <tr><td><code>^</code></td><td>Bitwise XOR</td><td>Toggle a flag bit</td><td><code>status ^ ACTIVE_FLAG</code></td></tr>
                <tr><td><code>&lt;&lt;</code></td><td>Left Shift</td><td>Multiply by $2^k$</td><td><code>1 &lt;&lt; 3 == 8</code></td></tr>
                <tr><td><code>&gt;&gt;</code></td><td>Right Shift</td><td>Divide by $2^k$</td><td><code>16 &gt;&gt; 2 == 4</code></td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day02BitCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Role-Based Access Control (RBAC) Bitmask</h4>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio15.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code>READ_PERM    = 1 << 0  <span class="code-comment"># 0001 (1)</span>
WRITE_PERM   = 1 << 1  <span class="code-comment"># 0010 (2)</span>
EXECUTE_PERM = 1 << 2  <span class="code-comment"># 0100 (4)</span>

<span class="code-comment"># Assign Read + Execute:</span>
user_perms = READ_PERM | EXECUTE_PERM  <span class="code-comment"># 0101 (5)</span>

can_write = bool(user_perms & WRITE_PERM)   <span class="code-comment"># False</span>
can_read  = bool(user_perms & READ_PERM)    <span class="code-comment"># True</span>
print(f"Can Write: {can_write} | Can Read: {can_read}")</code></pre>
            </div>
          </div>
        </div>
        """
    },

    # Slide 6: Ternary, Precedence & Walrus
    {
        "title": "06. Ternary, Precedence & Walrus (:=)",
        "duration": "11:00",
        "html": """
        <h2>🦭 06. Ternary, Precedence & The Walrus Operator (:=)</h2>

        <div class="slide-section" id="day02WalrusSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">06. Assignment Expressions (PEP 572) & Order of Operations</h3>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio16.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>Introduced in Python 3.8, the <strong>walrus operator</strong> (<code>:=</code>) assigns values to variables inside expressions. This avoids duplicate function calls in <code>while</code> loops and list comprehensions. Combined with Python's ternary conditional (<code>true_val if cond else false_val</code>), it enables expressive, high-performance logic.</p>
        </div>

        <div class="slide-section" id="day02WalrusTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Operator Precedence Hierarchy (Highest to Lowest)</h4>
              <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio17.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Level</th><th>Operators</th><th>Description</th><th>Associativity</th></tr></thead>
              <tbody>
                <tr><td>1 (Highest)</td><td><code>( )</code>, <code>[ ]</code>, <code>{ }</code></td><td>Grouping & access</td><td>Left-to-right</td></tr>
                <tr><td>2</td><td><code>**</code></td><td>Exponentiation</td><td><strong>Right-to-left</strong> (<code>2**3**2 = 512</code>)</td></tr>
                <tr><td>3</td><td><code>* / // %</code></td><td>Multiplication & division</td><td>Left-to-right</td></tr>
                <tr><td>4</td><td><code>+ -</code></td><td>Addition & subtraction</td><td>Left-to-right</td></tr>
                <tr><td>5</td><td><code>&lt;&lt; &gt;&gt;</code>, <code>&amp;</code>, <code>^</code>, <code>|</code></td><td>Bitwise operations</td><td>Left-to-right</td></tr>
                <tr><td>6</td><td><code>== != &lt; &gt; is in</code></td><td>Comparisons & identity</td><td>Left-to-right (chained)</td></tr>
                <tr><td>7</td><td><code>not</code> &rarr; <code>and</code> &rarr; <code>or</code></td><td>Logical algebra</td><td>Left-to-right (<code>not</code> binds first)</td></tr>
                <tr><td>8 (Lowest)</td><td><code>:=</code></td><td>Walrus assignment</td><td>Right-to-left</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day02WalrusCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Walrus in List Comprehensions & While Loops</h4>
            <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio18.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code>raw_records = ["  apple ", "   ", "BANANA", "  cherry  "]

<span class="code-comment"># Strip, filter non-empty, and lower-case WITHOUT recomputing:</span>
cleaned = [clean <span class="kw">for</span> item <span class="kw">in</span> raw_records <span class="kw">if</span> (clean := item.strip().lower())]
print("Cleaned:", cleaned) <span class="code-comment"># ['apple', 'banana', 'cherry']</span>

<span class="code-comment"># Inline ternary classification:</span>
risk_level = "High" <span class="kw">if</span> len(cleaned) < 5 <span class="kw">else</span> "Normal"
print(f"Risk: {risk_level}")</code></pre>
            </div>
          </div>
        </div>
        """
    },

    # Slide 7: Top 25 Interview Questions
    {
        "title": "07. Top 25 Interview Q&As: Operators & Logic",
        "duration": "14:50",
        "html": """
        <h2>🎯 07. Top 25 FAANG & Fintech Interview Q&As</h2>

        <div class="slide-section" id="day02InterviewIntroSection">
          <p>These 25 questions test deep understanding of Python operators, precedence traps, bitwise optimization, and short-circuit evaluation frequently probed in high-level coding interviews.</p>
        </div>

        <div class="slide-section" id="day02InterviewCardsSection">
          <div class="interview-box">
            <h4>💡 Python Operators, Precedence & Evaluation Rules</h4>

            <div id="pyDay02IQ1">
              <p><strong>Q1: Why does <code>2 ** 3 ** 2</code> evaluate to 512 instead of 64?</strong></p>
              <p><em>A: The exponentiation operator (<code>**</code>) is <strong>right-associative</strong>. The rightmost exponent is computed first: <code>3 ** 2 = 9</code>, then <code>2 ** 9 = 512</code>. To compute <code>(2**3)**2 = 64</code>, explicit parentheses must be used.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ2">
              <p><strong>Q2: Why does <code>not False == False</code> evaluate to <code>False</code>?</strong></p>
              <p><em>A: Comparison operators (<code>==</code>) have higher precedence than <code>not</code>. Thus, Python parses the expression as <code>not (False == False)</code> &rarr; <code>not True</code> &rarr; <code>False</code>. If you intend <code>(not False) == False</code>, you must use parentheses.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ3">
              <p><strong>Q3: How does short-circuit evaluation work with <code>and</code> and <code>or</code>?</strong></p>
              <p><em>A: <code>a and b</code> evaluates <code>a</code>; if falsy, it immediately returns <code>a</code> without evaluating <code>b</code>. If truthy, it returns <code>b</code>. <code>a or b</code> evaluates <code>a</code>; if truthy, it immediately returns <code>a</code>. If falsy, it returns <code>b</code>. Neither operator coerces the result to a strict boolean.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ4">
              <p><strong>Q4: How do chained comparisons like <code>10 &lt; x &lt; 20</code> work under the hood?</strong></p>
              <p><em>A: Python translates <code>10 &lt; x &lt; 20</code> to <code>10 &lt; x and x &lt; 20</code>, but evaluates the middle operand <code>x</code> only once. If <code>x</code> is an expensive function call, chained comparison ensures optimal single execution.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ5">
              <p><strong>Q5: What is the Walrus operator (<code>:=</code>), and where is it most useful?</strong></p>
              <p><em>A: Introduced in Python 3.8 (PEP 572), <code>:=</code> assigns a value to a variable within an expression while returning the value. It prevents duplicate computation in <code>while ((chunk := file.read(1024))):</code> and avoids duplicate filtering in list comprehensions.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ6">
              <p><strong>Q6: Why is <code>x & 1 == 0</code> a syntax / precedence trap?</strong></p>
              <p><em>A: Comparison operators (<code>==</code>) have higher precedence than bitwise AND (<code>&</code>). Python parses this as <code>x & (1 == 0)</code> &rarr; <code>x & False</code> &rarr; <code>0</code>. You must write <code>(x & 1) == 0</code> with parentheses.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ7">
              <p><strong>Q7: What is the difference between <code>a = a + [1]</code> and <code>a += [1]</code> on a list?</strong></p>
              <p><em>A: <code>a = a + [1]</code> creates a brand new list in memory and rebinds the variable <code>a</code>. <code>a += [1]</code> calls <code>list.__iadd__()</code>, which extends the existing list in-place without creating a new object.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ8">
              <p><strong>Q8: What does <code>~x</code> (bitwise NOT) do in Python?</strong></p>
              <p><em>A: Python integers use two's complement representation. Bitwise NOT flips all bits, which is mathematically equivalent to <code>-(x + 1)</code>. E.g., <code>~5 == -6</code> and <code>~0 == -1</code>. In sequences, <code>~i</code> is conveniently used to index from the end: <code>a[~i] == a[-1 - i]</code>.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ9">
              <p><strong>Q9: How do you swap two variables without a temporary variable in Python?</strong></p>
              <p><em>A: Use tuple packing and unpacking: <code>a, b = b, a</code>. Python creates a 2-tuple <code>(b, a)</code> on the right-hand side and unpacks it into <code>a</code> and <code>b</code> safely without collision.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ10">
              <p><strong>Q10: What is the difference between <code>and</code> / <code>or</code> and <code>&</code> / <code>|</code>?</strong></p>
              <p><em>A: <code>and</code> and <code>or</code> are logical operators that evaluate truthiness and support short-circuiting. <code>&</code> and <code>|</code> are bitwise operators that operate on integer bits eagerly without short-circuiting.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ11">
              <p><strong>Q11: Why does <code>True in [1, 2]</code> return <code>True</code>?</strong></p>
              <p><em>A: Because <code>bool</code> is a subclass of <code>int</code>, and <code>True == 1</code> is <code>True</code>. The <code>in</code> operator tests equality across elements, and since <code>1 == True</code>, Python matches the first element.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ12">
              <p><strong>Q12: How do you test if a number is a power of 2 using bitwise operators?</strong></p>
              <p><em>A: Use <code>(n > 0) and ((n & (n - 1)) == 0)</code>. A power of 2 has exactly one binary bit set (e.g. <code>8 = 1000_2</code>), and <code>n - 1</code> flips all bits below it (<code>7 = 0111_2</code>). Their bitwise AND is always 0.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ13">
              <p><strong>Q13: What does the ternary operator look like in Python?</strong></p>
              <p><em>A: <code>result = true_value if condition else false_value</code>. Unlike C's <code>cond ? a : b</code>, Python places the truth value first. It also short-circuits: only the branch corresponding to the condition is evaluated.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ14">
              <p><strong>Q14: Why can <code>None == None</code> be <code>True</code>, but <code>is</code> is still preferred?</strong></p>
              <p><em>A: <code>None == None</code> evaluates to <code>True</code>, but <code>==</code> invokes <code>__eq__()</code> on the left operand. If a custom class or library (such as a NumPy array) overrides <code>__eq__</code>, it may return an array of booleans instead of a single boolean, raising an exception in an <code>if</code> check. <code>is None</code> checks pointer identity directly.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ15">
              <p><strong>Q15: What is the result of <code>bool([] or () or {} or 0 or "Python")</code>?</strong></p>
              <p><em>A: The chained <code>or</code> operators evaluate sequentially. All operands up to <code>0</code> are falsy. <code>"Python"</code> is the first truthy value, so the expression evaluates to <code>"Python"</code>. Passing it to <code>bool("Python")</code> yields <code>True</code>.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ16">
              <p><strong>Q16: Can the walrus operator be used in an arbitrary expression?</strong></p>
              <p><em>A: Yes, but when used in nested expressions or arguments, it often requires surrounding parentheses: e.g. <code>print(x := 5)</code> instead of <code>print(x = 5)</code> (which is a syntax error because keyword arguments use <code>=</code>).</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ17">
              <p><strong>Q17: What does bitwise left shift (<code>1 &lt;&lt; n</code>) compute?</strong></p>
              <p><em>A: Shifting 1 left by $n$ bits is equivalent to computing $2^n$ in binary, but executes much faster at the hardware level. E.g., <code>1 &lt;&lt; 10 = 1024</code>.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ18">
              <p><strong>Q18: What is the result of <code>-7 % 3</code> in Python vs other languages?</strong></p>
              <p><em>A: In Python, <code>-7 % 3 == 2</code> because modulo always matches the sign of the divisor, satisfying <code>b * (a // b) + (a % b) == a</code> (where <code>-7 // 3 == -3</code>, and <code>3 * (-3) + 2 == -7</code>). In C/Java, <code>-7 % 3 == -1</code>.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ19">
              <p><strong>Q19: How do you check if a key exists in a dictionary using an operator?</strong></p>
              <p><em>A: Use the <code>in</code> operator: <code>if "key" in my_dict:</code>. This performs an $O(1)$ hash table lookup directly without constructing the <code>.keys()</code> list.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ20">
              <p><strong>Q20: Why does <code>[1, 2] == [1, 2]</code> return <code>True</code>, but <code>[1, 2] is [1, 2]</code> return <code>False</code>?</strong></p>
              <p><em>A: Each literal bracket <code>[1, 2]</code> allocates a distinct list object at a different memory address. <code>==</code> compares element values (which match), but <code>is</code> compares memory addresses (which differ).</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ21">
              <p><strong>Q21: What is the order of precedence between <code>not</code>, <code>and</code>, and <code>or</code>?</strong></p>
              <p><em>A: <code>not</code> has the highest precedence, followed by <code>and</code>, followed by <code>or</code>. Thus, <code>a or b and c</code> parses as <code>a or (b and c)</code>.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ22">
              <p><strong>Q22: How can bitwise XOR (<code>^</code>) be used to find a single non-duplicate number?</strong></p>
              <p><em>A: Since <code>x ^ x == 0</code> and <code>x ^ 0 == x</code>, XORing all numbers in an array where every number appears twice except one yields the unique number in $O(N)$ time and $O(1)$ space.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ23">
              <p><strong>Q23: How does Python evaluate <code>a &lt; b &gt; c</code>?</strong></p>
              <p><em>A: It evaluates as <code>(a &lt; b) and (b &gt; c)</code>. Both conditions must hold for the overall expression to be <code>True</code>.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ24">
              <p><strong>Q24: What happens when you use <code>*=</code> on a list containing nested lists like <code>[[0]] * 3</code>?</strong></p>
              <p><em>A: It creates a list with 3 references to the <strong>exact same inner list</strong>. Mutating <code>matrix[0][0] = 1</code> modifies all 3 sub-elements. Use a list comprehension instead: <code>[[0] for _ in range(3)]</code>.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay02IQ25">
              <p><strong>Q25: What is the return value of <code>0 and 1 / 0</code>?</strong></p>
              <p><em>A: It returns <code>0</code> without raising a <code>ZeroDivisionError</code> because the short-circuit evaluation of <code>and</code> sees that <code>0</code> is falsy and halts evaluation immediately.</em></p>
            </div>
          </div>
        </div>
        """
    }
]

# Define the 15 Practice Questions for Day 02
practice_questions = [
    {
        "id": 1,
        "prompt": "<strong>[Easy] BMI Metric Calculator & In-Place Assignment</strong><br/>Given weight in kilograms (<code>weight_kg = 78.5</code>) and height in meters (<code>height_m = 1.78</code>), compute Body Mass Index: <code>bmi = weight_kg / (height_m ** 2)</code>. Round to 2 decimal places and store in <code>bmi</code>.",
        "starterCode": """# Q1: Compute BMI metric
weight_kg = 78.5
height_m = 1.78

# TODO: Compute BMI rounded to 2 decimal places
bmi = None

print(f"BMI: {bmi}")
""",
        "ref": """weight_kg = 78.5
height_m = 1.78
bmi = round(weight_kg / (height_m ** 2), 2)
print(f"BMI: {bmi}")
""",
        "questionAudio": "Day02/New_PyDay02Question01.mp3",
        "solutionAudio": "Day02/New_PyDay02Question01sol.mp3"
    },
    {
        "id": 2,
        "prompt": "<strong>[Easy] Circular Array Indexing with Modulo</strong><br/>In streaming analytics, a rolling buffer of size <code>BUFFER_SIZE = 8</code> receives events with sequence numbers from 0 to 25. For event sequence <code>seq_num = 19</code>, compute its circular buffer slot index using modulo (<code>slot_idx</code>).",
        "starterCode": """# Q2: Compute circular buffer index
BUFFER_SIZE = 8
seq_num = 19

# TODO: Calculate circular slot index
slot_idx = None

print(f"Seq {seq_num} maps to buffer slot {slot_idx}")
""",
        "ref": """BUFFER_SIZE = 8
seq_num = 19
slot_idx = seq_num % BUFFER_SIZE
print(f"Seq {seq_num} maps to buffer slot {slot_idx}")
""",
        "questionAudio": "Day02/New_PyDay02Question02.mp3",
        "solutionAudio": "Day02/New_PyDay02Question02sol.mp3"
    },
    {
        "id": 3,
        "prompt": "<strong>[Easy] Sensor Range Validator with Chained Comparisons</strong><br/>A data pipeline receives temperature sensor reading <code>temp = 23.4</code> and humidity reading <code>humidity = 45.0</code>. Using chained comparisons, check that temperature is within <code>18.0 &lt;= temp &lt;= 26.0</code> and humidity is within <code>30.0 &lt;= humidity &lt;= 60.0</code>. Store the combined boolean result in <code>is_optimal</code>.",
        "starterCode": """# Q3: Validate sensor ranges with chained comparisons
temp = 23.4
humidity = 45.0

# TODO: Check both conditions using chained comparisons
is_optimal = None

print(f"Environment optimal: {is_optimal}")
""",
        "ref": """temp = 23.4
humidity = 45.0
is_optimal = (18.0 <= temp <= 26.0) and (30.0 <= humidity <= 60.0)
print(f"Environment optimal: {is_optimal}")
""",
        "questionAudio": "Day02/New_PyDay02Question03.mp3",
        "solutionAudio": "Day02/New_PyDay02Question03sol.mp3"
    },
    {
        "id": 4,
        "prompt": "<strong>[Easy] Default Value Fallback via Short-Circuit OR</strong><br/>Given user input <code>provided_currency = ''</code> and system default <code>DEFAULT_CURRENCY = 'USD'</code>, use the short-circuit <code>or</code> operator to assign <code>currency = provided_currency.strip() or DEFAULT_CURRENCY</code>. Test with empty string and <code>'EUR'</code>.",
        "starterCode": """# Q4: Short-circuit fallback assignment
DEFAULT_CURRENCY = 'USD'

user_input_1 = ''
user_input_2 = 'EUR'

# TODO: Assign using short-circuit 'or'
currency_1 = None
currency_2 = None

print(f"Currency 1: {currency_1} | Currency 2: {currency_2}")
""",
        "ref": """DEFAULT_CURRENCY = 'USD'
user_input_1 = ''
user_input_2 = 'EUR'

currency_1 = user_input_1.strip() or DEFAULT_CURRENCY
currency_2 = user_input_2.strip() or DEFAULT_CURRENCY

print(f"Currency 1: {currency_1} | Currency 2: {currency_2}")
""",
        "questionAudio": "Day02/New_PyDay02Question04.mp3",
        "solutionAudio": "Day02/New_PyDay02Question04sol.mp3"
    },
    {
        "id": 5,
        "prompt": "<strong>[Easy] Safe Division Guard using Short-Circuit AND</strong><br/>Write an expression that safely computes average transaction value: <code>avg_val = (tx_count != 0) and (total_revenue / tx_count)</code>. For <code>tx_count = 0</code> and <code>total_revenue = 50000.0</code>, verify that the expression returns <code>False</code> (or 0) without raising a <code>ZeroDivisionError</code>.",
        "starterCode": """# Q5: Defensive division guard
tx_count = 0
total_revenue = 50000.0

# TODO: Safe division using short-circuit 'and'
avg_val = None

print(f"Safe Avg: {avg_val}")
""",
        "ref": """tx_count = 0
total_revenue = 50000.0
avg_val = (tx_count != 0) and (total_revenue / tx_count)
print(f"Safe Avg: {avg_val}")
""",
        "questionAudio": "Day02/New_PyDay02Question05.mp3",
        "solutionAudio": "Day02/New_PyDay02Question05sol.mp3"
    },
    {
        "id": 6,
        "prompt": "<strong>[Medium] Exponentiation Associativity & Precedence</strong><br/>Demonstrate the right-associativity of <code>**</code>. Compute <code>res_default = 2 ** 3 ** 2</code> and <code>res_grouped = (2 ** 3) ** 2</code>. Store their difference (<code>res_default - res_grouped</code>) in <code>diff</code>.",
        "starterCode": """# Q6: Test exponentiation associativity
# TODO: Calculate res_default (2**3**2) and res_grouped ((2**3)**2)
res_default = None
res_grouped = None
diff = None

print(f"Default: {res_default} | Grouped: {res_grouped} | Diff: {diff}")
""",
        "ref": """res_default = 2 ** 3 ** 2
res_grouped = (2 ** 3) ** 2
diff = res_default - res_grouped
print(f"Default: {res_default} | Grouped: {res_grouped} | Diff: {diff}")
""",
        "questionAudio": "Day02/New_PyDay02Question06.mp3",
        "solutionAudio": "Day02/New_PyDay02Question06sol.mp3"
    },
    {
        "id": 7,
        "prompt": "<strong>[Medium] Fast Even/Odd & Power-of-Two Detection</strong><br/>Using bitwise operations only: (1) check if integer <code>n = 64</code> is even using <code>(n & 1) == 0</code>, storing in <code>is_even</code>; (2) check if <code>n</code> is a power of 2 using <code>(n > 0) and ((n & (n - 1)) == 0)</code>, storing in <code>is_power_of_two</code>.",
        "starterCode": """# Q7: Fast bitwise checks
n = 64

# TODO: Check is_even and is_power_of_two using bitwise operations
is_even = None
is_power_of_two = None

print(f"{n} is even: {is_even} | power of 2: {is_power_of_two}")
""",
        "ref": """n = 64
is_even = ((n & 1) == 0)
is_power_of_two = (n > 0) and ((n & (n - 1)) == 0)
print(f"{n} is even: {is_even} | power of 2: {is_power_of_two}")
""",
        "questionAudio": "Day02/New_PyDay02Question07.mp3",
        "solutionAudio": "Day02/New_PyDay02Question07sol.mp3"
    },
    {
        "id": 8,
        "prompt": "<strong>[Medium] Role-Based Permission Bitmask Checking</strong><br/>Given permission flags <code>READ = 1 << 0</code> (1), <code>WRITE = 1 << 1</code> (2), <code>DELETE = 1 << 2</code> (4), and <code>ADMIN = 1 << 3</code> (8). A user has <code>role_mask = READ | WRITE</code>. Verify if the user has <code>WRITE</code> permission (store in <code>can_write</code>) and if they have <code>DELETE</code> permission (store in <code>can_delete</code>).",
        "starterCode": """# Q8: Permission bitmask checking
READ   = 1 << 0
WRITE  = 1 << 1
DELETE = 1 << 2
ADMIN  = 1 << 3

role_mask = READ | WRITE

# TODO: Check can_write and can_delete booleans
can_write = None
can_delete = None

print(f"Can write: {can_write} | Can delete: {can_delete}")
""",
        "ref": """READ   = 1 << 0
WRITE  = 1 << 1
DELETE = 1 << 2
ADMIN  = 1 << 3

role_mask = READ | WRITE
can_write = bool(role_mask & WRITE)
can_delete = bool(role_mask & DELETE)
print(f"Can write: {can_write} | Can delete: {can_delete}")
""",
        "questionAudio": "Day02/New_PyDay02Question08.mp3",
        "solutionAudio": "Day02/New_PyDay02Question08sol.mp3"
    },
    {
        "id": 9,
        "prompt": "<strong>[Medium] Customer Tier Classifier with Ternary Expressions</strong><br/>Given a list of customer annual spend amounts: <code>spends = [1500, 12000, 4500, 25000, 800]</code>, classify each into a tier using an inline ternary expression: <code>'Platinum' if s >= 10000 else ('Gold' if s >= 3000 else 'Silver')</code>. Store the result list in <code>tiers</code>.",
        "starterCode": """# Q9: Multi-tier ternary classification
spends = [1500, 12000, 4500, 25000, 800]

# TODO: Build tiers list using ternary expressions
tiers = []

print("Customer Tiers:", tiers)
""",
        "ref": """spends = [1500, 12000, 4500, 25000, 800]
tiers = ['Platinum' if s >= 10000 else ('Gold' if s >= 3000 else 'Silver') for s in spends]
print("Customer Tiers:", tiers)
""",
        "questionAudio": "Day02/New_PyDay02Question09.mp3",
        "solutionAudio": "Day02/New_PyDay02Question09sol.mp3"
    },
    {
        "id": 10,
        "prompt": "<strong>[Medium] Singleton State Check: is None vs == None</strong><br/>A data cleaning function inspects missing values. Given <code>val = None</code>, compare <code>val is None</code> (store in <code>identity_check</code>) and <code>val == None</code> (store in <code>equality_check</code>). Write a comment explaining why <code>is None</code> is always preferred in production data pipelines.",
        "starterCode": """# Q10: Test None identity vs equality
val = None

# TODO: Store identity_check and equality_check booleans
identity_check = None
equality_check = None

print(f"is None: {identity_check} | == None: {equality_check}")
""",
        "ref": """val = None
identity_check = (val is None)
equality_check = (val == None)
print(f"is None: {identity_check} | == None: {equality_check}")
""",
        "questionAudio": "Day02/New_PyDay02Question10.mp3",
        "solutionAudio": "Day02/New_PyDay02Question10sol.mp3"
    },
    {
        "id": 11,
        "prompt": "<strong>[Medium] Stop-Word Query Filter with Membership Operator</strong><br/>Given user search query <code>query = 'best python course for data analysts in 2026'</code> and stop-word set <code>stop_words = {'for', 'in', 'the', 'a', 'of'}</code>, tokenize the query and filter out all words present in <code>stop_words</code> using the <code>not in</code> operator. Store the remaining tokens in <code>keywords</code>.",
        "starterCode": """# Q11: Filter keywords with 'not in'
query = 'best python course for data analysts in 2026'
stop_words = {'for', 'in', 'the', 'a', 'of'}

# TODO: Tokenize and filter stop-words
keywords = []

print("Keywords:", keywords)
""",
        "ref": """query = 'best python course for data analysts in 2026'
stop_words = {'for', 'in', 'the', 'a', 'of'}
tokens = query.lower().split()
keywords = [t for t in tokens if t not in stop_words]
print("Keywords:", keywords)
""",
        "questionAudio": "Day02/New_PyDay02Question11.mp3",
        "solutionAudio": "Day02/New_PyDay02Question11sol.mp3"
    },
    {
        "id": 12,
        "prompt": "<strong>[Medium] Walrus Operator Stream Consumer & Length Filter</strong><br/>Using the walrus operator (<code>:=</code>) inside a list comprehension, process a list of dirty strings: <code>lines = ['  hello  ', '   ', 'world of python', '  data  ']</code>. Strip each item and keep only those whose stripped length exceeds 4 characters. Store in <code>long_words</code>.",
        "starterCode": """# Q12: Walrus operator list comprehension
lines = ['  hello  ', '   ', 'world of python', '  data  ']

# TODO: Strip and filter len > 4 in a single pass using :=
long_words = []

print("Long words:", long_words)
""",
        "ref": """lines = ['  hello  ', '   ', 'world of python', '  data  ']
long_words = [cleaned for item in lines if len(cleaned := item.strip()) > 4]
print("Long words:", long_words)
""",
        "questionAudio": "Day02/New_PyDay02Question12.mp3",
        "solutionAudio": "Day02/New_PyDay02Question12sol.mp3"
    },
    {
        "id": 13,
        "prompt": "<strong>[Hard] Multi-Condition Credit Risk Scoring Engine</strong><br/>Evaluate loan applicants against strict credit criteria. An applicant qualifies for an automatic approval if: (1) <code>credit_score &gt;= 720</code> AND <code>debt_to_income &lt; 0.35</code>; OR (2) <code>credit_score &gt;= 680</code> AND <code>debt_to_income &lt; 0.25</code> AND <code>annual_income &gt;= 80000</code>. Evaluate for <code>applicant = {'credit_score': 690, 'debt_to_income': 0.22, 'annual_income': 95000}</code> and store the approval boolean in <code>is_approved</code>.",
        "starterCode": """# Q13: Multi-condition credit risk engine
applicant = {'credit_score': 690, 'debt_to_income': 0.22, 'annual_income': 95000}

# TODO: Formulate boolean expression with proper operator precedence & grouping
is_approved = None

print(f"Loan Approved: {is_approved}")
""",
        "ref": """applicant = {'credit_score': 690, 'debt_to_income': 0.22, 'annual_income': 95000}
c = applicant['credit_score']
d = applicant['debt_to_income']
i = applicant['annual_income']

is_approved = (c >= 720 and d < 0.35) or (c >= 680 and d < 0.25 and i >= 80000)
print(f"Loan Approved: {is_approved}")
""",
        "questionAudio": "Day02/New_PyDay02Question13.mp3",
        "solutionAudio": "Day02/New_PyDay02Question13sol.mp3"
    },
    {
        "id": 14,
        "prompt": "<strong>[Hard] Bitwise Flag Aggregator for User Access Matrix</strong><br/>Given a stream of user audit log events with bitwise flags: <code>LOG_LOGIN = 1</code>, <code>LOG_VIEW = 2</code>, <code>LOG_EDIT = 4</code>, <code>LOG_EXPORT = 8</code>. A session log records the sequence of actions: <code>actions = [LOG_LOGIN, LOG_VIEW, LOG_EDIT, LOG_EXPORT]</code>. Aggregate all actions into a single <code>session_mask</code> using the bitwise OR operator. Then verify whether <code>LOG_EXPORT</code> was triggered.",
        "starterCode": """LOG_LOGIN  = 1
LOG_VIEW   = 2
LOG_EDIT   = 4
LOG_EXPORT = 8

actions = [LOG_LOGIN, LOG_VIEW, LOG_EDIT, LOG_EXPORT]

# TODO: Aggregate actions into session_mask and verify did_export boolean
session_mask = 0
did_export = None

print(f"Session Mask: {bin(session_mask)} | Exported: {did_export}")
""",
        "ref": """LOG_LOGIN  = 1
LOG_VIEW   = 2
LOG_EDIT   = 4
LOG_EXPORT = 8

actions = [LOG_LOGIN, LOG_VIEW, LOG_EDIT, LOG_EXPORT]
session_mask = 0
for act in actions:
    session_mask |= act

did_export = bool(session_mask & LOG_EXPORT)
print(f"Session Mask: {bin(session_mask)} | Exported: {did_export}")
""",
        "questionAudio": "Day02/New_PyDay02Question14.mp3",
        "solutionAudio": "Day02/New_PyDay02Question14sol.mp3"
    },
    {
        "id": 15,
        "prompt": "<strong>[Hard] Walrus-Optimized High-Performance Aggregator</strong><br/>Given an iterator/stream of numbers: <code>data = [12, -4, 25, 0, 8, -15, 33]</code>, compute both the running count of positive numbers and their running sum in a single pass using the walrus operator inside a list comprehension. Produce a list of <code>(number, cumulative_positive_sum)</code> tuples for all positive entries. Store in <code>positive_cumulative</code>.",
        "starterCode": """data = [12, -4, 25, 0, 8, -15, 33]

# TODO: Build positive_cumulative list of (num, running_sum) tuples using :=
running_sum = 0
positive_cumulative = []

print("Positive Running Cumulative:", positive_cumulative)
""",
        "ref": """data = [12, -4, 25, 0, 8, -15, 33]
running_sum = 0
positive_cumulative = [(x, running_sum := running_sum + x) for x in data if x > 0]
print("Positive Running Cumulative:", positive_cumulative)
""",
        "questionAudio": "Day02/New_PyDay02Question15.mp3",
        "solutionAudio": "Day02/New_PyDay02Question15sol.mp3"
    }
]

# Assemble into final JS object
output_js = f"""// Python Day 02 — Operators & Expressions
if (!window.COURSE_CONTENT) window.COURSE_CONTENT = {{}};
window.COURSE_CONTENT['pyDay02'] = {{
  day: 2,
  title: "Operators & Expressions",
  emoji: "⚙️",

  slides: {json.dumps(slides_html, indent=4)},

  practiceQuestions: {json.dumps(practice_questions, indent=4)},

  {tq_block},

  topics: [
    {{ id: "topic-1", label: "01. Arithmetic & In-Place Assignment", slideIndex: 0 }},
    {{ id: "topic-2", label: "02. Comparison & Chaining Logic", slideIndex: 1 }},
    {{ id: "topic-3", label: "03. Logical & Short-Circuit", slideIndex: 2 }},
    {{ id: "topic-4", label: "04. Identity (is) vs Membership (in)", slideIndex: 3 }},
    {{ id: "topic-5", label: "05. Bitwise Operators & Masks", slideIndex: 4 }},
    {{ id: "topic-6", label: "06. Ternary, Precedence & Walrus", slideIndex: 5 }},
    {{ id: "topic-7", label: "07. Top 25 Interview Q&As", slideIndex: 6 }}
  ]
}};
"""

with open('public/python/content/py-day-02.js', 'w', encoding='utf-8') as f:
    f.write(output_js)

print("Successfully written public/python/content/py-day-02.js!")
