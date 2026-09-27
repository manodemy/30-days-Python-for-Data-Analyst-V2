---
name: animator-evolution-protocol
description: Companion module to rag-theory-animator. Gives the Animator agent a real, persistent memory of feedback and corrections across sessions, so it actually improves over time instead of just claiming to. Trigger this whenever the Animator skill is invoked — read the learnings file before storyboarding, and write to it after receiving feedback or failing a quality gate.
---

# 🧬 Animator Evolution Protocol (v1.0)

### Purpose

`ANIM-005` in the main Animator SOP states the agent "must evolve with each
conversation." On its own, that sentence does nothing — an LLM has no memory
between sessions unless something explicit stores and re-loads state. This
module is that mechanism.

**This file replaces `ANIM-005` in the Active Rule Registry.** See Section 6.

---

## 1. Architecture

```
.agents/skills/
├── rag-theory-animator/              # the main SOP (read-only, unchanged)
│   └── SKILL.md
│
└── rag-animator-memory/              # ★ NEW — writable, persists across sessions
    ├── learnings.md                  # append-only feedback log (source of truth)
    ├── learnings-digest.md           # ★ AUTO-GENERATED condensed ruleset (see §5)
    └── changelog.md                  # dated record of what changed and why
```

**Critical placement requirement:** `rag-animator-memory/` lives inside the
`.agents/skills/` directory of the git-tracked workspace, so it survives
between conversations and is version-controlled alongside the project.

---

## 2. The Core Loop

```
┌─────────────┐     ┌──────────────┐     ┌───────────────┐     ┌──────────────┐
│  SESSION     │     │  APPLY       │     │  PRODUCE       │     │  CAPTURE      │
│  STARTS      │ ──▶ │  LEARNINGS   │ ──▶ │  ANIMATION     │ ──▶ │  FEEDBACK     │
│              │     │  (read)      │     │  OUTPUT        │     │  (write)      │
└─────────────┘     └──────────────┘     └───────────────┘     └──────────────┘
                                                                        │
                                                                        ▼
                                                              ┌──────────────────┐
                                                              │  DIGEST REFRESH   │
                                                              │  (periodic)       │
                                                              └──────────────────┘
```

This is a **read-apply-write** loop, not a vague "get better over time"
instruction. Every step below is a concrete action with a trigger condition.

---

## 3. READ Protocol — runs at the start of every Animator invocation

Insert this as the new **Phase 0** before Phase 1 (Content Analysis) in the
main SOP's workflow (Section 9):

```
Phase 0: Load Prior Learnings
1. Check for rag-animator-memory/learnings-digest.md
   - If it exists: read it in full before storyboarding anything.
   - If it doesn't exist yet: check for learnings.md and read the last
     20 entries directly. If neither exists, proceed with no prior
     learnings (this is expected on the very first run).
2. Treat every rule in the digest as a HARD CONSTRAINT for this session,
   not a suggestion — it exists because a past output was corrected.
3. If a digest rule conflicts with something in the main SOP (e.g. SOP
   says "power3.out default," digest says "user always asks to swap
   power3.out for expo.out on headings"), the digest wins — it's more
   recent, specific feedback overrides the general default.
```

---

## 4. WRITE Protocol — when to append a learnings entry

Write a new entry to `learnings.md` when **any** of these fire. Do not wait
until end-of-session to batch them — write immediately, so nothing is lost
if the conversation ends abruptly.

| Trigger | Example |
|:---|:---|
| **Explicit correction** | User says "that typewriter is too slow" / "stop using elastic.out on headings" / "the callout pattern should dim the background more" |
| **Repeated correction** | Same type of fix requested twice across sessions → escalate to a hard rule, not a preference note |
| **Quality gate failure** | A GATE-ANIM check failed and required a fix — log what failed and the fix, so future output avoids it by default |
| **User-stated new preference** | "From now on, always use X" — log this even if unprompted by an error |
| **Explicit approval of a novel pattern** | User loves a one-off choice enough to say "do that again" — this is positive-signal learning, not just error correction |

**Do NOT log:** one-off content facts specific to a single day's curriculum
(e.g. "Day 3 is about vector embeddings") — that belongs in the slide content
files, not the style/behavior memory.

---

## 5. Entry Schema

Append to `learnings.md` using this exact format — consistent structure is
what makes the digest step (below) reliable:

