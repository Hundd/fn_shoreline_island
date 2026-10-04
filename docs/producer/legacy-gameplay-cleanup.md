# Remaining legacy gameplay and control cleanup

Status: proposed for planning. Date: 2026-10-04. User request: “please check the map, where old gameplay elements left (buttons etc) that we did not migrate to the new approach, and think with producer what to do with them”. This brief recommends scope; it does not approve or implement a map change.

The next improvement should remove misleading leftovers and then simplify the main Skills lesson. A button is appropriate when its action is clear: composing a prompt, opening the journal, starting a demonstration, replaying, and returning all remain useful. The problem is a control that advertises a retired game, has no useful response, duplicates another station, or asks a child to manage several abstract editors before seeing a result.

## Evidence and current status

This assessment combines current source and recorded implementation evidence with the Supervisor's [fresh read-only editor audit](../evidence/legacy-gameplay-audit-2026-10-04.json): 1,685 actors and 128 buttons, resolved saved actor references, current controller modes and native visibility. It is not a firsthand cooked playtest. Presence, native visibility, runtime activation and actual player reachability are separate facts.

The September 29 [remaining-area review](../remaining-area-review-2026-09-29.md) is historical. Confidence, Error, Tools and Agent have since received gameplay migrations; stale draft headers and unchecked acceptance tasks must not be interpreted as proof that the old designs still run. Confidence's [revision tasks](../../specs/030-confidence-reactor-rescue/tasks.md) document the migrated bay and mounted Replay/Return. Error records removal of 26 obsolete buttons in [its tasks](../../specs/031-ai-error-lab-shoot-to-fix/tasks.md). Tools records 38 obsolete buttons and three duplicate controllers removed in [implementation status](../../specs/032-ai-tool-lab-dock-rescue/evidence/implementation-status.md). Agent's [QA report](../../specs/034-ai-agent-rescue-run/evidence/qa-report.md) documents the rescue branch and its remaining verification limits. These counts describe their historical edits, not fresh deletion candidates.

Feature [037](../../specs/037-single-player-academy/spec.md) disabled the three duplicate Skills controllers and legacy Bot4 controls while preserving Return and structures. Source disables their controls and hides billboard text, but does not remove the button meshes. The older Prompt controller similarly disables its first sixteen controls in blaster mode. The original game manager disables four planting-sequence controls in data-core mode while retaining spawn, badge and Return responsibilities. Fresh binding checks must distinguish these physical remnants from reused assets.

The fresh audit narrows the actual cleanup candidates to **55 controls across four retired bays**: three duplicate Skills bays each retain fourteen controls disabled by their solo branch, and Bot4 retains thirteen. All 55 have native `visibleDuringGame=true` and `bHidden=false`; they are expected to present dead interaction affordances, but that visual conclusion still needs a cooked observation. Four useful Return controls in those same bays are protected. These are review candidates, not a deletion authorization.

| Audited cluster | Approximate former Start/Claim position (UE cm) | Current evidence | Product decision |
|---|---|---|---|
| Skills station 0, primary | (-2330, -17700, 2500) | `solo_active=true`; 15 visible controls | Keep functional today; redesign its required lesson next. |
| Skills station 1 | (-5730, -17700, 2500) | `solo_active=false`; 14 retired controls plus Return | Retire obsolete controls and labels; preserve Return and structures. |
| Skills station 2 | (-9130, -17700, 2500) | Same | Same. |
| Skills station 3 | (-12530, -17700, 2500) | Same | Same. |
| Legacy Agent / Bot4 | (-12530, -14100, 2500) | `solo_active=false`; 13 retired controls plus Return | Retire obsolete controls and labels; preserve Return, shell and shared infrastructure. |

Positions locate each cluster; they are device bounds centers, not measured player standing points or a proposed layout. No unused bay needs replacement gameplay immediately. After cleanup, inspect whether a plain rest area or existing scenery already makes its purpose clear.

The original four planting-sequence buttons and the older Prompt controller's first sixteen controls already have native `visibleDuringGame=false`. They are lower-priority internal remnants, not current evidence of visible clutter. The Prompt Replay remains visible and should stay. Ten live Workshop controls resolve to reused `repair_*` actors and are required; their old names do not make them obsolete. The audit found no placed legacy `loop_station` or `repair_station` controller, so their old Claim messages in source are not evidence that those games remain reachable.

