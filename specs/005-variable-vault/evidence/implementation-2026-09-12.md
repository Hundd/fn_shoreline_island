# Variable Vault implementation — 2026-09-12

Status: first graybox station saved; Verse build passes. Runtime acceptance is
pending below. This does not validate the feature or the full island.

Update: the subsequent [focused solo matrix](solo-matrix-2026-09-12.md) supersedes
the retest-pending statements below for board overlap, subtraction/lower boundary,
challenge-two completion/Replay, repeat counts 1–5, repeat hints and Hub return.
It records first-station AC-002/AC-003 passes; wider acceptance remains pending.

## Source revision

| File | SHA256 |
| --- | --- |
| energy_fixtures.verse | 0075D9A176FCF6314D35FF8268D3F162402AF27942CF2A31293E9550008F5203 |
| energy_progress.verse | 3CC7D2EDC01E29825D93A5637519081029E8762ACFB049F6252793C68EF5B41F |
| energy_station.verse | DB69800C52D5F98443221B6FCC084347FAED24CEC72E91A865FCBFAC25043170 |

All files use the `Content/fn_shoreline_island_` prefix. The feature plan records
authored values and execution semantics before implementation.

## Editor results

- BuildAll returned `[]` after implementation and again after placement/binding.
- Placed and saved 29 new actors in `/fn_shoreline_island/fn_shoreline_island`:
  shared progress/tracker, station ID 0, nine controls and nine labels, three
  live boards, route sign, HUD feedback, preview door, floor and wide connector.
- Station center is (-3200,-2600,2450). Floor top is 2400; floor bounds are
  X=-4600..-1800 and Y=-4100..-800. Connector X=-1800..-1100,
  Y=-2400..600 joins the first vault to the existing hub edge.
- Verified all 19 native station wrappers, both progress wrappers, custom
  progress reference and station ID by native readback. Saved all new actors
  and read back every transform. [Complete audit](implementation-2026-09-12.json).
- Door uses a native BuildingProp with Cube mesh and Movable mobility. It rises
  350 units on success. Floor/connector use static cube geometry. Runtime
  collision and movement still require the launched test.
- Tracker readback: Individual, target 1, start 0, persistence false, automatic
  assignment false, native resets false, stat None. Verse handles round reset.
  Feedback targets TriggeringPlayer at Bottom Center, layer 5.
- Confirmed UEFN's Custom Material Detected dialog for the existing academy teal
  on the new door. Mesh/material readback matched the intended assets.
- Two native duplicate shortcuts left the original selection unchanged; those
  selected actors were not edited. New actors were instead placed through MCP.

## Pending

First station solo acceptance, remaining three stations, journal Energy binding,
all wrong values/counts, both hints, replay/repeated completion, cancellation,
round reset, multiplayer, project validation, memory and visual polish.

## First solo launch and orientation correction

Fresh Launch Session completed; GetGameState returned Running. One player,
round `b22bf18051b04d6d90ef5fcc86d2def2`. Claim displayed the correct restoration
objective and +1/-1/Start instructions. The door and floor were visible; health
100. [Claim capture](first-claim-rotation-failure-2026-09-12.png).

Readability **failed**: boards faced away from the interaction row and buttons
were edge-on. PlaceDevice applied native asset rotation offsets: boards requested
at yaw 0 ended at 180; buttons requested at -90 ended at 0. This is a concrete
orientation finding, not evidence of the earlier fresh-load billboard issue.

Closed Fortnite; UEFN reported Disconnected. Corrected all 22 affected native
actors through ActorTools with full transforms: button yaw -90, board/label yaw
0, route yaw 90. Saved and read back each with 0.001-unit/degree tolerance.
[Corrected rotations](rotations-2026-09-12.json) supersede their initial audit
transforms. Initial exact equality rejected harmless -90.000000000000014;
readback confirmed floating-point precision before continuing.

## Focused solo retest

Fresh launch, one player, round `f3367eed70bb40d3b155cb45dd4629b8`; unchanged
Verse revisions above, corrected rotations. Spawn requested at the vault for
this focused test, so this run does not prove hub-to-vault walking access.

| Expected behavior | Actual result / capture | Result |
| --- | --- | --- |
| New labels face the control row | Station name, energy board and control labels visible after launch; [spawn](energy-retest-spawn-002.png) | PASS for orientation |
| +1 updates named energy | Separate inputs displayed [1](energy-value-one-002.png), [2](energy-value-two-002.png), [3](energy-value-three-002.png); target remained 3 | PASS |
| Wrong energy keeps door closed and invites edit | Start at 1 left door down, displayed needs-3 retry prompt, health 100; [failure](energy-wrong-one-004.png) | PASS for value 1 |
| Start at energy 3 opens door | Door visibly rose, OPEN label appeared, completion invited Next/Replay, badge remained 0/1; [completion](energy-door-open-011.png) | PASS |
| Next restores the second authored fixture | Challenge 2, energy 2, target 5, door closed; [second fixture](energy-ch2-start-003.png) | PASS |

Presentation **failed** more broadly: energy board overlapped the objective
board from the control row, and the closed door hid its status label. After the
test, moved the objective to the left, energy to the right, and door between
them; lowered the status label and moved it in front. Four actors saved and full
transforms read back: [layout correction](layout-2026-09-12.json). This supersedes
their earlier positions. The revised layout still needs runtime verification.

Fortnite was closed after the run; process count zero and UEFN Disconnected.
No full acceptance task is checked off. Remaining first-station work includes
-1 and boundaries, other wrong values, challenge-two completion/replay, all
repeat counts and visible intermediate energy, hints, exact badge retention,
walking access/return and lifecycle. Do not infer multiplayer, project validation
or memory acceptance from these focused results.
