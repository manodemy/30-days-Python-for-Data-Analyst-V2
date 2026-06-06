-- ═══════════════════════════════════════════════════════════════
-- Seed Notebook Content: Days 11 to 15
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.notebook_content (day_id, title, html_body, sections, cells)
VALUES
('day11', '📦 Modules', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>To build large-scale applications, you must master code organization. Today we learn how to modularize code into separate files, leverage Python''s powerful Standard Library, and isolate project dependencies using virtual environments. These are essential software engineering practices.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Modules</td><td><code>import</code>, code splitting</td></tr>
<tr><td>2</td><td>StdLib</td><td><code>os</code>, <code>json</code>, <code>collections</code></td></tr>
<tr><td>3</td><td>Venvs</td><td><code>pip</code>, isolation</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Modules & Packages : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Organizing Code</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A <b>module</b> is just a <code>.py</code> file containing Python code. A <b>package</b> is a directory of modules with an <code><strong>init</strong>.py</code> file. Instead of writing monolithic 5000-line scripts, we split code into logical modules and <code>import</code> them.</p>
<pre class="nb-code-block"><code># 1. Import whole module
import math
math.sqrt(16)

# 2. Import specific function
from math import sqrt
sqrt(16)

# 3. Import with alias
import pandas as pd</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Code Reuse</strong>: Import the same data-cleaning functions across multiple notebooks</p>
<p>• <strong>Namespace Management</strong>: <code>math.pi</code> and <code>numpy.pi</code> can coexist without overwriting each other</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Circular Imports</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If Module A imports Module B, and Module B imports Module A, Python will crash with an ImportError. Always structure code hierarchically to avoid circular dependencies.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Importing standard library module
import statistics as stats

data = [10, 20, 30, 40, 50]
print(f&#x27;Mean: {stats.mean(data)}&#x27;)
print(f&#x27;Median: {stats.median(data)}&#x27;)

# Importing specific items
from datetime import date, timedelta

today = date.today()
tomorrow = today + timedelta(days=1)
print(f&#x27;Tomorrow is: {tomorrow}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Modules-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Modules</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import the <code>random</code> module. Use <code>random.randint(1, 10)</code> to print a random number.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Import <code>math</code> using an alias <code>m</code>. Print the value of <code>m.pi</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Import ONLY the <code>choice</code> function from <code>random</code>. Use it to pick a random color from <code>["Red", "Blue", "Green"]</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Try to import a module that doesn''t exist (e.g., <code>import fake_module</code>). Catch the <code>ModuleNotFoundError</code> and print a friendly message.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Explain why <code>import pandas as pd</code> is preferred over <code>from pandas import *</code>.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. The Standard Library : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Batteries Included</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python''s philosophy is ''Batteries Included''. It comes with a massive standard library covering file systems, mathematics, network protocols, and data formats without needing <code>pip install</code>.</p>
<table>
<thead><tr><th>Module</th><th>Purpose</th><th>Example Use</th></tr></thead><tbody>
<tr><td><code>os</code> / <code>sys</code></td><td>Operating System</td><td>File paths, command-line args</td></tr>
<tr><td><code>json</code></td><td>Data Format</td><td>Parsing API responses</td></tr>
<tr><td><code>collections</code></td><td>Data Structures</td><td><code>Counter</code>, <code>defaultdict</code></td></tr>
<tr><td><code>datetime</code></td><td>Time & Dates</td><td>Timestamps, durations</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>No Dependencies</strong>: Code relies only on built-in tools, making it easy to deploy on servers</p>
<p>• <strong>Reliability</strong>: Standard library modules are heavily tested and rarely introduce breaking changes</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Before installing a third-party package for a simple task, check the standard library. For example, use <code>pathlib</code> for file paths instead of string manipulation.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import os
import sys
import collections

# os: File system information
cwd = os.getcwd()
print(f&#x27;Current Directory: {cwd}&#x27;)

# collections: Advanced data structures
text = &#x27;apple banana apple cherry apple&#x27;
word_counts = collections.Counter(text.split())
print(f&#x27;Top word: {word_counts.most_common(1)}&#x27;)

# sys: Python environment info
print(f&#x27;Python version: {sys.version.split()[0]}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Standard Lib-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Standard Lib</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import <code>json</code>. Parse <code>''{"name": "Alice"}''</code> into a dictionary using <code>json.loads()</code>. Print the dictionary.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Import <code>collections.defaultdict</code>. Create a dict that defaults to <code>0</code>. Increment a key <code>"x"</code> and print it.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Import <code>sys</code>. Print the list of command-line arguments using <code>sys.argv</code>.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Import <code>math</code>. Calculate the factorial of 5 using <code>math.factorial()</code>. Print it.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Import <code>time</code>. Use <code>time.sleep(1)</code> to pause execution for 1 second, then print "Done".</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Virtual Environments & pip : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Dependency Isolation</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Different projects need different versions of packages. A <b>Virtual Environment (venv)</b> is an isolated folder containing a specific Python interpreter and its own installed packages. <code>pip</code> is the package installer used to download libraries from PyPI (Python Package Index).</p>
<pre class="nb-code-block"><code># 1. Create a virtual environment
python -m venv myenv

# 2. Activate it (Windows)
myenv\Scripts\activate

# 3. Install a package
pip install requests==2.31.0

# 4. Save dependencies
pip freeze &gt; requirements.txt</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Reproducibility</strong>: Ensures your code runs on your coworker''s machine exactly as it does on yours</p>
<p>• <strong>Conflict Prevention</strong>: Project A uses Pandas 1.0, Project B uses Pandas 2.0 without crashing each other</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Global Installs</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Never use <code>pip install</code> globally on your machine (outside a venv). It will eventually corrupt your system Python installation.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13"># This is a conceptual demo.
# In a real script, you&#x27;d run these in the terminal.

print(&quot;Standard Workflow:&quot;)
print(&quot;1. Create:  python -m venv venv&quot;)
print(&quot;2. Enable:  venv\\Scripts\\activate&quot;)
print(&quot;3. Install: pip install pandas&quot;)
print(&quot;4. Freeze:  pip freeze &gt; requirements.txt&quot;)
print(&quot;5. Restore: pip install -r requirements.txt&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Pip & Venv-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Pip & Venv</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> What command creates a new virtual environment named <code>env</code>?</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> What command activates the environment on Windows? On Mac/Linux?</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write the command to install exactly version <code>1.5.3</code> of the <code>pandas</code> library.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Explain what <code>pip freeze > requirements.txt</code> does and why it is important for version control.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Why should you exclude the virtual environment folder (e.g., <code>venv/</code>) from GitHub using <code>.gitignore</code>?</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Math Operations):</strong> Create a file <code>my_math.py</code> with an <code>add</code> function. In your main cell, import it and use it. (Simulate this by writing both blocks).</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (JSON Config):</strong> Import <code>json</code>. Create a dictionary, save it to a file <code>config.json</code> using <code>json.dump()</code>, then read it back using <code>json.load()</code>.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Collections Counter):</strong> Write a function that takes a long string, removes punctuation, and uses <code>collections.Counter</code> to find the 3 most common words.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Datetime Math):</strong> Import <code>datetime</code>. Calculate how many days have passed since January 1st, 2000. Print the result.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Requirements):</strong> Write a Python script that reads a simulated <code>requirements.txt</code> file and prints out only the package names, stripping out the version numbers (<code>==X.Y.Z</code>).</p></div>
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
<h3>Write a Python script that creates a folder <code>mypack/</code> with an <code><strong>init</strong>.py</code> containing <code>version = ''1.0''</code>. Then import it and print <code>mypack.version</code>.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write code that imports <code>math</code> two ways: <code>import math</code> and <code>from math import <em></code>. Show how <code></em></code> can shadow a local variable named <code>pow</code> by printing <code>pow</code> before and after.</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write code that appends a custom directory to <code>sys.path</code> using <code>sys.path.insert(0, ''/custom'')</code>. Print <code>sys.path</code> to show the change.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a script that reads <code>sys.path</code> and prints each path entry on its own line, numbered 1 through N.</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a Python script that reads a <code>requirements.txt</code> string <code>''pandas==2.0.0\nnumpy==1.24.0''</code> and prints each package name and version as a formatted table.</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write code to parse <code>''pandas==2.0.0\nnumpy==1.24.0''</code> and extract just the package names <code>[''pandas'', ''numpy'']</code> into a list.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write code that creates a file called <code>math.py</code> with <code>print(''Custom math!'')</code>, then shows what happens when you try <code>import math</code>. Explain the shadowing.</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write code using <code>os.path.join(''data'', ''users'', ''file.csv'')</code> and compare it with manual string concatenation <code>''data'' + ''/'' + ''users''</code>. Print both results.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write code using <code>collections.defaultdict(list)</code> to group words by their first letter from <code>[''apple'', ''banana'', ''avocado'', ''blueberry'']</code>.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write code using <code>urllib.request.urlopen()</code> to fetch the HTML of <code>http://example.com</code> and print the first 200 characters.</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a module-like script with a function and an <code>if <strong>name</strong> == ''<strong>main</strong>'':</code> block. Show what runs when imported vs executed directly.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write the pip command to upgrade a package to the latest version. Then write Python code using <code>subprocess.run()</code> to execute that same command.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write code using <code>importlib.metadata.version(''pip'')</code> to print the installed version of pip.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a function using <code>datetime.strptime()</code> to convert <code>''2023-12-25''</code> into a datetime object. Print the day of the week.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write code that uses both <code>os.path.join()</code> and <code>pathlib.Path() / ''subdir'' / ''file.txt''</code> to build the same path. Print both.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write code using the <code>json</code> module: try to load a config file, catch <code>FileNotFoundError</code>, and return a default <code>{''debug'': False}</code> dict.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write code using <code>importlib.metadata.version(''pip'')</code> to print the installed version of pip programmatically.</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write the pip commands (as strings) to: install, uninstall, and reinstall all packages from a requirements file.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write code that uses <code>sys.exit(1)</code> to terminate a script if a required environment variable is missing. Use <code>os.environ.get()</code>.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write code that prints the absolute path of the <code>site-packages</code> directory using <code>import site; print(site.getsitepackages())</code>.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a function <code>parse_toml_deps(text)</code> that extracts dependency names from a TOML-style string like <code>''[dependencies]\npandas = "^2.0"\nnumpy = "^1.24"''</code>.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write code that imports a module, then modifies it, and uses <code>importlib.reload()</code> to reload the updated version. Demonstrate with print statements.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write code that measures the time taken to import <code>json</code> vs <code>pandas</code> using <code>time.perf_counter()</code>. Print both durations.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write code that checks if a package name exists on PyPI by trying to import it and catching <code>ModuleNotFoundError</code>.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a Python script using <code>os.walk()</code> to recursively list all <code>.py</code> files in the current directory. Print each file path.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 11 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Imports</td><td>Avoid circular and <code>*</code> imports</td></tr>
<tr><td>2</td><td>Library</td><td>Use built-ins before pip installing</td></tr>
<tr><td>3</td><td>Venvs</td><td>Never install globally. Always use requirements.txt</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can import specific functions from a module.</p>
<p>• [ ] I know how to use <code>os</code> and <code>collections</code>.</p>
<p>• [ ] I can create and activate a virtual environment.</p>
<p><strong>Next Up: Day 12 - Advanced Comprehensions</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Modules & Packages : Organizing Code"}, {"anchor": "checks-Modules-3", "title": "\ud83e\uddea Checks: Modules"}, {"anchor": "sec-14", "title": "2. The Standard Library : Batteries Included"}, {"anchor": "checks-Standard Lib-16", "title": "\ud83e\uddea Checks: Standard Lib"}, {"anchor": "sec-27", "title": "3. Virtual Environments & pip : Dependency Isolation"}, {"anchor": "checks-Pip & Venv-29", "title": "\ud83e\uddea Checks: Pip & Venv"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day12', '🧮 Comprehensions', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Comprehensions are the signature of Pythonic code. Today we move beyond simple lists to master nested data manipulation, ternary mappings, and O(1) dictionary generations. These techniques drastically reduce lines of code and improve execution speed in data processing pipelines.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Advanced Lists</td><td>Nested loops, Ternaries</td></tr>
<tr><td>2</td><td>Dicts & Sets</td><td><code>{}</code>, <code>k:v</code> mapping</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Advanced List Comprehensions : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Deep Dive</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>We''ve seen basic list comprehensions. Advanced comprehensions allow for <b>nested loops</b> and <b>if/else conditionals</b>. They are the fastest, most Pythonic way to filter and transform lists.</p>
<pre class="nb-code-block"><code># If/Else mapping (Ternary inside comprehension)
results = [&#x27;Pass&#x27; if x &gt;= 50 else &#x27;Fail&#x27; for x in scores]

# Nested Loops (Flattening a matrix)
flat = [item for row in matrix for item in row]</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data Cleaning</strong>: Instantly mapping raw values to standardized categories</p>
<p>• <strong>Matrix Flattening</strong>: Converting a list-of-lists (JSON structure) into a flat 1D list</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Readability Trap</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Never nest more than two loops in a comprehension. If it takes more than 5 seconds to read, convert it to standard <code>for</code> loops.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Nested loops in comprehensions
matrix = [[1, 2], [3, 4], [5, 6]]
flat = [num for row in matrix for num in row]
print(f&#x27;Flattened: {flat}&#x27;)

# Conditionals (Filtering vs Mapping)
# 1. Filtering (if at the end)
evens = [x for x in flat if x % 2 == 0]
print(f&#x27;Evens: {evens}&#x27;)

# 2. Mapping (if/else at the front)
labels = [&#x27;Even&#x27; if x % 2 == 0 else &#x27;Odd&#x27; for x in flat]
print(f&#x27;Labels: {labels}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Adv List Comp-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Adv List Comp</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>matrix = [[1,2,3], [4,5,6]]</code>, write a comprehension to flatten it into <code>[1,2,3,4,5,6]</code>. Print it.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use a comprehension with an if/else ternary to map <code>data = [-1, 2, -3, 4]</code> to <code>["Neg", "Pos", "Neg", "Pos"]</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Generate all Cartesian coordinates for <code>x</code> in <code>[0, 1]</code> and <code>y</code> in <code>[0, 1]</code> using a nested comprehension resulting in <code>[(0,0), (0,1), (1,0), (1,1)]</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Given <code>names = ["alice", "bob", ""]</code>, use a comprehension to capitalize valid names and drop empty strings.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Why is <code>[x if x > 0 for x in data]</code> invalid syntax? Explain the difference between filtering and mapping syntax.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Dict & Set Comprehensions : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Dynamic Hash Maps</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Just like lists, you can create <b>Dictionaries</b> and <b>Sets</b> using comprehensions. For dictionaries, use the <code>key: value</code> syntax inside curly braces <code>{}</code>. For sets, just use values inside curly braces.</p>
<pre class="nb-code-block"><code># Dict Comprehension (Reverse mapping)
lookup = {value: key for key, value in original.items()}

# Set Comprehension (Unique lengths)
lengths = {len(word) for word in words}</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Fast Lookups</strong>: Convert a list of user objects into a dictionary keyed by ID for O(1) lookups</p>
<p>• <strong>Deduplication</strong>: Extracting a set of unique domains from a list of email strings</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>When swapping keys and values using <code>{v: k for k,v in d.items()}</code>, remember that if values are not unique, the last one processed will overwrite the others!</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">names = [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;, &#x27;Bob&#x27;]

# Set comprehension (Deduplicates automatically)
unique_lengths = {len(name) for name in names}
print(f&#x27;Unique lengths: {unique_lengths}&#x27;)

# Dict comprehension
name_to_len = {name: len(name) for name in set(names)}
print(f&#x27;Dict map: {name_to_len}&#x27;)

# Filtering a dictionary
prices = {&#x27;apple&#x27;: 1.0, &#x27;banana&#x27;: 0.5, &#x27;cherry&#x27;: 2.0}
expensive = {k: v for k, v in prices.items() if v &gt;= 1.0}
print(f&#x27;Expensive: {expensive}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Dict/Set Comp-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Dict/Set Comp</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>words = ["data", "science", "python"]</code>, create a dict mapping each word to its first letter. Print it.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a set comprehension of the squares of numbers from 1 to 10 that are divisible by 3. Print it.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Given <code>d = {"a": 10, "b": -5, "c": 20}</code>, create a new dict containing only positive values.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Swap keys and values for <code>codes = {"NY": "New York", "CA": "California"}</code> using a dict comp.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Create a dict comprehension combining <code>keys=["x", "y"]</code> and <code>values=[1, 2]</code> using <code>zip()</code>.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Matrix Transpose):</strong> Given a 3x3 matrix <code>[[1,2,3], [4,5,6], [7,8,9]]</code>, use a nested list comprehension to transpose it (swap rows and columns) into <code>[[1,4,7], [2,5,8], [3,6,9]]</code>.</p></div>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Frequency Map):</strong> Given a string <code>text = "hello world"</code>, use a dict comprehension with <code>text.count()</code> to create a frequency map of characters. (Note: this is O(n^2), but good practice).</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Data Cleaner):</strong> Given a list of strings <code>raw = [" 10 ", "20", "  ", "30 "]</code>, use a list comprehension to strip whitespace and convert to integers, skipping empty/blank strings.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (ID Lookup):</strong> Given <code>users = [{''id'': 101, ''name'': ''Alice''}, {''id'': 102, ''name'': ''Bob''}]</code>, create a dict comp that maps <code>id -> name</code> for fast O(1) lookups.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Vowel Set):</strong> Given a long paragraph, use a set comprehension to extract all unique words that start with a vowel (a, e, i, o, u).</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-39">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a list comprehension to generate the first 20 even numbers.</h3>
</div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-41">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>How do you flatten a 2D list <code>[[1,2], [3,4]]</code> using a list comprehension?</h3>
</div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-43">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Explain the difference in syntax between a list comprehension and a generator expression.</h3>
</div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-45">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a dict comprehension that maps numbers 1-10 to their binary string representation.</h3>
</div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-47">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Given <code>dict1 = {''a'': 1}</code> and <code>dict2 = {''b'': 2}</code>, combine them using a dict comprehension (or <code>**</code> unpacking).</h3>
</div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-49">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>What happens in a list comprehension if the <code>if</code> condition is placed before the <code>for</code> loop?</h3>
</div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-51">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a comprehension that filters out all vowels from a string.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-53">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Use a set comprehension to find the common elements between two lists without using <code>set(a) & set(b)</code>.</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-55">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a dict comprehension to invert a dictionary <code>d</code>, handling non-unique values by mapping to a list of keys.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-57">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Given a list of strings, write a comprehension that returns a list of lengths, but only for strings longer than 3 characters.</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-59">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a nested dictionary comprehension to create a multiplication table (1 to 5).</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-61">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Is a list comprehension faster than a standard <code>for</code> loop with <code>.append()</code>? Why?</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-63">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write a comprehension that parses a list of strings formatted as <code>''key:value''</code> into a dictionary.</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-65">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Explain the memory implications of using a list comprehension vs a generator expression on 10 million rows.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-67">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a list comprehension that implements the FizzBuzz logic for numbers 1 to 50.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-69">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Given a list of dictionaries, write a comprehension to extract the value of the ''name'' key, providing ''Unknown'' if missing.</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-71">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a comprehension to find all prime numbers up to 100 (can use an external <code>is_prime</code> function).</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-73">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Transpose a matrix without using list comprehensions (using <code>zip(*matrix)</code>). Which is better?</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-75">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a dict comprehension that maps characters of a string to their ASCII integer values.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-77">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Why shouldn''t you use a list comprehension just for its side effects (like printing)?</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-79">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a comprehension to extract the diagonal elements of a square matrix.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-81">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Create a list of all possible 2-character combinations from the alphabet using a nested comprehension.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-83">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Given <code>prices = {''apple'': 1.0, ''banana'': 0.5}</code>, use a dict comp to apply a 10% discount to all items.</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-85">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a list comprehension that extracts numbers from a string <code>s = ''abc123def456''</code>.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-87">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Refactor a 3-level deep nested loop into a comprehension. Then explain why you probably shouldn''t do that in production code.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 12 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Lists</td><td><code>[val if cond else alt for x in data]</code></td></tr>
<tr><td>2</td><td>Dicts</td><td><code>{row[''id'']: row for row in data}</code> for fast lookups</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can write a list comprehension with an if/else ternary.</p>
<p>• [ ] I can flatten a matrix using nested loops in a comprehension.</p>
<p>• [ ] I can create a dictionary dynamically.</p>
<p><strong>Next Up: Day 13 - Exceptions & Error Handling</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Advanced List Comprehensions : Deep Dive"}, {"anchor": "checks-Adv List Comp-3", "title": "\ud83e\uddea Checks: Adv List Comp"}, {"anchor": "sec-14", "title": "2. Dict & Set Comprehensions : Dynamic Hash Maps"}, {"anchor": "checks-Dict/Set Comp-16", "title": "\ud83e\uddea Checks: Dict/Set Comp"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-39", "title": "Q1."}, {"anchor": "sec-41", "title": "Q2."}, {"anchor": "sec-43", "title": "Q3."}, {"anchor": "sec-45", "title": "Q4."}, {"anchor": "sec-47", "title": "Q5."}, {"anchor": "sec-49", "title": "Q6."}, {"anchor": "sec-51", "title": "Q7."}, {"anchor": "sec-53", "title": "Q8."}, {"anchor": "sec-55", "title": "Q9."}, {"anchor": "sec-57", "title": "Q10."}, {"anchor": "sec-59", "title": "Q11."}, {"anchor": "sec-61", "title": "Q12."}, {"anchor": "sec-63", "title": "Q13."}, {"anchor": "sec-65", "title": "Q14."}, {"anchor": "sec-67", "title": "Q15."}, {"anchor": "sec-69", "title": "Q16."}, {"anchor": "sec-71", "title": "Q17."}, {"anchor": "sec-73", "title": "Q18."}, {"anchor": "sec-75", "title": "Q19."}, {"anchor": "sec-77", "title": "Q20."}, {"anchor": "sec-79", "title": "Q21."}, {"anchor": "sec-81", "title": "Q22."}, {"anchor": "sec-83", "title": "Q23."}, {"anchor": "sec-85", "title": "Q24."}, {"anchor": "sec-87", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42"]'::jsonb),
('day13', 'λ Lambda Functions', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Functional programming treats computation as the evaluation of mathematical functions. Today we master <code>lambda</code>, <code>map</code>, <code>filter</code>, and <code>reduce</code>. These patterns are essential for writing clean data transformation pipelines, especially in Pandas.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Lambdas</td><td>Anonymous inline functions</td></tr>
<tr><td>2</td><td>Functional</td><td>Map, Filter, Reduce</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Lambda Functions : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Anonymous Inline Functions</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A <b>lambda</b> is a small, anonymous, single-line function. Defined using <code>lambda arguments: expression</code>. It implicitly returns the result of the expression.</p>
<pre class="nb-code-block"><code># Standard
def add(x, y): return x + y
# Lambda
add_lambda = lambda x, y: x + y</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Pandas Apply</strong>: <code>df[''col''].apply(lambda x: x * 2)</code> — inline data transformations</p>
<p>• <strong>Sorting</strong>: <code>sorted(data, key=lambda d: d[''age''])</code> — custom sort keys on the fly</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Overusing Lambdas</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If a lambda gets complex or requires multiple lines, write a standard <code>def</code> function instead. Code readability is more important than brevity.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Sorting a list of tuples by the second element
records = [(&#x27;Alice&#x27;, 95), (&#x27;Bob&#x27;, 82), (&#x27;Charlie&#x27;, 91)]
sorted_records = sorted(records, key=lambda x: x[1])
print(sorted_records)

# Inline math mapping
math_funcs = {
    &#x27;double&#x27;: lambda x: x * 2,
    &#x27;square&#x27;: lambda x: x ** 2
}
print(math_funcs[&#x27;square&#x27;](5))</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Lambdas-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Lambdas</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a lambda that multiplies a number by 10. Assign it to <code>times10</code>. Call it with 5.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use a lambda with <code>sorted()</code> to sort <code>words = ["apple", "banana", "cherry", "date"]</code> by length.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Given a list of dicts <code>[{"id": 2}, {"id": 1}]</code>, sort them by <code>"id"</code> using a lambda key.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a lambda that takes <code>x, y</code> and returns <code>True</code> if <code>x > y</code>. Call it with 10, 5.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Extract the domain from an email: <code>lambda email: email.split("@")[1]</code>. Test it on <code>"user@gmail.com"</code>.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Map, Filter, Reduce : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Functional Paradigms</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python supports functional programming concepts. <code>map()</code> applies a function to all items. <code>filter()</code> keeps items where a function returns True. <code>reduce()</code> (from <code>functools</code>) repeatedly applies a function to pairs of items to reduce a list to a single value.</p>
<table>
<thead><tr><th>Function</th><th>Purpose</th><th>Equivalent Comprehension</th></tr></thead><tbody>
<tr><td><code>map(f, data)</code></td><td>Transform</td><td><code>[f(x) for x in data]</code></td></tr>
<tr><td><code>filter(f, data)</code></td><td>Extract</td><td><code>[x for x in data if f(x)]</code></td></tr>
<tr><td><code>reduce(f, data)</code></td><td>Aggregate</td><td>(No direct equivalent)</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data Pipelines</strong>: Chaining operations: <code>reduce(add, map(square, filter(is_even, data)))</code></p>
<p>• <strong>Legacy Code</strong>: You will see <code>map/filter</code> frequently in codebases written by Java/JS developers</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>In modern Python, list comprehensions are generally preferred over <code>map()</code> and <code>filter()</code> because they are more readable and slightly faster.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">from functools import reduce

nums = [1, 2, 3, 4, 5]

# Map (Transform)
doubled = list(map(lambda x: x * 2, nums))
print(f&#x27;Map: {doubled}&#x27;)

# Filter (Extract)
evens = list(filter(lambda x: x % 2 == 0, nums))
print(f&#x27;Filter: {evens}&#x27;)

# Reduce (Aggregate - e.g., multiply all)
product = reduce(lambda x, y: x * y, nums)
print(f&#x27;Reduce (Product): {product}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Functional-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Functional</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Use <code>map()</code> and a lambda to convert <code>names = ["alice", "bob"]</code> to uppercase. Print as list.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>filter()</code> and a lambda to extract numbers > 5 from <code>[3, 8, 2, 9, 4]</code>. Print as list.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Import <code>reduce</code>. Use it to find the maximum value in <code>[1, 5, 2, 8, 3]</code> using a lambda.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a list comprehension that does the exact same thing as <code>list(map(lambda x: x**2, [1, 2, 3]))</code>.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Why does <code>map()</code> return a <code><map object></code> instead of a list? (Hint: Lazy evaluation).</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Sort by Length):</strong> Given <code>sentences = [''I am Python'', ''Hi'', ''This is a long sentence'']</code>, sort them by word count using <code>sorted()</code> and a lambda. Print the result.</p></div>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Data Pipeline):</strong> Given <code>nums = [1, -5, 10, -2, 8]</code>. Use <code>filter()</code> to remove negatives, then <code>map()</code> to square them, then <code>reduce()</code> to sum them up. Print the final sum.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Dictionary Filter):</strong> Given a dictionary <code>data = {''a'': 10, ''b'': 5, ''c'': 20}</code>, use <code>filter()</code> and a lambda on <code>data.items()</code> to keep pairs where value > 5. Convert back to dict.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Multi-Map):</strong> Given <code>A = [1, 2, 3]</code> and <code>B = [10, 20, 30]</code>. Use <code>map()</code> with a lambda <code>lambda x, y: x + y</code> to add them element-wise. Print the resulting list.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Custom Reduce):</strong> Write your own <code>my_reduce(func, seq)</code> function using a <code>for</code> loop that mimics the behavior of <code>functools.reduce</code>.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-39">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a lambda that takes a string and returns the number of vowels in it. Test with <code>''hello world''</code>.</h3>
</div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-41">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write the same transformation using <code>list(map(lambda x: x<strong>2, data))</code> and <code>[x</strong>2 for x in data]</code>. Time both on a list of 100,000 numbers and print which is faster.</h3>
</div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-43">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a lambda to extract the domain from an email address (e.g., <code>''user@gmail.com''</code> → <code>''gmail.com''</code>). Test with 3 emails.</h3>
</div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-45">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Use <code>functools.reduce</code> to concatenate <code>[''Hello'', '' '', ''World'']</code> into a single string <code>''Hello World''</code>.</h3>
</div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-47">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a <code>reduce()</code> call that computes the product of <code>[1, 2, 3, 4, 5]</code>. Then write the same logic using a <code>for</code> loop. Print both results.</h3>
</div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-49">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write a <code>filter()</code> expression that removes all <code>None</code> values from <code>[1, None, 2, None, 3]</code>. Print the result as a list.</h3>
</div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-51">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write code to sort a dictionary <code>{''b'': 3, ''a'': 1, ''c'': 2}</code> by its values in descending order using <code>sorted()</code> with a lambda key.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-53">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a custom <code>my_map(func, iterable)</code> generator function using <code>yield</code>. Test it with <code>my_map(str.upper, [''a'', ''b''])</code>.</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-55">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Import <code>functools.partial</code>. Create <code>add_ten = partial(add, 10)</code> from <code>def add(a, b): return a + b</code>. Call <code>add_ten(5)</code> and print.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-57">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a function <code>make_counter()</code> that returns an inner function. Each call to the inner function increments and returns a counter. Demonstrate the closure.</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-59">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a pipeline: use <code>filter</code> to get even numbers from <code>range(20)</code>, then <code>map</code> to square them. Print the result as a list.</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-61">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write two versions of uppercasing a word list: <code>list(map(str.upper, words))</code> and <code>list(map(lambda x: x.upper(), words))</code>. Print both results.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-63">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Given <code>[(1, ''a''), (3, ''c''), (2, ''b'')]</code>, sort by the second element using a lambda key. Print the sorted list.</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-65">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a lambda that checks if a string reads the same forwards and backwards (palindrome). Test with <code>''racecar''</code> and <code>''hello''</code>.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-67">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a lambda that classifies a number as <code>''positive''</code>, <code>''negative''</code>, or <code>''zero''</code> using nested ternary. Test with <code>-5, 0, 7</code>.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-69">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Use <code>reduce</code> to find the intersection of <code>[{1,2,3}, {2,3,4}, {3,4,5}]</code>. Print the result.</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-71">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write your own <code>my_any(iterable)</code> function using <code>functools.reduce</code>. It should return <code>True</code> if any element is truthy.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-73">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write code that creates a <code>map</code> object of 1 million squares. Print its size using <code>sys.getsizeof()</code> vs the equivalent list''s size.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-75">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a lambda that takes another function as an argument and calls it twice: <code>twice = lambda f, x: f(f(x))</code>. Test with <code>lambda x: x + 3</code>.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-77">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write code using <code>map</code> with <code>lambda</code> over a list of tuples <code>[(1,2), (3,4)]</code> to compute each tuple''s sum. Print the result.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-79">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write code demonstrating the late-binding closure bug: <code>funcs = [lambda: i for i in range(3)]</code>. Call each and print the (unexpected) results.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-81">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Fix the late-binding bug from the previous question using <code>lambda i=i: i</code>. Call each and verify they return <code>0, 1, 2</code>.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-83">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Use <code>filter</code> and a lambda to keep only words containing the letter <code>''e''</code> from <code>[''hello'', ''world'', ''test'', ''fun'']</code>.</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-85">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a lambda that parses <code>''2023-12-25''</code> and returns a tuple <code>(2023, 12, 25)</code> using <code>split</code> and <code>map(int, ...)</code>.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-87">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a lambda that has a side effect (appends to a list). Call it 3 times and print the list to show the mutation.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 13 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Lambda</td><td><code>lambda x: x*2</code> is great for <code>apply()</code></td></tr>
<tr><td>2</td><td>Map/Filter</td><td>Lazy evaluation saves memory</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can write a lambda function.</p>
<p>• [ ] I can use <code>map()</code> and <code>filter()</code>.</p>
<p>• [ ] I understand <code>reduce()</code>.</p>
<p><strong>Next Up: Day 14 - Exceptions & Error Handling</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Lambda Functions : Anonymous Inline Functions"}, {"anchor": "checks-Lambdas-3", "title": "\ud83e\uddea Checks: Lambdas"}, {"anchor": "sec-14", "title": "2. Map, Filter, Reduce : Functional Paradigms"}, {"anchor": "checks-Functional-16", "title": "\ud83e\uddea Checks: Functional"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-39", "title": "Q1."}, {"anchor": "sec-41", "title": "Q2."}, {"anchor": "sec-43", "title": "Q3."}, {"anchor": "sec-45", "title": "Q4."}, {"anchor": "sec-47", "title": "Q5."}, {"anchor": "sec-49", "title": "Q6."}, {"anchor": "sec-51", "title": "Q7."}, {"anchor": "sec-53", "title": "Q8."}, {"anchor": "sec-55", "title": "Q9."}, {"anchor": "sec-57", "title": "Q10."}, {"anchor": "sec-59", "title": "Q11."}, {"anchor": "sec-61", "title": "Q12."}, {"anchor": "sec-63", "title": "Q13."}, {"anchor": "sec-65", "title": "Q14."}, {"anchor": "sec-67", "title": "Q15."}, {"anchor": "sec-69", "title": "Q16."}, {"anchor": "sec-71", "title": "Q17."}, {"anchor": "sec-73", "title": "Q18."}, {"anchor": "sec-75", "title": "Q19."}, {"anchor": "sec-77", "title": "Q20."}, {"anchor": "sec-79", "title": "Q21."}, {"anchor": "sec-81", "title": "Q22."}, {"anchor": "sec-83", "title": "Q23."}, {"anchor": "sec-85", "title": "Q24."}, {"anchor": "sec-87", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42"]'::jsonb),
('day14', '⚠️ Exceptions', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Code will break. Networks fail, data is dirty, and files go missing. Professional code anticipates these failures. Today we learn how to gracefully catch exceptions, ensure resource cleanup, and signal bad state using custom errors.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Try/Except</td><td>Catching runtime errors</td></tr>
<tr><td>2</td><td>Else/Finally</td><td>Execution guarantees</td></tr>
<tr><td>3</td><td>Raising</td><td>Custom error signaling</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Try / Except Blocks : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Catching Errors</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Code crashes when an error occurs. A <code>try/except</code> block allows you to ''catch'' exceptions, handle them gracefully, and let the program continue running. This is critical for data pipelines where one bad row shouldn''t stop the whole job.</p>
<pre class="nb-code-block"><code>try:
    result = 10 / 0
except ZeroDivisionError:
    result = 0</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>API Calls</strong>: Handling network timeouts or 500 errors without crashing</p>
<p>• <strong>Data Cleaning</strong>: Catching <code>ValueError</code> when trying to cast the string ''N/A'' to an integer</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ The Bare Except Trap</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Never write a bare <code>except:</code>. It will catch SystemExit and KeyboardInterrupt (Ctrl+C), making your program impossible to stop. ALWAYS specify the exception type: <code>except Exception as e:</code> at a minimum.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">data = [&#x27;10&#x27;, &#x27;20&#x27;, &#x27;invalid&#x27;, &#x27;30&#x27;]
clean_data = []

for item in data:
    try:
        # Try to convert to integer
        val = int(item)
        clean_data.append(val)
    except ValueError:
        # If it fails, log it and continue
        print(f&quot;Warning: &#x27;{item}&#x27; is not a valid number. Skipping.&quot;)

print(f&#x27;Clean data: {clean_data}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Try/Except-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Try/Except</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a try/except block that catches <code>ZeroDivisionError</code> when calculating <code>10 / 0</code>. Print "Cannot divide by zero".</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Try accessing <code>d = {"a": 1}; print(d["b"])</code>. Catch the <code>KeyError</code> and print a warning.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>except Exception as e:</code> to catch ANY error in <code>1 + "a"</code>. Print <code>e</code> to see the actual error message.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a try/except block to catch <code>FileNotFoundError</code> when trying to open <code>"fake.txt"</code>. Print "File not found".</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Why is a bare <code>except:</code> dangerous? Give an example of an exception it might catch that you don''t want it to.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Else and Finally : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Complete Error Control</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>The full exception block includes <code>else</code> and <code>finally</code>. <code>else</code> runs <b>only if no exception occurred</b>. <code>finally</code> runs <b>no matter what</b> (even if the program crashes or returns early).</p>
<table>
<thead><tr><th>Block</th><th>When does it run?</th><th>Common Use</th></tr></thead><tbody>
<tr><td><code>try</code></td><td>Always</td><td>Risky code</td></tr>
<tr><td><code>except</code></td><td>If error happens</td><td>Error handling & logging</td></tr>
<tr><td><code>else</code></td><td>If NO error happens</td><td>Code that depends on the try block succeeding</td></tr>
<tr><td><code>finally</code></td><td>ALWAYS</td><td>Cleaning up resources (closing files/connections)</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Database Connections</strong>: Ensuring <code>db.close()</code> runs in the <code>finally</code> block even if the query fails</p>
<p>• <strong>Safe Transactions</strong>: Committing a database transaction in the <code>else</code> block only if the execution succeeds</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Keep the <code>try</code> block as small as possible. Put the risky code in <code>try</code>, and the code that depends on it succeeding in the <code>else</code> block.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">def divide(a, b):
    try:
        result = a / b
    except ZeroDivisionError:
        print(&quot;Error: Division by zero&quot;)
    else:
        # Runs only if try succeeded
        print(f&quot;Success! Result is {result}&quot;)
    finally:
        # Runs no matter what
        print(&quot;Execution finished.\n&quot;)

divide(10, 2)
divide(10, 0)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Else & Finally-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Else & Finally</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a try/except/else block. Try <code>val = int("10")</code>. In <code>else</code>, print <code>"Success: [val]"</code>. Test it.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Change the input in Q1 to <code>"abc"</code>. Watch the <code>except</code> run and the <code>else</code> skip.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Add a <code>finally</code> block to Q1 that prints <code>"Cleanup complete"</code>. Run it with both "10" and "abc".</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a function that opens a file in the <code>try</code>, and closes it in the <code>finally</code>. (Simulate with print statements).</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Explain why code belonging in the <code>else</code> block shouldn''t just be put at the bottom of the <code>try</code> block.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Raising Exceptions : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Signaling Invalid State</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Sometimes your code detects an invalid state (like a negative age). You can <b>manually trigger an error</b> using the <code>raise</code> keyword. This tells the calling function that something went wrong.</p>
<pre class="nb-code-block"><code>def set_age(age):
    if age &lt; 0:
        raise ValueError(&quot;Age cannot be negative&quot;)
    return age</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data Validation</strong>: Rejecting dirty data explicitly before it poisons the database</p>
<p>• <strong>API Contracts</strong>: Raising 400 Bad Request errors when user input is invalid</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>You can define custom exceptions by subclassing <code>Exception</code>: <code>class DataValidationError(Exception): pass</code>. This makes your error handling highly specific.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">class InvalidTransactionError(Exception):
    &quot;&quot;&quot;Custom exception for banking errors.&quot;&quot;&quot;
    pass

def process_payment(amount):
    if amount &lt;= 0:
        # Raise a built-in error
        raise ValueError(&quot;Payment amount must be positive&quot;)
    if amount &gt; 10000:
        # Raise our custom error
        raise InvalidTransactionError(&quot;Transaction too large. Requires approval.&quot;)
    print(f&quot;Processed ${amount}&quot;)

try:
    process_payment(50000)
except InvalidTransactionError as e:
    print(f&quot;Blocked: {e}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Raising Errors-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Raising Errors</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a function <code>divide(a, b)</code> that explicitly raises a <code>ValueError</code> with message <code>"b cannot be zero"</code> if <code>b == 0</code>.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a custom exception class <code>InvalidAgeError(Exception): pass</code>. Raise it if age is > 150.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a try/except block to catch your <code>InvalidAgeError</code> from Q2 and print a friendly message.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> What is the difference between <code>raise Exception("msg")</code> and <code>raise ValueError("msg")</code>?</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Catch an exception, log it, and then re-raise it using the bare <code>raise</code> keyword. Demonstrate this.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Safe Config Loader):</strong> Write a function <code>load_config(path)</code> that tries to open a file. Catch <code>FileNotFoundError</code> and return a default dict. Catch <code>json.JSONDecodeError</code> and return <code>{}</code>. Finally, print ''Load attempt complete''.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Data Caster):</strong> Write a function <code>safe_cast(val, to_type, default=None)</code>. Try to cast <code>val</code> to <code>to_type</code>. Catch <code>ValueError</code> and <code>TypeError</code> and return <code>default</code>.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Password Validator):</strong> Create custom exceptions <code>LengthError</code> and <code>SpecialCharError</code>. Write <code>validate(pwd)</code>. Raise <code>LengthError</code> if < 8 chars. Raise <code>SpecialCharError</code> if no ''!'' or ''@'' is found. Test with try/except.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (API Retry):</strong> Write a loop that tries to execute a flaky function <code>connect()</code>. If it raises <code>ConnectionError</code>, catch it, sleep 1 sec, and retry up to 3 times. If it succeeds, <code>break</code>. Else print ''Failed''.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (File Cleanup):</strong> Write code that tries to create a file, write to it, and then explicitly raises an error. Use <code>finally</code> to ensure <code>os.remove()</code> is called on the file no matter what.</p></div>
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
<h3>Write a try/except that catches <code>Exception</code> but lets <code>KeyboardInterrupt</code> pass through. Demonstrate by raising both and showing the different behaviors.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write two versions of a dict key lookup: one using <code>if key in d</code> (LBYL) and one using <code>try/except KeyError</code> (EAFP). Time both on 100,000 lookups and print the results.</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a loop that uses <code>StopIteration</code> via <code>next(iter)</code> to break. Then rewrite it using a standard <code>for</code> loop. Print results from both.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write code demonstrating <code>else</code> in a <code>try</code> block: try to open a file, use <code>else</code> to process it only if the open succeeded.</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a try/except that catches both <code>ValueError</code> and <code>TypeError</code> in a single <code>except</code> clause. Test with <code>int(''abc'')</code> and <code>len(5)</code>.</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write code showing that if a <code>try</code> block returns <code>1</code> and a <code>finally</code> block returns <code>2</code>, the function returns <code>2</code>. Demonstrate this behavior.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a context manager class <code>Timer</code> with <code><strong>enter</strong></code> and <code><strong>exit</strong></code> that prints how long the <code>with</code> block took to execute.</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write code that catches an exception, prints the error message, then re-raises it using bare <code>raise</code>. Show the full traceback.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write code demonstrating <code>raise ValueError(''bad'') from TypeError(''original'')</code>. Print the chained exception''s <code><strong>cause</strong></code> attribute.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a function <code>validate_email(s)</code> that raises a custom <code>InvalidEmailError</code> if <code>''@''</code> is missing or the domain has no dot. Test with 3 inputs.</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write code that raises an exception inside a <code>finally</code> block. Show what happens to the original exception (it gets suppressed).</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write code comparing <code>assert x > 0</code> vs <code>if x <= 0: raise ValueError()</code>. Show that <code>assert</code> can be disabled with <code>-O</code> flag.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write code that catches an exception and prints the full traceback string using <code>traceback.format_exc()</code> without crashing.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write code that uses <code>contextlib.suppress(FileNotFoundError)</code> to silently ignore a missing file. Show the equivalent try/except.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write code showing that a bare <code>except:</code> catches <code>KeyboardInterrupt</code>. Then fix it by using <code>except Exception:</code> instead.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write code that catches a <code>SyntaxError</code> from <code>exec(''if True print(1)'')</code> using try/except. Print the error message.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a decorator <code>@retry(max_attempts=3)</code> that catches exceptions and retries a function up to 3 times. Test with a function that fails randomly.</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a helper function <code>safe_get(lst, index, default=None)</code> using try/except IndexError. Test with valid and invalid indices.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write code that uses <code>sys.excepthook</code> to log unhandled exceptions to a file before the program exits.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a class <code>Config</code> that validates <code>port</code> (must be int 1-65535) and <code>host</code> (must be non-empty string) in <code><strong>init</strong></code>, raising <code>TypeError</code>/<code>ValueError</code> as appropriate.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write code using <code>pd.to_numeric(series, errors=''coerce'')</code> to convert <code>[''10'', ''bad'', ''20'']</code> to numbers, replacing failures with <code>NaN</code>.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a function <code>validate_config(d)</code> that checks for required keys <code>[''host'', ''port'', ''db'']</code> and raises <code>ValueError</code> immediately listing all missing keys.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a function that parses nested JSON using EAFP: try to access <code>data[''users''][0][''email'']</code>, catching <code>KeyError</code> and <code>IndexError</code>.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write code that issues a <code>DeprecationWarning</code> using <code>warnings.warn()</code>. Then show how to catch it with <code>warnings.catch_warnings()</code>.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write an exception class hierarchy: <code>DatabaseError</code> → <code>ConnectionError</code>, <code>QueryError</code>. Raise and catch them at different levels.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 14 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Try</td><td>Wrap risky code to prevent crashes</td></tr>
<tr><td>2</td><td>Finally</td><td>Always runs, perfect for <code>db.close()</code></td></tr>
<tr><td>3</td><td>Raise</td><td>Use explicit errors to reject bad data</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can write a <code>try/except</code> block.</p>
<p>• [ ] I never use a bare <code>except:</code>.</p>
<p>• [ ] I understand when to <code>raise</code> an error.</p>
<p><strong>Next Up: Day 15 - File Handling & JSON</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Try / Except Blocks : Catching Errors"}, {"anchor": "checks-Try/Except-3", "title": "\ud83e\uddea Checks: Try/Except"}, {"anchor": "sec-14", "title": "2. Else and Finally : Complete Error Control"}, {"anchor": "checks-Else & Finally-16", "title": "\ud83e\uddea Checks: Else & Finally"}, {"anchor": "sec-27", "title": "3. Raising Exceptions : Signaling Invalid State"}, {"anchor": "checks-Raising Errors-29", "title": "\ud83e\uddea Checks: Raising Errors"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day15', '📂 File Handling', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Data Analyst pipelines start by reading data and end by saving data. Today we master Disk I/O, parsing the universal language of the web (JSON), and modernizing our code using the powerful, object-oriented <code>pathlib</code> module.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>File I/O</td><td><code>open()</code>, <code>with</code> context</td></tr>
<tr><td>2</td><td>JSON</td><td><code>loads()</code>, <code>dumps()</code></td></tr>
<tr><td>3</td><td>Pathlib</td><td>Object-oriented paths</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Reading & Writing Files : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Disk I/O</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Data lives in files. Python interacts with files using the <code>open(filename, mode)</code> function. Modes include <code>''r''</code> (read), <code>''w''</code> (write/overwrite), and <code>''a''</code> (append). You should ALWAYS use a <b>Context Manager</b> (the <code>with</code> statement) to ensure the file is closed properly, even if an error occurs.</p>
<pre class="nb-code-block"><code>with open(&#x27;data.txt&#x27;, &#x27;w&#x27;) as f:
    f.write(&#x27;Hello World\n&#x27;)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Log Processing</strong>: Reading multi-gigabyte log files line-by-line without running out of RAM</p>
<p>• <strong>Data Exports</strong>: Saving analysis results to local text files</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Memory Leaks</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If you do <code>f = open(''data.txt'')</code> and forget to call <code>f.close()</code>, the file remains locked in memory. Always use <code>with open(...) as f:</code>.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Writing to a file
with open(&#x27;sample.txt&#x27;, &#x27;w&#x27;) as file:
    file.write(&quot;Line 1\n&quot;)
    file.write(&quot;Line 2\n&quot;)

# Reading from a file (Whole file at once)
with open(&#x27;sample.txt&#x27;, &#x27;r&#x27;) as file:
    content = file.read()
    print(&quot;Full content:&quot;)
    print(content)

# Reading line by line (Memory efficient!)
print(&quot;Line by line:&quot;)
with open(&#x27;sample.txt&#x27;, &#x27;r&#x27;) as file:
    for line in file:
        print(line.strip())  # strip() removes the newline character</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-File I/O-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>File I/O</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write code to open a file <code>"test.txt"</code> in write mode (<code>"w"</code>) and write your name to it.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Open <code>"test.txt"</code> in read mode (<code>"r"</code>). Read the contents and print them.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Open <code>"test.txt"</code> in append mode (<code>"a"</code>). Add a new line <code>"Welcome to Python"</code>. Print the full file again.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Explain why <code>with open() as f:</code> is superior to <code>f = open(); f.read(); f.close()</code>.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a memory-efficient <code>for</code> loop to read a file line-by-line. (Assume file is "test.txt").</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Parsing JSON : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">The Language of the Web</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>JSON (JavaScript Object Notation) is the universal format for web APIs. It maps perfectly to Python <b>dictionaries and lists</b>. The built-in <code>json</code> module provides tools to parse strings into dicts (<code>loads</code>) and serialize dicts into strings (<code>dumps</code>).</p>
<table>
<thead><tr><th>Function</th><th>Purpose</th><th>Input -> Output</th></tr></thead><tbody>
<tr><td><code>json.loads(s)</code></td><td>Load String</td><td>String -> Dictionary</td></tr>
<tr><td><code>json.dumps(d)</code></td><td>Dump String</td><td>Dictionary -> String</td></tr>
<tr><td><code>json.load(f)</code></td><td>Load File</td><td>File Object -> Dictionary</td></tr>
<tr><td><code>json.dump(d, f)</code></td><td>Dump File</td><td>Dictionary -> File Object</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>API Integration</strong>: Parsing REST API responses (which are almost always JSON)</p>
<p>• <strong>Configuration</strong>: Loading application settings from a <code>.json</code> file</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Use <code>json.dumps(data, indent=4)</code> to ''pretty-print'' complex dictionaries for easy debugging.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import json

# Dictionary to JSON String (Serialization)
data = {&quot;user&quot;: &quot;Alice&quot;, &quot;age&quot;: 25, &quot;active&quot;: True}
json_str = json.dumps(data, indent=2)
print(&quot;JSON String:&quot;)
print(json_str)

# JSON String to Dictionary (Parsing)
raw_json = &#x27;{&quot;status&quot;: &quot;OK&quot;, &quot;code&quot;: 200}&#x27;
parsed_dict = json.loads(raw_json)
print(f&quot;\nParsed Dict: {parsed_dict}&quot;)
print(f&quot;Status: {parsed_dict[&#x27;status&#x27;]}&quot;)

# Saving to a file
with open(&#x27;config.json&#x27;, &#x27;w&#x27;) as f:
    json.dump(data, f)  # Note: dump, not dumps</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-JSON-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>JSON</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import <code>json</code>. Use <code>json.loads()</code> to parse <code>''{"x": 10, "y": 20}''</code> into a dictionary.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Convert the dictionary <code>{"color": "red", "sizes": [1, 2]}</code> to a JSON string using <code>json.dumps()</code>. Print it.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>json.dumps()</code> with the <code>indent=4</code> argument to pretty-print <code>{"a": {"b": 1}}</code>.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write code to save a dictionary <code>d</code> directly to a file <code>"data.json"</code> using <code>with open()</code> and <code>json.dump()</code>.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Read <code>"data.json"</code> back into a dictionary using <code>json.load()</code>. Print the type of the loaded object.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Pathlib : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Modern File Paths</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Handling file paths as strings (e.g., <code>''data/users.txt''</code>) causes bugs across different operating systems (Windows uses <code>\</code>, Mac/Linux use <code>/</code>). The modern Pythonic way is the <b><code>pathlib</code></b> module, which treats paths as objects.</p>
<pre class="nb-code-block"><code>from pathlib import Path

# Object-oriented paths
folder = Path(&#x27;data&#x27;)
file_path = folder / &#x27;users.txt&#x27;  # The / operator intelligently joins paths!</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Cross-Platform Code</strong>: Write code on a Mac that executes flawlessly on a Windows server</p>
<p>• <strong>File Operations</strong>: Easily check if a file exists, get its suffix (e.g., <code>.csv</code>), or read its text instantly</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Pathlib objects have amazing built-in methods: <code>path.exists()</code>, <code>path.read_text()</code>, and <code>path.suffix</code>. Use them instead of the older <code>os.path</code> module.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">from pathlib import Path

# Creating a path object
base_dir = Path(&#x27;data_folder&#x27;)
file_path = base_dir / &#x27;reports&#x27; / &#x27;summary.txt&#x27;
print(f&quot;Path object: {file_path}&quot;)

# Creating directories safely
base_dir.mkdir(exist_ok=True)

# Quick write/read without context managers
test_file = base_dir / &#x27;quick.txt&#x27;
test_file.write_text(&#x27;Pathlib is awesome!&#x27;)
print(f&quot;Read back: {test_file.read_text()}&quot;)

# Checking properties
print(f&quot;Exists? {test_file.exists()}&quot;)
print(f&quot;Extension: {test_file.suffix}&quot;)
print(f&quot;File name: {test_file.name}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Pathlib-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Pathlib</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import <code>Path</code> from <code>pathlib</code>. Create a Path object for <code>"folder" / "subfolder" / "file.csv"</code>. Print it.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a Path object <code>p = Path("demo.txt")</code>. Use <code>p.write_text("Hello")</code> to create the file.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>p.read_text()</code> to read the file created in Q2 and print it. Then check <code>p.exists()</code>.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a Path for <code>"image.jpg"</code>. Print its <code>.suffix</code> and <code>.stem</code> (the name without extension).</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>Path.cwd()</code> to get the current working directory. Print it.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Log Parser):</strong> Create a file <code>server.log</code> with 5 lines: 2 containing ''ERROR'', 3 containing ''INFO''. Write a memory-efficient loop to read the file and print ONLY the ''ERROR'' lines.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (JSON Config Updater):</strong> Write a function <code>update_config(file_path, key, val)</code>. It should read a JSON file (or create <code>{}</code> if missing), update the key, and save the JSON back to the file.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (File Extension Counter):</strong> Create 3 files: <code>a.txt</code>, <code>b.csv</code>, <code>c.txt</code> in a new folder using Pathlib. Write a function that uses <code>Path.iterdir()</code> to iterate the folder and count how many <code>.txt</code> files exist.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (CSV to JSON):</strong> Write a simulated CSV string (e.g., <code>''id,name\n1,Alice\n2,Bob''</code>). Parse it manually using <code>split(''\n'')</code> and <code>split('','')</code>, convert to a list of dicts, and <code>json.dumps()</code> it.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Safe File Reader):</strong> Write a function <code>read_safe(path)</code> that uses <code>pathlib</code> to check if a file exists. If so, return its text. If not, return <code>None</code>. Test with a valid and invalid path.</p></div>
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
<h3>Explain the difference between <code>open(''f.txt'', ''w'')</code> and <code>open(''f.txt'', ''a'')</code>.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Why is it essential to use a context manager (<code>with</code> statement) when opening files?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Explain the difference between <code>f.read()</code>, <code>f.readline()</code>, and <code>f.readlines()</code>.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>How do you read a 50GB file in Python without running out of RAM?</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Explain the difference between <code>json.loads()</code> and <code>json.load()</code>.</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write code to parse a JSON string, extract a specific field, and handle a <code>json.JSONDecodeError</code>.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Why shouldn''t you use regular expressions to parse JSON or HTML?</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Compare <code>os.path.join</code> with <code>pathlib</code>''s <code>/</code> operator. Why is pathlib preferred in modern Python?</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a script that uses <code>pathlib</code> to rename all <code>.txt</code> files in a directory to <code>.md</code>.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>How do you write a list of dictionaries to a CSV file without using Pandas (using the <code>csv</code> module)?</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Explain how character encodings work in Python. Why should you often use <code>encoding=''utf-8''</code> in <code>open()</code>?</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write code that safely creates a nested directory structure (e.g., <code>a/b/c</code>) if it doesn''t exist.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>What is the Pickle module? Why is <code>json</code> generally preferred over <code>pickle</code> for data serialization?</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a generator function that reads a file and yields chunks of 1024 bytes at a time.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Explain the security risks of using <code>yaml.load()</code> or <code>pickle.loads()</code> on untrusted data.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write code using the <code>tempfile</code> module to create a temporary file, write data, and auto-delete it.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>How do you handle file locking in Python if two processes try to write to the same file simultaneously?</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Explain what the <code><strong>file</strong></code> variable is and how it''s used to find relative asset paths.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a function that recursively finds all files larger than 1MB in a directory using <code>pathlib</code>.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>How do you handle reading a file that might be locked or currently being written to by another program?</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write code using <code>shutil</code> to copy a file and preserve its metadata.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Explain the purpose of <code>StringIO</code> and <code>BytesIO</code> in the <code>io</code> module. When would you use them?</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a script that merges 5 different JSON files into a single master JSON file.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>How does Pandas <code>read_csv</code> differ fundamentally from the standard library <code>csv.reader</code>?</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write code to extract a ZIP file using the <code>zipfile</code> module or <code>shutil.unpack_archive</code>.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 15 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>I/O</td><td>ALWAYS use context managers (<code>with</code>)</td></tr>
<tr><td>2</td><td>JSON</td><td>The bridge between Python dicts and the web</td></tr>
<tr><td>3</td><td>Pathlib</td><td>Replaces messy <code>os.path</code> strings</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can safely open, read, and close a file.</p>
<p>• [ ] I can parse a JSON string into a dictionary.</p>
<p>• [ ] I can use pathlib to construct safe file paths.</p>
<p><strong>Next Up: Day 16 - Object-Oriented Programming (OOP) Basics</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Reading & Writing Files : Disk I/O"}, {"anchor": "checks-File I/O-3", "title": "\ud83e\uddea Checks: File I/O"}, {"anchor": "sec-14", "title": "2. Parsing JSON : The Language of the Web"}, {"anchor": "checks-JSON-16", "title": "\ud83e\uddea Checks: JSON"}, {"anchor": "sec-27", "title": "3. Pathlib : Modern File Paths"}, {"anchor": "checks-Pathlib-29", "title": "\ud83e\uddea Checks: Pathlib"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb)
ON CONFLICT (day_id) DO UPDATE SET
  title = EXCLUDED.title,
  html_body = EXCLUDED.html_body,
  sections = EXCLUDED.sections,
  cells = EXCLUDED.cells;