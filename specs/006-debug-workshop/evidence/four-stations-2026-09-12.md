# Four Debug stations — 2026-09-12

Result: implemented four stations; focused solo access/progression passes.
The feature is not Validated. Multiplayer and final project checks remain open.

## Saved implementation

Added stations 2, 3, 4 at X=-6000, -8800, -11600 using the current saved first
station layout. Each has 28 actors: controller, seven controls, feedback,
three boards, seven control labels, five tile labels, two destination labels,
movable marker and floor. Total Debug actors: 116 (32 existing + 84 added).
Floors span Y=-7800..-4100, top Z=2400, with adjacent X edges meeting.

The [editor audit](four-stations-2026-09-12.json) records every new actor,
transform, copied presentation property, geometry and binding. All 84 transforms
matched readback; each new controller has 17 audited native references plus
shared personal progress and a unique ID 1-3. Existing progress, badge tracker,
hub destination and spawners are shared intentionally. The main route sign and
connector were retained. No Verse source changes were needed.

BuildAll returned `[]` before launch. SHA256:

- Fixtures: `A157EC346FB26A8B0A39DD78BD81BC69966E06D28A14E8300BCCC1CEC9CFE2CB`.
- Progress: `F5937D44F94F95D2772F87F950AC3B90F666FFA3B2551BA6DB9A43F2CD2C88C6`.
- Station: `0990261D7AC0EE68513FC283694DA392B3A53E64E11F179521CA950E90AFECE8`.

UEFN showed the standard custom-material performance advisory for each new
marker. Confirmed the intended existing academy teal material; readback shows
Movable markers and Static sand floors. Memory calculation is still pending.

## Solo runtime evidence

Fresh StartSession completed and GetGameState returned Running. One player,
round `15b59e2e0e7a4a7ebb106f1c868c92e8`. This launch used the requested
station-4 starting position. All captures below are Fortnite-window captures.

- PASS: [station 4 initial labels](debug-four-start-002.png) and
  [Claim](debug-four-claimpos-002.png) appeared without a visibility workaround.
- PASS, AC-001 movement: the supplied West instruction produced
  [actual tile 1 against expected tile 3](debug-four-west-run-011.png).
  An earlier Run keypress was outside interaction focus; the recorded run cited
  here followed a verified Run prompt.
- PASS, AC-003 movement hints: [concept hint](debug-four-help1-002.png) and
  [worked hint](debug-four-help2-002.png) explained the mismatch and repair.
  [Editing to East](debug-four-east-edit-002.png), then Run,
  [completed at tile 3](debug-four-east-pass-011.png).
- PASS, station transfer 4→3: crossed the
  [continuous floor join](debug-four-join43-002.png), reached
  [station 3 Claim](debug-three-arrival-002.png), and
  [restored the solved program and marker](debug-three-retained-002.png).
- PASS, AC-001/002 repeat: Next selected challenge 2;
  [supplied Repeat 2 failed at tile 2](debug-three-repeat2-009.png).
  [Concept](debug-three-help1-002.png) and
  [worked](debug-three-help2-002.png) hints displayed correctly.
  Edit to Repeat 3 and Run [completed at tile 3](debug-three-repeat3-011.png).
- PASS, transfer 3→2: crossed the [join](debug-three-join32-002.png), reached
  [station 2](debug-two-arrival-002.png), and
  [restored solved Repeat 3](debug-two-retained-002.png).
- PASS, AC-001/002 cargo: Next selected challenge 3;
  [reversed rule produced Storage / Garden and failed](debug-two-cargo-wrong-013.png).
  Both [concept](debug-two-help1-002.png) and
  [worked](debug-two-help2-002.png) hints were readable.
  Correcting the rule produced
  [Garden / Storage and the full Debug Badge recap](debug-two-cargo-pass-013.png).
  The badge required the earlier two completions retained across stations.
- PASS, transfer 2→1: crossed the [join](debug-two-join21-002.png), reached
  [station 1 Claim](debug-one-arrival-002.png), and
  [restored solved cargo and earned badge state](debug-one-retained-002.png).
- PASS, repaired first-station walking seams: walked north from Debug using
  movement only, [toward Vault](debug-route-north-before-002.png),
  [into Vault](debug-route-north-after-002.png), and then
  [into Signal Harbor](debug-route-signal-after-002.png).
  Neither former seam required jumping or caused a fall. This verifies the
  first-station route, not all four parallel routes.

Health remained 100 throughout. No jumping was used in this run. The new
station floor joins and movement/claim/transfer behavior are solo evidence only.

## Presentation and remaining checks

The lowered, offset destination labels no longer cover the instruction board
at the tested controls. Program, expected/actual, feedback and six hints were
readable. Cargo destination labels remain clear at the final cargo positions.
The marker can cover part of the Storage label at an intermediate tile pose
(for example the Repeat 2 result); tile/result cues remain visible. Full
muted-audio and all-control presentation acceptance stays open. Static labels
appeared in this fresh session; one success does not resolve the intermittent
visibility failure recorded in earlier zones.

All supplied faults and repairs have current-source evidence, and all six Help
messages have now been observed. Previous evidence supplies remaining edit
alternatives, Replay, exact journal badge and Hub return. Pending: rapid-input
guards, cancellation during execution, respawn/new-round checks, additional
reward replay/recompletion checks, multiplayer, project validation and memory.

Fortnite closed after testing. Process count 0 and UEFN Disconnected verified.
No editor mutations occurred after this tested revision. Twenty-seven selected
captures are retained with this record.
