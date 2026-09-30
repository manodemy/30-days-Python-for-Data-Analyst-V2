"""
Generate public/python/content/py-day-01.js
Matches the 6-pillar gold standard of SQL Day 01-10.
"""

import json
import re

# Read existing test questions from py-day-01.js
with open('public/python/content/py-day-01.js', 'r', encoding='utf-8') as f:
    orig = f.read()

# Extract test questions block
m = re.search(r'(testQuestions:\s*\[.*?\]\s*,\s*(?:topics|slides|practiceQuestions|\}))', orig, re.DOTALL)
if not m:
    m = re.search(r'(testQuestions:\s*\[.*\])', orig, re.DOTALL)
tq_block = m.group(1) if m else 'testQuestions: []'
# Clean trailing comma or bracket
if tq_block.endswith('}'):
    tq_block = tq_block.rstrip('}').strip().rstrip(',')

print(f"Extracted testQuestions block length: {len(tq_block)}")

# Define the 7 Slides
slides_html = [
    # Slide 1: Numeric Types & Arbitrary Precision
    {
        "title": "01. Integers & Arbitrary Precision (int)",
        "duration": "8:30",
        "html": """
        <h2>🔢 01. Integers & Arbitrary Precision</h2>

        <div class="slide-section" id="day01IntSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">01. Python 3 PyLongObject: Unlimited Bit-Depth</h3>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio01.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>Unlike languages like C/Java where integers overflow at 32-bit (2.14B) or 64-bit limits, Python 3 integers have <strong>arbitrary precision</strong>. They expand dynamically in memory using C arrays of digits (<code>PyLongObject</code>), limited only by available RAM.</p>
        </div>

        <div class="slide-section" id="day01IntTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Integer Operations & Memory Characteristics</h4>
              <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio02.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Operation / Concept</th><th>Syntax</th><th>Example</th><th>Result / Complexity</th></tr></thead>
              <tbody>
                <tr><td>Arbitrary Exponentiation</td><td><code>base ** exp</code></td><td><code>2 ** 100</code></td><td><code>1267650600228229401496703205376</code></td></tr>
                <tr><td>Floor Division</td><td><code>a // b</code></td><td><code>17 // 5</code> vs <code>-7 // 2</code></td><td><code>3</code> vs <code>-4</code> (floors towards -&infin;)</td></tr>
                <tr><td>Modulo / Remainder</td><td><code>a % b</code></td><td><code>17 % 5</code></td><td><code>2</code> (always satisfies <code>b*(a//b) + a%b == a</code>)</td></tr>
                <tr><td>Bit Length Inspection</td><td><code>n.bit_length()</code></td><td><code>(1024).bit_length()</code></td><td><code>11</code> bits</td></tr>
                <tr><td>Memory Overhead</td><td><code>sys.getsizeof()</code></td><td><code>sys.getsizeof(0)</code></td><td><code>28</code> bytes base object overhead</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day01IntCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Integer Arithmetic & Currency Splitting Example</h4>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio03.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code><span class="code-comment"># 1. Arbitrary precision integer calculation without overflow</span>
gross_cents = 894523098745234987234
dollars = gross_cents // 100
remaining_cents = gross_cents % 100
print(f"Dollars: {dollars:,} | Cents: {remaining_cents}")

<span class="code-comment"># 2. Integer division trap with negatives:</span>
print(7 // 2)   <span class="code-comment"># Output: 3  (truncated towards -inf)</span>
print(-7 // 2)  <span class="code-comment"># Output: -4 (NOT -3! Always rounds DOWN)</span></code></pre>
            </div>
          </div>
        </div>

        <div class="slide-section" id="day01IntWarnSection">
          <div class="warn-box">
            <div style="display:flex;align-items:center;gap:8px;margin-bottom:6px;width:100%;">
              <strong style="color:var(--ink-neg);flex:1;">⚠️ Negative Floor Division Trap:</strong>
              <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio04.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p>In C/Java, integer division rounds toward zero (<code>-7 / 2 = -3</code>). In Python, <code>//</code> is <strong>floor division</strong> (rounds towards negative infinity), so <code>-7 // 2 = -4</code>. To truncate towards zero in Python, use <code>int(-7 / 2)</code>.</p>
          </div>
        </div>
        """
    },

    # Slide 2: Floating Point Numbers & Precision Traps
    {
        "title": "02. Floats & Precision Traps (float)",
        "duration": "9:15",
        "html": """
        <h2>📐 02. Floats, IEEE-754 & Precision Traps</h2>

        <div class="slide-section" id="day01FloatSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">02. IEEE-754 Double Precision Representation</h3>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio05.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>Python floats are 64-bit IEEE-754 double precision floats (1 sign bit, 11 exponent bits, 53 mantissa bits). Because binary cannot represent fractions like <code>1/10</code> exactly, numbers like <code>0.1</code> are periodic binary fractions, leading to floating-point rounding errors.</p>
        </div>

        <div class="slide-section" id="day01FloatTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Float Traps & Safe Comparison Toolkit</h4>
              <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio06.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Pattern</th><th>Unsafe Code</th><th>Safe Replacement</th><th>Reasoning</th></tr></thead>
              <tbody>
                <tr><td>Equality Check</td><td><code>0.1 + 0.2 == 0.3</code> &rarr; <code>False</code></td><td><code>math.isclose(0.1 + 0.2, 0.3)</code></td><td>Relative tolerance (&epsilon; = 1e-9)</td></tr>
                <tr><td>Banker's Rounding</td><td><code>round(2.5)</code> &rarr; <code>2</code></td><td><code>decimal.Decimal(x).quantize()</code></td><td>Python rounds half to even integer</td></tr>
                <tr><td>Infinity Guard</td><td><code>val > 999999999</code></td><td><code>float('inf')</code> / <code>float('-inf')</code></td><td>Standard representation for unbounded limits</td></tr>
                <tr><td>NaN (Not a Number)</td><td><code>x == float('nan')</code> &rarr; <code>False</code></td><td><code>math.isnan(x)</code></td><td>NaN is never equal to itself (IEEE-754)</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day01FloatCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Financial Calculations: Floats vs Decimal</h4>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio07.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code><span class="kw">import</span> math
<span class="kw">from</span> decimal <span class="kw">import</span> Decimal

<span class="code-comment"># 1. The classic float trap:</span>
total = 0.1 + 0.2
print(f"Total: {total:.17f}") <span class="code-comment"># 0.30000000000000004</span>
print(math.isclose(total, 0.3)) <span class="code-comment"># True</span>

<span class="code-comment"># 2. Financial precision with Decimal:</span>
price = Decimal('19.99')
tax_rate = Decimal('0.0825')
tax = (price * tax_rate).quantize(Decimal('0.01'))
print(f"Exact Tax: ${tax}") <span class="code-comment"># Exact $1.65</span></code></pre>
            </div>
          </div>
        </div>

        <div class="slide-section" id="day01FloatInfoSection">
          <div class="info-box">
            <div style="display:flex;align-items:center;gap:8px;margin-bottom:6px;width:100%;">
              <strong style="color:var(--ink-teal);flex:1;">ℹ️ Data Analyst Pro-Tip: Banker's Rounding</strong>
              <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio08.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p>Python's built-in <code>round()</code> uses <strong>round-half-to-even</strong> (Banker's rounding). E.g., <code>round(2.5) == 2</code> and <code>round(3.5) == 4</code>. This minimizes statistical bias when summing large financial datasets.</p>
          </div>
        </div>
        """
    },

    # Slide 3: Strings & Unicode
    {
        "title": "03. Strings, Immutability & Slicing (str)",
        "duration": "10:10",
        "html": """
        <h2>📝 03. Strings (str) — Immutability & PEP 393</h2>

        <div class="slide-section" id="day01StrSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">03. Compact Unicode Representation (PEP 393)</h3>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio09.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>Python 3 strings are <strong>immutable sequences of Unicode codepoints</strong>. Under PEP 393, Python chooses the most compact encoding in memory: 1 byte/char (Latin-1), 2 bytes/char (UCS-2), or 4 bytes/char (UCS-4) depending on the highest codepoint in the text.</p>
        </div>

        <div class="slide-section" id="day01StrTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Slicing & String Methods Matrix</h4>
              <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio10.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Operation</th><th>Syntax</th><th>Example</th><th>Performance Note</th></tr></thead>
              <tbody>
                <tr><td>Reversal Slice</td><td><code>s[::-1]</code></td><td><code>"analytics"[::-1]</code> &rarr; <code>"scitylana"</code></td><td>Fast C-level memory copy ($O(N)$)</td></tr>
                <tr><td>Sub-slice extraction</td><td><code>s[start:stop:step]</code></td><td><code>"2026-09-28"[:4]</code> &rarr; <code>"2026"</code></td><td>Creates a brand new string object</td></tr>
                <tr><td>Batch Concatenation</td><td><code>delimiter.join(list)</code></td><td><code>", ".join(names)</code></td><td>Pre-allocates buffer ($O(N)$ vs $O(N^2)$ for <code>+=</code>)</td></tr>
                <tr><td>Whitespace & Cleanup</td><td><code>s.strip().title()</code></td><td><code>"  aarav sharma ".strip().title()</code></td><td>Removes padding & capitalizes words</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day01StrCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Log Parsing & Efficient Concatenation</h4>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio11.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code>log_entry = "2026-09-28 14:32:10 [ERROR] 500 /api/checkout User 10482 timeout"

<span class="code-comment"># Fast slicing and string partitioning:</span>
timestamp = log_entry[:19]
status_code = log_entry.split()[3]
endpoint = log_entry.split()[4]
print(f"Timestamp: {timestamp} | Status: {status_code} | Path: {endpoint}")

<span class="code-comment"># Memory-safe joining of 100k records:</span>
parts = ["txn_" + str(i) <span class="kw">for</span> i <span class="kw">in</span> range(5)]
joined = "|".join(parts) <span class="code-comment"># O(N) allocation</span></code></pre>
            </div>
          </div>
        </div>
        """
    },

    # Slide 4: Booleans & Truthiness Matrix
    {
        "title": "04. Booleans & Truthiness (bool, None)",
        "duration": "8:50",
        "html": """
        <h2>⚖️ 04. Booleans (bool) & Truthiness Matrix</h2>

        <div class="slide-section" id="day01BoolSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">04. Boolean as Subclass of Int & The NoneType Singleton</h3>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio12.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>In Python, <code>bool</code> is a direct subclass of <code>int</code> (<code>issubclass(bool, int) is True</code>). <code>True</code> has value <code>1</code> and <code>False</code> has value <code>0</code>. Meanwhile, <code>None</code> is a singleton object representing the absence of value (like SQL <code>NULL</code>).</p>
        </div>

        <div class="slide-section" id="day01BoolTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">The Definitive Truthiness Matrix</h4>
              <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio13.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Category</th><th>Falsy Values (evaluates to False)</th><th>Truthy Values (evaluates to True)</th></tr></thead>
              <tbody>
                <tr><td>Constants</td><td><code>None</code>, <code>False</code></td><td><code>True</code></td></tr>
                <tr><td>Numerics</td><td><code>0</code>, <code>0.0</code>, <code>0j</code>, <code>Decimal(0)</code></td><td>Any non-zero (<code>-1</code>, <code>0.0001</code>, <code>42</code>)</td></tr>
                <tr><td>Sequences</td><td><code>""</code> (empty str), <code>[]</code>, <code>()</code>, <code>b""</code></td><td>Non-empty (<code>" "</code> whitespace, <code>[0]</code>, <code>(False,)</code>)</td></tr>
                <tr><td>Mappings / Sets</td><td><code>{}</code> (empty dict), <code>set()</code></td><td><code>{"k": None}</code>, <code>{0}</code></td></tr>
                <tr><td>Identity Check</td><td><code>x is None</code> (checks singleton pointer)</td><td><code>x is not None</code></td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day01BoolWarnSection">
          <div class="warn-box">
            <div style="display:flex;align-items:center;gap:8px;margin-bottom:6px;width:100%;">
              <strong style="color:var(--ink-neg);flex:1;">⚠️ Identity (is) vs Equality (==) & None Checking:</strong>
              <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio14.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <p>Always write <code>if val is None:</code>, NEVER <code>if val == None:</code>. <code>is</code> tests memory identity (same C pointer, $O(1)$). <code>==</code> calls <code>__eq__()</code> which can be overridden by custom classes (like NumPy arrays or Pandas Series) causing unexpected crashes.</p>
          </div>
        </div>
        """
    },

    # Slide 5: Sequences (List vs Tuple)
    {
        "title": "05. Sequences: List vs Tuple (list, tuple)",
        "duration": "10:45",
        "html": """
        <h2>📦 05. Sequences: List vs Tuple Memory Mechanics</h2>

        <div class="slide-section" id="day01SeqSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">05. Dynamic Arrays vs Fixed-Size Tuples</h3>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio15.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>A Python <code>list</code> is a <strong>dynamically resized array of object pointers</strong>. To make <code>append()</code> amortized $O(1)$, Python over-allocates memory slots. In contrast, a <code>tuple</code> is <strong>immutable and fixed-size</strong>, eliminating resizing overhead and allowing CPython to cache small tuples.</p>
        </div>

        <div class="slide-section" id="day01SeqTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">List vs Tuple Architectural Comparison</h4>
              <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio16.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Dimension</th><th>List (<code>[]</code>)</th><th>Tuple (<code>()</code>)</th><th>Namedtuple (<code>namedtuple</code>)</th></tr></thead>
              <tbody>
                <tr><td>Mutability</td><td>Mutable (in-place modification)</td><td>Immutable (frozen at creation)</td><td>Immutable with named field access</td></tr>
                <tr><td>Memory Overhead</td><td>High (over-allocates buffer: 4, 8, 16...)</td><td>Minimal (exact size: 40 + 8&times;N bytes)</td><td>Identical to tuple + attribute dict</td></tr>
                <tr><td>Hashability</td><td>Unhashable (cannot be dict key)</td><td>Hashable (if all items are hashable)</td><td>Hashable (great for composite keys)</td></tr>
                <tr><td>Primary Use Case</td><td>Collections of homogenous items</td><td>Heterogeneous fixed records (row tuples)</td><td>Clean domain models & DB records</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day01SeqCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Memory Footprint & Shallow vs Deep Copy</h4>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio17.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code><span class="kw">import</span> sys, copy

items = [1, 2, 3, 4, 5]
as_tuple = (1, 2, 3, 4, 5)
print(f"List bytes: {sys.getsizeof(items)} | Tuple bytes: {sys.getsizeof(as_tuple)}")

<span class="code-comment"># Shallow copy vs Deep copy trap:</span>
dept_budgets = {"Finance": [50000, 75000]}
shallow = dept_budgets.copy()
deep = copy.deepcopy(dept_budgets)

shallow["Finance"].append(90000) <span class="code-comment"># Mutates original nested list!</span>
print("Original:", dept_budgets["Finance"]) <span class="code-comment"># [50000, 75000, 90000]</span>
print("Deep Copy:", deep["Finance"])          <span class="code-comment"># [50000, 75000] (Safe)</span></code></pre>
            </div>
          </div>
        </div>
        """
    },

    # Slide 6: Hash Tables (Set & Dict)
    {
        "title": "06. Hash Tables: Set & Dict (set, dict)",
        "duration": "11:15",
        "html": """
        <h2>⚡ 06. Hash Tables: Set & Dict O(1) Architecture</h2>

        <div class="slide-section" id="day01HashSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
            <h3 style="margin:0;font-size:1.05rem;font-weight:800;flex:1;">06. Open Addressing & Hash Collision Mechanics</h3>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio18.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <p>Both <code>set</code> and <code>dict</code> are backed by <strong>open addressing hash tables with perturbation probe sequences</strong>. Membership testing (<code>x in s</code>) is average $O(1)$ compared to $O(N)$ for lists. Since Python 3.7+, dictionaries guarantee <strong>insertion ordering</strong> with a compact array layout.</p>
        </div>

        <div class="slide-section" id="day01HashTableSection">
          <div class="db-mock-table-wrap">
            <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:6px;padding:0 4px;">
              <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Set Algebra & Fast Lookups Reference</h4>
              <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio19.mp3', this)" title="Play narration">
                <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
              </button>
            </div>
            <table class="db-table-mock db-table-mock--compact">
              <thead><tr><th>Operation</th><th>Operator</th><th>Method</th><th>Analyst Use Case</th></tr></thead>
              <tbody>
                <tr><td>Union</td><td><code>A | B</code></td><td><code>A.union(B)</code></td><td>All unique active users across two platforms</td></tr>
                <tr><td>Intersection</td><td><code>A & B</code></td><td><code>A.intersection(B)</code></td><td>Retained customers active in both Jan and Feb</td></tr>
                <tr><td>Difference</td><td><code>A - B</code></td><td><code>A.difference(B)</code></td><td>Churned users (active in Jan but NOT Feb)</td></tr>
                <tr><td>Symmetric Diff</td><td><code>A ^ B</code></td><td><code>A.symmetric_difference(B)</code></td><td>Customers active in exactly one of the months</td></tr>
                <tr><td>Grouping Dict</td><td>&mdash;</td><td><code>collections.defaultdict(list)</code></td><td>Group transaction records by customer ID</td></tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="slide-section" id="day01HashCodeSection">
          <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:6px;margin-top:8px;">
            <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">High-Speed Churn Analysis with Sets</h4>
            <button class="audio-play-btn" onclick="playAudio('Day01/New_PyDay01Audio20.mp3', this)" title="Play narration">
              <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
            </button>
          </div>
          <div class="code-block-container">
            <div class="code-subblock">
              <pre><code>jan_users = {"usr_101", "usr_102", "usr_103", "usr_104"}
feb_users = {"usr_103", "usr_104", "usr_105", "usr_106"}

retained = jan_users & feb_users <span class="code-comment"># {"usr_103", "usr_104"}</span>
churned  = jan_users - feb_users <span class="code-comment"># {"usr_101", "usr_102"}</span>
new_acq  = feb_users - jan_users <span class="code-comment"># {"usr_105", "usr_106"}</span>

print(f"Retained: {len(retained)} | Churned: {len(churned)} | New: {len(new_acq)}")</code></pre>
            </div>
          </div>
        </div>
        """
    },

    # Slide 7: Top 25 Interview Questions
    {
        "title": "07. Top 25 Interview Q&As: Data Types & Memory",
        "duration": "14:20",
        "html": """
        <h2>🎯 07. Top 25 FAANG & Fintech Interview Q&As</h2>

        <div class="slide-section" id="day01InterviewIntroSection">
          <p>These 25 interview questions test real-world depth on Python data types, memory layout, hashability, and performance trade-offs commonly asked by FAANG, hedge funds, and top data engineering teams.</p>
        </div>

        <div class="slide-section" id="day01InterviewCardsSection">
          <div class="interview-box">
            <h4>💡 Core Python Data Types & Memory Architecture</h4>

            <div id="pyDay01IQ1">
              <p><strong>Q1: What is the difference between <code>is</code> and <code>==</code> in Python?</strong></p>
              <p><em>A: <code>is</code> checks for identity (whether both variables point to the exact same memory address in RAM, tested via <code>id(a) == id(b)</code>). <code>==</code> checks for equality (whether the values are equivalent, determined by calling <code>a.__eq__(b)</code>).</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ2">
              <p><strong>Q2: Why does <code>a = 256; b = 256; a is b</code> return <code>True</code>, but <code>a = 257; b = 257; a is b</code> may return <code>False</code>?</strong></p>
              <p><em>A: CPython pre-allocates an internal integer cache for numbers between <code>-5</code> and <code>256</code> at startup. Any reference in this range reuses the singleton objects. Numbers outside this range create separate <code>PyLongObject</code> instances in memory unless interned by the compiler in the same code object.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ3">
              <p><strong>Q3: Why can a <code>list</code> not be used as a dictionary key or set element?</strong></p>
              <p><em>A: Dictionary keys and set elements must be <strong>hashable</strong> (must implement <code>__hash__()</code> that returns an invariant integer for its lifetime and implement <code>__eq__()</code>). Because lists are mutable, their contents can change, which would corrupt the hash bucket index. Use an immutable <code>tuple</code> or <code>frozenset</code> instead.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ4">
              <p><strong>Q4: What is the memory layout difference between a <code>list</code> and a <code>tuple</code>?</strong></p>
              <p><em>A: A tuple is fixed-size at allocation; its memory is exact (40 bytes header + 8 bytes per pointer on 64-bit systems). A list is a dynamic array that over-allocates growth headroom (e.g. 0, 4, 8, 16, 25 slots) to provide amortized $O(1)$ appends, incurring higher memory overhead.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ5">
              <p><strong>Q5: What happens when you do <code>0.1 + 0.2 == 0.3</code>, and how should data analysts compare floats?</strong></p>
              <p><em>A: It returns <code>False</code> because 0.1 and 0.2 cannot be represented with finite binary bits in IEEE-754 double precision (yielding <code>0.30000000000000004</code>). Always compare using <code>math.isclose(a, b, rel_tol=1e-9)</code> or use the <code>decimal.Decimal</code> class for monetary calculations.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ6">
              <p><strong>Q6: What is the difference between a shallow copy and a deep copy?</strong></p>
              <p><em>A: A shallow copy (e.g. <code>list.copy()</code>, <code>dict.copy()</code>, or <code>[:]</code>) creates a new outer container but copies references to the nested child objects. Mutating a nested list in the copy mutates the original. A deep copy (<code>copy.deepcopy()</code>) recursively duplicates all nested objects.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ7">
              <p><strong>Q7: Why is <code>"".join(list_of_strings)</code> preferred over string concatenation in a loop (<code>+=</code>)?</strong></p>
              <p><em>A: Strings are immutable. In a loop, <code>s += token</code> creates a brand new string and copies all previous characters each iteration, yielding $O(N^2)$ time complexity. <code>"".join()</code> pre-calculates the exact required buffer size in memory and copies characters once, executing in $O(N)$ time.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ8">
              <p><strong>Q8: What is Banker's Rounding and why does Python use it?</strong></p>
              <p><em>A: Python's <code>round()</code> rounds half to the nearest even number (e.g., <code>round(2.5) == 2</code> and <code>round(3.5) == 4</code>). This eliminates cumulative upward rounding bias in large-scale data aggregations.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ9">
              <p><strong>Q9: How are Python dictionaries implemented under the hood in Python 3.7+?</strong></p>
              <p><em>A: Modern dicts use two arrays: a sparse hash index table of indices and a dense table containing <code>[hash, key, value]</code> entries. This compact layout saves ~30% memory compared to legacy hash tables and naturally preserves insertion order.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ10">
              <p><strong>Q10: What is the time complexity of <code>x in my_list</code> vs <code>x in my_set</code>?</strong></p>
              <p><em>A: <code>x in my_list</code> is $O(N)$ because it performs a linear sequential scan from index 0. <code>x in my_set</code> is average $O(1)$ because it computes <code>hash(x)</code> and inspects the hash bucket directly.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ11">
              <p><strong>Q11: Can a tuple contain mutable elements? Is such a tuple hashable?</strong></p>
              <p><em>A: Yes, a tuple can hold mutable elements like <code>t = (1, [2, 3])</code>. However, such a tuple is <strong>unhashable</strong> (calling <code>hash(t)</code> raises <code>TypeError: unhashable type: 'list'</code>), meaning it cannot be used as a dict key or set element.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ12">
              <p><strong>Q12: Why should you never use mutable default arguments like <code>def func(data=[]):</code>?</strong></p>
              <p><em>A: Default arguments are evaluated once at function definition time, not at invocation. All function calls that omit the argument share the exact same list instance in memory. Use <code>data=None</code> and initialize inside: <code>if data is None: data = []</code>.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ13">
              <p><strong>Q13: What is the difference between <code>collections.defaultdict</code> and <code>dict.setdefault()</code>?</strong></p>
              <p><em>A: <code>defaultdict(factory)</code> automatically initializes missing keys on access using the factory function without raising <code>KeyError</code>. <code>dict.setdefault(k, default)</code> sets the value if missing and returns it, but the default expression is eagerly evaluated on every call, even if the key exists.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ14">
              <p><strong>Q14: What is the purpose of <code>frozenset</code>?</strong></p>
              <p><em>A: A <code>frozenset</code> is an immutable variant of a <code>set</code>. Because it cannot be modified after creation, it implements <code>__hash__()</code>, allowing it to be used as a dictionary key or an element inside another set.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ15">
              <p><strong>Q15: How does Python evaluate truthiness when testing <code>if obj:</code>?</strong></p>
              <p><em>A: Python first checks if <code>obj.__bool__()</code> is implemented and uses its boolean return. If not implemented, it checks <code>obj.__len__()</code> (returning <code>False</code> if length is 0, <code>True</code> otherwise). If neither is defined, the object is considered truthy.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ16">
              <p><strong>Q16: What is string interning and when does Python perform it automatically?</strong></p>
              <p><em>A: String interning ensures that only one copy of distinct string values is stored in memory. Python automatically interns strings that look like Python identifiers (ASCII letters, digits, underscores) at compile time. You can force interning with <code>sys.intern()</code>.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ17">
              <p><strong>Q17: What does <code>sys.getsizeof()</code> return, and what does it NOT include?</strong></p>
              <p><em>A: <code>sys.getsizeof()</code> returns the memory consumed by the container object itself plus its internal pointer buffer. It does <strong>not</strong> include the memory of the referenced objects (e.g. elements inside a list or values in a dictionary).</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ18">
              <p><strong>Q18: What is the difference between <code>list.sort()</code> and <code>sorted(iterable)</code>?</strong></p>
              <p><em>A: <code>list.sort()</code> modifies the list in place and returns <code>None</code> (memory-efficient $O(1)$ extra space). <code>sorted()</code> accepts any iterable (tuple, set, generator, dict) and builds a brand new sorted list in memory ($O(N)$ extra space).</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ19">
              <p><strong>Q19: Explain why <code>type(True)</code> is <code>bool</code>, but <code>isinstance(True, int)</code> is also <code>True</code>.</strong></p>
              <p><em>A: In Python, <code>class bool(int):</code>. Because <code>bool</code> inherits from <code>int</code>, every boolean instance is also an integer. Hence, <code>True + True == 2</code> and <code>isinstance(True, int)</code> is <code>True</code>, but <code>type()</code> checks the exact class.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ20">
              <p><strong>Q20: What is the difference between <code>del a[0]</code>, <code>a.pop(0)</code>, and <code>a.remove(x)</code>?</strong></p>
              <p><em>A: <code>del a[0]</code> deletes by index and discards the value ($O(N)$ shift). <code>a.pop(0)</code> deletes by index and returns the removed element ($O(N)$ shift). <code>a.remove(x)</code> searches for the first occurrence of value <code>x</code> ($O(N)$ search) and removes it ($O(N)$ shift).</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ21">
              <p><strong>Q21: How do you safely check if a float is <code>NaN</code>?</strong></p>
              <p><em>A: Use <code>math.isnan(x)</code>. You cannot check <code>x == float('nan')</code> because IEEE-754 dictates that NaN is never equal to any value, including itself (<code>float('nan') == float('nan')</code> is <code>False</code>). Alternatively, <code>x != x</code> is only true for NaN.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ22">
              <p><strong>Q22: What is the advantage of <code>collections.namedtuple</code> over a regular <code>dict</code> for row data?</strong></p>
              <p><em>A: A <code>namedtuple</code> has zero per-instance dictionary overhead (no <code>__dict__</code>). It has the compact memory footprint of a tuple while offering readable attribute access (<code>row.salary</code> instead of <code>row['salary']</code>), saving megabytes of RAM across large tabular datasets.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ23">
              <p><strong>Q23: How does Python's memory management handle cyclic references?</strong></p>
              <p><em>A: Python primarily uses <strong>reference counting</strong> for immediate deallocation when refcount reaches 0. To handle cyclic references (where object A references B and B references A), CPython runs a generational cyclic garbage collector (gc module) that detects unreachable reference loops.</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ24">
              <p><strong>Q24: What is the difference between <code>extend()</code> and <code>append()</code> on a list?</strong></p>
              <p><em>A: <code>append(item)</code> adds the argument as a single element to the end of the list (e.g. <code>[1].append([2, 3]) &rarr; [1, [2, 3]]</code>). <code>extend(iterable)</code> iterates through the argument and appends each element individually (e.g. <code>[1].extend([2, 3]) &rarr; [1, 2, 3]</code>).</em></p>
            </div>
            <hr style="border:none;border-top:1px dashed #475569;margin:10px 0;" />

            <div id="pyDay01IQ25">
              <p><strong>Q25: What is the time complexity of inserting at the beginning of a <code>list</code> vs a <code>collections.deque</code>?</strong></p>
              <p><em>A: Inserting at index 0 of a list (<code>list.insert(0, x)</code>) requires shifting all $N$ elements right in memory, taking $O(N)$ time. A <code>deque</code> is implemented as a doubly linked list of fixed blocks, allowing $O(1)$ constant time appends and pops from both ends.</em></p>
            </div>
          </div>
        </div>
        """
    }
]