## Recommended order

| Priority | Area | Recommendation and player value |
|---|---|---|
| 1 | Proved retired control clusters | Remove obsolete button meshes and their obsolete labels from the playable presentation after exact ownership checks. Preserve reachable Return and structural supports. A quiet unused bay is clearer than an enticing dead console. Do not fill every emptied bay with a new puzzle. |
| 2 | Primary Skills Lab | Keep the GrowPlant lesson and visible planter results, but replace the required definition/caller/repeat/Next editor with a short repair-and-reuse interaction. First inspect the named steps, correct one step and see a planter recover; then reuse the same skill on another planter. Keep the identity of the reused skill visible. |
| 3 | Optional content and signs | Keep the optional Prompt arena, Discovery Trail and hangar route demonstration. Check that their entry cues say optional, never imply a ninth badge, and never compete with the numbered main route. Align leftover names and redundant instruction boards. |
| 4 | Historical source/docs | Reconcile stale roadmap/status wording after the scene audit; retain historical evidence. Remove unused source only as a separate dependency-proven maintenance change, not as a condition for visual cleanup. |

Skills is the remaining substantial legacy interaction, despite its new Start wording and solo retirement of duplicates. [Current controller](../../Content/fn_shoreline_island_nursery_station.verse) still exposes fifteen button references across four definition steps, three caller slots, repeat, Start, Run, Help, Next, Replay, Return and optional remix. Its runtime messages still say “Care skill” and “Care step” while the lesson is GrowPlant. The remix's “3 plan instructions replace 9 expanded steps” should distinguish fewer written instructions from the same executed actions. These source findings support a focused redesign; they do not establish an observed child failure rate.

A full skill editor can remain a later optional advanced activity if the compact required lesson proves useful. Do not preserve the old editor merely by placing an OPTIONAL sign on a confusing station, and do not turn the core lesson into a magic Grow button with no visible sequence.

## Preserve and exclude

Preserve Prompt Workshop's working composition controls; current answer targets and feedback in Pattern, Classifier, Confidence, Error, Tools and Rescue; the journal; all useful Replay/Return controls; the hangar's HOME/TRY/CANCEL interactions; eight unique badge identities; safe retries; round and attempt reset behavior; and the seven-module Agent prerequisite.

Protect Bot2/3 assets reused by Rescue and the hangar, shared floors and routes, tracker/progress devices, player equipment, spawn handling and teleporter destinations. An actor name or old Verse class name is not a deletion rule. Internal owner and generation guards remain useful in a solo game.

Exclude new required badges, combat, scoring races, a full island rebuild, blanket replacement of buttons with shooting targets, and unsolicited implementation. Exact layout, actor decisions, bindings and feasible interaction design belong to a numbered Planner bundle.

## Candidate acceptance for the Planner

- Given each retired bay in a clean cooked game, when the player approaches its former console, no visible control or sign promises the retired interaction; its useful Return and safe route remain available.
- Given the current eight-module route, all retained required controls respond and preserved actors still have their intended bindings; no badge can be earned through an abandoned alternate station.
- Given the new Skills lesson, the player sees the steps of GrowPlant, repairs a concrete problem, observes the result and deliberately reuses the same named skill elsewhere. A wrong choice explains the mismatch and allows a safe retry.
- Given earned Skills progress, replay and Return preserve the unique badge; a new round resets correctly; late callbacks cannot advance another attempt.
- Given optional Prompt, Trail or Hangar entry, its purpose and optional status are clear; completing it neither adds a ninth badge nor hides a required prerequisite.
- Given muted audio and an unfamiliar player, all useful actions and results remain readable. Record missed interactions and the player's explanation of skill reuse rather than inventing comprehension or timing metrics.

## Planning dependencies and limits

Build a keep/reuse/retire ledger using exact actor references, incoming native bindings, resolved Verse references and child/parent relationships. Recheck physical visibility in cooked play before calling a cluster misleading. For controls disabled only by OnBegin, distinguish their editor Enabled setting from runtime state. Preserve or remount Return if its old console is removed. Inspect the active Skills bay's real sightlines and planter ownership before specifying a compact replacement.

Provisional effort: dependency-proven visual retirement is smaller than a Skills redesign, but live ownership and cooked visibility determine actual scope. Existing full-route/lifecycle verification gaps remain; this review cannot close them.
