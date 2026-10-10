# Next cycle: distinguish the optional Prompt activity

Status: proposed for planning after053 implementation; 2026-10-09. This is the current handoff and supersedes the cycle3 recommendation retained below.

**Recommend naming the optional shooting activity correctly in its active HUD header.** Show `Optional Prompt Arena` while that activity reports, while the main physical composition lesson remains `1 Prompt Workshop`. Preserve their shared module1 badge and8-module denominator. A player should know which activity they are doing without mistaking an optional alternative for another required lesson.

## Evidence and choice

The current [journal](../../Content/fn_shoreline_island_academy_journal.verse) derives every active header from `module_names()[state.module_index]`. Both [Workshop](../../Content/fn_shoreline_island_prompt_workshop.verse) and [shooting arena](../../Content/fn_shoreline_island_prompt_blaster.verse) report module_index0, so both display `1 Prompt Workshop`. They already have distinct existing source IDs: Workshop0 and arena8. The saved [049 stage3 capture](../../specs/049-prompt-lab-clear-start/evidence/diagnostic-core-overlap.png), inspected earlier by Producer, shows the shooting mission labelled `1 Prompt Workshop | Step 3/5`. This corroborates the source finding; no fresh playtest is claimed.

[033 spec](../../specs/033-progress-and-navigation/spec.md) explicitly makes the older arena an optional alternative sharing the Prompt badge. Current arena instructions say optional while preparing/completed, but active shooting instructions omit that context. Correcting the header keeps that distinction visible throughout play and preserves current product direction.

[053 implementation](../../specs/053-post-restoration-lesson-guidance/evidence/implementation-summary.md) now lets fresh activity instructions display at8/8. Keep that completed priority repair. Compared with more speculative onboarding copy, this naming mismatch is directly evidenced. Bulk auxiliary rollout and more target geometry still need their pending manual feedback to justify expansion; neither belongs in this change.

## Bounded Planner handoff

Change only the active activity display-name selection in the journal. Reuse current state.source and state.module_index: override the name only for the exact arena pair source8/module0. For Workshop0/module0 and every other pair retain the existing resolved module name. Keep the module-name lookup/freshness validity guard; unexpected source/module combinations must not acquire a new special identity.

Add one localized header string, provisionally `Optional Prompt Arena`. Do not globally rename garden_name, alter module_names, change report_activity signatures, add reporter state, change source IDs, or introduce a ninth module. Preserve count, badges, reward/handoff naming, next Workshop recommendation, marker1, journal/travel titles and mapping, controller instructions/steps,053 branch priority, handoff/freshness timing, report cleanup/tokens, travel arbitration, geometry and native devices. This is an activity header, not a change to the canonical module name.

Planner should document the narrow source-presentation exception in a new numbered spec/plan and prepare exact reviewable code scope. No map-layout revision or source mutation by Producer. Provisional small effort; no new dependency or native actor inspection expected unless source review reveals a mismatch.

## Observable success and limits

- Source cases: fresh valid source8/module0 renders `Optional Prompt Arena` with its current step/action; source0/module0 renders `1 Prompt Workshop`; all other or mismatched pairs retain their prior module name. Stale/invalid reports still take existing fallback paths.
- Preservation/diff review: only the active header selection changes. Native compile passes; native bindings and prior controller sources remain untouched. No sessions/games/cooking/push.
- Owner manual acceptance remains pending: enter the arena and observe its optional header through shooting and replay, leave and see canonical next-module guidance, enter Workshop and see its existing title. Check header fits the existing HUD with Step/total at actual display resolution and does not imply a second badge. Existing completion/8/8 handoff remains canonical.

The exact label's fit and player understanding require manual evidence; source identity alone cannot prove readability. All050–053 manual acceptance remains independent and open. This proposal does not expand that evidence into a global gate or claim those features accepted.

Producer used local source, existing spec/capture context and053 implementation evidence. Changed only this brief. Supervisor owns editor and shutdown; Planner/Implementer own subsequent numbered work.

---

# Progress and navigation — current Producer handoff

Status: proposed for planning, cycle3 of the owner's autonomous improvement loop.
Date: 2026-10-09.
Source request: compile successful work, ask Producer for the next high-level improvement and continue; gameplay testing remains owner-manual.

## Recommendation: keep lesson instructions visible during post-restoration replays

When a player with8/8 modules restored enters or replays a lesson, show that lesson's current step and action in the existing HUD. While they are idle, retain the existing all-restored invitation to replay or explore. Keep the visible8/8 count and brief completion handoff. No new UI, reward or progression system is needed.

