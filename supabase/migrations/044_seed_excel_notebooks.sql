-- ═══════════════════════════════════════════════════════════════
-- Seed Notebook Content: Excel Days 01 to 12
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.notebook_content (day_id, title, html_body, sections, cells)
VALUES
('excel-day01', 'Excel Day 01: Excel Orientation & Essential Formulas', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Spreadsheet Coordinates : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Columns, Rows and Operators</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=A1*B1+C1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Basic Formulas-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Basic Formulas</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Calculate the product of A2 and B2.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Sum the quantities in cells A1, A2, and A3 using basic addition (+).</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Subtract tax C1 from price B1.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Divide price B2 by quantity A2.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Calculate total price including tax for item 3 (A3 * B3 + C3).</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Aggregate Quantity):</strong> Calculate the sum of all quantities from A1 to A3 using the SUM function.</p></div>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-18">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Excel Orientation & Essential Formul"}, {"anchor": "sec-1", "title": "1. Spreadsheet Coordinates : Columns, Rows and Operators"}, {"anchor": "checks-Basic Formulas-3", "title": "🧪 Checks: Basic Formulas"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-18", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-7", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-8", "type": "code"}]'::jsonb),
('excel-day02', 'Excel Day 02: Formatting, Sorting & Filtering', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Grid Sorting and Filtering : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Formatting and Data Ordering</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=SUM(C1:C3)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Basic Formulas-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Basic Formulas</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Find the total price of all items in column C.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find the average rating of items in column B.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Count the number of items listed in column A using the COUNT function on ratings in column B.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Total Rating):</strong> Calculate the sum of all ratings from B1 to B3.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Formatting, Sorting & Filtering"}, {"anchor": "sec-1", "title": "1. Grid Sorting and Filtering : Formatting and Data Ordering"}, {"anchor": "checks-Basic Formulas-3", "title": "🧪 Checks: Basic Formulas"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb),
('excel-day03', 'Excel Day 03: Data Cleaning Essentials', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Text Trimming : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Formatting Cases and Cleaning Spacing</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=UPPER(A1)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Basic Cleaning-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Basic Cleaning</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Convert text in A2 to lowercase.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Convert text in A1 to uppercase.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Find the total values in B1 and B2.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Total Values):</strong> Calculate the sum of all numerical cell values from B1 to B2.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Data Cleaning Essentials"}, {"anchor": "sec-1", "title": "1. Text Trimming : Formatting Cases and Cleaning Spacing"}, {"anchor": "checks-Basic Cleaning-3", "title": "🧪 Checks: Basic Cleaning"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb),
('excel-day04', 'Excel Day 04: Excel Tables', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Structured Tables : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Aggregations Over Ranges</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=SUM(A1:B2)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Basic Formulas-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Basic Formulas</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Calculate sum of A1 and B1.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Calculate sum of A2 and B2.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Calculate total base in range A1:A2.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Total Earnings):</strong> Calculate total base plus bonus in range A1:B2.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Excel Tables"}, {"anchor": "sec-1", "title": "1. Structured Tables : Aggregations Over Ranges"}, {"anchor": "checks-Basic Formulas-3", "title": "🧪 Checks: Basic Formulas"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb),
('excel-day05', 'Excel Day 05: Lookup & Reference Functions', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Lookup References : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Lookup and Matching Functions</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=UPPER(B1)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Reference Lookups-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Reference Lookups</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Convert B2 item name to uppercase.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Convert B1 item name to lowercase.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Find sum of A1 and A2.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (ID Casing):</strong> Convert item name Tablet in B1 to uppercase.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Lookup & Reference Functions"}, {"anchor": "sec-1", "title": "1. Lookup References : Lookup and Matching Functions"}, {"anchor": "checks-Reference Lookups-3", "title": "🧪 Checks: Reference Lookups"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb),
('excel-day06', 'Excel Day 06: Logic Functions', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Logical Formulas : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">IF, AND, OR Conditionals</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=IF(A1&gt;=50,1,0)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Basic Logic-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Basic Logic</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Check if student 1 grade A1 is >= 50. Return 1 if true, else 0.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Check if student 2 grade A2 is >= 50. Return 1 if true, else 0.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Check if student 1 attendance B1 is >= 75. Return 1 if true, else 0.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Pass Check):</strong> Check if student 2 grade in A2 is >= 50, returning 1 if true and 0 if false.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Logic Functions"}, {"anchor": "sec-1", "title": "1. Logical Formulas : IF, AND, OR Conditionals"}, {"anchor": "checks-Basic Logic-3", "title": "🧪 Checks: Basic Logic"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb),
('excel-day07', 'Excel Day 07: Text Functions', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. String Manipulation : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Concatenation and Casing</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=CONCAT(A1,B1)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Text Manipulation-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Text Manipulation</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Join first and last name in row 2 using CONCAT.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Convert first name in A1 to uppercase.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Convert last name in B2 to lowercase.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Full Name):</strong> Join Rahul and Sharma in row 1 using CONCAT.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Text Functions"}, {"anchor": "sec-1", "title": "1. String Manipulation : Concatenation and Casing"}, {"anchor": "checks-Text Manipulation-3", "title": "🧪 Checks: Text Manipulation"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb),
('excel-day08', 'Excel Day 08: Date & Time Functions', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Numeric Operations on Dates : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Date Differentials</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=B1-A1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Basic Calculations-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Basic Calculations</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Calculate difference between B2 and A2.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find sum of start days A1 and A2.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Find average of end days B1 and B2.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Date Difference):</strong> Calculate B2 minus A2.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Date & Time Functions"}, {"anchor": "sec-1", "title": "1. Numeric Operations on Dates : Date Differentials"}, {"anchor": "checks-Basic Calculations-3", "title": "🧪 Checks: Basic Calculations"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb),
('excel-day09', 'Excel Day 09: Conditional Aggregation', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Conditional aggregation : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Conditional Summaries</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=IF(B1=&quot;Paid&quot;,A1,0)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Conditional Math-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Conditional Math</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Find the sum of all amounts in range A1:A3.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Check if row 2 status B2 is Pending, returning A2 if true and 0 if false.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Convert status B1 to uppercase.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Paid Amount Check):</strong> Check if status B3 is Paid, returning amount A3 if true and 0 if false.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Conditional Aggregation"}, {"anchor": "sec-1", "title": "1. Conditional aggregation : Conditional Summaries"}, {"anchor": "checks-Conditional Math-3", "title": "🧪 Checks: Conditional Math"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb),
('excel-day10', 'Excel Day 10: PivotTables Core Mechanics', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Pivot Summarization : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Cross Tabulations</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=SUM(B1:B2)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Basic Formulas-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Basic Formulas</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Sum values in B1 and B2.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Find the average of values in range B1:B2.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Convert category in A1 to lowercase.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Total revenue):</strong> Calculate sum of all revenues from B1 to B2.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: PivotTables Core Mechanics"}, {"anchor": "sec-1", "title": "1. Pivot Summarization : Cross Tabulations"}, {"anchor": "checks-Basic Formulas-3", "title": "🧪 Checks: Basic Formulas"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb),
('excel-day11', 'Excel Day 11: PivotTables Advanced & Charts', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Advanced Aggregations : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Dynamic Slicing and Ranges</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=SUM(B1:B2)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Basic Math-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Basic Math</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Calculate average hours worked across B1:B2.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Check if project in A1 is Alpha, returning B1 if true and 0 if false.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Join A1 and A2 using CONCAT.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Total Hours):</strong> Calculate the sum of all hours from B1 to B2.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: PivotTables Advanced & Charts"}, {"anchor": "sec-1", "title": "1. Advanced Aggregations : Dynamic Slicing and Ranges"}, {"anchor": "checks-Basic Math-3", "title": "🧪 Checks: Basic Math"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb),
('excel-day12', 'Excel Day 12: Data Validation, What-If & Capstone', '<div class="nb-section" id="sec-0">
<div class="nb-rich"><div class="excel-grid-container" style="margin: 20px 0; overflow-x: auto;">
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
</div></div>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Capstone Calculations : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Final Capstone Audits</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 Concept</b><br>
</div></div>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">=B1-A1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Capstone Formulas-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Capstone Formulas</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Calculate profit for project 2 (B2 - A2).</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Calculate total cost across A1:A2.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Calculate total revenue across B1:B2.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<div class="question task"><p><strong>Task 1 (Total Profit):</strong> Calculate total profit across both projects (B1 - A1 + B2 - A2).</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-14">
<div class="question interview"><p><strong>Q1.</strong></p>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6">=Write your Excel formula here</textarea>
<div class="cell-output hidden"></div></div>
</div>', '[{"anchor": "sec-0", "title": "🎯 Enterprise Objective: Data Validation, What-If & Capstone"}, {"anchor": "sec-1", "title": "1. Capstone Calculations : Final Capstone Audits"}, {"anchor": "checks-Capstone Formulas-3", "title": "🧪 Checks: Capstone Formulas"}, {"anchor": "practice", "title": "🛠️ Practice Tasks"}, {"anchor": "interview", "title": "💻 Interview Questions"}, {"anchor": "sec-14", "title": "Q1."}]'::jsonb, '[{"type": "markdown"}, {"type": "markdown"}, {"id": "cell-1", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-2", "type": "code"}, {"type": "markdown"}, {"id": "cell-3", "type": "code"}, {"type": "markdown"}, {"id": "cell-4", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-5", "type": "code"}, {"type": "markdown"}, {"type": "markdown"}, {"id": "cell-6", "type": "code"}]'::jsonb);
