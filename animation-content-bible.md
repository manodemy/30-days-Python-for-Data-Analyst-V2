# Manodemy RAG Studio — Animation Content Bible & Pedagogical Standards
**Standard Reference for Motion Design, Telemetry Dramatization & Contrast Compliance**
*Author: Animator Subagent / Motion Engineering Team*
*Scope: Day 01 through Day 30 Theory Presentations*

---

## 1. Dramatized Statistics & Illustrative Telemetry

In technical motion design for AI concepts, precise-looking numbers are powerful pedagogical tools that make abstract probabilistic math concrete. However, to prevent students or future content editors from mistaking dramatized pedagogical visualizations for literal runtime telemetry, all simulated numbers are cataloged and governed below.

### Day 01: Slide 01 — The Anatomy of Hallucination & RAG

| Concept / Widget | Rendered Values | Classification | Real-World Context & Citation |
| :--- | :--- | :--- | :--- |
| **Token Probability Simulator** (Beat 2, `ktTokenCard`) | `"future": 85.4%`<br>`"past": 9.2%`<br>`"world": 5.4%` | **Illustrative Pedagogical Dramatization** | Models output unnormalized logits over vocabulary $V$ converted via softmax to probability distribution $P(w_i \mid w_{<i})$. The $85.4\%$ figure illustrates greedy sampling ($T=0$) choosing the argmax token. *Do not cite as measured output from a specific foundation model.* |
| **Parametric Weight Counter** (Beat 4, `ktWeightCard`) | `175,000,000,000` | **Citable Architecture Baseline** | Represents the classic 175B parameter dense architecture of GPT-3 (*Brown et al., NeurIPS 2020: "Language Models are Few-Shot Learners"*). Used to illustrate frozen matrix weights ($W$) versus live storage. |
| **Hallucination Dual Tachometer** (Beat 7, `ktGaugeCard`) | `CONFIDENCE: 99.8%`<br>`VS`<br>`GROUND TRUTH: 0.0%` | **Illustrative Pedagogical Dramatization** | LLMs do not possess or emit an internal calibrated "ground truth" or "confidence" meter at inference time; output token probabilities do not measure epistemic certainty (*Kadavath et al., 2022: "Language Models (Mostly) Know What They Know"*). This meter dramatizes the core anti-pattern of overconfident fabrication. *Do not cite as real telemetry.* |

### Standard Code Annotation Rule
Whenever any hardcoded percentage, parameter count, or meter reading is added to any slide animation (`day-XX-animations.js` or kinetic overlay script), it **MUST** be preceded by this comment:
```javascript
// ILLUSTRATIVE VALUE — chosen for pedagogical clarity, not measured from
// a real model. Do not cite as a factual claim about LLM telemetry.
// See docs/animation-content-bible.md §1 Dramatized Statistics.
```
Or, if citing a published architectural scale:
```javascript
// CITABLE ARCHITECTURE BASELINE — [Value] matches [Paper/Model citation].
// See docs/animation-content-bible.md §1 Dramatized Statistics.
```

---

## 2. WCAG AA Contrast Compliance & Frosted-Glass HUD Standards

To ensure text legibility across dynamic 3D diorama backgrounds with varying luminance, all HUD typography must meet **WCAG 2.1 AA** standards:
- **Body Text / Subtext:** $\ge 4.5:1$
- **Large Title Text:** $\ge 3.0:1$

### Slide 01 Per-Beat Contrast Matrix