```markdown
## [YYYY-MM-DD] ENTRY-{next_number}
**Trigger:** correction | repeated-correction | gate-failure | preference | approval
**Scope:** global | pattern:{A-F} | element-type:{type} | easing | audio-sync | visual
**What happened:** One sentence — what the agent did.
**Feedback/fix:** One sentence — what the user wanted instead, or what fixed the gate failure.
**Rule going forward:** Imperative, one sentence. This is the line that gets
promoted into the digest verbatim.
**Confidence:** first-time | confirmed (2+ occurrences) | user-declared-permanent
```

Example:

```markdown
## [2026-09-11] ENTRY-014
**Trigger:** correction
**Scope:** pattern:B
**What happened:** Side-by-side comparison cards used back.out(1.7) with a 0.6s duration, causing visible overshoot/wobble on the RAG vs. fine-tuning slide.
**Feedback/fix:** User asked for a snappier, less bouncy card entrance.
**Rule going forward:** For Pattern B card entrances, use back.out(1.2) at 0.4s instead of the SOP default back.out(1.7)/0.6s.
**Confidence:** first-time
```

### Digest generation (periodic, not every entry)

When `learnings.md` exceeds ~25 entries, or at the start of a session if it's
grown since the digest was last built, regenerate `learnings-digest.md`:

1. Group entries by `Scope`.
2. Within each scope, entries marked `confirmed` or `user-declared-permanent`
   become hard rules. `first-time` entries become "watch for this" notes,
   not binding rules yet — one correction isn't necessarily a pattern.
3. If two entries in the same scope conflict, the more recent one wins;
   note the supersession in `changelog.md` (don't silently drop the old one
   from `learnings.md` — it's a log, not a mutable ruleset).
4. Keep the digest under ~150 lines. If it's growing past that, the scope
   categories need splitting into separate digest files
   (`digest-patterns.md`, `digest-easing.md`, etc.) — apply the same
   progressive-disclosure principle the main SOP uses for its own length.

This keeps the *live-loaded* context small (digest only) while
`learnings.md` remains the complete, append-only audit trail.

---

## 6. Replacement for ANIM-005

In the main SOP's Active Rule Registry (Section 11), replace the original
ANIM-005 with:

```
[ANIM-005] [STATUS: active] [SCOPE: Animator]
Statement: The Animator agent evolves via the read-apply-write loop defined
in animator-evolution-protocol.md. It MUST read rag-animator-memory/
learnings-digest.md before storyboarding (Phase 0), and MUST append an
entry to learnings.md immediately whenever it receives a correction, has a
preference stated to it, or fails a quality gate — not deferred to end of
session. The Animator NEVER edits SKILL.md or the main SOP file directly;
all learning is externalized to rag-animator-memory/.
Added: Inception, revised 2026-09-11 — replaces vague self-improvement
goal with concrete file-based mechanism.
Supersedes: previous ANIM-005 (aspirational, non-functional)
```

---

## 7. Fallback: No persistent filesystem available

If you're in an environment without durable file storage between sessions
(e.g. plain claude.ai chat with no project workspace), do this instead:

1. Turn on Claude's memory feature in Settings, if available in your
   environment.
2. At the end of each session, explicitly ask: "Summarize what you learned
   this session as 2-3 imperative rules" — this gives memory something
   concrete and compressed to retain, rather than the whole raw transcript.
3. If memory isn't available at all, the honest answer is: cross-session
   evolution isn't possible yet. You can still get *within-session*
   consistency (Section 3's read step applies to earlier turns in the same
   conversation), but nothing survives to the next chat. In that case,
   keep `learnings.md` as a file you manually paste back in at the start
   of each new session — manual, but functional.

---

## 8. Safeguards

```
[EVOL-SAFE-1] The agent never overwrites or edits the main rag-theory-animator
SKILL.md. All state changes go to rag-animator-memory/ only.

[EVOL-SAFE-2] learnings.md is append-only. Never delete or rewrite past
entries — supersede them via newer entries and note it in changelog.md.

[EVOL-SAFE-3] If a digest rule would contradict a hard-coded Quality Gate
(Section 10 of the main SOP — e.g. contrast ratios, ±100ms sync tolerance),
the Quality Gate wins. Learnings can refine style defaults, not override
correctness/accessibility requirements.

[EVOL-SAFE-4] Every digest regeneration gets a changelog.md entry stating
what changed and which learnings.md entries drove it, so the evolution
is auditable, not a black box.
```

---

## 9. Deliverables Checklist Addition

Add to the main SOP's Section 13 checklist:

- [ ] Checked `rag-animator-memory/learnings-digest.md` before storyboarding
- [ ] Logged any corrections/preferences/gate-failures to `learnings.md` immediately
- [ ] Regenerated digest if `learnings.md` passed the ~25-entry threshold
- [ ] Confirmed no edits were made to the main SKILL.md file
