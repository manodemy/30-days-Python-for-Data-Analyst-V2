-- ═══════════════════════════════════════════════════════════════
-- Seed Notebook Content: Days 01 to 05
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.notebook_content (day_id, title, html_body, sections, cells)
VALUES
('day01', '🔢 Data Types and Memory', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Mastering Python isn''t just about knowing syntax; it''s about understanding how data is fundamentally stored, accessed, and optimized in memory. Today, we deconstruct Python''s 10 foundational data types. You will learn not only <em>how</em> to use them, but <em>when</em> to use them to write high-performance, production-grade analytical pipelines.</p>
<h3>📋 Strategic Data Type Matrix</h3>
<table>
<thead><tr><th>#</th><th>Type</th><th>Immutable?</th><th>Memory Cost</th><th>Enterprise Analytics Use Case</th></tr></thead><tbody>
<tr><td>1</td><td><code>int</code></td><td>✅ Yes</td><td>Variable</td><td>Primary keys, absolute indexing, discrete counts.</td></tr>
<tr><td>2</td><td><code>float</code></td><td>✅ Yes</td><td>24 bytes</td><td>Continuous measurements, financial metrics, probabilities.</td></tr>
<tr><td>3</td><td><code>complex</code></td><td>✅ Yes</td><td>32 bytes</td><td>Signal processing, geospatial vectors, quantum modeling.</td></tr>
<tr><td>4</td><td><code>str</code></td><td>✅ Yes</td><td>Variable</td><td>Raw text mining, log parsing, categorical identifiers.</td></tr>
<tr><td>5</td><td><code>bool</code></td><td>✅ Yes</td><td>28 bytes</td><td>Binary masks, conditional filtering, boolean logic.</td></tr>
<tr><td>6</td><td><code>list</code></td><td>❌ No</td><td>Dynamic</td><td>Ordered queues, chronological time-series buffers.</td></tr>
<tr><td>7</td><td><code>tuple</code></td><td>✅ Yes</td><td>Fixed</td><td>Immutable configuration matrices, compound dictionary keys.</td></tr>
<tr><td>8</td><td><code>set</code></td><td>❌ No</td><td>Dynamic</td><td>O(1) deduplication, cohort intersection/union analysis.</td></tr>
<tr><td>9</td><td><code>dict</code></td><td>❌ No</td><td>Dynamic</td><td>Fast O(1) lookups, JSON payload structuring, aggregations.</td></tr>
<tr><td>10</td><td><code>None</code></td><td>✅ Yes</td><td>16 bytes</td><td>Singleton representation of missing/null values.</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Integer (<code>int</code>) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;"></span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>An integer is a whole number that can be positive, negative, or zero, and it does not contain a decimal point. Unlike many other programming languages such as C or Java, Python integers support <b>arbitrary precision</b>, meaning they can grow to very large values limited only by your system''s memory.</p>
<p><strong>Examples:</strong> <code>10</code>, <code>-25</code>, <code>0</code>, <code>999999</code></p>
<pre class="nb-code-block"><code>x = 10**100  # A 101-digit number!
print(x)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>Integers are the foundational blocks of tracking entities and loops.</p>
<p>• <strong>Row Counts</strong>: Functions like <code>len(df)</code> return integers.</p>
<p>• <strong>Primary Keys</strong>: <code>Customer ID</code>, <code>Order ID</code>, and <code>Transaction ID</code> are typically stored as integers for high-speed indexing.</p>
<p>• <strong>Categorical Encoding</strong>: Converting string categories to integers (<code>0 = Low</code>, <code>1 = Medium</code>, <code>2 = High</code>) is a standard requirement for Machine Learning.</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Common Pitfall: Division Behavior</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>In Python, the standard division operator <code>/</code> <b>always</b> returns a float, even if the result is mathematically whole.</p>
<pre class="nb-code-block"><code>print(10 / 2)   # Output: 5.0 (float)
print(10 // 2)  # Output: 5 (int) - Use floor division to keep it an integer!</code></pre>
<div class="callout">⚡ <strong>Important</strong>: Floor division truncates toward negative infinity (e.g., <code>-7 // 2</code> yields <code>-4</code>).</div>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Memory Insight</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>A standard Python integer uses about <b>28 bytes</b>. For large-scale data processing (millions of rows), this is highly inefficient. Professional analysts use NumPy and pandas optimized types to compress data footprint.</p>
<table>
<thead><tr><th>Optimized Type</th><th>Memory Usage</th><th>Range</th></tr></thead><tbody>
<tr><td><code>int8</code></td><td>1 byte</td><td>-128 to 127</td></tr>
<tr><td><code>int16</code></td><td>2 bytes</td><td>-32K to 32K</td></tr>
<tr><td><code>int32</code></td><td>4 bytes</td><td>~±2 billion</td></tr>
</tbody></table>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">transaction_count = 1842
customer_id       = 10245

print(f&#x27;transaction_count : {transaction_count}  | type: {type(transaction_count).__name__}&#x27;)

# Arithmetic
print(f&#x27;10 / 3  → type: {type(10 / 3).__name__}&#x27;)   # float!
print(f&#x27;10 // 3 → type: {type(10 // 3).__name__}&#x27;)  # int (floor div)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-int-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>int</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>a = 15</code> and <code>b = 4</code>. Compute and print: <code>a + b</code>, <code>a <em> b</code>, <code>a // b</code>, <code>a % b</code>, <code>a </em>* b</code>. Verify each result''s type with <code>type()</code>.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write code that checks whether <code>2 ** 100</code> overflows. Print the result. How does Python handle arbitrarily large integers?</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Given <code>x = 42</code>, convert it to: float (<code>float(x)</code>), string (<code>str(x)</code>), and boolean (<code>bool(x)</code>). Print each result and its type.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write code to extract the tens digit from <code>n = 4567</code> using integer arithmetic only (<code>//</code> and <code>%</code>). Expected: <code>6</code>.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Compute <code>10 // 3</code> and <code>10 / 3</code>. Print both results and their types. Explain why <code>//</code> is called floor division.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Float (<code>float</code>) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Decimal Numbers & Continuous Metrics</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A float represents continuous numerical data containing a decimal point or expressed in scientific e-notation. Python internally uses the <b>64-bit IEEE 754 double-precision standard</b>, providing approximately 15-17 significant decimal digits of precision.</p>
<p><strong>Examples:</strong> <code>3.14</code>, <code>-0.001</code>, <code>2.5e2</code></p>
<pre class="nb-code-block"><code>pi = 3.1415926535
scientific = 2.5e3  # 2500.0</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>Floats are the absolute backbone of continuous modeling.</p>
<p>• <strong>Financial Engineering</strong>: Tracking <code>revenue</code>, <code>prices</code>, and <code>transaction amounts</code>.</p>
<p>• <strong>Statistical Modeling</strong>: Almost all analytical measures (Mean, Standard Deviation, Z-Scores) naturally evaluate to floats.</p>
<p>• <strong>Geospatial Analytics</strong>: <code>Latitude</code> and <code>longitude</code> coordinates require deep decimal precision.</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Common Pitfall: The Floating-Point Trap</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Because computers operate in base-2 (binary) fractions, they cannot perfectly represent all base-10 decimals. <code>0.1 + 0.2</code> will evaluate to <code>0.30000000000000004</code>.</p>
<pre class="nb-code-block"><code>import math
print(math.isclose(0.1 + 0.2, 0.3))  # Output: True</code></pre>
<div class="callout">⚡ <strong>Important</strong>: For strict financial accounting, avoid floats entirely and use Python''s built-in <code>decimal.Decimal</code> module.</div>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Special Float Values</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Floats support unique architectural values critical for handling messy, real-world data:<br><ul><li><code>float(''nan'')</code>: The universal standard for missing data in Pandas.</li><li><code>float(''inf'')</code>: Used to represent mathematical bounds.</li></ul></p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">revenue = 87540.50
growth_rate = 12.4

# Float precision — important for financial data!
price = 0.1 + 0.2
print(f&#x27;0.1 + 0.2 = {price}&#x27;)           # floating point quirk
print(f&#x27;Rounded   = {round(price, 2)}&#x27;)  # always round financial values</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-float-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>float</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Print <code>0.1 + 0.2</code>. Is the result exactly <code>0.3</code>? Write code using <code>round()</code> and <code>math.isclose()</code> to properly compare floats.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write code to convert <code>temperature_f = 98.6</code> to Celsius using <code>(f - 32) * 5/9</code>. Print the result rounded to 2 decimal places.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create <code>price = 19.99</code> and <code>quantity = 3</code>. Compute <code>total = price * quantity</code>. Why is the result not exactly <code>59.97</code>? Fix it with <code>round()</code>.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Demonstrate float overflow: compute <code>1e308 * 2</code>. What does Python return? Then try <code>1e-324 / 10</code>. What happens with underflow?</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>float(''inf'')</code>, <code>float(''-inf'')</code>, and <code>float(''nan'')</code>. Test: <code>inf > 1000000</code> → <code>True</code>, <code>nan == nan</code> → <code>False</code>. Print all results.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Complex (<code>complex</code>) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Multi-Dimensional Vectors</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A complex number consists of a real part and an imaginary part. Python natively supports them out of the box, using the <code>j</code> suffix (instead of <i>i</i> like in mathematics) to denote the imaginary unit.</p>
<p><strong>Examples:</strong> <code>3+4j</code>, <code>-1j</code>, <code>5.2+2j</code></p>
<pre class="nb-code-block"><code>z = 3 + 4j
print(z.real)  # Output: 3.0
print(z.imag)  # Output: 4.0</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>While rare in standard business intelligence, complex numbers are indispensable in specialized scientific fields.</p>
<p>• <strong>Signal Processing</strong>: Using Fast Fourier Transforms (FFT) to analyze audio or sensor frequencies.</p>
<p>• <strong>Electrical Engineering</strong>: Modeling alternating currents, phases, and impedance.</p>
<p>• <strong>Vector Math</strong>: Instantly compute the magnitude (length) of the vector using the built-in <code>abs()</code> function.</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Common Pitfall: Comparison Operators</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Complex numbers reside on a 2D plane. Therefore, they <b>cannot</b> be ordered sequentially using <code>&gt;</code> or <code>&lt;</code> like integers or floats.</p>
<pre class="nb-code-block"><code># (3 + 4j) &gt; (1 + 2j)  &lt;-- Raises TypeError!
print((3 + 4j) == (3 + 4j))  # You can only check for equality</code></pre>
<div class="callout">⚡ <strong>Important</strong>: You cannot convert a complex number to an int or a float using <code>int()</code> or <code>float()</code>. You must explicitly extract the <code>.real</code> part.</div>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Memory Insight</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Because a complex number stores two double-precision floats under the hood, it consumes more memory (<b>32 bytes</b>). In large-scale computing, NumPy handles arrays of complex numbers using highly optimized <code>complex64</code> or <code>complex128</code> types.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">sensor_reading = 3 + 5j
print(f&#x27;Real part      : {sensor_reading.real}&#x27;)
print(f&#x27;Imaginary part : {sensor_reading.imag}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-complex-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>complex</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>z = 3 + 4j</code>. Print its <code>.real</code>, <code>.imag</code>, and compute the magnitude using <code>abs(z)</code>. Verify: <code>sqrt(3² + 4²) = 5</code>.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Add <code>(2 + 3j)</code> and <code>(4 - 1j)</code>. Print the result. Then multiply them and print. Show complex arithmetic works naturally.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write code to check if <code>type(5j)</code> is <code>complex</code>. Then check if <code>isinstance(5j, (int, float, complex))</code> returns <code>True</code>.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Convert the integer <code>7</code> to a complex number using <code>complex(7)</code>. What is its imaginary part? Print <code>complex(3, 4)</code> and verify.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Try <code>complex(''3+4j'')</code> (string parsing). Then try <code>complex(''3 + 4j'')</code> with spaces — does it work? Show the error handling.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-40">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>4. String (<code>str</code>) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Unstructured Text Data</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A string is an ordered, <b>immutable</b> sequence of Unicode characters. It is used to represent any textual data and can be defined using single, double, or triple quotes for multi-line text.</p>
<p><strong>Examples:</strong> <code>"Alice"</code>, <code>''New York''</code>, <code>''''''Multi-line text''''''</code></p>
<pre class="nb-code-block"><code>greeting = &quot;Hello, World!&quot;
print(greeting[0])  # Output: &#x27;H&#x27;</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>A vast majority of raw data exists as unstructured text. Analysts spend up to 80% of their time cleaning it.</p>
<p>• <strong>Categorical Features</strong>: Representing non-numerical dimensions (e.g., <code>Region</code>, <code>Product_Tier</code>).</p>
<p>• <strong>Log Parsing</strong>: Extracting precise metadata (timestamps, IPs, error codes) from raw server logs.</p>
<p>• <strong>Dynamic Reporting</strong>: Using <strong>f-strings</strong> to seamlessly inject variables directly into dashboard strings.</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Common Pitfall: Immutability</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Strings are immutable. Once created, they cannot be modified in-place. Every operation (like <code>.replace()</code> or <code>.upper()</code>) creates a brand new string object in RAM.</p>
<pre class="nb-code-block"><code>s = &quot;cat&quot;
# s[0] = &quot;b&quot;  &lt;-- Raises TypeError!
s = &quot;b&quot; + s[1:]  # Correct way: reassign to a new string</code></pre>
<div class="callout">⚡ <strong>Important</strong>: Chaining methods like <code>data.strip().lower().replace(''x'', ''y'')</code> is clean but computationally expensive on millions of rows because it generates multiple temporary strings.</div>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Memory Insight: String Interning</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Python optimizes memory by "interning" short, identifier-like strings. If multiple variables are assigned <code>"revenue"</code>, Python stores the word "revenue" only <b>once</b> in RAM. This makes dictionary key lookups blazing fast via O(1) pointer comparison.</p>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19">region = &#x27;North&#x27;
raw = &#x27;  north india  &#x27;
print(raw.strip().title())           # &#x27;North India&#x27;

# f-string formatting
revenue = 87540.50
print(f&#x27;Region: {region} | Revenue: Rs.{revenue:,.2f}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-str-42">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>str</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a multi-line string using triple quotes. Print it. Then create the same using <code>\n</code>. Verify both produce identical output.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>name = ''alice''</code>, chain <code>.strip().title()</code> and print. Then use an f-string: <code>f''{name.title()} has {len(name)} letters''</code>.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write code to check if <code>''Python''</code> contains <code>''tho''</code> using the <code>in</code> operator. Then use <code>.find()</code> and <code>.index()</code>. Show what happens with <code>.index()</code> when not found.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Demonstrate string immutability: try <code>s = ''hello''; s[0] = ''H''</code>. Catch the error. Show the correct way: <code>s = ''H'' + s[1:]</code>.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Given <code>data = ''  Alice, 30, NYC  ''</code>, split by comma, strip each part, and print as a clean list: <code>[''Alice'', ''30'', ''NYC'']</code>.</p></div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-53">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>5. Boolean (<code>bool</code>) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Binary Logic & Masks</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A boolean represents exactly one of two binary states: <code>True</code> or <code>False</code>. Under the hood, Python''s <code>bool</code> is a strict subclass of the integer type (<code>True</code> evaluates to 1, and <code>False</code> evaluates to 0).</p>
<p><strong>Examples:</strong> <code>True</code>, <code>False</code></p>
<pre class="nb-code-block"><code>is_active = True
print(type(is_active))  # Output: &lt;class &#x27;bool&#x27;&gt;</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>Booleans are the fundamental building blocks of dataset filtering and conditional flow.</p>
<p>• <strong>Boolean Masking</strong>: Filtering Pandas datasets using boolean arrays (e.g., <code>df[df[''salary''] > 100000]</code>).</p>
<p>• <strong>State Flags</strong>: Tracking binary conditions (<code>has_purchased</code>, <code>is_churned</code>).</p>
<p>• <strong>Instant Aggregations</strong>: Because <code>True = 1</code>, you can instantly count matches by summing a boolean array (<code>sum([True, False, True])</code> yields <code>2</code>).</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Common Pitfall: Truthy vs Falsy</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Python evaluates objects in conditional statements based on their "Truthiness". Empty structures are strictly evaluated as <b>Falsy</b> (e.g., <code>0</code>, <code>0.0</code>, <code>''''</code>, <code>[]</code>, <code>{}</code>, <code>None</code>).</p>
<pre class="nb-code-block"><code>my_list = []
if not my_list:
    print(&quot;This evaluates because the list is Falsy!&quot;)</code></pre>
<div class="callout">⚡ <strong>Important</strong>: A string containing a single space <code>" "</code> or the literal text <code>"False"</code> is Truthy because the string is technically not empty!</div>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 The Logical Short-Circuit</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Python''s logical operators (<code>and</code>, <code>or</code>) use short-circuit evaluation for maximum performance. In <code>A and B</code>, if <code>A</code> is False, Python stops instantly without ever evaluating <code>B</code>. Always place your most computationally expensive checks on the right side!</p>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25">is_premium = True

# bool behaves as int — interview trap!
print(True + True)           # 2
print(isinstance(True, int)) # True — bool IS an int subclass

# Falsy values — all evaluate to False
for val in [False, 0, 0.0, &#x27;&#x27;, [], {}, set(), None]:
    print(f&#x27;bool({repr(val):&lt;10}) = {bool(val)}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-bool-55">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>bool</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Test truthiness of: <code>bool(0)</code>, <code>bool('''')</code>, <code>bool([])</code>, <code>bool(None)</code>, <code>bool(0.0)</code>. Print each. Then test: <code>bool(1)</code>, <code>bool(''hello'')</code>, <code>bool([1])</code>. What pattern do you see?</p></div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write code: <code>x = 10; print(x > 5 and x < 20)</code>. Then use chained comparison: <code>print(5 < x < 20)</code>. Verify both give the same result.</p></div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Demonstrate <code>True == 1</code> and <code>False == 0</code>. Then show: <code>True + True + True</code> → <code>3</code>. Explain why booleans are integers in Python.</p></div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a one-liner using <code>bool()</code> to check if a list <code>items = [1, 2, 3]</code> is non-empty. Then check an empty list. Explain why <code>if items:</code> works.</p></div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>any()</code> and <code>all()</code> on <code>[True, False, True]</code>. Print both. Then test on <code>[0, '''', None]</code> and <code>[1, ''a'', [1]]</code>. Explain the results.</p></div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>6. NoneType (<code>None</code>) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">The Null State</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>The <code>NoneType</code> is a special data type that has exactly one valid value: <code>None</code>. It is Python''s native way to represent the absolute absence of a value, null, or "nothing". It is not equal to <code>0</code>, <code>False</code>, or an empty string.</p>
<p><strong>Examples:</strong> <code>None</code></p>
<pre class="nb-code-block"><code>missing_value = None
print(type(missing_value))  # Output: &lt;class &#x27;NoneType&#x27;&gt;</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p><code>None</code> is critical for handling incomplete, corrupt, or uninitialized data states.</p>
<p>• <strong>Missing Data</strong>: Before data reaches a Pandas DataFrame (where it becomes <code>NaN</code>), raw Python handles missing records securely as <code>None</code>.</p>
<p>• <strong>Safe Default Arguments</strong>: Used natively to initialize optional parameters in custom analytical functions without triggering memory leaks.</p>
<p>• <strong>API Nulls</strong>: When reading from a SQL database or a JSON API, <code>NULL</code> values are automatically translated into Python <code>None</code> objects.</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Common Pitfall: The Mutable Default Argument Trap</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>A catastrophic error in Python is using a mutable type (like a list or dict) as a default argument in a function. The list will persist across all function calls!</p>
<pre class="nb-code-block"><code># CORRECT WAY: Use None to initialize!
def add_item(item, basket=None):
    if basket is None:
        basket = []
    basket.append(item)
    return basket</code></pre>
<div class="callout">⚡ <strong>Important</strong>: None</div>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Memory Insight: The Singleton Pattern</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>None</code> is a strict <b>memory singleton</b>. There is only ever one instance of <code>None</code> existing in your computer''s RAM at any given time. Because of this, you must <b>always</b> check for <code>None</code> using the identity operator <code>is</code> (e.g., <code>if val is None:</code>) instead of the equality operator <code>==</code>. This validates the strict memory address and prevents accidental truthy/falsy evaluation errors.
</div></div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31">last_login = None
print(None == 0)       # False
print(None is None)    # True  -- always use &#x27;is&#x27; to check None

# Filter None from data
scores = [85, None, 90, None, 78]
clean = [s for s in scores if s is not None]
print(f&#x27;Clean: {clean}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-None-68">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>None</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a function <code>find_item(lst, target)</code> that returns the index if found, <code>None</code> if not. Call it and check the result with <code>is None</code> (not <code>== None</code>).</p></div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Show that <code>None</code> is a singleton: <code>a = None; b = None; print(a is b)</code> → <code>True</code>. Explain why <code>is</code> is preferred over <code>==</code> for None checks.</p></div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create a list <code>[1, None, 3, None, 5]</code>. Write code to filter out <code>None</code> values using a list comprehension with <code>is not None</code>. Print the clean list.</p></div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Demonstrate <code>None</code> as a default parameter: <code>def greet(name=None): return f''Hello, {name or "World"}''</code>. Test with and without argument.</p></div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Check the boolean value of <code>None</code>: <code>bool(None)</code> → <code>False</code>. Write an <code>if</code> statement that handles <code>None</code>, <code>0</code>, and <code>''''</code> differently from each other.</p></div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-79">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>7. List (<code>list</code>) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Dynamic & Mutable Sequences</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A list is an ordered, <b>mutable</b> collection of arbitrary objects created using square brackets <code>[]</code>. Python lists are dynamic arrays of memory pointers—they can grow or shrink on demand and hold mixed data types simultaneously.</p>
<p><strong>Examples:</strong> <code>[1, 2, 3]</code>, <code>[''Alice'', 30, True]</code></p>
<pre class="nb-code-block"><code>users = [&quot;Alice&quot;, &quot;Bob&quot;]
users.append(&quot;Charlie&quot;)  # Grows dynamically in-place
print(users)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>Lists are the most versatile structure for holding sequenced data.</p>
<p>• <strong>Time-Series Buffers</strong>: Sequentially appending streaming data chronologically.</p>
<p>• <strong>Schema Definitions</strong>: Passing ordered column names into DataFrame operations.</p>
<p>• <strong>Batch Aggregations</strong>: Accumulating results dynamically during loops or list comprehensions (<code>[x**2 for x in data]</code>).</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Common Pitfall: The Shallow Copy Trap</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Because lists are mutable, assigning a list to a new variable creates a <b>memory reference</b>, not an independent copy. Altering the new list will permanently corrupt the original list!</p>
<pre class="nb-code-block"><code>list_a = [1, 2, 3]
list_b = list_a      # Points to the exact same memory address!
list_b.append(4)     # Corrupts list_a as well</code></pre>
<div class="callout">⚡ <strong>Important</strong>: Always safely duplicate a list using <code>.copy()</code> or slicing <code>[:]</code>. Furthermore, never remove items from a list while actively looping over it via a <code>for</code> loop.</div>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Performance Insight (Big-O Bottleneck)</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Lists are highly inefficient for large-scale searching and numerical math. Checking <code>x in my_list</code> executes in <b>O(N)</b> time (Python scans elements one-by-one). For heavy math, switch to NumPy arrays. For fast lookups, convert to a Set.</p>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37">monthly_sales = [45000, 62000, 58000]

# Mutable — can change in-place
monthly_sales.append(80000)    # add to end
monthly_sales[0] = 48000       # update by index
print(f&#x27;Max : {max(monthly_sales)}&#x27;)
print(f&#x27;Sum : {sum(monthly_sales)}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-list-81">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>list</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>nums = [5, 2, 8, 1, 9]</code>. Use <code>.sort()</code>, <code>.reverse()</code>, <code>.append(6)</code>, <code>.pop()</code>, <code>.insert(0, 10)</code>. Print after each operation.</p></div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Demonstrate list mutability: <code>a = [1, 2, 3]; b = a; b.append(4)</code>. Print both <code>a</code> and <code>b</code>. Why did <code>a</code> change? Fix it with <code>b = a.copy()</code>.</p></div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write code to access: first element, last element, slice <code>[1:3]</code>, every 2nd element <code>[::2]</code>, and reversed <code>[::-1]</code> from <code>[10,20,30,40,50]</code>.</p></div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a nested list <code>matrix = [[1,2],[3,4],[5,6]]</code>. Access element <code>4</code> using double indexing. Flatten it to <code>[1,2,3,4,5,6]</code> using a loop.</p></div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Given <code>words = [''hello'',''world'']</code>, show that <code>words * 3</code> repeats the list and <code>words + [''python'']</code> concatenates. Print both results.</p></div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>8. Tuple (<code>tuple</code>) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Immutable Records</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A tuple is an ordered, <b>immutable</b> sequence of elements created using parentheses <code>()</code>. Because tuples cannot be changed after creation, Python allocates exact, fixed memory blocks for them, making them highly secure and slightly faster than lists.</p>
<p><strong>Examples:</strong> <code>(10, 20)</code>, <code>(''red'', ''green'', ''blue'')</code></p>
<pre class="nb-code-block"><code>coordinates = (40.7128, -74.0060)
print(coordinates[0])  # Output: 40.7128</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>Tuples store fixed, heterogeneous records where the position of the data has strict meaning.</p>
<p>• <strong>Data Integrity</strong>: Safeguarding static reference data (like RGB constants, database connection URLs) from accidental mutation.</p>
<p>• <strong>Compound Dictionary Keys</strong>: Because tuples are immutable (hashable), they can be used to construct multi-dimensional dictionary keys (which lists cannot do).</p>
<p>• <strong>Function Returns</strong>: Seamlessly packing and unpacking multiple return values (<code>clicks, impressions = get_metrics()</code>).</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Common Pitfall: Single-Element Tuples</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>A common mistake when creating a tuple with exactly one element is forgetting the trailing comma.</p>
<pre class="nb-code-block"><code>t1 = (5)   # This is just an integer in parentheses!
t2 = (5,)  # This is a valid single-element tuple</code></pre>
<div class="callout">⚡ <strong>Important</strong>: Tuple immutability only applies to the tuple structure itself. If a tuple contains a mutable object (like a list), the contents of that list can still be modified!</div>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Memory Insight</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Tuples instantiate faster and consume slightly less memory than lists because they lack dynamic resizing overhead. A list pre-allocates extra memory blocks to allow for fast <code>.append()</code> operations, whereas a tuple allocates exactly the memory it needs.</p>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43">date_range = (&#x27;2025-01-01&#x27;, &#x27;2025-03-31&#x27;)
print(f&#x27;Start: {date_range[0]}&#x27;)

# Tuple unpacking
start, end = date_range
print(f&#x27;Unpacked → Start: {start}  End: {end}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-tuple-94">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>tuple</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>point = (3, 4)</code>. Unpack into <code>x, y</code>. Compute distance from origin: <code>(x<strong>2 + y</strong>2) ** 0.5</code>. Print the result.</p></div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Try <code>point[0] = 10</code>. Catch the <code>TypeError</code>. Then show that a tuple containing a list <code>t = (1, [2,3])</code> allows <code>t[1].append(4)</code>. Explain why.</p></div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use tuple unpacking with <code><em></code>: <code>first, </em>middle, last = (1, 2, 3, 4, 5)</code>. Print each variable. What type is <code>middle</code>?</p></div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a single-element tuple: <code>t = (42,)</code>. Show that <code>t = (42)</code> without the comma is just an integer. Print <code>type()</code> of both.</p></div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use a tuple as a dictionary key: <code>locations = {(40.7, -74.0): ''NYC''}</code>. Try the same with a list as key. Show the <code>TypeError</code>.</p></div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-105">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>9. Set (<code>set</code>) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">O(1) Unique Collections</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A set is an unordered, mutable collection of strictly <b>unique</b> elements. Sets are backed by highly optimized Hash Tables in C, sacrificing element ordering to provide lightning-fast mathematical operations and lookups.</p>
<p><strong>Examples:</strong> <code>{1, 2, 3}</code>, <code>{''apple'', ''banana''}</code></p>
<pre class="nb-code-block"><code>unique_ids = {101, 102, 103, 101}
print(unique_ids)  # Duplicates automatically dropped! Output: {101, 102, 103}</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>Sets are the ultimate tool for rapid cohort comparisons and pipeline deduplication.</p>
<p>• <strong>Instant Deduplication</strong>: Instantly stripping duplicate values from massive, messy arrays (<code>list(set(raw_data))</code>).</p>
<p>• <strong>Cohort Analysis</strong>: Rapidly computing intersections (users active in both Q1 and Q2) and unions.</p>
<p>• <strong>Security & Filtering</strong>: Validating IDs against a blacklist in constant time.</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Common Pitfall: Unhashable Elements</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Sets can only store <b>immutable (hashable)</b> objects. You cannot place a list or a dictionary inside a set.</p>
<pre class="nb-code-block"><code># invalid_set = { [1, 2], [3, 4] }  &lt;-- Raises TypeError!
valid_set = { (1, 2), (3, 4) }      # Tuples are hashable!</code></pre>
<div class="callout">⚡ <strong>Important</strong>: You cannot create an empty set using <code>{}</code> (that creates an empty dictionary). You must explicitly call <code>set()</code>.</div>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Performance Insight: O(1) Lookups</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Checking membership (<code>x in my_set</code>) executes in <b>O(1) constant time</b>. Python passes the value into a mathematical hash function, instantly calculating its exact location in RAM. It takes the exact same amount of time to find an ID in a set of 10 items as it does in a set of 10 million items!</p>
<div class="code-cell" id="cell-49">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-49'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-49'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-49"># Deduplication — remove duplicates instantly
raw_regions = [&#x27;North&#x27;, &#x27;South&#x27;, &#x27;North&#x27;, &#x27;East&#x27;, &#x27;South&#x27;]
unique_regions = set(raw_regions)
print(f&#x27;Unique : {unique_regions}&#x27;)

# Set operations — compare customer groups
jan_buyers = {101, 102, 103}
feb_buyers = {103, 104, 105}
print(f&#x27;Loyal (both): {jan_buyers &amp; feb_buyers}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-set-107">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>set</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>a = {1,2,3,4}</code> and <code>b = {3,4,5,6}</code>. Compute and print: union (<code>|</code>), intersection (<code>&</code>), difference (<code>-</code>), symmetric difference (<code>^</code>).</p></div>
<div class="code-cell" id="cell-50">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-50'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-50'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-50"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>names = [''Alice'',''Bob'',''Alice'',''Charlie'',''Bob'']</code>, convert to a set to get unique names. Convert back to sorted list. Print the result.</p></div>
<div class="code-cell" id="cell-51">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-51'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-51'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-51"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Demonstrate set''s O(1) lookup: check <code>''Alice'' in large_set</code> vs <code>''Alice'' in large_list</code> for a 100K-element collection. Time both.</p></div>
<div class="code-cell" id="cell-52">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-52'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-52'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-52"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a frozenset from <code>{1,2,3}</code>. Try <code>.add(4)</code>. Show the error. Use frozenset as a dict key — prove it works unlike regular sets.</p></div>
<div class="code-cell" id="cell-53">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-53'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-53'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-53"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write code to find common elements between 3 sets using chained <code>&</code>. Test: <code>{1,2,3} & {2,3,4} & {3,4,5}</code> → <code>{3}</code>.</p></div>
<div class="code-cell" id="cell-54">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-54'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-54'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-54"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-118">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>10. Dictionary (<code>dict</code>) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">High-Speed Key-Value Stores</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A dictionary is a mutable, ordered collection of <b>key-value pairs</b>. Like sets, dictionaries are powered by highly optimized Hash Tables. Keys must be strictly unique and immutable, while values can be absolutely any object.</p>
<p><strong>Examples:</strong> <code>{''name'': ''Alice'', ''age'': 30}</code></p>
<pre class="nb-code-block"><code>employee = {
    &quot;id&quot;: 1042,
    &quot;role&quot;: &quot;Data Analyst&quot;,
    &quot;skills&quot;: [&quot;Python&quot;, &quot;SQL&quot;]
}
print(employee[&quot;role&quot;])  # Output: &#x27;Data Analyst&#x27;</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>Dictionaries are the architectural backbone of structured data transfer and aggregation in Python.</p>
<p>• <strong>JSON & API Ingestion</strong>: Dictionaries map perfectly to JSON format, making them the default structure for ingesting web API payloads.</p>
<p>• <strong>In-Memory Lookups</strong>: Simulating rapid-access relational lookups without the overhead of spinning up a full SQL database.</p>
<p>• <strong>Frequency Counters</strong>: Rapidly tallying categorical occurrences (e.g., word frequencies, error codes).</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Common Pitfall: The KeyError Crash</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Accessing a missing key via strict bracket notation will immediately crash your script, bringing down entire data pipelines.</p>
<pre class="nb-code-block"><code>emp = {&quot;name&quot;: &quot;Alice&quot;}
# print(emp[&quot;salary&quot;])  &lt;-- Raises KeyError!
print(emp.get(&quot;salary&quot;, 0))  # Professional standard: Safely returns 0</code></pre>
<div class="callout">⚡ <strong>Important</strong>: When iterating natively (<code>for item in my_dict:</code>), Python only yields the <strong>keys</strong>. To iterate over both, use <code>for k, v in my_dict.items():</code>.</div>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 The Dictionary Hash Table</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Dictionaries provide <b>O(1) lookups</b> for keys. When you query <code>emp["skills"]</code>, Python hashes the string <code>"skills"</code> to calculate the exact memory bucket where the value is stored, making mapping operations blazingly fast.</p>
<div class="code-cell" id="cell-55">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-55'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-55'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-55">customer = {
    &#x27;customer_id&#x27;: &#x27;C-1042&#x27;,
    &#x27;total_spent&#x27;: 87540.50
}

customer[&#x27;loyalty_years&#x27;] = 3
# Safe access — no KeyError
print(customer.get(&#x27;email&#x27;, &#x27;N/A&#x27;))</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-dict-120">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>dict</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>emp = {''name'':''Alice'', ''dept'':''Eng'', ''salary'':85000}</code>. Access using <code>[]</code> and <code>.get()</code>. Show <code>[]</code> raises <code>KeyError</code> for missing keys but <code>.get()</code> returns <code>None</code>.</p></div>
<div class="code-cell" id="cell-56">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-56'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-56'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-56"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Iterate over a dict three ways: <code>.keys()</code>, <code>.values()</code>, <code>.items()</code>. Print each. Use <code>.items()</code> in a formatted f-string loop.</p></div>
<div class="code-cell" id="cell-57">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-57'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-57'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-57"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Merge two dicts: <code>d1 = {''a'':1, ''b'':2}</code> and <code>d2 = {''b'':3, ''c'':4}</code> using <code>{<strong>d1, </strong>d2}</code>. Print result. Which value wins for key <code>''b''</code>?</p></div>
<div class="code-cell" id="cell-58">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-58'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-58'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-58"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>.setdefault()</code> to build a frequency counter: loop through <code>''banana''</code>, using <code>d.setdefault(char, 0)</code> then incrementing. Print the dict.</p></div>
<div class="code-cell" id="cell-59">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-59'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-59'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-59"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Create a dict comprehension: <code>{x: x**2 for x in range(1, 6)}</code>. Then filter: keep only entries where value > 10. Print both.</p></div>
<div class="code-cell" id="cell-60">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-60'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-60'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-60"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Type Inspector):</strong> Write a function <code>inspect(value)</code> that prints: the value, <code>type()</code>, <code>isinstance()</code> checks against int/float/str/bool/list/dict, truthiness (<code>bool()</code>), and <code>sys.getsizeof()</code>. Test with 6 different types.</p></div>
<div class="code-cell" id="cell-61">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-61'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-61'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-61"># Task 1 Solution</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Type Converter):</strong> Write a function <code>smart_convert(value)</code> that takes a string and returns: <code>int</code> if it''s a whole number, <code>float</code> if decimal, <code>bool</code> if ''true''/''false'', <code>None</code> if ''none''/empty, else the original string. Test with 8 inputs.</p></div>
<div class="code-cell" id="cell-62">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-62'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-62'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-62"># Task 2 Solution</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Data Record):</strong> Build a complete record using ALL types: <code>{''id'':1, ''name'':''Alice'', ''salary'':85000.50, ''is_active'':True, ''skills'':[''Python'',''SQL''], ''scores'':(90,85,92), ''tags'':{''senior'',''lead''}, ''manager'':None}</code>. Access and print each field with its type.</p></div>
<div class="code-cell" id="cell-63">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-63'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-63'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-63"># Task 3 Solution</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Mutable vs Immutable Lab):</strong> Write experiments proving: strings, tuples, ints are immutable (show id changes on ''modification''). Lists, dicts, sets are mutable (show id stays same). Print <code>id()</code> before and after each operation.</p></div>
<div class="code-cell" id="cell-64">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-64'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-64'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-64"># Task 4 Solution</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Type Gotchas):</strong> Demonstrate 5 common type pitfalls: (1) <code>0.1+0.2!=0.3</code>, (2) mutable default args, (3) <code>is</code> vs <code>==</code> for ints >256, (4) list <code>*</code> with nested refs, (5) dict key with unhashable type. Print each gotcha with explanation.</p></div>
<div class="code-cell" id="cell-65">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-65'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-65'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-65"># Task 5 Solution</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-143">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a function <code>type_of(value)</code> that returns a human-readable type name: <code>type_of(42)</code> → <code>''integer''</code>, <code>type_of([1])</code> → <code>''list''</code>. Handle all built-in types.</h3>
</div>
<div class="code-cell" id="cell-66">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-66'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-66'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-66"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-145">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write code that proves Python integers have unlimited precision: compute <code>2**1000</code> and print the number of digits. Compare with other languages.</h3>
</div>
<div class="code-cell" id="cell-67">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-67'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-67'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-67"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-147">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a function <code>safe_cast(value, target_type, default=None)</code> that safely converts between types, returning default on failure.</h3>
</div>
<div class="code-cell" id="cell-68">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-68'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-68'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-68"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-149">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a function <code>deep_type_check(obj)</code> that recursively reports types in nested structures: <code>{''a'': [1, ''hello'', (True, None)]}</code> → full type tree.</h3>
</div>
<div class="code-cell" id="cell-69">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-69'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-69'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-69"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-151">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write code demonstrating that <code>True + True = 2</code> and <code>False * 10 = 0</code>. Use this to count <code>True</code> values in a list using <code>sum()</code>.</h3>
</div>
<div class="code-cell" id="cell-70">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-70'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-70'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-70"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-153">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write a function <code>flatten_types(lst)</code> that takes a mixed list <code>[1, ''a'', [2, [3]], (4,)]</code> and returns a flat list of all atomic values with their types.</h3>
</div>
<div class="code-cell" id="cell-71">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-71'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-71'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-71"># Solution for Q6

list_ = [15, 25, 35]

print(list_.sum())</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-155">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a function <code>is_numeric(value)</code> that returns <code>True</code> for int, float, complex, and numeric strings like <code>''42''</code>, <code>''3.14''</code>, <code>''2+3j''</code>. Handle edge cases.</h3>
</div>
<div class="code-cell" id="cell-72">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-72'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-72'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-72"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-157">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write code showing the difference between <code>==</code> and <code>is</code> for: small ints (cached), large ints, strings (interned), lists, and <code>None</code>.</h3>
</div>
<div class="code-cell" id="cell-73">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-73'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-73'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-73"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-159">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a function <code>coerce_types(a, b)</code> that returns both values cast to the ''wider'' type: int+float→float, float+complex→complex, any+str→str.</h3>
</div>
<div class="code-cell" id="cell-74">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-74'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-74'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-74"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-161">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a function <code>dict_to_namedtuple(name, d)</code> that converts a dict to a namedtuple. Test with <code>{''x'':1, ''y'':2}</code> → <code>Point(x=1, y=2)</code>.</h3>
</div>
<div class="code-cell" id="cell-75">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-75'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-75'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-75"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-163">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a function <code>memory_report(*values)</code> that prints each value, its type, and <code>sys.getsizeof()</code>. Compare: int, float, str, list, tuple, dict, set.</h3>
</div>
<div class="code-cell" id="cell-76">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-76'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-76'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-76"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-165">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write a function <code>validate_record(record, schema)</code> where schema is <code>{''name'': str, ''age'': int, ''active'': bool}</code>. Return list of type mismatches.</h3>
</div>
<div class="code-cell" id="cell-77">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-77'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-77'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-77"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-167">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write code that creates all falsy values in Python: <code>0, 0.0, 0j, '''', [], (), {}, set(), None, False</code>. Verify each with <code>bool()</code>. Then find a surprising truthy value.</h3>
</div>
<div class="code-cell" id="cell-78">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-78'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-78'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-78"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-169">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a function <code>serialize(obj)</code> that converts any Python object to a JSON-compatible type: sets→lists, tuples→lists, None→null. Handle nested structures.</h3>
</div>
<div class="code-cell" id="cell-79">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-79'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-79'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-79"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-171">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a function <code>find_type_mismatches(list1, list2)</code> that compares two lists element-by-element and reports positions where types differ.</h3>
</div>
<div class="code-cell" id="cell-80">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-80'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-80'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-80"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-173">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write a function <code>create_matrix(rows, cols, fill=0)</code> that creates a 2D list correctly (no shallow copy trap). Demonstrate the trap with <code>[[0]<em>cols]</em>rows</code>.</h3>
</div>
<div class="code-cell" id="cell-81">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-81'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-81'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-81"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-175">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a function <code>dict_diff(d1, d2)</code> that returns: keys only in d1, only in d2, in both with same values, in both with different values.</h3>
</div>
<div class="code-cell" id="cell-82">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-82'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-82'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-82"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-177">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a function <code>type_histogram(data)</code> that counts occurrences of each type in a mixed list. Return <code>{''int'': 3, ''str'': 2, ''float'': 1}</code>.</h3>
</div>
<div class="code-cell" id="cell-83">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-83'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-83'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-83"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-179">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write code showing that tuples are hashable but lists are not. Create a dict mapping tuple-keys to values. Show the error with list-keys.</h3>
</div>
<div class="code-cell" id="cell-84">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-84'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-84'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-84"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-181">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a function <code>smart_equals(a, b)</code> that compares with type awareness: <code>smart_equals(1, 1.0)</code> → <code>True</code> but <code>smart_equals(1, ''1'')</code> → <code>False</code>.</h3>
</div>
<div class="code-cell" id="cell-85">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-85'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-85'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-85"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-183">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a function <code>deep_freeze(obj)</code> that recursively converts mutable types to immutable: lists→tuples, sets→frozensets, dicts→frozenset of tuples.</h3>
</div>
<div class="code-cell" id="cell-86">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-86'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-86'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-86"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-185">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a function <code>type_coercion_chain(value, *types)</code> that tries casting value through each type in sequence: <code>type_coercion_chain(''42.5'', int, float)</code> → <code>42.5</code>.</h3>
</div>
<div class="code-cell" id="cell-87">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-87'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-87'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-87"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-187">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write code that demonstrates string interning: <code>a = ''hello''; b = ''hello''; print(a is b)</code>. Then try with <code>a = ''hello world''</code>. Explain the difference.</h3>
</div>
<div class="code-cell" id="cell-88">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-88'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-88'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-88"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-189">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a function <code>build_schema(sample_data)</code> that infers a schema from a list of dicts: <code>{''name'': ''str'', ''age'': ''int'', ''scores'': ''list''}</code>. Handle inconsistent types.</h3>
</div>
<div class="code-cell" id="cell-89">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-89'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-89'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-89"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-191">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a function <code>type_safe_merge(*dicts)</code> that merges dicts but raises <code>TypeError</code> if the same key has different types across dicts.</h3>
</div>
<div class="code-cell" id="cell-90">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-90'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-90'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-90"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 1 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Type</th><th>Focus Area</th><th>Professional Application</th></tr></thead><tbody>
<tr><td>1</td><td><code>int</code></td><td>Topic 1</td><td>Absolute counts, primary IDs</td></tr>
<tr><td>2</td><td><code>float</code></td><td>Topic 2</td><td>Metrics, continuous variables</td></tr>
<tr><td>3</td><td><code>complex</code></td><td>Topic 3</td><td>Scientific computing</td></tr>
<tr><td>4</td><td><code>str</code></td><td>Topic 4</td><td>Text parsing, categorical data</td></tr>
<tr><td>5</td><td><code>bool</code></td><td>Topic 5</td><td>Logic gating, boolean masks</td></tr>
<tr><td>6</td><td><code>list</code></td><td>Topic 6</td><td>Ordered, mutable data streams</td></tr>
<tr><td>7</td><td><code>tuple</code></td><td>Topic 7</td><td>Immutable constraints, fast read</td></tr>
<tr><td>8</td><td><code>set</code></td><td>Topic 8</td><td>O(1) deduplication, set theory</td></tr>
<tr><td>9</td><td><code>dict</code></td><td>Topic 9</td><td>Fast lookups, unstructured rows</td></tr>
<tr><td>10</td><td><code>None</code></td><td>Topic 10</td><td>Explicit null-value handling</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I deeply understand the difference between mutable and immutable types.</p>
<p>• [ ] I know why evaluating <code>set</code> membership is faster than <code>list</code> membership.</p>
<p>• [ ] I understand the relationship between <code>bool</code> and <code>int</code>.</p>
<p>• [ ] I can safely handle <code>NoneType</code> values to prevent runtime errors.</p>
<p>• [ ] I have successfully completed all 5 practice tasks.</p>
<p>• [ ] I have reviewed and internalized all 25 interview questions.</p>
<p><strong>Next Up: Day 2 — Variables, Memory Allocation, and Advanced Type Conversion</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Integer (int) :"}, {"anchor": "checks-int-3", "title": "\ud83e\uddea Checks: int"}, {"anchor": "sec-14", "title": "2. Float (float) : Decimal Numbers & Continuous Metrics"}, {"anchor": "checks-float-16", "title": "\ud83e\uddea Checks: float"}, {"anchor": "sec-27", "title": "3. Complex (complex) : Multi-Dimensional Vectors"}, {"anchor": "checks-complex-29", "title": "\ud83e\uddea Checks: complex"}, {"anchor": "sec-40", "title": "4. String (str) : Unstructured Text Data"}, {"anchor": "checks-str-42", "title": "\ud83e\uddea Checks: str"}, {"anchor": "sec-53", "title": "5. Boolean (bool) : Binary Logic & Masks"}, {"anchor": "checks-bool-55", "title": "\ud83e\uddea Checks: bool"}, {"anchor": "sec-66", "title": "6. NoneType (None) : The Null State"}, {"anchor": "checks-None-68", "title": "\ud83e\uddea Checks: None"}, {"anchor": "sec-79", "title": "7. List (list) : Dynamic & Mutable Sequences"}, {"anchor": "checks-list-81", "title": "\ud83e\uddea Checks: list"}, {"anchor": "sec-92", "title": "8. Tuple (tuple) : Immutable Records"}, {"anchor": "checks-tuple-94", "title": "\ud83e\uddea Checks: tuple"}, {"anchor": "sec-105", "title": "9. Set (set) : O(1) Unique Collections"}, {"anchor": "checks-set-107", "title": "\ud83e\uddea Checks: set"}, {"anchor": "sec-118", "title": "10. Dictionary (dict) : High-Speed Key-Value Stores"}, {"anchor": "checks-dict-120", "title": "\ud83e\uddea Checks: dict"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-143", "title": "Q1."}, {"anchor": "sec-145", "title": "Q2."}, {"anchor": "sec-147", "title": "Q3."}, {"anchor": "sec-149", "title": "Q4."}, {"anchor": "sec-151", "title": "Q5."}, {"anchor": "sec-153", "title": "Q6."}, {"anchor": "sec-155", "title": "Q7."}, {"anchor": "sec-157", "title": "Q8."}, {"anchor": "sec-159", "title": "Q9."}, {"anchor": "sec-161", "title": "Q10."}, {"anchor": "sec-163", "title": "Q11."}, {"anchor": "sec-165", "title": "Q12."}, {"anchor": "sec-167", "title": "Q13."}, {"anchor": "sec-169", "title": "Q14."}, {"anchor": "sec-171", "title": "Q15."}, {"anchor": "sec-173", "title": "Q16."}, {"anchor": "sec-175", "title": "Q17."}, {"anchor": "sec-177", "title": "Q18."}, {"anchor": "sec-179", "title": "Q19."}, {"anchor": "sec-181", "title": "Q20."}, {"anchor": "sec-183", "title": "Q21."}, {"anchor": "sec-185", "title": "Q22."}, {"anchor": "sec-187", "title": "Q23."}, {"anchor": "sec-189", "title": "Q24."}, {"anchor": "sec-191", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48", "cell-49", "cell-50", "cell-51", "cell-52", "cell-53", "cell-54", "cell-55", "cell-56", "cell-57", "cell-58", "cell-59", "cell-60", "cell-61", "cell-62", "cell-63", "cell-64", "cell-65", "cell-66", "cell-67", "cell-68", "cell-69", "cell-70", "cell-71", "cell-72", "cell-73", "cell-74", "cell-75", "cell-76", "cell-77", "cell-78", "cell-79", "cell-80", "cell-81", "cell-82", "cell-83", "cell-84", "cell-85", "cell-86", "cell-87", "cell-88", "cell-89", "cell-90"]'::jsonb),
('day02', '➕ Operators and Expressions', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Operators are the verbs of Python — they act on data. Today we master every operator category, from basic arithmetic to bitwise manipulation and the modern walrus operator. You will learn not just <em>what</em> each operator does, but <em>when</em> and <em>why</em> to use it in professional data pipelines.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Category</th><th>Operators</th><th>Core Use Case</th></tr></thead><tbody>
<tr><td>1</td><td>Arithmetic</td><td><code>+</code>, <code>-</code>, <code><em></code>, <code>/</code>, <code>//</code>, <code>%</code>, <code></em>*</code></td><td>Numeric computations</td></tr>
<tr><td>2</td><td>Assignment</td><td><code>+=</code>, <code>-=</code>, <code>*=</code>, <code>/=</code>, etc.</td><td>In-place modification</td></tr>
<tr><td>3</td><td>Comparison</td><td><code>==</code>, <code>!=</code>, <code><</code>, <code>></code>, <code><=</code>, <code>>=</code></td><td>Filtering & validation</td></tr>
<tr><td>4</td><td>Logical</td><td><code>and</code>, <code>or</code>, <code>not</code></td><td>Boolean logic</td></tr>
<tr><td>5</td><td>Identity & Membership</td><td><code>is</code>, <code>in</code></td><td>Object inspection</td></tr>
<tr><td>6</td><td>Bitwise</td><td><code>&</code>, `\</td><td><code>, </code>^<code>, </code>~<code>, </code><<<code>, </code>>>`</td><td>Binary manipulation</td></tr>
<tr><td>7</td><td>Ternary</td><td><code>x if cond else y</code></td><td>Inline conditionals</td></tr>
<tr><td>8</td><td>Precedence</td><td>(evaluation order)</td><td>Correct formula design</td></tr>
<tr><td>9</td><td>Short-Circuit</td><td><code>and</code>/<code>or</code> early exit</td><td>Safe access patterns</td></tr>
<tr><td>10</td><td>Walrus</td><td><code>:=</code></td><td>Assignment expressions</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Arithmetic Operators : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Numeric Operations</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python has 7 built-in arithmetic operators: <code>+</code> (add), <code>-</code> (subtract), <code><em></code> (multiply), <code>/</code> (true division), <code>//</code> (floor division), <code>%</code> (modulo), and <code></em>*</code> (exponentiation). These are the fundamental building blocks for all numerical computations.</p>
<p><strong>Quick Reference:</strong></p>
<table>
<thead><tr><th>Operator</th><th>Name</th><th>Example</th><th>Result</th></tr></thead><tbody>
<tr><td><code>+</code></td><td>Addition</td><td><code>7 + 3</code></td><td><code>10</code></td></tr>
<tr><td><code>-</code></td><td>Subtraction</td><td><code>7 - 3</code></td><td><code>4</code></td></tr>
<tr><td><code>*</code></td><td>Multiplication</td><td><code>7 * 3</code></td><td><code>21</code></td></tr>
<tr><td><code>/</code></td><td>True Division</td><td><code>7 / 3</code></td><td><code>2.333...</code></td></tr>
<tr><td><code>//</code></td><td>Floor Division</td><td><code>7 // 3</code></td><td><code>2</code></td></tr>
<tr><td><code>%</code></td><td>Modulo</td><td><code>7 % 3</code></td><td><code>1</code></td></tr>
<tr><td><code>**</code></td><td>Power</td><td><code>2 ** 10</code></td><td><code>1024</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Financial calculations</strong>: <code>profit = revenue - costs</code></p>
<p>• <strong>Metrics generation</strong>: <code>margin = (profit / revenue) * 100</code></p>
<p>• <strong>Batch processing</strong>: Using modulo <code>%</code> to execute code every Nth row</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Division Always Returns Float</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>The <code>/</code> operator <b>always</b> returns a float, even if the result is whole: <code>10 / 2</code> → <code>5.0</code>. Use <code>//</code> for integer results.</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Exponentiation evaluates right-to-left: <code>2<strong>3</strong>2</code> = <code>2<strong>(3</strong>2)</code> = <code>2<strong>9</code> = 512, not <code>(2</strong>3)**2</code> = 64.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">revenue = 150000
costs   = 87500
profit  = revenue - costs
margin  = (profit / revenue) * 100
print(f&#x27;Profit: ${profit:,}&#x27;)
print(f&#x27;Margin: {margin:.1f}%&#x27;)

# Floor division and modulo
print(17 // 5)   # 3
print(17 %  5)   # 2
print(2 ** 10)   # 1024</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Arithmetic-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Arithmetic</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Compute <code>17 // 5</code> and <code>17 % 5</code>. Verify: <code>5 * (17//5) + (17%5) == 17</code>. Print all values and the verification.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write code that computes the area of a circle with radius <code>r = 7.5</code> using <code>pi = 3.14159</code>. Print the result rounded to 2 decimal places.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Given <code>x = -7</code> and <code>y = 2</code>, compute <code>x / y</code>, <code>x // y</code>, and <code>x % y</code>. Explain why <code>x // y</code> is <code>-4</code> and not <code>-3</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write code to extract the tens digit from <code>n = 4567</code> using only <code>//</code> and <code>%</code> operators. Print the result.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Compute <code>2<strong>3</strong>2</code> and <code>(2<strong>3)</strong>2</code>. Print both results and explain why they differ (right-to-left associativity).</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Assignment Operators : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">In-Place Operations</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Assignment operators combine an arithmetic or bitwise operation with assignment. Instead of writing <code>x = x + 5</code>, you write <code>x += 5</code>. Python supports: <code>+=</code>, <code>-=</code>, <code><em>=</code>, <code>/=</code>, <code>//=</code>, <code>%=</code>, <code></em>*=</code>, and bitwise variants.</p>
<table>
<thead><tr><th>Operator</th><th>Equivalent</th><th>Example</th></tr></thead><tbody>
<tr><td><code>x += 5</code></td><td><code>x = x + 5</code></td><td>Accumulate totals</td></tr>
<tr><td><code>x -= 3</code></td><td><code>x = x - 3</code></td><td>Decrease counters</td></tr>
<tr><td><code>x *= 2</code></td><td><code>x = x * 2</code></td><td>Scale values</td></tr>
<tr><td><code>x //= 4</code></td><td><code>x = x // 4</code></td><td>Integer reduction</td></tr>
<tr><td><code>x **= 2</code></td><td><code>x = x ** 2</code></td><td>Square values</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Running totals</strong>: Accumulating sums in loops: <code>total += row_value</code></p>
<p>• <strong>Counter patterns</strong>: <code>count += 1</code> is the most common pattern in data pipelines</p>
<p>• <strong>Scaling</strong>: Normalize columns: <code>col *= scale_factor</code></p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Immutable Types</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>For immutable types like <code>str</code> and <code>tuple</code>, <code>+=</code> creates a <b>new object</b> rather than modifying in-place. This can be a performance trap in tight loops.</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Use <code>x <em>= -1</code> to flip the sign of a number. Use <code>x </em>*= 0.5</code> for square root.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">total = 0
for sale in [150, 230, 180, 410]:
    total += sale
print(f&#x27;Total sales: ${total:,}&#x27;)

# Compound assignments
x = 100
x //= 3    # 33
x **= 2    # 1089
print(x)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Assignment-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Assignment</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Start with <code>balance = 1000</code>. Apply these in order: <code>+= 500</code>, <code>-= 200</code>, <code>*= 1.1</code>, <code>//= 1</code>. Print balance after each step.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a loop that computes <code>n! (factorial)</code> for <code>n = 10</code> using only <code>*=</code>. Print the result and verify with <code>math.factorial(10)</code>.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create <code>text = "Hello"</code>. Use <code>+=</code> to append <code>" World"</code>. Then check if <code>id(text)</code> changed (proving a new object was created). Print both IDs.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Start with <code>x = 256</code>. Apply <code>//= 2</code> repeatedly in a loop until <code>x < 1</code>. Count and print how many iterations it took.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write code that uses <code>%=</code> to keep an angle within 0-359 degrees. Test with <code>angle = 750</code>. Print the normalized angle.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Comparison Operators : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Relational Logic</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Comparison operators evaluate two values and return a <code>bool</code> (<code>True</code> or <code>False</code>). Python supports: <code>==</code>, <code>!=</code>, <code>&lt;</code>, <code>&gt;</code>, <code>&lt;=</code>, <code>&gt;=</code>. A unique Python feature is <b>chained comparisons</b>: <code>1 &lt; x &lt; 10</code>.</p>
<table>
<thead><tr><th>Operator</th><th>Meaning</th><th>Example</th></tr></thead><tbody>
<tr><td><code>==</code></td><td>Equal to</td><td><code>5 == 5</code> → <code>True</code></td></tr>
<tr><td><code>!=</code></td><td>Not equal</td><td><code>5 != 3</code> → <code>True</code></td></tr>
<tr><td><code><</code></td><td>Less than</td><td><code>3 < 5</code> → <code>True</code></td></tr>
<tr><td><code>></code></td><td>Greater than</td><td><code>5 > 3</code> → <code>True</code></td></tr>
<tr><td><code><=</code></td><td>Less or equal</td><td><code>5 <= 5</code> → <code>True</code></td></tr>
<tr><td><code>>=</code></td><td>Greater or equal</td><td><code>6 >= 5</code> → <code>True</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data filtering</strong>: <code>df[df[''age''] >= 18]</code> — core of pandas filtering</p>
<p>• <strong>Validation</strong>: Check thresholds: <code>if revenue > target:</code></p>
<p>• <strong>Sorting logic</strong>: Custom sort keys rely on <code><</code> and <code>></code> comparisons</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ == vs is</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>==</code> checks <b>value equality</b>, <code>is</code> checks <b>identity</b> (same object in memory). Never use <code>is</code> to compare values; use it only for <code>None</code> checks: <code>if x is None</code>.
</div>
<h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Python supports chained comparisons: <code>0 &lt;= x &lt; 100</code> is equivalent to <code>0 &lt;= x and x &lt; 100</code> but cleaner and faster.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">score = 78
print(score &gt;= 60)    # True
print(score == 100)   # False

# Chained comparison
age = 25
print(18 &lt;= age &lt; 65)  # True — working age

# Comparing different types
print(1 == 1.0)   # True (value equality)
print(1 is 1.0)   # False (different objects)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Comparison-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Comparison</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>a = 10</code> and <code>b = 10.0</code>, test <code>a == b</code> and <code>a is b</code>. Print results and explain the difference between value equality and identity.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a chained comparison that checks if <code>temperature = 37.5</code> is in the "normal" range (36.1 to 37.2). Print the result.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Compare strings: <code>"apple" < "banana"</code>, <code>"Apple" < "apple"</code>. Print results and explain how Python compares strings (lexicographic, Unicode order).</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write code that finds the maximum of three numbers <code>a, b, c</code> using only comparison operators (no <code>max()</code> built-in). Test with <code>a=15, b=42, c=8</code>.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Demonstrate that <code>None == None</code> is <code>True</code> but <code>None == 0</code> is <code>False</code> and <code>None == False</code> is <code>False</code>. Why should you always use <code>is None</code> instead?</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-40">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>4. Logical Operators : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Boolean Algebra</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python has three logical operators: <code>and</code>, <code>or</code>, and <code>not</code>. They combine boolean expressions. Crucially, <code>and</code> and <code>or</code> use <b>short-circuit evaluation</b> — they stop evaluating as soon as the result is determined.</p>
<table>
<thead><tr><th>Operator</th><th>Returns True if...</th><th>Short-circuits when...</th></tr></thead><tbody>
<tr><td><code>and</code></td><td>Both operands are truthy</td><td>Left operand is falsy</td></tr>
<tr><td><code>or</code></td><td>At least one is truthy</td><td>Left operand is truthy</td></tr>
<tr><td><code>not</code></td><td>Operand is falsy</td><td>Never</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Multi-condition filters</strong>: <code>df[(df[''age''] > 18) & (df[''score''] > 90)]</code></p>
<p>• <strong>Data validation</strong>: <code>if name and len(name) > 0:</code> — safe null checking</p>
<p>• <strong>Default values</strong>: <code>result = value or ''N/A''</code> — using <code>or</code> for defaults</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ and/or Return Values, Not Booleans</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>and</code> returns the first falsy value or the last value. <code>or</code> returns the first truthy value or the last value. <code>''hello'' and 42</code> → <code>42</code>, not <code>True</code>.
</div>
<h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>value or default</code> is a common Python idiom for providing default values: <code>name = user_input or ''Anonymous''</code>.
</div></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19">age, income = 25, 55000

# Multi-condition check
if age &gt;= 18 and income &gt;= 50000:
    print(&#x27;Loan approved&#x27;)

# Short-circuit: second part never runs
x = 0
result = x and (10 / x)  # No ZeroDivisionError!
print(result)  # 0

# or for defaults
name = &#x27;&#x27; or &#x27;Anonymous&#x27;
print(name)  # Anonymous</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Logical-42">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Logical</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>x = 5</code>, evaluate and print: <code>x > 3 and x < 10</code>, <code>x > 3 or x < 2</code>, <code>not(x > 3 and x < 10)</code>. Explain each result.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Demonstrate short-circuit evaluation: write code where <code>and</code> prevents a <code>ZeroDivisionError</code>. Print a message proving the second operand was never evaluated.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write code showing that <code>"hello" and 42</code> returns <code>42</code>, while <code>"" and 42</code> returns <code>""</code>. Explain why <code>and</code>/<code>or</code> return values, not booleans.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a function <code>is_valid_age(age)</code> that returns <code>True</code> only if age is an integer, positive, and less than 150. Use <code>and</code> chaining.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>or</code> to set defaults: given <code>user_name = ""</code> and <code>fallback = "Guest"</code>, compute <code>display_name = user_name or fallback</code>. Print the result.</p></div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-53">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>5. Identity & Membership : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Object Inspection</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <b>Identity operators</b> (<code>is</code>, <code>is not</code>) check whether two variables point to the <b>same object</b> in memory. <b>Membership operators</b> (<code>in</code>, <code>not in</code>) check whether a value exists inside a container (list, tuple, dict, set, string).
</div></div>
<table>
<thead><tr><th>Operator</th><th>Purpose</th><th>Example</th></tr></thead><tbody>
<tr><td><code>is</code></td><td>Same object?</td><td><code>x is None</code></td></tr>
<tr><td><code>is not</code></td><td>Different objects?</td><td><code>x is not None</code></td></tr>
<tr><td><code>in</code></td><td>Value in container?</td><td><code>''a'' in ''abc''</code> → <code>True</code></td></tr>
<tr><td><code>not in</code></td><td>Value absent?</td><td><code>5 not in [1,2,3]</code> → <code>True</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Null checking</strong>: <code>if value is None:</code> — the Pythonic way to check for null</p>
<p>• <strong>Data validation</strong>: <code>if col in df.columns:</code> — safe column access</p>
<p>• <strong>Search & lookup</strong>: <code>if key in my_dict:</code> — O(1) dict membership</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Integer Caching</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Python caches integers from <code>-5</code> to <code>256</code>. So <code>a = 100; b = 100; a is b</code> → <code>True</code>, but <code>a = 1000; b = 1000; a is b</code> → <code>False</code> (different objects, same value).</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>For <code>dict</code> and <code>set</code>, <code>in</code> is O(1). For <code>list</code>, <code>in</code> is O(n). Choose your data structure wisely for frequent membership tests.</p>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Identity
a = [1, 2, 3]
b = a
c = [1, 2, 3]
print(a is b)      # True — same object
print(a is c)      # False — same value, different object
print(a == c)      # True — value equality

# Membership
print(&#x27;P&#x27; in &#x27;Python&#x27;)           # True
print(5 in [1, 2, 3, 4, 5])     # True
print(&#x27;age&#x27; in {&#x27;name&#x27;: &#x27;Ali&#x27;}) # False — checks keys</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Identity & Membership-55">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Identity & Membership</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>a = [1, 2]</code> and <code>b = a</code> and <code>c = [1, 2]</code>. Test <code>a is b</code>, <code>a is c</code>, <code>a == c</code>. Print results and explain each.</p></div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Demonstrate Python''s integer caching: test <code>a = 256; b = 256; print(a is b)</code> then <code>a = 257; b = 257; print(a is b)</code>. Explain the results.</p></div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write code that checks if a column name <code>"salary"</code> exists in a list of column headers <code>["name", "age", "salary", "dept"]</code>. Use the <code>in</code> operator.</p></div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Given <code>d = {"x": 1, "y": 2}</code>, demonstrate that <code>in</code> checks keys (not values): test <code>"x" in d</code> and <code>1 in d</code>. Print results.</p></div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write code showing <code>None is None</code> is <code>True</code> (singleton pattern). Then show why <code>if x is None:</code> is preferred over <code>if x == None:</code> (custom <code><strong>eq</strong></code> risk).</p></div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>6. Bitwise Operators : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Binary-Level Control</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Bitwise operators work on the binary (base-2) representation of integers. Python supports: <code>&amp;</code> (AND), <code>|</code> (OR), <code>^</code> (XOR), <code>~</code> (NOT), <code>&lt;&lt;</code> (left shift), <code>&gt;&gt;</code> (right shift).</p>
<table>
<thead><tr><th>Operator</th><th>Name</th><th>Example</th><th>Result</th></tr></thead><tbody>
<tr><td><code>&</code></td><td>AND</td><td><code>5 & 3</code></td><td><code>1</code></td></tr>
<tr><td>`\</td><td>`</td><td>OR</td><td>`5 \</td><td>3`</td><td><code>7</code></td></tr>
<tr><td><code>^</code></td><td>XOR</td><td><code>5 ^ 3</code></td><td><code>6</code></td></tr>
<tr><td><code>~</code></td><td>NOT</td><td><code>~5</code></td><td><code>-6</code></td></tr>
<tr><td><code><<</code></td><td>Left shift</td><td><code>5 << 1</code></td><td><code>10</code></td></tr>
<tr><td><code>>></code></td><td>Right shift</td><td><code>5 >> 1</code></td><td><code>2</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Flag management</strong>: Using bitmasks to store multiple boolean flags in one integer</p>
<p>• <strong>Performance</strong>: Left shift <code><< 1</code> is faster multiplication by 2</p>
<p>• <strong>Hashing</strong>: XOR is used in hash functions and checksums</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>n &amp; 1</code> checks if <code>n</code> is odd (returns 1) or even (returns 0). <code>n &amp; (n-1)</code> checks if <code>n</code> is a power of 2 (returns 0 if yes).
</div></div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31">a, b = 12, 10  # 1100, 1010 in binary
print(f&#x27;{a} &amp; {b}  = {a &amp; b}&#x27;)    # 8  (1000)
print(f&#x27;{a} | {b}  = {a | b}&#x27;)    # 14 (1110)
print(f&#x27;{a} ^ {b}  = {a ^ b}&#x27;)    # 6  (0110)
print(f&#x27;{a} &lt;&lt; 1 = {a &lt;&lt; 1}&#x27;)     # 24 (multiply by 2)
print(f&#x27;{a} &gt;&gt; 1 = {a &gt;&gt; 1}&#x27;)     # 6  (divide by 2)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Bitwise-68">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Bitwise</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Convert <code>a = 12</code> and <code>b = 10</code> to binary using <code>bin()</code>. Then compute <code>a & b</code>, <code>a | b</code>, <code>a ^ b</code> and verify the results match the binary math.</p></div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write code that uses <code><< 1</code> to multiply by 2 and <code>>> 1</code> to divide by 2. Test with <code>n = 42</code>. Compare results with <code>* 2</code> and <code>// 2</code>.</p></div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a function <code>is_odd(n)</code> using <code>n & 1</code>. Test with 5 numbers. Explain why this works at the binary level.</p></div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a function <code>is_power_of_two(n)</code> using <code>n & (n - 1) == 0</code>. Test with <code>[1, 2, 3, 4, 8, 16, 18]</code>. Handle edge case <code>n <= 0</code>.</p></div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Compute <code>~5</code> and explain why the result is <code>-6</code>. Relate it to two''s complement: <code>~n = -(n+1)</code>.</p></div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-79">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>7. Ternary Operator : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Inline Conditionals</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>The ternary (conditional) operator provides a one-line <code>if-else</code> expression: <code>value_if_true if condition else value_if_false</code>. It is an <b>expression</b> (returns a value), not a statement.</p>
<pre class="nb-code-block"><code>status = &#x27;Adult&#x27; if age &gt;= 18 else &#x27;Minor&#x27;</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Column creation</strong>: <code>df[''label''] = df[''val''].apply(lambda x: ''High'' if x > 50 else ''Low'')</code></p>
<p>• <strong>Default handling</strong>: <code>name = input_val if input_val else ''Unknown''</code></p>
<p>• <strong>Compact logic</strong>: Replace 4-line if/else blocks with clean one-liners</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Nested Ternaries</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Nesting ternaries like <code>''A'' if x > 90 else ''B'' if x > 80 else ''C''</code> works but reduces readability. Use sparingly.</p>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37">age = 20
status = &#x27;Adult&#x27; if age &gt;= 18 else &#x27;Minor&#x27;
print(status)  # Adult

# Nested (use sparingly)
score = 85
grade = &#x27;A&#x27; if score &gt;= 90 else &#x27;B&#x27; if score &gt;= 80 else &#x27;C&#x27; if score &gt;= 70 else &#x27;F&#x27;
print(f&#x27;Score {score} → Grade {grade}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Ternary-81">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Ternary</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>x = -5</code>, use the ternary operator to compute <code>abs_x</code> (absolute value) without using <code>abs()</code>. Print the result.</p></div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a ternary expression that returns <code>"even"</code> if <code>n</code> is even, <code>"odd"</code> otherwise. Test with <code>n = 7</code> and <code>n = 12</code>.</p></div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use a nested ternary to classify <code>temp = 35</code> as <code>"Cold"</code> (< 15), <code>"Warm"</code> (15-30), or <code>"Hot"</code> (> 30). Print the result.</p></div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a ternary that sets <code>discount = 0.2 if is_member else 0.05</code>. Test with <code>is_member = True</code> and <code>is_member = False</code>.</p></div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use a ternary inside an f-string: <code>f"You have {n} item{''s'' if n != 1 else ''''}"</code>. Test with <code>n = 1</code> and <code>n = 5</code>.</p></div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>8. Operator Precedence : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Order of Evaluation</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>When an expression has multiple operators, Python follows a strict <b>precedence hierarchy</b>. Higher-precedence operators are evaluated first. When precedence is equal, <b>associativity</b> (left-to-right or right-to-left) determines the order.</p>
<table>
<thead><tr><th>Priority</th><th>Operators</th><th>Associativity</th></tr></thead><tbody>
<tr><td>Highest</td><td><code>**</code></td><td>Right-to-left</td></tr>
<tr><td></td><td><code>~</code>, <code>+x</code>, <code>-x</code> (unary)</td><td>Right-to-left</td></tr>
<tr><td></td><td><code>*</code>, <code>/</code>, <code>//</code>, <code>%</code></td><td>Left-to-right</td></tr>
<tr><td></td><td><code>+</code>, <code>-</code></td><td>Left-to-right</td></tr>
<tr><td></td><td><code><<</code>, <code>>></code></td><td>Left-to-right</td></tr>
<tr><td></td><td><code><</code>, <code><=</code>, <code>></code>, <code>>=</code>, <code>==</code>, <code>!=</code></td><td>Left-to-right</td></tr>
<tr><td></td><td><code>not</code></td><td>Right-to-left</td></tr>
<tr><td></td><td><code>and</code></td><td>Left-to-right</td></tr>
<tr><td>Lowest</td><td><code>or</code></td><td>Left-to-right</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Debugging</strong>: Understanding precedence prevents subtle calculation bugs</p>
<p>• <strong>Code clarity</strong>: Explicit parentheses make complex formulas readable</p>
<p>• <strong>Formula translation</strong>: Converting math formulas to code requires correct operator order</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>When in doubt, <b>use parentheses</b>. They cost nothing at runtime and prevent bugs: <code>(a + b) * c</code> is clearer than relying on precedence.</p>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Without parentheses — precedence matters
print(2 + 3 * 4)       # 14, not 20
print(2 ** 3 ** 2)     # 512 (right-to-left)
print(10 - 3 - 2)      # 5 (left-to-right)

# Explicit parentheses for clarity
result = (2 + 3) * 4   # 20
print(result)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Precedence-94">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Precedence</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Evaluate <code>2 + 3 <em> 4 </em>* 2</code> by hand, then verify with Python. Write out the step-by-step evaluation order.</p></div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write code showing that <code>not True or False and True</code> evaluates differently than <code>not (True or False) and True</code>. Print both results.</p></div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Given <code>x = 10</code>, evaluate <code>x > 5 and x < 20 or x == 0</code>. Add parentheses to make the intent explicit. Test both versions.</p></div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Demonstrate right-to-left associativity: compute <code>2 <strong> 3 </strong> 2</code> and <code>(2 <strong> 3) </strong> 2</code>. Print and explain the difference.</p></div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write the formula for BMI: <code>weight / height ** 2</code>. Test with <code>weight = 70, height = 1.75</code>. Does Python evaluate it correctly without parentheses? Verify.</p></div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-105">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>9. Short-Circuit Evaluation : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Lazy Boolean Logic</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Short-circuit evaluation means Python <b>stops evaluating</b> a boolean expression as soon as the result is determined. For <code>and</code>, if the left operand is falsy, the right is never evaluated. For <code>or</code>, if the left is truthy, the right is skipped.</p>
<pre class="nb-code-block"><code># If x is 0, (10/x) is NEVER executed — no error!
result = x != 0 and (10 / x) &gt; 2</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Safe access</strong>: <code>if key in d and d[key] > 0:</code> — prevents KeyError</p>
<p>• <strong>Guard clauses</strong>: <code>if obj is not None and obj.value > 0:</code> — prevents AttributeError</p>
<p>• <strong>Performance</strong>: Skip expensive checks when a cheaper one already determines the result</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Side Effects</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If the right operand has side effects (printing, modifying state), short-circuiting may silently skip them. Never rely on side effects in boolean expressions.</p>
<div class="code-cell" id="cell-49">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-49'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-49'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-49"># Short-circuit prevents ZeroDivisionError
x = 0
safe = x != 0 and (10 / x) &gt; 2
print(safe)  # False — division never happens

# or short-circuits on first truthy value
name = &#x27;&#x27; or &#x27;Default&#x27;
print(name)  # Default

# Practical guard clause
data = None
if data is not None and len(data) &gt; 0:
    print(&#x27;Has data&#x27;)
else:
    print(&#x27;No data&#x27;)  # This prints</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Short-Circuit-107">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Short-Circuit</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write code where <code>and</code> short-circuits to prevent a <code>ZeroDivisionError</code>. Use <code>x = 0</code> and <code>10 / x</code>. Print a message proving the division was skipped.</p></div>
<div class="code-cell" id="cell-50">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-50'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-50'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-50"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a function with a side effect (increments a counter). Show that <code>False and side_effect()</code> never calls the function. Print the counter.</p></div>
<div class="code-cell" id="cell-51">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-51'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-51'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-51"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>or</code> short-circuit to provide a default: <code>config = user_config or default_config</code>. Test with <code>user_config = {}</code> and <code>user_config = None</code>.</p></div>
<div class="code-cell" id="cell-52">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-52'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-52'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-52"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a guard clause: <code>if lst is not None and len(lst) > 0:</code> that safely handles <code>lst = None</code>. Show it prevents <code>TypeError</code>.</p></div>
<div class="code-cell" id="cell-53">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-53'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-53'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-53"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Demonstrate that <code>True or print("hi")</code> never prints, but <code>False or print("hi")</code> does. Explain why.</p></div>
<div class="code-cell" id="cell-54">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-54'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-54'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-54"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-118">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>10. Walrus Operator (:=) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Assignment Expressions</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Introduced in Python 3.8, the walrus operator <code>:=</code> assigns a value to a variable <b>as part of an expression</b>. It eliminates the need to compute a value on one line and use it on the next.</p>
<pre class="nb-code-block"><code># Before walrus
data = get_data()
if data:
    process(data)

# After walrus
if (data := get_data()):
    process(data)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Loop optimization</strong>: Avoid calling expensive functions twice in while-loops</p>
<p>• <strong>List comprehensions</strong>: Filter and transform in one pass: <code>[y for x in data if (y := transform(x)) > 0]</code></p>
<p>• <strong>Inline validation</strong>: <code>if (n := len(data)) > 100: print(f''{n} records'')</code></p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Readability</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>The walrus operator can reduce readability if overused. Only use it when it genuinely eliminates redundancy.</p>
<div class="code-cell" id="cell-55">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-55'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-55'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-55">import re
text = &#x27;Hello World 2024&#x27;

# Without walrus
match = re.search(r&#x27;\d+&#x27;, text)
if match:
    print(f&#x27;Found number: {match.group()}&#x27;)

# With walrus — more concise
if (m := re.search(r&#x27;\d+&#x27;, text)):
    print(f&#x27;Found: {m.group()}&#x27;)

# In a list comprehension
data = [1, 5, 12, 3, 18, 7]
results = [y for x in data if (y := x * 2) &gt; 10]
print(results)  # [24, 36, 14]</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Walrus-120">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Walrus</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Rewrite this using the walrus operator: <code>n = len(data); if n > 5: print(n)</code>. Test with <code>data = [1,2,3,4,5,6]</code>.</p></div>
<div class="code-cell" id="cell-56">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-56'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-56'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-56"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>:=</code> in a while loop: read from a list until you find a negative number. Print each positive number as you go.</p></div>
<div class="code-cell" id="cell-57">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-57'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-57'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-57"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>:=</code> in a list comprehension to filter and transform: from <code>[1,2,3,4,5]</code>, keep only values where <code>x**2 > 10</code>. Print the squares.</p></div>
<div class="code-cell" id="cell-58">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-58'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-58'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-58"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>:=</code> with <code>re.search</code> to extract and print the first email address from <code>text = "Contact us at info@company.com for details"</code>.</p></div>
<div class="code-cell" id="cell-59">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-59'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-59'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-59"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write code comparing the readability of a 4-line pattern vs walrus operator. When is walrus helpful vs harmful? Add comments explaining.</p></div>
<div class="code-cell" id="cell-60">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-60'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-60'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-60"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Expression Evaluator):</strong> Write a function <code>evaluate(a, op, b)</code> that takes two numbers and an operator string (<code>''+'', ''-'', ''<em>'', ''/'', ''//'', ''%'', ''</em>*''</code>) and returns the result. Handle division by zero gracefully. Test all 7 operators.</p></div>
<div class="code-cell" id="cell-61">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-61'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-61'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-61"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Grade Classifier):</strong> Given <code>score = 78</code>, use chained comparisons and logical operators to classify: A(90+), B(80-89), C(70-79), D(60-69), F(<60). Print the grade with an f-string.</p></div>
<div class="code-cell" id="cell-62">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-62'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-62'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-62"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Bit Counter):</strong> Use <code>%</code> and <code>//</code> operators to count how many digits are in a number <code>n = 123456</code>. Also compute the sum of its digits. No string conversion allowed.</p></div>
<div class="code-cell" id="cell-63">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-63'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-63'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-63"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Leap Year Checker):</strong> Write a leap year checker using logical operators: divisible by 4 AND (not divisible by 100 OR divisible by 400). Test with: 2000, 1900, 2024, 2023.</p></div>
<div class="code-cell" id="cell-64">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-64'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-64'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-64"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Bill Splitter):</strong> Given <code>total = 156.75</code>, <code>num_people = 4</code>, <code>tip_pct = 0.18</code>, compute: tip amount, total with tip, per-person share (rounded to 2 decimal places). Print a formatted receipt.</p></div>
<div class="code-cell" id="cell-65">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-65'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-65'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-65"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-143">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a function <code>is_power_of_two(n)</code> using only bitwise operators (no loops, no log). Hint: <code>n & (n-1) == 0</code>. Handle edge cases.</h3>
</div>
<div class="code-cell" id="cell-66">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-66'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-66'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-66"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-145">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write code to check if a number is even using: (a) modulo, (b) bitwise AND, (c) integer division. Show all three return the same result.</h3>
</div>
<div class="code-cell" id="cell-67">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-67'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-67'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-67"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-147">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a function <code>clamp(value, min_val, max_val)</code> that restricts a value to a range. Use <code>min()</code> and <code>max()</code>. Test edge cases.</h3>
</div>
<div class="code-cell" id="cell-68">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-68'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-68'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-68"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-149">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write code demonstrating operator overloading: create a class where <code>+</code> concatenates strings with a separator.</h3>
</div>
<div class="code-cell" id="cell-69">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-69'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-69'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-69"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-151">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a function <code>evaluate(a, op, b)</code> that takes an operator as a string and returns the result. Handle division by zero.</h3>
</div>
<div class="code-cell" id="cell-70">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-70'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-70'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-70"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-153">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write code using only bitwise operators (<code>&</code>,<code>|</code>,<code>^</code>,<code>~</code>,<code><<</code>,<code>>></code>) to: (a) multiply by 2, (b) divide by 2, (c) check if odd.</h3>
</div>
<div class="code-cell" id="cell-71">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-71'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-71'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-71"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-155">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a function <code>compare_floats(a, b, tolerance=1e-9)</code> that correctly handles floating-point comparison. Test with <code>0.1+0.2</code> vs <code>0.3</code>.</h3>
</div>
<div class="code-cell" id="cell-72">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-72'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-72'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-72"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-157">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write code that computes <code>a<strong>b % m</code> efficiently for large numbers using Python''s <code>pow(a, b, m)</code>. Compare with naive <code>(a</strong>b) % m</code>.</h3>
</div>
<div class="code-cell" id="cell-73">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-73'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-73'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-73"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-159">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a function <code>digital_root(n)</code> that repeatedly sums digits until single digit: <code>493</code> → <code>16</code> → <code>7</code>. Use only arithmetic operators.</h3>
</div>
<div class="code-cell" id="cell-74">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-74'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-74'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-74"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-161">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write code demonstrating short-circuit evaluation: create a function with a side effect and show <code>and</code>/<code>or</code> skip it when appropriate.</h3>
</div>
<div class="code-cell" id="cell-75">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-75'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-75'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-75"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-163">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a function <code>negate_without_minus(n)</code> that returns <code>-n</code> without using <code>-</code>. Hint: <code>~n + 1</code> (two''s complement).</h3>
</div>
<div class="code-cell" id="cell-76">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-76'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-76'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-76"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-165">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write a function <code>abs_without_abs(n)</code> using only comparison and arithmetic operators. No <code>abs()</code> built-in.</h3>
</div>
<div class="code-cell" id="cell-77">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-77'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-77'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-77"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-167">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write code demonstrating all 6 comparison operators with a custom class by implementing <code><strong>eq</strong></code>, <code><strong>lt</strong></code>, etc. on a <code>Temperature</code> class.</h3>
</div>
<div class="code-cell" id="cell-78">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-78'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-78'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-78"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-169">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a function <code>count_set_bits(n)</code> that counts the number of 1-bits in binary representation using <code>&</code> and <code>>></code> in a loop.</h3>
</div>
<div class="code-cell" id="cell-79">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-79'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-79'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-79"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-171">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a function <code>is_palindrome_number(n)</code> using only arithmetic operators to reverse digits and compare. No string conversion.</h3>
</div>
<div class="code-cell" id="cell-80">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-80'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-80'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-80"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-173">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write code showing the ternary operator for 2 and 3 categories. Then write a nested ternary for grade classification.</h3>
</div>
<div class="code-cell" id="cell-81">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-81'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-81'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-81"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-175">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a function <code>gcd(a, b)</code> using only modulo and assignment (Euclidean algorithm). Test with several number pairs.</h3>
</div>
<div class="code-cell" id="cell-82">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-82'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-82'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-82"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-177">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write code that computes <code>n!</code> (factorial) using <code>functools.reduce</code> and the <code>*</code> operator. Compare with <code>math.factorial</code>.</h3>
</div>
<div class="code-cell" id="cell-83">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-83'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-83'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-83"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-179">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a function <code>round_to_nearest(value, step)</code> that rounds to nearest multiple: <code>round_to_nearest(17, 5)</code> → <code>15</code>.</h3>
</div>
<div class="code-cell" id="cell-84">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-84'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-84'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-84"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-181">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write code demonstrating <code>//</code> floor division with negative numbers: <code>-7 // 2</code>. Explain floor vs truncation division.</h3>
</div>
<div class="code-cell" id="cell-85">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-85'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-85'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-85"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-183">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a function <code>safe_divide(a, b)</code> returning <code>(quotient, remainder)</code> tuple. Handle: zero division, type errors, negatives.</h3>
</div>
<div class="code-cell" id="cell-86">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-86'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-86'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-86"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-185">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write code using walrus operator to simplify: compute a value and use it in the same expression. Show before/after.</h3>
</div>
<div class="code-cell" id="cell-87">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-87'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-87'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-87"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-187">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a function <code>matrix_scalar_ops(matrix, scalar, op)</code> that applies <code>+,-,*,/</code> between a 2D list and a scalar.</h3>
</div>
<div class="code-cell" id="cell-88">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-88'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-88'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-88"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-189">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a function <code>chained_comparison(x, ranges)</code> where ranges is <code>[(0,10,''low''),(10,50,''mid''),(50,100,''high'')]</code>. Return label.</h3>
</div>
<div class="code-cell" id="cell-89">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-89'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-89'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-89"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-191">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a simple expression evaluator: parse and compute <code>''3 + 4 * 2 - 1''</code> respecting operator precedence.</h3>
</div>
<div class="code-cell" id="cell-90">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-90'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-90'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-90"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 2 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th><th>Professional Application</th></tr></thead><tbody>
<tr><td>1</td><td>Arithmetic</td><td><code>/</code> always float; <code>//</code> floor; <code>%</code> remainder; <code>**</code> power</td><td>Financial calculations, metrics</td></tr>
<tr><td>2</td><td>Assignment</td><td><code>+=</code>, <code>-=</code> modify in-place (except immutables)</td><td>Running totals, counters</td></tr>
<tr><td>3</td><td>Comparison</td><td><code>==</code> value; <code>is</code> identity; chaining supported</td><td>Data filtering, validation</td></tr>
<tr><td>4</td><td>Logical</td><td><code>and</code>/<code>or</code> return values, not booleans</td><td>Multi-condition filters</td></tr>
<tr><td>5</td><td>Identity</td><td><code>is</code> checks memory, <code>in</code> checks membership</td><td>Null checks, lookups</td></tr>
<tr><td>6</td><td>Bitwise</td><td>Binary-level manipulation of integers</td><td>Flags, performance tricks</td></tr>
<tr><td>7</td><td>Ternary</td><td>Inline if-else expression</td><td>Compact conditional logic</td></tr>
<tr><td>8</td><td>Precedence</td><td><code>*<em></code> > <code></em>/</code> > <code>+-</code> > comparisons > <code>not</code> > <code>and</code> > <code>or</code></td><td>Correct formula translation</td></tr>
<tr><td>9</td><td>Short-Circuit</td><td><code>and</code>/<code>or</code> stop early when result is known</td><td>Safe access, guard clauses</td></tr>
<tr><td>10</td><td>Walrus <code>:=</code></td><td>Assign inside expressions (Python 3.8+)</td><td>Loop optimization</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I understand the difference between <code>/</code> (true division) and <code>//</code> (floor division).</p>
<p>• [ ] I know that <code>and</code>/<code>or</code> return actual values, not just <code>True</code>/<code>False</code>.</p>
<p>• [ ] I can use <code>is</code> vs <code>==</code> correctly (identity vs equality).</p>
<p>• [ ] I understand operator precedence and use parentheses for clarity.</p>
<p>• [ ] I can leverage short-circuit evaluation for safe access patterns.</p>
<p>• [ ] I have completed all 5 practice tasks.</p>
<p>• [ ] I have reviewed all 25 interview questions.</p>
<p><strong>Next Up: Day 3 — Strings: Text Processing, Formatting, and Pattern Matching</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Arithmetic Operators : Numeric Operations"}, {"anchor": "checks-Arithmetic-3", "title": "\ud83e\uddea Checks: Arithmetic"}, {"anchor": "sec-14", "title": "2. Assignment Operators : In-Place Operations"}, {"anchor": "checks-Assignment-16", "title": "\ud83e\uddea Checks: Assignment"}, {"anchor": "sec-27", "title": "3. Comparison Operators : Relational Logic"}, {"anchor": "checks-Comparison-29", "title": "\ud83e\uddea Checks: Comparison"}, {"anchor": "sec-40", "title": "4. Logical Operators : Boolean Algebra"}, {"anchor": "checks-Logical-42", "title": "\ud83e\uddea Checks: Logical"}, {"anchor": "sec-53", "title": "5. Identity & Membership : Object Inspection"}, {"anchor": "checks-Identity & Membership-55", "title": "\ud83e\uddea Checks: Identity & Membership"}, {"anchor": "sec-66", "title": "6. Bitwise Operators : Binary-Level Control"}, {"anchor": "checks-Bitwise-68", "title": "\ud83e\uddea Checks: Bitwise"}, {"anchor": "sec-79", "title": "7. Ternary Operator : Inline Conditionals"}, {"anchor": "checks-Ternary-81", "title": "\ud83e\uddea Checks: Ternary"}, {"anchor": "sec-92", "title": "8. Operator Precedence : Order of Evaluation"}, {"anchor": "checks-Precedence-94", "title": "\ud83e\uddea Checks: Precedence"}, {"anchor": "sec-105", "title": "9. Short-Circuit Evaluation : Lazy Boolean Logic"}, {"anchor": "checks-Short-Circuit-107", "title": "\ud83e\uddea Checks: Short-Circuit"}, {"anchor": "sec-118", "title": "10. Walrus Operator (:=) : Assignment Expressions"}, {"anchor": "checks-Walrus-120", "title": "\ud83e\uddea Checks: Walrus"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-143", "title": "Q1."}, {"anchor": "sec-145", "title": "Q2."}, {"anchor": "sec-147", "title": "Q3."}, {"anchor": "sec-149", "title": "Q4."}, {"anchor": "sec-151", "title": "Q5."}, {"anchor": "sec-153", "title": "Q6."}, {"anchor": "sec-155", "title": "Q7."}, {"anchor": "sec-157", "title": "Q8."}, {"anchor": "sec-159", "title": "Q9."}, {"anchor": "sec-161", "title": "Q10."}, {"anchor": "sec-163", "title": "Q11."}, {"anchor": "sec-165", "title": "Q12."}, {"anchor": "sec-167", "title": "Q13."}, {"anchor": "sec-169", "title": "Q14."}, {"anchor": "sec-171", "title": "Q15."}, {"anchor": "sec-173", "title": "Q16."}, {"anchor": "sec-175", "title": "Q17."}, {"anchor": "sec-177", "title": "Q18."}, {"anchor": "sec-179", "title": "Q19."}, {"anchor": "sec-181", "title": "Q20."}, {"anchor": "sec-183", "title": "Q21."}, {"anchor": "sec-185", "title": "Q22."}, {"anchor": "sec-187", "title": "Q23."}, {"anchor": "sec-189", "title": "Q24."}, {"anchor": "sec-191", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48", "cell-49", "cell-50", "cell-51", "cell-52", "cell-53", "cell-54", "cell-55", "cell-56", "cell-57", "cell-58", "cell-59", "cell-60", "cell-61", "cell-62", "cell-63", "cell-64", "cell-65", "cell-66", "cell-67", "cell-68", "cell-69", "cell-70", "cell-71", "cell-72", "cell-73", "cell-74", "cell-75", "cell-76", "cell-77", "cell-78", "cell-79", "cell-80", "cell-81", "cell-82", "cell-83", "cell-84", "cell-85", "cell-86", "cell-87", "cell-88", "cell-89", "cell-90"]'::jsonb),
('day03', '📝 Strings', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Strings are the primary vehicle for text data — the most common data type in real-world datasets. Today we master every aspect of string manipulation, from basic creation to performance optimization. You will learn not just string methods, but professional text processing patterns used in ETL pipelines and data cleaning.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Methods</th><th>Core Use Case</th></tr></thead><tbody>
<tr><td>1</td><td>Creation & Escaping</td><td><code>''''</code>, <code>""</code>, <code>r''''</code>, <code>''''''</code></td><td>File paths, SQL, multi-line</td></tr>
<tr><td>2</td><td>Indexing & Slicing</td><td><code>s[0]</code>, <code>s[1:4]</code>, <code>s[::-1]</code></td><td>Data extraction</td></tr>
<tr><td>3</td><td>Core Methods</td><td><code>.strip()</code>, <code>.replace()</code>, <code>.find()</code></td><td>Data cleaning</td></tr>
<tr><td>4</td><td>Split & Join</td><td><code>.split()</code>, <code>'',''.join()</code></td><td>CSV/text parsing</td></tr>
<tr><td>5</td><td>Formatting</td><td>f-strings, <code>.format()</code></td><td>Reports, dashboards</td></tr>
<tr><td>6</td><td>Validation</td><td><code>.isdigit()</code>, <code>.isalpha()</code></td><td>Input validation</td></tr>
<tr><td>7</td><td>Encoding</td><td><code>.encode()</code>, <code>.decode()</code></td><td>APIs, file I/O</td></tr>
<tr><td>8</td><td>Performance</td><td><code>join()</code> vs <code>+=</code></td><td>Efficient processing</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. String Creation & Escaping : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Text Data Fundamentals</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A string is an <b>immutable sequence of Unicode characters</b>. You can create strings with single quotes <code>''...''</code>, double quotes <code>"..."</code>, or triple quotes <code>''''''...''''''</code> for multi-line text. Raw strings <code>r''...''</code> disable escape character processing.</p>
<table>
<thead><tr><th>Syntax</th><th>Use Case</th><th>Example</th></tr></thead><tbody>
<tr><td><code>''hello''</code></td><td>Simple text</td><td>Most common</td></tr>
<tr><td><code>"it''s"</code></td><td>Text with apostrophes</td><td>Avoids escaping</td></tr>
<tr><td><code>"""..."""</code></td><td>Multi-line / docstrings</td><td>SQL queries, docs</td></tr>
<tr><td><code>r''C:\path''</code></td><td>Raw string (no escapes)</td><td>File paths, regex</td></tr>
</tbody></table>
<p><strong>Common Escape Characters:</strong></p>
<table>
<thead><tr><th>Escape</th><th>Meaning</th><th>Example</th></tr></thead><tbody>
<tr><td><code>\n</code></td><td>Newline</td><td><code>''Line1\nLine2''</code></td></tr>
<tr><td><code>\t</code></td><td>Tab</td><td><code>''Col1\tCol2''</code></td></tr>
<tr><td><code>\\</code></td><td>Backslash</td><td><code>''C:\\Users''</code></td></tr>
<tr><td><code>\''</code></td><td>Single quote</td><td><code>''it\''s''</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>CSV/JSON parsing</strong>: Understanding escape characters is essential for parsing data files</p>
<p>• <strong>SQL queries</strong>: Triple-quoted strings hold multi-line SQL cleanly</p>
<p>• <strong>File paths</strong>: Raw strings <code>r''C:\data\file.csv''</code> prevent escape issues on Windows</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Immutability</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Strings <b>cannot be modified in place</b>. Every operation like <code>.upper()</code> or <code>+</code> creates a <b>new string object</b>. This matters for performance in loops.</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Use triple-quoted strings for multi-line SQL queries: <code>query = """SELECT * FROM users WHERE age > 18"""</code>. This keeps your code readable.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># String creation methods
single = &#x27;Hello&#x27;
double = &quot;World&quot;
multi = &#x27;&#x27;&#x27;This is
a multi-line
string&#x27;&#x27;&#x27;
raw = r&#x27;C:\Users\data\file.csv&#x27;

print(single, double)
print(multi)
print(raw)

# Immutability proof
s = &#x27;hello&#x27;
print(f&#x27;id before: {id(s)}&#x27;)
s = s.upper()
print(f&#x27;id after:  {id(s)}&#x27;)  # Different object!</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Creation-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Creation</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create strings using all 4 methods: single quotes, double quotes, triple quotes, and raw string. Print each with its <code>type()</code> and <code>len()</code>.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a string containing: a newline, a tab, and a backslash. Print it and then print its <code>repr()</code> to see the escape characters.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Prove string immutability: create <code>s = "hello"</code>, save <code>id(s)</code>, then do <code>s += " world"</code>. Compare the IDs. What does this prove?</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a raw string for the Windows path <code>C:\Users\Admin\Documents\data.csv</code>. Then create the same path using escape characters. Verify they are equal.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a multi-line SQL query using triple quotes: <code>SELECT name, age FROM users WHERE age > 18 ORDER BY name</code>. Print it.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Indexing & Slicing : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Precision Text Extraction</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Strings support <b>zero-based indexing</b> and <b>negative indexing</b> (from the end). <b>Slicing</b> extracts substrings using the syntax <code>s[start:stop:step]</code> where <code>stop</code> is exclusive.</p>
<pre class="nb-code-block"><code>text = &#x27;PYTHON&#x27;
#       P  Y  T  H  O  N
#       0  1  2  3  4  5   (positive index)
#      -6 -5 -4 -3 -2 -1  (negative index)</code></pre>
<table>
<thead><tr><th>Operation</th><th>Syntax</th><th>Result</th></tr></thead><tbody>
<tr><td>First char</td><td><code>s[0]</code></td><td><code>''P''</code></td></tr>
<tr><td>Last char</td><td><code>s[-1]</code></td><td><code>''N''</code></td></tr>
<tr><td>Slice</td><td><code>s[1:4]</code></td><td><code>''YTH''</code></td></tr>
<tr><td>Reverse</td><td><code>s[::-1]</code></td><td><code>''NOHTYP''</code></td></tr>
<tr><td>Every 2nd</td><td><code>s[::2]</code></td><td><code>''PTO''</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Column extraction</strong>: Extract substrings from fixed-width data: <code>record[0:10]</code> for name field</p>
<p>• <strong>Data cleaning</strong>: <code>phone[-10:]</code> to extract last 10 digits of phone numbers</p>
<p>• <strong>Log parsing</strong>: Slice timestamps from log lines: <code>log_line[:19]</code> for ISO datetime</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Off-by-One</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>The stop index is <b>exclusive</b>: <code>''PYTHON''[0:3]</code> gives <code>''PYT''</code> (indices 0, 1, 2), not <code>''PYTH''</code>. This is a common source of bugs.</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Reverse a string with <code>s[::-1]</code>. Check for palindromes: <code>s == s[::-1]</code>.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">text = &#x27;Data Analytics&#x27;

# Indexing
print(text[0])     # D
print(text[-1])    # s

# Slicing
print(text[0:4])   # Data
print(text[5:])    # Analytics
print(text[::-1])  # scitylanA ataD

# Practical: extract date parts
iso_date = &#x27;2024-12-25&#x27;
year  = iso_date[:4]
month = iso_date[5:7]
day   = iso_date[8:10]
print(f&#x27;{year}/{month}/{day}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Indexing & Slicing-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Indexing & Slicing</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>s = "Data Analytics"</code>, extract: first word, last word, every other character, and the reversed string. Print each.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>iso_date = "2024-12-25T14:30:00"</code>, use slicing to extract: year, month, day, hour, minute, second. Print a formatted result.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write code to check if <code>word = "racecar"</code> is a palindrome using slicing. Print the result with an explanation.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Given <code>phone = "+91-98765-43210"</code>, use slicing to extract just the 10-digit number (last 10 characters). Print it.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write code that reverses each word in <code>sentence = "Hello World Python"</code> but keeps word order. Use <code>split()</code> and slicing.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Core String Methods : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Search, Replace & Transform</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python strings have 40+ built-in methods. The most important ones for data work are: <code>upper()</code>, <code>lower()</code>, <code>strip()</code>, <code>replace()</code>, <code>find()</code>, <code>count()</code>, <code>startswith()</code>, and <code>endswith()</code>. All return <b>new strings</b> (immutability).</p>
<table>
<thead><tr><th>Method</th><th>Purpose</th><th>Example</th></tr></thead><tbody>
<tr><td><code>.upper()</code> / <code>.lower()</code></td><td>Case conversion</td><td>Standardize text</td></tr>
<tr><td><code>.strip()</code></td><td>Remove whitespace</td><td>Clean user input</td></tr>
<tr><td><code>.replace(old, new)</code></td><td>Replace substrings</td><td>Data correction</td></tr>
<tr><td><code>.find(sub)</code></td><td>Find position (-1 if absent)</td><td>Safe search</td></tr>
<tr><td><code>.count(sub)</code></td><td>Count occurrences</td><td>Frequency analysis</td></tr>
<tr><td><code>.startswith()</code></td><td>Check prefix</td><td>Filter by pattern</td></tr>
<tr><td><code>.endswith()</code></td><td>Check suffix</td><td>File type detection</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data standardization</strong>: <code>name.strip().title()</code> — clean and capitalize names</p>
<p>• <strong>Text cleaning</strong>: <code>text.replace(''\n'', '' '').strip()</code> — normalize whitespace</p>
<p>• <strong>File filtering</strong>: <code>if filename.endswith(''.csv''):</code> — filter file types</p>
<p>• <strong>Search</strong>: <code>.find()</code> returns -1 instead of raising error (safer than <code>.index()</code>)</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ find() vs index()</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>.find()</code> returns <code>-1</code> if not found. <code>.index()</code> raises <code>ValueError</code>. Always prefer <code>.find()</code> for safe searching.
</div>
<h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Chain methods for clean data pipelines: <code>name.strip().lower().replace('' '', ''_'')</code> converts <code>'' John Doe ''</code> to <code>''john_doe''</code>.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">name = &#x27;  John Doe  &#x27;
print(name.strip())          # &#x27;John Doe&#x27;
print(name.strip().lower())  # &#x27;john doe&#x27;
print(name.strip().title())  # &#x27;John Doe&#x27;

email = &#x27;user@company.com&#x27;
print(email.find(&#x27;@&#x27;))       # 4
print(email.endswith(&#x27;.com&#x27;)) # True

text = &#x27;apple banana apple cherry apple&#x27;
print(text.count(&#x27;apple&#x27;))   # 3
print(text.replace(&#x27;apple&#x27;, &#x27;mango&#x27;))  # mango banana mango cherry mango</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-String Methods-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>String Methods</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>name = "  alice SMITH  "</code>, clean it to produce <code>"Alice Smith"</code> using method chaining (<code>strip</code>, <code>title</code>). Print the result.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>csv_line = "John,25,Engineer,NYC"</code>, use <code>.find()</code> to locate the position of the second comma. Print the result.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Count how many times the word <code>"data"</code> appears in <code>text = "Data science uses data to derive data-driven insights"</code> (case-insensitive). Print the count.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Given a list of filenames <code>["report.csv", "image.png", "data.csv", "notes.txt"]</code>, use <code>.endswith()</code> to filter only <code>.csv</code> files. Print the result.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write code that replaces all spaces in <code>"hello world python"</code> with underscores, then converts to uppercase. Chain the methods in one line.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-40">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>4. Splitting & Joining : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Text Decomposition & Assembly</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <code>split()</code> breaks a string into a <b>list</b> of substrings based on a delimiter. <code>join()</code> does the reverse — it combines a list of strings into one string with a separator. These two methods are the backbone of text data processing.
</div></div>
<pre class="nb-code-block"><code># split: string → list
&#x27;a,b,c&#x27;.split(&#x27;,&#x27;)        # [&#x27;a&#x27;, &#x27;b&#x27;, &#x27;c&#x27;]

# join: list → string
&#x27;,&#x27;.join([&#x27;a&#x27;, &#x27;b&#x27;, &#x27;c&#x27;])  # &#x27;a,b,c&#x27;</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>CSV parsing</strong>: <code>row.split('','')</code> — manual CSV field extraction</p>
<p>• <strong>Log analysis</strong>: <code>log_line.split()</code> — split on whitespace for field extraction</p>
<p>• <strong>Data export</strong>: <code>'',''.join(columns)</code> — build CSV rows for output</p>
<p>• <strong>Path building</strong>: <code>''/''.join([''home'', ''user'', ''data''])</code> — construct file paths</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ split() with No Arguments</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>''a  b  c''.split()</code> splits on <b>any whitespace</b> and removes empty strings. <code>''a  b  c''.split('' '')</code> splits on single space only, producing <code>[''a'', '''', ''b'', '''', ''c'']</code>.
</div>
<h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Use <code>splitlines()</code> for multi-line text: it handles <code>\n</code>, <code>\r\n</code>, and <code>\r</code> correctly across all platforms.</p>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Splitting
csv_row = &#x27;Alice,28,Engineer,London&#x27;
fields = csv_row.split(&#x27;,&#x27;)
print(fields)  # [&#x27;Alice&#x27;, &#x27;28&#x27;, &#x27;Engineer&#x27;, &#x27;London&#x27;]
print(f&#x27;Name: {fields[0]}, Age: {fields[1]}&#x27;)

# Joining
words = [&#x27;Data&#x27;, &#x27;Science&#x27;, &#x27;Python&#x27;]
print(&#x27; &#x27;.join(words))    # Data Science Python
print(&#x27; -&gt; &#x27;.join(words))  # Data -&gt; Science -&gt; Python

# split() vs split(&#x27; &#x27;)
text = &#x27;hello   world&#x27;
print(text.split())      # [&#x27;hello&#x27;, &#x27;world&#x27;]
print(text.split(&#x27; &#x27;))   # [&#x27;hello&#x27;, &#x27;&#x27;, &#x27;&#x27;, &#x27;world&#x27;]</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Split & Join-42">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Split & Join</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>csv = "name,age,city,salary"</code>, split into a list, then rejoin with <code>" | "</code> as separator. Print both results.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>path = "/home/user/data/file.csv"</code>, split by <code>"/"</code> and extract just the filename. Print it.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Split <code>text = "one  two   three    four"</code> using both <code>.split()</code> and <code>.split(" ")</code>. Print both results and explain the difference.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Given <code>words = ["SELECT", "name", "FROM", "users"]</code>, join them with spaces to build a SQL query string. Print it.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write code that reads a multi-line string (use triple quotes with 3 lines) and splits it into individual lines using <code>.splitlines()</code>. Print each line with its index.</p></div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-53">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>5. String Formatting : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Professional Output Generation</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python offers three formatting approaches: <b>f-strings</b> (Python 3.6+, fastest and most readable), <code>.format()</code>, and <code>%</code>-formatting (legacy). F-strings embed expressions directly inside <code>{}</code> braces.</p>
<table>
<thead><tr><th>Format Spec</th><th>Meaning</th><th>Example</th><th>Result</th></tr></thead><tbody>
<tr><td><code>:.2f</code></td><td>2 decimal places</td><td><code>f''{3.14159:.2f}''</code></td><td><code>3.14</code></td></tr>
<tr><td><code>:,</code></td><td>Thousands separator</td><td><code>f''{1000000:,}''</code></td><td><code>1,000,000</code></td></tr>
<tr><td><code>:>10</code></td><td>Right-align (width 10)</td><td><code>f''{"hi":>10}''</code></td><td><code>''        hi''</code></td></tr>
<tr><td><code>:<10</code></td><td>Left-align</td><td><code>f''{"hi":<10}''</code></td><td><code>''hi        ''</code></td></tr>
<tr><td><code>:^10</code></td><td>Center-align</td><td><code>f''{"hi":^10}''</code></td><td><code>''    hi    ''</code></td></tr>
<tr><td><code>:.2%</code></td><td>Percentage</td><td><code>f''{0.856:.2%}''</code></td><td><code>85.60%</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Report generation</strong>: Formatted tables, aligned columns, currency values</p>
<p>• <strong>Logging</strong>: <code>f''[{timestamp}] {level}: {message}''</code> — structured log output</p>
<p>• <strong>Dashboard metrics</strong>: <code>f''{revenue:,.2f}''</code> — professional number formatting</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>F-strings can contain any Python expression: <code>f''{len(data):,} records processed in {elapsed:.1f}s''</code>. They are evaluated at runtime.</p>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25">name, age, salary = &#x27;Alice&#x27;, 30, 85432.5

# f-string basics
print(f&#x27;{name} is {age} years old&#x27;)
print(f&#x27;Salary: ${salary:,.2f}&#x27;)

# Alignment
for item, price in [(&#x27;Coffee&#x27;, 4.5), (&#x27;Sandwich&#x27;, 8.99), (&#x27;Juice&#x27;, 3.2)]:
    print(f&#x27;{item:&lt;12} ${price:&gt;6.2f}&#x27;)

# Expressions inside f-strings
data = [1, 2, 3, 4, 5]
print(f&#x27;Sum: {sum(data)}, Avg: {sum(data)/len(data):.1f}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Formatting-55">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Formatting</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>revenue = 1234567.89</code>, print it as currency with commas and 2 decimal places: <code>$1,234,567.89</code>. Use an f-string.</p></div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a formatted table: print 3 products with name (left-aligned, 15 chars) and price (right-aligned, 8 chars, 2 decimals). Use f-string alignment.</p></div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Given <code>ratio = 0.8567</code>, print it as a percentage with 1 decimal place: <code>85.7%</code>. Use the <code>%</code> format specifier.</p></div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Print the number <code>42</code> in binary, octal, and hexadecimal using f-string format specs (<code>:b</code>, <code>:o</code>, <code>:x</code>). Print all three.</p></div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write an f-string that embeds a conditional expression: print <code>"Even"</code> or <code>"Odd"</code> for <code>n = 7</code> directly inside the f-string.</p></div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>6. String Validation Methods : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Data Quality Checks</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python strings have built-in validation methods that return <code>True</code> or <code>False</code>. These are essential for <b>input validation</b> and <b>data quality checks</b> before processing.</p>
<table>
<thead><tr><th>Method</th><th>Returns True if...</th><th>Example</th></tr></thead><tbody>
<tr><td><code>.isdigit()</code></td><td>All characters are digits</td><td><code>''123''.isdigit()</code> → <code>True</code></td></tr>
<tr><td><code>.isalpha()</code></td><td>All characters are letters</td><td><code>''abc''.isalpha()</code> → <code>True</code></td></tr>
<tr><td><code>.isalnum()</code></td><td>Letters or digits only</td><td><code>''abc123''.isalnum()</code> → <code>True</code></td></tr>
<tr><td><code>.isspace()</code></td><td>All whitespace</td><td><code>''  ''.isspace()</code> → <code>True</code></td></tr>
<tr><td><code>.isupper()</code></td><td>All uppercase</td><td><code>''ABC''.isupper()</code> → <code>True</code></td></tr>
<tr><td><code>.islower()</code></td><td>All lowercase</td><td><code>''abc''.islower()</code> → <code>True</code></td></tr>
<tr><td><code>.istitle()</code></td><td>Title case</td><td><code>''Hello World''.istitle()</code> → <code>True</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Input validation</strong>: <code>if user_id.isdigit():</code> — validate before int conversion</p>
<p>• <strong>Data cleaning</strong>: Filter rows where a column should be numeric but contains text</p>
<p>• <strong>ETL pipelines</strong>: Validate data quality before loading into databases</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ isdigit() vs isnumeric()</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>isdigit()</code> only matches <code>0-9</code>. <code>isnumeric()</code> also matches Unicode numerals like <code>''\u00B2''</code> (superscript 2). For data work, use <code>isdigit()</code> or try/except with <code>int()</code>.
</div></div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Validation checks
print(&#x27;12345&#x27;.isdigit())    # True
print(&#x27;12.34&#x27;.isdigit())    # False — dot is not a digit
print(&#x27;hello&#x27;.isalpha())    # True
print(&#x27;hello123&#x27;.isalnum()) # True

# Practical: safe type conversion
user_input = &#x27;42&#x27;
if user_input.isdigit():
    age = int(user_input)
    print(f&#x27;Valid age: {age}&#x27;)
else:
    print(&#x27;Invalid input&#x27;)

# Check naming conventions
print(&#x27;Hello World&#x27;.istitle())  # True
print(&#x27;CONSTANT&#x27;.isupper())     # True</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Validation-68">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Validation</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given a list <code>inputs = ["123", "12.5", "abc", "45", ""]</code>, use <code>.isdigit()</code> to filter only valid integers. Print the valid ones.</p></div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a function <code>validate_username(name)</code> that returns <code>True</code> only if: length 3-20, alphanumeric only. Test with 5 examples.</p></div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Given <code>data = ["Hello", "WORLD", "mixedCase", "Title Case"]</code>, classify each as upper, lower, title, or mixed. Use <code>.isupper()</code>, <code>.islower()</code>, <code>.istitle()</code>.</p></div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write code that checks if <code>s = "  \t\n  "</code> is all whitespace using <code>.isspace()</code>. Then check <code>""</code> (empty string). What does empty return? Explain.</p></div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a safe <code>to_float(s)</code> function that handles strings like <code>"3.14"</code>, <code>"-2.5"</code>, <code>"abc"</code>, <code>""</code>. Return <code>None</code> for invalid inputs. Test with 5 cases.</p></div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-79">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>7. Encoding & Unicode : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Global Text Processing</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python 3 strings are <b>Unicode by default</b> (UTF-8). When working with files, APIs, or databases, you must handle encoding correctly. <code>encode()</code> converts str → bytes, <code>decode()</code> converts bytes → str.</p>
<pre class="nb-code-block"><code>text = &#x27;Hello&#x27;
bytes_obj = text.encode(&#x27;utf-8&#x27;)   # b&#x27;Hello&#x27;
back = bytes_obj.decode(&#x27;utf-8&#x27;)   # &#x27;Hello&#x27;</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>API responses</strong>: JSON/REST APIs often return bytes that need decoding</p>
<p>• <strong>File I/O</strong>: <code>open(file, encoding=''utf-8'')</code> — always specify encoding</p>
<p>• <strong>International data</strong>: Names, addresses, currencies in non-Latin scripts need proper Unicode handling</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ UnicodeDecodeError</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Reading a file with wrong encoding causes <code>UnicodeDecodeError</code>. Always use <code>encoding=''utf-8''</code> or detect encoding with libraries like <code>chardet</code>.</p>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Encoding and decoding
text = &#x27;Python&#x27;
bytes_val = text.encode(&#x27;utf-8&#x27;)
print(bytes_val)          # b&#x27;Python&#x27;
print(type(bytes_val))    # &lt;class &#x27;bytes&#x27;&gt;
print(bytes_val.decode()) # Python

# Unicode characters
emoji = &#x27;\U0001F4CA&#x27;  # chart emoji
print(f&#x27;Data {emoji}&#x27;)
print(f&#x27;Length: {len(emoji)}&#x27;)  # 1 character
print(f&#x27;Bytes:  {len(emoji.encode(&quot;utf-8&quot;))}&#x27;)  # 4 bytes

# ord() and chr()
print(ord(&#x27;A&#x27;))    # 65
print(chr(65))     # A</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Encoding-81">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Encoding</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Encode <code>text = "Python"</code> to UTF-8 bytes. Print the bytes object and its length. Then decode it back and verify equality.</p></div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Compare the byte length of <code>"A"</code> vs <code>"\u00C9"</code> (accented E) vs a Chinese character <code>"\u4e16"</code> in UTF-8. Print each character and its byte count.</p></div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>ord()</code> to print the Unicode code point of each character in <code>"Hello"</code>. Then use <code>chr()</code> to reconstruct the string from code points.</p></div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write code that safely reads a string, trying UTF-8 first, then Latin-1 as fallback. Use try/except with <code>.decode()</code>.</p></div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Create a string with mixed scripts: English, numbers, and symbols. Print its <code>len()</code> (characters) and <code>len(s.encode())</code> (bytes). Explain the difference.</p></div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>8. String Performance : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Efficient Text Processing</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Since strings are <b>immutable</b>, concatenation in loops creates many temporary objects. For building large strings, use <code>list + join</code> or <code>io.StringIO</code> instead of <code>+=</code>. This can be <b>100x faster</b> for large datasets.</p>
<table>
<thead><tr><th>Approach</th><th>Speed</th><th>Memory</th><th>Use When</th></tr></thead><tbody>
<tr><td><code>+=</code> in loop</td><td>Slow</td><td>High</td><td>Never for large data</td></tr>
<tr><td><code>''''.join(list)</code></td><td>Fast</td><td>Low</td><td>Building strings in loops</td></tr>
<tr><td>f-strings</td><td>Fastest</td><td>Low</td><td>Single-line formatting</td></tr>
<tr><td><code>io.StringIO</code></td><td>Fast</td><td>Medium</td><td>Stream-like building</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>ETL pipelines</strong>: Building CSV output with <code>join()</code> instead of <code>+=</code> saves minutes on large datasets</p>
<p>• <strong>Report generation</strong>: Use <code>join()</code> for assembling multi-line reports</p>
<p>• <strong>Memory management</strong>: Knowing string interning helps debug identity issues</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Python <b>interns</b> small strings and identifiers. <code>''hello'' is ''hello''</code> may be <code>True</code> due to caching, but never rely on this — always use <code>==</code> for comparison.</p>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43">import time

# Slow: string concatenation in loop
start = time.time()
result = &#x27;&#x27;
for i in range(10000):
    result += str(i)
slow_time = time.time() - start

# Fast: list + join
start = time.time()
parts = []
for i in range(10000):
    parts.append(str(i))
result = &#x27;&#x27;.join(parts)
fast_time = time.time() - start

print(f&#x27;Concatenation: {slow_time:.4f}s&#x27;)
print(f&#x27;Join:          {fast_time:.4f}s&#x27;)
print(f&#x27;Join is {slow_time/fast_time:.1f}x faster&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Performance-94">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Performance</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Build a string of numbers <code>"0,1,2,...,999"</code> using: (a) <code>+=</code> in a loop, (b) <code>",".join()</code>. Time both approaches and print the speedup ratio.</p></div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Demonstrate string interning: test <code>a = "hello"; b = "hello"; print(a is b)</code>. Then test with <code>a = "hello world"</code>. Explain the difference.</p></div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write code that builds a CSV string from <code>data = [("Alice",25), ("Bob",30), ("Charlie",35)]</code> using <code>join()</code>. Print the result.</p></div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>sys.getsizeof()</code> to measure memory of: empty string, <code>"a"</code>, <code>"hello"</code>, <code>"a"*1000</code>. Print each size. What pattern do you notice?</p></div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a function <code>build_report(rows)</code> that takes a list of dicts and returns a formatted table string using <code>join()</code>. Test with 3 sample rows.</p></div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Data Cleaner):</strong> Write a function <code>clean_name(name)</code> that: strips whitespace, converts to title case, replaces multiple spaces with single space, and removes non-alphabetic characters (except spaces). Test with <code>''  john   DOE 3rd  ''</code>.</p></div>
<div class="code-cell" id="cell-49">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-49'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-49'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-49"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (CSV Parser):</strong> Write a function <code>parse_csv_line(line)</code> that splits a CSV line by commas, strips each field, and returns a list. Handle edge case: fields containing commas inside quotes. Test with <code>''Alice, 28, "New York, NY"''</code>.</p></div>
<div class="code-cell" id="cell-50">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-50'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-50'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-50"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Log Analyzer):</strong> Given <code>log = "2024-01-15 14:30:22 ERROR Database connection failed"</code>, extract: date, time, level, message using string methods only (no regex). Print each part.</p></div>
<div class="code-cell" id="cell-51">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-51'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-51'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-51"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Email Validator):</strong> Write a function <code>validate_email(email)</code> that checks: contains exactly one <code>@</code>, has text before and after <code>@</code>, domain has a dot, no spaces. Return <code>True</code>/<code>False</code>. Test with 5 valid and 5 invalid emails.</p></div>
<div class="code-cell" id="cell-52">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-52'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-52'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-52"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Text Statistics):</strong> Write a function <code>text_stats(text)</code> that returns a dict with: character count, word count, sentence count, average word length, most common word. Test with a paragraph of text.</p></div>
<div class="code-cell" id="cell-53">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-53'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-53'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-53"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-117">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a function <code>reverse_words(s)</code> that reverses word order: <code>''hello world''</code> → <code>''world hello''</code>. Do NOT reverse individual characters.</h3>
</div>
<div class="code-cell" id="cell-54">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-54'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-54'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-54"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-119">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write a function <code>is_anagram(s1, s2)</code> that checks if two strings are anagrams (case-insensitive, ignoring spaces). Test with <code>''listen''</code> and <code>''silent''</code>.</h3>
</div>
<div class="code-cell" id="cell-55">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-55'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-55'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-55"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-121">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a function <code>compress(s)</code> implementing run-length encoding: <code>''aabcccdd''</code> → <code>''a2b1c3d2''</code>. Only compress if result is shorter.</h3>
</div>
<div class="code-cell" id="cell-56">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-56'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-56'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-56"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-123">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a function <code>first_non_repeating(s)</code> that finds the first non-repeating character. <code>''aabbc''</code> → <code>''c''</code>. Return <code>None</code> if all repeat.</h3>
</div>
<div class="code-cell" id="cell-57">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-57'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-57'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-57"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-125">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a function <code>caesar_cipher(text, shift)</code> that shifts each letter by <code>shift</code> positions. Handle wrapping (z→a) and preserve non-letters.</h3>
</div>
<div class="code-cell" id="cell-58">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-58'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-58'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-58"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-127">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write a function <code>longest_common_prefix(strs)</code> that finds the longest common prefix in a list of strings. <code>[''flower'',''flow'',''flight'']</code> → <code>''fl''</code>.</h3>
</div>
<div class="code-cell" id="cell-59">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-59'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-59'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-59"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-129">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a function <code>valid_parentheses(s)</code> that checks if brackets are balanced: <code>''([{}])''</code> → <code>True</code>, <code>''([)]''</code> → <code>False</code>.</h3>
</div>
<div class="code-cell" id="cell-60">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-60'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-60'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-60"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-131">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a function <code>count_vowels(s)</code> that returns a dict of vowel frequencies (case-insensitive). Test with a sentence.</h3>
</div>
<div class="code-cell" id="cell-61">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-61'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-61'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-61"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-133">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a function <code>title_case(s)</code> that capitalizes the first letter of each word, except articles (<code>a, an, the</code>). First word always capitalized.</h3>
</div>
<div class="code-cell" id="cell-62">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-62'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-62'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-62"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-135">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a function <code>remove_duplicates(s)</code> that removes duplicate characters preserving order: <code>''abcabc''</code> → <code>''abc''</code>.</h3>
</div>
<div class="code-cell" id="cell-63">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-63'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-63'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-63"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-137">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a function <code>zigzag(s, rows)</code> that converts text to zigzag pattern and reads row by row. <code>''PAYPALISHIRING''</code> with 3 rows → <code>''PAHNAPLSIIGYIR''</code>.</h3>
</div>
<div class="code-cell" id="cell-64">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-64'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-64'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-64"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-139">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write a function <code>word_pattern(pattern, s)</code> that checks if string follows pattern: <code>pattern=''abba'', s=''dog cat cat dog''</code> → <code>True</code>.</h3>
</div>
<div class="code-cell" id="cell-65">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-65'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-65'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-65"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-141">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write a function <code>group_anagrams(words)</code> that groups anagrams together. <code>[''eat'',''tea'',''tan'',''ate'',''nat'',''bat'']</code> → grouped lists.</h3>
</div>
<div class="code-cell" id="cell-66">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-66'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-66'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-66"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-143">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a function <code>find_overlapping(s, sub)</code> that counts all overlapping occurrences of <code>sub</code> in <code>s</code>. E.g., <code>find_overlapping(''aaa'', ''aa'')</code> returns <code>2</code>.</h3>
</div>
<div class="code-cell" id="cell-67">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-67'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-67'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-67"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-145">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a function <code>pad_number(n, width)</code> that pads a number with leading zeros to the given width. E.g., <code>pad_number(42, 5)</code> returns <code>''00042''</code>.</h3>
</div>
<div class="code-cell" id="cell-68">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-68'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-68'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-68"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-147">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write code to implement <code>str.replace()</code> from scratch: <code>my_replace(text, old, new)</code>. Handle overlapping patterns.</h3>
</div>
<div class="code-cell" id="cell-69">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-69'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-69'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-69"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-149">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a function <code>repeat_chars(s, n)</code> that repeats each character n times: <code>repeat_chars(''abc'', 3)</code> returns <code>''aaabbbccc''</code>.</h3>
</div>
<div class="code-cell" id="cell-70">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-70'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-70'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-70"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-151">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a function <code>longest_palindrome_substring(s)</code> that finds the longest palindromic substring in a string.</h3>
</div>
<div class="code-cell" id="cell-71">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-71'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-71'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-71"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-153">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a function <code>atoi(s)</code> that converts string to integer handling: whitespace, signs, overflow, invalid chars. Mimic <code>int()</code> behavior.</h3>
</div>
<div class="code-cell" id="cell-72">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-72'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-72'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-72"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-155">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a function <code>justify_text(text, width)</code> that fully justifies text to given width by distributing spaces evenly between words.</h3>
</div>
<div class="code-cell" id="cell-73">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-73'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-73'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-73"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-157">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a function <code>compare_version(v1, v2)</code> that compares version strings: <code>''1.2.3''</code> vs <code>''1.2.4''</code> → <code>-1</code>. Handle different lengths.</h3>
</div>
<div class="code-cell" id="cell-74">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-74'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-74'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-74"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-159">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a function <code>interleave(s1, s2)</code> that interleaves two strings: <code>''abc'',''xyz''</code> → <code>''axbycz''</code>. Handle different lengths.</h3>
</div>
<div class="code-cell" id="cell-75">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-75'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-75'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-75"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-161">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a function <code>count_substrings(s, sub)</code> that counts overlapping occurrences: <code>''aaa''</code> contains <code>''aa''</code> twice.</h3>
</div>
<div class="code-cell" id="cell-76">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-76'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-76'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-76"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-163">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a function <code>to_snake_case(s)</code> converting <code>''camelCaseString''</code> → <code>''camel_case_string''</code>. Handle consecutive capitals.</h3>
</div>
<div class="code-cell" id="cell-77">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-77'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-77'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-77"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-165">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a function <code>expand_range(s)</code> that expands: <code>''1-5,8,11-14''</code> → <code>[1,2,3,4,5,8,11,12,13,14]</code>.</h3>
</div>
<div class="code-cell" id="cell-78">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-78'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-78'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-78"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 3 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th><th>Professional Application</th></tr></thead><tbody>
<tr><td>1</td><td>Creation</td><td>4 ways to create; strings are immutable</td><td>File paths, SQL queries</td></tr>
<tr><td>2</td><td>Indexing & Slicing</td><td>Zero-based; <code>stop</code> is exclusive; <code>[::-1]</code> reverses</td><td>Log parsing, data extraction</td></tr>
<tr><td>3</td><td>Core Methods</td><td><code>.strip()</code>, <code>.replace()</code>, <code>.find()</code> — chain them</td><td>Data cleaning pipelines</td></tr>
<tr><td>4</td><td>Split & Join</td><td><code>split()</code> → list; <code>join()</code> → string</td><td>CSV/text parsing</td></tr>
<tr><td>5</td><td>Formatting</td><td>f-strings are fastest and most readable</td><td>Reports, dashboards</td></tr>
<tr><td>6</td><td>Validation</td><td><code>.isdigit()</code>, <code>.isalpha()</code> for quality checks</td><td>Input validation, ETL</td></tr>
<tr><td>7</td><td>Encoding</td><td>UTF-8 default; <code>encode()</code>/<code>decode()</code> for bytes</td><td>APIs, file I/O</td></tr>
<tr><td>8</td><td>Performance</td><td><code>join()</code> >> <code>+=</code> for loop concatenation</td><td>Large-scale text processing</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I understand string immutability and its performance implications.</p>
<p>• [ ] I can use slicing to extract substrings efficiently.</p>
<p>• [ ] I know the difference between <code>.find()</code> (safe) and <code>.index()</code> (raises error).</p>
<p>• [ ] I can use f-strings with format specs for professional output.</p>
<p>• [ ] I understand encoding and can handle UTF-8/bytes conversion.</p>
<p>• [ ] I have completed all 5 practice tasks.</p>
<p>• [ ] I have reviewed all 25 interview questions.</p>
<p><strong>Next Up: Day 4 - Lists: Dynamic Sequences, Manipulation, and Data Pipelines</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. String Creation & Escaping : Text Data Fundamentals"}, {"anchor": "checks-Creation-3", "title": "\ud83e\uddea Checks: Creation"}, {"anchor": "sec-14", "title": "2. Indexing & Slicing : Precision Text Extraction"}, {"anchor": "checks-Indexing & Slicing-16", "title": "\ud83e\uddea Checks: Indexing & Slicing"}, {"anchor": "sec-27", "title": "3. Core String Methods : Search, Replace & Transform"}, {"anchor": "checks-String Methods-29", "title": "\ud83e\uddea Checks: String Methods"}, {"anchor": "sec-40", "title": "4. Splitting & Joining : Text Decomposition & Assembly"}, {"anchor": "checks-Split & Join-42", "title": "\ud83e\uddea Checks: Split & Join"}, {"anchor": "sec-53", "title": "5. String Formatting : Professional Output Generation"}, {"anchor": "checks-Formatting-55", "title": "\ud83e\uddea Checks: Formatting"}, {"anchor": "sec-66", "title": "6. String Validation Methods : Data Quality Checks"}, {"anchor": "checks-Validation-68", "title": "\ud83e\uddea Checks: Validation"}, {"anchor": "sec-79", "title": "7. Encoding & Unicode : Global Text Processing"}, {"anchor": "checks-Encoding-81", "title": "\ud83e\uddea Checks: Encoding"}, {"anchor": "sec-92", "title": "8. String Performance : Efficient Text Processing"}, {"anchor": "checks-Performance-94", "title": "\ud83e\uddea Checks: Performance"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-117", "title": "Q1."}, {"anchor": "sec-119", "title": "Q2."}, {"anchor": "sec-121", "title": "Q3."}, {"anchor": "sec-123", "title": "Q4."}, {"anchor": "sec-125", "title": "Q5."}, {"anchor": "sec-127", "title": "Q6."}, {"anchor": "sec-129", "title": "Q7."}, {"anchor": "sec-131", "title": "Q8."}, {"anchor": "sec-133", "title": "Q9."}, {"anchor": "sec-135", "title": "Q10."}, {"anchor": "sec-137", "title": "Q11."}, {"anchor": "sec-139", "title": "Q12."}, {"anchor": "sec-141", "title": "Q13."}, {"anchor": "sec-143", "title": "Q14."}, {"anchor": "sec-145", "title": "Q15."}, {"anchor": "sec-147", "title": "Q16."}, {"anchor": "sec-149", "title": "Q17."}, {"anchor": "sec-151", "title": "Q18."}, {"anchor": "sec-153", "title": "Q19."}, {"anchor": "sec-155", "title": "Q20."}, {"anchor": "sec-157", "title": "Q21."}, {"anchor": "sec-159", "title": "Q22."}, {"anchor": "sec-161", "title": "Q23."}, {"anchor": "sec-163", "title": "Q24."}, {"anchor": "sec-165", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48", "cell-49", "cell-50", "cell-51", "cell-52", "cell-53", "cell-54", "cell-55", "cell-56", "cell-57", "cell-58", "cell-59", "cell-60", "cell-61", "cell-62", "cell-63", "cell-64", "cell-65", "cell-66", "cell-67", "cell-68", "cell-69", "cell-70", "cell-71", "cell-72", "cell-73", "cell-74", "cell-75", "cell-76", "cell-77", "cell-78"]'::jsonb),
('day04', '📋 Lists', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Lists are Python''s most versatile data structure and the foundation for data manipulation. Today we master list creation, modification, comprehensions, and advanced patterns. You will learn the professional techniques that translate directly to pandas DataFrame operations.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Concept</th><th>Core Use Case</th></tr></thead><tbody>
<tr><td>1</td><td>Creation</td><td>Literal, <code>range()</code>, repetition</td><td>Building datasets</td></tr>
<tr><td>2</td><td>Indexing & Slicing</td><td><code>lst[start:stop:step]</code></td><td>Data extraction</td></tr>
<tr><td>3</td><td>Methods</td><td><code>.append()</code>, <code>.sort()</code>, <code>.pop()</code></td><td>In-place modification</td></tr>
<tr><td>4</td><td>Copying</td><td>Shallow vs deep copy</td><td>Data integrity</td></tr>
<tr><td>5</td><td>Comprehensions</td><td><code>[expr for x in iter if cond]</code></td><td>Transformation</td></tr>
<tr><td>6</td><td>Built-in Functions</td><td><code>enumerate</code>, <code>zip</code>, <code>sorted</code></td><td>Aggregation</td></tr>
<tr><td>7</td><td>Nested Lists</td><td>2D data, matrices</td><td>Tabular data</td></tr>
<tr><td>8</td><td>Stack & Queue</td><td>LIFO/FIFO patterns</td><td>Algorithms</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. List Creation & Basics : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Dynamic Mutable Sequences</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A list is an <b>ordered, mutable collection</b> that can hold items of any type. Lists are the most versatile data structure in Python — they grow and shrink dynamically, support indexing/slicing, and are the backbone of data pipelines.</p>
<table>
<thead><tr><th>Creation Method</th><th>Example</th><th>Use Case</th></tr></thead><tbody>
<tr><td>Literal</td><td><code>[1, 2, 3]</code></td><td>Quick, explicit</td></tr>
<tr><td><code>list()</code> constructor</td><td><code>list(''abc'')</code> → <code>[''a'',''b'',''c'']</code></td><td>Convert iterables</td></tr>
<tr><td><code>list(range(n))</code></td><td><code>list(range(5))</code> → <code>[0,1,2,3,4]</code></td><td>Numeric sequences</td></tr>
<tr><td>Repetition</td><td><code>[0] * 5</code> → <code>[0,0,0,0,0]</code></td><td>Initialize with defaults</td></tr>
<tr><td>Comprehension</td><td><code>[x**2 for x in range(5)]</code></td><td>Functional creation</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data buffers</strong>: Lists hold rows of data during ETL processing</p>
<p>• <strong>Feature collections</strong>: Gather column names, metrics, or results dynamically</p>
<p>• <strong>Pipeline stages</strong>: Accumulate transformed records before writing to output</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Shallow Copy Trap</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>matrix = [[0]*3]*3</code> creates 3 references to the <b>same</b> inner list. Modifying one row changes all rows. Use <code>[[0]*3 for _ in range(3)]</code> instead.
</div>
<h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Use <code>list()</code> to convert any iterable: <code>list(''hello'')</code> → <code>[''h'',''e'',''l'',''l'',''o'']</code>, <code>list(range(5))</code> → <code>[0,1,2,3,4]</code>.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Creation methods
nums = [10, 20, 30, 40, 50]
mixed = [1, &#x27;hello&#x27;, True, 3.14, None]
from_range = list(range(1, 6))
repeated = [0] * 5

print(f&#x27;nums: {nums}&#x27;)
print(f&#x27;mixed types: {mixed}&#x27;)
print(f&#x27;from range: {from_range}&#x27;)
print(f&#x27;repeated: {repeated}&#x27;)

# Lists are mutable
nums[0] = 99
print(f&#x27;After mutation: {nums}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-List Creation-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>List Creation</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a list of the first 10 even numbers using <code>list(range(...))</code>. Print the list and its length.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a list containing: an int, a float, a string, a boolean, and <code>None</code>. Print each element with its type using a loop.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Demonstrate the shallow copy trap: create <code>matrix = [[0]<em>3]</em>3</code>, modify <code>matrix[0][0] = 1</code>, then print the full matrix. Explain what happened.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create the same 3x3 matrix correctly using a list comprehension <code>[[0]*3 for _ in range(3)]</code>. Modify <code>[0][0]</code> and verify only one row changed.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Convert the string <code>"Data Analytics"</code> into a list of characters, then into a list of words. Print both results.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. List Indexing & Slicing : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Precision Data Access</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Lists use the same indexing and slicing syntax as strings: <code>lst[i]</code> for single access, <code>lst[start:stop:step]</code> for slices. Unlike strings, list slicing returns a <b>new list</b>, and you can <b>assign to slices</b> to modify multiple elements at once.</p>
<table>
<thead><tr><th>Operation</th><th>Syntax</th><th>Description</th></tr></thead><tbody>
<tr><td>Access</td><td><code>lst[0]</code>, <code>lst[-1]</code></td><td>First, last element</td></tr>
<tr><td>Slice</td><td><code>lst[1:4]</code></td><td>Elements at index 1,2,3</td></tr>
<tr><td>Step</td><td><code>lst[::2]</code></td><td>Every other element</td></tr>
<tr><td>Reverse</td><td><code>lst[::-1]</code></td><td>Reversed copy</td></tr>
<tr><td>Slice assign</td><td><code>lst[1:3] = [10, 20]</code></td><td>Replace range</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Batch selection</strong>: Select specific rows/columns from data matrices</p>
<p>• <strong>Pagination</strong>: <code>data[offset:offset+limit]</code> — paginate query results</p>
<p>• <strong>Window operations</strong>: <code>data[i:i+window_size]</code> — sliding window analysis</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Slice assignment can <b>change list length</b>: <code>lst[1:3] = [10, 20, 30, 40]</code> replaces 2 elements with 4.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">data = [10, 20, 30, 40, 50, 60, 70]

# Indexing
print(data[0])     # 10
print(data[-1])    # 70

# Slicing
print(data[2:5])   # [30, 40, 50]
print(data[::2])   # [10, 30, 50, 70]
print(data[::-1])  # [70, 60, 50, 40, 30, 20, 10]

# Slice assignment (unique to lists!)
data[1:3] = [200, 300]
print(data)  # [10, 200, 300, 40, 50, 60, 70]</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Indexing & Slicing-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Indexing & Slicing</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>nums = list(range(1, 21))</code>, extract: first 5, last 5, every 3rd element, and reversed list. Print each.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use slice assignment to replace elements at index 2-4 in <code>data = [1,2,3,4,5]</code> with <code>[30,40,50]</code>. Print the result.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write code to rotate a list left by 2 positions: <code>[1,2,3,4,5]</code> → <code>[3,4,5,1,2]</code>. Use only slicing.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Given <code>matrix = [[1,2,3],[4,5,6],[7,8,9]]</code>, extract the second column <code>[2,5,8]</code> using indexing in a loop.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use negative slicing to get the second-to-last element and the last 3 elements of <code>data = [10,20,30,40,50,60]</code>. Print both.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. List Methods : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">In-Place Modification</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Lists have powerful methods for adding, removing, and reordering elements. Most methods modify the list <b>in-place</b> and return <code>None</code>. This is a common gotcha — never write <code>lst = lst.sort()</code>.</p>
<table>
<thead><tr><th>Method</th><th>Action</th><th>Returns</th></tr></thead><tbody>
<tr><td><code>.append(x)</code></td><td>Add to end</td><td><code>None</code></td></tr>
<tr><td><code>.extend(iter)</code></td><td>Add multiple items</td><td><code>None</code></td></tr>
<tr><td><code>.insert(i, x)</code></td><td>Insert at position</td><td><code>None</code></td></tr>
<tr><td><code>.remove(x)</code></td><td>Remove first occurrence</td><td><code>None</code></td></tr>
<tr><td><code>.pop(i)</code></td><td>Remove and return at index</td><td>The removed item</td></tr>
<tr><td><code>.sort()</code></td><td>Sort in-place</td><td><code>None</code></td></tr>
<tr><td><code>.reverse()</code></td><td>Reverse in-place</td><td><code>None</code></td></tr>
<tr><td><code>.index(x)</code></td><td>Find position</td><td>Index int</td></tr>
<tr><td><code>.count(x)</code></td><td>Count occurrences</td><td>Count int</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data accumulation</strong>: <code>results.append(row)</code> — building datasets row by row</p>
<p>• <strong>Deduplication</strong>: <code>.count()</code> and <code>.remove()</code> for cleaning duplicates</p>
<p>• <strong>Sorting</strong>: <code>data.sort(key=lambda x: x[''date''])</code> — sort records by field</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ sort() Returns None</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>lst.sort()</code> modifies in-place and returns <code>None</code>. Writing <code>lst = lst.sort()</code> destroys your list! Use <code>sorted(lst)</code> if you need a new sorted list.
</div></div>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">scores = [85, 92, 78, 95, 88]

# Adding elements
scores.append(76)
scores.extend([91, 83])
print(f&#x27;After adding: {scores}&#x27;)

# Removing
scores.remove(78)        # Remove by value
popped = scores.pop(-1)  # Remove last, get value
print(f&#x27;Removed: {popped}, List: {scores}&#x27;)

# Sorting
scores.sort(reverse=True)
print(f&#x27;Sorted desc: {scores}&#x27;)

# DANGER: sort() returns None
result = scores.sort()
print(f&#x27;result = {result}&#x27;)  # None!</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-List Methods-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>List Methods</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Start with <code>lst = [3, 1, 4, 1, 5]</code>. Use <code>.append()</code>, <code>.extend()</code>, <code>.insert()</code> to add elements. Print the list after each operation.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>data = [5, 3, 8, 1, 9, 2]</code>, sort it in ascending order, then reverse it. Use both in-place methods. Print after each step.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Demonstrate the <code>sort()</code> trap: show that <code>result = [3,1,2].sort()</code> gives <code>None</code>. Then show the correct way using <code>sorted()</code>.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Given <code>items = ["apple", "banana", "apple", "cherry", "apple"]</code>, count occurrences of <code>"apple"</code> and find its first index. Print both.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write code that removes all occurrences of a value from a list (not just the first). Remove all <code>0</code>s from <code>[1, 0, 2, 0, 3, 0]</code>.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-40">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>4. Copying Lists : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Shallow vs Deep Copy</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Assignment (<code>b = a</code>) creates a <b>reference</b>, not a copy. <code>.copy()</code> or <code>list(a)</code> creates a <b>shallow copy</b>. For nested lists, you need <code>copy.deepcopy()</code> to get a fully independent copy.</p>
<table>
<thead><tr><th>Method</th><th>Creates</th><th>Nested Objects</th></tr></thead><tbody>
<tr><td><code>b = a</code></td><td>Reference (alias)</td><td>Shared — changes affect both</td></tr>
<tr><td><code>b = a.copy()</code></td><td>Shallow copy</td><td>Still shared (inner refs)</td></tr>
<tr><td><code>b = a[:]</code></td><td>Shallow copy</td><td>Still shared (inner refs)</td></tr>
<tr><td><code>b = copy.deepcopy(a)</code></td><td>Deep copy</td><td>Fully independent</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data integrity</strong>: Always copy before modifying to preserve original data</p>
<p>• <strong>Function safety</strong>: Copy inputs inside functions to avoid side effects</p>
<p>• <strong>Snapshot patterns</strong>: Take deep copies as checkpoints in data transformations</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Shallow Copy Surprise</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>With nested lists, <code>.copy()</code> only copies the outer list. Inner lists are still <b>shared references</b>. Modifying an inner list in the copy changes the original too.</p>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19">import copy

# Reference vs Copy
original = [1, 2, [3, 4]]
ref = original            # Reference — same object
shallow = original.copy()  # Shallow copy
deep = copy.deepcopy(original)  # Deep copy

# Modify nested list
original[2][0] = 99

print(f&#x27;original: {original}&#x27;)  # [1, 2, [99, 4]]
print(f&#x27;ref:      {ref}&#x27;)       # [1, 2, [99, 4]] — affected!
print(f&#x27;shallow:  {shallow}&#x27;)   # [1, 2, [99, 4]] — affected!
print(f&#x27;deep:     {deep}&#x27;)      # [1, 2, [3, 4]]  — safe!</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Copying-42">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Copying</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>a = [1, 2, 3]</code> and <code>b = a</code>. Modify <code>b.append(4)</code>. Print both. Explain why <code>a</code> changed too.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Fix the above by using <code>.copy()</code>. Show that modifying <code>b</code> no longer affects <code>a</code>.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create <code>nested = [[1, 2], [3, 4]]</code>. Make a shallow copy. Modify <code>copy[0][0] = 99</code>. Show that the original also changed.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Fix the nested copy issue using <code>copy.deepcopy()</code>. Verify the original is unaffected by changes to the deep copy.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a function <code>safe_process(data)</code> that takes a list, makes a deep copy internally, sorts the copy, and returns it — leaving the original unchanged. Test it.</p></div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-53">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>5. List Comprehensions : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Functional Data Transformation</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A list comprehension is a concise way to create lists: <code>[expression for item in iterable if condition]</code>. They replace multi-line loops with a single readable line and are <b>faster</b> than equivalent for-loops.</p>
<pre class="nb-code-block"><code># Loop version (4 lines)
result = []
for x in range(10):
    if x % 2 == 0:
        result.append(x ** 2)

# Comprehension (1 line)
result = [x**2 for x in range(10) if x % 2 == 0]</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data filtering</strong>: <code>clean = [x for x in data if x is not None]</code></p>
<p>• <strong>Type conversion</strong>: <code>nums = [int(x) for x in string_list]</code></p>
<p>• <strong>Feature engineering</strong>: <code>features = [row[''age''] * row[''income''] for row in records]</code></p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Readability Limit</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If a comprehension needs more than one condition or nested loops, switch to a regular for-loop. Readability always wins over cleverness.</p>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Basic comprehension
squares = [x**2 for x in range(1, 6)]
print(squares)  # [1, 4, 9, 16, 25]

# With filter
evens = [x for x in range(20) if x % 2 == 0]
print(evens)

# Transform + filter
names = [&#x27;  Alice &#x27;, &#x27;Bob&#x27;, &#x27;  charlie&#x27;, &#x27;&#x27;]
clean = [n.strip().title() for n in names if n.strip()]
print(clean)  # [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;]

# Nested: flatten 2D list
matrix = [[1,2,3],[4,5,6],[7,8,9]]
flat = [x for row in matrix for x in row]
print(flat)  # [1,2,3,4,5,6,7,8,9]</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Comprehensions-55">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Comprehensions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a list of squares of numbers 1-10 using a comprehension. Print it.</p></div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>words = ["hello", "world", "python", "data"]</code>, create a list of their lengths using a comprehension. Print it.</p></div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Filter: from <code>nums = [1, -2, 3, -4, 5, -6]</code>, extract only positive numbers using a comprehension.</p></div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Flatten <code>matrix = [[1,2],[3,4],[5,6]]</code> into <code>[1,2,3,4,5,6]</code> using a nested comprehension.</p></div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Given <code>data = ["42", "hello", "3.14", "7", "abc"]</code>, use a comprehension with <code>.isdigit()</code> to extract and convert valid integers. Print the result.</p></div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>6. Built-in Functions for Lists : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Aggregation & Analysis</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python provides powerful built-in functions that work on lists: <code>len()</code>, <code>sum()</code>, <code>min()</code>, <code>max()</code>, <code>sorted()</code>, <code>enumerate()</code>, <code>zip()</code>, <code>map()</code>, <code>filter()</code>, <code>any()</code>, <code>all()</code>.</p>
<table>
<thead><tr><th>Function</th><th>Purpose</th><th>Example</th></tr></thead><tbody>
<tr><td><code>len(lst)</code></td><td>Count elements</td><td><code>len([1,2,3])</code> → <code>3</code></td></tr>
<tr><td><code>sum(lst)</code></td><td>Total</td><td><code>sum([1,2,3])</code> → <code>6</code></td></tr>
<tr><td><code>min/max</code></td><td>Extremes</td><td><code>max([3,1,2])</code> → <code>3</code></td></tr>
<tr><td><code>sorted()</code></td><td>New sorted list</td><td><code>sorted([3,1,2])</code> → <code>[1,2,3]</code></td></tr>
<tr><td><code>enumerate()</code></td><td>Index + value</td><td>Indexed iteration</td></tr>
<tr><td><code>zip()</code></td><td>Pair elements</td><td>Parallel iteration</td></tr>
<tr><td><code>any()/all()</code></td><td>Boolean checks</td><td>Data validation</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Statistics</strong>: <code>sum(data)/len(data)</code> — quick mean calculation</p>
<p>• <strong>Validation</strong>: <code>all(x > 0 for x in data)</code> — check all values positive</p>
<p>• <strong>Paired data</strong>: <code>zip(names, scores)</code> — combine parallel lists</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>enumerate()</code> is always preferred over <code>range(len(lst))</code>: <code>for i, val in enumerate(data):</code> is cleaner and more Pythonic.
</div></div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31">scores = [85, 92, 78, 95, 88]

print(f&#x27;Count: {len(scores)}&#x27;)
print(f&#x27;Sum:   {sum(scores)}&#x27;)
print(f&#x27;Avg:   {sum(scores)/len(scores):.1f}&#x27;)
print(f&#x27;Min:   {min(scores)}&#x27;)
print(f&#x27;Max:   {max(scores)}&#x27;)

# enumerate
for i, score in enumerate(scores, 1):
    print(f&#x27;Student {i}: {score}&#x27;)

# zip
names = [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;]
grades = [92, 85, 78]
for name, grade in zip(names, grades):
    print(f&#x27;{name}: {grade}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Built-in Functions-68">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Built-in Functions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>data = [45, 82, 67, 91, 53]</code>, compute and print: length, sum, average, min, max.</p></div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>enumerate()</code> to print each element of <code>fruits = ["apple", "banana", "cherry"]</code> with its 1-based index.</p></div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>zip()</code> to combine <code>names = ["Alice", "Bob"]</code> and <code>ages = [25, 30]</code> into a list of tuples. Print it.</p></div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>any()</code> to check if any number in <code>nums = [2, 4, 6, 7, 8]</code> is odd. Use <code>all()</code> to check if all are positive. Print both.</p></div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>sorted()</code> with a <code>key</code> parameter to sort <code>words = ["banana", "apple", "cherry"]</code> by length. Print the result.</p></div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-79">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>7. Nested Lists : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">2D Data Structures</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A nested list (list of lists) represents <b>2D data</b> — tables, matrices, grids. Access elements with <code>matrix[row][col]</code>. This is the foundation for understanding DataFrames in pandas.</p>
<pre class="nb-code-block"><code>matrix = [
    [1, 2, 3],   # row 0
    [4, 5, 6],   # row 1
    [7, 8, 9],   # row 2
]
matrix[1][2]  # row 1, col 2 → 6</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Tabular data</strong>: CSV data is naturally a list of lists before converting to DataFrame</p>
<p>• <strong>Matrix operations</strong>: Row/column extraction, transposition, aggregation</p>
<p>• <strong>Grid problems</strong>: Game boards, pixel maps, adjacency matrices</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Transpose a matrix with <code>list(zip(*matrix))</code>. This unpacks rows and re-zips them as columns.</p>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># 2D data: sales by quarter
sales = [
    [&#x27;Q1&#x27;, 150, 200, 180],
    [&#x27;Q2&#x27;, 220, 190, 210],
    [&#x27;Q3&#x27;, 180, 250, 230],
]

# Access
print(sales[0][0])  # Q1
print(sales[1][2])  # 190

# Extract column (all Q values)
quarters = [row[0] for row in sales]
print(quarters)  # [&#x27;Q1&#x27;, &#x27;Q2&#x27;, &#x27;Q3&#x27;]

# Row totals
for row in sales:
    total = sum(row[1:])
    print(f&#x27;{row[0]}: ${total:,}&#x27;)

# Transpose
matrix = [[1,2,3],[4,5,6]]
transposed = list(zip(*matrix))
print(transposed)  # [(1,4),(2,5),(3,6)]</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Nested Lists-81">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Nested Lists</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a 3x3 matrix using a nested list. Print it row by row in a formatted grid.</p></div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>matrix = [[1,2,3],[4,5,6],[7,8,9]]</code>, extract the diagonal <code>[1,5,9]</code> using indexing.</p></div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write code to compute the sum of each row and each column in a 3x3 matrix. Print the results.</p></div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Transpose <code>matrix = [[1,2,3],[4,5,6]]</code> into <code>[[1,4],[2,5],[3,6]]</code> using <code>zip(*matrix)</code>. Print the result.</p></div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Given a list of student records <code>[["Alice",85],["Bob",92],["Charlie",78]]</code>, sort by score (descending) and print the ranked list.</p></div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>8. Lists as Stacks & Queues : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Data Structure Patterns</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Lists can function as <b>stacks</b> (LIFO — Last In, First Out) using <code>append()</code>/<code>pop()</code>, and as <b>queues</b> (FIFO — First In, First Out) using <code>append()</code>/<code>pop(0)</code>. For production queues, use <code>collections.deque</code> for O(1) performance.</p>
<table>
<thead><tr><th>Pattern</th><th>Push</th><th>Pop</th><th>Order</th></tr></thead><tbody>
<tr><td>Stack (LIFO)</td><td><code>.append(x)</code></td><td><code>.pop()</code></td><td>Last in, first out</td></tr>
<tr><td>Queue (FIFO)</td><td><code>.append(x)</code></td><td><code>.pop(0)</code></td><td>First in, first out</td></tr>
<tr><td>Deque (fast)</td><td><code>.append(x)</code></td><td><code>.popleft()</code></td><td>O(1) both ends</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Undo systems</strong>: Stack-based undo/redo for data transformations</p>
<p>• <strong>Task queues</strong>: FIFO queues for processing jobs in order</p>
<p>• <strong>BFS/DFS</strong>: Graph traversal algorithms use stacks and queues</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ list.pop(0) is O(n)</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Removing from the front of a list shifts all elements. For frequent front-removal, use <code>collections.deque</code> which is O(1).</p>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Stack (LIFO)
stack = []
stack.append(&#x27;undo_1&#x27;)
stack.append(&#x27;undo_2&#x27;)
stack.append(&#x27;undo_3&#x27;)
print(f&#x27;Stack: {stack}&#x27;)
print(f&#x27;Pop: {stack.pop()}&#x27;)   # undo_3 (last in)
print(f&#x27;Stack: {stack}&#x27;)

# Queue (FIFO) — use deque for production
from collections import deque
queue = deque()
queue.append(&#x27;task_1&#x27;)
queue.append(&#x27;task_2&#x27;)
queue.append(&#x27;task_3&#x27;)
print(f&#x27;\nQueue: {list(queue)}&#x27;)
print(f&#x27;Process: {queue.popleft()}&#x27;)  # task_1 (first in)
print(f&#x27;Queue: {list(queue)}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Stack & Queue-94">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Stack & Queue</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Implement a stack: push <code>[10, 20, 30]</code>, then pop twice. Print the popped values and remaining stack.</p></div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Implement a queue using <code>collections.deque</code>: enqueue <code>["A", "B", "C"]</code>, then dequeue twice. Print results.</p></div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use a stack to reverse a string: push each character, then pop all. <code>"hello"</code> → <code>"olleh"</code>. Print the result.</p></div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a function <code>is_balanced(expr)</code> that uses a stack to check if parentheses are balanced. Test with <code>"(())"</code> and <code>"(()"</code>.</p></div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Compare performance: time <code>list.pop(0)</code> vs <code>deque.popleft()</code> for 10000 operations. Print the timing comparison.</p></div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Data Pipeline):</strong> Write a function <code>process_scores(raw)</code> that takes <code>raw = [''85'', ''N/A'', ''92'', '''', ''78'', ''absent'', ''95'']</code>, filters out non-numeric entries, converts to int, sorts descending, and returns the top 3. Print the result.</p></div>
<div class="code-cell" id="cell-49">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-49'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-49'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-49"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Matrix Calculator):</strong> Write functions to add and multiply two 3x3 matrices (list of lists). Test with sample matrices and print formatted results.</p></div>
<div class="code-cell" id="cell-50">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-50'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-50'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-50"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Inventory Manager):</strong> Create a list of dicts <code>[{''item'': ''Laptop'', ''qty'': 5, ''price'': 999}, ...]</code> with 5 products. Write code to: find most expensive, compute total inventory value, sort by price.</p></div>
<div class="code-cell" id="cell-51">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-51'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-51'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-51"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Deduplicator):</strong> Write a function <code>deduplicate(lst)</code> that removes duplicates while preserving original order. <code>[3,1,4,1,5,3,2]</code> → <code>[3,1,4,5,2]</code>. Do NOT use <code>set()</code>.</p></div>
<div class="code-cell" id="cell-52">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-52'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-52'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-52"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Sliding Window):</strong> Write a function <code>moving_average(data, window)</code> that computes moving averages. <code>data=[1,3,5,7,9], window=3</code> → <code>[3.0, 5.0, 7.0]</code>. Print results.</p></div>
<div class="code-cell" id="cell-53">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-53'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-53'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-53"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-117">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a function <code>two_sum(nums, target)</code> returning indices of two numbers that add to target. <code>[2,7,11,15], 9</code> → <code>[0,1]</code>.</h3>
</div>
<div class="code-cell" id="cell-54">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-54'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-54'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-54"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-119">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write a function <code>rotate_list(lst, k)</code> that rotates right by k positions. <code>[1,2,3,4,5], k=2</code> → <code>[4,5,1,2,3]</code>.</h3>
</div>
<div class="code-cell" id="cell-55">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-55'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-55'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-55"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-121">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a function <code>merge_sorted(a, b)</code> that merges two sorted lists into one sorted list without using <code>sort()</code>.</h3>
</div>
<div class="code-cell" id="cell-56">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-56'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-56'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-56"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-123">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a function <code>flatten(nested)</code> that flattens arbitrarily nested lists: <code>[1,[2,[3,[4]]],5]</code> → <code>[1,2,3,4,5]</code>. Use recursion.</h3>
</div>
<div class="code-cell" id="cell-57">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-57'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-57'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-57"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-125">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a function <code>find_missing(nums)</code> that finds the missing number in <code>[0,1,2,4,5]</code> → <code>3</code>. List contains n-1 numbers from 0 to n.</h3>
</div>
<div class="code-cell" id="cell-58">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-58'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-58'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-58"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-127">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write a function <code>remove_duplicates_sorted(lst)</code> in-place for a sorted list. <code>[1,1,2,2,3]</code> → <code>[1,2,3]</code>. Return new length.</h3>
</div>
<div class="code-cell" id="cell-59">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-59'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-59'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-59"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-129">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a function <code>max_subarray_sum(nums)</code> implementing Kadane''s algorithm. Find contiguous subarray with largest sum.</h3>
</div>
<div class="code-cell" id="cell-60">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-60'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-60'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-60"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-131">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a function <code>intersection(a, b)</code> returning common elements preserving order from <code>a</code>. Handle duplicates correctly.</h3>
</div>
<div class="code-cell" id="cell-61">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-61'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-61'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-61"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-133">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a function <code>chunk(lst, size)</code> splitting list into chunks: <code>[1,2,3,4,5], size=2</code> → <code>[[1,2],[3,4],[5]]</code>.</h3>
</div>
<div class="code-cell" id="cell-62">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-62'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-62'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-62"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-135">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a function <code>spiral_order(matrix)</code> returning elements in spiral order from a 2D matrix.</h3>
</div>
<div class="code-cell" id="cell-63">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-63'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-63'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-63"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-137">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a function <code>product_except_self(nums)</code> returning array where each element is product of all others. No division.</h3>
</div>
<div class="code-cell" id="cell-64">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-64'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-64'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-64"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-139">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write a function <code>longest_consecutive(nums)</code> finding longest consecutive sequence. <code>[100,4,200,1,3,2]</code> → 4 (sequence 1-4).</h3>
</div>
<div class="code-cell" id="cell-65">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-65'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-65'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-65"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-141">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write a function <code>group_by(lst, key_func)</code> that groups elements by a key function. Return a dict of lists.</h3>
</div>
<div class="code-cell" id="cell-66">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-66'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-66'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-66"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-143">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a function <code>interleave(a, b)</code> merging alternately: <code>[1,3,5],[2,4,6]</code> → <code>[1,2,3,4,5,6]</code>. Handle different lengths.</h3>
</div>
<div class="code-cell" id="cell-67">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-67'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-67'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-67"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-145">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a function <code>partition(lst, pred)</code> splitting into two lists based on predicate. Return <code>(true_list, false_list)</code>.</h3>
</div>
<div class="code-cell" id="cell-68">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-68'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-68'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-68"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-147">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write a function <code>find_duplicates(lst)</code> returning all elements that appear more than once. Preserve first-seen order.</h3>
</div>
<div class="code-cell" id="cell-69">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-69'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-69'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-69"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-149">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write code implementing binary search on a sorted list. Return index or -1. No <code>bisect</code> module.</h3>
</div>
<div class="code-cell" id="cell-70">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-70'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-70'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-70"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-151">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a function <code>matrix_multiply(A, B)</code> for matrix multiplication. Validate dimensions. Return result matrix.</h3>
</div>
<div class="code-cell" id="cell-71">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-71'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-71'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-71"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-153">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a function <code>compress(lst)</code> implementing RLE: <code>[1,1,2,2,2,3]</code> → <code>[(1,2),(2,3),(3,1)]</code>.</h3>
</div>
<div class="code-cell" id="cell-72">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-72'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-72'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-72"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-155">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a function <code>kth_largest(lst, k)</code> finding kth largest element without full sort. Use partial sort or heap.</h3>
</div>
<div class="code-cell" id="cell-73">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-73'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-73'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-73"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-157">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a function <code>is_sorted(lst)</code> checking if list is sorted (ascending or descending). Handle equal elements.</h3>
</div>
<div class="code-cell" id="cell-74">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-74'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-74'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-74"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-159">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a function <code>dutch_flag(lst)</code> sorting <code>[0,1,2,0,1,2]</code> in-place with single pass. Three-way partition.</h3>
</div>
<div class="code-cell" id="cell-75">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-75'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-75'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-75"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-161">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a function <code>subsets(lst)</code> generating all subsets (power set). <code>[1,2]</code> → <code>[[], [1], [2], [1,2]]</code>.</h3>
</div>
<div class="code-cell" id="cell-76">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-76'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-76'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-76"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-163">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a function <code>next_greater(lst)</code> finding next greater element for each: <code>[4,5,2,10]</code> → <code>[5,10,10,-1]</code>.</h3>
</div>
<div class="code-cell" id="cell-77">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-77'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-77'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-77"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-165">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a function <code>max_profit(prices)</code> finding max stock profit from single buy-sell. <code>[7,1,5,3,6,4]</code> → <code>5</code>.</h3>
</div>
<div class="code-cell" id="cell-78">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-78'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-78'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-78"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 4 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th><th>Professional Application</th></tr></thead><tbody>
<tr><td>1</td><td>Creation</td><td>Mutable, dynamic, any type</td><td>Data buffers, accumulators</td></tr>
<tr><td>2</td><td>Indexing</td><td>Zero-based; slice assignment modifies</td><td>Data extraction, pagination</td></tr>
<tr><td>3</td><td>Methods</td><td>In-place methods return <code>None</code></td><td>Data manipulation</td></tr>
<tr><td>4</td><td>Copying</td><td><code>.copy()</code> is shallow; use <code>deepcopy</code> for nested</td><td>Data integrity</td></tr>
<tr><td>5</td><td>Comprehensions</td><td><code>[expr for x in iter if cond]</code></td><td>Filtering, transformation</td></tr>
<tr><td>6</td><td>Built-ins</td><td><code>enumerate</code>, <code>zip</code>, <code>any</code>, <code>all</code></td><td>Aggregation, pairing</td></tr>
<tr><td>7</td><td>Nested Lists</td><td>2D data; <code>zip(*m)</code> transposes</td><td>Tabular data, matrices</td></tr>
<tr><td>8</td><td>Stack/Queue</td><td>LIFO/FIFO patterns; use <code>deque</code></td><td>Algorithms, task processing</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I understand mutability and can avoid accidental aliasing.</p>
<p>• [ ] I know the difference between <code>.sort()</code> (in-place) and <code>sorted()</code> (new list).</p>
<p>• [ ] I can use list comprehensions for filtering and transformation.</p>
<p>• [ ] I understand shallow vs deep copy for nested structures.</p>
<p>• [ ] I can use <code>enumerate()</code> and <code>zip()</code> for Pythonic iteration.</p>
<p>• [ ] I have completed all 5 practice tasks.</p>
<p>• [ ] I have reviewed all 25 interview questions.</p>
<p><strong>Next Up: Day 5 - Tuples: Immutable Records, Packing/Unpacking, and Named Tuples</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. List Creation & Basics : Dynamic Mutable Sequences"}, {"anchor": "checks-List Creation-3", "title": "\ud83e\uddea Checks: List Creation"}, {"anchor": "sec-14", "title": "2. List Indexing & Slicing : Precision Data Access"}, {"anchor": "checks-Indexing & Slicing-16", "title": "\ud83e\uddea Checks: Indexing & Slicing"}, {"anchor": "sec-27", "title": "3. List Methods : In-Place Modification"}, {"anchor": "checks-List Methods-29", "title": "\ud83e\uddea Checks: List Methods"}, {"anchor": "sec-40", "title": "4. Copying Lists : Shallow vs Deep Copy"}, {"anchor": "checks-Copying-42", "title": "\ud83e\uddea Checks: Copying"}, {"anchor": "sec-53", "title": "5. List Comprehensions : Functional Data Transformation"}, {"anchor": "checks-Comprehensions-55", "title": "\ud83e\uddea Checks: Comprehensions"}, {"anchor": "sec-66", "title": "6. Built-in Functions for Lists : Aggregation & Analysis"}, {"anchor": "checks-Built-in Functions-68", "title": "\ud83e\uddea Checks: Built-in Functions"}, {"anchor": "sec-79", "title": "7. Nested Lists : 2D Data Structures"}, {"anchor": "checks-Nested Lists-81", "title": "\ud83e\uddea Checks: Nested Lists"}, {"anchor": "sec-92", "title": "8. Lists as Stacks & Queues : Data Structure Patterns"}, {"anchor": "checks-Stack & Queue-94", "title": "\ud83e\uddea Checks: Stack & Queue"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-117", "title": "Q1."}, {"anchor": "sec-119", "title": "Q2."}, {"anchor": "sec-121", "title": "Q3."}, {"anchor": "sec-123", "title": "Q4."}, {"anchor": "sec-125", "title": "Q5."}, {"anchor": "sec-127", "title": "Q6."}, {"anchor": "sec-129", "title": "Q7."}, {"anchor": "sec-131", "title": "Q8."}, {"anchor": "sec-133", "title": "Q9."}, {"anchor": "sec-135", "title": "Q10."}, {"anchor": "sec-137", "title": "Q11."}, {"anchor": "sec-139", "title": "Q12."}, {"anchor": "sec-141", "title": "Q13."}, {"anchor": "sec-143", "title": "Q14."}, {"anchor": "sec-145", "title": "Q15."}, {"anchor": "sec-147", "title": "Q16."}, {"anchor": "sec-149", "title": "Q17."}, {"anchor": "sec-151", "title": "Q18."}, {"anchor": "sec-153", "title": "Q19."}, {"anchor": "sec-155", "title": "Q20."}, {"anchor": "sec-157", "title": "Q21."}, {"anchor": "sec-159", "title": "Q22."}, {"anchor": "sec-161", "title": "Q23."}, {"anchor": "sec-163", "title": "Q24."}, {"anchor": "sec-165", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48", "cell-49", "cell-50", "cell-51", "cell-52", "cell-53", "cell-54", "cell-55", "cell-56", "cell-57", "cell-58", "cell-59", "cell-60", "cell-61", "cell-62", "cell-63", "cell-64", "cell-65", "cell-66", "cell-67", "cell-68", "cell-69", "cell-70", "cell-71", "cell-72", "cell-73", "cell-74", "cell-75", "cell-76", "cell-77", "cell-78"]'::jsonb),
('day05', '📦 Tuples', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Tuples are Python''s immutable sequences — faster, safer, and more memory-efficient than lists. Today we master tuple creation, unpacking, named tuples, and professional patterns. Understanding tuples is essential because Python uses them everywhere: function returns, dict iteration, enumerate, and zip.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Concept</th><th>Core Use Case</th></tr></thead><tbody>
<tr><td>1</td><td>Creation</td><td>Immutable, <code>(42,)</code> for single</td><td>Fixed records</td></tr>
<tr><td>2</td><td>Indexing & Methods</td><td><code>.count()</code>, <code>.index()</code> only</td><td>Data access</td></tr>
<tr><td>3</td><td>Packing/Unpacking</td><td><code>a, *rest = data</code></td><td>Multi-value returns</td></tr>
<tr><td>4</td><td>Named Tuples</td><td><code>namedtuple(''Name'', fields)</code></td><td>Readable records</td></tr>
<tr><td>5</td><td>Tuples vs Lists</td><td>Hashable, faster, less memory</td><td>Dict keys, safety</td></tr>
<tr><td>6</td><td>Patterns</td><td>Sort keys, zip, enumerate</td><td>Idiomatic Python</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Tuple Creation & Basics : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Immutable Ordered Sequences</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A tuple is an <b>ordered, immutable collection</b> created with parentheses <code>()</code> or just commas. Once created, elements <b>cannot be added, removed, or changed</b>. This immutability makes tuples faster, hashable, and safer than lists.</p>
<table>
<thead><tr><th>Creation Method</th><th>Example</th><th>Note</th></tr></thead><tbody>
<tr><td>Parentheses</td><td><code>(1, 2, 3)</code></td><td>Standard</td></tr>
<tr><td>Without parens</td><td><code>1, 2, 3</code></td><td>Comma creates tuple</td></tr>
<tr><td>Single element</td><td><code>(42,)</code></td><td>Trailing comma required!</td></tr>
<tr><td><code>tuple()</code></td><td><code>tuple([1,2,3])</code></td><td>Convert from iterable</td></tr>
<tr><td>Empty</td><td><code>()</code> or <code>tuple()</code></td><td>Empty tuple</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Database records</strong>: Query results are returned as tuples — immutable rows</p>
<p>• <strong>Function returns</strong>: Functions return multiple values as tuples: <code>return x, y</code></p>
<p>• <strong>Configuration</strong>: Immutable settings that should not be accidentally modified</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Single Element Tuple</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>(42)</code> is just an integer in parentheses. You need a trailing comma: <code>(42,)</code> to create a single-element tuple.
</div>
<h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Tuples use <b>less memory</b> than lists and are <b>faster</b> to create and access. Use them for fixed collections.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Creation methods
coords = (10, 20)
rgb = 255, 128, 0       # Parens optional
single = (42,)           # Trailing comma!
empty = ()
from_list = tuple([1, 2, 3])

print(f&#x27;coords: {coords}, type: {type(coords)}&#x27;)
print(f&#x27;rgb: {rgb}&#x27;)
print(f&#x27;single: {single}, type: {type(single)}&#x27;)
print(f&#x27;(42) type: {type((42))}&#x27;)  # int, not tuple!

# Immutability
import sys
lst = [1, 2, 3]
tpl = (1, 2, 3)
print(f&#x27;List size: {sys.getsizeof(lst)} bytes&#x27;)
print(f&#x27;Tuple size: {sys.getsizeof(tpl)} bytes&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Creation-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Creation</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create tuples using all 4 methods: parentheses, commas only, <code>tuple()</code> constructor, and single-element. Print each with <code>type()</code>.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Prove that <code>(42)</code> is an <code>int</code> but <code>(42,)</code> is a <code>tuple</code>. Print <code>type()</code> for both. Why does this matter?</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Try to modify a tuple: <code>t = (1, 2, 3); t[0] = 99</code>. Catch the <code>TypeError</code> and print the error message.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Compare memory usage of a list vs tuple with the same 1000 elements using <code>sys.getsizeof()</code>. Print the difference.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Convert between types: list → tuple → list. Start with <code>[10, 20, 30]</code>. Print each conversion and verify contents are equal.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Indexing, Slicing & Methods : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Accessing Tuple Data</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Tuples support the same indexing and slicing as lists and strings. Since tuples are immutable, they have only <b>two methods</b>: <code>.count()</code> and <code>.index()</code>. No append, remove, or sort.</p>
<table>
<thead><tr><th>Operation</th><th>Syntax</th><th>Description</th></tr></thead><tbody>
<tr><td>Access</td><td><code>t[0]</code>, <code>t[-1]</code></td><td>By index</td></tr>
<tr><td>Slice</td><td><code>t[1:3]</code></td><td>Returns new tuple</td></tr>
<tr><td>Count</td><td><code>t.count(x)</code></td><td>Occurrences of x</td></tr>
<tr><td>Index</td><td><code>t.index(x)</code></td><td>First position of x</td></tr>
<tr><td>Length</td><td><code>len(t)</code></td><td>Number of elements</td></tr>
<tr><td>Membership</td><td><code>x in t</code></td><td>Check presence</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Record access</strong>: Access database row fields by position: <code>row[0]</code> for ID, <code>row[1]</code> for name</p>
<p>• <strong>Data validation</strong>: <code>.count()</code> to verify expected occurrences in fixed datasets</p>
<p>• <strong>Slicing subsets</strong>: Extract specific fields from structured records</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Tuples support all the same built-in functions as lists: <code>len()</code>, <code>min()</code>, <code>max()</code>, <code>sum()</code>, <code>sorted()</code> (returns a list).</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">record = (&#x27;Alice&#x27;, 28, &#x27;Engineer&#x27;, &#x27;London&#x27;, 85000)

# Indexing
print(f&#x27;Name: {record[0]}&#x27;)
print(f&#x27;City: {record[-2]}&#x27;)

# Slicing
print(f&#x27;Name+Age: {record[:2]}&#x27;)

# Methods
scores = (85, 92, 78, 85, 95, 85)
print(f&#x27;Count of 85: {scores.count(85)}&#x27;)  # 3
print(f&#x27;Index of 92: {scores.index(92)}&#x27;)  # 1

# Built-in functions work
print(f&#x27;Min: {min(scores)}, Max: {max(scores)}&#x27;)
print(f&#x27;Sorted (returns list): {sorted(scores)}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Indexing & Methods-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Indexing & Methods</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>data = (10, 20, 30, 40, 50)</code>, access: first, last, middle element, and a slice of first 3. Print each.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>grades = (85, 92, 78, 85, 95, 85)</code>, find: how many times <code>85</code> appears, and the index of <code>95</code>. Print both.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>min()</code>, <code>max()</code>, <code>sum()</code>, <code>len()</code> on <code>scores = (88, 76, 95, 82, 91)</code> to compute basic statistics. Print all.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>sorted()</code> on <code>names = ("Charlie", "Alice", "Bob")</code>. What type does it return? Convert back to tuple.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Check membership: is <code>"Python"</code> in <code>langs = ("Python", "Java", "C++", "Go")</code>? Use the <code>in</code> operator. Print result.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Packing & Unpacking : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Elegant Data Extraction</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <b>Packing</b> combines values into a tuple. <b>Unpacking</b> extracts tuple elements into individual variables. Python also supports <b>extended unpacking</b> with <code>*</code> to capture remaining elements.
</div></div>
<pre class="nb-code-block"><code># Packing
point = 10, 20, 30

# Unpacking
x, y, z = point

# Extended unpacking
first, *rest = [1, 2, 3, 4, 5]  # first=1, rest=[2,3,4,5]
first, *mid, last = [1, 2, 3, 4, 5]  # first=1, mid=[2,3,4], last=5</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Multiple returns</strong>: <code>mean, std = compute_stats(data)</code> — unpack function results</p>
<p>• <strong>Swap variables</strong>: <code>a, b = b, a</code> — Pythonic swap without temp variable</p>
<p>• <strong>Iteration</strong>: <code>for name, age in pairs:</code> — unpack in loops</p>
<p>• <strong>CSV parsing</strong>: <code>date, *values = row.split('','')</code> — separate header from data</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Mismatched Unpacking</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Unpacking requires exact count match: <code>a, b = (1, 2, 3)</code> raises <code>ValueError</code>. Use <code><em></code> to absorb extras: <code>a, b, </em>rest = (1, 2, 3)</code>.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13"># Packing
coord = 3.5, 7.2, 1.0
print(f&#x27;Packed: {coord}&#x27;)

# Unpacking
x, y, z = coord
print(f&#x27;x={x}, y={y}, z={z}&#x27;)

# Swap — most Pythonic pattern
a, b = 10, 20
a, b = b, a
print(f&#x27;Swapped: a={a}, b={b}&#x27;)

# Extended unpacking
first, *rest = [1, 2, 3, 4, 5]
print(f&#x27;First: {first}, Rest: {rest}&#x27;)

head, *body, tail = &#x27;ABCDE&#x27;
print(f&#x27;Head: {head}, Body: {body}, Tail: {tail}&#x27;)

# In loops
students = [(&#x27;Alice&#x27;, 95), (&#x27;Bob&#x27;, 82), (&#x27;Charlie&#x27;, 91)]
for name, score in students:
    print(f&#x27;{name}: {score}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Packing & Unpacking-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Packing & Unpacking</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Pack three variables <code>name, age, city</code> into a tuple. Then unpack it back into three new variables and print them.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Swap <code>x = 10</code> and <code>y = 20</code> using tuple unpacking (one line, no temp variable). Print before and after.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use extended unpacking: given <code>data = (1, 2, 3, 4, 5)</code>, extract first element and remaining into <code>first, *rest</code>. Print both.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a function <code>min_max(lst)</code> that returns <code>(min, max)</code> as a tuple. Unpack the result into two variables. Test with <code>[3, 1, 4, 1, 5]</code>.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Given <code>records = [("Alice",85,"A"), ("Bob",72,"B")]</code>, iterate with unpacking: <code>for name, score, grade in records:</code>. Print formatted output.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-40">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>4. Named Tuples : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Self-Documenting Records</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <code>collections.namedtuple</code> creates tuple subclasses with <b>named fields</b>. You get the immutability and performance of tuples, plus the readability of accessing fields by name instead of index.
</div></div>
<pre class="nb-code-block"><code>from collections import namedtuple
Employee = namedtuple(&#x27;Employee&#x27;, [&#x27;name&#x27;, &#x27;age&#x27;, &#x27;dept&#x27;])
emp = Employee(&#x27;Alice&#x27;, 30, &#x27;Engineering&#x27;)
print(emp.name)  # Alice (instead of emp[0])</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Database rows</strong>: Map query results to named fields for readable access</p>
<p>• <strong>Config objects</strong>: Immutable configuration with meaningful attribute names</p>
<p>• <strong>API responses</strong>: Structure API data with clear field names</p>
<p>• <strong>CSV records</strong>: Parse CSV rows into typed, named records</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Named tuples support <code>._asdict()</code> to convert to dict, <code>._replace()</code> to create modified copies, and <code>._fields</code> to list field names.</p>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19">from collections import namedtuple

# Define a record type
Employee = namedtuple(&#x27;Employee&#x27;, [&#x27;name&#x27;, &#x27;age&#x27;, &#x27;dept&#x27;, &#x27;salary&#x27;])

# Create instances
alice = Employee(&#x27;Alice&#x27;, 30, &#x27;Engineering&#x27;, 95000)
bob = Employee(name=&#x27;Bob&#x27;, age=25, dept=&#x27;Marketing&#x27;, salary=72000)

# Access by name (readable!)
print(f&#x27;{alice.name} in {alice.dept}: ${alice.salary:,}&#x27;)

# Still works with indexing
print(f&#x27;Name: {alice[0]}, Age: {alice[1]}&#x27;)

# Useful methods
print(f&#x27;Fields: {Employee._fields}&#x27;)
print(f&#x27;As dict: {alice._asdict()}&#x27;)

# Create modified copy
senior_alice = alice._replace(salary=110000)
print(f&#x27;Promoted: {senior_alice}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Named Tuples-42">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Named Tuples</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a <code>Point</code> named tuple with fields <code>x, y</code>. Create two points and compute the distance between them. Print the result.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a <code>Student</code> named tuple with <code>name, grade, gpa</code>. Create 3 students and find the one with highest GPA. Print the winner.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>._asdict()</code> to convert a named tuple to a dictionary. Use <code>._replace()</code> to create a modified copy. Print both.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Parse CSV-style data into named tuples: from <code>"Alice,28,NYC"</code> create a <code>Person(name, age, city)</code>. Print with field names.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Create a list of 5 <code>Product(name, price, qty)</code> named tuples. Write code to find total inventory value (<code>price * qty</code> for all). Print it.</p></div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-53">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>5. Tuples vs Lists : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">When to Use Which</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>The choice between tuple and list depends on your intent: use <b>tuples for fixed, heterogeneous records</b> (like database rows) and <b>lists for variable-length, homogeneous collections</b> (like a series of measurements). Tuples signal "this data should not change."</p>
<table>
<thead><tr><th>Feature</th><th>Tuple</th><th>List</th></tr></thead><tbody>
<tr><td>Mutable?</td><td>No</td><td>Yes</td></tr>
<tr><td>Speed</td><td>Faster</td><td>Slower</td></tr>
<tr><td>Memory</td><td>Less</td><td>More</td></tr>
<tr><td>Hashable?</td><td>Yes (if contents are)</td><td>No</td></tr>
<tr><td>Dict key?</td><td>Yes</td><td>No</td></tr>
<tr><td>Methods</td><td>2 (count, index)</td><td>11+</td></tr>
<tr><td>Use for</td><td>Fixed records</td><td>Dynamic collections</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Dict keys</strong>: Tuples can be dictionary keys (hashable): <code>{(lat, lon): ''city''}</code></p>
<p>• <strong>Set elements</strong>: Tuples can be added to sets; lists cannot</p>
<p>• <strong>Thread safety</strong>: Immutable tuples are inherently thread-safe</p>
<p>• <strong>Performance</strong>: Tuple creation is ~5-10x faster than list creation</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Mutable Elements Inside Tuples</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>A tuple containing a list <code>t = ([1, 2], 3)</code> cannot be hashed (unhashable). The tuple itself is immutable, but the list inside can still be modified: <code>t[0].append(99)</code> works!</p>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25">import timeit

# Speed comparison
list_time = timeit.timeit(&#x27;[1, 2, 3, 4, 5]&#x27;, number=1000000)
tuple_time = timeit.timeit(&#x27;(1, 2, 3, 4, 5)&#x27;, number=1000000)
print(f&#x27;List creation:  {list_time:.3f}s&#x27;)
print(f&#x27;Tuple creation: {tuple_time:.3f}s&#x27;)
print(f&#x27;Tuple is {list_time/tuple_time:.1f}x faster&#x27;)

# Tuples as dict keys
locations = {
    (40.7128, -74.0060): &#x27;New York&#x27;,
    (51.5074, -0.1278): &#x27;London&#x27;,
    (35.6762, 139.6503): &#x27;Tokyo&#x27;,
}
print(locations[(40.7128, -74.0060)])  # New York

# Mutable element inside tuple
t = ([1, 2], &#x27;hello&#x27;)
t[0].append(3)  # This works!
print(t)  # ([1, 2, 3], &#x27;hello&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Tuples vs Lists-55">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Tuples vs Lists</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Time the creation of a tuple vs list with 1000 elements using <code>timeit</code>. Print which is faster and by how much.</p></div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use a tuple as a dictionary key: create a mapping from <code>(latitude, longitude)</code> to city names for 3 cities. Look up one coordinate.</p></div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Try adding a list and a tuple to a <code>set</code>. Which works? Which raises <code>TypeError</code>? Explain why (hashability).</p></div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Show that a tuple containing a list <code>([1,2], 3)</code> can have its list modified but the tuple itself cannot be reassigned. Demonstrate both.</p></div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Given a dataset scenario: 1000 records, each with 5 fixed fields. Argue whether to store as list-of-tuples or list-of-lists. Test memory with <code>sys.getsizeof</code>.</p></div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>6. Professional Tuple Patterns : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Real-World Applications</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Tuples shine in specific patterns: <b>multiple return values</b>, <b>dict items iteration</b>, <b>enumerate results</b>, and <b>zip pairings</b>. Recognizing where Python already uses tuples helps you write more idiomatic code.</p>
<p><strong>Where Python uses tuples implicitly:</strong></p>
<p>• <code>dict.items()</code> → <code>(key, value)</code> tuples</p>
<p>• <code>enumerate()</code> → <code>(index, value)</code> tuples</p>
<p>• <code>zip()</code> → tuples of paired elements</p>
<p>• Multiple return → <code>return a, b</code> packs a tuple</p>
<p>• String <code>%</code> formatting → <code>''%s is %d'' % (name, age)</code></p>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Multi-value returns</strong>: <code>mean, std = get_statistics(data)</code> — clean function interfaces</p>
<p>• <strong>Sorting with keys</strong>: <code>sorted(data, key=lambda x: (x[''dept''], -x[''salary'']))</code> — multi-level sort</p>
<p>• <strong>Record comparison</strong>: Tuples compare element-by-element: <code>(1, ''b'') < (1, ''c'')</code> → <code>True</code></p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Tuples compare <b>lexicographically</b>: element by element, left to right. Use this for multi-level sorting: <code>sorted(items, key=lambda x: (x.dept, -x.salary))</code>.</p>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Multiple return values
def analyze(data):
    return min(data), max(data), sum(data)/len(data)

lo, hi, avg = analyze([10, 20, 30, 40, 50])
print(f&#x27;Min: {lo}, Max: {hi}, Avg: {avg}&#x27;)

# dict.items() returns tuples
scores = {&#x27;Alice&#x27;: 95, &#x27;Bob&#x27;: 82, &#x27;Charlie&#x27;: 91}
for name, score in scores.items():
    print(f&#x27;{name}: {score}&#x27;)

# Multi-level sort with tuples
students = [(&#x27;Bob&#x27;, 85), (&#x27;Alice&#x27;, 92), (&#x27;Bob&#x27;, 78), (&#x27;Alice&#x27;, 88)]
sorted_students = sorted(students)  # Sorts by name, then score
print(f&#x27;\nSorted: {sorted_students}&#x27;)

# Tuple comparison
print((1, &#x27;b&#x27;) &lt; (1, &#x27;c&#x27;))  # True — compares second element
print((2, &#x27;a&#x27;) &lt; (1, &#x27;z&#x27;))  # False — first element decides</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Patterns-68">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Patterns</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a function <code>stats(data)</code> that returns <code>(min, max, mean, median)</code> as a tuple. Unpack the result and print each value.</p></div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>enumerate()</code> on <code>fruits = ["apple", "banana", "cherry"]</code> and collect the <code>(index, value)</code> tuples into a list. Print it.</p></div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Sort <code>employees = [("Bob", "Sales", 50000), ("Alice", "Engineering", 90000), ("Bob", "Engineering", 75000)]</code> by department, then by salary descending.</p></div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>zip()</code> to combine <code>keys = ["name", "age", "city"]</code> and <code>values = ["Alice", 28, "NYC"]</code> into a dictionary using <code>dict(zip(...))</code>.</p></div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Demonstrate tuple comparison: create 5 version tuples like <code>(1, 2, 3)</code> and sort them. Print the sorted order.</p></div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Record Processor):</strong> Create 5 employee records as named tuples <code>(name, dept, salary)</code>. Write code to: find highest salary, average salary by department, and list employees sorted by salary.</p></div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Coordinate System):</strong> Write functions <code>distance(p1, p2)</code> and <code>midpoint(p1, p2)</code> that take <code>(x, y)</code> tuples. Test with 3 pairs of points and print formatted results.</p></div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Data Converter):</strong> Write a function <code>csv_to_records(csv_text)</code> that takes a multi-line CSV string, parses it into a list of named tuples, and returns them. Test with 5 rows of data.</p></div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Immutable Config):</strong> Create a configuration system using nested named tuples: <code>Config(db=DBConfig(...), api=APIConfig(...))</code>. Show that values cannot be accidentally modified.</p></div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Frequency Analyzer):</strong> Write a function <code>top_n(data, n)</code> that takes a list of values, counts frequencies using tuples <code>(value, count)</code>, sorts by count, and returns the top n. Test with a word list.</p></div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-91">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a function that takes a list of <code>(x, y)</code> tuples and returns the point closest to the origin <code>(0, 0)</code>.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-93">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Implement <code>tuple_sort(tuples, key_index)</code> that sorts a list of tuples by the element at <code>key_index</code>.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-95">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a function <code>group_by_first(pairs)</code> grouping <code>[(1,''a''),(1,''b''),(2,''c'')]</code> → <code>{1:[''a'',''b''], 2:[''c'']}</code>.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-97">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a function <code>zip_longest(a, b, fill=None)</code> that zips with fill for shorter list. No <code>itertools</code>.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-99">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a function <code>unzip(pairs)</code> that converts <code>[(1,''a''),(2,''b'')]</code> → <code>([1,2],[''a'',''b''])</code>. Use <code>zip(*pairs)</code>.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-101">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write a function <code>most_common(lst, n)</code> returning n most frequent elements as <code>(element, count)</code> tuples.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-103">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Implement a simple <code>Point</code> class using named tuple with <code>distance_to()</code> and <code><strong>repr</strong></code> methods.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-105">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a function that finds all pairs in a list that sum to a target, returning as tuples.</h3>
</div>
<div class="code-cell" id="cell-49">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-49'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-49'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-49"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-107">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a function <code>merge_records(r1, r2)</code> merging two named tuples, preferring non-None values from r2.</h3>
</div>
<div class="code-cell" id="cell-50">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-50'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-50'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-50"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-109">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a function <code>running_stats(data)</code> yielding <code>(index, value, running_mean, running_max)</code> tuples.</h3>
</div>
<div class="code-cell" id="cell-51">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-51'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-51'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-51"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-111">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a function to convert a dict to a sorted list of <code>(key, value)</code> tuples, sorted by value.</h3>
</div>
<div class="code-cell" id="cell-52">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-52'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-52'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-52"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-113">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Implement matrix transposition using tuples and <code>zip()</code>. Handle non-rectangular inputs.</h3>
</div>
<div class="code-cell" id="cell-53">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-53'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-53'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-53"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-115">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write a function <code>compare_versions(v1, v2)</code> comparing version tuples like <code>(1,2,3)</code> vs <code>(1,3,0)</code>.</h3>
</div>
<div class="code-cell" id="cell-54">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-54'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-54'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-54"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-117">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a function <code>pack_ranges(sorted_nums)</code> converting <code>[1,2,3,5,6,8]</code> → <code>[(1,3),(5,6),(8,8)]</code>.</h3>
</div>
<div class="code-cell" id="cell-55">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-55'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-55'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-55"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-119">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a function <code>cartesian_product(a, b)</code> returning all <code>(x, y)</code> pairs from two tuples.</h3>
</div>
<div class="code-cell" id="cell-56">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-56'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-56'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-56"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-121">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write code to find the second largest unique element in a tuple without converting to list or sorting.</h3>
</div>
<div class="code-cell" id="cell-57">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-57'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-57'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-57"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-123">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a function <code>rotate_tuple(t, n)</code> rotating a tuple by n positions. <code>(1,2,3,4), 2</code> → <code>(3,4,1,2)</code>.</h3>
</div>
<div class="code-cell" id="cell-58">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-58'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-58'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-58"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-125">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a function <code>flatten_tuples(nested)</code> flattening <code>((1, 2), (3, (4, 5)))</code> → <code>(1, 2, 3, 4, 5)</code>. Use recursion.</h3>
</div>
<div class="code-cell" id="cell-59">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-59'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-59'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-59"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-127">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a function <code>weighted_average(data)</code> taking <code>[(value, weight), ...]</code> tuples and computing weighted mean.</h3>
</div>
<div class="code-cell" id="cell-60">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-60'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-60'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-60"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-129">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Implement a simple <code>Matrix</code> as tuple-of-tuples with <code>get(row, col)</code>, <code>transpose()</code>, and <code>add(other)</code> methods.</h3>
</div>
<div class="code-cell" id="cell-61">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-61'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-61'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-61"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-131">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a function <code>sliding_window(data, size)</code> returning tuples of each window: <code>[1,2,3,4], 2</code> → <code>[(1,2),(2,3),(3,4)]</code>.</h3>
</div>
<div class="code-cell" id="cell-62">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-62'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-62'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-62"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-133">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a function <code>rank(data)</code> that returns <code>(value, rank)</code> tuples, handling ties with average rank.</h3>
</div>
<div class="code-cell" id="cell-63">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-63'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-63'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-63"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-135">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a function <code>safe_unpack(t, n, default=None)</code> that unpacks t into n variables, filling with default if too short.</h3>
</div>
<div class="code-cell" id="cell-64">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-64'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-64'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-64"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-137">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Implement <code>OrderedPair</code> ensuring <code>first <= second</code>. <code>OrderedPair(5, 3)</code> → <code>OrderedPair(3, 5)</code>.</h3>
</div>
<div class="code-cell" id="cell-65">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-65'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-65'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-65"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-139">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a function <code>tuple_diff(t1, t2)</code> returning elements in t1 but not t2, preserving order and count.</h3>
</div>
<div class="code-cell" id="cell-66">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-66'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-66'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-66"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 5 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th><th>Professional Application</th></tr></thead><tbody>
<tr><td>1</td><td>Creation</td><td>Immutable; trailing comma for single</td><td>Database records, config</td></tr>
<tr><td>2</td><td>Indexing</td><td>Same as lists; only <code>count</code>/<code>index</code> methods</td><td>Data access</td></tr>
<tr><td>3</td><td>Packing/Unpacking</td><td><code>*</code> for extended; swap with <code>a,b=b,a</code></td><td>Function returns, loops</td></tr>
<tr><td>4</td><td>Named Tuples</td><td>Named fields; <code>_asdict()</code>, <code>_replace()</code></td><td>Readable records</td></tr>
<tr><td>5</td><td>Tuples vs Lists</td><td>Faster, hashable, dict-key-compatible</td><td>Performance, safety</td></tr>
<tr><td>6</td><td>Patterns</td><td>Multi-return, <code>dict.items()</code>, sorting</td><td>Idiomatic Python</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I understand tuple immutability and when to prefer tuples over lists.</p>
<p>• [ ] I can use packing/unpacking including extended <code>*</code> syntax.</p>
<p>• [ ] I can create and use named tuples for readable records.</p>
<p>• [ ] I know that tuples are hashable and can be dict keys.</p>
<p>• [ ] I understand lexicographic tuple comparison for multi-level sorting.</p>
<p>• [ ] I have completed all 5 practice tasks.</p>
<p>• [ ] I have reviewed all 25 interview questions.</p>
<p><strong>Next Up: Day 6 - Sets: O(1) Lookups, Deduplication, and Set Theory Operations</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Tuple Creation & Basics : Immutable Ordered Sequences"}, {"anchor": "checks-Creation-3", "title": "\ud83e\uddea Checks: Creation"}, {"anchor": "sec-14", "title": "2. Indexing, Slicing & Methods : Accessing Tuple Data"}, {"anchor": "checks-Indexing & Methods-16", "title": "\ud83e\uddea Checks: Indexing & Methods"}, {"anchor": "sec-27", "title": "3. Packing & Unpacking : Elegant Data Extraction"}, {"anchor": "checks-Packing & Unpacking-29", "title": "\ud83e\uddea Checks: Packing & Unpacking"}, {"anchor": "sec-40", "title": "4. Named Tuples : Self-Documenting Records"}, {"anchor": "checks-Named Tuples-42", "title": "\ud83e\uddea Checks: Named Tuples"}, {"anchor": "sec-53", "title": "5. Tuples vs Lists : When to Use Which"}, {"anchor": "checks-Tuples vs Lists-55", "title": "\ud83e\uddea Checks: Tuples vs Lists"}, {"anchor": "sec-66", "title": "6. Professional Tuple Patterns : Real-World Applications"}, {"anchor": "checks-Patterns-68", "title": "\ud83e\uddea Checks: Patterns"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-91", "title": "Q1."}, {"anchor": "sec-93", "title": "Q2."}, {"anchor": "sec-95", "title": "Q3."}, {"anchor": "sec-97", "title": "Q4."}, {"anchor": "sec-99", "title": "Q5."}, {"anchor": "sec-101", "title": "Q6."}, {"anchor": "sec-103", "title": "Q7."}, {"anchor": "sec-105", "title": "Q8."}, {"anchor": "sec-107", "title": "Q9."}, {"anchor": "sec-109", "title": "Q10."}, {"anchor": "sec-111", "title": "Q11."}, {"anchor": "sec-113", "title": "Q12."}, {"anchor": "sec-115", "title": "Q13."}, {"anchor": "sec-117", "title": "Q14."}, {"anchor": "sec-119", "title": "Q15."}, {"anchor": "sec-121", "title": "Q16."}, {"anchor": "sec-123", "title": "Q17."}, {"anchor": "sec-125", "title": "Q18."}, {"anchor": "sec-127", "title": "Q19."}, {"anchor": "sec-129", "title": "Q20."}, {"anchor": "sec-131", "title": "Q21."}, {"anchor": "sec-133", "title": "Q22."}, {"anchor": "sec-135", "title": "Q23."}, {"anchor": "sec-137", "title": "Q24."}, {"anchor": "sec-139", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48", "cell-49", "cell-50", "cell-51", "cell-52", "cell-53", "cell-54", "cell-55", "cell-56", "cell-57", "cell-58", "cell-59", "cell-60", "cell-61", "cell-62", "cell-63", "cell-64", "cell-65", "cell-66"]'::jsonb)
ON CONFLICT (day_id) DO UPDATE SET
  title = EXCLUDED.title,
  html_body = EXCLUDED.html_body,
  sections = EXCLUDED.sections,
  cells = EXCLUDED.cells;