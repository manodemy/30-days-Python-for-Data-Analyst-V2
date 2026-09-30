// Python Day 02 — Operators, Precedence & Expressions (Unified Single-Document Architecture)
if (!window.COURSE_CONTENT) window.COURSE_CONTENT = {};
window.COURSE_CONTENT['pyDay02'] = {
  day: 2,
  title: "Operators, Precedence & Expressions",
  emoji: "⚙️",
  topics: [
    { id: 'day02ArithSection', label: 'Operators, Precedence & Expressions', duration: '18:30' }
  ],

  slides: [
    {
      title: "Operators, Precedence & Expressions",
      duration: "18:30",
      html: `
<h2>⚙️ Operators, Precedence &amp; Expressions</h2>

<!-- ═══ EMBEDDED PYTHON FLAGSHIP VISUAL DESIGN STYLES ═══ -->
<style>
  .py-infographic-card {
    background: linear-gradient(135deg, rgba(15, 23, 42, 0.96) 0%, rgba(8, 14, 28, 0.98) 100%);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 12px;
    padding: 16px 18px;
    margin: 14px 0;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.35), inset 0 1px 0 rgba(255, 255, 255, 0.05);
  }
  .py-info-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 10px;
    margin-bottom: 12px;
    padding-bottom: 8px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.06);
  }
  .py-info-title {
    font-family: 'Outfit', sans-serif;
    font-size: 0.82rem;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: #38bdf8;
    display: flex;
    align-items: center;
    gap: 8px;
  }
  .py-badge {
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.68rem;
    font-weight: 700;
    padding: 2px 8px;
    border-radius: 4px;
    background: rgba(56, 189, 248, 0.12);
    border: 1px solid rgba(56, 189, 248, 0.28);
    color: #38bdf8;
  }
  .py-badge-gold {
    background: rgba(245, 158, 11, 0.12);
    border-color: rgba(245, 158, 11, 0.28);
    color: #fbbf24;
  }
  .py-badge-green {
    background: rgba(34, 197, 94, 0.12);
    border-color: rgba(34, 197, 94, 0.28);
    color: #4ade80;
  }
  .py-badge-purple {
    background: rgba(168, 85, 247, 0.12);
    border-color: rgba(168, 85, 247, 0.28);
    color: #c084fc;
  }
  .py-badge-rose {
    background: rgba(244, 63, 94, 0.12);
    border-color: rgba(244, 63, 94, 0.28);
    color: #fb7185;
  }

  /* Precedence Pyramid Hierarchy */
  .precedence-pyramid {
    display: flex;
    flex-direction: column;
    gap: 5px;
    margin: 12px 0;
  }
  .pyr-level {
    display: flex;
    align-items: center;
    border-radius: 6px;
    padding: 7px 12px;
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.72rem;
    font-weight: 700;
    transition: all 0.2s ease;
  }
  .pyr-level:hover {
    transform: translateX(4px);
  }
  .pyr-label {
    width: 140px;
    color: #94a3b8;
    font-size: 0.65rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }
  .pyr-ops {
    flex: 1;
    font-size: 0.78rem;
  }
  .pyr-assoc {
    font-size: 0.62rem;
    color: #64748b;
  }

  /* Bitmask RBAC Card */
  .bitmask-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 8px;
    margin-top: 8px;
  }
  @media (max-width: 640px) {
    .bitmask-grid { grid-template-columns: 1fr; }
  }
  .bitmask-cell {
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid rgba(255, 255, 255, 0.07);
    border-radius: 8px;
    padding: 10px;
    text-align: center;
  }

  /* Topic Subcard */
  .topic-subcard {
    margin-top: 18px;
    padding-top: 14px;
    border-top: 1px dashed rgba(255, 255, 255, 0.08);
  }
</style>

<!-- ═══ SECTION 1: 01. Arithmetic & Division Mechanics ═══ -->
<div class="slide-section" id="day02ArithSection">
  <div class="heading-with-audio" style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
    <h3 style="margin:0;font-size:1.15rem;font-weight:800;letter-spacing:-0.02em;flex:1;">01. Numeric Operations &amp; In-Place Mutation</h3>
    <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio01.mp3', this)" title="Play narration">
      <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
    </button>
  </div>
  <p>Python provides standard arithmetic operators (<code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>, <code>//</code>, <code>%</code>, <code>**</code>) alongside augmented assignment operators (<code>+=</code>, <code>-=</code>, <code>*=</code>, etc.). Crucially, augmented assignment behaves differently depending on mutability: on <strong>immutable objects</strong> (numbers, strings, tuples), <code>a += b</code> rebinds a new object to variable <code>a</code>. On <strong>mutable objects</strong> (lists, bytearrays), <code>a += b</code> mutates the existing object in-place (calling <code>__iadd__</code>), impacting all variables referencing that container.</p>

  <!-- Infographic: In-Place Mutation vs Rebinding -->
  <div class="py-infographic-card">
    <div class="py-info-header">
      <div class="py-info-title">
        <span>🔬 Memory Architecture: In-Place Mutation vs Variable Rebinding</span>
      </div>
      <span class="py-badge py-badge-purple">Pointer Analysis</span>
    </div>
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;">
      <div style="background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-radius:8px;padding:12px;">
        <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:6px;">
          <strong style="color:#f59e0b;font-size:0.82rem;">Immutable: x = 10; x += 1</strong>
          <span class="py-badge py-badge-gold">Rebinding</span>
        </div>
        <div style="font-family:'JetBrains Mono';font-size:0.72rem;color:#94a3b8;line-height:1.5;">
          • Address changes: <code>id(x) != id(x_new)</code><br/>
          • Old integer <code>10</code> remains unchanged in RAM<br/>
          • Other references to <code>10</code> are unaffected
        </div>
      </div>
      <div style="background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-radius:8px;padding:12px;">
        <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:6px;">
          <strong style="color:#22c55e;font-size:0.82rem;">Mutable: a = [1, 2]; a += [3]</strong>
          <span class="py-badge py-badge-green">In-Place Mutation</span>
        </div>
        <div style="font-family:'JetBrains Mono';font-size:0.72rem;color:#94a3b8;line-height:1.5;">
          • Address is identical: <code>id(a) == id(a_after)</code><br/>
          • Appends elements directly to internal buffer<br/>
          • If <code>b = a</code>, then <code>b</code> also sees <code>[1, 2, 3]</code>!
        </div>
      </div>
    </div>
  </div>

  <!-- Arithmetic Table Subcard -->
  <div class="topic-subcard" id="day02ArithTableSection">
    <div class="db-mock-table-wrap">
      <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:8px;padding:0 4px;">
        <h4 style="margin:0;font-size:0.95rem;font-weight:800;letter-spacing:-0.01em;flex:1;">Arithmetic &amp; Assignment Operator Reference</h4>
        <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio02.mp3', this)" title="Play narration">
          <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
        </button>
      </div>
      <table class="db-table-mock db-table-mock--compact">
        <thead><tr><th>Operator</th><th>Name</th><th>Example</th><th>Behavior / Result</th></tr></thead>
        <tbody>
          <tr><td><code>/</code></td><td>True Division</td><td><code>7 / 2</code></td><td>Always returns <code>float</code> (<code>3.5</code>)</td></tr>
          <tr><td><code>//</code></td><td>Floor Division</td><td><code>7 // 2</code> vs <code>-7 // 2</code></td><td><code>3</code> vs <code>-4</code> (floors towards -&infin;)</td></tr>
          <tr><td><code>%</code></td><td>Modulo</td><td><code>17 % 5</code></td><td>Remainder: <code>2</code> (preserves sign of divisor)</td></tr>
          <tr><td><code>**</code></td><td>Exponentiation</td><td><code>2 ** 3 ** 2</code></td><td><code>512</code> (Right-associative: evaluated as <code>2**(3**2)</code>)</td></tr>
          <tr><td><code>+=</code></td><td>In-Place Add</td><td><code>lst += [4]</code></td><td>Mutates list in-place (calls <code>__iadd__</code>)</td></tr>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Compound Interest Code Subcard -->
  <div class="topic-subcard" id="day02ArithCodeSection">
    <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:8px;">
      <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Compound Interest &amp; Mutability Nuance</h4>
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
print(f"Investment Value: \${future_val:,.2f}")

<span class="code-comment"># In-place list mutation vs reassignment:</span>
a = [1, 2]
b = a
a += [3]  <span class="code-comment"># Mutates original list in-place!</span>
print(f"a: {a} | b: {b}") <span class="code-comment"># Both are [1, 2, 3]!</span></code></pre>
      </div>
    </div>
  </div>
</div>


<!-- ═══ SECTION 2: 02. Comparison Operators & Chaining ═══ -->
<div class="slide-section" id="day02CompSection">
  <div class="heading-with-audio" style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
    <h3 style="margin:0;font-size:1.15rem;font-weight:800;letter-spacing:-0.02em;flex:1;">02. Relational Logic &amp; Chained Comparisons</h3>
    <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio04.mp3', this)" title="Play narration">
      <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
    </button>
  </div>
  <p>Python comparison operators (<code>==</code>, <code>!=</code>, <code>&lt;</code>, <code>&gt;</code>, <code>&lt;=</code>, <code>&gt;=</code>) evaluate truth values across all types. Uniquely, Python supports <strong>chained comparisons</strong>: an expression like <code>18 &lt;= age &lt; 65</code> is synthesized by the bytecode compiler into <code>(18 &lt;= age) and (age &lt; 65)</code>, with the middle operand <code>age</code> evaluated <strong>only once</strong>! This prevents unintended double-execution of costly functions or database queries.</p>

  <!-- Infographic: Chained Comparison Execution -->
  <div class="py-infographic-card">
    <div class="py-info-header">
      <div class="py-info-title">
        <span>⚡ Chained Comparison Architecture (Single Evaluation Rule)</span>
      </div>
      <span class="py-badge py-badge-green">Bytecode Optimized</span>
    </div>
    <div style="display:flex;align-items:center;justify-content:space-between;padding:10px 14px;background:rgba(255,255,255,0.02);border:1px solid rgba(255,255,255,0.06);border-radius:8px;font-family:'JetBrains Mono';font-size:0.75rem;margin-top:6px;overflow-x:auto;">
      <span style="color:#38bdf8;">Expression: 18 &lt;= get_age() &lt; 65</span>
      <span style="color:#64748b;">&rarr;</span>
      <span style="color:#a855f7;">t = get_age() (Called ONCE)</span>
      <span style="color:#64748b;">&rarr;</span>
      <span style="color:#f59e0b;">(18 &lt;= t) and (t &lt; 65)</span>
      <span style="color:#64748b;">&rarr;</span>
      <span style="color:#22c55e;">Boolean Result</span>
    </div>
    <div style="font-size:0.75rem;color:#94a3b8;margin-top:8px;line-height:1.5;">
      In C/Java, <code>18 &lt;= age &lt; 65</code> fails because <code>18 &lt;= age</code> evaluates to boolean <code>1</code>, and <code>1 &lt; 65</code> is always <code>True</code>! Python's mathematical chaining prevents this logic bug.
    </div>
  </div>

  <!-- Comparison Patterns Table Subcard -->
  <div class="topic-subcard" id="day02CompTableSection">
    <div class="db-mock-table-wrap">
      <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:8px;padding:0 4px;">
        <h4 style="margin:0;font-size:0.95rem;font-weight:800;letter-spacing:-0.01em;flex:1;">Comparison Patterns &amp; Chaining Mechanics</h4>
        <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio05.mp3', this)" title="Play narration">
          <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
        </button>
      </div>
      <table class="db-table-mock db-table-mock--compact">
        <thead><tr><th>Pattern</th><th>Syntax</th><th>Evaluates As</th><th>Analyst Use Case</th></tr></thead>
        <tbody>
          <tr><td>Bounded Range</td><td><code>0 &lt;= score &lt;= 100</code></td><td><code>(0 &lt;= score) and (score &lt;= 100)</code></td><td>Validation of test marks / KPI percentages</td></tr>
          <tr><td>Multiple Equality</td><td><code>a == b == c</code></td><td><code>(a == b) and (b == c)</code></td><td>Verifying consensus across 3 data sources</td></tr>
          <tr><td>String Lexicographical</td><td><code>"2026-01" &lt;= dt &lt; "2026-06"</code></td><td>Alphabetical ASCII character comparison</td><td>Filtering ISO-8601 string timestamps</td></tr>
          <tr><td>Identity Chaining</td><td><code>a is b is not None</code></td><td><code>(a is b) and (b is not None)</code></td><td>Checking shared non-null references</td></tr>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Code Container Subcard -->
  <div class="topic-subcard" id="day02CompCodeSection">
    <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:8px;">
      <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Data Quality Validation with Chained Checks</h4>
      <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio06.mp3', this)" title="Play narration">
        <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
      </button>
    </div>
    <div class="code-block-container">
      <div class="code-subblock">
        <pre><code><span class="code-comment"># Data Quality ETL Rule: Validate patient temperature and blood pressure:</span>
temp_celsius = 37.2
is_normal_temp = 36.5 &lt;= temp_celsius &lt;= 37.5

<span class="code-comment"># Validate HTTP response status window:</span>
status_code = 204
is_success = 200 &lt;= status_code &lt; 300

print(f"Normal Temp: {is_normal_temp} | Success Code: {is_success}")</code></pre>
      </div>
    </div>
  </div>
</div>


<!-- ═══ SECTION 3: 03. Logical & Short-Circuit Evaluation ═══ -->
<div class="slide-section" id="day02LogSection">
  <div class="heading-with-audio" style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
    <h3 style="margin:0;font-size:1.15rem;font-weight:800;letter-spacing:-0.02em;flex:1;">03. Logical Operators &amp; Short-Circuit Evaluation</h3>
    <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio07.mp3', this)" title="Play narration">
      <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
    </button>
  </div>
  <p>Python's boolean operators (<code>and</code>, <code>or</code>, <code>not</code>) use <strong>short-circuit evaluation</strong>: they evaluate operands from left to right and stop the instant the outcome is determined. Crucially, <code>and</code> and <code>or</code> <strong>do not return booleans</strong>; they return the <strong>exact operand</strong> that decided the outcome. This property enables expressive fallback defaults and defensive guard patterns.</p>

  <!-- Infographic: Short-Circuit Flowchart -->
  <div class="py-infographic-card">
    <div class="py-info-header">
      <div class="py-info-title">
        <span>⚡ Short-Circuit Operand Return Rules</span>
      </div>
      <span class="py-badge py-badge-gold">Operand Passthrough</span>
    </div>
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;margin-top:6px;">
      <div style="background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-radius:8px;padding:12px;">
        <div style="font-family:'JetBrains Mono';font-size:0.75rem;font-weight:700;color:#38bdf8;margin-bottom:4px;">A or B</div>
        <div style="font-family:'JetBrains Mono';font-size:0.75rem;color:#cbd5e1;line-height:1.6;">
          • If <code>A</code> is <strong>Truthy</strong>: returns <code>A</code> immediately (never evaluates <code>B</code>).<br/>
          • If <code>A</code> is <strong>Falsy</strong>: evaluates &amp; returns <code>B</code>.<br/>
          • E.g.: <code>"" or "default" &rarr; "default"</code>
        </div>
      </div>
      <div style="background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-radius:8px;padding:12px;">
        <div style="font-family:'JetBrains Mono';font-size:0.75rem;font-weight:700;color:#22c55e;margin-bottom:4px;">A and B</div>
        <div style="font-family:'JetBrains Mono';font-size:0.75rem;color:#cbd5e1;line-height:1.6;">
          • If <code>A</code> is <strong>Falsy</strong>: returns <code>A</code> immediately (never evaluates <code>B</code>).<br/>
          • If <code>A</code> is <strong>Truthy</strong>: evaluates &amp; returns <code>B</code>.<br/>
          • E.g.: <code>count != 0 and total / count</code>
        </div>
      </div>
    </div>
  </div>

  <!-- Short-Circuit Table Subcard -->
  <div class="topic-subcard" id="day02LogTableSection">
    <div class="db-mock-table-wrap">
      <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:8px;padding:0 4px;">
        <h4 style="margin:0;font-size:0.95rem;font-weight:800;letter-spacing:-0.01em;flex:1;">Short-Circuit Evaluation Matrix</h4>
        <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio08.mp3', this)" title="Play narration">
          <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
        </button>
      </div>
      <table class="db-table-mock db-table-mock--compact">
        <thead><tr><th>Expression</th><th>Result</th><th>Why / Deciding Factor</th></tr></thead>
        <tbody>
          <tr><td><code>"admin" or "guest"</code></td><td><code>"admin"</code></td><td>First operand is truthy; returned immediately</td></tr>
          <tr><td><code>"" or "fallback"</code></td><td><code>"fallback"</code></td><td>First operand is falsy; second operand returned</td></tr>
          <tr><td><code>0 and 42</code></td><td><code>0</code></td><td>First operand is falsy; returned immediately</td></tr>
          <tr><td><code>[1, 2] and "data"</code></td><td><code>"data"</code></td><td>First is truthy; second operand decides outcome</td></tr>
          <tr><td><code>None or [] or {} or "done"</code></td><td><code>"done"</code></td><td>Short-circuits at the first truthy value</td></tr>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Defensive Division Code Subcard -->
  <div class="topic-subcard" id="day02LogCodeSection">
    <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:8px;">
      <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Defensive Division Guard &amp; Fallbacks</h4>
      <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio09.mp3', this)" title="Play narration">
        <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
      </button>
    </div>
    <div class="code-block-container">
      <div class="code-subblock">
        <pre><code>total_revenue = 450000
num_orders = 0

<span class="code-comment"># Short-circuit 'and' guards against ZeroDivisionError:</span>
avg_order_val = num_orders != 0 and (total_revenue / num_orders)
print(f"Safe AOV: {avg_order_val}") <span class="code-comment"># Output: False (Zero crash avoided!)</span>

<span class="code-comment"># Short-circuit 'or' for fallback defaults:</span>
db_host = os.environ.get("DB_HOST") or "localhost"
print(f"Host: {db_host}")</code></pre>
      </div>
    </div>
  </div>
</div>


<!-- ═══ SECTION 4: 04. Identity vs Membership (is vs in) ═══ -->
<div class="slide-section" id="day02IdSection">
  <div class="heading-with-audio" style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
    <h3 style="margin:0;font-size:1.15rem;font-weight:800;letter-spacing:-0.02em;flex:1;">04. Identity (is) vs Membership (in)</h3>
    <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio10.mp3', this)" title="Play narration">
      <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
    </button>
  </div>
  <p>The <code>is</code> operator tests <strong>object identity</strong> (comparing 64-bit RAM pointer addresses via <code>id(a) == id(b)</code> in $O(1)$ time). The <code>in</code> operator tests <strong>collection membership</strong>: on sequential collections (lists, tuples, strings) it performs a linear $O(N)$ scan; on hash tables (sets, dicts) it executes in average $O(1)$ constant time.</p>

  <!-- Infographic: Pointer Address vs Hash Lookup -->
  <div class="py-infographic-card">
    <div class="py-info-header">
      <div class="py-info-title">
        <span>⚡ Complexity Architecture: is vs in (List) vs in (Set)</span>
      </div>
      <span class="py-badge py-badge-purple">Algorithmic Scaling</span>
    </div>
    <div style="display:grid;grid-template-columns:repeat(3, 1fr);gap:8px;margin-top:6px;">
      <div style="background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-radius:8px;padding:10px;text-align:center;">
        <div style="font-family:'JetBrains Mono';font-size:0.68rem;color:#94a3b8;">a is b</div>
        <div style="font-family:'JetBrains Mono';font-size:0.85rem;font-weight:800;color:#38bdf8;margin:4px 0;">O(1)</div>
        <div style="font-size:0.68rem;color:#64748b;">Direct CPU pointer comparison</div>
      </div>
      <div style="background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-radius:8px;padding:10px;text-align:center;">
        <div style="font-family:'JetBrains Mono';font-size:0.68rem;color:#94a3b8;">x in my_list</div>
        <div style="font-family:'JetBrains Mono';font-size:0.85rem;font-weight:800;color:#f43f5e;margin:4px 0;">O(N)</div>
        <div style="font-size:0.68rem;color:#64748b;">Linear element-by-element scan</div>
      </div>
      <div style="background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-radius:8px;padding:10px;text-align:center;">
        <div style="font-family:'JetBrains Mono';font-size:0.68rem;color:#94a3b8;">x in my_set</div>
        <div style="font-family:'JetBrains Mono';font-size:0.85rem;font-weight:800;color:#22c55e;margin:4px 0;">O(1)</div>
        <div style="font-size:0.68rem;color:#64748b;">Direct hash bucket index probe</div>
      </div>
    </div>
  </div>

  <!-- Identity vs Membership Table Subcard -->
  <div class="topic-subcard" id="day02IdTableSection">
    <div class="db-mock-table-wrap">
      <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:8px;padding:0 4px;">
        <h4 style="margin:0;font-size:0.95rem;font-weight:800;letter-spacing:-0.01em;flex:1;">Identity vs Membership Comparison Table</h4>
        <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio11.mp3', this)" title="Play narration">
          <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
        </button>
      </div>
      <table class="db-table-mock db-table-mock--compact">
        <thead><tr><th>Operator</th><th>Under the Hood</th><th>Time Complexity</th><th>Best Practice</th></tr></thead>
        <tbody>
          <tr><td><code>is</code></td><td><code>id(a) == id(b)</code></td><td>$O(1)$</td><td>Use exclusively for singletons (<code>x is None</code>)</td></tr>
          <tr><td><code>is not</code></td><td><code>id(a) != id(b)</code></td><td>$O(1)$</td><td>Preferred over <code>not (a is b)</code></td></tr>
          <tr><td><code>in (list)</code></td><td>Sequential <code>__eq__</code> loop</td><td>$O(N)$</td><td>Slow for large collections (&gt; 1,000 items)</td></tr>
          <tr><td><code>in (set)</code></td><td>Computes <code>hash(x)</code></td><td>Average $O(1)$</td><td>Always convert lookup tables to sets</td></tr>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Stop-Word Filtering Code Subcard -->
  <div class="topic-subcard" id="day02IdCodeSection">
    <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:8px;">
      <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">High-Speed Stop-Word Filter with Sets</h4>
      <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio12.mp3', this)" title="Play narration">
        <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
      </button>
    </div>
    <div class="code-block-container">
      <div class="code-subblock">
        <pre><code>tokens = ["sql", "and", "python", "are", "essential", "for", "data", "science"]
stop_words = {"and", "are", "for", "the", "in", "to"} <span class="code-comment"># Set: O(1) membership</span>

<span class="code-comment"># Filter tokens at high speed:</span>
meaningful = [t <span class="kw">for</span> t <span class="kw">in</span> tokens <span class="kw">if</span> t <span class="kw">not in</span> stop_words]
print(f"Filtered: {meaningful}") <span class="code-comment"># ['sql', 'python', 'essential', 'data', 'science']</span></code></pre>
      </div>
    </div>
  </div>
</div>


<!-- ═══ SECTION 5: 05. Bitwise Operators & Binary Masking ═══ -->
<div class="slide-section" id="day02BitSection">
  <div class="heading-with-audio" style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
    <h3 style="margin:0;font-size:1.15rem;font-weight:800;letter-spacing:-0.02em;flex:1;">05. Bitwise Operators &amp; Binary Masks</h3>
    <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio13.mp3', this)" title="Play narration">
      <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
    </button>
  </div>
  <p>Bitwise operators manipulate integers at the binary bit level (<code>&amp;</code> AND, <code>|</code> OR, <code>^</code> XOR, <code>~</code> NOT, <code>&lt;&lt;</code> left shift, <code>&gt;&gt;</code> right shift). In data platforms and analytics engineering, bitmasking provides ultra-fast, compact representations for <strong>Role-Based Access Control (RBAC)</strong>, feature flags, and multi-state tracking in a single integer column.</p>

  <!-- Infographic: RBAC Bitmasking Architecture -->
  <div class="py-infographic-card">
    <div class="py-info-header">
      <div class="py-info-title">
        <span>⚡ RBAC Permission Bitmasking Architecture</span>
      </div>
      <span class="py-badge py-badge-green">1-Cycle CPU Operations</span>
    </div>
    <div class="bitmask-grid">
      <div class="bitmask-cell">
        <div style="font-family:'JetBrains Mono';font-size:0.75rem;font-weight:800;color:#38bdf8;">READ = 1 (0b001)</div>
        <div style="font-size:0.68rem;color:#94a3b8;margin-top:2px;">Query / View data</div>
      </div>
      <div class="bitmask-cell">
        <div style="font-family:'JetBrains Mono';font-size:0.75rem;font-weight:800;color:#a855f7;">WRITE = 2 (0b010)</div>
        <div style="font-size:0.68rem;color:#94a3b8;margin-top:2px;">Insert / Update records</div>
      </div>
      <div class="bitmask-cell">
        <div style="font-family:'JetBrains Mono';font-size:0.75rem;font-weight:800;color:#f59e0b;">EXECUTE = 4 (0b100)</div>
        <div style="font-size:0.68rem;color:#94a3b8;margin-top:2px;">Run ETL pipeline / procedures</div>
      </div>
    </div>
    <div style="font-size:0.75rem;color:#94a3b8;margin-top:10px;line-height:1.5;">
      • <strong>Combine:</strong> <code>perms = READ | WRITE</code> &rarr; <code>3 (0b011)</code><br/>
      • <strong>Check:</strong> <code>has_write = bool(perms &amp; WRITE)</code> &rarr; <code>True</code><br/>
      • <strong>Revoke:</strong> <code>perms = perms &amp; ~WRITE</code> &rarr; <code>1 (0b001)</code>
    </div>
  </div>

  <!-- Bitwise Reference Table Subcard -->
  <div class="topic-subcard" id="day02BitTableSection">
    <div class="db-mock-table-wrap">
      <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:8px;padding:0 4px;">
        <h4 style="margin:0;font-size:0.95rem;font-weight:800;letter-spacing:-0.01em;flex:1;">Bitwise Operator Reference Table</h4>
        <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio14.mp3', this)" title="Play narration">
          <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
        </button>
      </div>
      <table class="db-table-mock db-table-mock--compact">
        <thead><tr><th>Operator</th><th>Name</th><th>Example</th><th>Bitwise Transformation</th></tr></thead>
        <tbody>
          <tr><td><code>&amp;</code></td><td>Bitwise AND</td><td><code>12 &amp; 10</code> &rarr; <code>8</code></td><td><code>1100 &amp; 1010 = 1000</code></td></tr>
          <tr><td><code>|</code></td><td>Bitwise OR</td><td><code>12 | 10</code> &rarr; <code>14</code></td><td><code>1100 | 1010 = 1110</code></td></tr>
          <tr><td><code>^</code></td><td>Bitwise XOR</td><td><code>12 ^ 10</code> &rarr; <code>6</code></td><td><code>1100 ^ 1010 = 0110</code></td></tr>
          <tr><td><code>~</code></td><td>Bitwise NOT</td><td><code>~5</code> &rarr; <code>-6</code></td><td>Two's complement: <code>-(x + 1)</code></td></tr>
          <tr><td><code>&lt;&lt;</code></td><td>Left Shift</td><td><code>3 &lt;&lt; 2</code> &rarr; <code>12</code></td><td>Multiplies by $2^2$: <code>3 &times; 4</code></td></tr>
          <tr><td><code>&gt;&gt;</code></td><td>Right Shift</td><td><code>16 &gt;&gt; 2</code> &rarr; <code>4</code></td><td>Divides by $2^2$: <code>16 // 4</code></td></tr>
        </tbody>
      </table>
    </div>
  </div>

  <!-- RBAC Bitmask Code Subcard -->
  <div class="topic-subcard" id="day02BitCodeSection">
    <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:8px;">
      <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Role-Based Access Control (RBAC) Bitmask</h4>
      <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio15.mp3', this)" title="Play narration">
        <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
      </button>
    </div>
    <div class="code-block-container">
      <div class="code-subblock">
        <pre><code>READ, WRITE, EXECUTE = 1, 2, 4

<span class="code-comment"># Analyst permissions: Read + Execute</span>
analyst_perms = READ | EXECUTE  <span class="code-comment"># 5 (0b101)</span>

can_write = bool(analyst_perms & WRITE)    <span class="code-comment"># False</span>
can_execute = bool(analyst_perms & EXECUTE) <span class="code-comment"># True</span>
print(f"Can Write: {can_write} | Can Exec: {can_execute}")

<span class="code-comment"># Ultra-fast parity check (1 CPU cycle vs modulo):</span>
is_even = (42 & 1) == 0  <span class="code-comment"># True (Note parentheses required due to precedence!)</span></code></pre>
      </div>
    </div>
  </div>
</div>


<!-- ═══ SECTION 6: 06. Ternary & Walrus Operator ═══ -->
<div class="slide-section" id="day02WalrusSection">
  <div class="heading-with-audio" style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
    <h3 style="margin:0;font-size:1.15rem;font-weight:800;letter-spacing:-0.02em;flex:1;">06. Ternary &amp; The Walrus Operator (:=)</h3>
    <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio16.mp3', this)" title="Play narration">
      <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
    </button>
  </div>
  <p>Python's <strong>conditional expression</strong> (ternary: <code>x if condition else y</code>) evaluates inline with short-circuit behavior. Introduced in Python 3.8 (PEP 572), the <strong>Walrus operator</strong> (<code>:=</code>, formally named assignment expression) assigns values to variables inside an expression while simultaneously returning the value. This eliminates duplicate computations in list comprehensions and stream-reading loops.</p>

  <!-- Precedence Hierarchy Table Subcard -->
  <div class="topic-subcard" id="day02WalrusTableSection">
    <div class="db-mock-table-wrap">
      <div style="display:flex;align-items:center;justify-content:space-between;gap:8px;margin-bottom:8px;padding:0 4px;">
        <h4 style="margin:0;font-size:0.95rem;font-weight:800;letter-spacing:-0.01em;flex:1;">Operator Precedence Hierarchy Table</h4>
        <button class="audio-play-btn" onclick="playAudio('Day02/New_PyDay02Audio17.mp3', this)" title="Play narration">
          <svg class="play-icon" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
        </button>
      </div>
      <table class="db-table-mock db-table-mock--compact">
        <thead><tr><th>Precedence Level</th><th>Operators</th><th>Associativity</th><th>Description</th></tr></thead>
        <tbody>
          <tr><td>1 (Highest)</td><td><code>()</code>, <code>[]</code>, <code>{}</code></td><td>Left-to-right</td><td>Grouping, indexing, slicing, calls</td></tr>
          <tr><td>2</td><td><code>**</code></td><td><strong>Right-to-left</strong></td><td>Exponentiation (<code>2**3**2 = 512</code>)</td></tr>
          <tr><td>3</td><td><code>+x</code>, <code>-x</code>, <code>~x</code></td><td>Right-to-left</td><td>Unary positive, negation, bitwise NOT</td></tr>
          <tr><td>4</td><td><code>*</code>, <code>/</code>, <code>//</code>, <code>%</code></td><td>Left-to-right</td><td>Multiplication, division, modulo</td></tr>
          <tr><td>5</td><td><code>+</code>, <code>-</code></td><td>Left-to-right</td><td>Addition and subtraction</td></tr>
          <tr><td>6</td><td><code>&lt;&lt;</code>, <code>&gt;&gt;</code></td><td>Left-to-right</td><td>Bitwise shifts</td></tr>
          <tr><td>7</td><td><code>&amp;</code></td><td>Left-to-right</td><td>Bitwise AND</td></tr>
          <tr><td>8</td><td><code>^</code></td><td>Left-to-right</td><td>Bitwise XOR</td></tr>
          <tr><td>9</td><td><code>|</code></td><td>Left-to-right</td><td>Bitwise OR</td></tr>
          <tr><td>10</td><td><code>==</code>, <code>!=</code>, <code>&lt;</code>, <code>&lt;=</code>, <code>&gt;</code>, <code>&gt;=</code>, <code>is</code>, <code>in</code></td><td>Left-to-right</td><td>Comparisons &amp; memberships</td></tr>
          <tr><td>11</td><td><code>not</code></td><td>Right-to-left</td><td>Boolean NOT</td></tr>
          <tr><td>12</td><td><code>and</code></td><td>Left-to-right</td><td>Boolean AND (short-circuit)</td></tr>
          <tr><td>13</td><td><code>or</code></td><td>Left-to-right</td><td>Boolean OR (short-circuit)</td></tr>
          <tr><td>14 (Lowest)</td><td><code>:=</code></td><td>Right-to-left</td><td>Walrus assignment expression</td></tr>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Walrus Code Subcard -->
  <div class="topic-subcard" id="day02WalrusCodeSection">
    <div class="heading-with-audio" style="display:flex;align-items:center;gap:8px;margin-bottom:8px;">
      <h4 style="margin:0;font-size:0.95rem;font-weight:800;flex:1;">Walrus in List Comprehensions &amp; While Loops</h4>
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
risk_level = "High" <span class="kw">if</span> len(cleaned) &lt; 5 <span class="kw">else</span> "Normal"
print(f"Risk: {risk_level}")</code></pre>
      </div>
    </div>
  </div>
</div>


<!-- ═══ SECTION 7: 07. Precedence Hierarchy & Top 25 Q&As ═══ -->
<div class="slide-section" id="day02PrecedenceSection">
  <div class="heading-with-audio" style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
    <h3 style="margin:0;font-size:1.15rem;font-weight:800;letter-spacing:-0.02em;flex:1;">07. Precedence Hierarchy &amp; Top 25 Interview Q&amp;As</h3>
  </div>

  <!-- Infographic: Precedence Pyramid -->
  <div class="py-infographic-card">
    <div class="py-info-header">
      <div class="py-info-title">
        <span>🔺 Python Operator Precedence Pyramid</span>
      </div>
      <span class="py-badge py-badge-rose">Defensive Parentheses Rule</span>
    </div>
    <div class="precedence-pyramid">
      <div class="pyr-level" style="background:rgba(244,63,94,0.15);border:1px solid rgba(244,63,94,0.3);">
        <span class="pyr-label" style="color:#fb7185;">TIER 1 (TOP)</span>
        <span class="pyr-ops" style="color:#fff;">( ) &nbsp; [ ] &nbsp; { } &nbsp; f(x) &nbsp; x[i]</span>
        <span class="pyr-assoc">Grouping &amp; Access</span>
      </div>
      <div class="pyr-level" style="background:rgba(245,158,11,0.12);border:1px solid rgba(245,158,11,0.25);">
        <span class="pyr-label" style="color:#fbbf24;">TIER 2 (RIGHT&rarr;LEFT)</span>
        <span class="pyr-ops" style="color:#fff;">**</span>
        <span class="pyr-assoc">Exponentiation (3**2 = 9)</span>
      </div>
      <div class="pyr-level" style="background:rgba(56,189,248,0.10);border:1px solid rgba(56,189,248,0.2);">
        <span class="pyr-label" style="color:#38bdf8;">TIER 3 (ARITHMETIC)</span>
        <span class="pyr-ops" style="color:#fff;">* &nbsp; / &nbsp; // &nbsp; % &nbsp; &rarr; &nbsp; + &nbsp; -</span>
        <span class="pyr-assoc">Multiplicative then Additive</span>
      </div>
      <div class="pyr-level" style="background:rgba(168,85,247,0.10);border:1px solid rgba(168,85,247,0.2);">
        <span class="pyr-label" style="color:#c084fc;">TIER 4 (BITWISE)</span>
        <span class="pyr-ops" style="color:#fff;">&lt;&lt; &nbsp; &gt;&gt; &nbsp; &rarr; &nbsp; &amp; &nbsp; ^ &nbsp; |</span>
        <span class="pyr-assoc">Shifts then Logic</span>
      </div>
      <div class="pyr-level" style="background:rgba(34,197,94,0.10);border:1px solid rgba(34,197,94,0.2);">
        <span class="pyr-label" style="color:#4ade80;">TIER 5 (RELATIONAL)</span>
        <span class="pyr-ops" style="color:#fff;">&lt; &nbsp; &lt;= &nbsp; &gt; &nbsp; &gt;= &nbsp; == &nbsp; != &nbsp; is &nbsp; in</span>
        <span class="pyr-assoc">Chained Comparisons</span>
      </div>
      <div class="pyr-level" style="background:rgba(255,255,255,0.05);border:1px solid rgba(255,255,255,0.1);">
        <span class="pyr-label" style="color:#94a3b8;">TIER 6 (LOGICAL / BASE)</span>
        <span class="pyr-ops" style="color:#fff;">not &nbsp; &rarr; &nbsp; and &nbsp; &rarr; &nbsp; or &nbsp; &rarr; &nbsp; :=</span>
        <span class="pyr-assoc">Boolean &amp; Walrus</span>
      </div>
    </div>
    <div style="font-size:0.75rem;color:#94a3b8;margin-top:6px;">
      💡 <strong>Senior Developer Rule:</strong> When mixing bitwise operators with comparisons (e.g. <code>x &amp; 1 == 0</code>), comparison binds FIRST. Always write <code>(x &amp; 1) == 0</code> with explicit parentheses!
    </div>
  </div>

  <div class="topic-subcard" id="day02InterviewIntroSection" style="margin-top:0;padding-top:0;border-top:none;">
    <p>These 25 questions test deep understanding of Python operators, precedence traps, bitwise optimization, and short-circuit evaluation frequently probed in high-level coding interviews.</p>
  </div>

  <div class="topic-subcard" id="day02InterviewCardsSection">
    <div class="interview-box">
      <h4 style="color:#38bdf8;font-size:1rem;margin-bottom:12px;display:flex;align-items:center;gap:8px;">
        <span>🎯</span> Python Operators, Precedence &amp; Evaluation Rules
      </h4>

      <div id="pyDay02IQ1">
        <p><strong>Q1: Why does <code>2 ** 3 ** 2</code> evaluate to 512 instead of 64?</strong></p>
        <p><em>A: The exponentiation operator (<code>**</code>) is <strong>right-associative</strong>. The rightmost exponent is computed first: <code>3 ** 2 = 9</code>, then <code>2 ** 9 = 512</code>. To compute <code>(2**3)**2 = 64</code>, explicit parentheses must be used.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ2">
        <p><strong>Q2: Why does <code>not False == False</code> evaluate to <code>False</code>?</strong></p>
        <p><em>A: Comparison operators (<code>==</code>) have higher precedence than <code>not</code>. Thus, Python parses the expression as <code>not (False == False)</code> &rarr; <code>not True</code> &rarr; <code>False</code>. If you intend <code>(not False) == False</code>, you must use parentheses.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ3">
        <p><strong>Q3: How does short-circuit evaluation work with <code>and</code> and <code>or</code>?</strong></p>
        <p><em>A: <code>a and b</code> evaluates <code>a</code>; if falsy, it immediately returns <code>a</code> without evaluating <code>b</code>. If truthy, it returns <code>b</code>. <code>a or b</code> evaluates <code>a</code>; if truthy, it immediately returns <code>a</code>. If falsy, it returns <code>b</code>. Neither operator coerces the result to a strict boolean.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ4">
        <p><strong>Q4: How do chained comparisons like <code>10 &lt; x &lt; 20</code> work under the hood?</strong></p>
        <p><em>A: Python translates <code>10 &lt; x &lt; 20</code> to <code>10 &lt; x and x &lt; 20</code>, but evaluates the middle operand <code>x</code> only once. If <code>x</code> is an expensive function call, chained comparison ensures optimal single execution.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ5">
        <p><strong>Q5: What is the Walrus operator (<code>:=</code>), and where is it most useful?</strong></p>
        <p><em>A: Introduced in Python 3.8 (PEP 572), <code>:=</code> assigns a value to a variable within an expression while returning the value. It prevents duplicate computation in <code>while ((chunk := file.read(1024))):</code> and avoids duplicate filtering in list comprehensions.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ6">
        <p><strong>Q6: Why is <code>x &amp; 1 == 0</code> a syntax / precedence trap?</strong></p>
        <p><em>A: Comparison operators (<code>==</code>) have higher precedence than bitwise AND (<code>&amp;</code>). Python parses this as <code>x &amp; (1 == 0)</code> &rarr; <code>x &amp; False</code> &rarr; <code>0</code>. You must write <code>(x &amp; 1) == 0</code> with parentheses.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ7">
        <p><strong>Q7: What is the difference between <code>a = a + [1]</code> and <code>a += [1]</code> on a list?</strong></p>
        <p><em>A: <code>a = a + [1]</code> creates a brand new list in memory and rebinds the variable <code>a</code>. <code>a += [1]</code> calls <code>list.__iadd__()</code>, which extends the existing list in-place without creating a new object.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ8">
        <p><strong>Q8: What does <code>~x</code> (bitwise NOT) do in Python?</strong></p>
        <p><em>A: Python integers use two's complement representation. Bitwise NOT flips all bits, which is mathematically equivalent to <code>-(x + 1)</code>. E.g., <code>~5 == -6</code> and <code>~0 == -1</code>. In sequences, <code>~i</code> is conveniently used to index from the end: <code>a[~i] == a[-1 - i]</code>.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ9">
        <p><strong>Q9: How do you swap two variables without a temporary variable in Python?</strong></p>
        <p><em>A: Use tuple packing and unpacking: <code>a, b = b, a</code>. Python creates a 2-tuple <code>(b, a)</code> on the right-hand side and unpacks it into <code>a</code> and <code>b</code> safely without collision.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ10">
        <p><strong>Q10: What is the difference between <code>and</code> / <code>or</code> and <code>&amp;</code> / <code>|</code>?</strong></p>
        <p><em>A: <code>and</code> and <code>or</code> are logical operators that evaluate truthiness and support short-circuiting. <code>&amp;</code> and <code>|</code> are bitwise operators that operate on integer bits eagerly without short-circuiting.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ11">
        <p><strong>Q11: Why does <code>True in [1, 2]</code> return <code>True</code>?</strong></p>
        <p><em>A: Because <code>bool</code> is a subclass of <code>int</code>, and <code>True == 1</code> is <code>True</code>. The <code>in</code> operator tests equality across elements, and since <code>1 == True</code>, Python matches the first element.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ12">
        <p><strong>Q12: How do you test if a number is a power of 2 using bitwise operators?</strong></p>
        <p><em>A: Use <code>(n &gt; 0) and ((n &amp; (n - 1)) == 0)</code>. A power of 2 has exactly one binary bit set (e.g. <code>8 = 1000_2</code>), and <code>n - 1</code> flips all bits below it (<code>7 = 0111_2</code>). Their bitwise AND is always 0.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ13">
        <p><strong>Q13: What does the ternary operator look like in Python?</strong></p>
        <p><em>A: <code>result = true_value if condition else false_value</code>. Unlike C's <code>cond ? a : b</code>, Python places the truth value first. It also short-circuits: only the branch corresponding to the condition is evaluated.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ14">
        <p><strong>Q14: Why can <code>None == None</code> be <code>True</code>, but <code>is</code> is still preferred?</strong></p>
        <p><em>A: <code>None == None</code> evaluates to <code>True</code>, but <code>==</code> invokes <code>__eq__()</code> on the left operand. If a custom class or library (such as a NumPy array) overrides <code>__eq__</code>, it may return an array of booleans instead of a single boolean, raising an exception in an <code>if</code> check. <code>is None</code> checks pointer identity directly.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ15">
        <p><strong>Q15: What is the result of <code>bool([] or () or {} or 0 or "Python")</code>?</strong></p>
        <p><em>A: The chained <code>or</code> operators evaluate sequentially. All operands up to <code>0</code> are falsy. <code>"Python"</code> is the first truthy value, so the expression evaluates to <code>"Python"</code>. Passing it to <code>bool("Python")</code> yields <code>True</code>.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ16">
        <p><strong>Q16: Can you assign to a slice of a list with an iterable of different length?</strong></p>
        <p><em>A: Yes, if the slice is non-extended (i.e. step is 1): <code>a = [1, 2, 3]; a[1:2] = [8, 9, 10] &rarr; [1, 8, 9, 10, 3]</code>. If the slice has an extended step like <code>a[::2]</code>, the replacement iterable must match the exact number of replaced elements.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ17">
        <p><strong>Q17: Why does <code>(1,)</code> create a tuple but <code>(1)</code> creates an integer?</strong></p>
        <p><em>A: In Python, parentheses around an expression denote mathematical grouping. The comma (<code>,</code>) is the actual tuple constructor operator. Thus, <code>(1)</code> is simply the integer <code>1</code> in parentheses, whereas <code>(1,)</code> or <code>1,</code> creates a 1-tuple.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ18">
        <p><strong>Q18: What is the difference between <code>pass</code>, <code>continue</code>, and <code>break</code>?</strong></p>
        <p><em>A: <code>pass</code> is a null statement (no-op) used as a placeholder. <code>continue</code> immediately skips the rest of the current loop iteration and advances to the next. <code>break</code> completely terminates the nearest enclosing loop.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ19">
        <p><strong>Q19: How do you safely get a value from a dictionary with a fallback without raising KeyError?</strong></p>
        <p><em>A: Use <code>d.get(key, default)</code>. If the key exists, it returns its value; otherwise, it returns the default (or <code>None</code> if default is omitted), avoiding runtime <code>KeyError</code> exceptions.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ20">
        <p><strong>Q20: What is the difference between <code>round()</code> and <code>math.floor()</code> / <code>math.ceil()</code>?</strong></p>
        <p><em>A: <code>round()</code> performs Banker's rounding (half to even). <code>math.floor()</code> always rounds downward towards negative infinity. <code>math.ceil()</code> always rounds upward towards positive infinity.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ21">
        <p><strong>Q21: Why does <code>[[]] * 3</code> produce a dangerous nested list bug?</strong></p>
        <p><em>A: List multiplication replicates object references, not deep clones. <code>[[]] * 3</code> creates a list containing three references to the exact same inner list. Mutating one mutates all three! Use <code>[[] for _ in range(3)]</code> instead.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ22">
        <p><strong>Q22: How does Python evaluate <code>x = y = z = 0</code>?</strong></p>
        <p><em>A: Python evaluates the right-hand expression <code>0</code> once, then assigns the resulting object reference to each variable from left to right: <code>x</code>, <code>y</code>, and <code>z</code> all reference the same integer <code>0</code>.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ23">
        <p><strong>Q23: How does the bitwise XOR operator (<code>^</code>) enable in-place number swapping?</strong></p>
        <p><em>A: <code>a = a ^ b; b = a ^ b; a = a ^ b</code> swaps two integers without extra memory because $x \oplus x = 0$ and $x \oplus 0 = x$. In idiomatic Python, however, <code>a, b = b, a</code> is preferred for readability.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ24">
        <p><strong>Q24: What is the difference between <code>math.isclose()</code> and <code>np.isclose()</code>?</strong></p>
        <p><em>A: <code>math.isclose()</code> operates on scalar floating-point values in Python's standard library. <code>numpy.isclose()</code> operates on multi-dimensional NumPy arrays and Series with vectorised SIMD acceleration.</em></p>
      </div>
      <hr style="border:none;border-top:1px dashed rgba(255,255,255,0.1);margin:10px 0;" />

      <div id="pyDay02IQ25">
        <p><strong>Q25: Why does <code>assert 1 == 2, "Failed"</code> work, but <code>assert(1 == 2, "Failed")</code> fails unexpectedly?</strong></p>
        <p><em>A: <code>assert</code> is a keyword statement, not a function call. Writing <code>assert(1 == 2, "Failed")</code> passes a non-empty 2-tuple <code>(False, "Failed")</code> to assert. Because any non-empty tuple evaluates to truthy, the assertion NEVER triggers!</em></p>
      </div>
    </div>
  </div>
</div>
`
    }
  ],

  practiceQuestions: [
    {
        "id": 1,
        "prompt": "<strong>[Easy] BMI Metric Calculator & In-Place Assignment</strong><br/>Given weight in kilograms (<code>weight_kg = 78.5</code>) and height in meters (<code>height_m = 1.78</code>), compute Body Mass Index: <code>bmi = weight_kg / (height_m ** 2)</code>. Round to 2 decimal places and store in <code>bmi</code>.",
        "starterCode": "# Q1: Compute BMI metric\nweight_kg = 78.5\nheight_m = 1.78\n\n# TODO: Compute BMI rounded to 2 decimal places\nbmi = None\n\nprint(f\"BMI: {bmi}\")\n",
        "ref": "weight_kg = 78.5\nheight_m = 1.78\nbmi = round(weight_kg / (height_m ** 2), 2)\nprint(f\"BMI: {bmi}\")\n",
        "questionAudio": "Day02/New_PyDay02Question01.mp3",
        "solutionAudio": "Day02/New_PyDay02Question01sol.mp3"
    },
    {
        "id": 2,
        "prompt": "<strong>[Easy] Circular Array Indexing with Modulo</strong><br/>In streaming analytics, a rolling buffer of size <code>BUFFER_SIZE = 8</code> receives events with sequence numbers from 0 to 25. For event sequence <code>seq_num = 19</code>, compute its circular buffer slot index using modulo (<code>slot_idx</code>).",
        "starterCode": "# Q2: Compute circular buffer index\nBUFFER_SIZE = 8\nseq_num = 19\n\n# TODO: Calculate circular slot index\nslot_idx = None\n\nprint(f\"Seq {seq_num} maps to buffer slot {slot_idx}\")\n",
        "ref": "BUFFER_SIZE = 8\nseq_num = 19\nslot_idx = seq_num % BUFFER_SIZE\nprint(f\"Seq {seq_num} maps to buffer slot {slot_idx}\")\n",
        "questionAudio": "Day02/New_PyDay02Question02.mp3",
        "solutionAudio": "Day02/New_PyDay02Question02sol.mp3"
    },
    {
        "id": 3,
        "prompt": "<strong>[Easy] Sensor Range Validator with Chained Comparisons</strong><br/>A data pipeline receives temperature sensor reading <code>temp = 23.4</code> and humidity reading <code>humidity = 45.0</code>. Using chained comparisons, check that temperature is within <code>18.0 &lt;= temp &lt;= 26.0</code> and humidity is within <code>30.0 &lt;= humidity &lt;= 60.0</code>. Store the combined boolean result in <code>is_optimal</code>.",
        "starterCode": "# Q3: Validate sensor ranges with chained comparisons\ntemp = 23.4\nhumidity = 45.0\n\n# TODO: Check both conditions using chained comparisons\nis_optimal = None\n\nprint(f\"Environment optimal: {is_optimal}\")\n",
        "ref": "temp = 23.4\nhumidity = 45.0\nis_optimal = (18.0 <= temp <= 26.0) and (30.0 <= humidity <= 60.0)\nprint(f\"Environment optimal: {is_optimal}\")\n",
        "questionAudio": "Day02/New_PyDay02Question03.mp3",
        "solutionAudio": "Day02/New_PyDay02Question03sol.mp3"
    },
    {
        "id": 4,
        "prompt": "<strong>[Easy] Default Value Fallback via Short-Circuit OR</strong><br/>Given user input <code>provided_currency = ''</code> and system default <code>DEFAULT_CURRENCY = 'USD'</code>, use the short-circuit <code>or</code> operator to assign <code>currency = provided_currency.strip() or DEFAULT_CURRENCY</code>. Test with empty string and <code>'EUR'</code>.",
        "starterCode": "# Q4: Short-circuit fallback assignment\nDEFAULT_CURRENCY = 'USD'\n\nuser_input_1 = ''\nuser_input_2 = 'EUR'\n\n# TODO: Assign using short-circuit 'or'\ncurrency_1 = None\ncurrency_2 = None\n\nprint(f\"Currency 1: {currency_1} | Currency 2: {currency_2}\")\n",
        "ref": "DEFAULT_CURRENCY = 'USD'\nuser_input_1 = ''\nuser_input_2 = 'EUR'\n\ncurrency_1 = user_input_1.strip() or DEFAULT_CURRENCY\ncurrency_2 = user_input_2.strip() or DEFAULT_CURRENCY\n\nprint(f\"Currency 1: {currency_1} | Currency 2: {currency_2}\")\n",
        "questionAudio": "Day02/New_PyDay02Question04.mp3",
        "solutionAudio": "Day02/New_PyDay02Question04sol.mp3"
    },
    {
        "id": 5,
        "prompt": "<strong>[Easy] Safe Division Guard using Short-Circuit AND</strong><br/>Write an expression that safely computes average transaction value: <code>avg_val = (tx_count != 0) and (total_revenue / tx_count)</code>. For <code>tx_count = 0</code> and <code>total_revenue = 50000.0</code>, verify that the expression returns <code>False</code> (or 0) without raising a <code>ZeroDivisionError</code>.",
        "starterCode": "# Q5: Defensive division guard\ntx_count = 0\ntotal_revenue = 50000.0\n\n# TODO: Safe division using short-circuit 'and'\navg_val = None\n\nprint(f\"Safe Avg: {avg_val}\")\n",
        "ref": "tx_count = 0\ntotal_revenue = 50000.0\navg_val = (tx_count != 0) and (total_revenue / tx_count)\nprint(f\"Safe Avg: {avg_val}\")\n",
        "questionAudio": "Day02/New_PyDay02Question05.mp3",
        "solutionAudio": "Day02/New_PyDay02Question05sol.mp3"
    },
    {
        "id": 6,
        "prompt": "<strong>[Medium] Exponentiation Associativity & Precedence</strong><br/>Demonstrate the right-associativity of <code>**</code>. Compute <code>res_default = 2 ** 3 ** 2</code> and <code>res_grouped = (2 ** 3) ** 2</code>. Store their difference (<code>res_default - res_grouped</code>) in <code>diff</code>.",
        "starterCode": "# Q6: Test exponentiation associativity\n# TODO: Calculate res_default (2**3**2) and res_grouped ((2**3)**2)\nres_default = None\nres_grouped = None\ndiff = None\n\nprint(f\"Default: {res_default} | Grouped: {res_grouped} | Diff: {diff}\")\n",
        "ref": "res_default = 2 ** 3 ** 2\nres_grouped = (2 ** 3) ** 2\ndiff = res_default - res_grouped\nprint(f\"Default: {res_default} | Grouped: {res_grouped} | Diff: {diff}\")\n",
        "questionAudio": "Day02/New_PyDay02Question06.mp3",
        "solutionAudio": "Day02/New_PyDay02Question06sol.mp3"
    },
    {
        "id": 7,
        "prompt": "<strong>[Medium] Fast Even/Odd & Power-of-Two Detection</strong><br/>Using bitwise operations only: (1) check if integer <code>n = 64</code> is even using <code>(n & 1) == 0</code>, storing in <code>is_even</code>; (2) check if <code>n</code> is a power of 2 using <code>(n > 0) and ((n & (n - 1)) == 0)</code>, storing in <code>is_power_of_two</code>.",
        "starterCode": "# Q7: Fast bitwise checks\nn = 64\n\n# TODO: Check is_even and is_power_of_two using bitwise operations\nis_even = None\nis_power_of_two = None\n\nprint(f\"{n} is even: {is_even} | power of 2: {is_power_of_two}\")\n",
        "ref": "n = 64\nis_even = ((n & 1) == 0)\nis_power_of_two = (n > 0) and ((n & (n - 1)) == 0)\nprint(f\"{n} is even: {is_even} | power of 2: {is_power_of_two}\")\n",
        "questionAudio": "Day02/New_PyDay02Question07.mp3",
        "solutionAudio": "Day02/New_PyDay02Question07sol.mp3"
    },
    {
        "id": 8,
        "prompt": "<strong>[Medium] Role-Based Permission Bitmask Checking</strong><br/>Given permission flags <code>READ = 1 << 0</code> (1), <code>WRITE = 1 << 1</code> (2), <code>DELETE = 1 << 2</code> (4), and <code>ADMIN = 1 << 3</code> (8). A user has <code>role_mask = READ | WRITE</code>. Verify if the user has <code>WRITE</code> permission (store in <code>can_write</code>) and if they have <code>DELETE</code> permission (store in <code>can_delete</code>).",
        "starterCode": "# Q8: Permission bitmask checking\nREAD   = 1 << 0\nWRITE  = 1 << 1\nDELETE = 1 << 2\nADMIN  = 1 << 3\n\nrole_mask = READ | WRITE\n\n# TODO: Check can_write and can_delete booleans\ncan_write = None\ncan_delete = None\n\nprint(f\"Can write: {can_write} | Can delete: {can_delete}\")\n",
        "ref": "READ   = 1 << 0\nWRITE  = 1 << 1\nDELETE = 1 << 2\nADMIN  = 1 << 3\n\nrole_mask = READ | WRITE\ncan_write = bool(role_mask & WRITE)\ncan_delete = bool(role_mask & DELETE)\nprint(f\"Can write: {can_write} | Can delete: {can_delete}\")\n",
        "questionAudio": "Day02/New_PyDay02Question08.mp3",
        "solutionAudio": "Day02/New_PyDay02Question08sol.mp3"
    },
    {
        "id": 9,
        "prompt": "<strong>[Medium] Customer Tier Classifier with Ternary Expressions</strong><br/>Given a list of customer annual spend amounts: <code>spends = [1500, 12000, 4500, 25000, 800]</code>, classify each into a tier using an inline ternary expression: <code>'Platinum' if s >= 10000 else ('Gold' if s >= 3000 else 'Silver')</code>. Store the result list in <code>tiers</code>.",
        "starterCode": "# Q9: Multi-tier ternary classification\nspends = [1500, 12000, 4500, 25000, 800]\n\n# TODO: Build tiers list using ternary expressions\ntiers = []\n\nprint(\"Customer Tiers:\", tiers)\n",
        "ref": "spends = [1500, 12000, 4500, 25000, 800]\ntiers = ['Platinum' if s >= 10000 else ('Gold' if s >= 3000 else 'Silver') for s in spends]\nprint(\"Customer Tiers:\", tiers)\n",
        "questionAudio": "Day02/New_PyDay02Question09.mp3",
        "solutionAudio": "Day02/New_PyDay02Question09sol.mp3"
    },
    {
        "id": 10,
        "prompt": "<strong>[Medium] Singleton State Check: is None vs == None</strong><br/>A data cleaning function inspects missing values. Given <code>val = None</code>, compare <code>val is None</code> (store in <code>identity_check</code>) and <code>val == None</code> (store in <code>equality_check</code>). Write a comment explaining why <code>is None</code> is always preferred in production data pipelines.",
        "starterCode": "# Q10: Test None identity vs equality\nval = None\n\n# TODO: Store identity_check and equality_check booleans\nidentity_check = None\nequality_check = None\n\nprint(f\"is None: {identity_check} | == None: {equality_check}\")\n",
        "ref": "val = None\nidentity_check = (val is None)\nequality_check = (val == None)\nprint(f\"is None: {identity_check} | == None: {equality_check}\")\n",
        "questionAudio": "Day02/New_PyDay02Question10.mp3",
        "solutionAudio": "Day02/New_PyDay02Question10sol.mp3"
    },
    {
        "id": 11,
        "prompt": "<strong>[Medium] Stop-Word Query Filter with Membership Operator</strong><br/>Given user search query <code>query = 'best python course for data analysts in 2026'</code> and stop-word set <code>stop_words = {'for', 'in', 'the', 'a', 'of'}</code>, tokenize the query and filter out all words present in <code>stop_words</code> using the <code>not in</code> operator. Store the remaining tokens in <code>keywords</code>.",
        "starterCode": "# Q11: Filter keywords with 'not in'\nquery = 'best python course for data analysts in 2026'\nstop_words = {'for', 'in', 'the', 'a', 'of'}\n\n# TODO: Tokenize and filter stop-words\nkeywords = []\n\nprint(\"Keywords:\", keywords)\n",
        "ref": "query = 'best python course for data analysts in 2026'\nstop_words = {'for', 'in', 'the', 'a', 'of'}\ntokens = query.lower().split()\nkeywords = [t for t in tokens if t not in stop_words]\nprint(\"Keywords:\", keywords)\n",
        "questionAudio": "Day02/New_PyDay02Question11.mp3",
        "solutionAudio": "Day02/New_PyDay02Question11sol.mp3"
    },
    {
        "id": 12,
        "prompt": "<strong>[Medium] Walrus Operator Stream Consumer & Length Filter</strong><br/>Using the walrus operator (<code>:=</code>) inside a list comprehension, process a list of dirty strings: <code>lines = ['  hello  ', '   ', 'world of python', '  data  ']</code>. Strip each item and keep only those whose stripped length exceeds 4 characters. Store in <code>long_words</code>.",
        "starterCode": "# Q12: Walrus operator list comprehension\nlines = ['  hello  ', '   ', 'world of python', '  data  ']\n\n# TODO: Strip and filter len > 4 in a single pass using :=\nlong_words = []\n\nprint(\"Long words:\", long_words)\n",
        "ref": "lines = ['  hello  ', '   ', 'world of python', '  data  ']\nlong_words = [cleaned for item in lines if len(cleaned := item.strip()) > 4]\nprint(\"Long words:\", long_words)\n",
        "questionAudio": "Day02/New_PyDay02Question12.mp3",
        "solutionAudio": "Day02/New_PyDay02Question12sol.mp3"
    },
    {
        "id": 13,
        "prompt": "<strong>[Hard] Multi-Condition Credit Risk Scoring Engine</strong><br/>Evaluate loan applicants against strict credit criteria. An applicant qualifies for an automatic approval if: (1) <code>credit_score &gt;= 720</code> AND <code>debt_to_income &lt; 0.35</code>; OR (2) <code>credit_score &gt;= 680</code> AND <code>debt_to_income &lt; 0.25</code> AND <code>annual_income &gt;= 80000</code>. Evaluate for <code>applicant = {'credit_score': 690, 'debt_to_income': 0.22, 'annual_income': 95000}</code> and store the approval boolean in <code>is_approved</code>.",
        "starterCode": "# Q13: Multi-condition credit risk engine\napplicant = {'credit_score': 690, 'debt_to_income': 0.22, 'annual_income': 95000}\n\n# TODO: Formulate boolean expression with proper operator precedence & grouping\nis_approved = None\n\nprint(f\"Loan Approved: {is_approved}\")\n",
        "ref": "applicant = {'credit_score': 690, 'debt_to_income': 0.22, 'annual_income': 95000}\nc = applicant['credit_score']\nd = applicant['debt_to_income']\ni = applicant['annual_income']\n\nis_approved = (c >= 720 and d < 0.35) or (c >= 680 and d < 0.25 and i >= 80000)\nprint(f\"Loan Approved: {is_approved}\")\n",
        "questionAudio": "Day02/New_PyDay02Question13.mp3",
        "solutionAudio": "Day02/New_PyDay02Question13sol.mp3"
    },
    {
        "id": 14,
        "prompt": "<strong>[Hard] Bitwise Flag Aggregator for User Access Matrix</strong><br/>Given a stream of user audit log events with bitwise flags: <code>LOG_LOGIN = 1</code>, <code>LOG_VIEW = 2</code>, <code>LOG_EDIT = 4</code>, <code>LOG_EXPORT = 8</code>. A session log records the sequence of actions: <code>actions = [LOG_LOGIN, LOG_VIEW, LOG_EDIT, LOG_EXPORT]</code>. Aggregate all actions into a single <code>session_mask</code> using the bitwise OR operator. Then verify whether <code>LOG_EXPORT</code> was triggered.",
        "starterCode": "LOG_LOGIN  = 1\nLOG_VIEW   = 2\nLOG_EDIT   = 4\nLOG_EXPORT = 8\n\nactions = [LOG_LOGIN, LOG_VIEW, LOG_EDIT, LOG_EXPORT]\n\n# TODO: Aggregate actions into session_mask and verify did_export boolean\nsession_mask = 0\ndid_export = None\n\nprint(f\"Session Mask: {bin(session_mask)} | Exported: {did_export}\")\n",
        "ref": "LOG_LOGIN  = 1\nLOG_VIEW   = 2\nLOG_EDIT   = 4\nLOG_EXPORT = 8\n\nactions = [LOG_LOGIN, LOG_VIEW, LOG_EDIT, LOG_EXPORT]\nsession_mask = 0\nfor act in actions:\n    session_mask |= act\n\ndid_export = bool(session_mask & LOG_EXPORT)\nprint(f\"Session Mask: {bin(session_mask)} | Exported: {did_export}\")\n",
        "questionAudio": "Day02/New_PyDay02Question14.mp3",
        "solutionAudio": "Day02/New_PyDay02Question14sol.mp3"
    },
    {
        "id": 15,
        "prompt": "<strong>[Hard] Walrus-Optimized High-Performance Aggregator</strong><br/>Given an iterator/stream of numbers: <code>data = [12, -4, 25, 0, 8, -15, 33]</code>, compute both the running count of positive numbers and their running sum in a single pass using the walrus operator inside a list comprehension. Produce a list of <code>(number, cumulative_positive_sum)</code> tuples for all positive entries. Store in <code>positive_cumulative</code>.",
        "starterCode": "data = [12, -4, 25, 0, 8, -15, 33]\n\n# TODO: Build positive_cumulative list of (num, running_sum) tuples using :=\nrunning_sum = 0\npositive_cumulative = []\n\nprint(\"Positive Running Cumulative:\", positive_cumulative)\n",
        "ref": "data = [12, -4, 25, 0, 8, -15, 33]\nrunning_sum = 0\npositive_cumulative = [(x, running_sum := running_sum + x) for x in data if x > 0]\nprint(\"Positive Running Cumulative:\", positive_cumulative)\n",
        "questionAudio": "Day02/New_PyDay02Question15.mp3",
        "solutionAudio": "Day02/New_PyDay02Question15sol.mp3"
    }
],

  testQuestions: [
    {
      id: 1,
      prompt: "Compute BMI: <code>weight_kg / (height_m ** 2)</code>, round to 2 decimals, store in <code>bmi</code>. Classify as <code>\"Underweight\"</code>/<code>\"Normal\"</code>/<code>\"Overweight\"</code> using a <strong>ternary expression</strong>; store in <code>category</code>. Use <code>weight_kg=70, height_m=1.75</code>.",
      starterCode: `# Q1: BMI + ternary classification
weight_kg = 70
height_m  = 1.75

bmi = round(weight_kg / (height_m ** 2), 2)
category = "Underweight" if bmi < 18.5 else ("Normal" if bmi < 25 else "Overweight")

print(f"BMI      : {bmi}")
print(f"Category : {category}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "bmi",      type: "float",  value: 22.86, tolerance: 0.01 },
          { name: "category", type: "string", value: "Normal" }
        ]
      }
    },
    {
      id: 2,
      prompt: "Apply <code>**=</code> five times starting from <code>base = 2</code>; store each intermediate value in a list <code>steps</code>. Expected: <code>[4, 16, 256, 65536, 4294967296]</code>.",
      starterCode: `# Q2: Augmented assignment **=
base  = 2
steps = []
for _ in range(5):
    base **= 2
    steps.append(base)

print(f"Steps: {steps}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "steps", type: "list", value: [4, 16, 256, 65536, 4294967296] }
        ]
      }
    },
    {
      id: 3,
      prompt: "Floor division with negatives: compute <code>-7 // 2</code>, store in <code>result</code> (expect <code>-4</code>). Explain in a comment why Python rounds toward negative infinity rather than toward zero.",
      starterCode: `# Q3: Floor division semantics with negatives
result = -7 // 2    # rounds toward -inf → -4  (not -3 like C/Java!)
result_c_style = int(-7 / 2)   # C-style: truncation toward zero → -3

print(f"-7 // 2 (Python floor) : {result}")
print(f"int(-7/2) (C-style truncation): {result_c_style}")
# WHY -4?  Floor div always rounds DOWN (toward -infinity).
# For positive numbers floor and truncation agree.
# For negatives they diverge: floor(-3.5) = -4, trunc(-3.5) = -3.
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "int", value: -4 }
        ]
      }
    },
    {
      id: 4,
      prompt: "The precedence trap: for <code>x = 5</code>, evaluate <code>x &amp; 1 == 1</code> and store in <code>trapped_result</code>. Separately compute the <em>intended</em> check <code>(x &amp; 1) == 1</code> and store in <code>intended_result</code>.",
      starterCode: `# Q4: Bitwise vs comparison operator precedence bug
# Python precedence: == binds tighter than &
# So: x & 1 == 1  is parsed as  x & (1 == 1)  which is  x & True  which is  x & 1
x = 5  # binary: 101

# Without parentheses — may work accidentally for some values but is WRONG logic:
trapped_result  = x & 1 == 1   # Parsed as: x & (1 == 1) → x & True → 1 & True → 1 → truthy

# Correct — explicit parentheses:
intended_result = (x & 1) == 1  # (5 & 1) == 1 → 1 == 1 → True

# Test where they diverge:
x2 = 4  # binary: 100 (even number)
trapped2  = x2 & 1 == 1    # x2 & (1==1) → 4 & True → 0 → False (accidentally correct)
intended2 = (x2 & 1) == 1  # (4 & 1) == 1 → 0 == 1 → False

print(f"x=5  trapped : {trapped_result},  intended : {intended_result}")
print(f"x=4  trapped : {trapped2},  intended : {intended2}")
print("Always parenthesize flag checks!")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "intended_result", type: "bool", value: true }
        ]
      }
    },
    {
      id: 5,
      prompt: "Safe division using short-circuit: <code>safe_div = lambda a, b: b != 0 and a / b</code>. Test with <code>b=0</code> (store in <code>zero_case</code>) and <code>b=2</code> (store in <code>normal_case</code>).",
      starterCode: `# Q5: Short-circuit guard pattern
safe_div = lambda a, b: b != 0 and a / b

zero_case   = safe_div(10, 0)    # b==0 is falsy, short-circuits → False (not ZeroDivisionError!)
normal_case = safe_div(10, 2)    # b!=0 is truthy → evaluates and returns 5.0

print(f"safe_div(10, 0) → {zero_case}    (short-circuited)")
print(f"safe_div(10, 2) → {normal_case}  (evaluated)")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "zero_case",   type: "falsy" },
          { name: "normal_case", type: "float", value: 5.0, tolerance: 0.001 }
        ]
      }
    },
    {
      id: 6,
      prompt: "Walrus in a list: given <code>f(x) = x*2</code>, build <code>[y := f(x), y**2, y**3]</code> for <code>x = 3</code>, computing <code>f(x)</code> only once; store the list in <code>result</code>. Expected: <code>[6, 36, 216]</code>.",
      starterCode: `# Q6: Walrus operator := avoids recomputation
f = lambda x: x * 2

x = 3
result = [y := f(x), y**2, y**3]  # f(x) called ONCE; y is reused

print(f"f(3)  = y   = {result[0]}")
print(f"y**2       = {result[1]}")
print(f"y**3       = {result[2]}")
print(f"Full list  = {result}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "list", value: [6, 36, 216] }
        ]
      }
    },
    {
      id: 7,
      prompt: "Chained comparison: evaluate <code>0 &lt; score &lt; 100 and score != 50</code> for <code>score = 50</code> and <code>score = 75</code>. Store booleans in <code>result_50</code>, <code>result_75</code>.",
      starterCode: `# Q7: Python chained comparison
score = 50
result_50 = 0 < score < 100 and score != 50   # True AND False → False

score = 75
result_75 = 0 < score < 100 and score != 50   # True AND True  → True

print(f"score=50: {result_50}")
print(f"score=75: {result_75}")
# Python chaining: 0 < 50 < 100 evaluates as (0 < 50) and (50 < 100)
# Each operand evaluated ONCE — more efficient and readable than C-style
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result_50", type: "bool", value: false },
          { name: "result_75", type: "bool", value: true }
        ]
      }
    },
    {
      id: 8,
      prompt: "Even/odd check using bitwise: <code>(n &amp; 1) == 0</code> for even. Apply to the first 10 integers; store the boolean list in <code>result</code>.",
      starterCode: `# Q8: Bitwise AND even/odd check
result = [(n & 1) == 0 for n in range(10)]
labels = ["even" if v else "odd" for v in result]

for n, label in zip(range(10), labels):
    print(f"{n}: {label}  ({bin(n)} & 1 = {n & 1})")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "list", value: [true, false, true, false, true, false, true, false, true, false] }
        ]
      }
    },
    {
      id: 9,
      prompt: "Variable swap without a temp: <code>a, b = b, a</code>. Store both before/after states. Use <code>a=10, b=20</code>.",
      starterCode: `# Q9: Pythonic tuple-packing swap
a, b = 10, 20
before = (a, b)

a, b = b, a   # Python packs right side as (20,10) then unpacks left to left

after = (a, b)

print(f"Before: a={before[0]}, b={before[1]}")
print(f"After : a={after[0]},  b={after[1]}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "after", type: "list", value: [20, 10] }
        ]
      }
    },
    {
      id: 10,
      prompt: "Stop-word filter: <code>[w for w in text if w not in stop_words]</code> where <code>stop_words</code> is a <code>set</code>. Store in <code>result</code>. Add a comment explaining why <code>stop_words</code> should be a set, not a list.",
      starterCode: `# Q10: Membership test + complexity lesson
text = ["the", "cat", "sat", "on", "the", "mat"]
stop_words = {"the", "on"}   # Set: O(1) lookup per word

result = [w for w in text if w not in stop_words]
print(f"Filtered: {result}")
# WHY set, not list?
# list: 'w not in stop_words' → O(k) per word → O(n*k) total
# set:  'w not in stop_words' → O(1) per word → O(n) total
# For 10M words and 1000 stop words: list=10B ops vs set=10M ops!
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "list", value: ["cat","sat","mat"] }
        ]
      }
    },
    {
      id: 11,
      prompt: "Precedence trap: evaluate <code>not False == False</code>; store in <code>result</code>. Explain step-by-step in a comment why <code>==</code> binds tighter than <code>not</code>.",
      starterCode: `# Q11: not vs == operator precedence
# Python precedence: '==' > 'not'
# So: not False == False  is parsed as  not (False == False)  = not True = False
result = not False == False

# Step by step:
step1 = False == False   # True  (== first)
step2 = not step1        # False (not second)
print(f"not False == False → {result}")
print(f"  1. False == False → {step1}")
print(f"  2. not True      → {step2}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "bool", value: false }
        ]
      }
    },
    {
      id: 12,
      prompt: "Leap year check: <code>(year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)</code>. Test years <code>2000</code>, <code>1900</code>, <code>2024</code>. Store results in a dict <code>result</code>.",
      starterCode: `# Q12: Compound boolean — leap year
def is_leap(year):
    return (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)

result = {2000: is_leap(2000), 1900: is_leap(1900), 2024: is_leap(2024)}

for y, v in result.items():
    print(f"{y}: {'Leap' if v else 'Not leap'}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "dict", keys: [2000, 1900, 2024] }
        ]
      }
    },
    {
      id: 13,
      prompt: "Default value with <code>or</code>: test with <code>user_input = \"\"</code> (store <code>empty_case</code>) and <code>user_input = \"custom\"</code> (store <code>custom_case</code>). Explain in a comment one dangerous case.",
      starterCode: `# Q13: Short-circuit default pattern + its failure case
user_input = ""
empty_case = user_input or "default_value"   # "" is falsy → "default_value"

user_input = "custom"
custom_case = user_input or "default_value"   # "custom" is truthy → "custom"

print(f"empty  → '{empty_case}'")
print(f"custom → '{custom_case}'")

# DANGER CASE: What if the valid input IS falsy?
user_age = 0   # Valid! User is 0 years old
result = user_age or 18   # Returns 18 — WRONG! 0 is a valid age.
# FIX:
safe_result = user_age if user_age is not None else 18
print(f"or default(0): {result}  ← WRONG")
print(f"is None check: {safe_result}  ← Correct")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "empty_case",  type: "string", value: "default_value" },
          { name: "custom_case", type: "string", value: "custom" }
        ]
      }
    },
    {
      id: 14,
      prompt: "Bit shifting: compute powers of 2 up to <code>2**16</code> using <code>&lt;&lt;</code> (left shift). Store the list in <code>result</code>.",
      starterCode: `# Q14: Powers of 2 via left bit shift
# 1 << n  is equivalent to  2**n
result = [1 << n for n in range(17)]   # 2^0 through 2^16

for i, v in enumerate(result):
    print(f"1 << {i:2d} = 2^{i:2d} = {v:>8,}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "list", length: 17 }
        ]
      }
    },
    {
      id: 15,
      prompt: "<code>is None</code> vs <code>== None</code>: define a class with <code>__eq__</code> always returning <code>True</code>. Show <code>instance == None</code> returns <code>True</code> while <code>instance is None</code> returns <code>False</code>. Store both in <code>result_eq</code>, <code>result_is</code>.",
      starterCode: `# Q15: is None vs == None — why 'is None' is the safe choice
class TruthyEverything:
    def __eq__(self, other):
        return True   # Everything "equals" everything in this class

obj = TruthyEverything()
result_eq = (obj == None)   # True — because __eq__ returns True for everything
result_is = (obj is None)   # False — obj is clearly not the None singleton

print(f"obj == None : {result_eq}  (dangerous if checking for None!)")
print(f"obj is None : {result_is}  (correct — identity check)")
# LESSON: Always use 'is None' for None checks.
# PEP 8 requires it. It's the one time Python style is strict about operator choice.
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result_eq", type: "bool", value: true },
          { name: "result_is", type: "bool", value: false }
        ]
      }
    },
    {
      id: 16,
      prompt: "Safe attribute access via short-circuit: given <code>user = None</code>, evaluate <code>user and user.get(\"email\")</code> without raising <code>AttributeError</code>. Store in <code>result</code>.",
      starterCode: `# Q16: Short-circuit guard for nullable objects
user = None
result = user and user.get("email")   # None is falsy → short-circuits, no AttributeError

print(f"result: {result}   (falsy, not an exception)")
print(f"type  : {type(result).__name__}")

# Compare: what happens without the guard:
try:
    _ = user.get("email")   # AttributeError: 'NoneType' has no attribute 'get'
except AttributeError as e:
    print(f"Without guard → {type(e).__name__}: {e}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "falsy" }
        ]
      }
    },
    {
      id: 17,
      prompt: "Compound interest: <code>P * (1 + r/n) ** (n*t)</code> for <code>P=10000, r=0.08, n=12, t=5</code>. Round to 2 decimals, store in <code>result</code>.",
      starterCode: `# Q17: Compound interest — multi-operator precedence
P = 10000   # Principal
r = 0.08    # Annual rate
n = 12      # Compounding periods per year
t = 5       # Time in years

result = round(P * (1 + r/n) ** (n*t), 2)

print(f"Principal     : \\\${P:,}")
print(f"Rate          : {r*100}% annually")
print(f"Compounded    : {n}× per year for {t} years")
print(f"Final amount  : \\\${result:,}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "float", value: 14898.46, tolerance: 0.05 }
        ]
      }
    },
    {
      id: 18,
      prompt: "Input validation via set membership: check <code>response in {\"yes\",\"no\",\"maybe\"}</code> for several inputs. Store results in <code>result</code> as a dict. Explain the complexity benefit.",
      starterCode: `# Q18: Membership validation with set
valid_choices = {"yes", "no", "maybe"}
inputs = ["yes", "no", "yep", "maybe", "YES", ""]

result = {inp: inp in valid_choices for inp in inputs}

for inp, valid in result.items():
    print(f"'{inp:6s}' → {'✅ valid' if valid else '❌ invalid'}")

# O(1) per check with set vs O(k) with list where k=len(choices)
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "dict", keys: ["yes", "no", "maybe"] }
        ]
      }
    },
    {
      id: 19,
      prompt: "Bitwise NOT: compute <code>~5</code>, store in <code>result</code> (expect <code>-6</code>). Explain in a comment using two's complement (<code>~n == -(n+1)</code>).",
      starterCode: `# Q19: Bitwise NOT ~ and two's complement
result = ~5   # Expected: -6

print(f"~5 = {result}")
print(f"~0 = {~0}")    # -1
print(f"~(-1) = {~(-1)}")  # 0

# WHY ~5 == -6?
# In two's complement: ~n = -(n+1)
# Bit flip of 0b00000101 (5) = 0b11111010
# In two's complement this represents -6
# Formula: ~n = -(n+1) for all integers
for n in range(-3, 4):
    print(f"~{n:2d} = {~n:3d}  (= -({n}+1) = {-(n+1)})")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "int", value: -6 }
        ]
      }
    },
    {
      id: 20,
      prompt: "Use <code>any()</code> and <code>all()</code> with a generator: <code>x &gt; 0 for x in [-1,-2,3]</code>. Store <code>any_result</code>, <code>all_result</code>. Explain in a comment why a generator avoids unnecessary evaluations.",
      starterCode: `# Q20: any() and all() with lazy generators
data = [-1, -2, 3]

any_result = any(x > 0 for x in data)   # Stops at first True (x=3)
all_result = all(x > 0 for x in data)   # Stops at first False (x=-1)

print(f"any(x>0): {any_result}")   # True  (3 > 0)
print(f"all(x>0): {all_result}")   # False (-1 is not > 0)

# WHY generator, not list?
# any([x>0 for x in data])   → evaluates ALL elements first, THEN checks
# any(x>0 for x in data)     → stops as soon as one True is found (lazy)
# For 10M elements, stopping early saves massive computation!
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "any_result", type: "bool", value: true },
          { name: "all_result", type: "bool", value: false }
        ]
      }
    },
    {
      id: 21,
      prompt: "XOR trick: given <code>[3,5,3,7,5,9,9]</code> (every element paired except one), use <code>functools.reduce</code> with XOR to find the unique element. Store in <code>result</code>.",
      starterCode: `# Q21: XOR to find the lone element
import functools

lst = [3, 5, 3, 7, 5, 9, 9]
result = functools.reduce(lambda a, b: a ^ b, lst)

print(f"List    : {lst}")
print(f"Unique  : {result}")
# WHY? XOR properties:
# a ^ a = 0  (same values cancel out)
# a ^ 0 = a  (XOR with 0 leaves value unchanged)
# So: 3^5^3^7^5^9^9 = (3^3)^(5^5)^(9^9)^7 = 0^0^0^7 = 7
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "int", value: 7 }
        ]
      }
    },
    {
      id: 22,
      prompt: "Ternary refactoring: rewrite a 4-line <code>if/else</code> discount-tier block as a single nested ternary. Store the result in <code>result</code> for <code>purchase_amount = 150</code>.",
      starterCode: `# Q22: Ternary expression refactoring
purchase_amount = 150

# Original if/else block:
if purchase_amount >= 500:
    tier = "Platinum"
elif purchase_amount >= 200:
    tier = "Gold"
elif purchase_amount >= 100:
    tier = "Silver"
else:
    tier = "Standard"

# Refactored to single ternary expression:
result = ("Platinum" if purchase_amount >= 500 else
          "Gold"     if purchase_amount >= 200 else
          "Silver"   if purchase_amount >= 100 else
          "Standard")

print(f"Amount : \\\${purchase_amount}")
print(f"Tier   : {result}")
print(f"Match  : {tier == result}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "result", type: "string", value: "Silver" }
        ]
      }
    },
    {
      id: 23,
      prompt: "Unpacking merge: merge <code>defaults = {\"a\":1,\"b\":2}</code> and <code>overrides = {\"b\":99,\"c\":3}</code> two ways — using <code>{**defaults, **overrides}</code> and the <code>|</code> merge operator (Python 3.9+). Store both in <code>merged_unpack</code>, <code>merged_pipe</code>.",
      starterCode: `# Q23: Dict merge — two modern approaches
defaults  = {"a": 1, "b": 2}
overrides = {"b": 99, "c": 3}

# Method 1: Unpacking merge (Python 3.5+)
merged_unpack = {**defaults, **overrides}

# Method 2: | merge operator (Python 3.9+)
merged_pipe = defaults | overrides

print(f"Unpack merge : {merged_unpack}")
print(f"Pipe merge   : {merged_pipe}")
print(f"Same result  : {merged_unpack == merged_pipe}")
# In both cases, 'overrides' wins for key "b" → 99
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "merged_unpack", type: "dict", keys: ["a", "b", "c"] },
          { name: "merged_pipe",   type: "dict", keys: ["a", "b", "c"] }
        ]
      }
    },
    {
      id: 24,
      prompt: "String formatting comparison: given <code>value = 1234.5</code>, produce <code>\"1,234.50\"</code> three ways — <code>%</code>-style, <code>.format()</code>, and f-string format spec. Store all three in <code>pct_style</code>, <code>format_style</code>, <code>fstring_style</code>.",
      starterCode: `# Q24: Three string formatting approaches
value = 1234.5

# %-style (old Python 2 style — % is BOTH modulo AND format operator!)
pct_style    = "{:,.2f}".format(value)   # Using .format for comma support
# True %-style comma formatting requires locale or manual: "%.2f" % value

# .format() style
format_style = "{:,.2f}".format(value)

# f-string (preferred modern Python)
fstring_style = f"{value:,.2f}"

print(f"%-style    : {pct_style}")
print(f".format()  : {format_style}")
print(f"f-string   : {fstring_style}")
print(f"All same?  : {pct_style == format_style == fstring_style}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "fstring_style", type: "string", value: "1,234.50" }
        ]
      }
    },
    {
      id: 25,
      prompt: "Permission flags: define <code>READ=1, WRITE=2, EXEC=4</code>. Combine <code>READ | WRITE</code> into <code>perms</code>. Check <code>EXEC</code> with <code>&amp;</code> (store <code>has_exec</code>, expect <code>False</code>). Toggle <code>EXEC</code> on with <code>^</code> (store <code>toggled</code>).",
      starterCode: `# Q25: Unix-style permission flags — tying together bitwise operators
READ  = 1   # binary: 001
WRITE = 2   # binary: 010
EXEC  = 4   # binary: 100

# Combine READ + WRITE using |
perms = READ | WRITE   # 011 = 3

# Check if EXEC is set using &
has_exec = bool(perms & EXEC)   # 011 & 100 = 000 → False

# Toggle EXEC on using ^ (XOR flips the bit)
toggled = perms ^ EXEC          # 011 ^ 100 = 111 = 7 (READ+WRITE+EXEC)

print(f"perms     = {perms}  = {bin(perms)}  (READ+WRITE)")
print(f"has_exec  = {has_exec}")
print(f"toggled   = {toggled}  = {bin(toggled)} (READ+WRITE+EXEC)")

# Verify individual permissions in toggled:
print(f"After toggle — READ: {bool(toggled & READ)}, WRITE: {bool(toggled & WRITE)}, EXEC: {bool(toggled & EXEC)}")
`,
      validation: {
        mode: "variable_check",
        checkVars: [
          { name: "has_exec", type: "bool",  value: false },
          { name: "toggled",  type: "int",   value: 7 }
        ]
      }
    }
  ]
};
