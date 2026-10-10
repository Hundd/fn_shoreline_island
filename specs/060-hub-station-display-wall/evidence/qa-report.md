# Independent QA â€” feature 060

2026-10-10. Codex CLI worker /root/gameplay_verifier, gpt-6.1-sol. Exclusive editor ownership received from Supervisor after Implementer released all in-flight calls. Read-only verification; no gameplay or design mutations.

Result: configuration checks PASS; interactive acceptance BLOCKED. No observed configuration defect. Full R1â€“R5 acceptance remains open.

## Approval and setup

Fresh command: python tools/map_workflow.py plan specs/060-hub-station-display-wall/map.yaml --ready
Result: READY FOR AGENT PREFLIGHT, exit 0. Approved digest 45221a327b41571f98a428effb4f117788799cc1a033d7b4acdc38daef6de079. No review bundle or approval was changed.

Fresh native readback: qa-readback.json. Compared against scene-delta.json and pre-edit implementation-checkpoint.json using offline numeric/property comparison; zero discrepancies.

## Requirement-linked results

| Requirement/scenario | Steps and expected result | Actual and status |
|---|---|---|
| R1 assembly configuration | Inventory hub060 actors; inspect transforms, bounds, mesh, materials and visibility against approved delta. Eight backboxes, mounts and four-sided bezels must be present. | PASS configuration: exactly 55 unique actors, all matching transform and bounds within 0.01cm, correct Cube mesh/materials, visible and not hidden in game. |
| R1 approach/front/side | Approach cooked bank, inspect full real text, supports, clipping and flicker at normal FOV. | BLOCKED: fresh UEFN window capture displayed Windows lockscreen at 11:22 Saturday October 10. No UI input followed. No cooked observation claimed. |
| R2 identity/layout/options | Compare eight academy_label identities, positions/scales, native options and event subscription fields against pre-edit checkpoint; yaw must be 0. | PASS configuration: all eight same actor paths; four columns/two rows unchanged; yaw0/pitch0/roll0, scale0.65 and positions exact; every recorded option equal, including Two Sided and WAITING text. |
| R2 journal/status/light update | Inspect controller source, then complete a real lesson and verify corresponding board/light update and numbering. | Source inspected: journal lines 615â€“629 select indexed board/light/name, write WAITING/RESTORED and UpdateDisplay. qa-journal.json reads 16 editable fields but returns Verse wrapper references, which do not independently establish their final device targets. Cooked update test BLOCKED by locked desktop. |
| R3 passage geometry | Inspect exact left wall/right pier/upper panel bounds and all collision profiles against approved delta. | PASS configuration: opening X=-980..-480 is 500cm wide; lintel underside Z2642, highest previously sampled support Z2412 gives nominal 230cm. Three structural BlockAll/QueryAndPhysics; remaining 52 NoCollision. No continuous floor/capsule traversal claim. |
| R3 arrival/return/Pix/rear walking | Walk both edges and center without jumping/snags; inspect full opening headroom and return navigation. | BLOCKED by locked desktop. Sparse historical floor samples and exact bounds do not prove continuous clearance. |
| R4 palette/grounding configuration | Check material and shape against approved delta. | PASS configuration: cream structural pieces, navy housings/trims and teal band use exact expected materials. No extra hub060 actors. |
| R4 daylight/oblique/readability | Observe cooked arrival and oblique views. | BLOCKED. Implementer editor-oblique.png is prior editor evidence only and does not establish real text readability. |
| R5 validation/cook | Review native session validation/upload/cook evidence. | REFERENCED prior Implementer evidence, not a fresh QA run: validation-session.md records LogValkyrie local validation Complete and StartSession Completed/Running. Separate Project Validate menu action not performed. |
| R5 progression/reward/reset/solo | Execute existing lesson, verify progression, one-time reward, replay/reset and hub return. | BLOCKED by locked desktop. Multiplayer NOT RUN; no multiplayer claim. |
| R5 shutdown | Query GetGameState before release. Expected nonrunning. | PASS fresh native state Unconnected, both in readback and final standalone query. No new game launched by QA. UEFN remains open. |

## Saved state and limitations

All 55 actors returned external actor asset paths (qa-readback.json). Implementer save receipts and final all-dirty save are recorded in implementation evidence. QA did not reload the level or independently inspect package dirty flags; fresh checks establish current editor configuration, with saved-state assurance referenced to those receipts.

No reproducible gameplay defect was observed because interactive testing was unavailable. Unresolved target-wrapper dereferencing is a verification limitation, not evidence of broken bindings. Supervisor should route remaining interactive checks after the desktop is unlocked; Implementer owns confirmed implementation fixes and Planner owns design deviations.

## Ownership release

Final native GetGameState: Unconnected. No active match, no new session started, no editor/UI calls in flight. Editor ownership released to Supervisor. QA changed only qa-* evidence and this report.



