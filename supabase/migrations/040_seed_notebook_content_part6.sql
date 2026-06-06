-- ═══════════════════════════════════════════════════════════════
-- Seed Notebook Content: Days 26 to 30
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.notebook_content (day_id, title, html_body, sections, cells)
VALUES
('day26', '🗃️ Pandas GroupBy', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Aggregating data is the core of analytics. You must be able to summarize millions of rows into executive dashboards. Today we master the <code>groupby</code> mechanics to slice data by categories, calculate advanced <code>.agg()</code> summaries, and perform SQL-style Window Functions using <code>.transform()</code>.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>GroupBy</td><td>Split-Apply-Combine</td></tr>
<tr><td>2</td><td>Aggregation</td><td><code>.agg({''A'':''sum''})</code></td></tr>
<tr><td>3</td><td>Transform</td><td>Window Functions</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. The GroupBy Mechanics : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Split-Apply-Combine</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>The <code>.groupby()</code> method is identical to the SQL <code>GROUP BY</code> statement. It follows the <b>Split-Apply-Combine</b> pattern: it <i>splits</i> the data into groups based on a key, <i>applies</i> an aggregation function (like sum or mean), and <i>combines</i> the results into a new DataFrame.</p>
<pre class="nb-code-block"><code># Calculate the average salary per department
# 1. Split by Dept | 2. Select Salary | 3. Apply mean()
avg_salary = df.groupby(&#x27;Dept&#x27;)[&#x27;Salary&#x27;].mean()</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Financial Reporting</strong>: Calculating total monthly revenue: <code>df.groupby(''Month'')[''Revenue''].sum()</code></p>
<p>• <strong>User Behavior</strong>: Finding the maximum session length per user: <code>df.groupby(''UserID'')[''Duration''].max()</code></p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Unaggregated GroupBys</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If you just print <code>df.groupby(''Dept'')</code>, you will get a <code><DataFrameGroupBy object></code> memory address. You MUST apply an aggregation function (like <code>.sum()</code>) to actually see data!</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">import pandas as pd

df = pd.DataFrame({
    &#x27;Dept&#x27;: [&#x27;IT&#x27;, &#x27;HR&#x27;, &#x27;IT&#x27;, &#x27;Sales&#x27;, &#x27;HR&#x27;],
    &#x27;Employee&#x27;: [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;, &#x27;David&#x27;, &#x27;Eve&#x27;],
    &#x27;Salary&#x27;: [70000, 50000, 80000, 90000, 60000],
    &#x27;Experience&#x27;: [3, 2, 5, 10, 4]
})

# Group by Department and calculate Mean for all numeric columns
print(&quot;Mean per Dept:\n&quot;, df.groupby(&#x27;Dept&#x27;).mean(numeric_only=True))

# Group by Department, select ONLY Salary, and calculate Sum
print(&quot;\nTotal Salary per Dept:\n&quot;, df.groupby(&#x27;Dept&#x27;)[&#x27;Salary&#x27;].sum())</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-GroupBy-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>GroupBy</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a <code>df</code> with <code>City</code> and <code>Sales</code>. Group by <code>City</code> and calculate <code>.sum()</code>. Print it.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Group by <code>City</code> and calculate <code>.mean()</code>. Print it.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Group by <code>City</code> and calculate <code>.count()</code> to see how many transactions happened in each city.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Print a raw <code>df.groupby("City")</code> object. Observe the memory address output.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Group by <code>City</code>, select the <code>Sales</code> column, and find the <code>.max()</code> value per city.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Multiple Aggregations (.agg) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Advanced Summaries</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Sometimes you want multiple statistics at once (e.g., the Mean AND the Max). You can pass a list of functions to the <b><code>.agg()</code></b> method. You can also pass a dictionary to apply different functions to different columns!</p>
<pre class="nb-code-block"><code># Min and Max for Salary
df.groupby(&#x27;Dept&#x27;)[&#x27;Salary&#x27;].agg([&#x27;min&#x27;, &#x27;max&#x27;])

# Different math for different columns
df.groupby(&#x27;Dept&#x27;).agg({&#x27;Salary&#x27;: &#x27;mean&#x27;, &#x27;Experience&#x27;: &#x27;max&#x27;})</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Executive Dashboards</strong>: Showing the Total Sales, Average Order Value, and Count of Orders per region in one table</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>GroupBy outputs have the group keys (e.g., ''Dept'') as the <b>Index</b>. If you want a flat standard DataFrame, append <code>.reset_index()</code> to the end of your groupby chain!</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import pandas as pd

df = pd.DataFrame({
    &#x27;Dept&#x27;: [&#x27;IT&#x27;, &#x27;HR&#x27;, &#x27;IT&#x27;, &#x27;Sales&#x27;, &#x27;HR&#x27;],
    &#x27;Salary&#x27;: [70000, 50000, 80000, 90000, 60000],
    &#x27;Experience&#x27;: [3, 2, 5, 10, 4]
})

# Multiple aggregations on a single column
stats = df.groupby(&#x27;Dept&#x27;)[&#x27;Salary&#x27;].agg([&#x27;mean&#x27;, &#x27;sum&#x27;, &#x27;count&#x27;])
print(&quot;Salary Stats:\n&quot;, stats)

# Dictionary aggregation (Different rules per column)
complex_agg = df.groupby(&#x27;Dept&#x27;).agg({
    &#x27;Salary&#x27;: &#x27;sum&#x27;,       # Total budget
    &#x27;Experience&#x27;: &#x27;max&#x27;    # Most senior person
}).reset_index()           # Flattens the index!

print(&quot;\nComplex Aggregation:\n&quot;, complex_agg)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Aggregations-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Aggregations</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Group <code>df</code> by <code>Dept</code>. Use <code>.agg()</code> to find the <code>min</code> and <code>max</code> of <code>Salary</code>.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>.agg()</code> with a dictionary to find the <code>sum</code> of <code>Salary</code> and the <code>mean</code> of <code>Experience</code>.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Add <code>.reset_index()</code> to your answer in Q2 and observe how <code>Dept</code> becomes a normal column.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a custom aggregation: <code>df.groupby("Dept")["Salary"].agg(lambda x: x.max() - x.min())</code> to find the salary range.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Group by TWO columns at once: <code>df.groupby(["Dept", "JobTitle"]).sum()</code>. (Assume a JobTitle column exists).</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Transform & Apply : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Row-Level Group Math</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>While <code>.agg()</code> collapses data into a summary table, <b><code>.transform()</code></b> returns data the exact same shape as the original. This is used for calculating group-level metrics and broadcasting them back to the original rows (like SQL Window Functions).</p>
<pre class="nb-code-block"><code># Calculate the Dept Mean, and broadcast it to every employee&#x27;s row
df[&#x27;Dept_Avg&#x27;] = df.groupby(&#x27;Dept&#x27;)[&#x27;Salary&#x27;].transform(&#x27;mean&#x27;)

# Now you can calculate how much above/below average they are!
df[&#x27;Above_Avg&#x27;] = df[&#x27;Salary&#x27;] - df[&#x27;Dept_Avg&#x27;]</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Standardization</strong>: Z-Score normalization per category: <code>(x - group_mean) / group_std</code></p>
<p>• <strong>Percent to Total</strong>: Calculating what percentage an employee''s salary contributes to their department''s total budget</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Use <code>.agg()</code> when you want to reduce dimensions (create a summary report). Use <code>.transform()</code> when you want to add new calculated columns to your existing DataFrame.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import pandas as pd

df = pd.DataFrame({
    &#x27;Dept&#x27;: [&#x27;IT&#x27;, &#x27;IT&#x27;, &#x27;HR&#x27;, &#x27;HR&#x27;],
    &#x27;Name&#x27;: [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;, &#x27;David&#x27;],
    &#x27;Salary&#x27;: [80000, 60000, 50000, 70000]
})

# Calculate the mean per department and append it as a new column
df[&#x27;Dept_Mean&#x27;] = df.groupby(&#x27;Dept&#x27;)[&#x27;Salary&#x27;].transform(&#x27;mean&#x27;)

# Calculate the difference
df[&#x27;Diff_From_Mean&#x27;] = df[&#x27;Salary&#x27;] - df[&#x27;Dept_Mean&#x27;]

print(&quot;Transformed DataFrame:\n&quot;, df)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Transform-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Transform</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>df</code> with <code>Team</code> and <code>Score</code>. Use <code>.transform("max")</code> to add a column <code>Team_Max_Score</code>.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a column <code>Is_Top_Scorer</code> which is <code>True</code> if <code>Score == Team_Max_Score</code>.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use <code>.transform("sum")</code> to calculate <code>Team_Total</code>. Then create <code>%_of_Total = Score / Team_Total</code>.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> What happens if you try to assign <code>.agg("sum")</code> to a new column? Catch the ValueError (shapes don''t match).</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Explain the SQL equivalent of <code>.transform()</code> (Hint: <code>OVER (PARTITION BY ...)</code> Window Functions).</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Sales Report):</strong> Given a DF with <code>Date</code>, <code>Region</code>, <code>Rep</code>, and <code>Sales</code>. Group by <code>Region</code> and calculate the Total Sales and Average Sales. Reset the index.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Multi-Level Grouping):</strong> Group the Sales DF by BOTH <code>Region</code> and <code>Rep</code>. Calculate the sum of Sales. Notice the MultiIndex created. Use <code>.reset_index()</code> to flatten it.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Custom Aggregation):</strong> Write a custom function <code>spread(series)</code> that returns <code>series.max() - series.min()</code>. Pass this function into <code>.agg()</code> when grouping by Region.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Percent to Total):</strong> Given a DF of <code>Category</code> and <code>Revenue</code>. Use <code>.transform(''sum'')</code> to find the total revenue per category. Create a new column <code>Pct_Rev</code> representing that row''s percentage contribution to its category.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Filtering Groups):</strong> Group by <code>Region</code>. Use <code>.filter(lambda g: g[''Sales''].sum() > 10000)</code> to drop all rows belonging to regions that didn''t meet a 10k quota. (Note: <code>.filter</code> is a powerful GroupBy method!).</p></div>
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
<h3>Explain the ''Split-Apply-Combine'' paradigm in the context of Pandas GroupBy.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>What is the difference between <code>df.groupby(''A'').sum()</code> and <code>df.groupby(''A'')[''B''].sum()</code>?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Why does <code>.groupby()</code> return a <code>DataFrameGroupBy</code> object instead of a DataFrame?</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>What does <code>.reset_index()</code> do after a groupby operation?</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>How do you group by multiple columns? (e.g., Year and Month).</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Explain the difference between <code>.agg()</code> and <code>.transform()</code>.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>How do you apply different aggregation functions to different columns in a single <code>.agg()</code> call?</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write code to group by Column A, and get the size (count of rows) of each group using <code>.size()</code>.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>What is the difference between <code>.count()</code> and <code>.size()</code> on a GroupBy object?</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>How do you use <code>.filter()</code> on a GroupBy object to drop entire groups based on a condition?</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>What is a <code>MultiIndex</code>? How is it created during a <code>.groupby()</code>?</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write code to find the first occurrence (row) of each group. (<code>.first()</code>).</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>How do you calculate a rolling average within groups? (e.g., <code>df.groupby(''User'')[''Login''].rolling(3).mean()</code>).</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Explain how to use the <code>as_index=False</code> parameter in <code>.groupby()</code>. What does it replace?</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a custom lambda function inside <code>.agg()</code> to calculate the 90th percentile of a group.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>How do you iterate over groups in a GroupBy object? (<code>for name, group in grouped:</code>).</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>What happens if you group by a column that contains <code>NaN</code> values? (Hint: <code>dropna=True</code> is the default).</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Explain how <code>.transform()</code> is equivalent to SQL Window Functions (<code>OVER PARTITION BY</code>).</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write code to fill <code>NaN</code> values in ''Salary'' with the mean ''Salary'' of that specific ''Department'' using <code>.transform()</code>.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>How do you get the N-th row of each group? (<code>.nth(n)</code>).</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>What is <code>pd.Grouper</code> and how is it used for grouping Time Series data by frequency (e.g., Monthly)?</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Explain the <code>nunique()</code> aggregation function. When is it useful?</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>How do you pivot a grouped DataFrame from long format to wide format? (<code>.unstack()</code>).</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write code to calculate the Cumulative Sum within each group. (<code>.cumsum()</code>).</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>How do you sort the output of a GroupBy aggregation by the aggregated values?</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 26 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>GroupBy</td><td><code>df.groupby(''Key'')[''Value''].sum()</code> is the most common analytics code</td></tr>
<tr><td>2</td><td>Agg</td><td>Pass lists <code>[''min'', ''max'']</code> or dicts to perform complex math</td></tr>
<tr><td>3</td><td>Transform</td><td>Returns data in the original shape. Perfect for calculating <code>% of Total</code></td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can group by a column and calculate the mean.</p>
<p>• [ ] I can use <code>.agg()</code> for multiple statistics.</p>
<p>• [ ] I understand the difference between <code>.agg()</code> and <code>.transform()</code>.</p>
<p><strong>Next Up: Day 27 - Pandas Merging & Joining</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. The GroupBy Mechanics : Split-Apply-Combine"}, {"anchor": "checks-GroupBy-3", "title": "\ud83e\uddea Checks: GroupBy"}, {"anchor": "sec-14", "title": "2. Multiple Aggregations (.agg) : Advanced Summaries"}, {"anchor": "checks-Aggregations-16", "title": "\ud83e\uddea Checks: Aggregations"}, {"anchor": "sec-27", "title": "3. Transform & Apply : Row-Level Group Math"}, {"anchor": "checks-Transform-29", "title": "\ud83e\uddea Checks: Transform"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day27', '🔗 Pandas Merging', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Data rarely lives in a single CSV file. To answer complex business questions, you must connect relational datasets. Today we master SQL-style Joins via <code>pd.merge()</code>, row stacking via <code>pd.concat()</code>, and index alignment via <code>df.join()</code>.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Merging</td><td><code>INNER</code>, <code>LEFT</code>, <code>OUTER</code> Joins</td></tr>
<tr><td>2</td><td>Concat</td><td>Stacking rows vertically</td></tr>
<tr><td>3</td><td>Joining</td><td>Aligning by Index</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Merging (Joins) : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Connecting Datasets</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>In the real world, data is stored in multiple tables. <b><code>pd.merge()</code></b> is the exact equivalent of a SQL JOIN. It connects two DataFrames side-by-side based on a common column (the ''key'').</p>
<table>
<thead><tr><th>Merge Type (how=)</th><th>SQL Equivalent</th><th>Result</th></tr></thead><tbody>
<tr><td><code>inner</code> (Default)</td><td>INNER JOIN</td><td>Keep only rows with matching keys in BOTH tables</td></tr>
<tr><td><code>left</code></td><td>LEFT JOIN</td><td>Keep all rows from Left table, fill missing right data with NaN</td></tr>
<tr><td><code>right</code></td><td>RIGHT JOIN</td><td>Keep all rows from Right table</td></tr>
<tr><td><code>outer</code></td><td>FULL OUTER JOIN</td><td>Keep all rows from both tables, filling NaNs wherever needed</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Enrichment</strong>: You have a table of <code>User_IDs</code>. You merge it with a <code>Users</code> table to get their <code>Email</code> and <code>Name</code>.</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Exploding Joins</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If you merge on a column that has duplicates in BOTH tables (a Many-to-Many join), Pandas will create a Cartesian product, multiplying your row count exponentially and crashing your RAM. Ensure your keys are unique in at least one table!</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">import pandas as pd

# Left Table (Transactions)
txns = pd.DataFrame({
    &#x27;User_ID&#x27;: [1, 2, 3],
    &#x27;Amount&#x27;: [100, 200, 300]
})

# Right Table (Users)
users = pd.DataFrame({
    &#x27;User_ID&#x27;: [1, 2, 4],
    &#x27;Name&#x27;: [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;David&#x27;]
})

# Inner Merge (Only IDs 1 and 2 exist in both)
inner = pd.merge(txns, users, on=&#x27;User_ID&#x27;, how=&#x27;inner&#x27;)
print(&quot;Inner Merge:\n&quot;, inner)

# Left Merge (Keeps ID 3, missing Name becomes NaN)
left = pd.merge(txns, users, on=&#x27;User_ID&#x27;, how=&#x27;left&#x27;)
print(&quot;\nLeft Merge:\n&quot;, left)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Merging-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Merging</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create two DataFrames with a common column <code>"ID"</code>. Merge them using <code>how="inner"</code>.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Change the merge to <code>how="left"</code>. Observe the <code>NaN</code> values for the unmatched row.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Change the merge to <code>how="outer"</code>. Observe that all IDs from both tables are present.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> What happens if the columns have different names? Use <code>left_on="Txn_ID"</code> and <code>right_on="User_ID"</code> to merge them.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Explain the risk of Many-to-Many joins. What happens to row counts?</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Concatenation : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Stacking Datasets</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>While <code>merge</code> connects tables side-by-side, <b><code>pd.concat()</code></b> stacks tables on top of each other (or side-by-side if you change the axis). It is the equivalent of a SQL <code>UNION</code>. You use it when you have identical schema files (e.g., Jan Sales, Feb Sales) and want one master table.</p>
<pre class="nb-code-block"><code># Stack dataframes vertically (Rows increase)
master_df = pd.concat([jan_df, feb_df, mar_df], axis=0, ignore_index=True)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Batch Loading</strong>: Using a <code>for</code> loop to read 50 CSV files into a list, then running <code>pd.concat(list)</code> to create one massive DataFrame.</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Always use <code>ignore_index=True</code> when concatenating vertically. Otherwise, the new DataFrame will have duplicate index values (e.g., 0,1,2... 0,1,2...), which will cause nightmares when you try to use <code>.loc</code> later.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import pandas as pd

jan = pd.DataFrame({&#x27;Month&#x27;: [&#x27;Jan&#x27;, &#x27;Jan&#x27;], &#x27;Sales&#x27;: [100, 200]})
feb = pd.DataFrame({&#x27;Month&#x27;: [&#x27;Feb&#x27;, &#x27;Feb&#x27;], &#x27;Sales&#x27;: [150, 250]})

# Concatenate vertically (Stacking rows)
combined = pd.concat([jan, feb], axis=0)
print(&quot;Concat (Duplicate Index!):\n&quot;, combined)

# Proper concatenation (Resets index)
clean_concat = pd.concat([jan, feb], axis=0, ignore_index=True)
print(&quot;\nConcat (Clean Index):\n&quot;, clean_concat)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Concat-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Concat</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create two DataFrames with identical columns. Use <code>pd.concat([df1, df2])</code> to stack them.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Notice the index duplicates. Add <code>ignore_index=True</code> to fix it. Print the result.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Change to <code>axis=1</code> to concatenate side-by-side. Print the result.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> What happens if <code>df1</code> has a column <code>"A"</code> and <code>df2</code> has a column <code>"B"</code> and you concat vertically? (Hint: <code>NaN</code>s are generated).</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Append a single row (as a DataFrame) to <code>df1</code> using <code>pd.concat</code>.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Joining on Index : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Index Alignment</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>While <code>merge</code> looks at columns, the <b><code>.join()</code></b> method specifically aligns DataFrames based on their <b>Index</b>. It is a shortcut for <code>pd.merge(left_index=True, right_index=True)</code>.</p>
<pre class="nb-code-block"><code># df1 and df2 must share the same index labels
combined = df1.join(df2, how=&#x27;left&#x27;)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Time Series</strong>: Joining multiple stock price DataFrames where the Date is the index for all of them.</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If both DataFrames have a column with the exact same name, <code>.join()</code> will crash. You must provide <code>lsuffix=''_left''</code> and <code>rsuffix=''_right''</code> to differentiate them.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import pandas as pd

# DataFrames with specific Index labels
df1 = pd.DataFrame({&#x27;A&#x27;: [10, 20]}, index=[&#x27;X&#x27;, &#x27;Y&#x27;])
df2 = pd.DataFrame({&#x27;B&#x27;: [100, 200]}, index=[&#x27;X&#x27;, &#x27;Z&#x27;])

# Default join is a LEFT JOIN on the index
joined = df1.join(df2)
print(&quot;Left Join on Index:\n&quot;, joined)

# Inner Join on Index
inner_joined = df1.join(df2, how=&#x27;inner&#x27;)
print(&quot;\nInner Join on Index:\n&quot;, inner_joined)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Index Join-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Index Join</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create two DataFrames with matching indexes <code>["a", "b"]</code>. Use <code>df1.join(df2)</code>. Print it.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a column collision: both DFs have a column <code>"Val"</code>. Try to join. Catch the ValueError.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Fix Q2 by adding <code>lsuffix="_left", rsuffix="_right"</code>. Print the result.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> What is the <code>pd.merge()</code> equivalent of an index join? (Hint: <code>left_index=True, right_index=True</code>).</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Explain why Time Series analysis heavily relies on index joining.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Employee Database):</strong> Create <code>employees</code> DF (<code>EmpID</code>, <code>Name</code>, <code>DeptID</code>) and <code>departments</code> DF (<code>DeptID</code>, <code>DeptName</code>). Use <code>pd.merge()</code> to create a complete table showing Employee Names and their Department Names.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Missing Matches):</strong> Create a Left Merge from the task above, but ensure one <code>EmpID</code> has a <code>DeptID</code> that doesn''t exist in the departments table. Use <code>isna()</code> on the merged DF to find the employee with no matching department.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (File Aggregator):</strong> Write a simulated loop: Create 3 identical DataFrames representing Jan, Feb, Mar sales. Append them to a python list. Use <code>pd.concat(list, ignore_index=True)</code> to create the master DataFrame.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Mismatch Concat):</strong> Create <code>df1</code> with columns <code>[''A'', ''B'']</code> and <code>df2</code> with columns <code>[''B'', ''C'']</code>. Concat them vertically. Notice how Pandas fills missing columns with <code>NaN</code>. Use <code>join=''inner''</code> inside <code>concat</code> to keep ONLY shared columns.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Cross Join):</strong> Create a DataFrame of <code>Colors</code> and <code>Sizes</code>. Use <code>pd.merge(how=''cross'')</code> to generate every possible combination of Color and Size (Cartesian product).</p></div>
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
<h3>Explain the difference between <code>pd.merge()</code>, <code>pd.concat()</code>, and <code>df.join()</code>.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>What is the difference between an INNER JOIN and a LEFT JOIN?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>When merging, how do you handle columns that have different names in the left and right tables? (Hint: <code>left_on</code>, <code>right_on</code>).</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>What happens in a Pandas merge if both tables have a column named ''Status'' that is NOT the join key? (Hint: suffixes).</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Explain what a Many-to-Many merge is and why it can cause MemoryErrors.</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>How do you merge a DataFrame on its Index with another DataFrame on a specific Column? (<code>left_index=True, right_on=''Col''</code>).</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>What does <code>pd.concat(axis=1)</code> do? When would you use it?</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Why is <code>ignore_index=True</code> critical when using <code>pd.concat(axis=0)</code>?</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Explain the <code>join=''inner''</code> vs <code>join=''outer''</code> parameter inside <code>pd.concat()</code>.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write code to concatenate a list of 100 CSV files into a single DataFrame efficiently.</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>What is a CROSS JOIN? How do you perform it in Pandas?</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>How do you find rows that exist in the Left table but NOT in the Right table? (Anti-Join using <code>indicator=True</code>).</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Explain what the <code>indicator=True</code> argument does in <code>pd.merge()</code>.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>How do you merge on multiple columns simultaneously? (<code>on=[''Key1'', ''Key2'']</code>).</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>What is <code>pd.merge_asof()</code>? Why is it crucial for financial tick data or time-series?</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Explain the performance differences between <code>.merge()</code> and <code>.join()</code>.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write code to append a single dictionary as a new row to a DataFrame. Why is <code>df.loc[len(df)]</code> or <code>concat</code> better than <code>.append()</code> (which is deprecated)?</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>How do you merge DataFrames with overlapping columns but selectively choose which columns to keep from the right table?</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>What happens to the data types of integer columns if a merge introduces <code>NaN</code> values? (Hint: upcasts to float).</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Explain how the new nullable integer type <code>Int64</code> solves the NaN float upcasting issue in merges.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write code to validate a merge (e.g., ensuring it''s strictly One-to-Many) using the <code>validate=''1:m''</code> argument.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>How does Pandas handle matching keys that have different data types (e.g., <code>1</code> as int vs <code>''1''</code> as string)?</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>What is the difference between <code>df.update()</code> and <code>pd.merge()</code>?</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Explain <code>df.combine_first()</code>. When would you use it instead of a merge?</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Design a pipeline that merges 3 different relational tables (Users, Orders, Products) into one flat denormalized DataFrame.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 27 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Merge</td><td>Exact equivalent to SQL joins. Maps columns to columns.</td></tr>
<tr><td>2</td><td>Concat</td><td>Equivalent to SQL UNION. Stacks tables. Always use <code>ignore_index=True</code>.</td></tr>
<tr><td>3</td><td>Indicator</td><td>Use <code>indicator=True</code> in merges to debug where data came from.</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can perform a LEFT JOIN using <code>pd.merge()</code>.</p>
<p>• [ ] I can stack DataFrames vertically using <code>pd.concat()</code>.</p>
<p>• [ ] I understand the difference between Merge and Concat.</p>
<p><strong>Next Up: Day 28 - Pandas Series & Time Series Analysis</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Merging (Joins) : Connecting Datasets"}, {"anchor": "checks-Merging-3", "title": "\ud83e\uddea Checks: Merging"}, {"anchor": "sec-14", "title": "2. Concatenation : Stacking Datasets"}, {"anchor": "checks-Concat-16", "title": "\ud83e\uddea Checks: Concat"}, {"anchor": "sec-27", "title": "3. Joining on Index : Index Alignment"}, {"anchor": "checks-Index Join-29", "title": "\ud83e\uddea Checks: Index Join"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day28', '📉 Pandas Time Series', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Data is rarely clean, and it usually involves Time. Today we master Pandas Accessors (<code>.str</code> and <code>.dt</code>) to clean text and extract date features. We then dive into Time Series analysis, learning how to resample frequencies and calculate Rolling Moving Averages.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Accessors</td><td><code>.str.upper()</code>, <code>.dt.year</code></td></tr>
<tr><td>2</td><td>Resample</td><td>Grouping by Time (<code>''M''</code>, <code>''W''</code>)</td></tr>
<tr><td>3</td><td>Rolling</td><td>Moving Averages (MA)</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. String and Datetime Accessors : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">.str and .dt</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Pandas provides specialized methods for specific data types using <b>Accessors</b>. If a column contains strings, use the <code>.str</code> accessor to apply string methods (like <code>.upper()</code>). If it contains dates, use <code>.dt</code> to extract the year or month.</p>
<pre class="nb-code-block"><code># String Accessor
df[&#x27;Name&#x27;] = df[&#x27;Name&#x27;].str.upper().str.strip()

# Datetime Accessor
df[&#x27;Year&#x27;] = df[&#x27;Date&#x27;].dt.year</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Text Cleaning</strong>: Removing leading/trailing spaces from a column of messy user inputs</p>
<p>• <strong>Seasonality</strong>: Extracting the <code>DayOfWeek</code> from a Timestamp to see if weekend sales are higher</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Type Errors</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>You cannot use <code>.dt</code> on a string column! You must first convert it: <code>df[''Date''] = pd.to_datetime(df[''DateString''])</code> before using the accessor.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">import pandas as pd

df = pd.DataFrame({
    &#x27;Product&#x27;: [&#x27; Apple &#x27;, &#x27;BANANA&#x27;, &#x27;cherry_pie&#x27;],
    &#x27;Bought&#x27;: [&#x27;2023-12-25&#x27;, &#x27;2024-01-01&#x27;, &#x27;2024-02-14&#x27;]
})

# String Accessors
df[&#x27;Clean_Product&#x27;] = df[&#x27;Product&#x27;].str.strip().str.title()
print(&quot;Clean Strings:\n&quot;, df[[&#x27;Product&#x27;, &#x27;Clean_Product&#x27;]])

# Convert to Datetime FIRST
df[&#x27;Date&#x27;] = pd.to_datetime(df[&#x27;Bought&#x27;])

# Datetime Accessors
df[&#x27;Year&#x27;] = df[&#x27;Date&#x27;].dt.year
df[&#x27;Month&#x27;] = df[&#x27;Date&#x27;].dt.month_name()
print(&quot;\nDates Extracted:\n&quot;, df[[&#x27;Bought&#x27;, &#x27;Year&#x27;, &#x27;Month&#x27;]])</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Accessors-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Accessors</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>df["Text"] = ["  hello  ", " WORLD "]</code>. Use <code>.str.lower().str.strip()</code> to clean it.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a string column <code>"100 USD"</code>. Use <code>.str.replace(" USD", "")</code> to remove the currency.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Convert <code>df["Date"] = ["2020-01-01"]</code> to datetime using <code>pd.to_datetime()</code>. Print the <code>dtypes</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use the <code>.dt</code> accessor to extract the <code>.day</code> from your converted datetime column.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>df["Text"].str.contains("hel")</code> to create a boolean mask. Print it.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Time Series Resampling : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Rolling up Dates</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>When working with Time Series data (where the <b>Index</b> is a Datetime), you can use <b><code>.resample()</code></b>. It is exactly like <code>.groupby()</code>, but specifically for time frequencies (e.g., grouping daily data into monthly averages).</p>
<table>
<thead><tr><th>Frequency</th><th>String</th><th>Example</th></tr></thead><tbody>
<tr><td>Daily</td><td><code>''D''</code></td><td><code>df.resample(''D'').sum()</code></td></tr>
<tr><td>Weekly</td><td><code>''W''</code></td><td><code>df.resample(''W'').mean()</code></td></tr>
<tr><td>Monthly</td><td><code>''M''</code></td><td><code>df.resample(''M'').max()</code></td></tr>
<tr><td>Quarterly</td><td><code>''Q''</code></td><td><code>df.resample(''Q'').count()</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Financial Aggregations</strong>: Converting minute-by-tick stock data into Daily OHLC (Open, High, Low, Close) bars</p>
<p>• <strong>Smoothing</strong>: Aggregating noisy daily web traffic into smooth Weekly averages</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <code>.resample()</code> ONLY works if your DataFrame''s index is a <code>DatetimeIndex</code>! Use <code>df.set_index(''DateColumn'', inplace=True)</code> before attempting to resample.
</div></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import pandas as pd
import numpy as np

# Create 10 days of data
dates = pd.date_range(start=&#x27;2024-01-01&#x27;, periods=10, freq=&#x27;D&#x27;)
df = pd.DataFrame({
    &#x27;Sales&#x27;: np.random.randint(100, 500, 10)
}, index=dates)

print(&quot;Daily Data (First 5):\n&quot;, df.head())

# Resample to Weekly (&#x27;W&#x27;) and Sum
weekly = df.resample(&#x27;W&#x27;).sum()
print(&quot;\nWeekly Total Sales:\n&quot;, weekly)

# Resample to 3-Day periods and Mean
threeday = df.resample(&#x27;3D&#x27;).mean()
print(&quot;\n3-Day Average Sales:\n&quot;, threeday)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Resampling-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Resampling</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create <code>dates = pd.date_range("2020-01-01", periods=30, freq="D")</code> and a DF with it as the index.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Fill the DF with a <code>Sales</code> column of random integers. Print <code>df.head()</code>.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Resample the daily data to Weekly (<code>"W"</code>) and calculate the <code>.sum()</code>. Print it.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Resample the data to Monthly (<code>"M"</code>) and calculate the <code>.mean()</code>. Print it.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> What happens if you try to resample a DataFrame whose index is just integers (0,1,2...)? Catch the TypeError.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Rolling Windows : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Moving Averages</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A <b>Rolling Window</b> calculates statistics over a sliding window of time. The most common use case is the <b>Moving Average</b>, which smooths out short-term fluctuations in data to highlight longer-term trends.</p>
<pre class="nb-code-block"><code># Calculate a 7-day moving average
df[&#x27;7D_MA&#x27;] = df[&#x27;Sales&#x27;].rolling(window=7).mean()</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Stock Analysis</strong>: Calculating the 50-day and 200-day moving averages to find ''Golden Cross'' buy signals</p>
<p>• <strong>Trend Detection</strong>: Smoothing out weekday vs weekend sales spikes to see the true month-over-month growth</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>The first <code>N-1</code> rows of a rolling window of size <code>N</code> will result in <code>NaN</code>, because there isn''t enough historical data to calculate the full window yet. You can use <code>min_periods=1</code> to calculate partial windows.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import pandas as pd

# 10 days of volatile sales data
df = pd.DataFrame({
    &#x27;Sales&#x27;: [10, 100, 20, 90, 15, 110, 25, 95, 30, 105]
})

# Calculate a 3-day Rolling Mean
df[&#x27;3D_Avg&#x27;] = df[&#x27;Sales&#x27;].rolling(window=3).mean()

# Calculate a 3-day Rolling Sum
df[&#x27;3D_Sum&#x27;] = df[&#x27;Sales&#x27;].rolling(window=3).sum()

print(&quot;Notice the NaNs in the first 2 rows!&quot;)
print(df)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Rolling-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Rolling</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Given <code>df["Prices"] = [10, 20, 30, 40, 50]</code>. Calculate a rolling mean with <code>window=2</code>.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Observe the <code>NaN</code> in the first row. Add <code>min_periods=1</code> to the <code>.rolling()</code> call and print again.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Calculate a rolling <code>.max()</code> with <code>window=3</code>. Print it.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Calculate an expanding sum (cumulative sum) using <code>df["Prices"].expanding().sum()</code>. Print it.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Explain why moving averages are essential for visualizing highly volatile daily data.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (String Pipeline):</strong> Create <code>df = pd.DataFrame({''Code'': ['' id-01 '', ''id-02'', '' ID-03 '']})</code>. Write a chained pipeline using <code>.str</code> to: strip whitespace, convert to uppercase, and replace ''-'' with ''_''. Result should be ''ID_01''.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Datetime Features):</strong> Create a single Datetime column for ''2023-12-25''. Use the <code>.dt</code> accessor to extract the Year, Month, Day, and <code>day_name()</code> into 4 separate new columns.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Monthly Aggregation):</strong> Generate 365 days of random sales data for the year 2023. Set the date as the index. Resample to Monthly (''M'') and find the Total Sales and Max Daily Sale per month using <code>.agg([''sum'', ''max''])</code>.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Golden Cross):</strong> Generate 100 days of stock prices. Calculate the 10-day moving average and the 30-day moving average. Add both as columns to the DataFrame.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Shift and Differences):</strong> Use the <code>.shift(1)</code> method on a <code>Sales</code> column to create a <code>Previous_Day_Sales</code> column. Then calculate the <code>Daily_Growth</code> by subtracting them. This is how Day-over-Day metrics are made!</p></div>
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
<h3>Explain the difference between the <code>.str</code> accessor and the <code>.dt</code> accessor.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>How do you convert a string column ''Jan 15, 2023'' into a Pandas datetime object?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>What happens if you use <code>pd.to_datetime()</code> on a column that has mixed or European date formats? (Hint: <code>dayfirst=True</code> or <code>format=...</code>).</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write code to extract the day of the week (e.g., ''Monday'') from a datetime column.</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Explain what a DatetimeIndex is. Why is it required for <code>.resample()</code>?</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>What is the difference between <code>.resample(''M'').mean()</code> and <code>.groupby(df.index.month).mean()</code>?</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>How do you handle the <code>NaN</code> values generated by a <code>.rolling(window=30)</code> calculation?</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Explain the difference between a Rolling window and an Expanding window.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write code to calculate the Exponential Moving Average (EMA) using <code>.ewm()</code>.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>How do you calculate the day-over-day percentage change in Pandas? (Hint: <code>.pct_change()</code>).</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write code using <code>.str.contains()</code> with a regex to filter rows that contain an email address.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>How do you split a string column ''First Last'' into two separate columns ''First'' and ''Last''? (<code>.str.split(expand=True)</code>).</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Explain <code>.shift()</code>. How is it used to calculate differences between consecutive rows?</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>What does <code>.diff()</code> do? How does it relate to <code>.shift()</code>?</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>How do you handle Time Zones in Pandas datetime objects? (<code>.dt.tz_localize()</code> and <code>.tz_convert()</code>).</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write a <code>.resample()</code> operation that aggregates trade data into OHLC (Open, High, Low, Close) bars.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Explain the <code>pd.DateOffset</code> object and how it''s used to add exactly one month to a datetime column.</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>How do you fill missing dates in a Time Series so that every single day has a row? (Hint: <code>.asfreq(''D'')</code>).</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write code to interpolate missing values in a time series quadratically.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>What is a <code>Timedelta</code>? How do you calculate the number of days between two datetime columns?</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Explain how to use <code>.str.get_dummies()</code> for One-Hot Encoding a categorical string column.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write code to filter a Time Series DataFrame to only include business days (Monday-Friday).</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>How do you slice a Time Series DataFrame using partial string indexing? (e.g., <code>df.loc[''2023-01'']</code>).</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>What is ''Look-ahead bias'' in Time Series analysis, and how do rolling windows help prevent it?</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write code to calculate the rolling standard deviation (volatility) of a stock price over a 20-day window.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 28 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>.str / .dt</td><td>Unlock hundreds of type-specific methods on entire columns</td></tr>
<tr><td>2</td><td>Resample</td><td>It''s just <code>groupby</code> but for dates. Requires a DatetimeIndex.</td></tr>
<tr><td>3</td><td>Rolling</td><td>Calculates stats over a sliding window. First <code>N</code> rows will be NaN.</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can use <code>.str</code> to clean text columns.</p>
<p>• [ ] I can <code>.resample()</code> daily data into monthly data.</p>
<p>• [ ] I can calculate a 7-day rolling moving average.</p>
<p><strong>Next Up: Day 29 - Data Visualization with Seaborn</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. String and Datetime Accessors : .str and .dt"}, {"anchor": "checks-Accessors-3", "title": "\ud83e\uddea Checks: Accessors"}, {"anchor": "sec-14", "title": "2. Time Series Resampling : Rolling up Dates"}, {"anchor": "checks-Resampling-16", "title": "\ud83e\uddea Checks: Resampling"}, {"anchor": "sec-27", "title": "3. Rolling Windows : Moving Averages"}, {"anchor": "checks-Rolling-29", "title": "\ud83e\uddea Checks: Rolling"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day29', '🎨 Data Visualization', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Data is useless if stakeholders can''t understand it. Seaborn translates complex Pandas aggregations into stunning, publication-ready visualizations. Today we master Histograms, Box plots, and the magical <code>hue</code> parameter to uncover hidden dimensions in our data.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Basic</td><td>Scatter & Line plots</td></tr>
<tr><td>2</td><td>Dist</td><td>Histograms & Boxplots</td></tr>
<tr><td>3</td><td>Hue</td><td>Multi-dimensional color</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Seaborn Basics : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Statistical Visualization</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <b>Seaborn</b> is a data visualization library built on top of Matplotlib. It integrates deeply with Pandas DataFrames and provides beautiful default themes. While Pandas is for crunching numbers, Seaborn is for <i>communicating</i> those numbers to stakeholders.
</div></div>
<pre class="nb-code-block"><code>import seaborn as sns
import matplotlib.pyplot as plt

# Create a basic scatter plot
sns.scatterplot(data=df, x=&#x27;Age&#x27;, y=&#x27;Salary&#x27;)
plt.show() # Always call this to render the plot!</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Storytelling</strong>: Transforming a boring table of 10,000 rows into a clear trend line showing revenue growth</p>
<p>• <strong>Outlier Detection</strong>: Using Box plots to instantly spot anomalous transactions visually</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Forgetting plt.show()</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Seaborn draws the plot, but <code>matplotlib.pyplot.show()</code> is required to display it in many environments. Always import both libraries!</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd

# Create sample data
df = pd.DataFrame({
    &#x27;Experience&#x27;: [1, 2, 3, 4, 5, 6],
    &#x27;Salary&#x27;: [40, 45, 60, 65, 80, 85]
})

# 1. Set a beautiful theme
sns.set_theme(style=&quot;darkgrid&quot;)

# 2. Create the plot (pass the DataFrame and column names!)
sns.scatterplot(data=df, x=&#x27;Experience&#x27;, y=&#x27;Salary&#x27;, color=&#x27;blue&#x27;, s=100)

# 3. Add titles using matplotlib
plt.title(&quot;Salary vs Experience&quot;)
plt.xlabel(&quot;Years of Experience&quot;)
plt.ylabel(&quot;Salary ($k)&quot;)

# 4. Show the plot
print(&quot;Plot successfully generated! (Imagine a beautiful scatterplot here)&quot;)
# plt.show() # Commented out for text-only execution</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Seaborn Intro-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Seaborn Intro</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import <code>seaborn as sns</code> and <code>matplotlib.pyplot as plt</code>.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Load Seaborn''s built in dataset: <code>tips = sns.load_dataset("tips")</code>. Print <code>tips.head()</code>.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create a scatterplot mapping <code>x="total_bill"</code> and <code>y="tip"</code>. Use <code>data=tips</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Add a title using <code>plt.title("Bill vs Tip")</code>.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Call <code>plt.show()</code> to render the plot.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Distributions & Categoricals : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Understanding the Shape</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Before modeling, you must understand the shape of your data. <b>Histograms</b> (<code>histplot</code>) show the distribution of a single continuous variable. <b>Bar plots</b> (<code>barplot</code>) and <b>Box plots</b> (<code>boxplot</code>) show the relationship between a categorical variable and a continuous variable.</p>
<table>
<thead><tr><th>Plot Type</th><th>Purpose</th><th>Seaborn Function</th></tr></thead><tbody>
<tr><td>Histogram</td><td>Distribution of 1 numeric col</td><td><code>sns.histplot(x=''Age'')</code></td></tr>
<tr><td>Bar Plot</td><td>Aggregation (Mean) per category</td><td><code>sns.barplot(x=''Dept'', y=''Salary'')</code></td></tr>
<tr><td>Box Plot</td><td>Spread and Outliers per category</td><td><code>sns.boxplot(x=''Dept'', y=''Salary'')</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Audience Demographics</strong>: Plotting a histogram of user ages to see if your app is popular with Gen Z or Boomers</p>
<p>• <strong>A/B Testing</strong>: Using a boxplot to compare the spread of checkout times between Group A and Group B</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>By default, <code>sns.barplot</code> calculates the <b>Mean</b> of the y-variable for each category and adds error bars! If you just want to count occurrences, use <code>sns.countplot(x=''Category'')</code> instead.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import seaborn as sns
import matplotlib.pyplot as plt

print(&quot;Common Plots for EDA (Exploratory Data Analysis):\n&quot;)

print(&quot;1. HISTOGRAM (Spread of a single variable)&quot;)
print(&quot;sns.histplot(data=df, x=&#x27;Age&#x27;, bins=20, kde=True)&quot;)

print(&quot;\n2. BAR PLOT (Average continuous per category)&quot;)
print(&quot;sns.barplot(data=df, x=&#x27;Department&#x27;, y=&#x27;Salary&#x27;)&quot;)

print(&quot;\n3. COUNT PLOT (Number of rows per category)&quot;)
print(&quot;sns.countplot(data=df, x=&#x27;Department&#x27;)&quot;)

print(&quot;\n4. BOX PLOT (Outliers and Quartiles)&quot;)
print(&quot;sns.boxplot(data=df, x=&#x27;Department&#x27;, y=&#x27;Salary&#x27;)&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Plot Types-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Plot Types</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Using the <code>tips</code> dataset, create a histogram of <code>"total_bill"</code> using <code>sns.histplot()</code>.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Add the argument <code>kde=True</code> to the histogram to overlay a smooth density curve.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create a Bar plot showing the average tip per day: <code>x="day"</code>, <code>y="tip"</code>. Use <code>sns.barplot()</code>.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a Count plot to see how many transactions happened on each day: <code>x="day"</code>. Use <code>sns.countplot()</code>.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Create a Box plot of <code>total_bill</code> per <code>day</code> to spot outliers. <code>sns.boxplot()</code>.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. The Hue Parameter : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Adding Dimensions</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>The most powerful feature in Seaborn is the <b><code>hue</code></b> parameter. It automatically groups your data by a categorical column and colors the plot elements accordingly. It turns a simple 2D plot into a 3D or 4D visualization with zero extra code.</p>
<pre class="nb-code-block"><code># Instantly color-code the scatterplot by Gender
sns.scatterplot(data=df, x=&#x27;Age&#x27;, y=&#x27;Salary&#x27;, hue=&#x27;Gender&#x27;)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Deep Insights</strong>: A scatterplot might show a positive correlation. Adding <code>hue=''Region''</code> might reveal that the correlation only exists in Europe!</p>
<p>• <strong>Segmentation</strong>: Overlaying two histograms (e.g., Male vs Female heights) using <code>hue</code> to see where the distributions overlap</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Combine <code>hue</code> with <code>col</code> in <code>sns.relplot()</code> or <code>sns.catplot()</code> to automatically generate a grid of multiple subplots based on categorical variables (Facet Grids)!</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import seaborn as sns
import matplotlib.pyplot as plt

print(&quot;The Power of HUE:\n&quot;)

print(&quot;Without Hue: All dots are blue.&quot;)
print(&quot;sns.scatterplot(data=tips, x=&#x27;total_bill&#x27;, y=&#x27;tip&#x27;)\n&quot;)

print(&quot;With Hue: Dots are colored by Time (Lunch/Dinner), legend added automatically!&quot;)
print(&quot;sns.scatterplot(data=tips, x=&#x27;total_bill&#x27;, y=&#x27;tip&#x27;, hue=&#x27;time&#x27;)\n&quot;)

print(&quot;Hue works on almost all Seaborn plots!&quot;)
print(&quot;sns.histplot(data=tips, x=&#x27;total_bill&#x27;, hue=&#x27;sex&#x27;, multiple=&#x27;stack&#x27;)&quot;)
print(&quot;sns.barplot(data=tips, x=&#x27;day&#x27;, y=&#x27;tip&#x27;, hue=&#x27;smoker&#x27;)&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Hue & Colors-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Hue & Colors</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a scatterplot of <code>total_bill</code> vs <code>tip</code>. Add <code>hue="smoker"</code> to color the dots.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a Box plot of <code>total_bill</code> grouped by <code>day</code>. Add <code>hue="sex"</code> to split each box into two.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create a Histogram of <code>total_bill</code>. Add <code>hue="time"</code> and <code>multiple="stack"</code> to create a stacked histogram.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Try adding <code>style="time"</code> along with <code>hue="smoker"</code> in a scatterplot. Observe how the dot shapes change.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Change the color palette by passing <code>palette="husl"</code> to any of the plots above.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (The Matrix):</strong> Load <code>tips</code>. Use <code>tips.corr(numeric_only=True)</code> to generate a correlation matrix. Pass this matrix into <code>sns.heatmap(matrix, annot=True, cmap=''coolwarm'')</code>. This is the most important plot in Machine Learning!</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Pairplot):</strong> Run <code>sns.pairplot(tips, hue=''sex'')</code>. Warning: this takes a few seconds. It generates a scatterplot for EVERY combination of numeric variables automatically!</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Time Series Plot):</strong> Create a fake Time Series DF with a <code>Date</code> column and <code>Sales</code>. Use <code>sns.lineplot(data=df, x=''Date'', y=''Sales'')</code>. Lineplots are best for chronological data.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Customizing Axes):</strong> Create a barplot. Before <code>plt.show()</code>, use <code>plt.xticks(rotation=45)</code> to rotate the X-axis labels so they don''t overlap. Use <code>plt.ylim(0, 100)</code> to set the Y-axis limits.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Facet Grids):</strong> Use <code>sns.catplot(data=tips, x=''time'', y=''total_bill'', col=''day'', kind=''box'')</code>. Observe how it creates 4 separate plots (one for each day) side-by-side automatically.</p></div>
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
<h3>What is the relationship between Seaborn and Matplotlib?</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Explain the difference between a Bar Plot and a Histogram.</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>What do the ''whiskers'' and ''dots'' represent in a Box Plot? (Hint: IQR and outliers).</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Why is <code>sns.countplot()</code> often preferred over <code>.groupby().size().plot.bar()</code>?</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Explain the <code>hue</code> parameter in Seaborn. Why is it so powerful for EDA?</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>What is a KDE (Kernel Density Estimate) curve?</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>How do you resize a Seaborn plot? (Hint: <code>plt.figure(figsize=(10, 6))</code>).</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write code to generate a Correlation Heatmap using Pandas and Seaborn.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>What is the difference between <code>sns.scatterplot()</code> and <code>sns.relplot()</code>?</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Explain what <code>sns.pairplot()</code> does. Why should you be careful using it on datasets with 100+ columns?</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>How do you save a Seaborn plot to a <code>.png</code> file instead of displaying it? (<code>plt.savefig()</code>).</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>What does the <code>ci=None</code> or <code>errorbar=None</code> parameter do in a Seaborn bar plot?</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>How do you overlay two different plots (e.g., a lineplot on top of a barplot) in the same figure?</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Explain how to use <code>plt.subplots()</code> to create a 2x2 grid of distinct charts.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>What is a Violin plot (<code>sns.violinplot</code>)? How does it differ from a Box plot?</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>How do you change the default color palette globally in Seaborn? (<code>sns.set_palette()</code>).</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write code to plot a regression line through a scatterplot automatically. (<code>sns.regplot()</code> or <code>lmplot</code>).</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Why is it dangerous to rely solely on aggregate plots (like bar charts) without looking at distributions (like swarm plots)? (Hint: Anscombe''s quartet).</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>How do you rotate X-axis labels in Matplotlib if they are overlapping?</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Explain how to annotate a specific point on a plot with text. (<code>plt.annotate()</code>).</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>What is a Swarm plot (<code>sns.swarmplot</code>)? When does it fail? (Hint: huge datasets).</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>How do you set a logarithmic scale for the Y-axis? (<code>plt.yscale(''log'')</code>).</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>What is the purpose of <code>sns.set_theme()</code>? What styles does it offer?</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write code to create a dual-axis chart (two different Y-axes) using Matplotlib <code>twinx()</code>.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Explain the tradeoff between beautiful visualizations and data processing speed in a production pipeline.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 29 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>EDA</td><td>Always visualize distributions before building ML models.</td></tr>
<tr><td>2</td><td>Boxplot</td><td>Instantly identifies outliers outside the Interquartile Range (IQR).</td></tr>
<tr><td>3</td><td>Hue</td><td>Groups and colors data by a category automatically.</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can create a scatterplot and lineplot.</p>
<p>• [ ] I can view data distributions using a histogram.</p>
<p>• [ ] I can use the <code>hue</code> parameter to split data.</p>
<p><strong>Next Up: Day 30 - Phase 2 Capstone: The EDA Project</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Seaborn Basics : Statistical Visualization"}, {"anchor": "checks-Seaborn Intro-3", "title": "\ud83e\uddea Checks: Seaborn Intro"}, {"anchor": "sec-14", "title": "2. Distributions & Categoricals : Understanding the Shape"}, {"anchor": "checks-Plot Types-16", "title": "\ud83e\uddea Checks: Plot Types"}, {"anchor": "sec-27", "title": "3. The Hue Parameter : Adding Dimensions"}, {"anchor": "checks-Hue & Colors-29", "title": "\ud83e\uddea Checks: Hue & Colors"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day30', '🔬 Phase Analysis & Review', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Congratulations. You have reached Day 30. Today is the ultimate test of your Data Analytics skills. You will ingest messy data, clean it, merge it, aggregate it, and visualize the story it tells. This is exactly what professional Data Analysts do every day.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Ingestion</td><td>Loading & Merging</td></tr>
<tr><td>2</td><td>Cleaning</td><td>NaNs, Types, & Outliers</td></tr>
<tr><td>3</td><td>Insight</td><td>Aggregation & Vis</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Phase 2 Capstone : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Exploratory Data Analysis</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>You have mastered Pandas and Seaborn. You can clean missing data, merge tables, group statistics, and visualize trends. <b>Today is the Phase 2 Capstone.</b> You will perform a complete Exploratory Data Analysis (EDA) pipeline on a raw, messy dataset.</p>
<h3>🎯 The Mission: Customer Churn Analysis</h3>
<p>You will simulate loading a messy Customer CSV and a Transaction CSV. You will merge them, clean the data, calculate Customer Lifetime Value (CLV), and visualize which demographics are churning.</p>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Portfolio Piece</strong>: A complete end-to-end Jupyter Notebook analyzing data is the standard requirement for Data Analyst job interviews</p>
<p>• <strong>Real-world simulation</strong>: Data is never in one table, and it is never clean</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Jumping to Code</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Don''t start writing <code>pd.read_csv()</code> blindly. Write a markdown cell outlining your 5-step plan: 1. Load, 2. Clean, 3. Merge, 4. Feature Engineering, 5. Visualization.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Outline of the EDA Pipeline:

# 1. Ingestion
# customers = pd.read_csv(&#x27;...&#x27;)
# txns = pd.read_csv(&#x27;...&#x27;)

# 2. Cleaning
# customers.dropna(subset=[&#x27;ID&#x27;], inplace=True)
# txns[&#x27;Amount&#x27;] = pd.to_numeric(txns[&#x27;Amount&#x27;], errors=&#x27;coerce&#x27;)

# 3. Merging
# df = pd.merge(customers, txns, on=&#x27;ID&#x27;, how=&#x27;left&#x27;)

# 4. Aggregation
# summary = df.groupby(&#x27;Region&#x27;)[&#x27;Amount&#x27;].sum()

# 5. Visualization
# sns.barplot(data=summary.reset_index(), x=&#x27;Region&#x27;, y=&#x27;Amount&#x27;)
# plt.show()

print(&quot;Ready for the final challenge?&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Capstone-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Capstone</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Plan the Cleaning Phase. What 3 Pandas methods will you use to handle missing data and wrong types?</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Plan the Merge Phase. Why would you use a <code>LEFT JOIN</code> (Customers -> Txns) instead of an <code>INNER JOIN</code>?</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Plan the Feature Engineering Phase. How will you calculate <code>Total_Spent</code> per user? (Hint: <code>groupby().transform("sum")</code>).</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Plan the Vis Phase. What Seaborn plot is best to show the distribution of <code>Age</code>? What about <code>Total_Spent</code> by <code>Gender</code>?</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Set up your notebook: Import <code>pandas as pd</code>, <code>numpy as np</code>, <code>seaborn as sns</code>, and <code>matplotlib.pyplot as plt</code>.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Data Generation : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Creating the Simulation</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Since we don''t have external CSV files, we will generate synthetic data using NumPy and Pandas. Generating fake data is an excellent skill for testing pipelines.</p>
<p>We need two tables:</p>
<p>1. <strong><code>customers</code></strong>: <code>ID</code>, <code>Age</code> (with some NaNs), <code>Region</code>, <code>Churned</code> (Boolean).</p>
<p>2. <strong><code>transactions</code></strong>: <code>Txn_ID</code>, <code>Cust_ID</code>, <code>Amount</code> (with some ''$'' strings), <code>Date</code>.</p>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Testing Logic</strong>: If your code works on this synthetic data, it will work on the real data database extract.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import pandas as pd
import numpy as np

# Generate 100 Customers
cust_df = pd.DataFrame({
    &#x27;ID&#x27;: range(1, 101),
    &#x27;Age&#x27;: np.random.randint(18, 70, 100).astype(float),
    &#x27;Region&#x27;: np.random.choice([&#x27;North&#x27;, &#x27;South&#x27;, &#x27;East&#x27;, &#x27;West&#x27;], 100),
    &#x27;Churned&#x27;: np.random.choice([0, 1], 100, p=[0.8, 0.2])
})
# Inject missing ages
cust_df.loc[np.random.choice(100, 10), &#x27;Age&#x27;] = np.nan

print(&quot;Customers:\n&quot;, cust_df.head(3))</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Simulation-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Simulation</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Execute the customer generation code above. Run <code>cust_df.info()</code> to see the missing values.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Generate a <code>txn_df</code> with 500 rows. <code>Txn_ID</code> (1 to 500), <code>Cust_ID</code> (random 1 to 100).</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Add an <code>Amount</code> column to <code>txn_df</code>. Make 90% of them floats, and 10% of them messy strings like <code>"$50"</code>.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Add a <code>Date</code> column using <code>pd.date_range()</code> and <code>np.random.choice()</code>.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Verify both DataFrames exist and inspect their heads.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Execution & Reporting : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">The Final Deliverable</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Execute the pipeline. Clean the tables, merge them, and answer the core business question: <b>What factors drive Customer Churn?</b></p>
<p>You must produce at least 3 visualizations:</p>
<p>1. A Correlation Heatmap of numeric features.</p>
<p>2. A Barplot comparing Total Revenue by Region.</p>
<p>3. A Boxplot comparing Age distribution between Churned and Retained users.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13"># Example Heatmap code
# corr = final_df.corr(numeric_only=True)
# sns.heatmap(corr, annot=True, cmap=&#x27;RdBu&#x27;, vmin=-1, vmax=1)
# plt.title(&#x27;Correlation Matrix&#x27;)
# plt.show()

print(&quot;The stage is yours. Build the pipeline.&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Execution-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Execution</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Clean <code>Amount</code> in <code>txn_df</code> (remove <code>$</code> and cast to float). Clean <code>Age</code> in <code>cust_df</code> (fill NaN with median).</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Merge <code>cust_df</code> and <code>txn_df</code> on ID using a LEFT JOIN.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create the Correlation Heatmap. Is <code>Age</code> correlated with <code>Amount</code>?</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create the Barplot: <code>x="Region"</code>, <code>y="Amount"</code>, <code>estimator=sum</code>. Which region brings the most revenue?</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Create the Boxplot: <code>x="Churned"</code>, <code>y="Age"</code>. Do older users churn more?</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Feature Engineering):</strong> Create a new column <code>Transaction_Count</code> for each user. (Hint: group <code>txn_df</code> by <code>Cust_ID</code>, calculate <code>.size()</code>, then merge this metric into <code>cust_df</code>).</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Time Series Vis):</strong> Convert <code>Date</code> to a datetime object. Extract the <code>Month</code>. Group by Month and sum the <code>Amount</code>. Plot a Seaborn Lineplot of Revenue over Time.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Cohort Analysis):</strong> Use <code>pd.cut()</code> to bin <code>Age</code> into 3 groups: ''Youth'', ''Adult'', ''Senior''. Create a Countplot (<code>sns.countplot</code>) with <code>x=''Age_Group''</code> and <code>hue=''Churned''</code> to see which demographic churns most.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Outlier Removal):</strong> Before plotting revenue, find the 99th percentile of <code>Amount</code> using <code>.quantile(0.99)</code>. Filter out any rows where Amount is strictly greater than this value to remove massive outliers.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="question task"><p><strong>Task 5 (Executive Summary):</strong> Create a markdown cell at the very bottom of your notebook. Write 3 bullet points summarizing your findings (e.g., ''Seniors in the South region have the highest churn rate''). This is what executives actually read.</p></div>
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
<h3>Walk me through your EDA process when you receive a brand new, undocumented dataset.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>How do you decide whether to drop a column with 20% missing data, vs imputing the values?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Explain the difference between a Left Join and an Inner Join, and why you used one over the other in this project.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>What does a Correlation coefficient of -0.85 tell you? How did you visualize this?</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>When grouping by Customer, what is the difference between summing their transactions vs counting their transactions?</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Why is it important to check for duplicates before aggregating revenue?</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>What plot would you use to show the distribution of a single continuous variable (like Salary)?</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>What plot is best to compare the median and outliers of Salary across 5 different departments?</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Explain what ''Data Leakage'' is in the context of predictive modeling.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>How do you handle a highly imbalanced dataset? (e.g., 99% retained, 1% churned).</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>What does <code>pd.to_datetime(errors=''coerce'')</code> do, and why is it safer than default parsing?</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write code to find the top 5 most valuable customers based on Total Spend.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>How would you optimize this pipeline if the Transactions file was 50GB and couldn''t fit in RAM? (Hint: chunking or Dask/PySpark).</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Explain the ''Split-Apply-Combine'' strategy you used to calculate Regional revenue.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>What is the difference between <code>.agg([''mean'', ''sum''])</code> and <code>.transform(''mean'')</code>?</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>How do you rename columns dynamically after a GroupBy operation flattens the index?</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Why is Seaborn built on top of Matplotlib rather than replacing it?</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Explain the <code>hue</code> parameter in Seaborn. How did it help your Churn analysis?</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>If you noticed a massive spike in revenue on one specific day in your Lineplot, how would you investigate it using Pandas?</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>What are some common pitfalls when using Pie Charts, and why do Data Scientists prefer Bar charts?</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>How would you save your final cleaned DataFrame to a CSV file without the index?</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Explain how you would connect this Pandas script directly to a SQL database instead of reading CSVs.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>What is feature engineering? Give an example of a feature you engineered in this project.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>How do you present technical findings to a non-technical stakeholder?</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Congratulations on completing the 30 Days of Python and Data Analytics. What was the hardest concept for you to grasp, and how did you overcome it?</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 30 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Process</td><td>EDA is iterative. Clean, plot, discover an error, clean again.</td></tr>
<tr><td>2</td><td>Code</td><td>Chain operations logically. Don''t mutate state wildly.</td></tr>
<tr><td>3</td><td>Value</td><td>The code doesn''t matter. The business insight you derive is what matters.</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can clean and merge raw datasets.</p>
<p>• [ ] I can perform Exploratory Data Analysis.</p>
<p>• [ ] I can visualize and communicate business insights.</p>
<p><strong>Next Up: Graduation! 🎉 You are now a competent Python Data Analyst.</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Phase 2 Capstone : Exploratory Data Analysis"}, {"anchor": "checks-Capstone-3", "title": "\ud83e\uddea Checks: Capstone"}, {"anchor": "sec-14", "title": "2. Data Generation : Creating the Simulation"}, {"anchor": "checks-Simulation-16", "title": "\ud83e\uddea Checks: Simulation"}, {"anchor": "sec-27", "title": "3. Execution & Reporting : The Final Deliverable"}, {"anchor": "checks-Execution-29", "title": "\ud83e\uddea Checks: Execution"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb)
ON CONFLICT (day_id) DO UPDATE SET
  title = EXCLUDED.title,
  html_body = EXCLUDED.html_body,
  sections = EXCLUDED.sections,
  cells = EXCLUDED.cells;