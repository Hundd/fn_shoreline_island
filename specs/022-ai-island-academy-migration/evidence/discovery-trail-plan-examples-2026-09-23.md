# Optional Discovery Trail examples — source/editor evidence

Requirement: AC-034 / T-031. This is implementation evidence, not in-client acceptance.

- The Pattern field note now displays `1 > 2 > 1 > 2 > 1 > ?`; `2` is the first/correct answer and `1` the retry answer. The explanation says why `2` follows the repeating pair and that patterns can help predictions.
- The Classification field note now asks where a Banana belongs among Food, Animal, and Machine. A third answer button is added only to this player-local panel. Food is correct; Animal and Machine give the retry response, and the explanation identifies Banana as a fruit. The larger question panel leaves room for all three choices and Close. The pre-existing Check Pix → Human Decision note flow and all reward/progress logic are untouched.
- Live UEFN readback found `field_note_lantern_board` and `field_note_cargo_board` with the former shorter/Apple examples. Only their `text` properties were changed to match the new Verse sign strings. `SceneTools.save_actor` was called for each, and each text was read back exactly after save. The updated actor/source text is recorded in `label-inventory-2026-09-23.csv`.
- `ValkyrieToolset.VerseToolset.BuildAll` returned `{"returnValue":[]}` after the source change. The editor session was `Disconnected` and game state `Unconnected` before actor edits.

The owner asked to skip verification. Project Validate, memory calculation, Launch Session, full label audit, and a solo/two-player playtest were not run. In-client checks should confirm the three category buttons and Close fit on screen, Pattern/Classification feedback is readable, wrong choices retry safely, and no optional action changes main-route progress. Leave UEFN open.