# Define the 15 Practice Questions
practice_questions = [
    {
        "id": 1,
        "prompt": "<strong>[Easy] Currency Denomination Breakdown</strong><br/>Given a payment amount in cents: <code>cents = 48729</code>, calculate the total whole dollars (<code>dollars</code>) using floor division and the remaining leftover cents (<code>remaining_cents</code>) using the modulo operator.",
        "starterCode": """# Q1: Compute whole dollars and remaining cents
cents = 48729

# TODO: Compute dollars using // and remaining_cents using %
dollars = None
remaining_cents = None

print(f"Dollars: {dollars}, Cents: {remaining_cents}")
""",
        "ref": """cents = 48729
dollars = cents // 100
remaining_cents = cents % 100
print(f"Dollars: {dollars}, Cents: {remaining_cents}")
""",
        "questionAudio": "Day01/New_PyDay01Question01.mp3",
        "solutionAudio": "Day01/New_PyDay01Question01sol.mp3"
    },
    {
        "id": 2,
        "prompt": "<strong>[Easy] Financial Float Precision & Epsilon Check</strong><br/>A billing calculation adds <code>0.1 + 0.2</code>. Using <code>math.isclose()</code> with a relative tolerance of <code>1e-9</code>, verify whether the sum matches <code>0.3</code>. Store the boolean result in <code>is_accurate</code>.",
        "starterCode": """import math

# Q2: Verify float precision with math.isclose()
sum_val = 0.1 + 0.2
expected = 0.3

# TODO: Store boolean in is_accurate
is_accurate = None

print(f"Direct == check: {sum_val == expected}")
print(f"math.isclose: {is_accurate}")
""",
        "ref": """import math

sum_val = 0.1 + 0.2
expected = 0.3
is_accurate = math.isclose(sum_val, expected, rel_tol=1e-9)
print(f"Direct == check: {sum_val == expected}")
print(f"math.isclose: {is_accurate}")
""",
        "questionAudio": "Day01/New_PyDay01Question02.mp3",
        "solutionAudio": "Day01/New_PyDay01Question02sol.mp3"
    },
    {
        "id": 3,
        "prompt": "<strong>[Easy] Customer Name Sanitization</strong><br/>Given a messy user input string: <code>raw_name = '   vIkrAm nAir  '</code>, produce a clean version: strip surrounding whitespace, title-case words, and store in <code>clean_name</code>. Then extract initials in uppercase as <code>initials</code> (e.g. <code>'VN'</code>).",
        "starterCode": """# Q3: Sanitize customer name and extract initials
raw_name = '   vIkrAm nAir  '

# TODO: Create clean_name (title case, stripped) and initials (e.g. 'VN')
clean_name = None
initials = None

print(f"Clean: '{clean_name}', Initials: '{initials}'")
""",
        "ref": """raw_name = '   vIkrAm nAir  '
clean_name = raw_name.strip().title()
parts = clean_name.split()
initials = "".join([p[0].upper() for p in parts])
print(f"Clean: '{clean_name}', Initials: '{initials}'")
""",
        "questionAudio": "Day01/New_PyDay01Question03.mp3",
        "solutionAudio": "Day01/New_PyDay01Question03sol.mp3"
    },
    {
        "id": 4,
        "prompt": "<strong>[Easy] Log Line Slicing & Parsing</strong><br/>Given an access log line: <code>log = '2026-09-28 [ERROR] 503 /checkout 124ms'</code>, extract the date (<code>log_date</code>, first 10 chars), the log severity level without brackets (<code>severity</code>, e.g. <code>'ERROR'</code>), and the HTTP status code as an integer (<code>status_code</code>).",
        "starterCode": """# Q4: Slice and parse access log
log = '2026-09-28 [ERROR] 503 /checkout 124ms'

# TODO: Extract log_date, severity, and status_code (as int)
log_date = None
severity = None
status_code = None

print(f"Date: {log_date} | Level: {severity} | Status: {status_code}")
""",
        "ref": """log = '2026-09-28 [ERROR] 503 /checkout 124ms'
tokens = log.split()
log_date = log[:10]
severity = tokens[1].strip('[]')
status_code = int(tokens[2])
print(f"Date: {log_date} | Level: {severity} | Status: {status_code}")
""",
        "questionAudio": "Day01/New_PyDay01Question04.mp3",
        "solutionAudio": "Day01/New_PyDay01Question04sol.mp3"
    },
    {
        "id": 5,
        "prompt": "<strong>[Easy] Truthiness Guard: Dirty Record Filtering</strong><br/>Given a list of customer phone numbers containing empty strings, whitespace, and <code>None</code>: <code>phones = ['9876543210', '', '  ', None, '9123456789', False]</code>, filter out all falsy or blank entries. Store the list of valid stripped string phone numbers in <code>valid_phones</code>.",
        "starterCode": """# Q5: Filter valid phone numbers using truthiness
phones = ['9876543210', '', '  ', None, '9123456789', False]

# TODO: Filter valid non-empty string phone numbers
valid_phones = []

print("Valid Phones:", valid_phones)
""",
        "ref": """phones = ['9876543210', '', '  ', None, '9123456789', False]
valid_phones = [p.strip() for p in phones if isinstance(p, str) and p.strip()]
print("Valid Phones:", valid_phones)
""",
        "questionAudio": "Day01/New_PyDay01Question05.mp3",
        "solutionAudio": "Day01/New_PyDay01Question05sol.mp3"
    },
    {
        "id": 6,
        "prompt": "<strong>[Medium] Integer Interning & Identity Inspector</strong><br/>Inspect Python's small integer caching. Create two variables <code>x = 256</code> and <code>y = 256</code>, then <code>p = 257</code> and <code>q = 257</code>. Store whether <code>x is y</code> in <code>cached_identity</code>, and whether <code>id(p) == id(q)</code> in <code>uncached_identity</code>.",
        "starterCode": """# Q6: Test integer interning threshold
x = 256
y = 256
p = 257
q = 257

# TODO: Store boolean identity checks
cached_identity = None
uncached_identity = None

print(f"256 identity: {cached_identity} | 257 identity: {uncached_identity}")
""",
        "ref": """x = 256
y = 256
p = 257
q = 257
cached_identity = (x is y)
uncached_identity = (id(p) == id(q))
print(f"256 identity: {cached_identity} | 257 identity: {uncached_identity}")
""",
        "questionAudio": "Day01/New_PyDay01Question06.mp3",
        "solutionAudio": "Day01/New_PyDay01Question06sol.mp3"
    },
    {
        "id": 7,
        "prompt": "<strong>[Medium] Memory Detective: List vs Tuple Overhead</strong><br/>Using <code>sys.getsizeof()</code>, compare a 5-element integer <code>list</code> vs a 5-element integer <code>tuple</code> holding identical values: <code>[10, 20, 30, 40, 50]</code>. Store the list size in <code>list_bytes</code>, tuple size in <code>tuple_bytes</code>, and compute the memory saved per million records in megabytes (<code>saved_mb</code>).",
        "starterCode": """import sys

data = [10, 20, 30, 40, 50]

# TODO: Calculate list_bytes, tuple_bytes, and saved_mb for 1,000,000 records
list_bytes = None
tuple_bytes = None
saved_mb = None

print(f"List: {list_bytes}B | Tuple: {tuple_bytes}B | Saved on 1M: {saved_mb:.2f}MB")
""",
        "ref": """import sys

data = [10, 20, 30, 40, 50]
list_bytes = sys.getsizeof(list(data))
tuple_bytes = sys.getsizeof(tuple(data))
saved_mb = ((list_bytes - tuple_bytes) * 1_000_000) / (1024 * 1024)
print(f"List: {list_bytes}B | Tuple: {tuple_bytes}B | Saved on 1M: {saved_mb:.2f}MB")
""",
        "questionAudio": "Day01/New_PyDay01Question07.mp3",
        "solutionAudio": "Day01/New_PyDay01Question07sol.mp3"
    },
    {
        "id": 8,
        "prompt": "<strong>[Medium] Shallow vs Deep Copy Budget Guard</strong><br/>A department budget dictionary contains nested lists: <code>budget = {'Q1': [10000, 15000], 'Q2': [20000, 25000]}</code>. Create an isolated copy using <code>copy.deepcopy()</code> named <code>secure_budget</code>. Append <code>30000</code> to <code>secure_budget['Q2']</code>. Confirm that <code>len(budget['Q2']) == 2</code> and store this check in <code>is_isolated</code>.",
        "starterCode": """import copy

budget = {'Q1': [10000, 15000], 'Q2': [20000, 25000]}

# TODO: Deepcopy to secure_budget, append 30000 to Q2, set is_isolated boolean
secure_budget = None
is_isolated = None

print(f"Original Q2: {budget['Q2']}")
print(f"Secure Q2: {secure_budget['Q2'] if secure_budget else None}")
print(f"Isolated: {is_isolated}")
""",
        "ref": """import copy

budget = {'Q1': [10000, 15000], 'Q2': [20000, 25000]}
secure_budget = copy.deepcopy(budget)
secure_budget['Q2'].append(30000)
is_isolated = (len(budget['Q2']) == 2 and len(secure_budget['Q2']) == 3)
print(f"Original Q2: {budget['Q2']}")
print(f"Secure Q2: {secure_budget['Q2']}")
print(f"Isolated: {is_isolated}")
""",
        "questionAudio": "Day01/New_PyDay01Question08.mp3",
        "solutionAudio": "Day01/New_PyDay01Question08sol.mp3"
    },
    {
        "id": 9,
        "prompt": "<strong>[Medium] Customer Churn Analysis with Set Algebra</strong><br/>Given user ID cohorts for January (<code>jan_users = {'u1', 'u2', 'u3', 'u4'}</code>) and February (<code>feb_users = {'u3', 'u4', 'u5', 'u6'}</code>), use set operations to find: retained users (<code>retained</code>), churned users (<code>churned</code>), and newly acquired users (<code>new_acquired</code>).",
        "starterCode": """jan_users = {'u1', 'u2', 'u3', 'u4'}
feb_users = {'u3', 'u4', 'u5', 'u6'}

# TODO: Compute retained, churned, and new_acquired sets
retained = None
churned = None
new_acquired = None

print(f"Retained: {retained}")
print(f"Churned: {churned}")
print(f"New: {new_acquired}")
""",
        "ref": """jan_users = {'u1', 'u2', 'u3', 'u4'}
feb_users = {'u3', 'u4', 'u5', 'u6'}
retained = jan_users & feb_users
churned = jan_users - feb_users
new_acquired = feb_users - jan_users
print(f"Retained: {retained}")
print(f"Churned: {churned}")
print(f"New: {new_acquired}")
""",
        "questionAudio": "Day01/New_PyDay01Question09.mp3",
        "solutionAudio": "Day01/New_PyDay01Question09sol.mp3"
    },
    {
        "id": 10,
        "prompt": "<strong>[Medium] Frequency Counter for Product Categories</strong><br/>Given a stream of order categories: <code>orders = ['Electronics', 'Books', 'Electronics', 'Clothing', 'Books', 'Electronics']</code>, use <code>collections.Counter</code> to find the most common category (<code>top_category</code>) and its count (<code>top_count</code>).",
        "starterCode": """from collections import Counter

orders = ['Electronics', 'Books', 'Electronics', 'Clothing', 'Books', 'Electronics']

# TODO: Extract top_category and top_count using Counter
top_category = None
top_count = None

print(f"Top: {top_category} ({top_count} orders)")
""",
        "ref": """from collections import Counter

orders = ['Electronics', 'Books', 'Electronics', 'Clothing', 'Books', 'Electronics']
counts = Counter(orders)
top = counts.most_common(1)[0]
top_category = top[0]
top_count = top[1]
print(f"Top: {top_category} ({top_count} orders)")
""",
        "questionAudio": "Day01/New_PyDay01Question10.mp3",
        "solutionAudio": "Day01/New_PyDay01Question10sol.mp3"
    },
    {
        "id": 11,
        "prompt": "<strong>[Medium] Department Grouping with Defaultdict</strong><br/>Given employee tuples <code>employees = [('Aarav', 'Engineering'), ('Priya', 'Marketing'), ('Rohit', 'Engineering'), ('Sneha', 'Finance')]</code>, use <code>collections.defaultdict(list)</code> to group employees by department into <code>dept_map</code>.",
        "starterCode": """from collections import defaultdict

employees = [
    ('Aarav', 'Engineering'),
    ('Priya', 'Marketing'),
    ('Rohit', 'Engineering'),
    ('Sneha', 'Finance')
]

# TODO: Group names by department in dept_map
dept_map = defaultdict(list)

print(dict(dept_map))
""",
        "ref": """from collections import defaultdict

employees = [
    ('Aarav', 'Engineering'),
    ('Priya', 'Marketing'),
    ('Rohit', 'Engineering'),
    ('Sneha', 'Finance')
]
dept_map = defaultdict(list)
for name, dept in employees:
    dept_map[dept].append(name)
print(dict(dept_map))
""",
        "questionAudio": "Day01/New_PyDay01Question11.mp3",
        "solutionAudio": "Day01/New_PyDay01Question11sol.mp3"
    },
    {
        "id": 12,
        "prompt": "<strong>[Medium] Anagram & Case-Insensitive Palindrome Filter</strong><br/>Write a function <code>is_palindrome(text)</code> that ignores spaces, punctuation, and casing. Test on <code>phrase = 'A man, a plan, a canal: Panama'</code>, storing the result in <code>is_pal</code>. Then test if <code>'Debit card'</code> and <code>'Bad credit'</code> are anagrams, storing in <code>is_ana</code>.",
        "starterCode": """# Q12: Palindrome & Anagram Validator
phrase = "A man, a plan, a canal: Panama"
w1 = "Debit card"
w2 = "Bad credit"

# TODO: Implement checks and assign is_pal and is_ana booleans
is_pal = None
is_ana = None

print(f"Palindrome: {is_pal} | Anagram: {is_ana}")
""",
        "ref": """import re

phrase = "A man, a plan, a canal: Panama"
w1 = "Debit card"
w2 = "Bad credit"

clean_phrase = "".join([c.lower() for c in phrase if c.isalnum()])
is_pal = (clean_phrase == clean_phrase[::-1])

clean_w1 = sorted([c.lower() for c in w1 if c.isalnum()])
clean_w2 = sorted([c.lower() for c in w2 if c.isalnum()])
is_ana = (clean_w1 == clean_w2)

print(f"Palindrome: {is_pal} | Anagram: {is_ana}")
""",
        "questionAudio": "Day01/New_PyDay01Question12.mp3",
        "solutionAudio": "Day01/New_PyDay01Question12sol.mp3"
    },
    {
        "id": 13,
        "prompt": "<strong>[Hard] Fraud Detection: Composite Multi-Key Indexing</strong><br/>Build an in-memory lookup index for fraud detection. Given transactions <code>txns = [{'user_id': 101, 'device': 'iOS', 'ip': '1.1.1.1', 'amt': 500}, ...]</code>, index them into a dictionary <code>fraud_index</code> where the key is a hashable composite tuple: <code>(user_id, device, ip)</code> and the value is the total cumulative transaction amount for that composite identity.",
        "starterCode": """from collections import defaultdict

txns = [
    {'user_id': 101, 'device': 'iOS', 'ip': '1.1.1.1', 'amt': 500},
    {'user_id': 102, 'device': 'Android', 'ip': '2.2.2.2', 'amt': 1200},
    {'user_id': 101, 'device': 'iOS', 'ip': '1.1.1.1', 'amt': 750},
    {'user_id': 101, 'device': 'Web', 'ip': '1.1.1.1', 'amt': 300},
]

# TODO: Build fraud_index mapping (user_id, device, ip) -> total amount
fraud_index = defaultdict(float)

print(dict(fraud_index))
""",
        "ref": """from collections import defaultdict

txns = [
    {'user_id': 101, 'device': 'iOS', 'ip': '1.1.1.1', 'amt': 500},
    {'user_id': 102, 'device': 'Android', 'ip': '2.2.2.2', 'amt': 1200},
    {'user_id': 101, 'device': 'iOS', 'ip': '1.1.1.1', 'amt': 750},
    {'user_id': 101, 'device': 'Web', 'ip': '1.1.1.1', 'amt': 300},
]

fraud_index = defaultdict(float)
for t in txns:
    key = (t['user_id'], t['device'], t['ip'])
    fraud_index[key] += t['amt']

print(dict(fraud_index))
""",
        "questionAudio": "Day01/New_PyDay01Question13.mp3",
        "solutionAudio": "Day01/New_PyDay01Question13sol.mp3"
    },
    {
        "id": 14,
        "prompt": "<strong>[Hard] Nested JSON Flattener & NoneType Coalescer</strong><br/>Write a recursive function <code>flatten_dict(d, parent_key='', sep='.')</code> that flattens nested dictionaries into single-level dot-notation keys. If any value is <code>None</code>, replace it with the string fallback <code>'N/A'</code>. Store the flattened result for <code>raw_payload</code> in <code>flat_data</code>.",
        "starterCode": """raw_payload = {
    'user': {
        'id': 104,
        'profile': {
            'name': 'Anjali Gupta',
            'middle_name': None,
            'city': 'Bengaluru'
        }
    },
    'status': 'active'
}

def flatten_dict(d, parent_key='', sep='.'):
    # TODO: recursively flatten and coalesce None to 'N/A'
    pass

flat_data = flatten_dict(raw_payload)
print(flat_data)
""",
        "ref": """raw_payload = {
    'user': {
        'id': 104,
        'profile': {
            'name': 'Anjali Gupta',
            'middle_name': None,
            'city': 'Bengaluru'
        }
    },
    'status': 'active'
}

def flatten_dict(d, parent_key='', sep='.'):
    items = []
    for k, v in d.items():
        new_key = f"{parent_key}{sep}{k}" if parent_key else k
        if isinstance(v, dict):
            items.extend(flatten_dict(v, new_key, sep=sep).items())
        else:
            items.append((new_key, 'N/A' if v is None else v))
    return dict(items)

flat_data = flatten_dict(raw_payload)
print(flat_data)
""",
        "questionAudio": "Day01/New_PyDay01Question14.mp3",
        "solutionAudio": "Day01/New_PyDay01Question14sol.mp3"
    },
    {
        "id": 15,
        "prompt": "<strong>[Hard] Dynamic Array Over-Allocation Tracker</strong><br/>CPython lists over-allocate memory when appending. Start with an empty list <code>lst = []</code>. Append integers from 0 to 20 one by one. After each append, record <code>sys.getsizeof(lst)</code>. Identify the iteration steps where the byte size increases (memory reallocation jumps) and store the list of jump sizes in <code>jump_sizes</code>.",
        "starterCode": """import sys

lst = []
jump_sizes = []
prev_size = sys.getsizeof(lst)

# TODO: Append items 0..20, identify size jump points
for i in range(21):
    pass

print("Memory jumps recorded:", jump_sizes)
""",
        "ref": """import sys

lst = []
jump_sizes = []
prev_size = sys.getsizeof(lst)

for i in range(21):
    lst.append(i)
    cur_size = sys.getsizeof(lst)
    if cur_size > prev_size:
        jump_sizes.append((i, cur_size))
        prev_size = cur_size

print("Memory jumps recorded:", jump_sizes)
""",
        "questionAudio": "Day01/New_PyDay01Question15.mp3",
        "solutionAudio": "Day01/New_PyDay01Question15sol.mp3"
    }
]

