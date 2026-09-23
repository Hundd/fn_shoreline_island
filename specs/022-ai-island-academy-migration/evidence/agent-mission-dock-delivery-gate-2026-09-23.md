# Agent Mission Dock-to-delivery gate — source evidence

Requirement: AC-033 / T-030. This is source/build evidence, not in-client acceptance.

- `fn_shoreline_island_bot_station.verse` now offers `Run DeliverPackage skill` when the player has reached the scanner, run its destination scan, and selected Dock. The final skill and Verify gates use those same conditions; the two `route_passed` flags remain only for optional Apple/Car classification practice and its board display.
- Selecting Bridge still blocks the route test with the existing safe retry. Changing the transport route or Launch connection clears the delivery-skill flag via `changed`; replay/round reset clears attempt state. The skill does not call the reward path. `confirm_final_route` calls `finish` only after the skill and Dock gate; `finish` preserves the existing one-time badge logic.
- Mission goal, scan result, Run control, program board, help, skill, Verify, and completion text now state the capstone sequence without implying that Apple/Car tests are required. The changed source strings were entered in `label-inventory-2026-09-23.csv`. No editor-owned asset or device reference was changed in this slice; previously saved mission-board defaults remain the stage-zero availability message.
- `ValkyrieToolset.VerseToolset.BuildAll` returned `{"returnValue":[]}` (zero diagnostics) after this source change. UEFN process 31360 was responding. Session status was `Disconnected`, game state `Unconnected`, and no Fortnite client process was present.

## Follow-up: route-aware Run prompt

The Run control now says `Bridge blocked: choose Dock` after scanning while Bridge is selected, instead of offering an optional item test that cannot run on the blocked route. Once Dock is chosen, it says `Optional: test selected item`. AC-027, AC-029, T-024, and T-025 were reconciled with the current Dock → skill → Verify sequence so the old Apple/Car prerequisite is no longer stated as the intended acceptance path. The first BuildAll found one missed `set_run_prompt` call after adding its route argument; that call was corrected and a second BuildAll returned `{"returnValue":[]}`. No editor-owned asset or device binding changed.

The owner asked to skip verification. Project Validate, memory calculation, Launch Session, a fresh full label audit, and solo/multiplayer playtest were not run for this slice. Keep T-030 open until a human can confirm Dock → skill → Verify, blocked Bridge retry, optional tests, replay/edit reset, visible Medical-crate delivery, and one-time badge behavior in-client. Leave UEFN open.
