# Energy badge and journal follow-up

- Date: 2026-09-12; one player; fresh Launch Session completed.
- Round: `67817868a09f461bb8efb1f9d09cfc7f`.
- Map: `Content/fn_shoreline_island.umap`; station one and academy hub.
- Revision: the four-station actors and journal binding from
  [the placement audit](four-stations-2026-09-12.md). No Verse changes.
  SHA256: fixtures `0075D9A176FCF6314D35FF8268D3F162402AF27942CF2A31293E9550008F5203`,
  progress `3CC7D2EDC01E29825D93A5637519081029E8762ACFB049F6252793C68EF5B41F`,
  station `DB69800C52D5F98443221B6FCC084347FAED24CEC72E91A865FCBFAC25043170`,
  journal `A88B0AEB1DA49C3C2A9F17910D4F27C8A0A8B3C5FC9894FDA40A047B22DA2A23`.

## Expected and observed results

- PASS, FR-001: eleven separate +1 interactions from zero stopped at 10, with
  boundary feedback and health 100: [upper bound](vault-upper-11-001.png).
  Seven separate subtraction interactions restored 3:
  [corrected energy](vault-upper-back-three-002.png). Start opened the door:
  [solved first challenge](vault-j-next1-001.png). Earlier safe failure and
  lower-bound results remain in the [solo matrix](solo-matrix-2026-09-12.md).
- PASS, FR-002/004: challenge two started at 2/target 5. Help first explained
  stored values, then supplied the worked target and Replay behavior:
  [concept hint](vault-j-help2a-002.png), [worked hint](vault-j-help2b-002.png).
  Three +1 interactions displayed [energy 5](vault-j-five-001.png), and Start
  [opened the door](vault-j-open2-007.png).
- PASS, FR-003/004: selecting three Add 2 repeats and running completed the
  third challenge at 6 and awarded the badge with the required recap:
  [first award](vault-j-award-017.png).
- PASS, AC-004 solo: [Replay](vault-j-replay-002.png) restored energy 0,
  one repeat and a closed door. Selecting three repeats and completing again
  [opened the door with retained-badge feedback](vault-j-recomplete-017.png).
  After [Hub return](vault-j-hub-002.png), the journal showed exactly
  [Energy: Earned (1/1)](vault-j-journalearned-002.png).
  [Close](vault-j-journalclose-001.png) removed the panel; reopening retained
  [Earned (1/1)](vault-j-journalreopen-002.png).
- PASS, focused journal integration: Garden, Loop and Signal remained ready;
  Debug, Event and Bot remained unavailable; recommendation remained Path
  Garden. Panel text and Close fit. No claim about unimplemented zones follows.

## Visibility probe and limitations

A temporary native station-one Claim `On Interact` binding targeted its CLAIM
billboard's `SetTextVisible`. However, the labels were already visible
[before Claim](vault-label-probe-before-002.png). The missing-label condition
did not reproduce, so the experiment is **inconclusive**, not a visibility fix.
After this run the diagnostic binding was removed through UEFN, the target
actor saved, and ListEventBindings returned an empty array. No broader display
workaround was applied. The prior fresh-load readability failure remains open.

The top-left HUD showed Loop 0/1 throughout, so the journal's actual numeric
tracker display supplies the Energy count evidence. The journal button still
requires approach from its unlabeled back. Full muted-audio entry-to-return,
lifecycle, multiplayer, project validation and memory checks remain pending.
This focused run does not mark the feature Validated.

Fortnite was closed after the test: process count 0; UEFN GetSessionStatus
returned `Disconnected`.
