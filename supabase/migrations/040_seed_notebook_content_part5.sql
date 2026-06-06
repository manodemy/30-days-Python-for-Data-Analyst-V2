-- ═══════════════════════════════════════════════════════════════
-- Seed Notebook Content: Days 21 to 25
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.notebook_content (day_id, title, html_body, sections, cells)
VALUES
('day21', '📊 NumPy Fundamentals', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Welcome to Phase 2. Data Analytics requires crunching millions of numbers. Standard Python is too slow. NumPy bridges Python with fast C-code, providing the N-Dimensional Array (ndarray). Mastering vectorized math is the gateway to Pandas and Machine Learning.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>ndarrays</td><td>Homogeneous matrices</td></tr>
<tr><td>2</td><td>Generation</td><td><code>arange</code>, <code>zeros</code>, <code>linspace</code></td></tr>
<tr><td>3</td><td>Vectorization</td><td>Fast math without loops</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. NumPy Arrays (ndarrays) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">The Core of Data Science</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Welcome to Phase 2: Data Analytics. <b>NumPy</b> (Numerical Python) is the foundation of Pandas and Scikit-Learn. Its core structure is the <b>ndarray</b> (N-dimensional array), which is up to 50x faster than Python lists because it uses fixed-type C-arrays under the hood.</p>
<pre class="nb-code-block"><code>import numpy as np
# Create a 1D array
arr = np.array([1, 2, 3, 4, 5])</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Performance</strong>: Processing millions of data points instantly</p>
<p>• <strong>Memory Efficiency</strong>: NumPy arrays take up significantly less RAM than standard Python lists</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Mixed Data Types</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Unlike Python lists which can hold <code>[1, ''a'', True]</code>, a NumPy array must be <b>homogenous</b> (all elements must be the same type, e.g., all floats or all ints). If you mix them, NumPy will force them into strings.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">import numpy as np

# Creating arrays
list_data = [1, 2, 3]
array_1d = np.array(list_data)
print(f&quot;1D Array: {array_1d}&quot;)
print(f&quot;Type: {type(array_1d)}&quot;)

# Creating 2D arrays (Matrices)
matrix = np.array([[1, 2], [3, 4]])
print(f&quot;\n2D Array (Matrix):\n{matrix}&quot;)

# Checking attributes
print(f&quot;\nShape: {matrix.shape}&quot;)   # (Rows, Cols)
print(f&quot;Dimensions: {matrix.ndim}&quot;) # 2
print(f&quot;Data Type: {matrix.dtype}&quot;) # int64 or int32</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-NumPy Basics-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>NumPy Basics</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import <code>numpy as np</code>. Create an array from <code>[10, 20, 30]</code>. Print it.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a 2D array (matrix) representing a 3x3 grid of numbers. Print its <code>.shape</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Try creating an array from <code>[1, "two", 3]</code>. Print its <code>.dtype</code>. Notice how the numbers became strings (<code><U...</code>).</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Print the number of dimensions <code>.ndim</code> of the 3x3 array.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Print the total number of elements in the array using <code>.size</code>.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Array Generation : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Built-in Constructors</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>You rarely build massive arrays by manually typing lists. NumPy provides powerful generation functions like <code>np.zeros()</code>, <code>np.arange()</code>, and <code>np.linspace()</code>.</p>
<table>
<thead><tr><th>Function</th><th>Purpose</th><th>Example</th></tr></thead><tbody>
<tr><td><code>np.zeros(shape)</code></td><td>Array of 0s</td><td><code>np.zeros((3,3))</code></td></tr>
<tr><td><code>np.ones(shape)</code></td><td>Array of 1s</td><td><code>np.ones(5)</code></td></tr>
<tr><td><code>np.arange(start, stop, step)</code></td><td>Like Python <code>range</code></td><td><code>np.arange(0, 10, 2)</code></td></tr>
<tr><td><code>np.linspace(start, stop, num)</code></td><td>Evenly spaced points</td><td><code>np.linspace(0, 1, 5)</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Initialization</strong>: Creating empty matrices to fill with model weights</p>
<p>• <strong>Plotting</strong>: Using <code>linspace</code> to generate perfectly spaced X-axis values for charts</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>np.arange()</code> works with floats (e.g., step=0.5), unlike Python''s built-in <code>range()</code> which only takes integers!
</div></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import numpy as np

# Zeros and Ones
zeros = np.zeros((2, 4))  # Pass shape as a tuple
print(&quot;Zeros:\n&quot;, zeros)

# Arange (Start, Stop exclusive, Step)
steps = np.arange(0, 10, 2)
print(&quot;\nArange:&quot;, steps)

# Linspace (Start, Stop INCLUSIVE, Number of points)
points = np.linspace(0, 100, 5)
print(&quot;\nLinspace:&quot;, points)

# Random generation (Uniform 0-1)
rands = np.random.rand(3, 3)
print(&quot;\nRandoms:\n&quot;, rands)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Generators-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Generators</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create an array of 10 zeros. Print it.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a 3x3 matrix of ones using <code>np.ones((3, 3))</code>.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>np.arange()</code> to create an array of numbers from 10 to 50, stepping by 5.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>np.linspace()</code> to generate exactly 11 evenly spaced points between 0 and 1.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Generate a 2x2 matrix of random integers between 1 and 100 using <code>np.random.randint(1, 100, size=(2,2))</code>.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Vectorized Operations : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">No More For-Loops</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>The most important concept in NumPy is <b>Vectorization</b>. You can perform math on entire arrays at once without writing <code>for</code> loops. This is executed in optimized C code, making it blazing fast.</p>
<pre class="nb-code-block"><code># ❌ Bad (Python Loop)
for i in range(len(arr)): arr[i] *= 2

# ✅ Good (Vectorized)
arr = arr * 2</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Financial Math</strong>: Applying a 5% interest rate to a million bank accounts instantly (<code>balances * 1.05</code>)</p>
<p>• <strong>Image Processing</strong>: Brightening an image matrix by adding a constant (<code>pixels + 50</code>)</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Arrays operate element-wise. If you add two arrays <code>A + B</code>, they must be the exact same shape (or compatible via ''broadcasting''). They add position 0 to position 0, 1 to 1, etc.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import numpy as np
import time

arr = np.array([1, 2, 3, 4, 5])

# Scalar Math (Applies to all elements)
print(f&quot;Add: {arr + 10}&quot;)
print(f&quot;Multiply: {arr * 10}&quot;)
print(f&quot;Power: {arr ** 2}&quot;)

# Array to Array Math (Element-wise)
arr2 = np.array([10, 20, 30, 40, 50])
print(f&quot;\nArray Addition: {arr + arr2}&quot;)

# Speed test!
big_list = list(range(1000000))
big_arr = np.array(big_list)

t1 = time.time()
_ = [x * 2 for x in big_list]  # Python loop
list_time = time.time() - t1

t2 = time.time()
_ = big_arr * 2  # NumPy Vectorization
arr_time = time.time() - t2

print(f&quot;\nNumPy is {list_time / arr_time:.1f}x faster!&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Vectorization-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Vectorization</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>arr = np.array([10, 20, 30])</code>. Divide every element by 10 and print the result.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>A = np.array([1, 2])</code> and <code>B = np.array([10, 20])</code>, multiply them together. Print the result.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create an array using <code>arange(1, 6)</code>. Square all elements (<code>**2</code>). Print the result.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a boolean operation: <code>arr > 15</code>. Print the result (you get a boolean array!).</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Measure the speed difference between <code>sum(range(100000))</code> and <code>np.arange(100000).sum()</code>.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Celsius to Fahrenheit):</strong> Create an array of Celsius temperatures: <code>[0, 10, 20, 30, 40]</code>. Use vectorized math to convert them to Fahrenheit <code>(C * 9/5) + 32</code>. Print the result.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Distance Formula):</strong> Given two 1D arrays <code>p1 = np.array([1, 2, 3])</code> and <code>p2 = np.array([4, 5, 6])</code>. Calculate the Euclidean distance using vector math: <code>sqrt(sum((p1 - p2)**2))</code>. (Use <code>np.sqrt</code> and <code>.sum()</code>).</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Identity Matrix):</strong> Research and use <code>np.eye()</code> to create a 5x5 Identity matrix (1s on the diagonal, 0s elsewhere). Multiply it by 5 to make the diagonal 5s.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Random Noise):</strong> Create a 100-element array using <code>np.linspace(0, 10, 100)</code>. Add random uniform noise to it using <code>np.random.rand(100)</code>. Plotting this is the foundation of data visualization!</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Shape Manipulation):</strong> Create a 1D array of 12 elements. Use <code>.reshape((3, 4))</code> to turn it into a 3x4 matrix. Print the new matrix and its <code>.shape</code>.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-52">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Why is NumPy so much faster than standard Python lists?</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>What is the difference between an ndarray and a Python list?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Explain what ''Vectorization'' means in NumPy.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>What happens if you try to put a string into an array of integers? Explain <code>dtype</code> casting.</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>What does the <code>.shape</code> attribute return? What type of object is it?</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>How do you create a 3D array in NumPy? What does its shape look like?</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Explain the difference between <code>np.arange()</code> and <code>np.linspace()</code>.</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>What is ''Element-wise'' operation?</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>How does NumPy handle missing data (NaN) compared to Python <code>None</code>?</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a one-liner to generate an array of 100 random numbers drawn from a normal distribution (<code>np.random.randn</code>).</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>What is the output of <code>np.array([1, 2]) + np.array([3, 4, 5])</code>? Explain what happens.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>How do you check the data type of a NumPy array?</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>How do you explicitly force a NumPy array to be floats instead of ints upon creation? (Hint: <code>dtype=float</code>).</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Explain what <code>np.zeros_like(arr)</code> does.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>What is the difference between <code>np.random.rand()</code> and <code>np.random.randint()</code>?</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>How do you find the total memory consumed by a NumPy array? (Hint: <code>.nbytes</code>).</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Why is it a bad idea to use <code>append()</code> in a loop with NumPy arrays?</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>What is broadcasting in NumPy (briefly)?</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>How do you flatten a 2D matrix into a 1D array? (<code>.flatten()</code> or <code>.ravel()</code>).</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Explain the difference between deep copy and shallow copy (views) in NumPy arrays.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>What happens when you do <code>arr > 5</code>? What does it return?</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>How do you get the transpose of a matrix in NumPy? (Hint: <code>.T</code>).</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>What is the dot product of two vectors, and how do you compute it in NumPy? (<code>np.dot</code> or <code>@</code>).</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>How do you find the maximum value in an array? How do you find its index? (<code>argmax</code>).</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>What is the difference between <code>np.nan</code> and <code>np.inf</code>?</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 21 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Array</td><td><code>shape</code>, <code>ndim</code>, and <code>dtype</code> define the structure</td></tr>
<tr><td>2</td><td>Gen</td><td>Never build big arrays by hand</td></tr>
<tr><td>3</td><td>Vector</td><td>Replace <code>for</code> loops with <code>arr * 2</code>. It''s 100x faster.</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can create 1D and 2D arrays.</p>
<p>• [ ] I can generate arrays using <code>linspace</code> and <code>arange</code>.</p>
<p>• [ ] I understand vectorized math vs for-loops.</p>
<p><strong>Next Up: Day 22 - NumPy Advanced: Indexing, Filtering & Broadcasting</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. NumPy Arrays (ndarrays) : The Core of Data Science"}, {"anchor": "checks-NumPy Basics-3", "title": "\ud83e\uddea Checks: NumPy Basics"}, {"anchor": "sec-14", "title": "2. Array Generation : Built-in Constructors"}, {"anchor": "checks-Generators-16", "title": "\ud83e\uddea Checks: Generators"}, {"anchor": "sec-27", "title": "3. Vectorized Operations : No More For-Loops"}, {"anchor": "checks-Vectorization-29", "title": "\ud83e\uddea Checks: Vectorization"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day22', '📈 NumPy Advanced', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>To manipulate data efficiently, you must master the art of selecting exactly what you need. Today we cover Slicing matrices, filtering data with Boolean Masks, and applying mathematical transformations across different shapes using the magic of Broadcasting.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Slicing</td><td><code>arr[0:2, :]</code>, Views</td></tr>
<tr><td>2</td><td>Masking</td><td><code>arr[arr > 5]</code>, Filtering</td></tr>
<tr><td>3</td><td>Broadcasting</td><td>Shape stretching (<code>+</code>)</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Slicing & Indexing : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Navigating Matrices</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>NumPy slicing is similar to Python lists but extended to multiple dimensions. You access elements using <code>arr[row, col]</code>. Slices return <b>Views</b> (not copies!), meaning if you modify a slice, the original array changes.</p>
<pre class="nb-code-block"><code># [start_row:stop_row, start_col:stop_col]
sub_matrix = matrix[0:2, 1:3]</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Image Cropping</strong>: An image is just a 3D NumPy array (Height, Width, RGB). Cropping is just slicing: <code>img[100:200, 100:200]</code></p>
<p>• <strong>Data Sampling</strong>: Extracting every 10th row using a step slice: <code>data[::10, :]</code></p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ The View Trap</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Slicing a NumPy array does not copy data; it creates a ''View''. <code>slice = arr[:2]; slice[0] = 99</code> WILL change the original array. Use <code>arr[:2].copy()</code> if you need an independent copy.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">import numpy as np

