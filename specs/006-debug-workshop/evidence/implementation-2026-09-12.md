# First Debug Workshop implementation

- Date: 2026-09-12; one player; map `Content/fn_shoreline_island.umap`.
- Saved 32 actors south of Variable Vault: shared progress/tracker, station,
  seven buttons/labels, three boards, five tile labels, two destination labels,
  feedback, route, marker, floor and connecting path.
- Read back all transforms and configured label/feedback properties, 17 station
  native references, two progress references, station ID 0 and custom progress.
  Marker Cube/teal/Movable; floor/path Cube/sand/Static. See the
  [actor/binding audit](implementation-2026-09-12.json).
- Journal Debug is saved/read back at later_badge_trackers index 2, preserving
  Signal 0 and Energy 1. Debug's runtime journal count remains untested.
- BuildAll returned no diagnostics before placement and before launch.
  StartSession Completed; GetGameState Running.

## Tested revision and results

Fresh round `1be97c8a243a4727a276d39430cb05ca`, one player. SHA256:

- Fixtures: `A157EC346FB26A8B0A39DD78BD81BC69966E06D28A14E8300BCCC1CEC9CFE2CB`.
- Progress: `F1A48A90113E23E680F507E6D544C6329D44186AF48ECA37C8E8DDC823AC340F`.
- Station: `DB1BB9529C9B3D465CE01898630A714DC210F117B427781FD708D1F635836E06`.

Expected/actual observations:

- PASS: signs appeared before Claim, which activated the supplied program:
  [initial load](debug-initial-002.png), [claimed](debug-runpos-001.png).
  One load does not resolve the island's intermittent billboard issue.
- PASS: supplied East, West, East showed [West at step 2](debug-move-wrong-007.png)
  and finished at [tile 1 versus expected 3](debug-state-002.png), marker aligned
  with its tile and safe retry feedback shown.
- PASS: editing to Wait reset the marker/result to [tile 0](debug-wait-ready-001.png),
  then safely failed at [tile 2](debug-wait-wrong-011.png).
- PASS: editing only instruction 2 to East [completed at tile 3](debug-east-pass-011.png).
- PASS: challenge-two supplied Repeat 2 [failed at tile 2](debug-repeat-wrong-009.png);
  editing only its count to 3 [completed at tile 3](debug-repeat-pass-011.png).
- PASS: the reversed rule delivered LEAF to Storage and PLAIN to Garden, then
  [failed comparison](debug-rule-wrong-015.png). Its repair delivered LEAF to
  Garden and PLAIN to Storage, then [awarded Debug Badge](debug-rule-pass-015.png)
  with the recap explaining debugging as finding and fixing mistakes.
- Health stayed 100 throughout these wrong/correct runs. Edits required Run.

## Findings and final changes

FAIL, readability: the minimap obscured the program board at
[Edit](debug-editpos-001.png); longer cargo text clipped. Moving marker could
partly obscure destination labels. Full presentation acceptance remains open.

After closing Fortnite, moved the program board inward, lowered both high
boards, reduced program/results text size to 10, compacted cargo results into
explicitly ordered LEAF/PLAIN columns, and raised destination labels.
[Saved/read-back corrected transforms](layout-2026-09-12.json) supersede their
initial audit values. These presentation changes need a new runtime test.

Code review found solved-station reclaim reset the actual result while retaining
a solved message. Final source reconstructs tile 3 or Garden/Storage results
and final marker pose on reclaim. Removed unused repeat_count from progress.
Reclaim/replay behavior needs runtime verification on this final source.

Final BuildAll returned no diagnostics. Final SHA256:

- Fixtures unchanged.
- Progress: `F5937D44F94F95D2772F87F950AC3B90F666FFA3B2551BA6DB9A43F2CD2C88C6`.
- Station: `0990261D7AC0EE68513FC283694DA392B3A53E64E11F179521CA950E90AFECE8`.

Fortnite closed after testing: process count 0; UEFN Disconnected verified.
Remaining: final presentation/reclaim retest, repeat counts 1/4, all hints,
rapid input/cancellation, Replay/exact badge, journal, Hub/walking routes,
three more stations, lifecycle/multiplayer, project validation and memory.
The feature is not Validated; no complete acceptance task is checked yet.