| Beat | Time Range | Background Asset & Luminance | Frosted Card Config | Heading Contrast | Subtext Contrast | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Beat 1** | 0.0s – 10.5s | `slide01_image1_blackbox.jpg`<br>Top region: Pearl Wall ($L \approx 0.88$) | `bg: rgba(255,255,255,0.95)`<br>`blur: 12px`<br>`text-shadow: 0 1px 2px rgba(255,255,255,0.8)` | `#0f172a` $\rightarrow$ **16.9:1** | `#0f172a` $\rightarrow$ **16.2:1** | **PASS AAA** |
| **Beat 2** | 10.5s – 16.5s | `slide01_image2_room_filing_cabinet.jpg`<br>Top region: White Lab ($L \approx 0.95$) | `bg: rgba(255,255,255,0.95)`<br>`blur: 10px`<br>`border: rgba(226,232,240,0.85)` | `#0f172a` $\rightarrow$ **16.9:1** | `#0f172a` $\rightarrow$ **16.2:1** | **PASS AAA** |
| **Beats 3–6** | 16.5s – 59.5s | `slide01_locked_room.jpg`<br>Top region: White Lab ($L \approx 0.95$) | `bg: rgba(255,255,255,0.95)`<br>`blur: 10px`<br>`shadow: 0 4px 16px rgba(15,23,42,0.06)` | `#0f172a` $\rightarrow$ **16.9:1** | `#0f172a` $\rightarrow$ **16.2:1** | **PASS AAA** |
| **Beat 7** | 59.5s – 71.5s | `slide01_locked_room.jpg`<br>Top region: White Lab ($L \approx 0.95$) | `bg: rgba(255,255,255,0.95)`<br>`blur: 12px`<br>`border: rgba(239,68,68,0.4)` | Crimson `#991b1b` $\rightarrow$ **7.6:1** | `#0f172a` $\rightarrow$ **16.2:1** | **PASS AAA** |
| **Beats 8–9** | 71.5s – 97.8s | `slide01_door_opens.jpg`<br>Top region: Golden Sunlight ($L \approx 0.72$) | `bg: rgba(255,255,255,0.96)`<br>`blur: 12px`<br>`border: rgba(254,215,170,0.5)` | Emerald `#065f46` $\rightarrow$ **7.4:1** | `#0f172a` $\rightarrow$ **14.2:1** | **PASS AAA** |

---

## 3. Cumulative Density & Viewer Comprehension Protocol (Fix 4)

### The Cumulative Density Risk
Individually, every beat's pacing is well-calibrated (kinetic events occur every 2–7 seconds). However, over a sustained 97.76-second narrative at ~162 wpm with 9 consecutive beats, there is a risk of cognitive overload for beginners with zero prior RAG exposure.

### Comprehension Evaluation Protocol
1. **Target Cohort:** 3 to 5 participants matching the target audience profile (engineers or data analysts with basic Python skills but minimal or zero RAG/vector-database experience).
2. **Execution:** Show the cut once with audio enabled at normal 1.0x speed. No pausing or coaching during playback.
3. **Assessment Check (Free Recall):**
   Immediately after viewing, ask the participant to explain back in their own words:
   - **Question A:** *"Why do Large Language Models hallucinate?"*
     - *Expected Retention Core:* Because they are next-word predictors with frozen parametric weights from training cutoff, without live database access; when uncertain, they predict high-probability plausible words instead of admitting ignorance.
   - **Question B:** *"What does RAG actually do differently to solve this?"*
     - *Expected Retention Core:* Instead of re-training the model, RAG opens the door and injects fresh, verified reference documents into the prompt at query time ("open-book exam").
4. **Actionable Adjustment Threshold:**
   If comprehension drops specifically around Beats 5–7 (the 3 flaws: Cutoff, Zero Files, Hallucination), do **not** cut visual assets. Instead, insert a 0.5-second audio/visual breathing pause between Flaw 1, Flaw 2, and Flaw 3.

---

## 4. Architectural Invariants (Sacred Preservation List)

The following components represent foundational pedagogical and aesthetic decisions that **MUST NOT** be modified, replaced, or simplified during future refactoring passes:

1. **Live Token Probability Simulator (Beat 2):** Concrete probability distribution (`"future" 85.4%`, `"past" 9.2%`, `"world" 5.4%`). It is our most effective demonstration that an LLM is a predictor, not a database.
2. **Locked-Room Asset Reuse:** The identical asset `slide01_locked_room.jpg` is reused across Beats 3, 5, 6, and 7 to visually enforce spatial continuity and researcher identity. Never introduce inconsistent room styles.
3. **Continuous Forward Camera Push ($1.00 \rightarrow 1.095$):** The camera push now starts seamlessly from Beat 2 ($1.00 \rightarrow 1.025$) through Beat 7 ($1.065 \rightarrow 1.095$) and into the door opening ($1.040 \rightarrow 1.085$). This transforms multiple image beats into a single continuous cinematic shot.
4. **Title/Subtext Narration Mirroring:** The HUD typography reinforces the spoken audio verbatim. Multimedia learning principles confirm dual-channel redundancy aids concept retention.
