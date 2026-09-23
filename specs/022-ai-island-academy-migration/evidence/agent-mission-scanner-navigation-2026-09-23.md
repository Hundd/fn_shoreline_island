# Agent Mission scanner navigation — source/editor evidence

Requirement: AC-032 / T-029. This is implementation evidence, not in-client acceptance.

- Final-stage attempt state now has a per-player command choice (Light/Move), repeat count (1–4), and `scanner_reached` flag. The stage begins with the robot at Home. A correct Move ×2 plan animates two 500 cm steps to the existing parcel-side robot position; the run token stops motion after release or round change. Light or another repeat count gives a specific retry without moving or scanning. The scanner action is offered only after arrival; Launch connection and the Bridge/Dock decision remain later gates. Replay/round reset clears navigation, while editing Launch retains the reached position.
- The first command-slot Button and Repeat Button are reused in the final stage with dynamic prompts. Their original editor defaults remain appropriate for the initial instruction stage. The program/execution boards name navigation status and each Move step. No new device reference, reward field, or Tracker trigger was added.
- Four non-colliding teal scanner markers labeled `SCANNER` were placed through UEFN beside the four final robot positions at X `-3280`, `-6680`, `-10080`, `-13480`, Y `-12300`, Z `2450`. Each was saved as an OFPA actor and read back for label, transform, mesh/material, and disabled mesh/bounding-box collision. A station-1 viewport capture showed the label visible from the player-facing side. The four labels are in `label-inventory-2026-09-23.csv`.
- `ValkyrieToolset.VerseToolset.BuildAll` returned `{"returnValue":[]}` after the navigation source edit (zero diagnostics).
- The retained first two physical puzzles are now labeled as Medical and pattern practice; the final-stage goal names the emergency supplies and Animal Research Station. All four saved mission-board Billboard defaults were updated in UEFN to match the new Verse availability text and read back without mismatches. A second `BuildAll` after these text changes again returned zero diagnostics.

The owner asked to skip verification. No Play-in-Client, project validation, memory calculation, or multiplayer acceptance is claimed. In-client checks still need to confirm robot movement/readability, wrong-plan retry, reset and reconnect behavior, scan gating, the later skill/Verify transition, and one-time reward state. Keep T-029 open until that evidence exists.

## Progressive navigation, scan, and route hints

A later source audit found that the final-stage goal and initial status both
gave away `Move x2`, and the goal also named Dock before the scanner ran.
They now ask the player to reach the visible scanner marker and choose an
open route, without the repeat count or route answer. Help is now scoped to
the current substep: first a reasoning question, then a worked instruction
for navigation, scanner connection, or Bridge/Dock choice. The per-player
hint level resets when navigation reaches the scanner and again when the
destination scan completes. Existing wrong-plan feedback still gives the
specific two-Move correction after an attempt. Verse `BuildAll` returned
zero diagnostics; the label inventory records the changed and added source
messages. No device reference, movement distance, route rule, or reward
guard changed. In-client hint sequencing remains unverified.
The immediate scanner result was then aligned with that decision step: it
still reports Bridge blocked and Dock open, but now asks the player to choose
an open route rather than explicitly instructing Dock. Worked Help and a
wrong Bridge attempt remain specific. Verse built again with zero
diagnostics; the inventory records the revised message.
