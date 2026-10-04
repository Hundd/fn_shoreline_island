# Progress and navigation — Producer brief

Status: Proposed for planning; Producer handoff complete, implementation not approved.
Date: 2026-10-03
Source request: "clear path of progress", for example "3/5 games passed", and
game locations highlighted on the minimap; followed by "create a specs" and
"$uefn-producer finish this task".

Planning owner: continue [Feature 033](../../specs/033-progress-and-navigation/spec.md),
not a new feature. Its numbered requirements remain the source of truth. This
brief supplies product priorities and current dependency findings without changing
the existing draft's scope or claiming its schematic map is implementation-ready.

## Player problem and evidence

A child helping Pix should always know what they have restored, what to do next,
and where to go. A journal-only overview and conflicting starting directions make
that journey harder to follow. This is a source-based usability finding, supported
by the owner's explicit request; no new firsthand player study is claimed.

- **Observed in source:** [journal](../../Content/fn_shoreline_island_academy_journal.verse)
  already counts eight unique modules, recommends unfinished activities and checks
  the seven-module Agent prerequisite. Its full overview requires opening a panel;
  completion feedback is transient.
- **Observed in source:** [hub signs](../../Content/fn_shoreline_island_hub_signs.verse)
  direct players toward the older Prompt arena, while the journal recommends Workshop.
  [Workshop](../../Content/fn_shoreline_island_prompt_workshop.verse) and
  [Prompt arena](../../Content/fn_shoreline_island_prompt_blaster.verse) both award
  the same Prompt badge. Two activities must not appear to be two required modules.
- **Latest dependency evidence:** [Tool Lab verification, October 2](../../specs/032-ai-tool-lab-dock-rescue/evidence/2026-10-02-verification.md)
  records real shots failing to produce the expected hit/progression callbacks.
  Navigation cannot repair this gameplay defect. Resolve and reverify it in 032
  before claiming a complete navigable 8/8 journey.
- **Acceptance limit:** [Error Lab verification](../../specs/031-ai-error-lab-shoot-to-fix/evidence/verification-2026-10-01.md)
  leaves real-rifle gameplay and integration acceptance pending. Build/cook evidence
  must not be presented as successful playthrough evidence.
- **Hypothesis to test:** keeping the count and next destination visible will reduce
  wandering and journal interruptions. No measured improvement is claimed.

Affected areas: hub, all eight module entrances, both Prompt activities, personal
HUD/journal, connecting existing routes and Agent finale. Optional Discovery Trail
remains outside required progress.

## Intended experience and learning goal

Preserve the [roadmap's](../../plan.md) playful AI learning for ages 8–10: brief
instructions, visible consequences and safe retries. Wayfinding should help a
player reach the next lesson without revealing its answer or adding another task.

The persistent display says `3/8 modules restored`. Outside a game it names the
next destination and its marker number. Inside a game it shows the current short
action and local step count. Finishing updates the count and directs the player
onward. At seven modules, Agent unlocks; at eight, Pix is restored and exploration
or replay is offered. A module earns credit once per player per round.

## Recommended priorities

| Order | Change | Rationale and tradeoff |
|---|---|---|
| 1 | Persistent count, next destination, eight entrance markers plus Hub, and consistent Workshop start | Directly answers the owner's request across the whole island. Reuses existing progress; marker placement and personal pulse behavior still need planning. |
| 2 | Clear journal states, completion handoff and visible Agent unlock | Makes success and the next action understandable. Consolidate existing messages to avoid competing overlays. |
| 3 | Accurate local step/action reporting for each game | Helps within-game clarity, but touches heterogeneous controllers and carries more integration risk. Keep FR-008 in scope; implement after the shared presentation is stable. |

These are delivery priorities within Feature 033, not permission to drop its
requirements. Effort is provisionally moderate for shared presentation and more
uncertain for controller integration, pending Planner inspection.

Defer new games, custom illustrated maps, per-player map recoloring, forced linear
gates, new travel systems and cross-session saves. They add scope before the basic
journey is clear. Do not reduce the denominator to five merely to match the example.

## Scope, preservation and dependencies

Retain the eight badge identities, existing rewards, safe retries, optional
exploration, existing access rules and individual progress. Recommend Prompt →
Pattern → Classifier → Confidence → Error → Tools → Skills → Agent without creating
new prerequisite locks. Keep the older Prompt arena as an optional way to earn
the same Prompt module. Use words/numbers/symbols alongside color.

Base map markers identify places for everyone; personal progress belongs in the
HUD/journal. Only the current recommended destination should pulse for a player.
Hub is a location marker, not a ninth objective or required completion pulse.
Do not add an always-visible second island-sized checklist over gameplay.

Exclude room relocation, mission redesign, asset cleanup, reward changes,
matchmaking changes and publishing. Preserve the current per-round save policy;
"persistent HUD" does not mean progress saved across sessions.

Dependencies: trustworthy badge bindings, actual reachable entrance anchors,
map visibility at normal zoom, nonoverlapping HUD placement, lifecycle-safe
controller reporting, and completion-capable required games. Track Tool Lab's
failure in 032 and Error Lab's pending acceptance in 031; do not silently hide a
required module, lower the denominator or mark either validated to finish 033.

## Observable success and acceptance handoff

Use [033 acceptance scenarios](../../specs/033-progress-and-navigation/spec.md)
as the executable product checklist. Key outcomes:

- Fresh spawn shows 0/8 and the same Workshop start in HUD, signs, journal and map
  within the specified two seconds (AC-01).
- A first completion changes 2/8 to 3/8 and identifies the next entrance; replay
  and the alternative Prompt activity do not inflate progress (AC-02/03).
- From the hub, a player can identify and reach each named entrance using the map
  and guidance without verbal help; verify actual route access, not straight-line
  distance. Check Hub visibility separately from objective pulses (AC-04).
- Inside each game, the action and step count match real controller progression;
  leaving restores onward guidance (AC-05).
- Seven prerequisites unlock Agent; its completion produces 8/8 and clears the
  required destination (AC-06/07).
- Replay, respawn, round reset, out-of-order completion, player departure and
  two-player progress remain coherent, with no stale or duplicate UI (AC-08/09/12).
- Aiming, movement and reading local feedback remain usable; missing bindings
  never fabricate completion (AC-10/11).

## Planner questions and handoff

Resolve these through inspection rather than asking the owner to choose routine
implementation details:

1. Which exact walkable entrance and existing route should each marker identify?
   Replace the schematic diagram before requesting implementation approval.
2. Which existing indicators can be reused, and does the installed API isolate
   pulse activation/cancellation per player through respawn and round changes?
3. What actual step totals/events and ownership rules do the current controllers
   expose? Confirm current 031/032 revisions rather than relying on the older roadmap.
4. Where can the compact HUD fit alongside native trackers and mission feedback?
   Confirm readable map labels and numbers at normal zoom and compact displays.
5. Can a cooked end-to-end journey earn all eight modules? Track unresolved mission
   defects with their owning features; report feasibility changes back to Producer.

Continue P-01..P-04 in [033 tasks](../../specs/033-progress-and-navigation/tasks.md).
Retain its three open assumptions until evidence resolves them. Regenerate the
concrete review bundle and present it for human approval before implementation.
Producer recommendation and offline validation do not grant that approval.

## Completion evidence

This brief was reconciled against current 033 requirements, journal/sign source,
the roadmap and the cited latest mission evidence. No gameplay or editor asset
was modified. A supported GetGameState readback returned Unconnected during this
task; no playtest was launched and the editor was left open. Offline document-link
and map-contract checks are recorded with the feature review.