# Resumed independent cooked QA — 2026-10-10 12:44–12:47 +03:00

This section supersedes the prior locked-desktop acceptance result. Exclusive ownership reacquired after Implementer released all calls. Desktop unlocked. Final approved digest 2b74d9dd3d6471eb546f539731cf4ec2c0532a77c352838a52e39eb442f63166; fresh plan --ready passed. Exact geometry delta remains the same; prior independent 55-actor checks are retained, not claimed as freshly rerun.

Result: **FAIL cold startup presentation; partial reset recovery observed; full gameplay acceptance NOT COMPLETE.**

## Source and session evidence

Read navigation_refresh and OnBegin in Content/fn_shoreline_island_academy_journal.verse. SHA256 at 12:45:32+03:00: 73B1A2A4C1337756CDCDA09DB411EB095395770BA33C8A44392A71DF2F7AE4CE. The three-second heartbeat invokes SetText, ShowText and UpdateDisplay; light writes remain under changed-status conditions. Reward/progression code is outside the inspected patch. Source inspection does not prove exactly which compiled revision ran on the remote server. No push, build or gameplay edit was performed by QA. Implementer zero-diagnostic build and validation/cook are referenced evidence in presentation-refresh-checkpoint.md.

Independent StartSession with no location returned Completed, then GetGameState CanStart. StartGame returned Completed. The normal hub character received the Pulse Rifle, unlike the prior direct PlayFromHere test. Camera turned toward bank without walking. Two observations showed blank bank faces; qa-cold-visible-blank.png saved at 12:44:31+03:00. Several surrounding signs were also initially blank and the journal 0/8 HUD was absent. This was not a timed capture from first visibility: the exact startup latency and whether text would eventually recover in this same cold round remain unmeasured. It is therefore an observed cold presentation failure, not proof of a permanent isolated billboard defect or a measured violation of a three-second deadline.

One StopGame/StartGame reset returned Completed. Surrounding signs then rendered text. At 12:45:32 native GetGameState confirmed Running. Settled screenshots at 12:46 show four visible bank labels (4 CONFIDENCE, 3 CLASSIFIER, 8 AGENT, 7 SKILLS) readable as WAITING; partial 2 PATTERN is also visible. qa-reset-bank-final.png and qa-reset-bank-readable.png establish recovery on visible labels. Remaining bank columns were offscreen or HUD-obscured; all-eight reset readability is **not** independently passed. Journal 0/8 HUD stayed absent in these screenshots. No repeat cold session was launched, per Supervisor's finite investigation direction.

Client log tool returned no client log despite the active match. Discovered native Editor Logs, searched LogVerse for ErrRuntime, runtime error, navigation_refresh and ACADEMY missing; returned zero matches. This is absence of matching editor log evidence, not proof no server runtime error occurred. Native diagnostic and final shutdown results: qa-retest-native.json.

## Requirement/scenario disposition

| Requirement | Fresh outcome | Evidence / limits |
|---|---|---|
| R1/R2 cold readable status screens | FAIL observed cold startup | qa-cold-visible-blank.png; blank visible faces, no real lesson completion. Global startup context recorded above. |
| R1/R2 round reset presentation | PARTIAL, not full pass | qa-reset-bank-readable.png; visible right half readable WAITING, no all-eight view or first-visible timing. |
| R2 changed status and matching light | NOT RUN | No lesson completion; target mapping/update/reward remains unverified. |
| R3 center, edges, reverse traversal and Pix route | NOT RUN independently in this retest | Supervisor directed bounded startup investigation then handback. Implementer center/Pix captures remain referenced prior evidence only. |
| R4 oblique readability and coherent assembly | PARTIAL observation | Visible housings, cream wall, teal band and passage render coherently in reset screenshots; full daylight/all-eight/no-flicker acceptance not established. |
| R5 normal solo spawn | PASS limited spawn/loadout check | Normal hub spawn with Pulse Rifle; progression, reward, replay and round-state clearing not tested. |
| R5 final shutdown | PASS | StopGame Completed, StopSession null normal return, GetGameState Unconnected. |
| Multiplayer | NOT RUN | No multi-player test. |

## Defect QA060-01

Severity: high acceptance blocker. Zone: hub display bank/startup presentation. Reproduction observed once in an independently launched normal session: StartSession(no location), StartGame, turn toward bank; visible faces blank across two observations, journal HUD absent. Expected: current real statuses visible after arrival. Actual: blank faces; reset later restored visible WAITING labels. Responsibility: Supervisor route to Implementer for compiled/upload revision and initialization investigation. Cause remains unresolved; do not assume geometry occlusion, inventory failure or permanent heartbeat failure. Prior Implementer successful cold observations and this failure indicate inconsistent startup evidence rather than established universal failure.

Final ownership release at approximately 12:47+03:00: game Unconnected, UEFN open, no editor/native/UI calls in flight. No gameplay changes. Supervisor owns reconciliation and remediation routing.


