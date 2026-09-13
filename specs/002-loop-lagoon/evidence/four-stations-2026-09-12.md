# Four-station implementation — 2026-09-12

Status: editor implementation saved; focused solo access and hint checks passed;
full runtime and multiplayer acceptance pending.
Map: `/fn_shoreline_island/fn_shoreline_island`.
UEFN: Release-42.10-CL-57819926.

## Layout

Duplicated the tested station 0 through UEFN Edit > Duplicate. Each of the
three copies contains 33 actors: a Verse station, dock floor, six buttons,
personal feedback device, main board, six tiles, twelve labels, robot, parcel,
and three lanterns. The original dock and entrance are retained.

| Station ID | Board name | X offset from original | Floor X extent |
| --- | --- | --- | --- |
| 0 | Dock 1 | 0 cm | -1100 to 1100 cm |
| 1 | Dock 2 | 2200 cm | 1100 to 3300 cm |
| 2 | Dock 3 | 4400 cm | 3300 to 5500 cm |
| 3 | Dock 4 | 6600 cm | 5500 to 7700 cm |

All floors span Y=3000–5500 and have top Z=2400. Shared edges provide a
continuous dock without overlapping top surfaces; actual traversal is pending.

## Binding audit

Read every station's `station_id`, `progress`, and 18 native device/prop
wrappers. Read each wrapper's `savedActor` and compared it with the original
station's actor-to-copy mapping. All 72 native bindings matched, IDs were
0/1/2/3, and all four progression references pointed to the existing shared
progress device. The five shared native references (four hub spawners and
hub teleporter) remained shared. Local controls, HUD, board and props point to
their respective copied actors.

- [Binding readback](four-station-bindings-2026-09-12.json)
- [Placement manifest](four-station-placement-2026-09-12.json)

Temporary actor tags enabled unambiguous mapping during editor duplication.
All 132 actors passed full location/rotation/scale readback against the manifest
(tolerance 0.00001) and were saved through SceneTools.save_actor. A subsequent
tag audit confirmed no temporary template tag remained on any of the 132 actors.

Source changes add dock numbers to available boards and clarify the first hint
to count from tile 0 even after a run. BuildAll returned no diagnostics. An
editor overview confirmed four adjacent docks; runtime checks are pending.

## Focused solo playtest

One player, 2026-09-12, UEFN version above. Station source SHA256:
`A9F64D295B86BD77100FC2A02D8B1CB4FD1609F6421D035062B6BA783E2C8A8B`.
Launch Session completed and GetGameState reported Running.

Initial client load omitted billboard text and interaction labels. A bounded
client-log scan found repeated `Billboard_WidgetComp` widget-load warnings.
StopGame followed by StartGame restored text and interaction prompts. This is
an unresolved initial-load reliability finding, not a clean launch pass.

After that restart, visited and claimed Docks 1, 2, 3, and 4 in order. All three
floor joins were traversable without jumping, health remained 100, and each
claim displayed the pilot, Challenge 1, Repeat 1, Start 0 and Goal 3. Subsequent
claims succeeded after leaving the previous dock's ownership radius.

- [Dock 1 claim](dock-1-claim-2026-09-12.png)
- [Dock 2 claim](dock-2-claim-2026-09-12.png)
- [Dock 3 claim](dock-3-claim-2026-09-12.png)
- [Dock 4 claim](dock-4-claim-2026-09-12.png)

Dock 4 Repeat 1 moved its robot to tile 1 and displayed the expected stopped-at-1,
goal-3 retry message. Help then displayed: "A loop repeats its steps. Count the
tiles from tile 0 to the goal." This passes targeted T-047 after a wrong count.

- [Dock 4 wrong-count result](dock-4-run-one-2026-09-12.png)
- [Dock 4 revised hint](dock-4-hint-2026-09-12.png)

These checks do not establish simultaneous station isolation, challenge-progress
transfer, every copied robot's motion, or all hint scenarios. The visible Verse
device console beside copied stations also needs presentation cleanup.

## Required follow-up

- Retest a fresh client launch for billboard/widget loading reliability.
- Verify motion on Docks 2 and 3, all challenge progression, and progression
  transfer between stations; finish presentation cleanup.
- Check each wrong-count fixture and cancellation/reset lifecycle scenarios.
- Run two- and four-player isolation/access tests when clients are available.
- Complete project validation, memory calculation and the remaining milestone A
  regression checks. Editor binding readback is not multiplayer playtest proof.
