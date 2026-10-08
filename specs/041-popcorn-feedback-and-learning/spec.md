# Feature 041: Popcorn hit feedback and learning

Status: draft for human review, 2026-10-08. Producer was consulted before Planner. Planning only; no gameplay source, native assets or historical039/040 approval changed.

Owner reports the current playtest worked well, asks for a pop sound and glowing halo on hits, and learning content at each step. This proposal enriches that working course. Learning goal for ages8–10: one instruction is one action; order matters; PopBridge names three saved instructions; the same invocation repeats those actions at different machines; jumping checks the physical result. This is scripted execution.

## Requirements

- R01: Every accepted teaching/reuse/finale input has one short pop and one hollow glowing pulse at that receiver. Target callback-to-feedback onset target <=0.15s, halo0.5s, sound<=0.2s. Timing is prospective, not measured. Acceptance acknowledgment never implies commit.
- R02: Pulse remains perceptible after the040 machine disappears, then fully clears. No target/component/hit surface remains selectable to support the pulse. Existing250ms instruction beats, platform commit and flourish stay authoritative.
- R03: Wrong-order has existing tiny puff and prefix-specific next instruction. Wrong-position/too-early/consumed/repeated/stale/foreign shots have no accepted pop/halo, progress or false outcome. Useful rejection/recovery text preserves the real state; cosmetic rate limiting never rejects valid gameplay.
- R04: Exact short copy in learning-content.yaml covers entry, LOAD, HEAT, POP, saved recipe, each accepted real landing, every reuse/branch/finale and recovery. A committed saved recipe remains available after machines disappear. No mandatory reading pause, new quiz, target paragraphs or unrelated AI trivia.
- R05: Existing feedback HUD is reused as one persistent three-line card (lesson, recipe/status, next action), safely outside aim/landing view and Academy progress HUD; journal open suppresses it and close resumes the current card. Muted audio remains sufficient. Only meaningful state events advance copy; monitor ticks cannot flood or overwrite it.
- R06: Replay/Return/release/round/departure invalidate owner/attempt/round/effect epochs, stop all041 cosmetic audio/VFX and clear cards. Stale timers cannot restore old copy or end a newer effect. Recovery preserves progress; finished free jumping triggers no recovery lesson.
- R07: Preserve current mirrored seven decks/seven edges/eight receivers,040160cm teaching centre spacing/20cm clearance, both equal five-jump paths, full-used-machine hiding, finish free movement, once-only reward, Core/journal/Agent authority, solo caps and existing Replay/both Returns.
- R08: Before implementation readiness, identify actual supported sound/halo assets, bindings and HUD native settings with live readback. Afterwards build Verse, validate/cook and verify focused real shots/jumps and readability. Owner-reported successful existing playtest is evidence for preservation, not acceptance of unimplemented041.

## Acceptance scenarios

- A01 [R01,R02]: Given an eligible receiver and valid owner/standing state, when a real accepted shot fires, then exactly one pop/0.5s hollow pulse begins promptly at that receiver, the machine follows existing hide timing, and no new platform/finale success is announced until actual commit. Capture LOAD/HEAT/POP, target3/4, either branch and final target separately.
- A02 [R03]: Given prefix0/1/2, when the player shoots an early instruction, then prefix remains, tiny puff appears, and NEXT names LOAD/HEAT/POP respectively. Given a wrong-position, held-repeat, consumed or stale callback, then no accepted effect, new platform or reward appears.
- A03 [R04,R05]: Given muted sound, when the player teaches, lands first, reuses, lands reuse/fork/branch/finish and commits finale, then the exact matching lesson is readable with recipe and current next action; no landing lesson appears on platform creation or grounded walking without an accepted jump.
- A04 [R04,R05]: Given rapid accepted LOAD then HEAT, when actions supersede text before it can be read, then latest state wins without a caption queue; the persistent recipe and journal current-stage recap still explain the learned steps. No interaction is delayed for reading. First-use observation records whether the player can explain that one later shot reruns LOAD/HEAT/POP; completion alone does not pass comprehension.
- A05 [R05,R06]: Given an open journal or active retry override, when real progress changes, then current lesson state updates silently and closing journal/ending override shows current copy without old sound/VFX; repeated report_state ticks do not overwrite, restart or extend cues.
- A06 [R06,R07]: Given an accepted pulse/sequence in flight, when Replay, either Return, round reset, departure or removal occurs, then cosmetics/card stop and no late copy/outcome/reward leaks; Replay restores machines and clears saved recipe while preserving earned badge. Re-entry starts draft recipe, not a saved claim.
- A07 [R04,R06,R07]: Given a missed jump before finish, when recovery succeeds/fails, then honest recovery copy references retained skill/bridges and available Return; after actual finish, ordinary drops/free jumping show no recovery teleport/card. Both branches/owned controls still work and reward stays once per round.
- A08 [R07,R08]: Given implementation completion, when source/transform/binding readback, Verse build, project validation and cooked solo checks run, then unchanged geometry and reward authority match040 and the041 audiovisual/learning requirements have recorded evidence. Stop the game and verify nonrunning state afterwards.

## Excluded scope and assumptions

No geometry redesign, new jumps/rewards/modules, live AI, narration or unrelated island acceptance audit. Native assets/bindings and HUD overlap are unmeasured; open assumptions A02–A04 in map.yaml deliberately block readiness. Historical no-testing040 delivery remains untouched; future041 implementation validation is prospective and needs implementation authorization. No implementation or QA is dispatched by this planning request.
