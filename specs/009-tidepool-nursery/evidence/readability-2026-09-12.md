# Nursery readability and fresh-display reliability - 2026-09-12

Work in progress; no acceptance task checked off.

## Initial trial and reproduced failure

UEFN 42.10, one solo player, session `b1942c52fc7f4696a81c73cd5cf31266`.
Nursery source was unchanged from the four-station acceptance revision.
Seven Station 1 transforms were saved/read back in
[trial audit](readability-trial-2026-09-12.json): mission/program Z2670,
execution Z2400, four bed/exit labels Y-16900. This replaces the earlier
Station 1 presentation transforms; other three stations initially retain them.

- [Fresh spawn](captures/nursery-readability-start-002.png): static Nursery and
  visible neighboring-zone billboards were missing. Claim button worked.
- [After Claim](captures/nursery-readability-run-002.png): changed mission text
  appeared, fully below the HUD. Program, execution and control labels remained
  missing after walking to Run, despite the existing periodic label refresh.
- [After Run](captures/nursery-readability-failure-014.png): changed failure
  trace and Planted label appeared. The revised label is clear of the robot;
  mission and execution text do not overlap. Unchanged labels remain missing.

Result: FAIL for fresh readability. Partial layout evidence supports the lower
boards and forward bed labels, but full layout acceptance needs visible program
and controls. Fortnite was closed: zero processes, editor Disconnected.

## Candidate display recovery

The evidence suggests unchanged initial text can be missed on fresh load; this
is an inference, not a diagnosed engine cause. The existing SetText, ShowText,
UpdateDisplay refresh did not recover it. Trial a Nursery-local cache indexed
by its 21 fixed boards. Every two seconds, alternate a trailing space in current
visible text to produce a changed value. Preserve hidden beds/exit and cached
execution text; refresh never moves props, resets programs, or awards progress.

The first map keyed by billboard_device failed compilation because the type is
not comparable. It was replaced with integer indices. Verse BuildAll then
returned no diagnostics. Candidate runtime evidence remains pending.

Candidate station SHA-256:
`085E5439067EA11D569199F3813EF0C58BF8CC89BE79AFB85BADB2586CBA869A`.
The first candidate launch (`2ed16d9a0f334f7ba3fc3335d4f0d9bf`) ignored the
requested Nursery location and spawned at the hub. A walking approach encountered
[a blocking platform edge](captures/nursery-refresh-route-lane-002.png) near the
hub/Loop area; Nursery was not reached. This is not display-recovery evidence.
The session was closed (zero processes, Disconnected), then a focused relaunch
was requested. Preserve the route obstruction as an unresolved navigation issue.

## Focused candidate result

Session `951bdd92a97d4a1ca2d84902b382327d`, one player, same candidate SHA above.
StartSession completed at the requested Nursery location. Focused checks PASS:

| Check | Expected | Observed / capture | Result |
| --- | --- | --- | --- |
| Fresh display before claim | Current static controls, objective and active bed label visible | [Fresh view](captures/nursery-refresh-focused-002.png) | PASS |
| Run view | Complete mission/program/execution; bed state clear of robot; mission below HUD | [Run](captures/nursery-refresh-run-002.png) | PASS |
| Failed trace retention | Current failure and Planted state persist across refresh cycles; no award | [Early](captures/nursery-refresh-wrong-005.png), [later](captures/nursery-refresh-wrong-019.png) show identical trace/state and Badge 0/1 | PASS |
| Editing after failure | Program and bed state update, old error clears | [Step 4](captures/nursery-refresh-def4-002.png) shows changed definition and Empty/Ready | PASS |
| Correct success | Completed flag and harvested state appear and remain current | [Success](captures/nursery-refresh-success-019.png), first flag yes, Badge 0/1 | PASS |
| Next and hidden boards | Challenge 2 defaults, exactly two active bed labels; bed 3 and exit stay hidden across refresh cycles | [Two beds](captures/nursery-refresh-two-beds-014.png), captured after several seconds | PASS |
| Hub return | Player returns successfully | [Hub](captures/nursery-refresh-hub-002.png) | PASS |

The revised Station 1 Run view improves the previously observed HUD/mission
overlap and robot/bed-state occlusion. [Step 3 view](captures/nursery-refresh-def3-002.png)
still clips part of the program under the minimap and lets the plant overlap
part of the execution board. Full side-control readability remains open.
No blinking was apparent in inspected captures; these do not prove frame-perfect
flicker absence. Neighboring zones also had visible boards in this successful
launch, so this does not prove the intermittent engine/load issue is eliminated
or establish causality for the cache. Additional fresh-load tests are required.

After the focused test, Fortnite closed (zero processes, Disconnected). The
seven relative presentation transforms were copied to Stations 2-4 through UEFN;
all 21 additions to this revision were saved and matched readback in
[copy audit](readability-four-stations-2026-09-12.json). Their runtime views remain
pending. The source cache applies to all four Nursery instances.

No full acceptance task is newly checked. Later challenges, all six hints/full
replay, rapid input and lifecycle, multiplayer, muted audio, full presentation,
project validation and memory remain open. The prior gameplay evidence remains
historical; this source revision has only the focused regression checks above.
