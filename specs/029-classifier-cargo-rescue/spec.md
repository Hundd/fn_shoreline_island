# Classifier Cargo Rescue

Status: proposed design, revision 1; no scene or Verse changes authorized by this bundle yet.

Replace the four independent classifier stations on signal_0_floor through signal_3_floor with one cooperative, 4–6 minute cargo-rescue game. Players use the existing infinite-ammunition Pulse Rifle/Data Blaster to operate a playful coastal sorting factory. Moving objects, lifting gates and a final cargo dispatch make each decision visible. This is a scripted teaching simulation, not an actual trained machine-learning model.

## Requirements

- FR-01: Keep the four contiguous support floors and shared campus access. Replace old station controllers, redundant button banks, boards, boats, docks and lighthouse dressing inside this footprint after a saved checkpoint and dependency audit. Preserve signal_progress, signal_badge_tracker, hub destination, journal, field-note cargo interaction and shared promenade.
- FR-02: Use exactly the existing global Data Blaster grant/invulnerability setup. No new weapon, armor item, currency, enemy combat or mandatory jumps. “Armor” is interpreted as the already-used weapon/loadout.
- FR-03: One run and one visible progress strip: LABEL → CHECK → TEST → SHIP. Tile 0 teaches examples; tile 1 corrects a prediction; tile 2 tests unseen examples; tile 3 physically ships the rescued cargo. No four independent games or claim stations.
- FR-04: Labels are FOOD, FURNITURE and VEHICLE, using words plus distinct pictograms. Replace Animal with Furniture to prioritize recognizable native Fortnite props. Label burger, chair and car by shooting their category gates, one item at a time. Each accepted shot moves the cargo into its bay. Category colors do not encode an object's answer.
- FR-05: Inspect three displayed predictions: burger→Food, chair→Vehicle (WRONG, displayed confidence 95%), car→Vehicle. Shoot the incorrect prediction card, then shoot Furniture to repair it. A repeat pass visibly routes the chair correctly. Teach: high confidence can still be wrong; compare a prediction with the correct label.
- FR-06: Test on banana→Food, sofa→Furniture and tractor→Vehicle, in that order. Show each new object before activating three category gates. Do not show its correct category first. Teach: new examples test whether the rule works beyond the examples already seen. Credit a final shot at SHIP only after all three pass.
- FR-07: Required moving parts: cargo arrival/branch delivery, lifting category shutters, a repair lift and final dispatch pallet/shutter. No time limit or loss of lives. Moving cargo waits at the scanner for a decision. Help offers a hint, then a worked explanation; Watch Again repeats only the current demonstration. Pause Motion affects presentation, not answer correctness.
- FR-08: One shared run supports solo and 2–4 players. Start opens five seconds of enrollment in the entry area. Only enrolled players can change the run. Later arrivals spectate and join on replay. Accept at most one correct shot per phase, ignore inactive targets and spectator shots, and prevent held fire carrying through a transition. An empty team cancels the run. Each learning section updates the existing classifier progress identity once for eligible participants; replay preserves earned badges.
- FR-09: Clear 3 m aisle at local Y=8, aim distances 6–12 m, target faces at least 1.5 m square with aligned damage surfaces. No mandatory aim at moving hitboxes: shoot stable gate/card targets while the machinery moves. Instructions fit one short HUD card and a nearby sign. Keep Return available at every section; no return walk required.
- FR-10: At least 75% of visible non-device prop instances are eligible Fortnite assets. Use real furniture, miniature vehicle displays, conveyor housings, steel shelving, practical lamps, low rails, crates and coastal planters. Cyan machine accents, warm lighting, neutral targets, clear silhouettes; no obstructive particle clouds. New meshes retain recognizable proportions. No new imported artwork is required.
- FR-11: Reset cancels all motion and delayed callbacks before restoring homes, parks inactive hit surfaces and clears run state. Respawn removes that participant from the current run without losing an earned badge. Round reset follows existing signal_progress behavior. Build, validate, cook and playtest before gameplay acceptance.

## Acceptance scenarios

| ID | Given / When / Then |
|---|---|
| AC-01 FR-01,02 | Given a normal hub spawn, when entering tile 0, then exactly one existing blaster is usable, field-note and campus access remain usable, and no legacy station can claim or respond. |
| AC-02 FR-03,04,07 | Given LABEL, when shooting Food/Furniture/Vehicle for burger/chair/car respectively, then each correct gate lifts and delivers that object; a wrong shot explains the category and leaves the same item retryable. |
| AC-03 FR-05 | Given the three predictions, when shooting the chair→Vehicle card then Furniture, then the chair lifts, reroutes and visibly passes a repeat test; the HUD explains why 95% confidence did not establish correctness. |
| AC-04 FR-06 | Given TEST, when sorting banana, sofa and tractor, then only their correct categories advance and the lesson mentions new examples; SHIP remains inactive until all pass. |
| AC-05 FR-06,08 | Given completion, when an enrolled player shoots SHIP, then cargo travels through the final raised shutter and each eligible participant receives at most one Classifier Badge, visible to the existing journal. |
| AC-06 FR-07,09 | Given repeated wrong choices or Pause Motion, when using Help/Watch Again/Return, then no failure timer, forced jump, obstruction or inaccessible control prevents finishing or leaving. |
| AC-07 FR-08 | Given 2 and then 4 enrolled players plus a late spectator, when players shoot simultaneously or hold fire across stages, then exactly one transition occurs and spectator shots award nothing. |
| AC-08 FR-08,11 | Given motion or feedback in progress, when replaying, leaving, respawning or resetting the round, then no stale callback moves restored cargo or grants progress; replay retains badges and round reset clears progress as specified. |
| AC-09 FR-09,10 | Given normal approach and firing positions, when checking screenshots and walking the aisle, then labels are legible without color, all targets are hittable, motion stays behind rails, native-prop share is ≥75%, and all four tiles read as one factory. |
| AC-10 FR-11 | Given the completed implementation, when building Verse, validating, cooking and executing AC-01..09, then failures are resolved and evidence is recorded; end the game and verify it stopped while leaving UEFN open. |

Proposed duration and visual quality are design targets, not measured playtest results. The exact food/vehicle prop variant can be replaced with an eligible equivalent of the same category, teaching role and size envelope; update the item names and fixture table together. A category, answer, route or mechanical change requires renewed review.