# Create a 3x3 matrix
matrix = np.arange(1, 10).reshape((3, 3))
print(f&quot;Original:\n{matrix}&quot;)

# Indexing a single element (Row 1, Col 2)
print(f&quot;\nElement [1,2]: {matrix[1, 2]}&quot;)

# Slicing the first 2 rows, and all columns
print(f&quot;\nTop 2 rows:\n{matrix[:2, :]}&quot;)

# Slicing the last column
print(f&quot;\nLast column:\n{matrix[:, -1]}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Slicing-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Slicing</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>arr = np.arange(10)</code>. Slice the first 5 elements.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a 4x4 matrix using <code>np.arange(16).reshape((4,4))</code>. Print it.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> From the 4x4 matrix, extract the 2x2 square in the top-right corner. Print it.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Demonstrate the view trap: extract the first row, change its first element to <code>999</code>, and print the original matrix to see it changed.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Extract the second column from the matrix as a 1D array using <code>matrix[:, 1]</code>.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Boolean Masking : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Filtering Data</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <b>Boolean Masking</b> is how we filter arrays. When you apply a condition to an array (e.g., <code>arr > 5</code>), it returns an array of Booleans (True/False). You can use this Boolean array inside the brackets to select only the True elements.
</div></div>
<pre class="nb-code-block"><code>mask = arr &gt; 5       # [False, True, ...]
filtered = arr[mask] # Keeps only the True values</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Outlier Removal</strong>: <code>clean_data = data[(data > -3) & (data < 3)]</code> to remove extreme z-scores</p>
<p>• <strong>Conditional Assignment</strong>: <code>arr[arr < 0] = 0</code> to instantly cap all negative numbers to zero</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>When combining conditions, you MUST use bitwise operators <code>&</code> (and) / <code>|</code> (or) instead of Python''s <code>and/or</code>. You MUST also wrap conditions in parentheses: <code>(arr > 2) & (arr < 8)</code>.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import numpy as np

arr = np.array([-2, 5, 10, -5, 8])

# 1. Create the boolean mask
mask = arr &gt; 0
print(f&quot;Boolean Mask: {mask}&quot;)

# 2. Apply the mask to filter
positives = arr[mask]
print(f&quot;Positives only: {positives}&quot;)

# 3. Combine conditions (Note the parentheses!)
in_range = arr[(arr &gt; 0) &amp; (arr &lt; 10)]
print(f&quot;Between 0 and 10: {in_range}&quot;)

# 4. Conditional Replacement
arr[arr &lt; 0] = 0
print(f&quot;Negatives zeroed: {arr}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Boolean Masking-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Boolean Masking</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>arr = np.array([10, 50, 30, 80, 20])</code>. Create a mask for values <code>> 40</code> and print the mask.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use the mask from Q1 to extract and print the values greater than 40.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use a combined mask <code>(arr > 20) & (arr < 60)</code> to filter the array. Print the result.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Try to use the Python <code>and</code> keyword instead of <code>&</code> for the combined mask. Catch the ValueError.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Replace all values in the array that are <code>< 30</code> with <code>-1</code> using a mask assignment. Print the updated array.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Broadcasting : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Shape Alignment</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <b>Broadcasting</b> is NumPy''s way of doing math between arrays of different shapes. If the shapes are compatible, NumPy ''stretches'' the smaller array to match the larger one without actually making copies in memory.
</div></div>
<table>
<thead><tr><th>Array A</th><th>Array B</th><th>Result</th><th>Works?</th></tr></thead><tbody>
<tr><td>(3, 3)</td><td>Scalar <code>5</code></td><td>(3, 3)</td><td>Yes (Scalar stretches)</td></tr>
<tr><td>(3, 3)</td><td>(3,)</td><td>(3, 3)</td><td>Yes (Row stretches down)</td></tr>
<tr><td>(3, 3)</td><td>(4,)</td><td>Error</td><td>No (Dimensions mismatch)</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Standardization</strong>: Subtracting the mean of each column from a large matrix: <code>matrix - means_array</code></p>
<p>• <strong>Color Adjustments</strong>: Multiplying an RGB image matrix (1080, 1920, 3) by a brightness vector (3,)</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Broadcasting starts checking dimensions from the <b>trailing (rightmost) edge</b>. They must be equal, or one of them must be 1. If not, you get a <code>ValueError: operands could not be broadcast together</code>.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import numpy as np

# Matrix (3x3)
matrix = np.ones((3, 3))
print(&quot;Original Matrix:\n&quot;, matrix)

# Scalar Broadcasting
print(&quot;\nAdd Scalar (5):\n&quot;, matrix + 5)

# Vector Broadcasting (1D array of shape 3, stretches down across rows)
vector = np.array([10, 20, 30])
print(&quot;\nAdd Vector [10, 20, 30]:\n&quot;, matrix + vector)

# Column Broadcasting (Requires reshaping vector to 3x1)
col_vector = vector.reshape((3, 1))
print(&quot;\nAdd Column Vector:\n&quot;, matrix + col_vector)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Broadcasting-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Broadcasting</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a <code>3x2</code> matrix of ones. Multiply it by the scalar <code>10</code>. Print the result.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a <code>3x3</code> matrix of zeros. Add a <code>1D</code> array <code>[1, 2, 3]</code> to it. Observe how it broadcasts across rows.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Reshape <code>[1, 2, 3]</code> into a column <code>(3, 1)</code>. Add it to the zeros matrix. Observe how it broadcasts across columns.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Try to add a <code>1D</code> array of length <code>4</code> to a <code>3x3</code> matrix. Catch the <code>ValueError</code> and print the error message.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Explain why <code>(4, 3)</code> broadcasts with <code>(3,)</code> but fails with <code>(4,)</code>. (Hint: Right-to-left dimension matching).</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Matrix Borders):</strong> Create a 5x5 array of zeros. Use slicing to set the outer border (first row, last row, first col, last col) to 1. Print the result.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Checkerboard):</strong> Create an 8x8 array of zeros. Use step slicing <code>[::2]</code> to create a checkerboard pattern of 1s and 0s (like a chess board).</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Outlier Capping):</strong> Create an array of 50 random numbers from a standard normal distribution (<code>np.random.randn</code>). Use boolean masking to cap any values > 2 to 2, and any values < -2 to -2. Print the min and max to verify.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Column Standardization):</strong> Create a 10x3 matrix of random integers. Calculate the mean of each column (<code>.mean(axis=0)</code>). Subtract this mean array from the matrix using broadcasting. The new matrix columns should have a mean of 0.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Distance Matrix):</strong> Create a 1D array <code>x = np.arange(5)</code>. Use broadcasting to create a 5x5 matrix where each element <code>M[i,j] = abs(x[i] - x[j])</code>. (Hint: reshape one <code>x</code> to column).</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-52">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>What is an array View in NumPy? How does it differ from a Copy?</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>How do you forcefully create a copy of a slice instead of a view?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Explain Boolean Masking. What type of array is generated as the mask?</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Why does NumPy require <code>&</code> and <code>|</code> instead of <code>and</code> and <code>or</code> for boolean arrays?</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Explain the broadcasting rules in NumPy. What does ''trailing dimensions'' mean?</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write code to add a 1D array of length 3 to the columns of a 4x3 matrix.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>How do you add a 1D array of length 4 to the rows of a 4x3 matrix? (Hint: <code>np.newaxis</code> or reshape).</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>What does <code>np.where(condition, x, y)</code> do? Write an example replacing negatives with 0.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>How do you select specific arbitrary rows from a matrix using a list of indices? (Fancy Indexing).</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Explain the difference between Slicing (<code>arr[1:3]</code>) and Fancy Indexing (<code>arr[[1,2]]</code>) in terms of Views vs Copies.</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a one-liner to reverse the rows of a 2D matrix.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>How do you find the unique elements and their counts in a NumPy array? (<code>np.unique</code>).</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write code to stack two 1D arrays horizontally and vertically (<code>np.hstack</code>, <code>np.vstack</code>).</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Explain the <code>axis</code> parameter. What does <code>.sum(axis=0)</code> do on a 2D matrix?</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a boolean mask to filter out all <code>np.nan</code> values from an array.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>How do you concatenate two 2D matrices along the column axis?</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Explain <code>np.argmax()</code> and <code>np.argmin()</code>. What do they return?</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write code to sort a 2D array by the values in its second column using <code>np.argsort()</code>.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>What is the difference between <code>arr.flatten()</code> and <code>arr.ravel()</code>? (View vs Copy).</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a broadcasting operation that computes the outer product of two vectors <code>[1,2,3]</code> and <code>[4,5,6]</code>.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>How do you use <code>np.clip()</code>? Compare it to using boolean mask assignments.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Explain how memory layout (C-order vs Fortran-order) affects NumPy performance.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write code to extract the diagonal elements of a matrix without using a loop.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>What is the <code>Ellipsis</code> (<code>...</code>) used for in NumPy slicing?</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>How does NumPy handle operations between arrays of different <code>dtype</code>s? (Type Promotion).</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 22 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Slices</td><td>Slices are Views! Modifying a slice alters the original data</td></tr>
<tr><td>2</td><td>Masks</td><td>Use <code>&</code> and `</td><td><code> with parentheses </code>(arr>1) & (arr<5)`</td></tr>
<tr><td>3</td><td>Broadcast</td><td>NumPy automatically stretches dimensions to align math operations</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can slice rows and columns from a 2D matrix.</p>
<p>• [ ] I can filter an array using a boolean condition.</p>
<p>• [ ] I understand how scalar broadcasting works.</p>
<p><strong>Next Up: Day 23 - Pandas: DataFrames & Real-World Data</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Slicing & Indexing : Navigating Matrices"}, {"anchor": "checks-Slicing-3", "title": "\ud83e\uddea Checks: Slicing"}, {"anchor": "sec-14", "title": "2. Boolean Masking : Filtering Data"}, {"anchor": "checks-Boolean Masking-16", "title": "\ud83e\uddea Checks: Boolean Masking"}, {"anchor": "sec-27", "title": "3. Broadcasting : Shape Alignment"}, {"anchor": "checks-Broadcasting-29", "title": "\ud83e\uddea Checks: Broadcasting"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day23', '🐼 Pandas Introduction', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Pandas is the industry standard for tabular data manipulation. It brings SQL-like power to Python in memory. Today we learn how to create DataFrames, load external files, perform Exploratory Data Analysis (EDA), and execute vectorized column math.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>DataFrames</td><td>Tables & Series</td></tr>
<tr><td>2</td><td>EDA</td><td><code>info()</code>, <code>describe()</code></td></tr>
<tr><td>3</td><td>Operations</td><td>Column math & renaming</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Pandas Series & DataFrames : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Data Structures</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <b>Pandas</b> is the ultimate tool for tabular data (like Excel/SQL in Python). It is built on top of NumPy. A <b>Series</b> is a 1D column with row labels (an index). A <b>DataFrame</b> is a 2D table composed of multiple Series that share the same index.
</div></div>
<pre class="nb-code-block"><code>import pandas as pd
# Creating a DataFrame from a dictionary
df = pd.DataFrame({&#x27;Name&#x27;: [&#x27;Alice&#x27;, &#x27;Bob&#x27;], &#x27;Age&#x27;: [25, 30]})</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>SQL Replacement</strong>: Pandas can perform JOINs, GROUP BYs, and aggregations directly in Python memory</p>
<p>• <strong>Data Cleaning</strong>: Pandas has hundreds of built-in methods to handle missing data and transform formats</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Looping over DataFrames</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>Never use a <code>for</code> loop to iterate over rows in a DataFrame</b> (e.g., `iterrows()`). It destroys Pandas'' vectorized performance. Always use column-level vectorized math or `.apply()`.
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">import pandas as pd

# Creating a Series (1D)
ages = pd.Series([25, 30, 35], name=&quot;Age&quot;)
print(f&quot;Series:\n{ages}\n&quot;)

# Creating a DataFrame (2D)
data = {
    &#x27;Name&#x27;: [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;],
    &#x27;Age&#x27;: [25, 30, 35],
    &#x27;City&#x27;: [&#x27;NY&#x27;, &#x27;LA&#x27;, &#x27;CHI&#x27;]
}
df = pd.DataFrame(data)
print(&quot;DataFrame:&quot;)
print(df)

# Selecting a single column returns a Series
print(f&quot;\nType of df[&#x27;Name&#x27;]: {type(df[&#x27;Name&#x27;])}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-DataFrames-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>DataFrames</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import <code>pandas as pd</code>. Create a Series from <code>[10, 20, 30]</code> and print it. Notice the index column.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a DataFrame from a dictionary of lists: <code>{"Product": ["A", "B"], "Price": [10.5, 20.0]}</code>. Print it.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create a DataFrame from a list of dictionaries (JSON style): <code>[{"A": 1, "B": 2}, {"A": 3, "B": 4}]</code>. Print it.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Extract the <code>"Price"</code> column from the Q2 DataFrame and print its <code>type()</code>. It should be a Series.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Print the <code>df.index</code> and <code>df.columns</code> attributes of your DataFrame.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Reading & Exploring Data : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">I/O and EDA</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>In the real world, you don''t create DataFrames by hand; you read them from CSVs, SQL, or JSON. Once loaded, you use <b>Exploratory Data Analysis (EDA)</b> methods to understand the shape, data types, and missing values in your dataset.</p>
<table>
<thead><tr><th>Method</th><th>Purpose</th></tr></thead><tbody>
<tr><td><code>pd.read_csv()</code></td><td>Load data from a CSV file</td></tr>
<tr><td><code>df.head(n)</code></td><td>View the first n rows (default 5)</td></tr>
<tr><td><code>df.info()</code></td><td>Check column types and missing (Null) values</td></tr>
<tr><td><code>df.describe()</code></td><td>Summary statistics (mean, min, max) for numeric columns</td></tr>
<tr><td><code>df.shape</code></td><td>Tuple of (rows, columns)</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Initial Audit</strong>: <code>df.info()</code> is always the first command you run to see if your numeric columns accidentally loaded as strings</p>
<p>• <strong>Data Distribution</strong>: <code>df.describe()</code> instantly shows if you have massive outliers in your data</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If you have a very wide DataFrame, <code>df.head()</code> will truncate columns. You can fix this by running <code>pd.set_option(''display.max_columns'', None)</code>.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import pandas as pd
import numpy as np

# Creating fake data to simulate a file load
df = pd.DataFrame({
    &#x27;ID&#x27;: range(1, 1001),
    &#x27;Revenue&#x27;: np.random.normal(100, 20, 1000),  # Bell curve around 100
    &#x27;Status&#x27;: [&#x27;Active&#x27;, &#x27;Churned&#x27;] * 500
})

# 1. Look at the top rows
print(&quot;df.head(3):\n&quot;, df.head(3))

# 2. Check the dimensions
print(&quot;\nShape:&quot;, df.shape)

# 3. Check for missing data and types
print(&quot;\nInfo:&quot;)
df.info()

# 4. Get statistical summary
print(&quot;\nDescribe:\n&quot;, df.describe())</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Exploring Data-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Exploring Data</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write the theoretical command to read a file named <code>"sales_data.csv"</code> into a DataFrame <code>df</code>.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a random DataFrame with 20 rows. Print <code>df.head()</code> and <code>df.tail(3)</code>.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Run <code>df.info()</code> on your DataFrame. What information does the <code>Non-Null Count</code> column provide?</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Run <code>df.describe()</code>. What is the 50% row representing? (Hint: The Median).</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Extract the total number of rows from <code>df.shape</code> and print <code>"Total rows: [N]"</code>.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Basic Column Operations : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Vectorized Math</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Because Pandas is built on NumPy, you can perform math on entire columns instantly without looping. You can easily create new columns by calculating combinations of existing columns.</p>
<pre class="nb-code-block"><code># Creating a new column
df[&#x27;Profit&#x27;] = df[&#x27;Revenue&#x27;] - df[&#x27;Cost&#x27;]</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Feature Engineering</strong>: Creating a <code>Price_Per_Unit</code> column by dividing <code>Total_Price</code> by <code>Quantity</code></p>
<p>• <strong>Date Math</strong>: Calculating days since a purchase by subtracting <code>Purchase_Date</code> from <code>Today</code></p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>To drop a column, use <code>df.drop(columns=[''ColName''])</code>. Remember that Pandas methods usually return a NEW DataFrame. To save it, overwrite the variable: <code>df = df.drop(...)</code>.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import pandas as pd

df = pd.DataFrame({
    &#x27;Product&#x27;: [&#x27;Apple&#x27;, &#x27;Banana&#x27;, &#x27;Cherry&#x27;],
    &#x27;Price&#x27;: [1.20, 0.50, 3.00],
    &#x27;Quantity&#x27;: [100, 250, 50]
})

# Create a new column using vectorized math
df[&#x27;Total_Value&#x27;] = df[&#x27;Price&#x27;] * df[&#x27;Quantity&#x27;]
print(&quot;After math:\n&quot;, df)

# Drop a column
df_dropped = df.drop(columns=[&#x27;Quantity&#x27;])
print(&quot;\nAfter drop:\n&quot;, df_dropped)

# Math with scalars
df[&#x27;Discount_Price&#x27;] = df[&#x27;Price&#x27;] * 0.90
print(&quot;\nAfter 10% discount:\n&quot;, df)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Column Math-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Column Math</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>df</code> with <code>Cost</code> and <code>Revenue</code>, create a new column <code>Profit = Revenue - Cost</code>.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a column <code>Margin</code> which is <code>Profit / Revenue</code>. Print the DataFrame.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Drop the <code>Cost</code> column. Ensure you save the result back to <code>df</code> or a new variable.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Add <code>100</code> to every value in the <code>Revenue</code> column using <code>df["Revenue"] = df["Revenue"] + 100</code>.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Rename the column <code>"Revenue"</code> to <code>"Total_Sales"</code> using <code>df.rename(columns={"Old": "New"})</code>.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Dictionary to DF):</strong> Create a dictionary containing data for 5 employees (Name, Department, Salary). Convert it to a Pandas DataFrame. Print the DataFrame.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Summary Stats):</strong> Create a DataFrame with 1000 rows of random numbers (<code>np.random.rand(1000)</code>). Use <code>df.describe()</code> to find the mean and standard deviation. Print them.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Currency Conversion):</strong> Given a DataFrame with a <code>Price_USD</code> column, create a new column <code>Price_EUR</code> assuming an exchange rate of 0.85. Drop the original USD column.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Boolean Column):</strong> Given a DataFrame with a <code>Score</code> column (0-100), create a new boolean column <code>Passed</code> which is True if Score >= 60, and False otherwise.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (CSV Simulation):</strong> Use <code>pathlib</code> to write a small CSV string to <code>data.csv</code>. Then use <code>pd.read_csv(''data.csv'')</code> to load it into a DataFrame and print <code>df.head()</code>.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-52">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>What is the difference between a Pandas Series and a Pandas DataFrame?</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Why is Pandas built on top of NumPy? What benefits does it provide?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Explain why iterating over a DataFrame with <code>iterrows()</code> is considered an anti-pattern.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>What does <code>df.info()</code> show that <code>df.describe()</code> does not?</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>How do you read an Excel file in Pandas? What dependency is required? (<code>openpyxl</code>).</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>What is the <code>inplace=True</code> argument? Why is the Pandas team discouraging its use in newer versions?</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>How do you change the data type of a column from string to integer? (<code>astype</code>).</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write code to rename multiple columns in a DataFrame using a dictionary.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>What happens if you try to add a new column using dot notation <code>df.NewCol = 10</code> instead of bracket notation <code>df[''NewCol''] = 10</code>?</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>How do you write a DataFrame back to a CSV file without including the index column? (<code>index=False</code>).</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Explain the difference between <code>df[''A'']</code> and <code>df[[''A'']]</code> in terms of the object type returned.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>How do you sample a random 10% of your DataFrame? (<code>df.sample(frac=0.1)</code>).</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>What is the Pandas Index? How is it different from a regular column?</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>How do you set a specific column to be the index of the DataFrame? (<code>set_index</code>).</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write code to drop multiple columns at once.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>How do you check memory usage of a DataFrame? (<code>df.info(memory_usage=''deep'')</code>).</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Explain how Pandas handles missing data natively. What object represents a missing number?</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a vectorized operation that squares the values in Column A and adds them to Column B.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>How do you read data from a SQL database directly into a Pandas DataFrame? (<code>read_sql</code>).</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>What is a categorical data type in Pandas, and when should you use it to save memory?</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>How do you apply a custom Python function to an entire column? (<code>.apply()</code>).</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Explain the difference between <code>.map()</code> and <code>.apply()</code> on a Series.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>How do you read a JSON file into Pandas where the records are nested deeply?</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write code to extract all the column names of a DataFrame into a Python list.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>What is <code>pd.to_datetime()</code> used for?</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 23 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Structures</td><td>DataFrames are collections of Series sharing an index</td></tr>
<tr><td>2</td><td>I/O</td><td>Use <code>pd.read_csv()</code> to load data, <code>df.info()</code> to check it</td></tr>
<tr><td>3</td><td>Math</td><td><code>df[''New''] = df[''A''] + df[''B'']</code> calculates row-by-row instantly</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can create a DataFrame from a dictionary.</p>
<p>• [ ] I can check data types and nulls using <code>df.info()</code>.</p>
<p>• [ ] I can create new calculated columns.</p>
<p><strong>Next Up: Day 24 - Pandas Selection: Loc, Iloc, and Filtering</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Pandas Series & DataFrames : Data Structures"}, {"anchor": "checks-DataFrames-3", "title": "\ud83e\uddea Checks: DataFrames"}, {"anchor": "sec-14", "title": "2. Reading & Exploring Data : I/O and EDA"}, {"anchor": "checks-Exploring Data-16", "title": "\ud83e\uddea Checks: Exploring Data"}, {"anchor": "sec-27", "title": "3. Basic Column Operations : Vectorized Math"}, {"anchor": "checks-Column Math-29", "title": "\ud83e\uddea Checks: Column Math"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day24', '🎯 Pandas Selection', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Knowing how to navigate tables is the most heavily tested skill in Data Analyst interviews. Today we master precise row/column extraction using <code>.loc</code> and <code>.iloc</code>, SQL-style filtering using Boolean Masks and <code>.query()</code>, and leaderboard generation via sorting.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Loc/Iloc</td><td>Exact Indexing</td></tr>
<tr><td>2</td><td>Masking/Query</td><td>Conditional Filtering</td></tr>
<tr><td>3</td><td>Sorting</td><td><code>sort_values</code>, <code>nlargest</code></td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Loc and Iloc : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Row and Column Selection</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Selecting data in Pandas requires precision. <b><code>.iloc[]</code></b> selects by integer position (like standard Python lists). <b><code>.loc[]</code></b> selects by index label and column name. Both follow the format <code>[rows, columns]</code>.</p>
<table>
<thead><tr><th>Accessor</th><th>Paradigm</th><th>Example</th><th>Meaning</th></tr></thead><tbody>
<tr><td><code>.iloc</code></td><td>Integer Position</td><td><code>df.iloc[0:5, 0:2]</code></td><td>First 5 rows, first 2 columns</td></tr>
<tr><td><code>.loc</code></td><td>Label / Name</td><td><code>df.loc[:, ''Age'':''City'']</code></td><td>All rows, columns from Age to City</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Feature Selection</strong>: Extracting the target variable <code>Y = df[''Price'']</code> and the features <code>X = df.iloc[:, :-1]</code> for Machine Learning</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Inclusive Loc</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>A major ''gotcha'': Slicing with <code>.iloc[0:5]</code> is EXCLUSIVE of 5 (returns 0,1,2,3,4). But slicing with <code>.loc[''A'':''C'']</code> is INCLUSIVE of ''C'' (returns A,B,C).</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">import pandas as pd

df = pd.DataFrame({
    &#x27;Name&#x27;: [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;, &#x27;David&#x27;],
    &#x27;Age&#x27;: [25, 30, 35, 40],
    &#x27;Salary&#x27;: [50000, 60000, 70000, 80000]
}, index=[&#x27;ID1&#x27;, &#x27;ID2&#x27;, &#x27;ID3&#x27;, &#x27;ID4&#x27;])

# iloc: Integer position (Row 1, all columns)
print(&quot;iloc (Position):\n&quot;, df.iloc[1, :])

# loc: Label based (Row &#x27;ID2&#x27;, specific columns)
print(&quot;\nloc (Label):\n&quot;, df.loc[&#x27;ID2&#x27;, [&#x27;Name&#x27;, &#x27;Salary&#x27;]])

# Slicing with loc (Inclusive!)
print(&quot;\nloc Slicing:\n&quot;, df.loc[&#x27;ID1&#x27;:&#x27;ID3&#x27;, &#x27;Age&#x27;:])</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Loc / Iloc-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Loc / Iloc</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>df</code>, use <code>.iloc</code> to select the first 3 rows and the first 2 columns.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>.loc</code> to select all rows (<code>:</code>), but only the <code>"Name"</code> and <code>"Salary"</code> columns.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> What happens if you try <code>df.iloc[0, "Name"]</code>? Catch the <code>TypeError</code> (iloc requires integers).</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>.loc</code> to slice rows from <code>"ID2"</code> to <code>"ID4"</code> inclusive. Print the result.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Extract the single scalar value in row 0, column 1 using <code>.iloc[0, 1]</code>. Print it.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Boolean Filtering : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Querying Data</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>You can filter DataFrames exactly like NumPy arrays using Boolean Masks. Create a condition, and pass it into the DataFrame brackets: <code>df[condition]</code>. Pandas also provides the highly readable <code>.query()</code> method for SQL-like string queries.</p>
<pre class="nb-code-block"><code># Standard Masking
rich_users = df[df[&#x27;Salary&#x27;] &gt; 75000]

# Multiple conditions (Requires parenthesis and bitwise &amp;)
targets = df[(df[&#x27;Age&#x27;] &gt; 30) &amp; (df[&#x27;City&#x27;] == &#x27;NY&#x27;)]

# The elegant .query() alternative
targets = df.query(&quot;Age &gt; 30 and City == &#x27;NY&#x27;&quot;)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Cohort Extraction</strong>: Filtering a massive dataset down to only active users from a specific country</p>
<p>• <strong>Date Filtering</strong>: <code>df[df[''Date''] >= ''2024-01-01'']</code> to extract year-to-date performance</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>When using <code>.query()</code>, you can refer to external Python variables by prefixing them with an <code>@</code> symbol: <code>df.query(''Age > @min_age'')</code>.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import pandas as pd

df = pd.DataFrame({
    &#x27;Name&#x27;: [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;, &#x27;David&#x27;],
    &#x27;Age&#x27;: [25, 30, 35, 40],
    &#x27;Dept&#x27;: [&#x27;HR&#x27;, &#x27;IT&#x27;, &#x27;IT&#x27;, &#x27;Sales&#x27;]
})

# Boolean Mask Filtering
it_staff = df[df[&#x27;Dept&#x27;] == &#x27;IT&#x27;]
print(&quot;Mask Filtering:\n&quot;, it_staff)

# .isin() for multiple values
hr_or_sales = df[df[&#x27;Dept&#x27;].isin([&#x27;HR&#x27;, &#x27;Sales&#x27;])]
print(&quot;\n.isin() Filtering:\n&quot;, hr_or_sales)

# Query syntax (Very readable)
senior_it = df.query(&quot;Dept == &#x27;IT&#x27; and Age &gt;= 35&quot;)
print(&quot;\n.query() Filtering:\n&quot;, senior_it)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Filtering-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Filtering</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a mask for <code>Age >= 30</code>. Use it to filter <code>df</code> and print the result.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Filter <code>df</code> for people who are in <code>"IT"</code> OR (<code>|</code>) <code>"Sales"</code>. (Remember parentheses around conditions).</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use the <code>.isin()</code> method to achieve the exact same result as Q2. Print it.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use the <code>.query()</code> method to find rows where <code>Age < 40</code> and <code>Dept == "HR"</code>. Print the result.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Filter the DataFrame to keep rows where the Name starts with "A" using <code>df[df["Name"].str.startswith("A")]</code>.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Sorting and Ranking : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Ordering Data</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Once data is filtered, we often need to sort it to find the top/bottom performers using <code>.sort_values()</code>. You can sort by multiple columns and specify ascending/descending order.</p>
<table>
<thead><tr><th>Method</th><th>Purpose</th><th>Example</th></tr></thead><tbody>
<tr><td><code>sort_values(by=)</code></td><td>Sort rows</td><td><code>df.sort_values(by=''Age'', ascending=False)</code></td></tr>
<tr><td><code>nlargest(n, col)</code></td><td>Top N rows</td><td><code>df.nlargest(5, ''Salary'')</code> (Faster than sorting!)</td></tr>
<tr><td><code>rank()</code></td><td>Assign ranks</td><td><code>df[''Salary''].rank(ascending=False)</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Leaderboards</strong>: Finding the top 10 highest revenue generating products</p>
<p>• <strong>Time Series</strong>: Ensuring financial data is strictly sorted chronologically before calculating moving averages</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If you just need the top 5 values, <code>df.nlargest(5, ''Col'')</code> is computationally faster than sorting the entire million-row DataFrame and calling <code>.head(5)</code>.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import pandas as pd

df = pd.DataFrame({
    &#x27;Name&#x27;: [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;, &#x27;David&#x27;],
    &#x27;Score&#x27;: [85, 92, 85, 95],
    &#x27;Time&#x27;: [120, 110, 105, 130]
})

# Sort by single column (Descending)
print(&quot;Highest Scores:\n&quot;, df.sort_values(by=&#x27;Score&#x27;, ascending=False))

# Sort by multiple columns (Score desc, then Time asc to break ties)
tie_breaker = df.sort_values(by=[&#x27;Score&#x27;, &#x27;Time&#x27;], ascending=[False, True])
print(&quot;\nMulti-sort (Tiebreaker):\n&quot;, tie_breaker)

# Find top 2 using nlargest
print(&quot;\nTop 2 Scores:\n&quot;, df.nlargest(2, &#x27;Score&#x27;))</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Sorting-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Sorting</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Sort <code>df</code> by <code>"Time"</code> in ascending order (fastest to slowest). Print the result.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Sort <code>df</code> by <code>"Name"</code> alphabetically. Print it.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>.nsmallest(2, "Time")</code> to find the two fastest times. Print the result.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a new column <code>"Rank"</code> using <code>df["Score"].rank(ascending=False, method="min")</code>. Print <code>df</code>.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Sort the DataFrame by the index (if it was scrambled) using <code>df.sort_index()</code>. Print it.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Matrix Extraction):</strong> Create a 5x5 DataFrame of random numbers. Use <code>.iloc</code> to extract a 3x3 subset from the very middle of the DataFrame.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Cohort Filter):</strong> Create a DataFrame of 10 users with <code>Age</code> and <code>Country</code>. Filter for users <code>Age > 18</code> AND <code>Country == ''USA''</code>. Extract only their <code>Name</code> column using <code>.loc[mask, ''Name'']</code>.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Dynamic Query):</strong> Create a variable <code>min_salary = 60000</code>. Use <code>df.query("Salary > @min_salary")</code> to filter a DataFrame of employees. Print the result.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Top Performers):</strong> Create a DataFrame of 100 random student scores. Find the top 5 scores using <code>.nlargest()</code>. Then sort the whole DataFrame and use <code>.head(5)</code>. Verify they match.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Text Filtering):</strong> Create a DataFrame of product names. Filter the DataFrame to only keep rows where the product name contains the word ''Pro'' using <code>df[''Product''].str.contains(''Pro'')</code>.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-52">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>What is the difference between <code>.loc</code> and <code>.iloc</code>?</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Explain why <code>.iloc[0:2]</code> returns 2 rows, but <code>.loc[0:2]</code> might return 3 rows (if the index is integers).</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>How do you filter a DataFrame based on values in a list? (Hint: <code>.isin()</code>).</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a boolean mask to filter out rows where a specific column contains <code>NaN</code>. (Hint: <code>.notna()</code>).</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>What is the <code>.query()</code> method and why might you choose it over standard boolean masking?</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>How do you reference external variables inside a <code>.query()</code> string?</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Explain what <code>SettingWithCopyWarning</code> is. How do you prevent it using <code>.copy()</code>?</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write code to sort a DataFrame by Column A descending, and then Column B ascending.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>What is the difference between <code>sort_values</code> and <code>sort_index</code>?</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Why is <code>nlargest(5, ''A'')</code> generally preferred over <code>sort_values(''A'').head(5)</code>?</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>How do you select a single scalar value from a DataFrame extremely fast? (Hint: <code>.at</code> and <code>.iat</code>).</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write code to filter a DataFrame using a regular expression on a string column. (<code>.str.contains(regex=True)</code>).</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>How do you select columns based on their data type? (<code>df.select_dtypes(include=''number'')</code>).</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Explain how the <code>~</code> operator is used in Pandas boolean masking.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write code to invert a boolean mask.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>How do you update the values of a column only for specific rows using <code>.loc</code>?</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>What happens if you assign a list of values to a new column, but the list length doesn''t match the DataFrame length?</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Explain the <code>rank()</code> method. How does it handle tied values by default?</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>How do you filter a DataFrame based on the length of a string in a column? (<code>df[''Col''].str.len() > 5</code>).</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write code to drop all rows where ANY column has a missing value.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>How do you reset the index of a DataFrame after filtering it? Why is <code>drop=True</code> important?</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Explain how boolean masking leverages NumPy''s vectorized operations under the hood.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>What is a <code>MultiIndex</code> (Hierarchical Index)? How do you select data from it using <code>.loc</code>?</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write code to select every alternate row in a DataFrame using <code>.iloc</code> and step slicing.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>How do you randomly shuffle the rows of a DataFrame using <code>.sample()</code>?</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 24 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>loc/iloc</td><td><code>iloc</code> is integer position (exclusive end). <code>loc</code> is label name (inclusive end).</td></tr>
<tr><td>2</td><td>Masking</td><td><code>df[df[''A''] > 5]</code> filters rows. Combine with <code>&</code> and `</td><td>`.</td></tr>
<tr><td>3</td><td>Query</td><td><code>df.query("A > 5")</code> is highly readable for complex logic.</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can extract rows and columns using <code>.loc</code> and <code>.iloc</code>.</p>
<p>• [ ] I can filter a DataFrame using multiple conditions.</p>
<p>• [ ] I can sort data and find the top N records.</p>
<p><strong>Next Up: Day 25 - Pandas Data Cleaning & Missing Values</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Loc and Iloc : Row and Column Selection"}, {"anchor": "checks-Loc / Iloc-3", "title": "\ud83e\uddea Checks: Loc / Iloc"}, {"anchor": "sec-14", "title": "2. Boolean Filtering : Querying Data"}, {"anchor": "checks-Filtering-16", "title": "\ud83e\uddea Checks: Filtering"}, {"anchor": "sec-27", "title": "3. Sorting and Ranking : Ordering Data"}, {"anchor": "checks-Sorting-29", "title": "\ud83e\uddea Checks: Sorting"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day25', '🧹 Pandas Cleaning', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Data Analysts spend 80% of their time cleaning data. Missing values crash algorithms. Duplicates ruin financial aggregations. Strings masquerading as numbers prevent math. Today we master the unglamorous but critical art of Data Cleaning.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Missing Data</td><td><code>isna()</code>, <code>fillna()</code></td></tr>
<tr><td>2</td><td>Duplicates</td><td><code>drop_duplicates()</code></td></tr>
<tr><td>3</td><td>Types</td><td><code>astype()</code>, <code>.str</code> accessor</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Handling Missing Data : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">The Reality of Data</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Real-world data is messy. <b>Missing values</b> are represented as <code>NaN</code> (Not a Number) or <code>None</code>. Pandas provides methods to detect (<code>isna()</code>), remove (<code>dropna()</code>), or replace (<code>fillna()</code>) these missing values.</p>
<table>
<thead><tr><th>Method</th><th>Action</th><th>Common Use</th></tr></thead><tbody>
<tr><td><code>df.isna()</code></td><td>Returns Boolean DF</td><td>Identifying where data is missing</td></tr>
<tr><td><code>df.dropna()</code></td><td>Drops rows/cols</td><td>Removing rows where critical data is null</td></tr>
<tr><td><code>df.fillna(val)</code></td><td>Replaces NaNs</td><td>Replacing missing ages with the median age</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data Quality</strong>: Machine Learning models will crash if you feed them <code>NaN</code> values. You must handle them first!</p>
<p>• <strong>Imputation</strong>: Filling missing salaries with the average salary of the employee''s department</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Blindly Dropping</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Never run <code>df.dropna()</code> without thinking. If 30% of your data has a missing ''Phone Number'', dropping those rows destroys 30% of your valid ''Email'' and ''Name'' data. Drop the column, or fill it with ''Unknown''.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">import pandas as pd
import numpy as np

df = pd.DataFrame({
    &#x27;Name&#x27;: [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;, &#x27;David&#x27;],
    &#x27;Age&#x27;: [25, np.nan, 35, 40],
    &#x27;Salary&#x27;: [50000, 60000, np.nan, 80000]
})

print(&quot;Original:\n&quot;, df)

# 1. Count missing values per column
print(&quot;\nMissing Counts:\n&quot;, df.isna().sum())

# 2. Drop rows with ANY missing data
print(&quot;\nDropped Rows:\n&quot;, df.dropna())

# 3. Fill missing Age with Mean, Salary with 0
clean_df = df.fillna({&#x27;Age&#x27;: df[&#x27;Age&#x27;].mean(), &#x27;Salary&#x27;: 0})
print(&quot;\nFilled NaNs:\n&quot;, clean_df)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Missing Data-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Missing Data</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Run <code>df.isna().sum()</code> on your DataFrame to see which columns have missing values.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>df.dropna(subset=["Age"])</code> to drop ONLY rows where <code>"Age"</code> is missing. Print it.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Fill all <code>NaN</code> values in the entire DataFrame with <code>"Unknown"</code> using <code>df.fillna("Unknown")</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Fill the <code>"Salary"</code> column with the median salary of that column using <code>df["Salary"].fillna(...)</code>.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>df.ffill()</code> (forward fill) on a Series with a missing value. What does it do?</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Handling Duplicates : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Deduplication</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Duplicate rows can skew aggregations and ruin analysis. <code>df.duplicated()</code> returns a boolean mask of duplicate rows, and <code>df.drop_duplicates()</code> removes them. You can specify whether to keep the ''first'' occurrence, the ''last'', or False (drop all duplicates completely).</p>
<pre class="nb-code-block"><code># Keep only the first occurrence of a User_ID
df.drop_duplicates(subset=[&#x27;User_ID&#x27;], keep=&#x27;first&#x27;)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>ETL Pipelines</strong>: When pulling data daily, you might accidentally pull the same transactions twice. Deduplication fixes this</p>
<p>• <strong>Latest Records</strong>: Sorting by ''Update_Date'' and keeping the ''last'' duplicate ensures you only have the most recent data for each user</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Always sort your DataFrame BEFORE dropping duplicates if you want to keep the highest/lowest/newest value. E.g., Sort by <code>Date</code> ascending, then <code>drop_duplicates(keep=''last'')</code>.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import pandas as pd

df = pd.DataFrame({
    &#x27;ID&#x27;: [1, 2, 2, 3, 1],
    &#x27;Name&#x27;: [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;, &#x27;Alice&#x27;],
    &#x27;Update_Day&#x27;: [1, 1, 2, 1, 3]
})

print(&quot;Original with duplicates:\n&quot;, df)

# Drop exact identical rows (None match exactly here because Update_Day differs)
print(&quot;\nExact Duplicates:\n&quot;, df.drop_duplicates())

# Drop based on ID, keeping the latest Update_Day
# 1. Sort by Day
df_sorted = df.sort_values(by=&#x27;Update_Day&#x27;)
# 2. Drop duplicates based on ID, keeping the LAST one
latest_df = df_sorted.drop_duplicates(subset=[&#x27;ID&#x27;], keep=&#x27;last&#x27;)
print(&quot;\nLatest Unique Users:\n&quot;, latest_df.sort_index())</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Duplicates-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Duplicates</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a DataFrame with 3 identical rows. Run <code>df.duplicated()</code> to see the boolean mask.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Run <code>df.drop_duplicates()</code> on the DataFrame from Q1 to clean it.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Given a DF with <code>ID</code> and <code>Score</code>, sort by <code>Score</code> descending, then drop duplicates on <code>ID</code> keeping the first.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> What happens if you use <code>keep=False</code> in <code>drop_duplicates()</code>? Try it.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Count the number of duplicate <code>ID</code>s by chaining <code>df.duplicated(subset=["ID"]).sum()</code>.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Data Type Conversion : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Fixing Bad Formatting</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>When reading from CSVs, numbers might be loaded as strings (e.g., <code>''1,000''</code>). You cannot perform math on strings! The <code>.astype()</code> method converts columns to proper types. For strings requiring cleaning, the <code>.str</code> accessor is your best friend.</p>
<table>
<thead><tr><th>Method</th><th>Action</th><th>Example</th></tr></thead><tbody>
<tr><td><code>astype(type)</code></td><td>Cast to type</td><td><code>df[''Age''].astype(int)</code></td></tr>
<tr><td><code>pd.to_numeric()</code></td><td>Safe casting</td><td><code>pd.to_numeric(df[''Price''], errors=''coerce'')</code></td></tr>
<tr><td><code>.str.replace()</code></td><td>String cleanup</td><td><code>df[''Price''].str.replace(''$'', '''')</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Currency Parsing</strong>: Converting <code>''$1,200.50''</code> into the float <code>1200.50</code> so you can sum it</p>
<p>• <strong>Memory Optimization</strong>: Downcasting an <code>int64</code> column to <code>int8</code> to save 8x the RAM on a billion rows</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If <code>.astype(float)</code> fails because of a weird string like ''N/A'', use <code>pd.to_numeric(col, errors=''coerce'')</code>. It will force the bad strings into <code>NaN</code> so you can proceed!</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import pandas as pd

df = pd.DataFrame({
    &#x27;Item&#x27;: [&#x27;A&#x27;, &#x27;B&#x27;, &#x27;C&#x27;],
    &#x27;Price&#x27;: [&#x27;$10&#x27;, &#x27;$20&#x27;, &#x27;Error&#x27;]
})
print(&quot;Original types:\n&quot;, df.dtypes)

# 1. Clean the string (Remove $)
df[&#x27;Clean_Price&#x27;] = df[&#x27;Price&#x27;].str.replace(&#x27;$&#x27;, &#x27;&#x27;, regex=False)

# 2. Convert to numeric safely (Forces &#x27;Error&#x27; to NaN)
df[&#x27;Float_Price&#x27;] = pd.to_numeric(df[&#x27;Clean_Price&#x27;], errors=&#x27;coerce&#x27;)

print(&quot;\nCleaned DataFrame:\n&quot;, df)
print(&quot;\nNew types:\n&quot;, df.dtypes)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Data Types-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Data Types</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>df["Age"] = ["25", "30"]</code> (strings), cast it to integer using <code>.astype(int)</code>.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>df["Cost"] = ["1,000", "2,500"]</code>, remove the comma using <code>.str.replace(",", "")</code>.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Cast the cleaned <code>Cost</code> column to float.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>pd.to_numeric(..., errors="coerce")</code> on <code>["10", "bad", "20"]</code>. Print the result.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Check the memory usage of a column using <code>df["Col"].memory_usage()</code>. Cast it to <code>float32</code> and check again.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (The Complete Pipeline):</strong> Create a dirty DataFrame: <code>{''ID'': [1,2,2,3], ''Price'': [''$10'', ''$20'', ''$20'', ''NaN''], ''Qty'': [1,2,np.nan,3]}</code>. Write a 4-step pipeline: 1) Drop exact duplicates. 2) Clean Price ''$'' and cast to float. 3) Fill missing Qty with 1. 4) Calculate Total = Price * Qty.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Threshold Dropping):</strong> Create a DF with 5 rows and 3 columns of NaNs/data. Use <code>df.dropna(thresh=2)</code> to drop rows that do not have AT LEAST 2 valid non-NaN values. Print it.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Categorical Conversion):</strong> Given a column <code>df[''Size''] = [''S'', ''M'', ''L'', ''S'', ''M'']</code> with 100,000 rows. Convert its type to ''category'' using <code>.astype(''category'')</code>. Check <code>df.info()</code> to see memory savings.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (String Extraction):</strong> Given <code>df[''Code''] = [''Item-123'', ''Item-456'']</code>. Use <code>.str.split(''-'').str[1]</code> to extract just the numbers. Cast them to integers.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Interpolation):</strong> Given a Time Series <code>df[''Temp''] = [20, np.nan, np.nan, 26]</code>. Use <code>df[''Temp''].interpolate()</code> to fill the missing values with a linear progression. Print it.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-52">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Explain the difference between <code>NaN</code>, <code>None</code>, and <code>NaT</code> in Pandas.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>What does the <code>errors=''coerce''</code> argument do in <code>pd.to_numeric()</code>?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>How do you drop columns that contain MORE than 50% missing values?</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Explain the <code>thresh</code> parameter in <code>df.dropna()</code>.</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Why might filling missing values with the Mean be a bad idea for highly skewed data?</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write code to fill missing values in column ''A'' with the median of column ''A''.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>How do you perform a Forward Fill (<code>ffill</code>)? In what scenario (e.g., time series) is it useful?</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>What is the difference between <code>df.drop_duplicates()</code> and <code>df.duplicated()</code>?</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write code to find the number of exact duplicate rows in a DataFrame.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>How do you keep the LAST occurrence of a duplicate based on a specific subset of columns?</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Explain how converting a string column with low cardinality to <code>category</code> saves memory.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write code to remove all whitespace from the beginning and end of a string column using <code>.str.strip()</code>.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>How do you extract a substring from a column using a regular expression in Pandas? (<code>.str.extract()</code>).</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>What happens if you use <code>.astype(int)</code> on a column that contains <code>NaN</code> values? (Hint: It fails).</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Explain the <code>Int64</code> (capital I) nullable integer data type introduced in newer Pandas versions.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write code to replace all negative values in a DataFrame with <code>NaN</code> using <code>df.where()</code> or <code>np.where()</code>.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>How do you rename the index of a DataFrame?</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>What is Data Imputation? Name two advanced methods beyond simple mean/median filling (e.g., KNN, Regression).</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write code to convert a column containing ''Yes''/''No'' strings into boolean <code>True</code>/<code>False</code>.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>How do you parse a column of dates in the format ''YYYY/MM/DD'' into Pandas datetime objects?</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Explain the <code>inplace=True</code> argument. Why is it generally avoided by Pandas core devs?</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write code to calculate the percentage of missing values in every column of a DataFrame.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>How do you apply a custom data-cleaning function to every element in a single column?</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Explain the difference between <code>.map()</code>, <code>.apply()</code>, and <code>.applymap()</code> in Pandas.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>What is the performance implication of using <code>.str</code> accessors on a column of 10 million rows?</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 25 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>NaNs</td><td>Never drop NaNs blindly. Think about why they are missing.</td></tr>
<tr><td>2</td><td>Dedupe</td><td>Sort by date first to ensure you keep the latest record.</td></tr>
<tr><td>3</td><td>Casting</td><td>Use <code>pd.to_numeric(..., errors=''coerce'')</code> for messy strings.</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can find and fill missing values.</p>
<p>• [ ] I can drop duplicates while keeping the latest record.</p>
<p>• [ ] I can clean strings and cast them to floats.</p>
<p><strong>Next Up: Day 26 - Pandas GroupBy & Aggregations</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Handling Missing Data : The Reality of Data"}, {"anchor": "checks-Missing Data-3", "title": "\ud83e\uddea Checks: Missing Data"}, {"anchor": "sec-14", "title": "2. Handling Duplicates : Deduplication"}, {"anchor": "checks-Duplicates-16", "title": "\ud83e\uddea Checks: Duplicates"}, {"anchor": "sec-27", "title": "3. Data Type Conversion : Fixing Bad Formatting"}, {"anchor": "checks-Data Types-29", "title": "\ud83e\uddea Checks: Data Types"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb)
ON CONFLICT (day_id) DO UPDATE SET
  title = EXCLUDED.title,
  html_body = EXCLUDED.html_body,
  sections = EXCLUDED.sections,
  cells = EXCLUDED.cells;