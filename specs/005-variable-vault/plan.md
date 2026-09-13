# Variable Vault Implementation Plan

- Status: Approved
- Specification: [spec.md](spec.md)

## Approach

Use owned preview doors to prevent one player's opened door from solving another's puzzle. The door is visual feedback; it must not block travel or trap a player. Clamp adjustment values to 0-10 with clear boundary feedback. Store energy and authored start/target values separately. Use a dedicated Verse device and isolated station execution.

## Delivery and verification

## Concrete implementation choices (2026-09-12)

- FR-001/002: retain player-owned energy between adjustments and station claims;
  clamp to 0-10. Start checks equality against authored targets 3 and 5. Replay
  resets to authored starts 0 and 2 while retaining completed challenges.
- FR-003: separate repeat selection (1-5, initially 1) from energy. Run always
  resets energy to 0, displays it for 0.7 seconds, then adds 2 every 0.7 seconds.
  Check target 6 only after the selected number of additions; passing through 6
  on a longer run does not solve the challenge. Adjustment controls explain the
  repeat task without changing its energy.
- FR-004: a shared progress device stores per-player challenge, energy, count,
  hint level, completed flags and badge; each of four stations owns its preview
  door, controls and labels. Award uses SetValue(1), guarded by completed flags.
  Next requires success and cycles after challenge three; Replay resets only
  the current attempt and its hints.
- NFR-001: ownership guards all puzzle input. Station generation and round
  generation cancel suspended additions and door motion after Replay, departure,
  respawn or round reset. Completed work survives respawn in the same round.
  Interrupted repeat runs reset energy to 0; manual edits survive station release.
- NFR-002: named energy/target/count display and OPEN/CLOSED door label provide
  non-color cues. Preview doors stand outside every walking route and rise 350
  units on success. Failure leaves the door closed and provides an edit prompt.
- Keep lifecycle and multiplayer claims pending actual runtime evidence; reuse
  established native device types, then audit saved bindings before launching.

First graybox center: (-3200,-2600,2450), southwest of the hub. Floor top 2400
with X=-4600..-1800 and Y=-4100..-800; a 700-wide connector meets the hub edge.
The first test exposed native asset rotation offsets: explicitly set all full
actor transforms after PlaceDevice. Board yaw 0 and button yaw -90 passed the
retest. Its overlapping boards then prompted a horizontal arrangement: objective
left, door center, energy right; door-status label sits in front, below the door.
See the implementation evidence for exact final transforms and pending retest.

Four-station placement: retain the reviewed first station at X=-3200 and add
stations at X=-6000, -8800, -11600, all centered on Y=-2600, Z=2450.
Each uses its own 2800-wide floor, door, nine controls, labels, three boards and
feedback device. Adjacent floor edges meet; only station one needs the hub
connector. Assign unique IDs 0-3 and share the existing personal progress device.
Bind Energy to index 1 of the journal's later_badge_trackers (Signal remains 0).
Verify all native references and transforms after placement; copied-station
runtime access and numeric journal retention require a new launch.

Fresh-load visibility investigation: the four-station launch lost static labels
across multiple zones while later text changes restored dynamic boards. First
test a native Claim-button event that explicitly shows its own CLAIM label.
This adds no progress or reward changes. Verify the result in a fresh session
before choosing a broader display-refresh solution; keep failed readability
acceptance open until the initial cues reliably appear without player action.

Probe result: labels appeared before Claim in the follow-up launch, making the
native-show experiment inconclusive. Removed the diagnostic binding, saved the
label actor and verified its event-binding list is empty. Keep the intermittent
initial-visibility issue open. The same run verified exact journal Energy 1/1
after Replay and repeat completion; see the badge-journal evidence.

Walking-route retest exposed the 200-unit open seam between Signal Harbor and
Variable Vault. Extend the four Vault floors north to Y=-600 while retaining
their south edge Y=-4100 and top Z=2400: center Y=-2350, scale Y=35.
This closes the seam across the adjacent stations without moving any controls.
Require a fresh walking playtest; saved geometry readback alone is not a pass.

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.
