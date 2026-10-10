# Independent QA — approved west correction

2026-10-10. Codex CLI /root/gameplay_verifier, gpt-6.1-sol. Exclusive editor ownership received after Implementer saved/released with no in-flight calls. Approved digest cd5528af1779f430f9c1d820ac4e9d4462a364994ff43c284f21c4ba935446bd. Fresh plan --ready PASS.

**Result: core reported TV-bank occlusion correction PASS; configuration PASS; relocated all-eight settled cold readability PASS. Full R3 instruction readability and overall R1–R5 gameplay acceptance remain incomplete.**

## Independent configuration

Fresh native qa-repair-readback.json contains 53 feature actors and 16 original gameplay actor poses. Compared offline against current scene-delta.json: zero discrepancies.

- Exactly 53 retained meshes; all transforms and world bounds match within 0.01cm; exact expected Engine Cube, material and collision profile. Two BlockAll and 51 NoCollision.
- hub060_right_pier and hub060_right_plinth absent from feature inventory.
- Same eight billboard and eight light actor paths with exact approved revised full transforms; X translated -1300cm, TV yaw0, other pose fields preserved.
- Lower wall/plinth now solid across X=-2980..-1720; former central footprint cleared. No new actors expected or found in feature label set.
- Prior original options/binding equality and save receipts remain referenced Implementer evidence; this focused run did not freshly reread all options or reload saved packages. Native current configuration verified independently.

## Cooked visual scenarios

| Requirement/setup | Steps and expected | Actual/status/evidence |
|---|---|---|
| R1/R2/R4 relocated bank | Fresh native StartSession PlayFromHere(-2350,1600,2490), yaw90; observe full labels and housings. | PASS limited settled cold visual: all eight WAITING labels readable across qa-repair-bank-front.png and small camera turn qa-repair-bank-left.png. Label4 cleared game-mode HUD in second view. No text cut by bezel observed. Solid cream wall, navy housings/base and teal accent render coherently. |
| R3 reported central occlusion | Fresh fixed view(-1050,1600,2490), yaw90; inspect Scanner title and original central route. | PASS bank correction: full PATTERN SCANNER title and central route visible, bank west of route, no wall/lower-TV cutout across them. qa-repair-central.png. No walking collision pass inferred. |
| R3 distant Pattern from central angle | Observe entire instruction rectangle. | PARTIAL: existing PATTERN SCANNER route sign itself overlaps distant instruction board from this angle. Bank is not the occluder. No unrelated boards moved by QA. |
| R3 practical closer Pattern view | Fresh fixed view(-500,3400,2490), yaw90, beyond route title; inspect instruction board. | PASS limited absence of bank obstruction; full text readability NOT PASS: third symbol line clips at the board's own lower edge in qa-repair-pattern-close.png. First two lines show 0/3 SOLVED / SHOOT THE MISSING SYMBOL. See finding below. |
| R3 Human/Lantern interactions | Check instruction access/readability at existing interaction positions. | NOT RUN in bounded focused repair QA. Native nearby inventory identifies boards at approximate X=-800,Y2700 and X=-1050,Y3450; no cooked interaction view or functional acceptance inferred. |
| R2/R5 real completion/status/light/reward/reset | Complete actual lesson, return, verify status/light/journal and one-time reward. | NOT RUN; prior precision-control/inventory limitations remain in qa-report.md. No progression claim from visual direct starts. |
| Startup timing | Measure loading completion and initial/3/6/10s first-visible text. | NOT ESTABLISHED: client still loading after native Completed/CanStart; settled observations show text but no precise device loading completion. No 3-second bound claim. |
| Shutdown | Stop match/session and verify nonrunning. | PASS: final StopGame Completed, StopSession null normal return, GetGameState Unconnected at11:05:29UTC. UEFN remains open. |

Direct PlayFromHere launches had empty inventory, the known test-start limitation. No normal-spawn inventory defect inferred. No autorun, lesson attempts, cheats, pushes, code/design edits or mission state manipulation occurred in this focused QA. Native session startup/cook succeeded; previous local validation completion is recorded in repair-implementation-summary.md, not presented as a fresh independent Project Validate menu action.

## Residual finding QA060-R3-02

Medium severity, existing Pattern board presentation; responsible role Supervisor to route separately to Implementer/Planner if needed. Reproducible in fixed closer view above: lower symbol row truncated at board's own rectangle edge, with no TV bank or route sign between viewer and board. Native authored options read: text="0/3 SOLVED\nSHOOT THE MISSING SYMBOL\nA●  B▲  A●  B▲  A●  ?", textSize24, showBordertrue. The cooked row's lower glyph portions are cut in qa-repair-pattern-close.png. Cause not diagnosed; no claim that relocation introduced it. Existing route-title overlap from farther angle is a separate sightline observation.

The user's reported new wall obstruction is corrected. Do not equate that scoped pass with every Pattern line readable across approaches, retained Human/Lantern interaction acceptance, movement collision, or broad lesson/reward/reset success.

## Ownership

Final native state Unconnected. Editor open; no editor/native/UI calls in flight; ownership released to Supervisor. Only qa-repair-* evidence written. QA findings do not alter design approval or task boxes.

