# Signal Lighthouse implementation - 2026-09-12

Status: first graybox station saved and Verse build passed; runtime acceptance
pending. This does not validate the feature or the full island.

## Revision

SHA256 of the source used for the initial session launch:

| File | SHA256 |
| --- | --- |
| fn_shoreline_island_signal_fixtures.verse | 439ECB7BEC4F2706A0D6C0EC9792FAECD9A320C5837F09C28355963CF9B65EEE |
| fn_shoreline_island_signal_progress.verse | 1F43BC1EDA6A5A42C3C601A10696624E4840BF699CE123159061DFA6C4C83A5D |
| fn_shoreline_island_signal_station.verse | BC5B1A6F8AB7384037CDE58DA3CFC47A7C7D3793BD04DF7371294219A1424EDC |

## Editor evidence

- Exact queues and all three rule mappings were added to the plan before coding.
- Three Verse files implement fixtures, per-player progression, and station
  ownership/execution. All three challenge paths, hints, Replay, Next, reward
  guards, return, and lifecycle cancellation compile.
- Initial build found unsupported vector += assignments and a duplicate local
  identifier. Both were corrected. Subsequent BuildAll returned `[]`, including
  after placement and binding.
- Placed 39 actors in the existing map: first station, shared progress/tracker,
  ten buttons, boards and labels, movable graybox boat, three dock markers,
  floor, hub connector, and graybox lighthouse tower/lantern.
- Duplicated the saved repair floor and four movable props through UEFN; changed
  only the duplicates to the harbor transforms. Other actors were placed through
  native tools. Every affected new actor was saved and its transform read back.
- Verified all 23 native station references against the intended station actors
  and existing hub/spawners; verified the shared progress script, tracker, round
  device, and station ID 0. [Full readback](implementation-2026-09-12.json).
- Tracker sharing is Individual; persistence and native resets are disabled.
  Verse resets on RoundBegin. Setting native first-spawn reset false also left
  resetBetweenRounds false; this is documented in the plan and needs runtime
  lifecycle checks. HUD feedback targets TriggeringPlayer.
- HUD priority `Priority` was rejected despite appearing in the exposed enum.
  Readback remained Normal; final configuration uses Normal and Replay behavior.

## Pending

Solo entry, route outcomes, queue visibility, all rule fixtures, hints, badge,
Replay, hub return, rapid input and lifecycle; three more owned stations after
the first station's review; journal tracker integration; two/four-player tests;
project validation, memory calculation, and coastal presentation.

Boat and landmark are graybox shapes. Runtime movement and readability are
unproven by compilation or reference readback.

## First solo launch and entrance correction

Players: one. Launch completed and GetGameState returned Running. The Signal
tracker displayed 0/1; signs and the graybox lighthouse were visible. A direct
walking approach from the hub dropped the player below the platform beside the
narrow connector, with health still 100. Entry acceptance: **fail** at this
revision. [Observed gap](entry-gap-2026-09-12.png).

Changed only `signal_hub_walkway` from location (-1450,700,2350), scale (7,6,1)
to (-1450,900,2350), scale (7,30,1), rotation zero. Saved and read back the full
transform. This supersedes that actor's initial transform in the JSON audit.
The connector now covers Y=-600..2400. Full content push requested; walking
retest and cargo interactions pending.

## Focused solo results after the connector push

Full content push completed; GetGameState returned Running. Same source hashes
as the initial launch; widened connector as documented above. Players: one.

| Scenario | Expected | Actual / evidence | Result |
| --- | --- | --- | --- |
| Walk from the hub through the widened approach | Remain on the platform without jumping or damage | Crossed to the harbor and reached the control row; health 100: [entry](widened-entry-2026-09-12.png) | Pass |
| Claim Harbor 1 | Personal pilot, initial queue, current cargo and objective appear | LEAF > PLAIN, boat 1/2, LEAF label and restoration objective: [claim](claimed-2026-09-12.png) | Pass |
| Send LEAF to Garden | Record delivery and advance to PLAIN | Delivery HUD, boat 2/2, PLAIN label: [delivery](leaf-delivered-2026-09-12.png) | Pass for progression |
| Send PLAIN to Garden | Keep boat 2/2; explain Storage is required; allow retry | Matching readable board/HUD, label at Garden, health 100: [wrong route](plain-wrong-garden-2026-09-12.png) | Pass for retry and explanation |
| Correct PLAIN to Storage | Complete challenge 1; badge remains unearned until all three challenges | Queue delivered, Next instruction, Signal 0/1: [completion](challenge1-complete-2026-09-12.png) | Pass |

These captures show destination changes and progression, but did not capture
intermediate animation frames. Smooth visible movement remains unverified.
Boat arrival overlapped its dock marker, obscuring the boat; this is a failed
presentation check. The cargo label also overlaps destination text in some
views. The manual queue board showed irrelevant Rule B, while its displayed
manual rule was correct. The upper rule board requires an upward camera look.

## Corrections after the focused test

Station source SHA256 is now
`7649AD5F9055003DA1470D3505DABA8BA01D9F330A65B7EB269ACA90990F4585`.
Manual boards omit the inactive rule selector; boats now moor 300 units in
front of dock markers. Cargo billboard home moved from Z=2570 to Z=2670,
with its other transform values preserved, saved and read back. These changes
supersede the initial cargo-board transform in the JSON audit.
BuildAll returned `[]` after these corrections. They have not yet been pushed
or retested. Earlier solo passes apply to the earlier source revision.

No full AC is marked complete: the opposite LEAF choice, intermediate motion,
challenges 2/3, hint levels, replay/rewards, lifecycle, four stations, and release
gates still need their scoped evidence.

Cleanup: Fortnite was closed after testing. The exact client process was absent
and Unreal MCP GetSessionStatus returned Disconnected.