# Final timed cold diagnostic — 2026-10-10 09:49–09:51 UTC

This section supersedes classification of QA060-01 as a demonstrated persistent cold-start failure. **Persistent blank presentation was not reproduced. All eight actual WAITING labels were observed in this same normal cold session.** The prior brief blank observation remains valid, but is consistent with startup/loading delay or intermittent presentation; its duration/cause was not established. Do not apply another source fix based on a presumed permanent failure.

Readiness passed again; source SHA256 remains 73B1A2A4C1337756CDCDA09DB411EB095395770BA33C8A44392A71DF2F7AE4CE. StartSession(no location) Completed, initially CanStart; StartGame Completed. Running was confirmed at **09:49:10 UTC**, the elapsed-time origin below. Immediate UI still said Starting Game. No QA push/build or source mutation occurred; no independent server compiled hash exists. No reset or movement occurred in this run. One initial camera turn aimed at the bank; camera remained fixed through final timed sample.

| Actual capture interval UTC | Elapsed since Running | Evidence | Observed |
|---|---:|---|---|
| By 09:49:25 | 15s | qa-timed-early.png | 4 CONFIDENCE, 3 CLASSIFIER, 8 AGENT, 7 SKILLS show WAITING. Surrounding Pix/Pattern text visible; normal rifle present. |
| 09:49:48–09:49:52 | 38–42s | qa-timed-30.png | Same visible labels and surrounding text remain rendered. |
| 09:50:21–09:50:25 | 71–75s | qa-timed-60.png | Same visible labels remain rendered. |
| 09:50:52–09:50:54 | 102–104s | qa-timed-90.png | Same visible labels remain rendered; native Running confirmed. |
| By 09:51:06, after permitted final camera turn | 116s | qa-timed-remaining-columns.png | 1 PROMPT, 2 PATTERN, 5 ERROR, 6 TOOLS all WAITING, plus 3/7/8 visible. Earlier view independently establishes 4. All eight readable in this cold round. |

Labels are physically ordered 4,3,2,1 across the top and 8,7,6,5 across the bottom from this arrival view, as captured. Actor identities/positions remain preserved. No visible clipping on the readable labels; top-left label is partly covered by Fortnite game-mode HUD in final frame but was clear in earlier views. No frame-by-frame flicker test performed.

Journal 0/8 navigation HUD was absent across samples although world signs, bank labels and rifle rendered. This is a separate observation/limitation; no progression or journal functional failure is inferred without interaction. Earliest observed bank text is t+15; no three-second or first-visible guarantee is proved.

Final disposition: R1/R2 **PASS limited settled cold all-eight readability** for this timed run; initial immediate-presentation latency remains unmeasured. R2 real lesson/status/light update, R3 full traversal and R5 reward/replay/reset regression remain NOT RUN independently. QA060-01 is downgraded to **unresolved startup timing observation**, not a proven persistent failure requiring another code change. Overall feature acceptance remains incomplete because those gameplay scenarios are outstanding.

Final StopGame Completed, StopSession normal null result, GetGameState Unconnected, at 09:51 UTC. UEFN remains open; no native/editor/UI calls in flight; exclusive editor ownership released to Supervisor. Only QA evidence/report changed.


# Remaining gameplay bounded attempt — 2026-10-10 09:54–09:57 UTC

Exclusive ownership reacquired; same source/design, no edits. One normal StartSession(no location) Completed. An early StartGame was unavailable while client connecting; waited for CanStart then StartGame Completed at 09:54:52 UTC. Normal hub spawn had rifle and actual signs/status text. No PlayFromHere, inventory change or cheats used.

Two supported normal autorun approaches were attempted. Camera aimed toward Pix; pressing equal enabled autorun and immediate supported screenshot refresh showed movement. Next action toggled equal off, but elapsed observation/tool/model latency carried the character well beyond Pix to the outside path/grass (qa-navigation-overshoot.png). A turn and second return approach again passed beyond the intended interaction point before the next stop observation. No Pix menu interaction was achieved. An attempted out-of-window camera drag returned a coordinate-bounds error; fresh observation followed, with no retry against stale coordinates. No held-key or arbitrary input APIs were used.

Result: **BLOCKED by precision-control limitation** for independent real-lesson completion, return-to-bank RESTORED/light readback, one-time reward, replay/reset regression and passage edge/reverse traversal. This is not an observed island gameplay defect. Center traversal/Pix transport remain prior Implementer evidence only; no new traversal pass is claimed from overshoot. Attempt stopped well before the five-minute cap without repeat session/cook loops.

Final native StopGame Completed, StopSession normal null, GetGameState Unconnected. UEFN open, no editor/native/UI calls in flight; editor ownership released. Feature acceptance remains partial: all-eight settled cold readability/configuration independently established; remaining gameplay checks require sufficiently precise live control or manual playtest evidence. QA made no gameplay/design/source changes.