# Assemble into final JS object
output_js = f"""// Python Day 01 — Data Types & Memory Management
if (!window.COURSE_CONTENT) window.COURSE_CONTENT = {{}};
window.COURSE_CONTENT['pyDay01'] = {{
  day: 1,
  title: "Data Types & Memory",
  emoji: "🔢",

  slides: {json.dumps(slides_html, indent=4)},

  practiceQuestions: {json.dumps(practice_questions, indent=4)},

  {tq_block},

  topics: [
    {{ id: "topic-1", label: "01. Integers & Arbitrary Precision", slideIndex: 0 }},
    {{ id: "topic-2", label: "02. Floats, IEEE-754 & Precision", slideIndex: 1 }},
    {{ id: "topic-3", label: "03. Strings & Unicode Memory", slideIndex: 2 }},
    {{ id: "topic-4", label: "04. Booleans & Truthiness Matrix", slideIndex: 3 }},
    {{ id: "topic-5", label: "05. Sequences: List vs Tuple", slideIndex: 4 }},
    {{ id: "topic-6", label: "06. Hash Tables: Set & Dict O(1)", slideIndex: 5 }},
    {{ id: "topic-7", label: "07. Top 25 Interview Q&As", slideIndex: 6 }}
  ]
}};
"""

with open('public/python/content/py-day-01.js', 'w', encoding='utf-8') as f:
    f.write(output_js)

print("Successfully written public/python/content/py-day-01.js!")
