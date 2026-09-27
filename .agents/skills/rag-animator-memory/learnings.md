# 🧠 Animator Agent Learnings Log

> **Source of Truth:** Append-only feedback and correction log for the Animator agent.
> **Protocol:** See [animator-evolution-protocol.md](../rag-theory-animator/animator-evolution-protocol.md).
> **Rule:** Never delete or rewrite past entries. Append new entries with the standard schema.

---

## Initial State (2026-09-11)
Memory system initialized alongside `rag-theory-animator` SOP v1.0. Ready to capture corrections, user preferences, quality gate failures, and novel pattern approvals.

---

## [2026-09-11] ENTRY-001
**Trigger:** gate-failure
**Scope:** pattern:C
**What happened:** In multi-stage conveyor pipelines (Pattern C), stages were completely invisible (opacity 0) until the timeline reached them, obscuring the total lifecycle pipeline from students at start.
**Feedback/fix:** Initialize all pipeline stages in dimmed silhouette (opacity 0.45) and highlight the active stage with full glow, plus bind interactive click inspection when paused.
**Rule going forward:** For Pattern C conveyor/pipeline nodes, never hide upcoming stages entirely; render in dimmed silhouette (opacity ~0.45) with the active stage highlighted, and ensure nodes are clickable for manual inspection.
**Confidence:** first-time

---

## [2026-09-11] ENTRY-002
**Trigger:** user-correction
**Scope:** layout:cinema-architecture
**What happened:** Theory was initially wrapped in a nested `.slide-card` with internal padding, border-radius, and a redundant outer bottom navigation bar alongside a Read Mode toggle. User directed: *"i dont want read mode and also remove bottom navigation bar. also animation should be complete theory portion not inside card"*.
**Feedback/fix:** Completely removed Read Mode and the outer bottom navigation bar. Re-architected `#panelRight` into an edge-to-edge Full-Bleed Theory Cinema stage with slide navigation in the top cinema header and player controls flush at the bottom edge.
**Rule going forward:** Theory panels must NEVER be trapped inside nested card containers or cluttered with duplicate outer playback bars. The theory viewport is an edge-to-edge cinematic canvas with full vertical height, flush embedded controls, and 100% video-like animated choreography synced to instructor narration.
**Confidence:** verified-in-production

---

## [2026-09-11] ENTRY-003
**Trigger:** user-request
**Scope:** player:zero-blank-screen & thumbnail-poster
**What happened:** Before the student clicks play at $t = 0\text{s}$, the canvas was a blank grey box because GSAP elements were initialized at `opacity: 0`.
**Feedback/fix:** Generated a high-fidelity 3D masterclass artwork poster and created an overlay (`#ragThumbnailCover`) with a centered pulsing glowing play button. When the user requested removing clutter, the top badges and footer metadata pills were removed, leaving only the clean artwork and the dead-centered play button. On play or seek $> 0.4\text{s}$, the cover smoothly fades out; on pause at $0\text{s}$, it cleanly restores.
**Rule going forward:** Never show a blank screen on initial page load. Every theory presentation must feature a high-fidelity visual Thumbnail Poster card with a centered, glowing play button that transitions seamlessly into the cold-open animation. Keep the thumbnail clean without extraneous clutter.
**Confidence:** verified-in-production

---

## [2026-09-11] ENTRY-004
**Trigger:** user-correction
**Scope:** choreography:content-overlap & layout-zones
**What happened:** In fast multi-beat scenes (e.g. Beats 7 to 11 in Slide 01), rapid narration caused subsequent headings, problem cards, and document reference panels to stack and visually overlap.
**Feedback/fix:** Implemented strict spatial layout zoning: Left Zone (3 stacked problem cards), Center Zone (isometric illustration), Right Zone (document reference panels), and Top Zone (Kinetic HUD heading). Before introducing new content, prior temporary typography must be transitioned out or cleanly re-anchored. All text cards must use frosted glass backing (`rgba(255, 255, 255, 0.94)`, blur `12px`, border `#e2e8f0`) to guarantee WCAG AAA readability against light backgrounds.
**Rule going forward:** Content must never overlap. In multi-stage narrations, reserve dedicated horizontal zones and enforce deterministic exit/transition lifecycles for prior text blocks before new callouts enter.
**Confidence:** verified-in-production

---

## [2026-09-11] ENTRY-005
**Trigger:** user-request & user-correction
**Scope:** header-ui:slide-dropdown & visual-minimalism
**What happened:** The header bar previously had boxy buttons, a multi-line wrapped slide title, floating equalizer dots, and a static slide counter. User iteratively directed: (1) improve design, (2) remove voice pill and counter badge, (3) introduce an interactive slide dropdown with slide topics and narration durations at the right end.
**Feedback/fix:** Transformed the slide title into an Apple/Linear-grade interactive dropdown menu (`#cinemaTopicDropdownWrap`). The menu lists all slides with two-digit badges (`01`, `02`), slide titles, active checkmark (`✓`), and exact Whisper-derived narration duration pills (`⏱ 1:19`, `⏱ 0:57`, etc.) aligned at the right end. Replaced boxy buttons with a sleek Autoplay pill (pulsing green dot) and a unified segmented `Prev` | `Next` control.
**Rule going forward:** Slide header must be minimalist, elegant, and provide random-access navigation via an interactive dropdown that displays topic titles paired with exact narration durations at the right end. Eliminate visual noise (extraneous text tags, loose equalizer bars, duplicate counters).
**Confidence:** verified-in-production

---

## [2026-09-11] ENTRY-006
**Trigger:** user-feedback
**Scope:** motion:easing-weight & responsiveness
**What happened:** Initial card entrances felt slow and lacked physical punch.
**Feedback/fix:** Switched entry animations to GSAP `back.out(1.4)` with snappy durations ($0.45\text{s} - 0.55\text{s}$) and staggered entrances ($0.15\text{s}$ offsets) synced directly to Whisper timestamp cue points.
**Rule going forward:** Visual card animations must feel weighted, physical, and snappy. Never use sluggish linear or slow eases ($> 0.8\text{s}$). Always use spring/back eases (`back.out(1.4)`) with micro-staggers tied to speech rhythm.
**Confidence:** verified-in-production

---

## [2026-09-11] ENTRY-007
**Trigger:** user-correction
**Scope:** overlay:anchored-point-popovers & cognitive-simplicity
**What happened:** In multi-stage conveyor/pipeline overlays, detailed inspector cards were statically pinned to the viewport corner (`right: 28px`), appearing disconnected from the active pipeline station and cluttered with verbose technical telemetry (latencies, binary dummy file names, monospace blocks). User directed: *"instead of card appearing randomly some where can you make it to appear exactly on its respective points and keep the card simple only with necessary informations"*.
**Feedback/fix:** Redesigned the callout into an anchored floating popover card positioned directly above each respective stage node on the conveyor ribbon with a downward-pointing caret. As narration progresses or when a student clicks any node, the card smoothly glides across the ribbon to sit right above that active point. Stripped all noisy clutter, keeping strictly necessary high-signal items: Icon + Stage Title, 1-line plain English purpose sentence, and a compact conversion flow badge (`Flow: Input ➔ Output`).
**Rule going forward:** Stage callout cards must never float disconnected in arbitrary screen corners. Anchor them directly above their respective visual points with directional pointers, glide smoothly between active nodes, and keep content minimalist, high-signal, and free of extraneous clutter.
**Confidence:** verified-in-production


