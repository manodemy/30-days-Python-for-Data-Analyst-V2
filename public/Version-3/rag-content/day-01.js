/* ═══════════════════════════════════════════════════════════════════
   Manodemy Advanced RAG Studio — Day 01 Content (v2.0 Audit-Revised)
   Course: Production Retrieval-Augmented Generation (RAG) Studio
   Day 01: The Architecture of RAG & Anatomy of LLM Hallucination
   ═══════════════════════════════════════════════════════════════════ */

if (!window.COURSE_CONTENT) window.COURSE_CONTENT = {};

window.COURSE_CONTENT['rag-day01'] = {
  day: 1,
  title: "The Architecture of RAG & Anatomy of LLM Hallucination",
  category: "Phase 1: First Principles & Vector Geometry",
  badge: "Architect",
  icon: "🏗️",
  totalQuestions: 5,
  totalMarks: 100,

  // ── Document Corpus / Running Example for Day 01: Internal HR Policy Assistant ──
  corpus: {
    name: "Acme Corp Internal HR Benefits Manual (2024)",
    documentCount: 4,
    embeddingModel: "bge-base-en-v1.5 (384-d preview)",
    chunkStrategy: "Per-clause sections (200-400 tokens)",
    documents: [
      { id: "HR-01", title: "PTO & Vacation Accrual Policy", tokens: 280, section: "Section 3B", date: "2024-01-10" },
      { id: "HR-02", title: "Remote Work & Equipment Stipend", tokens: 320, section: "Section 5A", date: "2024-02-01" },
      { id: "HR-03", title: "Health Insurance & Wellness Subsidy", tokens: 410, section: "Section 7C", date: "2024-01-15" },
      { id: "HR-04", title: "Parental Leave & Family Support", tokens: 350, section: "Section 8D", date: "2024-03-01" }
    ]
  },

  // ── Topic Navigation Structure ──
  topics: [
    { id: "topic-1", label: "Topic 1: How LLMs Think & Why They Hallucinate", recordingKey: null },
    { id: "topic-2", label: "Topic 2: What Does R-A-G Mean? (Open-Book Exam)", recordingKey: null },
    { id: "topic-3", label: "Topic 3: 3 Bugs — Indexing vs Retrieval vs Generation", recordingKey: null },
    { id: "topic-4", label: "Topic 4: Running Example — Internal HR Assistant", recordingKey: null },
    { id: "topic-5", label: "Topic 5: RAG vs Fine-Tuning Decision Matrix", recordingKey: null }
  ],

  // ── 5 Comprehensive Theory Slides (Audit-Revised v2.0) ──
  slides: [
    {
      id: "slide-1",
      title: "01. How LLMs Actually Think (And Why They Hallucinate)",
      duration: "3:15",
      html: `
        <div class="rag-slide-header">
          <span class="rag-badge">First Principles</span>
          <h2>🧠 How LLMs Actually Think (And Why They Hallucinate)</h2>
        </div>

        <div class="slide-section" id="ragSlide1">
          <p><strong>The Autocomplete Reality:</strong> An LLM is fundamentally a <em>probabilistic next-word predictor</em> trained on massive internet text. It does not "know" facts the way a database does; it calculates the most probable next token given everything before it.</p>

          <div class="rag-callout rag-callout--info">
            <strong>The "Baked Cake" Analogy (Parametric Memory):</strong><br>
            When a model is trained, facts get compressed into billions of numbers called <strong>weights</strong> — its <em>parametric memory</em>. Like sugar baked into a cake, you cannot reach in and swap out one ingredient once the cake is baked. You would have to bake a whole new cake (expensive retraining).
          </div>

          <p><strong>So what do we do instead of re-baking every time?</strong><br>
          👉 We hand the model a <strong>fresh, correct ingredient right before it answers</strong> — that is the entire idea behind RAG!</p>

          <div class="rag-comparison-cards">
            <div class="rag-card rag-card--parametric">
              <div class="rag-card-header">
                <span class="rag-card-icon">⚠️</span>
                <h4>The 3 Incurable Flaws of a Standalone LLM</h4>
              </div>
              <ul class="rag-card-list">
                <li><strong>Training Cutoff:</strong> It knows nothing that happened after its training date.</li>
                <li><strong>Private Data Blindness:</strong> It has never read your company's internal documents, Notion pages, tickets, or code.</li>
                <li><strong>Confident Confabulation (Hallucination):</strong> When it cannot cleanly recall a specific fact, it generates fluent, convincing, <em>fabricated</em> text instead of admitting uncertainty.</li>
              </ul>
            </div>

            <div class="rag-card rag-card--nonparametric">
              <div class="rag-card-header">
                <span class="rag-card-icon">⚡</span>
                <h4>The RAG Breakthrough (Non-Parametric Memory)</h4>
              </div>
              <ul class="rag-card-list">
                <li><strong>Always Fresh:</strong> Update facts in milliseconds by adding a new text file.</li>
                <li><strong>Private &amp; Secure:</strong> Feeds your exact company documents into the context window.</li>
                <li><strong>100% Verifiable Citations:</strong> Points back directly to page and paragraph numbers.</li>
              </ul>
            </div>
          </div>

          <div class="rag-callout rag-callout--success">
            <strong>The Core Law of AI Engineering:</strong> <em>An LLM is a reasoning engine, not a memory bank.</em>
          </div>
        </div>
      `
    },
    {
      id: "slide-2",
      title: "02. What Does 'R-A-G' Mean? (The 4-Step Lifecycle)",
      duration: "3:30",
      html: `
        <div class="rag-slide-header">
          <span class="rag-badge">Core Architecture</span>
          <h2>⚙️ What Does 'R-A-G' Mean? (The Open-Book Exam)</h2>
        </div>

        <div class="slide-section" id="ragSlide2">
          <div class="rag-comparison-cards" style="margin-bottom: 16px;">
            <div class="rag-card" style="border-top: 3px solid #f43f5e;">
              <h4>🔒 Vanilla LLM = Closed-Book Exam</h4>
              <p style="font-size: 12px; margin: 6px 0 0 0; color: #94a3b8;">A student taking an exam strictly from memory — prone to guessing and confabulation when memory fades.</p>
            </div>
            <div class="rag-card" style="border-top: 3px solid #10b981;">
              <h4>📖 RAG = Open-Book Exam</h4>
              <p style="font-size: 12px; margin: 6px 0 0 0; color: #94a3b8;">A student taking an exam who is handed the exact right reference page seconds before answering.</p>
            </div>
          </div>

          <p><strong>The 3 Letters, Mapped to the Analogy:</strong></p>
          <ul class="rag-card-list" style="margin-bottom: 16px;">
            <li><strong>R — Retrieval:</strong> Search your private documents and pull out the 1–3 most relevant paragraphs (<em>find the right page</em>).</li>
            <li><strong>A — Augmented:</strong> Glue those paragraphs directly into the user's prompt as trusted reference material (<em>open the book to that page</em>).</li>
            <li><strong>G — Generation:</strong> The LLM reads that material and writes a natural-language answer grounded in it (<em>answer the question using the page</em>).</li>
          </ul>

          <!-- Interactive 5-Stage Conveyor Belt Widget -->
          <div class="rag-conveyor-container" id="conveyorBeltWidget">
            <div class="rag-conveyor-stages">
              <div class="conveyor-step active" data-step="1" onclick="selectConveyorStage(1)">
                <div class="step-num">01</div>
                <div class="step-icon">📥</div>
                <div class="step-name">Ingest</div>
                <div class="step-desc">Unpacking groceries</div>
              </div>
              <div class="conveyor-arrow">➔</div>
              <div class="conveyor-step" data-step="2" onclick="selectConveyorStage(2)">
                <div class="step-num">02</div>
                <div class="step-icon">✂️</div>
                <div class="step-name">Chunk</div>
                <div class="step-desc">Chopping vegetables</div>
              </div>
              <div class="conveyor-arrow">➔</div>
              <div class="conveyor-step" data-step="3" onclick="selectConveyorStage(3)" title="Preview step today — full math tomorrow on Day 02!">
                <div class="step-num">03</div>
                <div class="step-icon">🏷️</div>
                <div class="step-name">Embed <sup>*preview</sup></div>
                <div class="step-desc">Flavor labels</div>
              </div>
              <div class="conveyor-arrow">➔</div>
              <div class="conveyor-step" data-step="4" onclick="selectConveyorStage(4)">
                <div class="step-num">04</div>
                <div class="step-icon">🔍</div>
                <div class="step-name">Retrieve</div>
                <div class="step-desc">Grabbing ingredients</div>
              </div>
              <div class="conveyor-arrow">➔</div>
              <div class="conveyor-step" data-step="5" onclick="selectConveyorStage(5)">
                <div class="step-num">05</div>
                <div class="step-icon">🍳</div>
                <div class="step-name">Synthesize</div>
                <div class="step-desc">Cooking the dish</div>
              </div>
            </div>

            <!-- Dynamic Stage Inspector Box -->
            <div class="rag-stage-inspector" id="stageInspectorCard">
              <div class="stage-inspector-header">
                <span class="stage-tag" id="inspectorStageTag">STAGE 1: INGESTION</span>
                <span class="stage-latency" id="inspectorStageLatency">Avg Latency: 120ms</span>
              </div>
              <h4 id="inspectorStageTitle">Raw Document Extraction</h4>
              <p id="inspectorStageDescription">Extracts clean text and metadata from messy PDFs, Word files, Notion pages, and databases.</p>
              <div class="inspector-io-grid">
                <div class="io-box">
                  <span class="io-label">INPUT</span>
                  <code id="inspectorInput">annual_benefits_2024.pdf (500 pages)</code>
                </div>
                <div class="io-box">
                  <span class="io-label">OUTPUT</span>
                  <code id="inspectorOutput">Clean markdown text + {page, title, date}</code>
                </div>
              </div>
            </div>
          </div>

          <div class="rag-callout rag-callout--info">
            🔖 <strong>Placeholder Concept — "Embeddings":</strong> You will see this word in the diagram above. For today, just know it means: <em>"turning text into numbers that capture its meaning so a computer can compare closeness of ideas, not just matching words."</em> We won't touch vector math today — that is the dedicated subject of <strong>Day 02</strong>!
          </div>
        </div>
      `
    },
    {
      id: "slide-3",
      title: "03. Three Distinct Bugs: Indexing vs Retrieval vs Generation Failure",
      duration: "3:40",
      html: `
        <div class="rag-slide-header">
          <span class="rag-badge">Production Diagnostics</span>
          <h2>🔍 Three Distinct Bugs: Where Did the RAG System Break?</h2>
        </div>

        <div class="slide-section" id="ragSlide3">
          <p>When a RAG system returns an incorrect answer, engineers must diagnose <strong>which stage</strong> broke. In production, there are 3 distinct failure boundaries:</p>

          <table class="rag-decision-table">
            <thead>
              <tr>
                <th>Failure Type</th>
                <th>Stage</th>
                <th>What Went Wrong</th>
                <th>Real-World Example</th>
                <th>How to Fix It</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><span class="pill-yellow">Indexing / Chunking Failure</span></td>
                <td>Stage 2 (Chunk)</td>
                <td>The answer was sliced in half across two chunks, so no single chunk contains the complete answer.</td>
                <td>The refund dollar amount is on Page 2 and the eligibility condition is on Page 3 — both chunks are incomplete.</td>
                <td>Adjust chunk size, add chunk overlap (e.g. 50 characters), or chunk by logical document sections.</td>
              </tr>
              <tr>
                <td><span class="pill-blue">Retrieval Failure</span></td>
                <td>Stage 4 (Search)</td>
                <td>The correct chunk exists in the database, but the search step fetched the wrong chunk or missed it entirely.</td>
                <td>User asks about 2024 benefits; the search engine fetched 2021 archived policies instead.</td>
                <td>Upgrade from keyword search to semantic embeddings (Day 02), tune number of retrieved chunks ($k$).</td>
              </tr>
              <tr>
                <td><span class="pill-red">Generation Failure</span></td>
                <td>Stage 5 (LLM)</td>
                <td>The correct chunk was fetched and placed into the prompt, but the LLM misread it, ignored it, or added fabricated claims.</td>
                <td>Context clearly says: <em>"Max PTO carryover is 5 days"</em>, but the LLM states: <em>"You can carry over 15 days."</em></td>
                <td>Lower temperature to 0.0, enforce strict system prompt XML delimiters, add verification citation checks.</td>
              </tr>
            </tbody>
          </table>

          <div class="rag-callout rag-callout--info">
            <strong>Why this matters in production:</strong> If you don't know which stage broke, you will waste days rewriting prompts when the real bug was a bad chunk boundary two stages earlier!
          </div>
        </div>
      `
    },
    {
      id: "slide-4",
      title: "04. One Running Example: The Internal HR Policy Assistant",
      duration: "2:30",
      html: `
        <div class="rag-slide-header">
          <span class="rag-badge">Case Study</span>
          <h2>🏢 One Running Example: The Internal HR Policy Assistant</h2>
        </div>

        <div class="slide-section" id="ragSlide4">
          <p>To keep concepts clear and grounded, we will follow <strong>one continuous real-world project</strong> across today's coding challenges:</p>

          <div class="rag-callout rag-callout--info">
            <strong>The Business Problem:</strong> Acme Corp has a 500-page internal benefits manual that updates every quarter. Employees repeatedly ask the same questions: <em>"How many vacation days do I get?"</em>, <em>"What is the remote work stipend?"</em> HR is overwhelmed answering 200 emails a day.
          </div>

          <div class="archetype-timeline">
            <div class="archetype-card highlight">
              <div class="archetype-icon">📥</div>
              <div class="archetype-info">
                <h4>1. Ingestion</h4>
                <p>We extract clean text from Acme Corp's <code>benefits_manual_2024.pdf</code>.</p>
              </div>
            </div>
            <div class="archetype-card highlight">
              <div class="archetype-icon">✂️</div>
              <div class="archetype-info">
                <h4>2. Chunking</h4>
                <p>We slice the manual into per-clause paragraphs (e.g. PTO Policy, Health Insurance, Parental Leave).</p>
              </div>
            </div>
            <div class="archetype-card highlight">
              <div class="archetype-icon">🏷️</div>
              <div class="archetype-info">
                <h4>3. Embedding &amp; Indexing (Preview)</h4>
                <p>Each chunk is labeled so a computer can compare meaning.</p>
              </div>
            </div>
            <div class="archetype-card highlight">
              <div class="archetype-icon">🔍</div>
              <div class="archetype-info">
                <h4>4. Retrieval</h4>
                <p>When an employee asks: <em>"How much is the home office desk stipend?"</em>, our code retrieves Section 5A.</p>
              </div>
            </div>
            <div class="archetype-card highlight">
              <div class="archetype-icon">🤖</div>
              <div class="archetype-info">
                <h4>5. Synthesis</h4>
                <p>The LLM reads Section 5A and answers: <em>"You are eligible for a $500 one-time home office equipment stipend [Section 5A, Page 14]."</em></p>
              </div>
            </div>
          </div>

          <div class="rag-callout rag-callout--success">
            <strong>Hands-On Connection:</strong> Every Python challenge you write today is an actual, working piece of this HR Assistant pipeline!
          </div>
        </div>
      `
    },
    {
      id: "slide-5",
      title: "05. The Executive Decision Matrix: RAG vs Fine-Tuning",
      duration: "2:45",
      html: `
        <div class="rag-slide-header">
          <span class="rag-badge">Strategy</span>
          <h2>⚖️ The Executive Decision Matrix: RAG vs. Fine-Tuning</h2>
        </div>

        <div class="slide-section" id="ragSlide5">
          <p>A classic enterprise mistake: spending $50,000 fine-tuning a model to teach it internal documents, when RAG would have worked in minutes.</p>

          <div class="rag-comparison-cards">
            <div class="rag-card" style="border-top: 3px solid #c084fc;">
              <h4>🩺 Fine-Tuning = Medical School</h4>
              <p style="font-size: 12px; margin-top: 6px; color: #94a3b8;">Teaches the AI <strong>how to think, speak, and format</strong> like a doctor (medical terminology, bedside manner, strict JSON format).</p>
            </div>
            <div class="rag-card" style="border-top: 3px solid #10b981;">
              <h4>📋 RAG = The Patient's Chart</h4>
              <p style="font-size: 12px; margin-top: 6px; color: #94a3b8;">Hands the doctor the patient's actual lab results and MRI scan right before they prescribe treatment.</p>
            </div>
          </div>

          <table class="rag-decision-table">
            <thead>
              <tr>
                <th>Decision Factor</th>
                <th>Choose RAG</th>
                <th>Choose Fine-Tuning</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><strong>Information Changes Often?</strong></td>
                <td><span class="pill-green">✅ Yes</span> (Daily, weekly, or quarterly updates)</td>
                <td><span class="pill-red">❌ No</span> (Static knowledge; retraining takes hours/days)</td>
              </tr>
              <tr>
                <td><strong>Source Citations Required?</strong></td>
                <td><span class="pill-green">✅ Yes</span> (Must prove facts with exact page numbers)</td>
                <td><span class="pill-red">❌ No</span> (Weights cannot guarantee source provenance)</td>
              </tr>
              <tr>
                <td><strong>Row-Level Access Control (RBAC)?</strong></td>
                <td><span class="pill-green">✅ Yes</span> (Only retrieve documents the user is authorized to see)</td>
                <td><span class="pill-red">❌ No</span> (Weights are global; high risk of leaking private data)</td>
              </tr>
              <tr>
                <td><strong>Teaching Style, Tone, or Strict JSON?</strong></td>
                <td><span class="pill-yellow">⚠️ Standard prompting</span></td>
                <td><span class="pill-purple">✅ Yes</span> (Adapts phrasing, dialect, or custom schema)</td>
              </tr>
              <tr>
                <td><strong>Infrastructure &amp; Upfront Cost</strong></td>
                <td><span class="pill-green">🟢 Low</span> (Vector storage + standard API calls)</td>
                <td><span class="pill-red">🔴 High</span> (GPU training clusters + curated datasets)</td>
              </tr>
            </tbody>
          </table>

          <div class="rag-callout rag-callout--info">
            <strong>Production Rule of Thumb:</strong> In enterprise AI, teams increasingly do <strong>both</strong> — RAG for knowledge and facts, and light fine-tuning for domain tone and JSON formatting. Treat this as "which one first!", not strictly either/or.
          </div>
        </div>
      `
    }
  ],

  // ── 5 Hands-On Python Challenges (Audit-Revised v2.0) ──
  practiceQuestions: [
    {
      id: 1,
      topic: "Topic 1: The 'Open-Book' RAG Prompt Assembler",
      prompt: `In RAG, we physically combine retrieved context with a user question into one formatted prompt string before sending it to the LLM.<br><br>
Write a function <code>build_rag_prompt(context_text: str, user_question: str) -> str</code> that returns a string formatted with exact headers:
<pre>Context:
{context_text}

Question:
{user_question}

Answer:</pre>
<em>Note: Ensure there are blank lines between sections as shown above.</em>`,
      starterCode: `def build_rag_prompt(context_text: str, user_question: str) -> str:
    # Use an f-string to combine context_text and user_question into the template
    pass

# Quick test
sample_context = "Acme Corp employees receive 15 days of PTO annually."
sample_question = "How many vacation days do I get?"
print(build_rag_prompt(sample_context, sample_question))
`,
      solutionCode: `def build_rag_prompt(context_text: str, user_question: str) -> str:
    return f"""Context:
{context_text}

Question:
{user_question}

Answer:"""

# Quick test
sample_context = "Acme Corp employees receive 15 days of PTO annually."
sample_question = "How many vacation days do I get?"
print(build_rag_prompt(sample_context, sample_question))
`,
      testHarness: `
ctx = "Employees are eligible for a $500 home desk stipend."
q = "What is the equipment allowance?"
prompt = build_rag_prompt(ctx, q)

assert "Context:" in prompt, "Prompt must contain 'Context:' header"
assert "Question:" in prompt, "Prompt must contain 'Question:' header"
assert "Answer:" in prompt, "Prompt must contain 'Answer:' header"
assert ctx in prompt, "Context text must be inserted accurately"
assert q in prompt, "User question must be inserted accurately"
expected_start = "Context:\\n" + ctx
assert prompt.startswith(expected_start), "Prompt must begin with Context:"
print("✅ ALL PROMPT ASSEMBLER TESTS PASSED")
`,
      hint: "Use a multi-line f-string f'''Context:\\n{context_text}\\n\\nQuestion:\\n{user_question}\\n\\nAnswer:'''"
    },
    {
      id: 2,
      topic: "Topic 2: Baby Retrieval & The Exact-Match Stress Test",
      prompt: `Before we explore high-dimensional vectors on Day 02, let's understand how passage search works with basic Python strings.<br><br>
Write a function <code>find_matching_chunk(chunks: list, search_term: str) -> str</code> that iterates through a list of text chunks and returns the <strong>first chunk</strong> containing <code>search_term</code> (case-insensitive).<br><br>
If no chunk matches, return: <code>"No relevant document found."</code>`,
      starterCode: `def find_matching_chunk(chunks: list, search_term: str) -> str:
    # Iterate through chunks and check if search_term.lower() is in chunk.lower()
    pass

# Quick test
hr_chunks = [
    "Section 1: Working hours are 9am to 5pm Monday through Friday.",
    "Section 2: The guest wifi password is AcmeWelcome2024.",
    "Section 3: Standard lunch break is 60 minutes."
]
print(find_matching_chunk(hr_chunks, "WIFI"))
`,
      solutionCode: `def find_matching_chunk(chunks: list, search_term: str) -> str:
    term = search_term.lower()
    for chunk in chunks:
        if term in chunk.lower():
            return chunk
    return "No relevant document found."

# Quick test
hr_chunks = [
    "Section 1: Working hours are 9am to 5pm Monday through Friday.",
    "Section 2: The guest wifi password is AcmeWelcome2024.",
    "Section 3: Standard lunch break is 60 minutes."
]
print("Found:", find_matching_chunk(hr_chunks, "WIFI"))
print("Stress test (fails on meaning):", find_matching_chunk(hr_chunks, "internet credentials"))
`,
      testHarness: `
chunks = [
    "Section 1: Working hours are 9am to 5pm Monday through Friday.",
    "Section 2: The guest wifi password is AcmeWelcome2024.",
    "Section 3: Standard lunch break is 60 minutes."
]

# Test 1: Case-insensitivity
match1 = find_matching_chunk(chunks, "WIFI")
assert "wifi password" in match1, "Should match 'WIFI' to 'wifi' case-insensitively"

# Test 2: Missing keyword
match2 = find_matching_chunk(chunks, "dental care")
assert match2 == "No relevant document found.", "Should return fallback string when not found"

# Test 3: The Built-in Stress Test
# Notice: 'internet credentials' means the same thing as wifi password,
# but keyword search fails! This proves why we need Day 02 embeddings!
stress_result = find_matching_chunk(chunks, "internet credentials")
assert stress_result == "No relevant document found.", "Keyword search fails on synonyms — setting up Day 02!"
print("✅ ALL BABY RETRIEVAL TESTS PASSED (Including Synonym Stress Test)")
`,
      hint: "Convert both search_term and chunk to lowercase using .lower() before using the 'in' operator."
    },
    {
      id: 3,
      topic: "Topic 3: Context Window Budget Guard",
      prompt: `Context windows have strict token limits. Exceeding them causes model crashes or costly truncation.<br><br>
Write a function <code>check_token_budget(chunks: list, max_tokens: int = 1000) -> dict</code>.<br>
Each item in <code>chunks</code> is a dictionary: <code>{"id": str, "text": str, "tokens": int}</code>.<br><br>
Calculate the sum of <code>tokens</code> across all chunks and return a dictionary:
<pre>{
    "total_tokens": int,
    "within_budget": bool,      # True if total_tokens <= max_tokens, else False
    "tokens_remaining": int     # max(0, max_tokens - total_tokens)
}</pre>`,
      starterCode: `def check_token_budget(chunks: list, max_tokens: int = 1000) -> dict:
    # Calculate sum of chunk["tokens"], compare against max_tokens
    pass

# Quick test
sample_chunks = [
    {"id": "c1", "text": "PTO policy details...", "tokens": 250},
    {"id": "c2", "text": "Stipend guidelines...", "tokens": 300}
]
print(check_token_budget(sample_chunks, max_tokens=1000))
`,
      solutionCode: `def check_token_budget(chunks: list, max_tokens: int = 1000) -> dict:
    total = sum(chunk.get("tokens", 0) for chunk in chunks)
    within = total <= max_tokens
    remaining = max(0, max_tokens - total)
    return {
        "total_tokens": total,
        "within_budget": within,
        "tokens_remaining": remaining
    }

# Quick test
sample_chunks = [
    {"id": "c1", "text": "PTO policy details...", "tokens": 250},
    {"id": "c2", "text": "Stipend guidelines...", "tokens": 300}
]
print(check_token_budget(sample_chunks, max_tokens=1000))
`,
      testHarness: `
c = [
    {"id": "c1", "text": "A", "tokens": 300},
    {"id": "c2", "text": "B", "tokens": 400}
]
res1 = check_token_budget(c, 1000)
assert res1["total_tokens"] == 700, "Total tokens must be 700"
assert res1["within_budget"] is True, "700 <= 1000 should be within budget"
assert res1["tokens_remaining"] == 300, "1000 - 700 = 300 remaining"

# Overflow case
overflow_c = [{"id": "c3", "text": "Big", "tokens": 1200}]
res2 = check_token_budget(overflow_c, 1000)
assert res2["within_budget"] is False, "1200 > 1000 is over budget"
assert res2["tokens_remaining"] == 0, "Remaining tokens must clamp to 0, never negative"
print("✅ ALL TOKEN BUDGET GUARD TESTS PASSED")
`,
      hint: "Use sum(c['tokens'] for c in chunks) to compute the total, and max(0, max_tokens - total) for remaining."
    },
    {
      id: 4,
      topic: "Topic 4: Grounded Source Citation Generator",
      prompt: `Transparency and auditability are critical: every production RAG answer should cite its exact source document and page number.<br><br>
Write a function <code>format_citation(answer: str, document_title: str, page_number: int) -> str</code> that returns:
<pre>{answer}

[Source: {document_title} | Page {page_number}]</pre>`,
      starterCode: `def format_citation(answer: str, document_title: str, page_number: int) -> str:
    # Return answer formatted with the source citation footer
    pass

# Quick test
ans = "Full-time employees accrue 1.25 vacation days per month."
print(format_citation(ans, "Acme_Benefits_Manual.pdf", 14))
`,
      solutionCode: `def format_citation(answer: str, document_title: str, page_number: int) -> str:
    return f"{answer}\\n\\n[Source: {document_title} | Page {page_number}]"

# Quick test
ans = "Full-time employees accrue 1.25 vacation days per month."
print(format_citation(ans, "Acme_Benefits_Manual.pdf", 14))
`,
      testHarness: `
ans = "Employees get 15 days of PTO."
doc = "HR_Handbook_2024.pdf"
page = 42
formatted = format_citation(ans, doc, page)

assert ans in formatted, "Original answer must be preserved"
assert "[Source: HR_Handbook_2024.pdf | Page 42]" in formatted, "Citation format must match exactly"
assert "\\n\\n" in formatted, "Must have two newlines separating answer and citation"
print("✅ ALL CITATION GENERATOR TESTS PASSED")
`,
      hint: "Use f'{answer}\\n\\n[Source: {document_title} | Page {page_number}]'"
    },
    {
      id: 5,
      topic: "Topic 5: The 'Hallucination Shield' (Defensive Fallback)",
      prompt: `A RAG system that never says "I don't know" isn't safe; it just hides hallucinations behind convincing prose.<br><br>
Write a function <code>safe_grounded_answer(context: str, required_keyword: str) -> str</code>:<br>
<ul>
  <li>If <code>required_keyword.lower()</code> is found inside <code>context.lower()</code>: return <code>f"Verified Answer based on context: {context}"</code></li>
  <li>If <code>required_keyword.lower()</code> is NOT found: return <code>"I cannot answer this question because the provided reference documents do not contain relevant information."</code></li>
</ul>`,
      starterCode: `def safe_grounded_answer(context: str, required_keyword: str) -> str:
    # Check if required_keyword is in context (case-insensitive)
    # Return verified answer or honest disclaimer
    pass

# Quick test
ctx = "Acme Corp provides $500 annually for professional development courses."
print(ctx, "development")
print(safe_grounded_answer(ctx, "development"))
print(safe_grounded_answer(ctx, "stock options"))
`,
      solutionCode: `def safe_grounded_answer(context: str, required_keyword: str) -> str:
    if required_keyword.lower() in context.lower():
        return f"Verified Answer based on context: {context}"
    return "I cannot answer this question because the provided reference documents do not contain relevant information."

# Quick test
ctx = "Acme Corp provides $500 annually for professional development courses."
print("Keyword found:")
print(safe_grounded_answer(ctx, "development"))
print("\\nKeyword missing:")
print(safe_grounded_answer(ctx, "stock options"))
`,
      testHarness: `
ctx = "Employees are entitled to 12 weeks of fully paid parental leave."
# Test 1: Keyword present
res_ok = safe_grounded_answer(ctx, "parental leave")
assert res_ok.startswith("Verified Answer based on context:"), "Must return verified answer when keyword is present"
assert ctx in res_ok, "Must include context in verified output"

# Test 2: Keyword missing -> Defensive disclaimer
res_missing = safe_grounded_answer(ctx, "crypto bonus")
expected_fallback = "I cannot answer this question because the provided reference documents do not contain relevant information."
assert res_missing == expected_fallback, "Must return exact defensive refusal when keyword is missing"
print("✅ ALL HALLUCINATION SHIELD TESTS PASSED")
`,
      hint: "Check 'if required_keyword.lower() in context.lower():' and return the verified string or the exact fallback disclaimer."
    }
  ],

  // ── 5 Conceptual Knowledge Checks (Audit-Revised v2.0) ──
  testQuestions: [
    {
      id: 1,
      prompt: "Why does an LLM hallucinate when asked about niche company policies?",
      options: [
        "Its internet connection is slow",
        "It lossy-compresses training data into weights and predicts probable-sounding words rather than querying a database",
        "It runs out of RAM during matrix multiplication",
        "Tokenizers cannot read uppercase letters"
      ],
      answer: 1,
      explanation: "LLMs are next-token predictors using parametric memory; when facts are beyond their compression resolution, they predict convincing but fabricated text."
    },
    {
      id: 2,
      prompt: "What happens in the 'Augmented' step of RAG?",
      options: [
        "The AI's weights are updated via gradient descent",
        "The retrieved passages are inserted directly into the user prompt before it is sent to the LLM",
        "The user's voice audio is transcribed to text",
        "The database tables are dropped and recreated"
      ],
      answer: 1,
      explanation: "'Augmented' means enhancing the prompt by injecting external retrieved reference context right above the user question."
    },
    {
      id: 3,
      prompt: "The user asks about the 2024 policy; the AI confidently answers with the 2021 policy because the search engine returned zero 2024 documents. What failed?",
      options: [
        "Generation Failure",
        "Retrieval Failure",
        "GPU Hardware Failure",
        "Python Syntax Failure"
      ],
      answer: 1,
      explanation: "Because the correct 2024 document was never retrieved and placed into the prompt, the defect is a Retrieval Failure."
    },
    {
      id: 4,
      prompt: "The correct clause about refund eligibility exists in the source PDF, but it was cut in half across two separate chunks, so neither chunk alone contains the full answer. What failed?",
      options: [
        "Retrieval Failure",
        "Generation Failure",
        "Indexing / Chunking Failure",
        "Embedding Failure"
      ],
      answer: 2,
      explanation: "When information is severed across boundaries or truncated mid-sentence during document preparation, it is an Indexing / Chunking Failure."
    },
    {
      id: 5,
      prompt: "A chunk clearly states 'Max refund is $100', but the LLM answers 'up to $500'. What failed?",
      options: [
        "Indexing Failure",
        "Retrieval Failure",
        "Generation Failure",
        "Ingest Failure"
      ],
      answer: 2,
      explanation: "The correct information was successfully retrieved and present in the prompt, but the LLM hallucinated/misread the number, making it a Generation Failure."
    }
  ]
};
