-- ═══════════════════════════════════════════════════════════════
-- Seed Notebook Content: Days 06 to 10
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.notebook_content (day_id, title, html_body, sections, cells)
VALUES
('day06', '⭕ Sets', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Sets are the secret weapon of efficient Python code. While lists are for sequences, sets are for membership and uniqueness. Today we master set theory operations and discover how switching from a list to a set can speed up your data processing pipelines by 1000x.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Concept</th><th>Core Use Case</th></tr></thead><tbody>
<tr><td>1</td><td>Creation</td><td>Unordered, unique, <code>{}</code> or <code>set()</code></td><td>Deduplication</td></tr>
<tr><td>2</td><td>Operations</td><td>`\</td><td><code>, </code>&<code>, </code>-<code>, </code>^`</td><td>Cohort Analysis</td></tr>
<tr><td>3</td><td>Methods</td><td><code>add()</code>, <code>discard()</code></td><td>Dynamic updating</td></tr>
<tr><td>4</td><td>Relations</td><td><code>A <= B</code>, <code>issubset()</code></td><td>Validation</td></tr>
<tr><td>5</td><td>Frozen Sets</td><td><code>frozenset()</code>, immutable</td><td>Dict keys, sets of sets</td></tr>
<tr><td>6</td><td>Performance</td><td>O(1) vs O(N)</td><td>Pipeline optimization</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Set Creation & Basics : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Unordered, Unique Elements</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A set is an <b>unordered collection of unique, hashable elements</b>. Sets are defined by curly braces <code>{}</code> (but without key-value pairs) or the <code>set()</code> constructor. Their superpower is <b>fast O(1) membership testing</b> and automatic deduplication.</p>
<table>
<thead><tr><th>Creation Method</th><th>Example</th><th>Note</th></tr></thead><tbody>
<tr><td>Curly braces</td><td><code>{1, 2, 3}</code></td><td>Values must be hashable</td></tr>
<tr><td><code>set()</code> constructor</td><td><code>set([1, 2, 2, 3])</code></td><td>Automatically deduplicates</td></tr>
<tr><td>Empty set</td><td><code>set()</code></td><td><code>{}</code> creates an empty dict!</td></tr>
<tr><td>Comprehension</td><td><code>{x**2 for x in range(5)}</code></td><td>Set comprehension</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data Deduplication</strong>: <code>unique_users = set(user_ids)</code> — instant deduplication</p>
<p>• <strong>Membership Testing</strong>: Checking if an item exists is exponentially faster than lists</p>
<p>• <strong>Vocabulary Building</strong>: Finding unique words in a document corpus</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Empty Set Trap</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>{}</code> creates an <b>empty dictionary</b>, not an empty set. You must use <code>set()</code> to create an empty set.
</div>
<h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Sets can only contain <b>hashable</b> (immutable) items. You cannot put a list or a dictionary inside a set, but you can put a tuple.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Creation methods
nums = {1, 2, 3, 4, 5}
letters = set(&#x27;hello&#x27;)  # string to set
empty = set()         # Empty set

print(f&#x27;nums: {nums}&#x27;)
print(f&#x27;letters (deduplicated &amp; unordered): {letters}&#x27;)
print(f&#x27;empty: {type(empty)}&#x27;)

# Empty dict trap
wrong_empty = {}
print(f&#x27;wrong_empty is a dict: {type(wrong_empty)}&#x27;)

# Fast deduplication
duplicates = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
unique_items = set(duplicates)
print(f&#x27;Unique list: {list(unique_items)}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Set Creation-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Set Creation</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a set of your 3 favorite colors. Then create an empty set. Print their types.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Convert the string <code>"abracadabra"</code> to a set. Print it. Explain why the length is much shorter.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Try to create a set containing a list: <code>s = {1, 2, [3, 4]}</code>. Catch the <code>TypeError</code> and print the error message (unhashable type).</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a set containing a tuple: <code>s = {1, 2, (3, 4)}</code>. Print the set. Why does this work but lists do not?</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use a set comprehension to create a set of the lengths of these words: <code>["data", "science", "python", "data", "code"]</code>. Print it.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Set Theory Operations : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Mathematical Relational Logic</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python sets support mathematical operations like <b>union</b>, <b>intersection</b>, <b>difference</b>, and <b>symmetric difference</b>. These can be performed using operators (e.g., <code>|</code>, <code>&amp;</code>) or methods (e.g., <code>.union()</code>). Operators require both operands to be sets, while methods accept any iterable.</p>
<table>
<thead><tr><th>Operation</th><th>Operator</th><th>Method</th><th>Meaning</th></tr></thead><tbody>
<tr><td>Union</td><td>`A \</td><td>B`</td><td><code>A.union(B)</code></td><td>Elements in A or B (or both)</td></tr>
<tr><td>Intersection</td><td><code>A & B</code></td><td><code>A.intersection(B)</code></td><td>Elements in both A and B</td></tr>
<tr><td>Difference</td><td><code>A - B</code></td><td><code>A.difference(B)</code></td><td>Elements in A but not in B</td></tr>
<tr><td>Symmetric Diff</td><td><code>A ^ B</code></td><td><code>A.symmetric_difference(B)</code></td><td>Elements in exactly one set</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Cohort Analysis</strong>: Find users who bought Product A AND Product B (Intersection)</p>
<p>• <strong>Churn Analysis</strong>: Users active last month MINUS users active this month (Difference)</p>
<p>• <strong>A/B Testing</strong>: Combine unique user IDs from two experiment arms (Union)</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Order Matters in Difference</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>A - B</code> is not the same as <code>B - A</code>. The difference operation is <b>asymmetric</b>.
</div></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">A = {1, 2, 3, 4}
B = {3, 4, 5, 6}

print(f&#x27;Union (A | B): {A | B}&#x27;)
print(f&#x27;Intersection (A &amp; B): {A &amp; B}&#x27;)
print(f&#x27;Difference (A - B): {A - B}&#x27;)
print(f&#x27;Difference (B - A): {B - A}&#x27;)
print(f&#x27;Sym Diff (A ^ B): {A ^ B}&#x27;)

# Methods accept iterables (lists, strings, etc.)
C = {1, 2, 3}
print(f&#x27;Union with list: {C.union([3, 4, 5])}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Set Operations-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Set Operations</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>engineers = {"Alice", "Bob", "Charlie"}</code> and <code>managers = {"Charlie", "David", "Eve"}</code>, find who is both an engineer and a manager.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Using the same sets, find all unique employees across both roles (Union). Print the result.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Find employees who are engineers but NOT managers. Find employees who are managers but NOT engineers. Print both.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Find employees who hold exactly ONE role (not both). Print the symmetric difference.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Demonstrate that operators require sets: try <code>{1, 2} | [2, 3]</code>. Then show how to fix it using the <code>.union()</code> method.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Set Methods & Modification : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Dynamic Set Updates</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Sets are mutable. You can add or remove elements using methods. Unlike lists, sets have no concept of index or order, so you cannot use <code>append()</code> or <code>pop(i)</code>.</p>
<table>
<thead><tr><th>Method</th><th>Action</th><th>Note</th></tr></thead><tbody>
<tr><td><code>.add(x)</code></td><td>Add one item</td><td>Does nothing if already exists</td></tr>
<tr><td><code>.update(iter)</code></td><td>Add multiple items</td><td>Like <code>.extend()</code> for lists</td></tr>
<tr><td><code>.remove(x)</code></td><td>Remove item x</td><td>Raises <code>KeyError</code> if x not found</td></tr>
<tr><td><code>.discard(x)</code></td><td>Remove item x</td><td><b>Does nothing</b> if x not found (safe)</td></tr>
<tr><td><code>.pop()</code></td><td>Remove & return random item</td><td>Raises <code>KeyError</code> if empty</td></tr>
<tr><td><code>.clear()</code></td><td>Remove all items</td><td>Leaves <code>set()</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Incremental Processing</strong>: Add seen IDs to a set to track processed records: <code>seen.add(row_id)</code></p>
<p>• <strong>Safe Cleanup</strong>: Use <code>.discard()</code> to remove elements without needing <code>if item in set:</code> checks</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ remove() vs discard()</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Always use <code>.discard()</code> unless you specifically want your program to crash when trying to remove an element that isn''t there.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">s = {1, 2, 3}

# Adding
s.add(4)
s.add(4)  # No effect, duplicates ignored
s.update([5, 6, 7])
print(f&#x27;After adding: {s}&#x27;)

# Removing
s.remove(7)
# s.remove(99)  # Would raise KeyError!
s.discard(99)   # Safe, no error
print(f&#x27;After removal: {s}&#x27;)

# Popping (removes arbitrary element)
popped = s.pop()
print(f&#x27;Popped {popped}, remaining: {s}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Set Methods-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Set Methods</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Start with <code>s = set()</code>. Add elements <code>1</code>, <code>2</code>, and <code>2</code> again. Print the set.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Update the set with a list <code>[3, 4, 5]</code> and a string <code>"hello"</code>. Print the result. Notice how the string is handled.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Demonstrate the difference between <code>.remove()</code> and <code>.discard()</code> by trying to remove an element that does not exist. Use a try/except block for <code>.remove()</code>.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use a while loop and <code>.pop()</code> to empty a set of <code>5</code> elements, printing each popped item. Print the final set to confirm it is empty.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a function <code>add_if_missing(s, item)</code> that adds an item and returns <code>True</code> if it was added, or <code>False</code> if it was already there.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-40">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>4. Subset & Superset Relations : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Comparative Logic</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Sets can be compared to check if one is fully contained within another. A set is a <b>subset</b> if all its elements exist in the other set. It is a <b>superset</b> if it contains all elements of the other set. Two sets are <b>disjoint</b> if they share no common elements.</p>
<table>
<thead><tr><th>Operation</th><th>Operator</th><th>Method</th><th>True if...</th></tr></thead><tbody>
<tr><td>Subset</td><td><code>A <= B</code></td><td><code>A.issubset(B)</code></td><td>All elements of A are in B</td></tr>
<tr><td>Proper Subset</td><td><code>A < B</code></td><td>None</td><td>Subset AND A != B</td></tr>
<tr><td>Superset</td><td><code>A >= B</code></td><td><code>A.issuperset(B)</code></td><td>A contains all elements of B</td></tr>
<tr><td>Disjoint</td><td>None</td><td><code>A.isdisjoint(B)</code></td><td>A & B is empty</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Permission Checking</strong>: <code>if user_roles.issubset(allowed_roles):</code> — verify access rights</p>
<p>• <strong>Data Validation</strong>: <code>if required_columns.issubset(df.columns):</code> — ensure data structure is correct</p>
<p>• <strong>Overlap Checking</strong>: <code>if isdisjoint</code> — verify two user segments are truly mutually exclusive</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Use <code><=</code> and <code>>=</code> for subsets/supersets. <code>A < B</code> checks for a <b>proper subset</b> (A is a subset of B, but A is not equal to B).</p>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19">A = {1, 2}
B = {1, 2, 3, 4}
C = {5, 6}

# Subsets
print(f&#x27;A is subset of B: {A.issubset(B)}&#x27;)  # True
print(f&#x27;A &lt;= B: {A &lt;= B}&#x27;)  # True

# Proper subset
print(f&#x27;A &lt; A: {A &lt; A}&#x27;)    # False (not proper)
print(f&#x27;A &lt;= A: {A &lt;= A}&#x27;)  # True

# Supersets
print(f&#x27;B is superset of A: {B.issuperset(A)}&#x27;)  # True
print(f&#x27;B &gt;= A: {B &gt;= A}&#x27;)  # True

# Disjoint
print(f&#x27;A and C are disjoint: {A.isdisjoint(C)}&#x27;)  # True</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Subset & Superset-42">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Subset & Superset</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>required = {"age", "name"}</code>, check if it is a subset of <code>columns = {"age", "name", "salary"}</code> using both method and operator.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Check if <code>columns</code> is a superset of <code>required</code> using both method and operator. Print results.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Demonstrate the difference between a subset (<code><=</code>) and a proper subset (<code><</code>) using <code>A = {1, 2}</code> and <code>B = {1, 2}</code>.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create two sets of tags for two different articles. Check if they have zero overlap using <code>.isdisjoint()</code>. Print the result.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a function <code>has_all_permissions(user_perms, required_perms)</code> that returns True only if the user has all required permissions. Test it.</p></div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-53">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>5. Frozen Sets : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Immutable Sets</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A <b>frozenset</b> is an <b>immutable</b> version of a set. Once created, elements cannot be added or removed. Because it is immutable, a frozenset is <b>hashable</b>, meaning it can be used as a dictionary key or as an element inside another set.</p>
<table>
<thead><tr><th>Feature</th><th><code>set</code></th><th><code>frozenset</code></th></tr></thead><tbody>
<tr><td>Mutable?</td><td>Yes</td><td>No</td></tr>
<tr><td>Hashable?</td><td>No</td><td>Yes</td></tr>
<tr><td>Use as dict key?</td><td>No</td><td>Yes</td></tr>
<tr><td>Put inside a set?</td><td>No</td><td>Yes</td></tr>
<tr><td>Methods</td><td>All set methods</td><td>Only non-modifying methods (union, etc.)</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Compound Keys</strong>: <code>distances = {frozenset([''NY'', ''LA'']): 2444}</code> — order-independent keys</p>
<p>• <strong>Caching</strong>: Use frozenset as arguments to cached/memoized functions</p>
<p>• <strong>Immutable Constraints</strong>: Prevent accidental modification of global rule sets</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Sets of Sets</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>You cannot create a set of sets like <code>{{1, 2}, {3, 4}}</code> because sets are unhashable. You MUST use frozensets: <code>{frozenset([1, 2]), frozenset([3, 4])}</code>.</p>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Frozenset creation
fs = frozenset([1, 2, 3])
print(f&#x27;Frozenset: {fs}&#x27;)

# fs.add(4)  # AttributeError: &#x27;frozenset&#x27; object has no attribute &#x27;add&#x27;

# Frozenset as dict key
# Represents distance between two cities (order doesn&#x27;t matter!)
distances = {
    frozenset([&#x27;NY&#x27;, &#x27;LA&#x27;]): 2444,
    frozenset([&#x27;NY&#x27;, &#x27;Chicago&#x27;]): 712
}

# Lookup works regardless of order
query = frozenset([&#x27;LA&#x27;, &#x27;NY&#x27;])
print(f&#x27;Distance NY-LA: {distances[query]} miles&#x27;)

# Set of sets (using frozensets)
valid_combinations = {frozenset([1, 2]), frozenset([3, 4])}
print(f&#x27;Combinations: {valid_combinations}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Frozen Sets-55">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Frozen Sets</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a frozenset from a list <code>[1, 2, 3]</code>. Try to use <code>.add(4)</code> and catch the AttributeError. Print the error message.</p></div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Demonstrate that standard sets cannot be dict keys (catch TypeError), but frozensets can.</p></div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create a dictionary where keys are frozensets of two users, and values are their relationship status. Retrieve a value using the reverse order of users.</p></div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Show that <code>frozenset([1, 2, 3]) | frozenset([3, 4, 5])</code> works and returns a frozenset. Print the type of the result.</p></div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Create a set containing three frozensets. Print the set.</p></div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>6. Sets vs Lists : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">O(1) Lookups & Performance</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Sets use <b>hash tables</b> under the hood. This means checking if an item is in a set takes <b>O(1) time</b> (constant time), regardless of how large the set is. Checking if an item is in a list takes <b>O(n) time</b>, which gets slower as the list grows.</p>
<table>
<thead><tr><th>Operation</th><th>List Time Complexity</th><th>Set Time Complexity</th><th>Speedup</th></tr></thead><tbody>
<tr><td><code>x in collection</code></td><td>O(n)</td><td>O(1)</td><td>Massive for large data</td></tr>
<tr><td>Deduplicate</td><td>O(n^2) (naive)</td><td>O(n)</td><td>Huge</td></tr>
<tr><td>Iteration</td><td>O(n)</td><td>O(n)</td><td>Equal</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Filtering Pipelines</strong>: Convert blacklist of IDs to a set before filtering a large DataFrame</p>
<p>• <strong>Cross-referencing</strong>: Checking which users in Table A exist in Table B</p>
<p>• <strong>Performance Optimization</strong>: Replacing <code>if item in list:</code> with <code>if item in set:</code> is the easiest performance win in Python</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If you need to check membership (<code>in</code>) inside a loop over a large dataset, ALWAYS convert the lookup collection to a set first.</p>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31">import time
import random

# Setup data
num_elements = 1_000_000
lookup_value = 999_999

# Create collections
data_list = list(range(num_elements))
data_set = set(data_list)

# Time List Lookup
start = time.time()
found = lookup_value in data_list
list_time = time.time() - start

# Time Set Lookup
start = time.time()
found = lookup_value in data_set
set_time = time.time() - start

print(f&#x27;List lookup: {list_time:.6f} seconds&#x27;)
print(f&#x27;Set lookup:  {set_time:.6f} seconds&#x27;)
print(f&#x27;Set is {list_time / (set_time + 1e-9):.1f}x faster&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Performance-68">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Performance</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Recreate the performance benchmark: time looking up <code>-1</code> (not in collection) in a list of 1,000,000 items vs a set. Print the times.</p></div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given a huge text, extracting unique words using <code>list.append</code> (if not in list) vs <code>set.add</code>. Explain why the set approach is O(n) and list approach is O(n^2).</p></div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a function <code>find_common(l1, l2)</code> that finds common elements between two large lists. Convert them to sets and use intersection. Time the function.</p></div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a loop that filters a list of 100,000 numbers, keeping only those present in a <code>valid_ids</code> list of 10,000 numbers. Show how converting <code>valid_ids</code> to a set speeds it up.</p></div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> When would you NOT use a set for lookups? (Hint: Order preservation, duplicate counting). Explain briefly.</p></div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Data Deduplicator):</strong> Write a function <code>unique_sorted_chars(text)</code> that takes a string, removes duplicates, removes spaces, and returns a sorted list of the unique characters. Test with <code>''hello world''</code>.</p></div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Cohort Overlap):</strong> Given <code>cohort_A = [1,2,3,4,5,6]</code> and <code>cohort_B = [4,5,6,7,8]</code>, use sets to find: IDs in both, IDs only in A, IDs only in B, and IDs in exactly one cohort. Print all 4 lists.</p></div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Vocabulary Analyzer):</strong> Write a function <code>jaccard_similarity(doc1, doc2)</code> that splits two strings into sets of words and calculates: <code>len(intersection) / len(union)</code>. Test with two short sentences.</p></div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Access Controller):</strong> Given <code>user_roles = {''read'', ''write''}</code> and <code>admin_roles = {''read'', ''write'', ''delete''}</code>, write code that uses subset/superset methods to check if the user has all admin roles, and if not, which ones are missing.</p></div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Fast Filter):</strong> Create a list of 100,000 random integers. Create a list of 5,000 ''blacklist'' integers. Filter the main list to remove blacklisted integers using a set for O(1) lookups. Print the final length.</p></div>
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
<h3>Write a function <code>has_duplicates(lst)</code> that returns True if a list contains duplicates, using sets. Do it in one line.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-93">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write a function <code>missing_numbers(lst, n)</code> that finds all missing numbers from <code>1</code> to <code>n</code> in a list. Use sets.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-95">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a function <code>intersection_multiple(*sets)</code> that returns the intersection of an arbitrary number of sets.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-97">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a function <code>symmetric_diff_multiple(*sets)</code> that finds elements present in exactly one of the sets.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-99">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a function <code>is_pangram(text)</code> that checks if a string contains every letter of the alphabet using sets.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-101">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Given two lists of dictionaries, find the symmetric difference based on a specific key (e.g., ''id'').</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-103">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a function <code>remove_duplicates_preserve_order(lst)</code> without using external libraries, but using a set for O(1) lookups.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-105">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Implement the Jaccard similarity index for two lists of items. Handle empty sets gracefully.</h3>
</div>
<div class="code-cell" id="cell-49">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-49'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-49'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-49"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-107">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a function that takes a string and returns the length of the longest substring without repeating characters (sliding window + set).</h3>
</div>
<div class="code-cell" id="cell-50">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-50'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-50'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-50"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-109">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a function <code>find_pairs_sum(lst, target)</code> that finds all unique pairs that sum to target, using a set for O(n) time.</h3>
</div>
<div class="code-cell" id="cell-51">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-51'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-51'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-51"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-111">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a function <code>find_common_chars(words)</code> that returns a list of characters present in all words in a list.</h3>
</div>
<div class="code-cell" id="cell-52">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-52'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-52'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-52"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-113">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write code to flatten a list of sets into a single set: <code>[{1,2}, {2,3}, {3,4}]</code> -> <code>{1,2,3,4}</code>.</h3>
</div>
<div class="code-cell" id="cell-53">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-53'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-53'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-53"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-115">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Explain the difference between <code>s.remove(x)</code> and <code>s.discard(x)</code>. Write a wrapper function <code>safe_remove(s, x)</code> that mimics discard using remove.</h3>
</div>
<div class="code-cell" id="cell-54">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-54'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-54'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-54"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-117">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a function <code>is_anagram_set_trap(s1, s2)</code> that shows why <code>set(s1) == set(s2)</code> is NOT a valid way to check for anagrams.</h3>
</div>
<div class="code-cell" id="cell-55">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-55'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-55'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-55"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-119">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Create a dictionary acting as an undirected graph, where edges are represented by frozensets. <code>frozenset([A, B]): weight</code>.</h3>
</div>
<div class="code-cell" id="cell-56">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-56'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-56'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-56"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-121">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Given a list of lists, deduplicate the inner lists. <code>[[1,2], [2,1], [3,4]]</code> -> <code>[[1,2], [3,4]]</code>. Use frozensets.</h3>
</div>
<div class="code-cell" id="cell-57">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-57'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-57'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-57"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-123">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a function <code>group_identical(lst)</code> that groups identical dictionaries in a list using frozensets of their items.</h3>
</div>
<div class="code-cell" id="cell-58">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-58'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-58'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-58"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-125">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a function <code>set_from_generator(n)</code> that creates a set of the first <code>n</code> prime numbers using a generator expression inside <code>set()</code>.</h3>
</div>
<div class="code-cell" id="cell-59">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-59'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-59'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-59"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-127">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Explain why <code>{[]}</code> raises a TypeError but <code>{()}</code> does not. Write code demonstrating this hashability concept.</h3>
</div>
<div class="code-cell" id="cell-60">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-60'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-60'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-60"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-129">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a function <code>longest_consecutive_sequence(nums)</code> that runs in O(n) time using a set.</h3>
</div>
<div class="code-cell" id="cell-61">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-61'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-61'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-61"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-131">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a function to find the elements that appear exactly once in an array where every other element appears twice. (Can use XOR or sets).</h3>
</div>
<div class="code-cell" id="cell-62">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-62'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-62'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-62"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-133">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a function <code>word_break(s, word_dict)</code> that checks if a string can be segmented into words from a dictionary. Convert dict to set.</h3>
</div>
<div class="code-cell" id="cell-63">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-63'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-63'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-63"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-135">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a function <code>is_bipartite(graph)</code> using two sets to color nodes and detect odd-length cycles.</h3>
</div>
<div class="code-cell" id="cell-64">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-64'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-64'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-64"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-137">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Implement a custom <code>MySet</code> class wrapping a dictionary to demonstrate how sets work under the hood.</h3>
</div>
<div class="code-cell" id="cell-65">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-65'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-65'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-65"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-139">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a function <code>count_unique_vowels(word)</code> using set intersection with <code>{''a'',''e'',''i'',''o'',''u''}</code>.</h3>
</div>
<div class="code-cell" id="cell-66">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-66'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-66'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-66"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 6 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th><th>Professional Application</th></tr></thead><tbody>
<tr><td>1</td><td>Creation</td><td><code>set()</code>, <code>{1, 2}</code>. Mutable, unordered.</td><td>Data deduplication</td></tr>
<tr><td>2</td><td>Operations</td><td>Union `</td><td><code>, Intersection </code>&<code>, Difference </code>-`</td><td>Cohort and overlap analysis</td></tr>
<tr><td>3</td><td>Methods</td><td><code>add</code>, <code>discard</code> (safe), <code>remove</code> (unsafe)</td><td>Incremental processing</td></tr>
<tr><td>4</td><td>Relations</td><td><code>issubset <=</code>, <code>issuperset >=</code></td><td>Data validation, permissions</td></tr>
<tr><td>5</td><td>Frozen Sets</td><td>Immutable, hashable sets</td><td>Sets of sets, Dict keys</td></tr>
<tr><td>6</td><td>Performance</td><td>O(1) membership testing (<code>in</code>)</td><td>Massive optimization over lists</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I understand that sets are unordered and cannot be accessed by index.</p>
<p>• [ ] I know how to deduplicate a list instantly using <code>set()</code>.</p>
<p>• [ ] I can perform union, intersection, and difference operations.</p>
<p>• [ ] I understand the difference between <code>.remove()</code> and <code>.discard()</code>.</p>
<p>• [ ] I know when to use a <code>frozenset</code> (dict keys, sets of sets).</p>
<p>• [ ] I understand why <code>in set</code> is exponentially faster than <code>in list</code>.</p>
<p>• [ ] I have completed all 5 practice tasks.</p>
<p>• [ ] I have reviewed all 25 interview questions.</p>
<p><strong>Next Up: Day 7 - Dictionaries: Key-Value Mappings, Iteration, and Data Structures</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Set Creation & Basics : Unordered, Unique Elements"}, {"anchor": "checks-Set Creation-3", "title": "\ud83e\uddea Checks: Set Creation"}, {"anchor": "sec-14", "title": "2. Set Theory Operations : Mathematical Relational Logic"}, {"anchor": "checks-Set Operations-16", "title": "\ud83e\uddea Checks: Set Operations"}, {"anchor": "sec-27", "title": "3. Set Methods & Modification : Dynamic Set Updates"}, {"anchor": "checks-Set Methods-29", "title": "\ud83e\uddea Checks: Set Methods"}, {"anchor": "sec-40", "title": "4. Subset & Superset Relations : Comparative Logic"}, {"anchor": "checks-Subset & Superset-42", "title": "\ud83e\uddea Checks: Subset & Superset"}, {"anchor": "sec-53", "title": "5. Frozen Sets : Immutable Sets"}, {"anchor": "checks-Frozen Sets-55", "title": "\ud83e\uddea Checks: Frozen Sets"}, {"anchor": "sec-66", "title": "6. Sets vs Lists : O(1) Lookups & Performance"}, {"anchor": "checks-Performance-68", "title": "\ud83e\uddea Checks: Performance"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-91", "title": "Q1."}, {"anchor": "sec-93", "title": "Q2."}, {"anchor": "sec-95", "title": "Q3."}, {"anchor": "sec-97", "title": "Q4."}, {"anchor": "sec-99", "title": "Q5."}, {"anchor": "sec-101", "title": "Q6."}, {"anchor": "sec-103", "title": "Q7."}, {"anchor": "sec-105", "title": "Q8."}, {"anchor": "sec-107", "title": "Q9."}, {"anchor": "sec-109", "title": "Q10."}, {"anchor": "sec-111", "title": "Q11."}, {"anchor": "sec-113", "title": "Q12."}, {"anchor": "sec-115", "title": "Q13."}, {"anchor": "sec-117", "title": "Q14."}, {"anchor": "sec-119", "title": "Q15."}, {"anchor": "sec-121", "title": "Q16."}, {"anchor": "sec-123", "title": "Q17."}, {"anchor": "sec-125", "title": "Q18."}, {"anchor": "sec-127", "title": "Q19."}, {"anchor": "sec-129", "title": "Q20."}, {"anchor": "sec-131", "title": "Q21."}, {"anchor": "sec-133", "title": "Q22."}, {"anchor": "sec-135", "title": "Q23."}, {"anchor": "sec-137", "title": "Q24."}, {"anchor": "sec-139", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48", "cell-49", "cell-50", "cell-51", "cell-52", "cell-53", "cell-54", "cell-55", "cell-56", "cell-57", "cell-58", "cell-59", "cell-60", "cell-61", "cell-62", "cell-63", "cell-64", "cell-65", "cell-66"]'::jsonb),
('day07', '🗂️ Dictionaries', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Dictionaries are the most critical data structure in modern programming. They map keys to values with lightning-fast O(1) lookups and are the exact equivalent of JSON objects. Today we master dictionary manipulation, safe extraction, functional comprehensions, and deep nested hierarchies. Mastery of dictionaries is non-negotiable for working with APIs and DataFrames.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Concept</th><th>Core Use Case</th></tr></thead><tbody>
<tr><td>1</td><td>Creation</td><td><code>{''k'': ''v''}</code>, <code>dict(k=''v'')</code></td><td>JSON modeling</td></tr>
<tr><td>2</td><td>Access & Safety</td><td><code>.get(k, default)</code></td><td>Avoid KeyError crashes</td></tr>
<tr><td>3</td><td>Views</td><td><code>.keys()</code>, <code>.values()</code>, <code>.items()</code></td><td>Fast dynamic views</td></tr>
<tr><td>4</td><td>Iteration</td><td><code>for k, v in d.items():</code></td><td>Data processing</td></tr>
<tr><td>5</td><td>Comprehensions</td><td><code>{k: v for k, v in data}</code></td><td>Transformation</td></tr>
<tr><td>6</td><td>Merging</td><td>`d1 \</td><td>d2<code>, </code>.update()`</td><td>Aggregating data</td></tr>
<tr><td>7</td><td>Nested Dicts</td><td>Deep hierarchical data</td><td>API Payloads</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Dictionary Creation & Basics : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Key-Value Mapping</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A dictionary is a <b>mutable, unordered collection of key-value pairs</b>. It is Python''s most powerful data structure, serving as the foundation for JSON parsing, DataFrames, and fast lookups. Keys must be <b>hashable</b> (strings, numbers, tuples), while values can be anything.</p>
<table>
<thead><tr><th>Creation Method</th><th>Example</th><th>Note</th></tr></thead><tbody>
<tr><td>Braces</td><td><code>{''a'': 1, ''b'': 2}</code></td><td>Standard literal</td></tr>
<tr><td><code>dict()</code> constructor</td><td><code>dict(a=1, b=2)</code></td><td>Clean for string keys</td></tr>
<tr><td>From pairs</td><td><code>dict([(''a'',1), (''b'',2)])</code></td><td>Converting lists of tuples</td></tr>
<tr><td><code>fromkeys()</code></td><td><code>dict.fromkeys([''a'',''b''], 0)</code></td><td>Initialize with defaults</td></tr>
<tr><td>Empty dict</td><td><code>{}</code> or <code>dict()</code></td><td>Empty dictionary</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>JSON Data</strong>: Dictionaries are the Python equivalent of JSON objects</p>
<p>• <strong>Fast Lookups</strong>: Looking up a value by its key is an O(1) operation</p>
<p>• <strong>Data Modeling</strong>: Representing real-world entities (e.g., a user profile)</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Mutable Keys</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>You cannot use a list or dictionary as a dictionary key because they are unhashable (mutable). You will get a <code>TypeError: unhashable type: ''list''</code>. Use tuples instead.</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Since Python 3.7, dictionaries maintain <b>insertion order</b>. But never rely on this for logic; if order matters explicitly, document it or use <code>collections.OrderedDict</code> for backward compatibility.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Creation methods
user = {
    &#x27;id&#x27;: 101,
    &#x27;name&#x27;: &#x27;Alice&#x27;,
    &#x27;active&#x27;: True
}

# dict() constructor (keys become strings automatically)
config = dict(host=&#x27;localhost&#x27;, port=8080, debug=False)

# fromkeys for initialization
metrics = dict.fromkeys([&#x27;clicks&#x27;, &#x27;views&#x27;, &#x27;sales&#x27;], 0)

print(f&#x27;User: {user}&#x27;)
print(f&#x27;Config: {config}&#x27;)
print(f&#x27;Metrics: {metrics}&#x27;)

# Fast lookup
print(f&#x27;User Name: {user[&quot;name&quot;]}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Dictionary Creation-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Dictionary Creation</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a dictionary representing a book with keys: <code>title</code>, <code>author</code>, <code>year</code>. Print the dictionary and its type.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a dictionary using the <code>dict()</code> constructor with kwargs for <code>x=10, y=20, z=30</code>. Print it.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>dict.fromkeys()</code> to initialize a dictionary with keys <code>["mon", "tue", "wed"]</code> and default value <code>None</code>. Print it.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Try to create a dictionary with a list as a key: <code>{[1, 2]: "value"}</code>. Catch the <code>TypeError</code> and print the error message.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Fix the previous code by using a tuple instead of a list for the key. Print the valid dictionary.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Accessing & Modifying Data : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Safe Lookups & Updates</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>You can access values using <code>dict[key]</code>, but if the key doesn''t exist, it raises a <code>KeyError</code>. To safely access data, use the <b><code>.get(key, default)</code></b> method. To add or modify, simply assign <code>dict[key] = value</code>.</p>
<table>
<thead><tr><th>Operation</th><th>Syntax</th><th>Behavior</th></tr></thead><tbody>
<tr><td>Unsafe Access</td><td><code>d[''key'']</code></td><td>Returns value or raises <code>KeyError</code></td></tr>
<tr><td>Safe Access</td><td><code>d.get(''key'')</code></td><td>Returns value or <code>None</code> (no error)</td></tr>
<tr><td>Safe w/ Default</td><td><code>d.get(''key'', 0)</code></td><td>Returns value or <code>0</code></td></tr>
<tr><td>Add / Modify</td><td><code>d[''key''] = val</code></td><td>Creates new or overwrites existing</td></tr>
<tr><td>Delete</td><td><code>del d[''key'']</code></td><td>Removes key-value pair</td></tr>
<tr><td>Pop & Return</td><td><code>d.pop(''key'')</code></td><td>Removes and returns the value</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>API Parsing</strong>: APIs often have missing fields. Use <code>.get()</code> to avoid crashing your pipeline</p>
<p>• <strong>Counter Patterns</strong>: <code>d[key] = d.get(key, 0) + 1</code> is the standard way to count frequencies</p>
<p>• <strong>Configuration Defaults</strong>: <code>port = config.get(''port'', 80)</code> applies safe default values</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ KeyError Crashes</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>data[''missing_key'']</code> is the #1 cause of crashes in data pipelines. Always use <code>.get()</code> when parsing external data.
</div></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">record = {&#x27;id&#x27;: 1, &#x27;name&#x27;: &#x27;DataPipeline&#x27;}

# Adding and Modifying
record[&#x27;status&#x27;] = &#x27;running&#x27;  # Add new
record[&#x27;id&#x27;] = 2              # Overwrite
print(f&#x27;Updated: {record}&#x27;)

# Safe access
# print(record[&#x27;owner&#x27;])      # CRASH! KeyError
print(record.get(&#x27;owner&#x27;))    # None
print(record.get(&#x27;owner&#x27;, &#x27;Admin&#x27;))  # &#x27;Admin&#x27; (fallback)

# Deleting
del record[&#x27;status&#x27;]
removed_id = record.pop(&#x27;id&#x27;)
print(f&#x27;Popped ID: {removed_id}&#x27;)
print(f&#x27;Final: {record}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Access & Modification-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Access & Modification</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>user = {"name": "Alice"}</code>, add a new key <code>"age"</code> with value <code>28</code>. Then update <code>"name"</code> to <code>"Alice Smith"</code>. Print the dict.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Demonstrate <code>KeyError</code>: try to access <code>user["city"]</code> in a try/except block. Print the error message.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>.get()</code> to safely access <code>"city"</code> with a default value of <code>"Unknown"</code>. Print the result.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write the standard counting pattern: given <code>counts = {"a": 1}</code>, increment <code>"b"</code> by 1 using <code>counts["b"] = counts.get("b", 0) + 1</code>. Print the dict.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>.pop()</code> to remove <code>"name"</code> from <code>user</code> and save it to a variable. Print the popped value and the remaining dictionary.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Dictionary Views : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Keys, Values, and Items</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Dictionaries provide dynamic <b>view objects</b> through three methods: <code>.keys()</code>, <code>.values()</code>, and <code>.items()</code>. These views update automatically when the dictionary changes and are fast and memory-efficient.</p>
<table>
<thead><tr><th>Method</th><th>Returns View Of</th><th>Example Use</th></tr></thead><tbody>
<tr><td><code>.keys()</code></td><td>All keys</td><td>Checking membership: <code>''age'' in d.keys()</code></td></tr>
<tr><td><code>.values()</code></td><td>All values</td><td>Statistics: <code>sum(d.values())</code></td></tr>
<tr><td><code>.items()</code></td><td><code>(key, value)</code> tuples</td><td>Iteration: <code>for k, v in d.items():</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Column Checks</strong>: Check if expected columns exist in a data record using <code>.keys()</code></p>
<p>• <strong>Data Extraction</strong>: Extract all metric values for analysis using <code>.values()</code></p>
<p>• <strong>Transformation</strong>: Iterate over <code>.items()</code> to apply a function to all values</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Views are not Lists</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Views don''t support indexing. <code>d.keys()[0]</code> raises a <code>TypeError</code>. If you need a list, explicitly convert it: <code>list(d.keys())</code>.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">scores = {&#x27;math&#x27;: 95, &#x27;physics&#x27;: 88, &#x27;chem&#x27;: 92}

# View objects
keys = scores.keys()
vals = scores.values()
items = scores.items()

print(f&#x27;Keys: {keys}&#x27;)
print(f&#x27;Values: {vals}&#x27;)
print(f&#x27;Items: {items}&#x27;)

# Views are dynamic!
scores[&#x27;biology&#x27;] = 90
print(f&#x27;\nAfter adding biology, keys view auto-updated: \n{keys}&#x27;)

# Need a list? Convert it explicitly
key_list = list(keys)
print(f&#x27;First key: {key_list[0]}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Dictionary Views-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Dictionary Views</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>data = {"a": 10, "b": 20, "c": 30}</code>, extract the values and calculate their sum. Print the sum.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Check if the key <code>"d"</code> exists in <code>data.keys()</code>. Print the boolean result.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Convert <code>data.items()</code> to a list of tuples. Print the list.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Prove views are dynamic: assign <code>view = data.values()</code>, add <code>"d": 40</code> to <code>data</code>, then print <code>view</code>. Note how it updated.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Try to access <code>data.keys()[0]</code>. Catch the TypeError and print the error message. Show the correct way by converting to a list first.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-40">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>4. Iteration Patterns : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Looping over Dictionaries</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Iterating directly over a dictionary loops over its <b>keys</b>. To loop over both keys and values, use <code>.items()</code>. This is the most common and Pythonic way to process dictionary data.</p>
<pre class="nb-code-block"><code># ❌ Bad: Looping keys to get values
for k in d:
    v = d[k]  # Inefficient lookup

# ✅ Good: Unpacking items directly
for k, v in d.items():
    print(k, v)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Formatting Output</strong>: Printing structured reports of metrics or configuration</p>
<p>• <strong>Data Cleaning</strong>: Iterating over items to clean strings or convert types</p>
<p>• <strong>Filtering</strong>: Looping to build a new dictionary with specific key-value pairs</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>You cannot add or remove keys from a dictionary while iterating over it. It will raise a <code>RuntimeError: dictionary changed size during iteration</code>. If you must modify keys, iterate over a copy or build a new dictionary.</p>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19">config = {&#x27;host&#x27;: &#x27;localhost&#x27;, &#x27;port&#x27;: 5432, &#x27;user&#x27;: &#x27;admin&#x27;}

# Default iteration is keys
print(&quot;Keys only:&quot;)
for k in config:
    print(f&quot;- {k}&quot;)

# Iterating values
print(&quot;\nValues only:&quot;)
for v in config.values():
    print(f&quot;- {v}&quot;)

# The Pythonic Way: items() unpacking
print(&quot;\nItems (Keys &amp; Values):&quot;)
for key, value in config.items():
    print(f&quot;{key.upper()}: {value}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Iteration-42">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Iteration</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Iterate over <code>prices = {"apple": 1.2, "banana": 0.5}</code> and print just the keys using a standard <code>for</code> loop.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Iterate over <code>prices.values()</code> and print each value formatted as currency (e.g., <code>$1.20</code>).</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>.items()</code> to iterate over <code>prices</code> and print <code>"[Item] costs $[Price]"</code>.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a loop over <code>.items()</code> that creates a new dictionary <code>expensive</code> containing only items costing more than <code>$1.00</code>. Print it.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Demonstrate the RuntimeError: try to <code>del d[k]</code> while iterating over <code>d = {"a":1, "b":2}</code>. Catch the error and print it.</p></div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-53">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>5. Dictionary Comprehensions : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Functional Dictionary Creation</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Just like list comprehensions, <b>dictionary comprehensions</b> provide a concise way to create dictionaries from iterables. The syntax is <code>{key: value for item in iterable if condition}</code>.</p>
<pre class="nb-code-block"><code># Square numbers mapping
squares = {x: x**2 for x in range(5)}
# {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data Transformation</strong>: Convert a list of records into a dictionary keyed by ID for fast lookups</p>
<p>• <strong>Filtering Dictionaries</strong>: <code>{k: v for k, v in data.items() if v > 0}</code> — clean negative values</p>
<p>• <strong>Key Mapping</strong>: Mapping original column names to new clean column names</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>A very common pattern for fast lookups: <code>lookup = {row[''id'']: row for row in dataset}</code>. This converts an O(n) search into an O(1) dictionary lookup.</p>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25">names = [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;]

# Create dict mapping name to its length
name_lengths = {name: len(name) for name in names}
print(f&#x27;Lengths: {name_lengths}&#x27;)

# Filtering an existing dictionary
prices = {&#x27;apple&#x27;: 1.2, &#x27;banana&#x27;: 0.5, &#x27;cherry&#x27;: 2.5}
expensive = {k: v for k, v in prices.items() if v &gt; 1.0}
print(f&#x27;Expensive items: {expensive}&#x27;)

# Swapping keys and values
original = {&#x27;a&#x27;: 1, &#x27;b&#x27;: 2, &#x27;c&#x27;: 3}
swapped = {v: k for k, v in original.items()}
print(f&#x27;Swapped: {swapped}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Dict Comprehensions-55">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Dict Comprehensions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a dictionary comprehension that maps numbers 1-5 to their cubes (<code>x**3</code>). Print it.</p></div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>keys = ["a", "b", "c"]</code> and <code>values = [1, 2, 3]</code>, use <code>zip()</code> in a comprehension to create a dictionary. Print it.</p></div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Filter <code>data = {"x": -5, "y": 10, "z": -2, "w": 15}</code> to keep only positive values using a comprehension. Print the result.</p></div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Swap keys and values in <code>codes = {"NY": "New York", "CA": "California"}</code> using a comprehension. Print the result.</p></div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Create a dictionary mapping each character in <code>"Data Science"</code> to its uppercase version. Notice what happens to duplicate characters. Print it.</p></div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>6. Merging & Updating : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Combining Dictionaries</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python provides multiple ways to combine dictionaries. <code>dict.update()</code> modifies in-place. Python 3.9+ introduced the <b>merge operator <code>|</code></b> which creates a new dictionary.</p>
<table>
<thead><tr><th>Operation</th><th>Syntax</th><th>Effect</th></tr></thead><tbody>
<tr><td>Update in-place</td><td><code>d1.update(d2)</code></td><td><code>d1</code> is modified. <code>d2</code> keys overwrite <code>d1</code>. Returns <code>None</code>.</td></tr>
<tr><td>Merge operator (3.9+)</td><td>`d3 = d1 \</td><td>d2`</td><td>Creates new dict <code>d3</code>. <code>d2</code> overwrites <code>d1</code>.</td></tr>
<tr><td>Unpacking</td><td><code>d3 = {<strong>d1, </strong>d2}</code></td><td>Creates new dict. Pre-3.9 equivalent of `\</td><td>`.</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Configuration Management</strong>: Merge <code>default_config</code> with <code>user_config</code> (user overrides default)</p>
<p>• <strong>Aggregating Data</strong>: Combining parsed JSON objects from multiple API endpoints</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Right Wins</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>When merging, if the same key exists in both dictionaries, the value from the dictionary on the <b>right side</b> (or passed to <code>.update()</code>) wins.</p>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31">defaults = {&#x27;theme&#x27;: &#x27;light&#x27;, &#x27;port&#x27;: 8080, &#x27;debug&#x27;: False}
user_prefs = {&#x27;theme&#x27;: &#x27;dark&#x27;, &#x27;verbose&#x27;: True}

# 1. Update in-place
active_config = defaults.copy()
active_config.update(user_prefs)
print(f&#x27;Update: {active_config}&#x27;)

# 2. Merge operator (Python 3.9+)
merged_config = defaults | user_prefs
print(f&#x27;Merge |: {merged_config}&#x27;)

# 3. Kwargs unpacking (older Python)
unpacked = {**defaults, **user_prefs}
print(f&#x27;Unpacked: {unpacked}&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Merging & Updating-68">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Merging & Updating</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Merge <code>d1 = {"a": 1, "b": 2}</code> and <code>d2 = {"b": 99, "c": 3}</code> using <code>.update()</code>. Note the value of <code>"b"</code>. Print <code>d1</code>.</p></div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Merge the same dictionaries using the <code>|</code> operator into a new dict <code>d3</code>. Print <code>d3</code>.</p></div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Merge three dictionaries <code>d1</code>, <code>d2</code>, <code>d3 = {"d": 4}</code> using kwargs unpacking <code>{<strong>d1, </strong>d2, **d3}</code>. Print the result.</p></div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Try to merge a dictionary and a list <code>{"a": 1} | ["b", 2]</code>. Catch the TypeError and print it.</p></div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a function <code>apply_defaults(config, defaults)</code> that returns a new config where <code>config</code> values override <code>defaults</code>. Test it.</p></div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-79">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>7. Nested Dictionaries : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">JSON & Deep Data</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A dictionary can contain other dictionaries (or lists, sets, etc.) as values. This is essential for working with hierarchical data like <b>JSON</b> or <b>NoSQL document databases</b>.</p>
<pre class="nb-code-block"><code>users = {
    &#x27;u1&#x27;: {&#x27;name&#x27;: &#x27;Alice&#x27;, &#x27;role&#x27;: &#x27;Admin&#x27;},
    &#x27;u2&#x27;: {&#x27;name&#x27;: &#x27;Bob&#x27;, &#x27;role&#x27;: &#x27;User&#x27;}
}
# Access nested data
alice_role = users[&#x27;u1&#x27;][&#x27;role&#x27;]</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>API Parsing</strong>: Traversing complex JSON responses from web services</p>
<p>• <strong>Document Storage</strong>: Representing MongoDB documents in memory</p>
<p>• <strong>Configuration Trees</strong>: Hierarchical settings (e.g., <code>config[''database''][''host'']</code>)</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Deep Missing Keys</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Accessing <code>data[''user''][''address''][''zip'']</code> will crash if <i>any</i> key in the chain is missing. Use chained <code>.get()</code> or handle exceptions.</p>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37">import json

# JSON-like nested structure
api_response = {
    &#x27;status&#x27;: 200,
    &#x27;data&#x27;: {
        &#x27;user&#x27;: {&#x27;id&#x27;: 101, &#x27;name&#x27;: &#x27;Alice&#x27;},
        &#x27;permissions&#x27;: [&#x27;read&#x27;, &#x27;write&#x27;]
    }
}

# Accessing deep data
user_name = api_response[&#x27;data&#x27;][&#x27;user&#x27;][&#x27;name&#x27;]
perms = api_response[&#x27;data&#x27;][&#x27;permissions&#x27;]
print(f&#x27;User: {user_name}, Perms: {perms}&#x27;)

# Safe deep access (avoid KeyError)
data_obj = api_response.get(&#x27;data&#x27;, {})
address = data_obj.get(&#x27;user&#x27;, {}).get(&#x27;address&#x27;, &#x27;No Address&#x27;)
print(f&#x27;Address: {address}&#x27;)

# Pretty printing nested dicts
print(&quot;\nPretty printed:&quot;)
print(json.dumps(api_response, indent=2))</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Nested Dictionaries-81">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Nested Dictionaries</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a nested dictionary representing a company with two departments (<code>"Sales"</code>, <code>"Engineering"</code>), each containing a list of employee names. Print it.</p></div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Access and print the first employee in the <code>"Engineering"</code> department from the dictionary above.</p></div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Add a new department <code>"HR"</code> with an empty list of employees to the company dictionary. Print the updated dict.</p></div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Safely extract <code>"city"</code> from <code>data = {"user": {"id": 1}}</code> using chained <code>.get()</code> to avoid KeyError. Print the default <code>"Unknown"</code>.</p></div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>json.dumps(dict, indent=4)</code> to pretty-print your company dictionary. Print the result.</p></div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Frequency Counter):</strong> Write a function <code>count_words(text)</code> that takes a string, splits it into words (lowercase), and returns a dictionary of word frequencies. Handle punctuation if you can. Test with a short paragraph.</p></div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Dict Inverter):</strong> Write a function <code>invert_dict(d)</code> that swaps keys and values. Since multiple keys might have the same value, the new dictionary should map <code>value -> list_of_keys</code>. Test with <code>{''a'':1, ''b'':2, ''c'':1}</code>.</p></div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (JSON Path Extractor):</strong> Write a function <code>extract_path(data, path_list)</code> that safely navigates a nested dict. <code>extract_path(data, [''user'', ''address'', ''city''])</code>. Return <code>None</code> if any key is missing.</p></div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Data Grouper):</strong> Given a list of dictionaries <code>[{''dept'': ''HR'', ''name'': ''Alice''}, {''dept'': ''IT'', ''name'': ''Bob''}, {''dept'': ''HR'', ''name'': ''Charlie''}]</code>, write code to group them by department: <code>{''HR'': [''Alice'', ''Charlie''], ''IT'': [''Bob'']}</code>.</p></div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Config Merger):</strong> Write a function <code>deep_merge(d1, d2)</code> that merges two dictionaries. If a key contains a nested dictionary in both, recursively merge them. Otherwise, <code>d2</code> overwrites <code>d1</code>.</p></div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-104">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a function <code>two_sum(nums, target)</code> using a dictionary to find the pair of indices in O(n) time.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-106">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write a function <code>is_isomorphic(s, t)</code> that checks if two strings are isomorphic using a dictionary mapping.</h3>
</div>
<div class="code-cell" id="cell-49">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-49'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-49'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-49"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-108">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a function <code>lru_cache_simulation(queries, capacity)</code> using <code>collections.OrderedDict</code> to track recently used keys.</h3>
</div>
<div class="code-cell" id="cell-50">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-50'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-50'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-50"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-110">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a function <code>group_anagrams(strs)</code> using a dictionary where the key is the sorted string and the value is a list of anagrams.</h3>
</div>
<div class="code-cell" id="cell-51">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-51'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-51'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-51"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-112">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a function <code>first_unique_char(s)</code> using a dictionary to count frequencies, then a second pass to find the first with count 1.</h3>
</div>
<div class="code-cell" id="cell-52">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-52'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-52'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-52"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-114">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Implement a <code>Trie</code> (Prefix Tree) data structure using nested dictionaries. Include <code>insert</code> and <code>search</code> methods.</h3>
</div>
<div class="code-cell" id="cell-53">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-53'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-53'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-53"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-116">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a function <code>find_itinerary(tickets)</code> given a list of <code>(source, dest)</code> tuples, reconstruct the full itinerary using a dict.</h3>
</div>
<div class="code-cell" id="cell-54">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-54'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-54'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-54"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-118">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a function <code>contains_duplicate_nearby(nums, k)</code> checking if duplicate values exist within distance <code>k</code> using a dict.</h3>
</div>
<div class="code-cell" id="cell-55">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-55'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-55'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-55"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-120">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a function <code>longest_consecutive_sequence(nums)</code> using a dictionary/set for O(n) time complexity.</h3>
</div>
<div class="code-cell" id="cell-56">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-56'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-56'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-56"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-122">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a function <code>sort_characters_by_frequency(s)</code> returning a string with characters sorted by decreasing frequency.</h3>
</div>
<div class="code-cell" id="cell-57">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-57'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-57'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-57"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-124">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a function <code>subarray_sum(nums, k)</code> that finds the total number of continuous subarrays whose sum equals <code>k</code>. Use a dict to store prefix sums.</h3>
</div>
<div class="code-cell" id="cell-58">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-58'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-58'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-58"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-126">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write a function <code>roman_to_int(s)</code> using a dictionary to map Roman numerals to integers.</h3>
</div>
<div class="code-cell" id="cell-59">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-59'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-59'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-59"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-128">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write a function <code>majority_element(nums)</code> using a dictionary to count frequencies and find the element appearing > n/2 times.</h3>
</div>
<div class="code-cell" id="cell-60">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-60'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-60'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-60"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-130">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Implement an <code>LFUCache</code> (Least Frequently Used) using combinations of dictionaries for O(1) operations.</h3>
</div>
<div class="code-cell" id="cell-61">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-61'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-61'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-61"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-132">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a function <code>design_hashmap()</code> from scratch using a list of lists (chaining) without using the built-in dictionary.</h3>
</div>
<div class="code-cell" id="cell-62">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-62'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-62'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-62"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-134">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write a function <code>word_pattern(pattern, s)</code> using dictionaries to check a bijective mapping between a pattern and words.</h3>
</div>
<div class="code-cell" id="cell-63">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-63'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-63'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-63"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-136">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a function <code>find_all_anagrams_in_string(s, p)</code> using sliding window and dictionaries to count characters.</h3>
</div>
<div class="code-cell" id="cell-64">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-64'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-64'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-64"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-138">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a function <code>flatten_nested_dict(d)</code> that flattens <code>{''a'': {''b'': 1}}</code> into <code>{''a.b'': 1}</code>.</h3>
</div>
<div class="code-cell" id="cell-65">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-65'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-65'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-65"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-140">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a function <code>dict_difference(d1, d2)</code> returning keys added, removed, and modified between two dictionaries.</h3>
</div>
<div class="code-cell" id="cell-66">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-66'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-66'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-66"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-142">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a function <code>top_k_frequent_elements(nums, k)</code> using a dictionary and sorting/heap.</h3>
</div>
<div class="code-cell" id="cell-67">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-67'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-67'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-67"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-144">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Explain the internal implementation of a Python dictionary (Hash Table, open addressing, PyDictObject).</h3>
</div>
<div class="code-cell" id="cell-68">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-68'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-68'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-68"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-146">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a function <code>check_valid_sudoku(board)</code> using dictionaries/sets to track seen numbers in rows, columns, and 3x3 grids.</h3>
</div>
<div class="code-cell" id="cell-69">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-69'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-69'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-69"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-148">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a function <code>minimum_window_substring(s, t)</code> using a dictionary to track character counts in a sliding window.</h3>
</div>
<div class="code-cell" id="cell-70">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-70'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-70'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-70"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-150">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a function <code>find_duplicate_file(paths)</code> grouping identical file contents (using content hash as dict key).</h3>
</div>
<div class="code-cell" id="cell-71">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-71'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-71'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-71"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-152">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Implement <code>defaultdict</code> behavior manually by subclassing <code>dict</code> and overriding the <code><strong>missing</strong></code> method.</h3>
</div>
<div class="code-cell" id="cell-72">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-72'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-72'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-72"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 7 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th><th>Professional Application</th></tr></thead><tbody>
<tr><td>1</td><td>Creation</td><td>Key-Value pairs, hashable keys, O(1) lookup</td><td>JSON modeling, caching</td></tr>
<tr><td>2</td><td>Access/Modify</td><td>Use <code>.get(key, default)</code> for safety</td><td>Robust API parsing</td></tr>
<tr><td>3</td><td>Views</td><td><code>keys()</code>, <code>values()</code>, <code>items()</code> are dynamic</td><td>Data extraction</td></tr>
<tr><td>4</td><td>Iteration</td><td><code>for k, v in d.items():</code> is standard</td><td>Data transformation loops</td></tr>
<tr><td>5</td><td>Comprehensions</td><td><code>{k: v for ...}</code> creates dicts cleanly</td><td>Fast filtering & mapping</td></tr>
<tr><td>6</td><td>Merging</td><td>`d1 \</td><td>d2<code> or </code>.update()`</td><td>Combining configurations</td></tr>
<tr><td>7</td><td>Nested Dicts</td><td>Dicts inside dicts represent JSON</td><td>NoSQL, complex payloads</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I understand why dictionary keys must be immutable (hashable).</p>
<p>• [ ] I know to use <code>.get()</code> to safely extract data without crashing.</p>
<p>• [ ] I can iterate efficiently using <code>.items()</code>.</p>
<p>• [ ] I can create dictionaries quickly using dictionary comprehensions.</p>
<p>• [ ] I know how to merge two dictionaries using the <code>|</code> operator or <code>.update()</code>.</p>
<p>• [ ] I understand how to navigate nested dictionaries (JSON objects).</p>
<p>• [ ] I have completed all 5 practice tasks.</p>
<p>• [ ] I have reviewed all 25 interview questions.</p>
<p><strong>Next Up: Day 8 - Control Flow: Advanced If/Else, Match-Case, and Logic Design</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Dictionary Creation & Basics : Key-Value Mapping"}, {"anchor": "checks-Dictionary Creation-3", "title": "\ud83e\uddea Checks: Dictionary Creation"}, {"anchor": "sec-14", "title": "2. Accessing & Modifying Data : Safe Lookups & Updates"}, {"anchor": "checks-Access & Modification-16", "title": "\ud83e\uddea Checks: Access & Modification"}, {"anchor": "sec-27", "title": "3. Dictionary Views : Keys, Values, and Items"}, {"anchor": "checks-Dictionary Views-29", "title": "\ud83e\uddea Checks: Dictionary Views"}, {"anchor": "sec-40", "title": "4. Iteration Patterns : Looping over Dictionaries"}, {"anchor": "checks-Iteration-42", "title": "\ud83e\uddea Checks: Iteration"}, {"anchor": "sec-53", "title": "5. Dictionary Comprehensions : Functional Dictionary Creation"}, {"anchor": "checks-Dict Comprehensions-55", "title": "\ud83e\uddea Checks: Dict Comprehensions"}, {"anchor": "sec-66", "title": "6. Merging & Updating : Combining Dictionaries"}, {"anchor": "checks-Merging & Updating-68", "title": "\ud83e\uddea Checks: Merging & Updating"}, {"anchor": "sec-79", "title": "7. Nested Dictionaries : JSON & Deep Data"}, {"anchor": "checks-Nested Dictionaries-81", "title": "\ud83e\uddea Checks: Nested Dictionaries"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-104", "title": "Q1."}, {"anchor": "sec-106", "title": "Q2."}, {"anchor": "sec-108", "title": "Q3."}, {"anchor": "sec-110", "title": "Q4."}, {"anchor": "sec-112", "title": "Q5."}, {"anchor": "sec-114", "title": "Q6."}, {"anchor": "sec-116", "title": "Q7."}, {"anchor": "sec-118", "title": "Q8."}, {"anchor": "sec-120", "title": "Q9."}, {"anchor": "sec-122", "title": "Q10."}, {"anchor": "sec-124", "title": "Q11."}, {"anchor": "sec-126", "title": "Q12."}, {"anchor": "sec-128", "title": "Q13."}, {"anchor": "sec-130", "title": "Q14."}, {"anchor": "sec-132", "title": "Q15."}, {"anchor": "sec-134", "title": "Q16."}, {"anchor": "sec-136", "title": "Q17."}, {"anchor": "sec-138", "title": "Q18."}, {"anchor": "sec-140", "title": "Q19."}, {"anchor": "sec-142", "title": "Q20."}, {"anchor": "sec-144", "title": "Q21."}, {"anchor": "sec-146", "title": "Q22."}, {"anchor": "sec-148", "title": "Q23."}, {"anchor": "sec-150", "title": "Q24."}, {"anchor": "sec-152", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48", "cell-49", "cell-50", "cell-51", "cell-52", "cell-53", "cell-54", "cell-55", "cell-56", "cell-57", "cell-58", "cell-59", "cell-60", "cell-61", "cell-62", "cell-63", "cell-64", "cell-65", "cell-66", "cell-67", "cell-68", "cell-69", "cell-70", "cell-71", "cell-72"]'::jsonb),
('day08', '🔀 Conditionals', '<div class="nb-section" id="sec-0">
<h1><strong>1 . if / elif / else :</strong> Branching Logic</h1>
<h3>🔍 What are Branching Statements?</h3>
<p>Python uses <code>if</code>, <code>elif</code>, and <code>else</code> to control the flow of execution based on boolean conditions. The blocks of code are defined strictly by indentation (usually 4 spaces).</p>
<h3>💼 Why Data Analysts Care</h3>
<p>• <strong>Business Rules</strong>: Categorizing a user''s age into demographics (e.g., <code><18</code> is Minor, <code>18-65</code> is Adult).</p>
<p>• <strong>Data Filtering</strong>: Determining whether a specific row of data should be included in a final calculation based on specific thresholds.</p>
<h3>⚠️ Common Pitfall</h3>
<p>Using <code>== True</code> or <code>== False</code> is redundant. Instead of <code>if user_is_active == True:</code>, simply write <code>if user_is_active:</code>. Python natively evaluates the ''truthiness'' of any object.</p>
<h3>🧠 Under the Hood</h3>
<p>The <code>elif</code> chain evaluates conditions sequentially from the top down. The very first condition that evaluates to <code>True</code> will execute its block, and Python will immediately skip the remainder of the chain. Reordering the conditions can completely change the output!</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">score = 82

if score &gt;= 90:
    grade = &#x27;A&#x27;
elif score &gt;= 80:
    grade = &#x27;B&#x27;
elif score &gt;= 70:
    grade = &#x27;C&#x27;
elif score &gt;= 60:
    grade = &#x27;D&#x27;
else:
    grade = &#x27;F&#x27;
print(f&#x27;Score: {score} → Grade: {grade}&#x27;)  # B

# Truthiness checks
data = []
if not data:
    print(&#x27;Empty dataset — nothing to process&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Check-2">
<div class="concept-header"><h3>🧪 Concept Checks: <code>Check</code></h3></div>
<div class="question"><p><strong>Q1.</strong> Write an <code>if/elif/else</code> chain that classifies BMI: <18.5 Underweight, 18.5-24.9 Normal, 25-29.9 Overweight, 30+ Obese. Test with <code>bmi=27.5</code>.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write code checking if a year is a leap year: divisible by 4 AND (not by 100 OR by 400). Test <code>2024, 1900, 2000</code>. Print result for each.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write an <code>if</code> that checks multiple conditions: <code>age >= 18 and has_license and not suspended</code>. Test with 3 combinations. Print ''Can drive'' or reason why not.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Show the difference between <code>if/elif/elif</code> (stops at first match) vs three separate <code>if</code> statements (checks all). Test with <code>score=95</code> matching multiple ranges.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write nested <code>if</code> statements: outer checks if number is positive/negative/zero, inner checks if even/odd (for non-zero). Test with <code>-7, 0, 12</code>.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-13">
<h1><strong>2 . Ternary Expression :</strong> Inline Conditions</h1>
<h3>🔍 What is a Ternary Expression?</h3>
<p>It allows you to assign a value based on a condition in a single line. The syntax is: <code>value_if_true if condition else value_if_false</code>.</p>
<h3>💼 Why Data Analysts Care</h3>
<p>• <strong>List Comprehensions</strong>: Applying conditional logic during data transformations: <code>[''Pass'' if x > 60 else ''Fail'' for x in scores]</code>.</p>
<p>• <strong>f-strings</strong>: Directly rendering different outputs based on state: <code>f"User is {''Active'' if is_active else ''Inactive''}"</code>.</p>
<h3>⚠️ Common Pitfall</h3>
<p>Do not nest ternary operators deeply (e.g., <code>A if cond1 else B if cond2 else C</code>). It severely hurts readability. If you need more than one <code>else if</code>, use a standard block.</p>
<h3>🧠 Pro Tip</h3>
<p>Ternary expressions always return a value. You cannot put statements (like <code>pass</code>, <code>break</code>, or assignment <code>x = 5</code>) inside the return values of a ternary expression.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7"># Simple ternary
status = &#x27;pass&#x27; if score &gt;= 60 else &#x27;fail&#x27;
print(status)

# In f-string
print(f&#x27;Status: {&quot;Active&quot; if True else &quot;Inactive&quot;}&#x27;)

# In list comprehension
scores = [45, 72, 88, 55, 91]
labels = [&#x27;pass&#x27; if s &gt;= 60 else &#x27;fail&#x27; for s in scores]
print(labels)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Check-15">
<div class="concept-header"><h3>🧪 Concept Checks: <code>Check</code></h3></div>
<div class="question"><p><strong>Q1.</strong> Write a ternary expression: <code>status = ''Adult'' if age >= 18 else ''Minor''</code>. Test with <code>age=15</code> and <code>age=25</code>. Print both results.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a nested ternary: classify score as <code>''A'' if s>=90 else ''B'' if s>=80 else ''C'' if s>=70 else ''F''</code>. Test with 95, 85, 65. Discuss readability.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use ternary in a list comprehension: <code>[''even'' if x%2==0 else ''odd'' for x in range(1,6)]</code>. Print result: <code>[''odd'',''even'',''odd'',''even'',''odd'']</code>.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use ternary with function calls: <code>result = process_valid(x) if validate(x) else handle_error(x)</code>. Write the helper functions and test.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a ternary for default values: <code>name = user_input if user_input else ''Anonymous''</code>. Compare with <code>name = user_input or ''Anonymous''</code>. Are they equivalent?</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-26">
<h1><strong>3 . Match-Case :</strong> Structural Pattern Matching (Python 3.10+)</h1>
<h3>🔍 What is Match-Case?</h3>
<p>Introduced in Python 3.10, <code>match-case</code> is much more than a <code>switch</code> statement. It enables structural pattern matching, allowing you to match variable types, sequence structures, and dict keys.</p>
<h3>💼 Why Data Analysts Care</h3>
<p>• <strong>API Parsing</strong>: When an API returns dictionaries with different schemas based on the event type, <code>match-case</code> routes them perfectly.</p>
<p>• <strong>Complex Dispatch</strong>: Replacing huge blocks of <code>elif</code> chains when parsing commands or states.</p>
<h3>⚠️ Common Pitfall</h3>
<p>Unlike C++ or Java, Python''s <code>match-case</code> does NOT fall through. Once a case is matched and its block executes, the match block terminates. There is no need for <code>break</code>.</p>
<h3>🧠 Under the Hood</h3>
<p>The wildcard <code>case _:</code> acts as the ultimate default. It must always be placed at the very bottom of the <code>match</code> block. Furthermore, you can capture variables directly in the case pattern: <code>case [x, y]: print(x)</code>.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">command = &#x27;quit&#x27;

match command:
    case &#x27;start&#x27;:
        print(&#x27;Starting pipeline...&#x27;)
    case &#x27;stop&#x27; | &#x27;quit&#x27;:
        print(&#x27;Shutting down...&#x27;)
    case &#x27;status&#x27;:
        print(&#x27;All systems operational&#x27;)
    case _:
        print(f&#x27;Unknown command: {command}&#x27;)

# Match on type/structure
point = (0, 1)
match point:
    case (0, 0): print(&#x27;Origin&#x27;)
    case (x, 0): print(f&#x27;On X-axis at {x}&#x27;)
    case (0, y): print(f&#x27;On Y-axis at {y}&#x27;)
    case (x, y): print(f&#x27;Point ({x}, {y})&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Check-28">
<div class="concept-header"><h3>🧪 Concept Checks: <code>Check</code></h3></div>
<div class="question"><p><strong>Q1.</strong> Write a <code>match/case</code> for HTTP status codes: 200→''OK'', 404→''Not Found'', 500→''Server Error'', _→''Unknown''. Test with 4 codes.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>match/case</code> with pattern matching on a tuple: <code>match (x, y):</code> with cases <code>(0,0)→''origin''</code>, <code>(x,0)→''x-axis''</code>, <code>(0,y)→''y-axis''</code>, <code>_→''other''</code>.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>match/case</code> with <code>|</code> for OR patterns: <code>case ''GET'' | ''HEAD'':</code> → ''read'', <code>case ''POST'' | ''PUT'':</code> → ''write''. Test all methods.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>match/case</code> to destructure a dict: <code>match command: case {''action'':''move'',''x'':x,''y'':y}:</code>. Extract values into variables.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>match/case</code> with guard clauses: <code>case x if x > 0:</code> → ''positive''. Show the difference between guard and simple pattern.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-39">
<h1><strong>4 . Guard Patterns :</strong> Defensive and Clean Code</h1>
<h3>🔍 What is a Guard Pattern?</h3>
<p>A guard clause validates preconditions at the very top of a function and returns or raises an error immediately if they fail. This prevents deep nesting of <code>if</code> statements.</p>
<h3>💼 Why Data Analysts Care</h3>
<p>• <strong>Data Validation</strong>: When receiving a messy dataframe or a raw JSON payload, guards instantly reject invalid schemas before the complex processing logic begins.</p>
<p>• <strong>Readability</strong>: Code that flows straight down is immensely easier to read than code deeply indented by 5 nested <code>if</code> blocks.</p>
<h3>⚠️ Common Pitfall</h3>
<p>Failing to use guards leads to the ''Arrow Anti-Pattern'', where code indentation keeps shifting to the right, causing massive horizontal sprawl and confusing scope.</p>
<h3>🧠 Pro Tip</h3>
<p>Combine guards with early returns: <code>if not valid: return None</code>. The remainder of the function can then safely assume the input is perfectly valid without wrapping it in an <code>else</code> block.</p>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Without guard (deeply nested — bad)
def process_bad(data):
    if data is not None:
        if len(data) &gt; 0:
            if isinstance(data, list):
                return sum(data)

# With guard clauses (flat — good)
def process(data):
    if data is None:
        raise ValueError(&#x27;data cannot be None&#x27;)
    if not isinstance(data, list):
        raise TypeError(f&#x27;Expected list, got {type(data).__name__}&#x27;)
    if len(data) == 0:
        return 0
    return sum(data)

print(process([1, 2, 3, 4, 5]))  # 15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Check-41">
<div class="concept-header"><h3>🧪 Concept Checks: <code>Check</code></h3></div>
<div class="question"><p><strong>Q1.</strong> Write a guard clause pattern: <code>if not valid_input: return ''Error''</code> at the top of a function. Show how it simplifies nested <code>if/else</code>.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a function <code>process_data(data)</code> with early returns: if None→''No data'', if empty→''Empty'', if too large→''Too big'', else process. Test all paths.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write input validation guards: check type, range, format before processing. <code>validate_age(value)</code> → return error string or None. Test 5 inputs.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Refactor deeply nested <code>if/else</code> into flat guard clauses. Before: 4 levels of nesting. After: 4 sequential <code>if return</code> statements. Show both versions.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>assert</code> as a development guard: <code>assert isinstance(x, int), ''x must be int''</code>. Show it raises <code>AssertionError</code>. Explain when to use vs exceptions.</p></div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-52">
<h1><strong>5 . Complex Conditions :</strong> Compound Logic</h1>
<h3>🔍 Compound Boolean Logic</h3>
<p>Python utilizes <code>and</code>, <code>or</code>, and <code>not</code> to combine multiple conditions. Parentheses should be used to explicitly group conditions when mixing operators.</p>
<h3>💼 Why Data Analysts Care</h3>
<p>• <strong>Advanced Filtering</strong>: Filtering a dataframe based on multiple columns (e.g., <code>is_active and (revenue > 1000 or months_tenure > 12)</code>).</p>
<p>• <strong>Aggregating conditions</strong>: Using <code>all(list)</code> to verify that an entire batch of data passed quality checks.</p>
<h3>⚠️ Common Pitfall</h3>
<p>Short-circuit evaluation means Python stops checking an <code>and</code> sequence as soon as it hits a <code>False</code>, and stops checking an <code>or</code> sequence as soon as it hits a <code>True</code>. Do not put side-effects inside conditions!</p>
<h3>🧠 Under the Hood</h3>
<p>Python allows chained comparisons like <code>0 < x < 10</code>. This is mathematically elegant and evaluates to <code>x > 0 and x < 10</code> automatically.</p>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Named boolean variables — self-documenting
age        = 25
income     = 55000
credit     = 720
has_job    = True

is_adult     = age &gt;= 18
good_income  = income &gt;= 50000
good_credit  = credit &gt;= 700

eligible = is_adult and good_income and good_credit and has_job
print(f&#x27;Loan eligible: {eligible}&#x27;)

# all() and any()
scores = [85, 90, 78, 92, 88]
print(all(s &gt;= 60 for s in scores))  # True — all passing
print(any(s &gt;= 90 for s in scores))  # True — at least one A</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Check-54">
<div class="concept-header"><h3>🧪 Concept Checks: <code>Check</code></h3></div>
<div class="question"><p><strong>Q1.</strong> Write a function <code>classify_triangle(a,b,c)</code> returning: ''invalid'' (triangle inequality), ''equilateral'', ''isosceles'', ''scalene''. Test with 5 triangles.</p></div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a function <code>grade_calculator(scores)</code> that: validates all scores are 0-100, computes weighted average, returns letter grade and pass/fail.</p></div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a function <code>ticket_price(age, day, is_member)</code> with complex pricing: kids/adults/seniors × weekday/weekend × member discount. Return price and breakdown.</p></div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a function <code>validate_password(pw)</code> checking 6 rules (length, upper, lower, digit, special, no spaces). Return <code>(True/False, [failures])</code>. Test 5 passwords.</p></div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a function <code>tax_calculator(income, filing_status)</code> using progressive tax brackets with different rates per bracket. Return tax owed and effective rate.</p></div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (ATM Simulator):</strong> Write ATM logic: check PIN (3 attempts, lockout), check balance, withdraw (check sufficient funds, daily limit), deposit. Print transaction receipt.</p></div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Task 1 Solution</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Rock Paper Scissors):</strong> Write full game: validate input, determine winner (player vs random), track score over 5 rounds. Print round-by-round results and final winner.</p></div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Task 2 Solution</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Email Router):</strong> Write <code>route_email(email)</code> that classifies by: domain (.edu→academic, .gov→government, .com→commercial), sender patterns, keywords in subject. Return routing decision.</p></div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Task 3 Solution</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Discount Engine):</strong> Write <code>calculate_discount(customer_type, order_total, coupon_code, is_holiday)</code> with layered rules: base discount + coupon + holiday bonus + loyalty tier. Cap at 50%. Print breakdown.</p></div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Task 4 Solution</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Data Validator):</strong> Write <code>validate_record(record, rules)</code> where rules define: required fields, type checks, range checks, pattern checks, cross-field checks. Return <code>(valid, [errors])</code>.</p></div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Task 5 Solution</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
<p>Solve these 25 purely code-based problems.</p>
</div>
<div class="nb-section" id="sec-77">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a function <code>fizzbuzz(n)</code> printing 1-n with: ''Fizz'' for multiples of 3, ''Buzz'' for 5, ''FizzBuzz'' for both. Do it with minimal <code>if</code> statements.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-79">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write a function <code>roman_to_int(s)</code> converting ''XIV'' → 14. Handle subtractive cases (IV=4, IX=9). Use dict mapping.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-81">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a function <code>valid_parentheses(s)</code> checking if brackets <code>()[]{}</code> are properly matched. Use a stack. Return True/False.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-83">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a function <code>binary_search(lst, target)</code> returning index or -1. Implement with while loop and conditional comparisons.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-85">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a function <code>merge_intervals(intervals)</code> merging overlapping intervals. Sort first, then conditionally merge. Return merged list.</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-87">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write a function <code>can_jump(nums)</code> determining if you can reach the last index from first. <code>[2,3,1,1,4]</code>→True, <code>[3,2,1,0,4]</code>→False.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-89">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a function <code>eval_rpn(tokens)</code> evaluating Reverse Polish Notation: <code>[''2'',''3'',''+'',''4'',''*'']</code> → 20. Use stack + conditionals.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-91">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a function <code>longest_valid_parens(s)</code> finding length of longest valid parentheses substring. <code>''(()''</code> → 2.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-93">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a function <code>trap_rain_water(heights)</code> computing trapped water between bars. Use two-pointer approach with conditionals.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-95">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a function <code>word_ladder_length(begin, end, word_list)</code> finding shortest transformation. BFS with character-change conditions.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-97">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a function <code>search_rotated(nums, target)</code> searching in a rotated sorted array. Modified binary search with conditionals.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-99">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write a function <code>decode_ways(s)</code> counting ways to decode digit string (1=A, 26=Z). <code>''226''</code> → 3. DP with conditionals.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-101">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write a function <code>state_machine(s)</code> validating a number string handles: spaces, sign, digits, decimal, exponent. Conditional transitions.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-103">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a function <code>calculator(expression)</code> parsing <code>''3 + 4 * 2 / (1 - 5)''</code> respecting precedence. Stack-based with conditionals.</h3>
</div>
<div class="code-cell" id="cell-49">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-49'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-49'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-49"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-105">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a function <code>next_greater_element(nums)</code> finding next greater element for each position. Use monotonic stack.</h3>
</div>
<div class="code-cell" id="cell-50">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-50'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-50'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-50"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-107">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write a function <code>game_of_life(board)</code> computing next state of Conway''s Game of Life. Count neighbors, apply rules conditionally.</h3>
</div>
<div class="code-cell" id="cell-51">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-51'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-51'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-51"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-109">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a function <code>min_coins(coins, amount)</code> finding minimum coins for amount. DP with conditional updates. Return -1 if impossible.</h3>
</div>
<div class="code-cell" id="cell-52">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-52'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-52'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-52"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-111">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a function <code>partition_labels(s)</code> partitioning string into max parts where each letter appears in at most one part.</h3>
</div>
<div class="code-cell" id="cell-53">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-53'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-53'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-53"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-113">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a function <code>task_scheduler(tasks, n)</code> finding min intervals to execute all tasks with cooldown n between same tasks.</h3>
</div>
<div class="code-cell" id="cell-54">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-54'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-54'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-54"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-115">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a function <code>is_valid_bst(tree_list)</code> checking if list representation of binary tree is a valid BST. Recursive with range conditions.</h3>
</div>
<div class="code-cell" id="cell-55">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-55'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-55'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-55"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-117">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a function <code>stock_buy_sell_k(prices, k)</code> finding max profit with at most k transactions. DP with buy/sell state conditions.</h3>
</div>
<div class="code-cell" id="cell-56">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-56'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-56'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-56"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-119">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a function <code>regex_match(s, p)</code> implementing simple regex: <code>.</code> matches any char, <code>*</code> matches zero or more of preceding. DP approach.</h3>
</div>
<div class="code-cell" id="cell-57">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-57'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-57'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-57"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-121">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a function <code>candy_distribution(ratings)</code> assigning minimum candies (each child ≥1, higher rating than neighbor → more candy).</h3>
</div>
<div class="code-cell" id="cell-58">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-58'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-58'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-58"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-123">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a function <code>median_sorted_arrays(nums1, nums2)</code> finding median of two sorted arrays in O(log(min(m,n))) with binary search + conditionals.</h3>
</div>
<div class="code-cell" id="cell-59">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-59'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-59'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-59"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-125">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a function <code>skyline(buildings)</code> computing city skyline from building rectangles <code>[left,right,height]</code>. Line sweep with conditions.</h3>
</div>
<div class="code-cell" id="cell-60">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-60'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-60'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-60"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 8 Executive Summary</h2></div>
<table>
<thead><tr><th>Topic</th><th>Focus Area</th><th>Professional Application</th></tr></thead><tbody>
<tr><td>1</td><td>if/elif/else</td><td>Establishing core routing and categorization logic.</td></tr>
<tr><td>2</td><td>Ternary</td><td>Cleaning up simple conditions inside functional map statements.</td></tr>
<tr><td>3</td><td>Match-Case</td><td>Parsing complex dictionary schemas or abstract syntax trees.</td></tr>
<tr><td>4</td><td>Guards</td><td>Building robust functions that reject invalid data immediately.</td></tr>
<tr><td>5</td><td>Complex</td><td>Executing heavy quality assurance pipelines utilizing all/any.</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I rely on Python''s native truthiness checking instead of <code>== True</code>.</p>
<p>• [ ] I implement guard clauses to return early and prevent deep indentation.</p>
<p>• [ ] I can seamlessly apply ternary operators inside comprehensions.</p>
<p>• [ ] I understand how <code>match-case</code> utilizes the <code>case _:</code> wildcard.</p>
<p>• [ ] I have successfully completed all 5 professional practice tasks.</p>
<p>• [ ] I have reviewed, coded, and internalized all 25 pure coding interview questions.</p>
<p><strong>Next Up: Day 9 — Loops</strong></p>
</div>', '[{"anchor": "sec-0", "title": "1 . if / elif / else : Branching Logic"}, {"anchor": "checks-Check-2", "title": "\ud83e\uddea Checks: Check"}, {"anchor": "sec-13", "title": "2 . Ternary Expression : Inline Conditions"}, {"anchor": "checks-Check-15", "title": "\ud83e\uddea Checks: Check"}, {"anchor": "sec-26", "title": "3 . Match-Case : Structural Pattern Matching (Python 3.10+)"}, {"anchor": "checks-Check-28", "title": "\ud83e\uddea Checks: Check"}, {"anchor": "sec-39", "title": "4 . Guard Patterns : Defensive and Clean Code"}, {"anchor": "checks-Check-41", "title": "\ud83e\uddea Checks: Check"}, {"anchor": "sec-52", "title": "5 . Complex Conditions : Compound Logic"}, {"anchor": "checks-Check-54", "title": "\ud83e\uddea Checks: Check"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-77", "title": "Q1."}, {"anchor": "sec-79", "title": "Q2."}, {"anchor": "sec-81", "title": "Q3."}, {"anchor": "sec-83", "title": "Q4."}, {"anchor": "sec-85", "title": "Q5."}, {"anchor": "sec-87", "title": "Q6."}, {"anchor": "sec-89", "title": "Q7."}, {"anchor": "sec-91", "title": "Q8."}, {"anchor": "sec-93", "title": "Q9."}, {"anchor": "sec-95", "title": "Q10."}, {"anchor": "sec-97", "title": "Q11."}, {"anchor": "sec-99", "title": "Q12."}, {"anchor": "sec-101", "title": "Q13."}, {"anchor": "sec-103", "title": "Q14."}, {"anchor": "sec-105", "title": "Q15."}, {"anchor": "sec-107", "title": "Q16."}, {"anchor": "sec-109", "title": "Q17."}, {"anchor": "sec-111", "title": "Q18."}, {"anchor": "sec-113", "title": "Q19."}, {"anchor": "sec-115", "title": "Q20."}, {"anchor": "sec-117", "title": "Q21."}, {"anchor": "sec-119", "title": "Q22."}, {"anchor": "sec-121", "title": "Q23."}, {"anchor": "sec-123", "title": "Q24."}, {"anchor": "sec-125", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48", "cell-49", "cell-50", "cell-51", "cell-52", "cell-53", "cell-54", "cell-55", "cell-56", "cell-57", "cell-58", "cell-59", "cell-60"]'::jsonb),
('day09', '🔄 Loops', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Iteration is the engine of data processing. Today we graduate from basic loops to professional iteration patterns. You will learn to write memory-efficient pipelines using generators and the <code>itertools</code> module, allowing you to process gigabytes of data seamlessly without crashing your system.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Concept</th><th>Core Use Case</th></tr></thead><tbody>
<tr><td>1</td><td><code>for</code> loops</td><td>Iterables & Iterators</td><td>Standard data traversal</td></tr>
<tr><td>2</td><td><code>while</code> loops</td><td>Condition-based</td><td>Polling & Pagination</td></tr>
<tr><td>3</td><td>Loop Control</td><td><code>continue</code>, <code>for...else</code></td><td>Filtering & Search logic</td></tr>
<tr><td>4</td><td>Patterns</td><td><code>enumerate()</code>, <code>zip()</code></td><td>Multi-list processing</td></tr>
<tr><td>5</td><td>Generators</td><td><code>yield</code></td><td>O(1) Memory pipelines</td></tr>
<tr><td>6</td><td>Expressions</td><td><code>(expr for x in data)</code></td><td>Lazy reductions</td></tr>
<tr><td>7</td><td>Itertools</td><td><code>chain</code>, <code>combinations</code></td><td>Combinatorial math</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. For Loops & Iterables : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Data Traversal</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A <code>for</code> loop in Python iterates over an <b>iterable</b> (like a list, string, or dictionary). Unlike C-style loops that use index counters, Python''s <code>for</code> loop extracts the actual items directly. Under the hood, it calls <code>iter()</code> to get an iterator, and <code>next()</code> until it hits a <code>StopIteration</code> error.</p>
<table>
<thead><tr><th>Iterable Type</th><th>Iteration Yields</th><th>Example</th></tr></thead><tbody>
<tr><td>List / Tuple</td><td>Items</td><td><code>for item in [1, 2]:</code></td></tr>
<tr><td>String</td><td>Characters</td><td><code>for char in ''abc'':</code></td></tr>
<tr><td>Dictionary</td><td>Keys</td><td><code>for key in {''a'': 1}:</code></td></tr>
<tr><td>Set</td><td>Items (Unordered)</td><td><code>for item in {1, 2}:</code></td></tr>
<tr><td>File object</td><td>Lines</td><td><code>for line in open(''f.txt''):</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data Processing</strong>: Iterating over rows in a dataset or JSON objects in an API response</p>
<p>• <strong>File Parsing</strong>: Reading gigabytes of log files line-by-line without loading them into memory</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Modifying While Iterating</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Never modify a list (adding/removing items) while iterating over it with a <code>for</code> loop. It will skip elements or crash. Iterate over a <b>copy</b> instead: <code>for item in my_list.copy():</code>.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Iterating lists
names = [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;]
for name in names:
    print(f&#x27;Hello {name}&#x27;)

# Iterating strings
for char in &#x27;Data&#x27;:
    print(char.upper())

# Under the hood (How &#x27;for&#x27; actually works)
nums = [1, 2]
iterator = iter(nums)
print(next(iterator))  # 1
print(next(iterator))  # 2
# print(next(iterator)) # Raises StopIteration</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-For Loops-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>For Loops</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a <code>for</code> loop that iterates over <code>data = [10, 20, 30]</code> and prints the square of each number.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Iterate over the string <code>"Python"</code> and print each character multiplied by 3 (e.g., <code>"PPP"</code>).</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create a dictionary <code>d = {"a": 1, "b": 2}</code>. Use a standard <code>for</code> loop (which yields keys) to print both key and value: <code>d[key]</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Demonstrate the modification trap: iterate over <code>lst = [1, 2, 3, 4]</code>, and if the item is even, remove it using <code>lst.remove()</code>. Print the list. Did it work correctly? Explain.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Fix the previous code by iterating over a slice copy <code>lst[:]</code>. Print the corrected list.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. While Loops & State Machines : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Condition-Based Iteration</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A <code>while</code> loop runs as long as a condition evaluates to <code>True</code>. It is used when the number of iterations is <b>unknown</b> beforehand (e.g., waiting for an API response, polling a database, or reading user input until they type ''quit'').</p>
<pre class="nb-code-block"><code># Polling pattern
while not db.is_ready():
    time.sleep(1)
    print(&quot;Waiting...&quot;)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>API Pagination</strong>: Fetching pages of data until <code>next_page_token</code> is null</p>
<p>• <strong>Retry Logic</strong>: Attempting to connect to a server up to 5 times before failing</p>
<p>• <strong>Simulation</strong>: Running a simulation until a specific convergence threshold is met</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Infinite Loops</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Always ensure the condition inside a <code>while</code> loop will eventually become <code>False</code>, or provide a <code>break</code> statement. Otherwise, your program will freeze forever.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import random

# Standard while loop
counter = 3
while counter &gt; 0:
    print(f&#x27;Countdown: {counter}&#x27;)
    counter -= 1
print(&#x27;Liftoff!&#x27;)

# Polling / Unknown iterations pattern
attempts = 0
success = False

while not success and attempts &lt; 5:
    attempts += 1
    # Simulate a network request with 20% success rate
    if random.random() &gt; 0.8:
        success = True
        print(f&#x27;Connected on attempt {attempts}!&#x27;)
    else:
        print(f&#x27;Attempt {attempts} failed...&#x27;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-While Loops-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>While Loops</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a <code>while</code> loop that prints powers of 2 (1, 2, 4, 8...) as long as the value is less than 100.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a while loop to find the first number divisible by both 7 and 13, starting your search at <code>n = 1</code>. Print it.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create a list <code>items = ["a", "b", "c"]</code>. Use a <code>while items:</code> loop and <code>.pop()</code> to empty the list, printing each item.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a simulation: start with <code>money = 100</code>. In a while loop, subtract a random amount between 10-20 until money is < 0. Count iterations.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> What is the most common cause of an infinite loop? Write a tiny script demonstrating one (and comment it out so it doesn''t crash the notebook!).</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Loop Control : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Break, Continue, Pass & Else</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python provides keywords to alter loop flow. <code>break</code> exits the loop entirely. <code>continue</code> skips the rest of the current iteration and jumps to the next. Python also has a unique <code>for...else</code> construct where the <code>else</code> block runs <b>only if the loop completes without hitting a break</b>.</p>
<table>
<thead><tr><th>Keyword</th><th>Effect</th><th>Common Use</th></tr></thead><tbody>
<tr><td><code>continue</code></td><td>Skip to next iteration</td><td>Guard clauses inside loops (filtering)</td></tr>
<tr><td><code>break</code></td><td>Exit loop immediately</td><td>Early exit when item is found</td></tr>
<tr><td><code>pass</code></td><td>Do nothing</td><td>Placeholder for unimplemented code</td></tr>
<tr><td><code>else</code></td><td>Runs if NO break occurred</td><td>"Search failed" logic</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data Filtering</strong>: Use <code>continue</code> to skip invalid rows without deeply nesting <code>if</code> statements</p>
<p>• <strong>Search Algorithms</strong>: Use <code>break</code> to stop searching a massive dataset once the target is found</p>
<p>• <strong>Validation</strong>: Use <code>for...else</code> to verify that ALL items pass a check</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>The <code>for...else</code> naming is confusing. Think of it as <b><code>for...no_break</code></b>. It''s the most Pythonic way to perform a ''search and report if not found'' pattern.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13"># Continue (Skip evens)
print(&quot;Continue:&quot;)
for i in range(1, 6):
    if i % 2 == 0:
        continue
    print(i)  # 1, 3, 5

# Break (Early exit)
print(&quot;\nBreak:&quot;)
for i in range(1, 6):
    if i == 4:
        break
    print(i)  # 1, 2, 3

# For...Else (Search pattern)
print(&quot;\nFor...Else:&quot;)
target = 99
data = [10, 20, 30]

for num in data:
    if num == target:
        print(&quot;Found it!&quot;)
        break
else:
    print(&quot;Target not found in dataset.&quot;)  # Runs because break was never hit</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Loop Control-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Loop Control</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a loop from 1 to 10. Use <code>continue</code> to skip numbers divisible by 3. Print the rest.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>data = [1, 5, -2, 8, -4]</code>, iterate and print positive numbers. Use <code>break</code> to stop completely if you hit a negative number.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a <code>for...else</code> loop that checks if a prime number <code>11</code> is divisible by any number from 2 to 10. If not, the <code>else</code> block prints "It is prime".</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a <code>while True:</code> loop that increments a counter. Use an <code>if</code> statement and <code>break</code> to exit when the counter reaches 5. Print the counter.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Why is <code>pass</code> useful? Write an empty function or loop using <code>pass</code> to show how it prevents a SyntaxError.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-40">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>4. Iteration Patterns : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Pythonic Looping</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python emphasizes readability. Instead of manually tracking indices with <code>range(len(data))</code>, Python provides elegant built-in functions: <code>enumerate()</code> (value + index), <code>zip()</code> (parallel iteration), and <code>reversed()</code> (backwards).</p>
<table>
<thead><tr><th>Pattern</th><th>Good Pythonic Code</th><th>Bad C-Style Code</th></tr></thead><tbody>
<tr><td>Index Tracking</td><td><code>for i, val in enumerate(lst):</code></td><td><code>for i in range(len(lst)): val = lst[i]</code></td></tr>
<tr><td>Parallel Loops</td><td><code>for a, b in zip(listA, listB):</code></td><td><code>for i in range(len(listA)): a,b = listA[i], listB[i]</code></td></tr>
<tr><td>Reverse Loop</td><td><code>for val in reversed(lst):</code></td><td><code>for i in range(len(lst)-1, -1, -1):</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Feature Engineering</strong>: Combining multiple columns using <code>zip(col1, col2)</code></p>
<p>• <strong>Logging</strong>: Printing row numbers alongside data errors using <code>enumerate(data, start=1)</code></p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Uneven Zip</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>zip()</code> stops at the shortest iterable. If <code>A</code> has 5 items and <code>B</code> has 3, it only loops 3 times. Use <code>itertools.zip_longest</code> if you need to process all elements.
</div></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19">names = [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;]
scores = [95, 82, 91]

# Enumerate (Index + Value)
print(&quot;Enumerate:&quot;)
for idx, name in enumerate(names, start=1):
    print(f&quot;Row {idx}: {name}&quot;)

# Zip (Parallel iteration)
print(&quot;\nZip:&quot;)
for name, score in zip(names, scores):
    print(f&quot;{name} got {score}&quot;)

# Reversed
print(&quot;\nReversed:&quot;)
for name in reversed(names):
    print(name)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Iteration Patterns-42">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Iteration Patterns</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>cities = ["NY", "LA", "CHI"]</code>, use <code>enumerate(..., start=1)</code> to print <code>"1. NY"</code>, <code>"2. LA"</code>, etc.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>keys = ["a", "b", "c"]</code> and <code>vals = [1, 2, 3]</code>, use <code>zip</code> in a dictionary comprehension to map them: <code>{k: v}</code>. Print the dict.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> What happens if you <code>zip</code> <code>[1, 2, 3]</code> with <code>["A", "B"]</code>? Write the loop and print the results to see the truncation.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Loop backwards from 10 to 1 using <code>reversed(range(1, 11))</code>. Print the numbers.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Combine patterns: use <code>enumerate(zip(names, scores))</code> to print the index, name, and score all at once. Try it!</p></div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-53">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>5. Generators & yield : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Lazy Memory-Efficient Evaluation</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A <b>generator</b> is a special function that returns an iterator. Instead of computing an entire list and storing it in memory, it uses the <code>yield</code> keyword to produce values <b>one at a time</b>. It pauses its state between yields.</p>
<pre class="nb-code-block"><code># Normal Function (Eats RAM)
def get_millions():
    return [x for x in range(1_000_000)] # list in memory

# Generator (O(1) Memory)
def yield_millions():
    for x in range(1_000_000):
        yield x  # yields one by one</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Big Data Processing</strong>: Reading a 50GB CSV file line-by-line without crashing your laptop</p>
<p>• <strong>Infinite Streams</strong>: Processing real-time sensor data or Kafka event streams</p>
<p>• <strong>API Pagination</strong>: Yielding records page-by-page as they are requested</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Generators are Single-Use</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Once a generator is exhausted (loop finishes), it is empty. You cannot iterate over it a second time. You must create a new generator object.</p>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25">import sys

# Regular list
squares_list = [x**2 for x in range(10000)]

# Generator function
def generate_squares(n):
    for x in range(n):
        yield x**2

# Generator object
squares_gen = generate_squares(10000)

print(f&quot;List memory: {sys.getsizeof(squares_list)} bytes&quot;)
print(f&quot;Gen memory:  {sys.getsizeof(squares_gen)} bytes&quot;)

# Iterating the generator
print(&quot;First 3 from generator:&quot;)
print(next(squares_gen))  # 0
print(next(squares_gen))  # 1
print(next(squares_gen))  # 4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Generators-55">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Generators</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a generator function <code>countdown(n)</code> that yields numbers from n down to 1. Test it in a loop.</p></div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Demonstrate that generators are single-use: create a generator, loop over it once, then try to loop over it again. What happens?</p></div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a generator <code>fibonacci(limit)</code> that yields Fibonacci numbers up to a maximum value. Print the results.</p></div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a generator that yields random numbers between 1-10 infinitely. Use <code>next()</code> to pull 3 numbers from it manually.</p></div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Why is <code>yield</code> better than <code>return</code> when parsing a massive log file?</p></div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>6. Generator Expressions : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Inline Lazy Data</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A <b>generator expression</b> is exactly like a list comprehension, but it uses <b>parentheses <code>()</code></b> instead of square brackets <code>[]</code>. It creates a generator object instead of a list, saving massive amounts of memory.</p>
<table>
<thead><tr><th>Syntax</th><th>Object Created</th><th>Evaluation</th><th>Memory</th></tr></thead><tbody>
<tr><td><code>[x for x in data]</code></td><td><code>list</code></td><td>Eager (All at once)</td><td>High</td></tr>
<tr><td><code>(x for x in data)</code></td><td><code>generator</code></td><td>Lazy (One by one)</td><td>Low O(1)</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Math Reductions</strong>: <code>sum(x**2 for x in data)</code> — computes the sum without creating a temporary list</p>
<p>• <strong>Pipelining</strong>: Chain multiple generator expressions to create a clean, memory-efficient data pipeline</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>When passing a generator expression as the ONLY argument to a function, you can omit the extra parentheses: <code>sum(x<strong>2 for x in range(10))</code> instead of <code>sum((x</strong>2 for x in range(10)))</code>.</p>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># List Comprehension
lst = [x * 2 for x in range(10)]
print(type(lst))  # &lt;class &#x27;list&#x27;&gt;

# Generator Expression
gen = (x * 2 for x in range(10))
print(type(gen))  # &lt;class &#x27;generator&#x27;&gt;

# Best practice: Reductions
total = sum(x**2 for x in range(1, 1001))
print(f&quot;Sum of squares: {total:,}&quot;)

# Any / All with generators (short-circuits!)
# Stops computing as soon as it finds an even number
has_even = any(x % 2 == 0 for x in [1, 3, 5, 6, 7, 9])
print(f&quot;Has even? {has_even}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Generator Expressions-68">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Generator Expressions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a generator expression for the cubes of numbers 1-10. Assign it to <code>gen</code>. Print <code>next(gen)</code> twice.</p></div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Given <code>data = ["10", "20", "invalid", "30"]</code>, write a generator expression that attempts to convert valid integers. Iterate and print.</p></div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Compute the sum of the first 10,000 even numbers using <code>sum()</code> and a generator expression. Print the result.</p></div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>all()</code> with a generator expression to check if all words in <code>["apple", "banana", "cherry"]</code> have > 3 letters.</p></div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Measure the memory difference (<code>sys.getsizeof()</code>) between <code>[x for x in range(10000)]</code> and <code>(x for x in range(10000))</code>.</p></div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-79">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>7. The itertools Module : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Professional Iteration</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>The <code>itertools</code> module is a standard library toolkit for creating and combining iterators. It provides fast, memory-efficient tools for combinatorial math, grouping, and advanced looping patterns.</p>
<p><strong>Key Itertools:</strong></p>
<table>
<thead><tr><th>Function</th><th>Purpose</th><th>Example</th></tr></thead><tbody>
<tr><td><code>chain(A, B)</code></td><td>Combine iterables sequentially</td><td><code>chain([1,2], [3,4])</code> → 1,2,3,4</td></tr>
<tr><td><code>combinations(A, 2)</code></td><td>All unique pairs</td><td><code>(A,B), (A,C), (B,C)</code></td></tr>
<tr><td><code>permutations(A, 2)</code></td><td>All ordered pairs</td><td><code>(A,B), (B,A), (A,C)...</code></td></tr>
<tr><td><code>cycle(A)</code></td><td>Infinite loop over A</td><td><code>1,2,1,2,1,2...</code></td></tr>
<tr><td><code>groupby(A, key)</code></td><td>Group adjacent duplicates</td><td>Grouping sorted data</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Feature Interactions</strong>: Generating all pairs of columns using <code>combinations</code> for machine learning</p>
<p>• <strong>Flattening Data</strong>: Using <code>chain.from_iterable(list_of_lists)</code> to flatten nested structures efficiently</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Infinite Itertools</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Tools like <code>cycle</code>, <code>count</code>, and <code>repeat</code> generate infinite streams. Always use a <code>break</code> condition or zip them with a finite sequence, otherwise your program will hang.</p>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37">import itertools

# Chain: seamless iteration across multiple lists
l1, l2 = [1, 2], [3, 4]
print(&quot;Chain:&quot;, list(itertools.chain(l1, l2)))

# Combinations: pick 2
items = [&#x27;A&#x27;, &#x27;B&#x27;, &#x27;C&#x27;]
combs = list(itertools.combinations(items, 2))
print(&quot;Combinations:&quot;, combs)

# Zip Longest (pad missing values)
l3 = [1, 2, 3]
l4 = [&#x27;A&#x27;]
zipped = list(itertools.zip_longest(l3, l4, fillvalue=&#x27;?&#x27;))
print(&quot;Zip Longest:&quot;, zipped)

# Slice an infinite iterator
counter = itertools.count(start=10, step=5)
first_three = list(itertools.islice(counter, 3))
print(&quot;Infinite Count slice:&quot;, first_three)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Itertools-81">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Itertools</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import <code>itertools</code>. Use <code>chain()</code> to loop over <code>[1,2,3]</code>, <code>(4,5)</code>, and <code>{"A", "B"}</code> in a single for loop. Print each item.</p></div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>itertools.combinations()</code> to find all 3-person teams from <code>["Alice", "Bob", "Charlie", "David"]</code>. Print them.</p></div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>itertools.permutations()</code> on <code>[1, 2, 3]</code> with length 2. How many results are there compared to combinations?</p></div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a <code>for</code> loop using <code>itertools.cycle(["Red", "Green", "Blue"])</code>. Use a manual counter to <code>break</code> after 7 prints.</p></div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Flatten <code>matrix = [[1, 2], [3, 4], [5, 6]]</code> using <code>itertools.chain.from_iterable()</code>. Print the resulting list.</p></div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Data Paginator):</strong> Write a generator <code>paginate(data, page_size)</code> that yields chunks of a list. E.g., <code>paginate([1,2,3,4,5], 2)</code> yields <code>[1,2]</code>, <code>[3,4]</code>, <code>[5]</code>. Test it in a loop.</p></div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (CSV Reader Pipeline):</strong> Write two generator functions. <code>read_lines(text)</code> yields lines from a multi-line string. <code>parse_csv(lines)</code> yields lists of values. Chain them: <code>for row in parse_csv(read_lines(data)):</code>.</p></div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Prime Generator):</strong> Write a generator <code>primes_up_to(n)</code> that yields prime numbers. Use an internal <code>while</code> loop and math logic. Test with <code>n=50</code>.</p></div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (For-Else Search):</strong> Given a list of dictionaries (users), write a <code>for...else</code> loop that searches for a user with <code>role == ''admin''</code>. Break and print their name if found, else print ''No admin configured''.</p></div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Cartesian Combinations):</strong> Given <code>colors = [''red'', ''blue'']</code> and <code>sizes = [''S'', ''M'', ''L'']</code>, use <code>itertools.product</code> to generate and print all possible color/size combinations.</p></div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-104">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a generator <code>fibonacci()</code> that yields the Fibonacci sequence infinitely. Use <code>itertools.islice</code> to get the first 10.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-106">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Explain the difference between <code>yield</code> and <code>return</code>. What is a coroutine?</h3>
</div>
<div class="code-cell" id="cell-49">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-49'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-49'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-49"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-108">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a function <code>flatten(nested_list)</code> using recursion and <code>yield from</code> to flatten arbitrarily deep lists.</h3>
</div>
<div class="code-cell" id="cell-50">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-50'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-50'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-50"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-110">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Explain how <code>for...else</code> works. Write a code example showing a use case where it replaces a boolean flag.</h3>
</div>
<div class="code-cell" id="cell-51">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-51'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-51'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-51"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-112">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a generator expression to find the sum of all odd numbers under 1,000,000. Why is this better than a list comprehension?</h3>
</div>
<div class="code-cell" id="cell-52">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-52'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-52'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-52"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-114">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Implement a custom iterator class (with <code><strong>iter</strong></code> and <code><strong>next</strong></code>) that mimics the <code>range(start, stop)</code> function.</h3>
</div>
<div class="code-cell" id="cell-53">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-53'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-53'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-53"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-116">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a function <code>sliding_window(iterable, n)</code> using <code>itertools</code> or generators to yield n-length windows. <code>[1,2,3,4]</code>, n=2 -> <code>(1,2), (2,3), (3,4)</code>.</h3>
</div>
<div class="code-cell" id="cell-54">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-54'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-54'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-54"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-118">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a function that parses a log file line-by-line using a generator, filtering only lines containing ''ERROR''.</h3>
</div>
<div class="code-cell" id="cell-55">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-55'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-55'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-55"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-120">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Explain the <code>StopIteration</code> exception. Write code that manually catches it while using <code>next()</code>.</h3>
</div>
<div class="code-cell" id="cell-56">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-56'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-56'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-56"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-122">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a function <code>group_anagrams(words)</code> using <code>itertools.groupby</code>. Why must the data be sorted first?</h3>
</div>
<div class="code-cell" id="cell-57">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-57'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-57'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-57"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-124">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Implement a custom <code>zip(*iterables)</code> function using a <code>while</code> loop and <code>next()</code>.</h3>
</div>
<div class="code-cell" id="cell-58">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-58'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-58'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-58"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-126">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write code using <code>itertools.dropwhile</code> and <code>takewhile</code> to extract a specific segment of data from a stream.</h3>
</div>
<div class="code-cell" id="cell-59">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-59'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-59'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-59"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-128">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Explain what <code>itertools.tee</code> does and when you would need to use it to duplicate an iterator.</h3>
</div>
<div class="code-cell" id="cell-60">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-60'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-60'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-60"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-130">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a function to generate all subsets (powerset) of a list using <code>itertools.combinations</code>.</h3>
</div>
<div class="code-cell" id="cell-61">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-61'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-61'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-61"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-132">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a generator <code>chunker(iterable, size)</code> that works on ANY iterable (not just lists) using <code>itertools.islice</code>.</h3>
</div>
<div class="code-cell" id="cell-62">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-62'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-62'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-62"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-134">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Implement an infinite prime number generator using a growing set of seen primes.</h3>
</div>
<div class="code-cell" id="cell-63">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-63'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-63'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-63"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-136">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write code showing the difference between <code>itertools.combinations</code> and <code>itertools.combinations_with_replacement</code>.</h3>
</div>
<div class="code-cell" id="cell-64">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-64'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-64'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-64"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-138">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a function that uses a generator to find the first duplicate in a stream of data in O(1) memory.</h3>
</div>
<div class="code-cell" id="cell-65">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-65'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-65'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-65"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-140">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Explain the memory profile of <code>any([cond(x) for x in data])</code> vs <code>any(cond(x) for x in data)</code>. Why does it matter?</h3>
</div>
<div class="code-cell" id="cell-66">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-66'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-66'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-66"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-142">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a pipeline of three generator functions: read, filter, and transform. Connect them together.</h3>
</div>
<div class="code-cell" id="cell-67">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-67'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-67'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-67"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-144">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Implement the Collatz conjecture as a generator yielding the sequence until it reaches 1.</h3>
</div>
<div class="code-cell" id="cell-68">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-68'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-68'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-68"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-146">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a function that alternates yielding from two infinite generators using <code>itertools.cycle</code> or manual logic.</h3>
</div>
<div class="code-cell" id="cell-69">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-69'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-69'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-69"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-148">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Explain why modifying a dictionary while iterating over it raises a RuntimeError. How do you safely delete keys in a loop?</h3>
</div>
<div class="code-cell" id="cell-70">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-70'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-70'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-70"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-150">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a <code>while</code> loop that retries an API call (simulated function) with exponential backoff.</h3>
</div>
<div class="code-cell" id="cell-71">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-71'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-71'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-71"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-152">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>What is <code>yield from</code>? Write a function that uses it to chain two separate generator functions together.</h3>
</div>
<div class="code-cell" id="cell-72">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-72'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-72'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-72"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 9 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th><th>Professional Application</th></tr></thead><tbody>
<tr><td>1</td><td><code>for</code> loops</td><td>Iterates over iterables</td><td>Data traversal without indices</td></tr>
<tr><td>2</td><td><code>while</code> loops</td><td>Runs while condition is true</td><td>Polling, infinite streams, pagination</td></tr>
<tr><td>3</td><td>Loop Control</td><td><code>break</code>, <code>continue</code>, <code>else</code></td><td>Fast filtering, search resolution</td></tr>
<tr><td>4</td><td>Iteration Patterns</td><td><code>enumerate</code>, <code>zip</code>, <code>reversed</code></td><td>Elegant, readable data manipulation</td></tr>
<tr><td>5</td><td>Generators</td><td><code>yield</code> pauses execution</td><td>O(1) memory for massive datasets</td></tr>
<tr><td>6</td><td>Gen Expressions</td><td><code>(x for x in data)</code></td><td>Inline lazy reductions (sum/any/all)</td></tr>
<tr><td>7</td><td>Itertools</td><td>Standard library iteration tools</td><td>Combinatorics, efficient chaining</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I understand how <code>for</code> loops work under the hood (<code>iter()</code> and <code>next()</code>).</p>
<p>• [ ] I know how to use <code>while</code> loops for unknown iteration counts (polling).</p>
<p>• [ ] I can use <code>continue</code> to filter and <code>for...else</code> for search operations.</p>
<p>• [ ] I always use <code>enumerate()</code> instead of <code>range(len())</code>.</p>
<p>• [ ] I understand how <code>yield</code> saves memory compared to returning a full list.</p>
<p>• [ ] I can write a generator expression for memory-efficient math reductions.</p>
<p>• [ ] I have completed all 5 practice tasks.</p>
<p>• [ ] I have reviewed all 25 interview questions.</p>
<p>*<em>Next Up: Day 10 - Functions: Scope, Arguments, \</em>args/\<em>\</em>kwargs, and Lambdas**</p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. For Loops & Iterables : Data Traversal"}, {"anchor": "checks-For Loops-3", "title": "\ud83e\uddea Checks: For Loops"}, {"anchor": "sec-14", "title": "2. While Loops & State Machines : Condition-Based Iteration"}, {"anchor": "checks-While Loops-16", "title": "\ud83e\uddea Checks: While Loops"}, {"anchor": "sec-27", "title": "3. Loop Control : Break, Continue, Pass & Else"}, {"anchor": "checks-Loop Control-29", "title": "\ud83e\uddea Checks: Loop Control"}, {"anchor": "sec-40", "title": "4. Iteration Patterns : Pythonic Looping"}, {"anchor": "checks-Iteration Patterns-42", "title": "\ud83e\uddea Checks: Iteration Patterns"}, {"anchor": "sec-53", "title": "5. Generators & yield : Lazy Memory-Efficient Evaluation"}, {"anchor": "checks-Generators-55", "title": "\ud83e\uddea Checks: Generators"}, {"anchor": "sec-66", "title": "6. Generator Expressions : Inline Lazy Data"}, {"anchor": "checks-Generator Expressions-68", "title": "\ud83e\uddea Checks: Generator Expressions"}, {"anchor": "sec-79", "title": "7. The itertools Module : Professional Iteration"}, {"anchor": "checks-Itertools-81", "title": "\ud83e\uddea Checks: Itertools"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-104", "title": "Q1."}, {"anchor": "sec-106", "title": "Q2."}, {"anchor": "sec-108", "title": "Q3."}, {"anchor": "sec-110", "title": "Q4."}, {"anchor": "sec-112", "title": "Q5."}, {"anchor": "sec-114", "title": "Q6."}, {"anchor": "sec-116", "title": "Q7."}, {"anchor": "sec-118", "title": "Q8."}, {"anchor": "sec-120", "title": "Q9."}, {"anchor": "sec-122", "title": "Q10."}, {"anchor": "sec-124", "title": "Q11."}, {"anchor": "sec-126", "title": "Q12."}, {"anchor": "sec-128", "title": "Q13."}, {"anchor": "sec-130", "title": "Q14."}, {"anchor": "sec-132", "title": "Q15."}, {"anchor": "sec-134", "title": "Q16."}, {"anchor": "sec-136", "title": "Q17."}, {"anchor": "sec-138", "title": "Q18."}, {"anchor": "sec-140", "title": "Q19."}, {"anchor": "sec-142", "title": "Q20."}, {"anchor": "sec-144", "title": "Q21."}, {"anchor": "sec-146", "title": "Q22."}, {"anchor": "sec-148", "title": "Q23."}, {"anchor": "sec-150", "title": "Q24."}, {"anchor": "sec-152", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48", "cell-49", "cell-50", "cell-51", "cell-52", "cell-53", "cell-54", "cell-55", "cell-56", "cell-57", "cell-58", "cell-59", "cell-60", "cell-61", "cell-62", "cell-63", "cell-64", "cell-65", "cell-66", "cell-67", "cell-68", "cell-69", "cell-70", "cell-71", "cell-72"]'::jsonb),
('day10', '⚙️ Functions', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Functions are the building blocks of maintainable code. Today we master writing flexible, reusable logic blocks using <em>args, </em>*kwargs, and anonymous lambda functions. Understanding these patterns is essential for writing professional-grade data pipelines.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Functions</td><td><code>def</code>, scope, returns</td></tr>
<tr><td>2</td><td>Args</td><td><code><em>args</code>, <code></em>*kwargs</code></td></tr>
<tr><td>3</td><td>Lambdas</td><td>Anonymous inline functions</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Function Definition & Scope : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Reusable Logic Blocks</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A function is a named block of code designed to do one specific job. Defined using <code>def</code>, functions take inputs (arguments), perform operations, and return outputs. Variables created inside a function are in <b>local scope</b> and cannot be accessed from outside.</p>
<pre class="nb-code-block"><code>def calculate_roi(revenue, cost):
    profit = revenue - cost
    return (profit / cost) * 100</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Code Reusability</strong>: Define logic once, use it across 100 datasets</p>
<p>• <strong>Testability</strong>: Small functions can be individually tested to prevent pipeline bugs</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Global Variables</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Avoid using <code>global</code> variables inside functions. It creates ''spaghetti code'' where state changes unpredictably. Pass data in as arguments, and return data as outputs.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">def greet(name):
    # Local variable
    message = f&#x27;Hello, {name}!&#x27;
    return message

result = greet(&#x27;Alice&#x27;)
print(result)
# print(message)  # NameError: name &#x27;message&#x27; is not defined</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Functions-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Functions</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a function <code>square(n)</code> that returns the square of <code>n</code>. Call it with <code>5</code> and print the result.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a function <code>is_even(n)</code> that returns <code>True</code> if <code>n</code> is even, <code>False</code> otherwise. Test it with 4 and 7.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Demonstrate local scope: define <code>x = 10</code> in a function, then try to print <code>x</code> outside. Catch and print the NameError.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a function <code>greet(name, greeting="Hello")</code>. Call it with and without the <code>greeting</code> argument.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a function <code>multiply(a, b)</code> and call it using keyword arguments <code>b=5, a=2</code>. Print result.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Arguments: *args and **kwargs : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Flexible Inputs</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Python allows functions to accept an arbitrary number of arguments. <code><em>args</code> collects positional arguments into a <b>tuple</b>. <code></em>*kwargs</code> collects keyword arguments into a <b>dictionary</b>.</p>
<table>
<thead><tr><th>Syntax</th><th>Collects as</th><th>Example Call</th></tr></thead><tbody>
<tr><td><code>*args</code></td><td>Tuple</td><td><code>func(1, 2, 3)</code></td></tr>
<tr><td><code>**kwargs</code></td><td>Dict</td><td><code>func(a=1, b=2)</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Wrapper Functions</strong>: <code><em>args, </em>*kwargs</code> is standard for writing decorators or logging wrappers</p>
<p>• <strong>Flexible APIs</strong>: Creating functions that can accept any number of column names or configuration flags</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Order matters: Standard args come first, then <code><em>args</code>, then <code></em><em>kwargs</code>. E.g., <code>def func(a, b, </em>args, **kwargs):</code></p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">def process_data(name, *args, **kwargs):
    print(f&#x27;Name: {name}&#x27;)
    print(f&#x27;Args (tuple): {args}&#x27;)
    print(f&#x27;Kwargs (dict): {kwargs}&#x27;)

process_data(&#x27;Analytics&#x27;, 10, 20, 30, mode=&#x27;fast&#x27;, debug=True)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-*args and **kwargs-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>*args and **kwargs</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a function <code>sum_all(*args)</code> that takes any number of arguments and returns their sum. Test with 4 numbers.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a function <code>print_info(**kwargs)</code> that iterates over the kwargs dict and prints <code>Key: Value</code>. Call it with 3 kwargs.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a function <code>combine(name, <em>args, </em>*kwargs)</code>. Print all three parts. Call it with <code>"Test", 1, 2, a=3, b=4</code>.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Unpack a list into a function: <code>nums = [1, 2, 3]</code>. Call <code>func(*nums)</code> instead of <code>func(nums[0], ...)</code>. Demonstrate this.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Unpack a dict into kwargs: <code>config = {"x": 10, "y": 20}</code>. Call <code>func(**config)</code>. Demonstrate this.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Recursion : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Functions That Call Themselves</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A <b>recursive function</b> is a function that calls itself to solve a problem by breaking it into smaller sub-problems. Every recursive function needs a <b>base case</b> (the stop condition) and a <b>recursive case</b> (the self-call with a simpler input).</p>
<pre class="nb-code-block"><code>def factorial(n):
    if n &lt;= 1:       # Base case
        return 1
    return n * factorial(n - 1)  # Recursive case</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Tree Traversal</strong>: Navigating nested folder structures or JSON trees recursively</p>
<p>• <strong>Divide and Conquer</strong>: Algorithms like merge sort and binary search use recursion naturally</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Stack Overflow</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Python has a default recursion limit of 1000 calls. Deep recursion will raise <code>RecursionError</code>. For very deep problems, convert to an iterative solution or use <code>sys.setrecursionlimit()</code> cautiously.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13"># Factorial using recursion
def factorial(n):
    if n &lt;= 1:
        return 1
    return n * factorial(n - 1)

print(f&#x27;5! = {factorial(5)}&#x27;)  # 120

# Fibonacci using recursion
def fib(n):
    if n &lt;= 1:
        return n
    return fib(n - 1) + fib(n - 2)

print(f&#x27;fib(7) = {fib(7)}&#x27;)  # 13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Recursion-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Recursion</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a recursive function <code>countdown(n)</code> that prints numbers from <code>n</code> down to 1, then prints "Done!".</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Write a recursive function <code>sum_list(lst)</code> that returns the sum of all elements. Base case: empty list returns 0.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a recursive function <code>power(base, exp)</code> that calculates <code>base <strong> exp</code> without using <code></strong></code>. Test with <code>power(2, 10)</code>.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Write a recursive function <code>reverse_string(s)</code> that reverses a string. Base case: length 0 or 1 returns <code>s</code>.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Write a recursive <code>flatten(lst)</code> that flattens <code>[1, [2, [3, 4], 5]]</code> into <code>[1, 2, 3, 4, 5]</code>.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Math Library):</strong> Write a module-like set of functions for <code>add</code>, <code>subtract</code>, <code>multiply</code>, <code>divide</code>. <code>divide</code> must handle zero division. Write a master <code>calculate(a, b, op)</code> function that uses them.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Data Cleaner):</strong> Write a function <code>clean_string(s)</code> that trims whitespace and lowercases. Use <code>map()</code> to apply it to a list of messy strings.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Config Merger):</strong> Write a function <code>merge_configs(default, **kwargs)</code> that takes a default dictionary and updates it with the provided kwargs. Return the new dict.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Custom Sort):</strong> Given a list of strings like <code>[''user-10'', ''user-2'', ''user-100'']</code>, write a lambda that extracts the integer part for correct numeric sorting.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Timer Wrapper):</strong> Write a simple function <code>time_it(func, <em>args)</code> that records the start time, calls <code>func(</em>args)</code>, records end time, prints duration, and returns the result.</p></div>
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
<h3>Write a function that accepts any number of positional arguments and returns their average.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write two functions: one that modifies a global variable using <code>global</code>, and one that uses a return value instead. Print both results and show why the return-value approach is safer.</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a recursive function <code>flatten(nested_list)</code> that takes a nested list like <code>[1, [2, [3]], 4]</code> and returns <code>[1, 2, 3, 4]</code>.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a function with a mutable default argument <code>def append_val(v, lst=[])</code>. Call it 3 times and print the result each time to demonstrate the bug.</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Fix the mutable default argument trap in <code>def append_val(v, lst=[]): lst.append(v); return lst</code>. Use <code>None</code> as the default.</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write a function <code>compose(f, g)</code> that returns a new function computing <code>f(g(x))</code>. Test with <code>square</code> and <code>add_one</code>.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a simple memoization wrapper: a function <code>memoize(func)</code> that caches results in an inner dictionary. Test with a recursive <code>fib(n)</code>.</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a function <code>filter_data(data, **kwargs)</code> that filters a list of dicts, keeping only dicts matching ALL kwargs. Test with <code>filter_data(users, age=25, city=''NY'')</code>.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a function <code>make_multiplier(n)</code> that returns an inner function which multiplies its argument by <code>n</code>. Create <code>double = make_multiplier(2)</code> and test it.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a higher-order function <code>apply_twice(func, x)</code> that returns <code>func(func(x))</code>. Test with <code>lambda x: x + 3</code> and <code>x = 7</code>.</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a recursive function <code>is_palindrome(s)</code> that checks if a string is a palindrome without using slicing.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Sort a list of strings by their last character using a <code>key</code> function (not lambda). Then do it with a lambda.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Use <code>filter</code> and a function to remove all <code>None</code> or empty string values from <code>[None, ''hello'', '''', ''world'', None, ''hi'']</code>. Print the result.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a function <code>call_with_dict(func, d)</code> that unpacks <code>d = {''a'':1, ''b'':2}</code> and passes it to <code>func(a, b)</code>. Demonstrate with <code>**</code>.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a function <code>greet(name, *, greeting=''Hello'')</code> that forces <code>greeting</code> to be keyword-only. Show a <code>TypeError</code> when called positionally like <code>greet(''Bob'', ''Hi'')</code>.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write a function <code>safe_div(a, b, *, round_to=2)</code> with a keyword-only argument. Test it with <code>safe_div(10, 3, round_to=4)</code>.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a function <code>add(a, b, /)</code> using positional-only parameters (Python 3.8+). Show the <code>TypeError</code> when calling <code>add(a=1, b=2)</code>.</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a list comprehension <code>[lambda x, i=i: x * i for i in range(5)]</code> and call each function. Print results and explain the <code>i=i</code> default trick.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a nested function demonstrating LEGB scope: define <code>x</code> at global, enclosing, and local level. Print <code>x</code> from the innermost function.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a recursive function <code>sum_digits(n)</code> that returns the sum of all digits in a positive integer. Test with <code>12345</code>.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a function that returns <code>(quotient, remainder)</code> as a tuple. Unpack the result into two variables and print them.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write the same transformation using both <code>list(map(str.upper, words))</code> and <code>[w.upper() for w in words]</code>. Time both and print which is faster.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a function <code>merge_dicts(*dicts)</code> that takes any number of dictionaries and merges them into one. Later dicts override earlier keys.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Import <code>functools.partial</code>. Create a <code>double = partial(multiply, 2)</code> function from <code>def multiply(a, b): return a * b</code>. Test it.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a function <code>safe_execute(func, <em>args)</code> that wraps <code>func(</em>args)</code> in try/except and returns <code>None</code> on any exception. Test with a division by zero.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 10 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Def</td><td>Functions isolate logic and scope</td></tr>
<tr><td>2</td><td>Args</td><td><code><em></code> unpacks tuples, <code></em>*</code> unpacks dicts</td></tr>
<tr><td>3</td><td>Lambda</td><td><code>lambda x: x*2</code> is great for <code>apply()</code>/<code>sort()</code></td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can write functions with default arguments.</p>
<p>• [ ] I understand <code><em>args</code> and <code></em>*kwargs</code>.</p>
<p>• [ ] I can write and use a lambda function.</p>
<p><strong>Next Up: Day 11 - Modules & Packages</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Function Definition & Scope : Reusable Logic Blocks"}, {"anchor": "checks-Functions-3", "title": "\ud83e\uddea Checks: Functions"}, {"anchor": "sec-14", "title": "2. Arguments: *args and **kwargs : Flexible Inputs"}, {"anchor": "checks-*args and **kwargs-16", "title": "\ud83e\uddea Checks: *args and **kwargs"}, {"anchor": "sec-27", "title": "3. Recursion : Functions That Call Themselves"}, {"anchor": "checks-Recursion-29", "title": "\ud83e\uddea Checks: Recursion"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb)
ON CONFLICT (day_id) DO UPDATE SET
  title = EXCLUDED.title,
  html_body = EXCLUDED.html_body,
  sections = EXCLUDED.sections,
  cells = EXCLUDED.cells;