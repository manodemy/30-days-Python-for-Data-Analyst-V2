# ⚡ Animator Agent Learnings Digest

> **Auto-Generated Condensed Ruleset.** Loaded in Phase 0 of every Animator session.
> **Last Generated:** 2026-09-11
> **Total Active Rules:** 0 (initial baseline)

---

## Active Hard Rules (Confirmed / User-Declared)
1. **[Layout / Architecture]**: Theory presentations must NEVER be trapped inside nested card containers or cluttered with duplicate outer playback bars. The theory viewport is an edge-to-edge cinematic canvas with full vertical height, flush embedded controls, and 100% video-like animated choreography synced to instructor narration. *(from ENTRY-002)*
2. **[Player / Zero Blank Screen]**: Never show a blank screen on initial page load ($t = 0\text{s}$). Every theory presentation must feature a high-fidelity visual Thumbnail Poster card with a centered, glowing play button that transitions seamlessly into the cold-open animation. Keep the thumbnail clean without extraneous clutter. *(from ENTRY-003)*
3. **[Choreography / Content Overlap Shield]**: Content must never overlap. In multi-stage narrations, enforce strict spatial layout zoning (e.g. Left problem stack, Center visual, Right reference panels) and ensure prior text callouts exit or transition before new text arrives. Use frosted glass backing (`rgba(255, 255, 255, 0.94)`, blur `12px`, border `#e2e8f0`) to guarantee WCAG AAA contrast. *(from ENTRY-004)*
4. **[Header UI / Slide Dropdown & Minimalism]**: Cinema header bar must be sleek and uncluttered. Provide random-access slide navigation via an interactive dropdown displaying topic titles paired with exact narration duration badges (`⏱ m:ss`) aligned at the right end. Eliminate visual noise (extraneous text tags, loose equalizer bars, duplicate counters). *(from ENTRY-005)*
5. **[Motion / Snappy Physics]**: Card entry animations must feel weighted, physical, and snappy ($0.45\text{s} - 0.55\text{s}$). Always use spring/back eases (`back.out(1.4)`) with micro-staggers ($0.15\text{s}$) tied directly to Whisper speech inflection points. Avoid sluggish linear fades. *(from ENTRY-006)*

---

## Watch-List (First-time observations)
- **[Pattern C / Pipelines]**: Render conveyor stages in dimmed silhouette (opacity ~0.45) rather than hidden; highlight active stage with glow; ensure stages are clickable for inspection. *(from ENTRY-001)*
