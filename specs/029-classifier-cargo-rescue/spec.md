# Classifier: Sort and Check

Revision 2, 2026-09-29. Documentation/design proposal only; not approved or implemented. Replaces the cooperative cargo-rescue draft in `history/revision-1/`. Applies 028's successful simplification and the user's single-player direction. Folder and Classifier Badge identities remain stable.

## Player experience and learning

Walk into one bay. See one named object and **SHOOT ITS CATEGORY**. Shoot FOOD, FURNITURE or VEHICLE. Its correct label appears immediately with a short reason; the next object appears in the same place. No transport wait or walking between items. Three short sections earn the existing badge automatically.

| Section | Decisions | Learning |
|---|---|---|
| Label examples | Burger, chair, car: Food, Furniture, Vehicle. | Classification assigns categories using what an item is or does. |
| Check a prediction | Chair with `PIX PREDICTS: VEHICLE`; shoot Furniture. | Check a prediction against the item; AI labels can be wrong. |
| Try new examples | Banana, sofa, tractor: Food, Furniture, Vehicle. | Different examples test whether the category rule still fits. |

Seven correct shots, always using the same three targets. No separate error-card selection, repair mode, Run or Ship. First-run target: 60-120 seconds; first shot within 10 seconds. These are usability targets, not timers or measured results. This authored exercise does not train a real model, and three new examples do not prove universal accuracy.

## Requirements

- S-01 **Compact solo bay.** Gameplay stays on the first classifier tile, local X=84..112, Y=0..33 m. Arrival to firing point is 9 m, with a 3 m clear route. No walking between items. Preserve all support floors, field-note access and shared promenade. No island matchmaking change.
- S-02 **One action.** Three stationary 1.5 m answer faces, 3 m apart and 6 m ahead: A FOOD, B FURNITURE, C VEHICLE. Words and distinct familiar icons identify categories; color does not reveal an answer. Show one recognizable object beside the targets and its name on the board. Objects have no rings/hit surfaces. Reuse the existing Pulse Rifle and grant/respawn path.
- S-03 **Exact lesson.** Success IDs [0,1,2,1,0,1,2] match the table. The chair prediction uses a neutral frame until corrected. New examples differ from the initial three and never show their answer before selection. Show section progress 0/3..3/3 plus the current section's item count.
- S-04 **Feedback.** Correct label/reason appears within 0.25 seconds and stays at least 1 second. Next item arms after a minimum 1.5-second transition and a 0.5-second quiet-hit interval. Held fire cannot answer later items. Wrong shots preserve item/progress; first mistake gives a category rule, second names the answer and why. Automatic hints persist until another answer/reset while the current question stays visible. No penalties, lives or forced restart.
- S-05 **Auto-ready lifecycle.** Sole local player is ready within 0.5 seconds of entry. No Claim, Start, Join, enrollment, team reward or spectator flow. Only current player's in-bay attributed shots advance. Departure, death/respawn, disconnect and round reset cancel callbacks and reset the physical run. Reentry starts the full lesson.
- S-06 **Finish.** Exactly two ordinary buttons: Replay after completion and Return any time. Three lights/numeric progress confirm sections. Commit through the retained signal_progress/tracker only after all seven decisions. Replay preserves earned badge; round reset uses the existing manager. Preserve journal/finale. Hold recap: `Label examples. Check predictions. Try new examples.`
- S-07 **Useful objects only.** Six example props with only the current one shown; one simple display support if needed. At most two practical lamps and one useful shelter; rails only for edge safety. Retire obsolete station presentation after dependency checks. No conveyors, shutters, repair lift, dispatch pallet, cargo travel, decorative crate stacks/planters or prop-percentage quota.
- S-08 **Clarity.** One forward view contains object, prompt and choices; the middle target must not obscure the object. Category icons must render in the cooked font or use qualified artwork. Match hit surfaces to visible faces. No moving aim, mandatory jumping, text-only item identification, audio dependence or modal quiz. Retained unused tiles are safe shared space without false objectives.
- S-09 **Real acceptance.** Build, validate, cook and playtest normal solo approach, every answer, hints, held fire, reset, replay, Return and badge/journal. Record learning/enjoyment separately from technical checks. Stop and verify the game is not running; leave UEFN open.

## Given / When / Then acceptance

| ID | Requirements | Scenario |
|---|---|---|
| AC-01 | S-01/02/05/08 | Given hub arrival, when entering, then rifle/first item are ready without a button, all choices and object are legible from the firing point and field-note/shared access remains usable. |
| AC-02 | S-02/03/04 | Given the seven items, when shooting A,B,C,B,A,B,C, then each label/reason updates promptly, only one item advances per accepted shot and all decisions work from one spot. |
| AC-03 | S-03/04 | Given the chair's Vehicle prediction, when shooting Vehicle then Furniture, then the first shot cannot advance, item-based guidance helps correction, and the result explains the prediction was wrong. New-example answers remain hidden before selection. |
| AC-04 | S-04/08 | Given muted audio, when choosing wrongly twice or holding fire across a correct answer, then hints remain readable, no progress is lost, later items receive no accidental credit and all face-edge shots register. |
| AC-05 | S-05/06 | Given partial/completed play, when leaving during feedback, dying/respawning, disconnecting, replaying or resetting the round, then no stale callback acts, the physical run resets and badge guards hold. |
| AC-06 | S-06 | Given the last correct choice, when checking journal/finale and replaying, then one Classifier Badge is recognized; Return works before/after completion with no Ship/claim step. |
| AC-07 | S-01/07/08 | Given saved content, when reconciling actors and viewing arrival/firing positions, then three answer assemblies, two buttons and one main board serve the activity, obsolete machinery is absent and structural/shared dependencies are intact. |
| AC-08 | S-03/08/09 | Given a first-time solo tester without coaching, when playing, then record first-shot/run times, confusion/enjoyment and whether they can explain a category, correct the prediction and name a different example. Revise observed friction. Additional testers help but are not a hidden three-person release gate. |
| AC-09 | S-09 | Given final content, when build, validation, cook and these scenarios finish, then record actual results/unverified checks and confirm shutdown. |

## Scope

Fixed examples favor a clear first lesson; randomized queues, scoring and cooperation are outside revision 2. Eligible prop equivalents must preserve category, recognizable shape, new-example distinction and size; update item names/fixtures/reasons together. Changes to lesson, mechanic or layout require renewed review.
