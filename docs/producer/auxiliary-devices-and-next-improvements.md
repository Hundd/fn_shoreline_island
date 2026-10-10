# Auxiliary devices and the next product improvements

Status: proposed for planning; no design approval or implementation.
Date: 2026-10-09.
Source request: ask Producer what should improve next, including replacing Agency computers with representations appropriate to their often hidden, auxiliary mission role.

## Recommendation

Start with a small **support-device presentation and collision audit**, followed by one representative pilot. A hidden progress manager does not need to look like a computer the child can use. The preferred outcome is an unobtrusive, nonphysical logic host with a clear editor name. A player-operated console should instead communicate its real action through its label, shape and visible result. Replacing every computer with another decorative object would not address that distinction.

This supports AI Island Academy's existing ages 8–10 direction: notice the useful action, try it, see the result, and retry safely. Infrastructure should neither look like another puzzle nor obstruct the actual one. There is no new learning mechanic or badge in this proposal.

## Evidence and limits

- **Owner feedback:** Agency computers are often hidden and serve auxiliary functions. This identifies an architectural/presentation concern, not proof that every instance is broken.
- **Recorded editor observation:** [039 placement review](../../specs/039-popcorn-parkour/evidence/harness-placement-review.md) identified the `nursery_progress` mesh `S_Agency_Computer_02` as non-editor-only, with QueryAndPhysics and convex geometry. The later [production revision](../../specs/039-popcorn-parkour/production-revision.md) retained that progress computer south of the course and separately retired the primary old station below the floor. These are different actors and responsibilities. Historical editor collision is not proof of an invisible obstacle in the current cooked game.
- **Current source:** [nursery progress](../../Content/fn_shoreline_island_nursery_progress.verse) is a `creative_device` holding player progress, badge tracking and round reset; it calls `Hide()` on begin. The other seven `*progress.verse` files also call `Hide()`. [PopBridge](../../Content/fn_shoreline_island_popbridge_controller.verse) holds a typed reference to that progress device. [Journal](../../Content/fn_shoreline_island_academy_journal.verse) and [Pix travel](../../Content/fn_shoreline_island_pix_travel.verse) also hide their own device representation. Hiding intent does not establish current cooked visibility/collision or support a safe wholesale class replacement.
- **Current product priorities:** [049 tasks](../../specs/049-prompt-lab-clear-start/tasks.md) and [postfix QA](../../specs/049-prompt-lab-clear-start/evidence/postfix-qa.md) record ten successful starts after the entry-volume repair. The owner's target-visibility concern remains explicitly open; one completed run from one firing position does not settle all viewpoints.
- **Superseding journey:** [044 tasks](../../specs/044-hub-pix-mission-travel/tasks.md) record implementation of mission travel and independent mission access, plus narrow owner acceptance of corrected label clicks/gamepad navigation. Broader arrival, lifecycle and final-badge acceptance remains open. The older roadmap's mandatory Agent prerequisite is therefore not a behavior to reintroduce.
- **Asset compatibility precedent:** [048 tasks](../../specs/048-campus-asset-validation-repair/tasks.md) record repair and local validation of replacement campus assets. Its historical upload-authentication failure is not evidence of a present outage; 049 subsequently cooked. Replacement availability and validation still need checking for each actual candidate.

This brief uses local source and saved evidence, with no firsthand playtest or fresh device inventory. Supervisor reports current game state `Unconnected`; Producer made no editor calls.

## Priorities

| Order | Proposed next step | Value and tradeoff |
|---|---|---|
| 1 | Classify Agency computer instances; pilot a suitable support-device representation on one well-understood manager | Directly develops the owner's idea and can prevent irrelevant visuals/physical interference. Binding risk makes a measured pilot preferable to bulk replacement. Provisional small-to-medium effort, dependent on supported representation settings. |
| 2 | Complete the existing Prompt visibility follow-up | Addresses an explicit unfinished player complaint. Inspect normal aiming positions and moving targets, repair only proved overlap, hit-surface mismatch or obstructing art; preserve the now-working start and five-shot lesson. Provisional focused repair, with cause still unknown. |
| 3 | Verify the full new hub-to-mission-to-hub journey and learning clarity | Travel reaches all eight lessons. Check independent starts, Return, replay, earned progress and true final 8/8 behavior; then watch a first-time player explain the lesson in their own words. This exposes missing integration work before adding another mission. Verification first; repair scope follows findings. |

More scenery replacement, additional required missions, and wholesale controller refactoring are deferred. Do not repeat the completed Popcorn redesign or reopen every historically unchecked task as if it were a fresh defect.

## Planner scope for priority 1

Create an exact actor ledger across the island, starting with Skills/Popcorn's known progress host and extending only after confirming the pilot. Classify each instance:

| Actual role | Desired treatment |
|---|---|
| Hidden mission/progress/UI logic | Retain the working actor and typed references where feasible; use a supported hidden/nonphysical representation or another supported unobtrusive host configuration. Clear editor labels and logical folders improve maintainability. |
| Real player interaction | Keep its functional device; use an appropriate visible control and short action label. A small Replay/Return control, a mission-specific machine, or a readable terminal may be suitable depending on the actual action. Preserve approach and aiming clearance. |
| Passive decoration | Retain only where it helps explain the space; consider a service cabinet or workbench if that fits the existing scene. No fake interaction prompt. |
| Retired actor | Remove only after proving no live Verse/native bindings, children, shared assets or remaining responsibilities depend on it. |

Exact meshes and device classes are Planner feasibility questions, not selections made here. Prefer changing representation/configuration over replacing a stateful controller. Do not park everything underground as a substitute for checking collision, spatial behavior and ownership. Do not hand-edit binary actors or remove an actor based on its mesh/name alone.

Preserve all mission behavior, ordered references, progress, once-per-round badge guards, UI/travel/replay/Return interactions, round/attempt reset, current solo access and asset ownership. Exclude mission layout redesign, reward changes, new controls and global cosmetic swaps. Dependency review must include incoming native bindings, typed Verse fields, inherited components, attached children and any transform-dependent logic.

## Observable success and candidate acceptance

- Given the pilot in a clean cooked round, when walking and aiming through its former visible footprint, there is no irrelevant computer, false interaction cue or unintended collision; intended ground and nearby controls still work.
- Given the associated real lesson, when completing it, replaying, returning and starting a fresh round, progress and badge behavior match baseline; no missing device reference or double award occurs.
- Given a deliberately visible control, its presentation identifies the actual action and its result is visible/readable without audio. Record a first-time player's action and explanation rather than assuming comprehension from a successful click.
- Given saved/reopened editor state, actor identities, required bindings and supported settings match the approved ledger; compile if source changed, validate affected assets, and record cooked acceptance separately.
- Given a backend-only actor already hidden and nonphysical at runtime, do not claim a player-experience gain from changing its editor appearance. Document whether the remaining benefit justifies the effort.

Planner must resolve current cooked visibility/collision, available host/mesh controls, whether any parent or class defaults would affect unrelated instances, exact references and spatial dependencies, and the smallest safe rollbackable pilot. If invisibility/nonphysical configuration is already correct, limit the recommendation to editor organization or defer it. Produce a numbered spec, measured map/preview and reviewable delta before any approved map mutation; this brief does not authorize one.

Documentation-only verification: supporting local files and current source were read; no gameplay, asset, approval or acceptance records changed.
