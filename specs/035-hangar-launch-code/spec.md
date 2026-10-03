# Hangar Launch Code — revision 1

Status: proposed design for human review, 2026-10-03. No implementation or approval.

Turn the user's new ArcticBase hangar into a short optional signal game. Pix needs a launch code: read a visible strip, shoot the large A-circle / B-triangle / C-square pads in order, and power up the hangar's three launch beacons. A final light sweep and burst announce **LAUNCH READY!** The payoff is a launch-system test, not a flyable aircraft or aircraft animation. Target duration: 60–90 seconds for a first play, to be measured.

The learning goal is concrete: a machine follows instructions in order; checking the visible plan and retrying a mistaken sequence fixes its result. This side activity has no prerequisite or Academy badge and does not change the eight-module journey.

## Requirements

- R-01 Preserve the existing Hangar prefab, floors, doors, shelving, toolbox, stairs, catwalk and neighboring activities. Add the minigame only in the measured central ground-floor bay. Keep the west entrance and a 3 m approach open; no mandatory jumping or roof access.
- R-02 One player owns a run. At idle, START LAUNCH TEST claims the game; other players may watch but cannot advance/reset it. Leave/respawn/disconnect releases ownership and resets the bay. Existing island matchmaking is unchanged.
- R-03 Three codes are `A B C`, `B A B C`, and `C A B A C` (12 deliberate shots). A, B and C remain in fixed physical positions. The board shows the complete current code throughout, accepted symbols as checks, and a cursor under the next slot. Correct input fills that slot. A wrong input clears only the current code's slots; completed codes and beacons remain. Show `Order matters. Try this code again.` Then immediately allow retry. Never take health, points, energy or time away.
- R-04 Code 1 lights beacon 1 (POWER); code 2 lights beacon 2 (LINK); code 3 lights beacon 3 (READY). Each completion holds its success state for 1 second. After code 3, sweep the three lights and play a one-second completion burst, then hold all three lights and `LAUNCH READY! / You sent the steps in order. / Replay or walk out.` This feedback is visible with sound muted.
- R-05 The three 1.5 m hit faces are 5 m apart, approximately 8 m from the suggested standing point, and marked by both letters and shapes. A brief optional chime reinforces hits. The code board uses no more than three short lines. A reference remains visible; no memory-only challenge, punitive countdown, combat or randomly moving targets.
- R-06 Each intentional shot advances at most one slot. Observe shots during feedback and require 0.5 seconds without hits before arming the next slot; holding automatic fire cannot clear a code. Wrong/inactive/non-owner hits never advance. Repeated A/B symbols require distinct hits separated by the quiet interval. This detects hit cadence, not physical trigger release; verify against the actual shared automatic blaster. Generation tokens cancel obsolete feedback at reset.
- R-07 START becomes REPLAY after completion. Replay starts the same three codes with beacons off and no badge/energy reward. A CANCEL button resets and releases the game at any point; the ordinary walk-out route remains open. Round restart clears all local state. Cancel/departure during completion must not restore a stale light or completion message.
- R-08 Preserve the shared Data Blaster grant, existing target APIs and all existing mission bindings. Use dedicated new target assemblies/controls/boards; do not take devices from working missions. Compile, validate, cook and independently playtest before marking gameplay tasks complete.

## Acceptance scenarios

| ID | Given / When / Then |
|---|---|
| AC-01 | Given arrival on the west approach, when a player walks into the bay, then the start control, three pads and instructions are readable and the route remains at least 3 m wide without jumps. |
| AC-02 | Given idle, when Start is pressed, then the player owns the run, `A B C` appears, and all pads accept only that owner's shots. |
| AC-03 | Given code 1, when A/B/C are shot separately, then three slots fill in order and only POWER lights; code 2 appears after 1 s. Repeat `B A B C` and `C A B A C` to reach Launch Ready. |
| AC-04 | Given POWER already lit and code 2 partly filled, when C is shot early, then code 2 returns to slot 1 while POWER stays lit. The reference remains and correct retry succeeds. |
| AC-05 | Given any code, when automatic fire is held across a slot/code boundary or a wrong target is spammed, then it cannot advance multiple slots or skip the quiet interval. |
| AC-06 | Given a complete run, when Replay is pressed twice quickly, then exactly one clean new run begins; no Academy tracker, badge or energy changes. |
| AC-07 | Given an active/finishing run, when owner cancels, leaves the play bounds, respawns, disconnects, or the round restarts, then targets, lights and HUD reset; no delayed effect restores old state. |
| AC-08 | Given two players, when a spectator shoots, presses Cancel or Replay, then the owner's run is unaffected. After owner exits, the second player can Start a fresh run. |
| AC-09 | Given standing/crouching positions and muted audio, when all codes are played, then shapes, cursor, slots, lights, feedback and controls remain understandable; shots hit matching visual pads and no invisible inactive surface blocks play. |
| AC-10 | Given the completed implementation, when existing adjacent Agent activity and shared blaster spawn/respawn are exercised, then previous behavior remains. UEFN validation/cook pass and the final game state is no longer Running. |

## Out of scope

Aircraft flight, vehicles, timers, leaderboards, additional badges, new island progression requirements, shell remodeling and use of the upstairs catwalk.