This is one bounded, independent improvement for cycle3. It does not depend on accepting050 support-host behavior,051 target geometry or052 retry-hint readability. Those owner-manual checks remain open.

## Source evidence and player value

In [current journal source](../../Content/fn_shoreline_island_academy_journal.verse), `navigation_refresh` chooses HUD content in this order: active handoff; completed_modules>=8; fresh active lesson report; next destination. The all-restored branch therefore masks `navigation_step` whenever8/8 is true, even if a controller is reporting its current activity every0.25s. The current message invites “Replay a lesson,” but the HUD then withholds the usual step/action during that replay. This is a source-established display-precedence finding, not a newly observed cooked failure.

The existing `report_activity` state already stores source, module index, step, total, instruction, token and freshness. Current controllers report through it, including Workshop, Pattern, Classifier, Confidence, Error, Tools, Popcorn, Agent and the optional Prompt arena. Reuse that information rather than adding a new progress state or subscription. Optional Prompt still shares the Prompt badge; do not turn it into a ninth module.

Keeping the next action available helps children continue a familiar lesson after success, supporting experimentation and safe retries. It also makes the existing replay invitation internally consistent. No measured improvement in enjoyment or retention is claimed.

The latest [052 implementation](../../specs/052-prompt-retry-hints/evidence/implementation-summary.md) records its narrow controller-only feedback change, native compile success and pending manual checks; it does not touch this journal branch. [044 tasks](../../specs/044-hub-pix-mission-travel/tasks.md) preserve independent mission access; do not restore the historical Agent prerequisite described in the older brief below.

## Scope and preservation

Planner should resolve a minimal presentation-priority change in `fn_shoreline_island_academy_journal.verse`: existing active handoff first; then a fresh valid active lesson report; then all-restored guidance when no report qualifies; then the existing incomplete-module recommendation/unavailable behavior. Preserve the current valid-module/freshness checks and0.75s expiry, four-second handoff timing, action formatting, report ownership/token rules and state cleanup. Recheck current source before implementation rather than assuming line numbers remain fixed.

Preserve the count text, eight module identities, badge/reward state, module availability, `next_module`, marker pulse behavior, map markers, Core panels/lights, travel UI arbitration, journal panels, controller reports, reset/respawn behavior and all mission mechanics. Do not change every controller, add new widgets/timers, extend handoff duration, or make idle8/8 show a false next required module. The final celebration and its handoff still take priority while active; replay instructions resume after that existing interval.

This is a proposed narrow source presentation repair. Planner should document the small-code-change/map-geometry exception and numbered requirements; no layout changes or new map revision are intended. Exact implementation remains Planner/Implementer responsibility. Producer recommendation is delegated agent review input, not human design approval.

## Observable success and next handoff

- Source-review case: before8/8, ordinary handoff, fresh lesson, stale report and next-module behavior remain as before.
- Source-review case: at8/8 with an active completion handoff, the existing handoff remains; after it expires, a fresh valid report reaches `navigation_step` while count remains8/8.
- Source-review case: at8/8 with no report, an expired report, or an invalid module report, the HUD shows existing all-restored guidance. Reuse current validity semantics without inventing state corrections.
- Native Verse BuildAll passes with captured diagnostics; diff shows only the bounded journal presentation decision. No actor delta, sessions, games, cooking or push.
- Owner manual acceptance remains pending: earn eighth badge, observe celebration, replay a previously completed lesson and see advancing step/action with8/8 retained; leave it and see idle all-restored guidance; confirm a normal incomplete-round lesson still works. Repeat with a second lesson if practical to check shared presentation. Do not infer this from compilation.

Unknowns: actual owner8/8 lifecycle behavior and other UI overlap remain untested; this change must not claim full044 integration acceptance. Source review can establish intended branch selection but not child readability or whole-island completion quality.

## Alternatives considered

| Opportunity | Decision |
|---|---|
| Post-restoration active lesson guidance | Select: exact shared source precedence, reaches replay across modules, no geometry or new mechanic. |
| Distinguish optional arena title from main Workshop in HUD | Credible separate naming follow-up, but lower priority than missing active instructions after8/8; do not combine scopes. |
| More Prompt geometry or support-host rollout | Defer changes until current manual evidence clarifies their value. |

Local-only Producer review: read current journal/reporting call sites and052 implementation evidence. Changed only this existing brief; no source, assets, specs or acceptance records changed. Supervisor owns editor and shutdown.

---

## Historical 2026-10-03 brief (superseded where noted above)

The following is retained as feature033 design history. Its original unimplemented status and seven-module Agent lock are not current behavior; later033/037/044 decisions and the current handoff above take precedence.

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


