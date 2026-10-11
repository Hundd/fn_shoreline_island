# Implementation requirement map

Source inspected at SHA2560DD9AD5CE8FE0141D518DE31DCCB95ECFCF500381A69983671EB8D8D9CD0E6B2. This is an Implementer navigation aid for independent QA, not gameplay acceptance.

| Requirement | Implemented source/evidence | Remaining authoritative proof |
| --- | --- | --- |
| FR01 / AC01 | Exact five wrong-demonstration messages at127–131; RED+SMALL messages132–133 and rejection369–377 before reservation381. Result selection447–459. | Cooked eight-row movement, selected values, exact displayed text, zero wrong DATA/badge deltas. |
| FR02 / AC02 | Inspect/Replay/Connect handled297–328 ahead of selector guards332–341. Connected/delivered/shared execution guards precede six writes344–355. | All six selectors across fetch/carry/hold/core-return/Pix-return; post-success freeze; wrong-ready edit and subsequent submission correspondence. |
| FR03 / AC03 | State correction/returning6–7; next_step220–226; result persists457–458; readiness clears only returning476. Existing show_request and navigation_monitor use next_step. Accepted edit342 clears correction. | Actual HUD/journal visibility, timing and Inspect/rejected action behavior during return. |
| FR04 / AC04 | Existing synchronous owner reservation380–384 preserved. Token check run entry409; fetch430/433; carry393/405 and436; hold462/465; distinct return boundaries468/471. Existing Replay/exit/departure/respawn/round invalidation preserved. | Native MoveTo cancellation and immediate replacement attempts in every approved phase. Stop for reviewed redesign if stale native motion persists. |
| FR05 / AC05 | Connect313–328 before busy selector guard, earned3 guard318–319 and shared badge316 unchanged. Success438–445 retains5 once/run guard. Replay creates fresh run state while external energy/badge remains. | Double Send, early/valid/repeated Connect, Connect during return, Replay second5+3 and no duplicate shared badge. |
| FR06 / AC06 | Native22 exact savedActor/ref/transform comparisons in postimplementation.json; current configured=true. No scene mutation calls. Native clean build and successful launch activation recorded. Native compilation serialized ten existing VerseDevice packages, recorded explicitly. | Separate Project validation, cooked spawn/progression/reset/re-entry/respawn/west travel, independent QA. Current actor count3673 has no preflight count; do not infer a count comparison. |
| FR07 / AC07 | Manual criteria retained unchanged; no automated pass. | Intended-age unfamiliar player's neutral prediction, explanation, transfer and ordinary-position visibility/pacing evidence. |

Shutdown checkpoint is native StopGame=Completed, StopSession completed and GetGameState=Unconnected. Editor ownership transferred to Supervisor/QA; no editor or UI calls during this offline audit. Windows lock screen is the current interaction blocker. Goal remains active.
