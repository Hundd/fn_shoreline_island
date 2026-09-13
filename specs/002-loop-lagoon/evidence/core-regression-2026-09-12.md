# Core regression - 2026-09-12

Status: in progress. Unobserved rows are pending, not passes.
Scope: milestone A, feature 002 AC-005/006/007/010 and garden regression.
Player count: 1. UEFN Release-42.10-CL-57819926.

## Revision

- Station SHA256: `1A522ECA288EF096F8C61B1BD7AE16C3B439BA7C0AC2A2213D76CFF22357BF6E`
- Progress SHA256: `DBF4E4E8FBFBE91EEA16D865FEE55EF2DB98947D54CA04756E0E54ED7F37A5D4`
- Change: hide the station/progress Verse console meshes during play.
- BuildAll: no diagnostics.

## Wrong-count fixtures

Each run must begin at tile 0. Observe visible commands, final tile, retry
message and health. Earlier completed challenges must remain available.

| Challenge | Count | Expected final tile / lamps | Result |
| --- | --- | --- | --- |
| Delivery | 1 | 1; unsuccessful | Pass: [capture](core-delivery-1.png) |
| Delivery | 2 | 2; unsuccessful | Pass: [capture](core-delivery-2.png) |
| Delivery | 4 | 4; unsuccessful | Pass: [capture](core-delivery-4.png) |
| Delivery | 5 | 5; unsuccessful, within board | Pass: [capture](core-delivery-5.png) |
| Lanterns | 1 | 1; ON/OFF/OFF; unsuccessful | Pass: [capture](core-lanterns-1.png) |
| Lanterns | 2 | 2; ON/ON/OFF; unsuccessful | Pass: [capture](core-lanterns-2.png) |
| Lanterns | 4 | 4; ON/ON/ON; unsuccessful | Pass: [capture](core-lanterns-4.png) |
| Lanterns | 5 | 5; ON/ON/ON; unsuccessful, within board | Pass: [capture](core-lanterns-5.png) |
| Changed target | 1 | 1; unsuccessful | Pass: [capture](core-target-1.png) |
| Changed target | 2 | 2; unsuccessful | Pass: [capture](core-target-2.png) |
| Changed target | 3 | 3; unsuccessful | Pass: [capture](core-target-3.png) |
| Changed target | 5 | 5; unsuccessful, within board | Pass: [capture](core-target-5.png) |

All rows were exercised on Dock 2 (station ID 1). Corrected runs with counts
3, 3 and 4 subsequently succeeded: [delivery](core-delivery-correct.png),
[lanterns](core-lanterns-correct.png), [final target and badge](core-target-correct.png).
No challenge was lost after an incorrect count. Retry positions matched a new
run from tile 0, rather than accumulating movement from the preceding endpoint.
Health remained 100 throughout. This passes AC-005 in solo on this revision.

## Other required observations

- Fresh client text loading: failed again. Initial hub/dock billboards were
  absent; client log at 04:08:19 UTC reported Billboard_WidgetComp widget-load
  warnings. StopGame/StartGame restored them. Root cause and reliable fresh-load
  acceptance remain open. No production workaround was added from speculation.
- Hidden consoles: observed on Dock 2 after round restart. [Capture](core-console-hidden.png)
  shows the former console area clear; Claim, Count, Run, Help and Hub worked.
  T-048 remains pending its clean fresh-launch condition.
- Repeated Run and Count input during execution: pending.
- Both hint levels in each challenge: incomplete. The final challenge's second
  request showed Repeat 4, followed by normal badge completion. [Answer](core-target-answer.png).
  Its first hint expired before capture; no new first-hint pass is claimed.
- Completed challenge transfer to another dock: pending.
- Respawn during execution, preserved progress, then new-round reset: pending.
- One uninterrupted garden and lagoon completion: gameplay passed after the
  initial round restart. Water, Plant, Wait, Harvest each showed correct feedback
  and [garden completion](core-garden-complete-2026-09-12.png). All three Lagoon
  challenges then completed in that same round, including the twelve wrong-count
  fixtures above. [Hub return](core-hub-return.png) arrived safely with health 100.
  The direct garden-to-dock walk overshot the rear edge; returning from the grass
  required a jump. This is not a fresh-player wayfinding pass. Improve route cues
  in feature 003 and assess the exposed dock edge before presentation acceptance.
- Standalone project validation and memory calculation: pending.

Two/four-player acceptance and target-age observations remain separate gates.
