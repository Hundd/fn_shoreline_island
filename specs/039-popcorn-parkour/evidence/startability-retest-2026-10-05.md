# Independent affected-case QA — 2026-10-05

QA: original gpt-6.1-sol Gameplay Verifier. Scope: Oct5 wrong-end start guidance and existing grounded LOAD regression only. No design/source fixes, synthetic hits, teleports, or full-course acceptance. Approved digest remains `809dcd27d05f7e0711635d560f2615ab543ffb18195ea0e5008e386395d8087a`; 183 permanent course actors and maintenance cleanup preserved.

Current controller SHA256: `1D5F9E309F33DD4B26503A0B3EF6B811B76520FB99E2A4A1F59A989610AD6AD0`. Production: `0BDF5580355D84FF7E8A032F9CBBEA41598D416C8B65372A3E914A77830B6BDC`. Generator: `33734AAFB178B5A7AB120601D8C8C5354C627DEEC67D6DFE9ECDFBBCCAE67CB9`. Implementation validation/cook record is `startability-implementation-2026-10-05.md`; its explicit validation success is reference evidence, not a new QA invocation.

## Actual results

- PASS: normal Running hub → promenade → real jump onto raised corridor → finish first, still unowned/Core0/prefix0. No viewport spawn or setup teleport. Temporary existing read-only observer tag `039-startability-retest` was enabled with one supported cook.
- PASS SQA02: actual FINISH label and separate `START AT LOAD <-` / `Follow the ramp.` board are readable without the previous overlap. Left points toward the existing west starter. See `startability-retest-finish-clear.jpg`.
- PASS mechanism / FAIL readability SQA01: a real rifle hit at the final receiver displayed the new rejection message. This uniquely proves delivery to the repaired rejection handler, which returns before its normal SHOT diagnostic. Actual Core0/prefix0/checkpoint0 remained unchanged. See `startability-retest-hud-tiny.jpg`: feedback text near the center renders at roughly 3 pixels high in the 1280×720 capture and cannot be comfortably read during its 3-second display.
- PASS existing start: walked back through the real corridor and grounded up the ramp to starter. At 03:24:47.754 UTC, actual rifle `SHOT target=0 result=1 prefix=1 checkpoint=0 token=2`; immediately surrounding probes show `x=-4857.214245 y=-17269.371501 z=2597.148898 ground=1 present=0`. Actual NEXT: HEAT and Step1/3 appeared, Core stayed0. See `startability-retest-load-success.jpg` and raw `startability-retest-2026-10-05.log`.

## Actionable remaining defect SQA03 — medium

The new wrong-end HUD instruction is delivered but too small to serve the first-use redirect. Reproducer: unowned/Core0 player approaches finish, shoots the final receiver, and observes the transient message. Expected: readable short instruction at normal play resolution. Actual: tiny text despite native size18. Responsible layer: Implementer, HUD presentation only; retain strict starter ownership guards and current geometry.

Authoritative HUD actor: `/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.Device_HUDMessage_V2_C_UAID_E89C2592D1B5160103_1360785784`. Exact ObjectTools property paths/readback: `override Default Text Style=true`; `size=18`; `text Style=Default`; `verseTextStyle=""`; `verseTextStyle_Override=false`; `textStyleSet=null`; `textStyleSet_Override=false`; `placement=Bottom Center`; `screenAnchor=Top Left`; `displayTime=5`; white textColor. Verse overrides display duration to3 seconds. Fresh native schema describes `size` as integer minimum4/maximum256, applied when no specific styling; `verseTextStyle` applies to all Verse-originated messages. Raw readback and full schema are preserved in `startability-retest-hud-native.json`. These values establish configuration, not the root cause of the unexpected rendered scale. Inspect the actual HUD styling/render path before choosing the bounded presentation repair.

No new physical Replay, complete routes, multiplayer, native failure injection, or human first-use test was run in this affected-case retest. Prior independent route/integration evidence remains separate.

## Shutdown and handoff

Actual StopGame Completed; fresh CanStart. Restored production `debug_tag` to its original empty string and read it back empty. Targeted level save returned true, is_dirty=false, final fresh CanStart. UEFN left open; no pending calls. Explicit live ownership release sent to Supervisor before offline report completion. No further live QA calls after release.
