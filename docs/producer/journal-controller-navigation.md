# Journal keyboard and controller recovery

Status: proposed for planning; 2026-10-09, autonomous cycle5.
Source request: continue Producer-led improvements after successful compilation, with delegated agent review and no automated gameplay testing.

## Recommendation

Give the existing AI Core journal predictable keyboard/controller focus and a standard Back action. On opening either existing page, focus Close. Back from the Work page returns to the overview; Back from the overview closes the journal. The visible Close button always returns to the world. Preserve mouse interaction, text, layout and all progress/travel behavior.

This is an interaction/recovery improvement across the island's progress UI, independent of pending050–054 manual checks. It does not add another mission or continue changing Prompt copy.

## Evidence and product value

[Current journal source](../../Content/fn_shoreline_island_academy_journal.verse), `show_panel`, creates Work/Back and Close `button_regular` controls with OnClick subscriptions, then adds its canvas with InputMode.All. The source has no explicit initial SetFocus, menu input mapping or UI Back binding. Existing generation checks protect callbacks, and close/spawn/departure/round paths remove the panel. This establishes an explicit-support gap, not proof that native default focus fails or that a player is currently trapped.

[Current Pix travel source](../../Content/fn_shoreline_island_pix_travel.verse) already uses SetFocus, a guarded deferred focus pass, MenuNavigationMapping, an actual Back-bound interactive button and owned cleanup. [044 input correction](../../specs/044-hub-pix-mission-travel/evidence/implementation-owned-button-fix.md) records the installed API and [owner feedback](../../specs/044-hub-pix-mission-travel/evidence/owner-acceptance.md) narrowly confirms corrected click/gamepad operation. This is an implementation precedent to inspect, not evidence that the journal shares its full coverage.

[033 tasks](../../specs/033-progress-and-navigation/tasks.md) record actual journal open/close but leave broader controller/lifecycle acceptance incomplete. The new change should make the intended controller exit path explicit and consistent with Pix travel without treating every unrun case as a defect. [054 implementation](../../specs/054-optional-prompt-arena-header/evidence/implementation-summary.md) confirms the current journal checkpoint compiled; preserve its header repair and053 priority.

For ages8–10, the progress screen should be easy to leave using the same familiar Back action as the travel screen. Initial focus on Close provides a safe, visible starting action and avoids accidental page changes. Actual discoverability and input behavior still need owner testing.

## Bounded Planner scope

Work only on the two existing journal pages and their input lifecycle. Reuse installed UI APIs and the current button styles/layout where supported. Resolve whether `button_regular` directly supports the needed binding; do not assume parity with travel's raw Temporary/UI.button. If a wrapper is required, propose the smallest supported construction and review its click/focus behavior. Do not import the travel menu wholesale or replace the journal's content.

Define one authoritative Back action per page. On overview it invokes the existing close path; on Work it invokes the existing return-to-overview path. Preserve visible Close behavior on both pages and visible Work/Back page-button behavior. Bind the actual supported UI Back action, not guessed raw keys. Do not promise a specific physical key or controller button until the installed mapping is verified.

Set initial focus to Close after panel registration through the supported sequence. If deferred focus is necessary, guard it with current player/panel generation so closing, replacing, respawning or handing off to Pix cannot reclaim focus for a stale journal. Keep mapping ownership/subscriptions paired with close and existing round/spawn/departure cleanup. Preserve journal/travel mutual exclusion: opening journal closes travel first, and explicit Talk may close journal. Never remove a mapping belonging to the other modal.

Preserve all text, sizes/positions, page content, badge identities/count/rewards, current activity HUD,053/054 changes, native actors, mission controls, progress reset and travel destinations. Exclude new navigation pages, progress shortcuts, controller-specific graphics, global input refactors, reward changes and geometry. Provisional small-to-moderate source work; installed styled-button capability and input ownership are the main feasibility questions.

Planner should create a numbered spec/plan with exact API/callback/cleanup scope and review the source-only boundary. If supported bindings require a material UI redesign, return that constraint rather than silently expanding the feature.

## Success and verification

- Static lifecycle review demonstrates exactly one Back path for each page, current-generation checks for deferred focus/callbacks, and owned resources released on Close, page replacement, travel handoff, spawn, round reset and departure. Unrelated travel state and reports stay untouched.
- Native Verse compilation succeeds with actual diagnostics. Source diff and current loaded source confirm the bounded implementation. No session, game, cook, push or gameplay input is authorized.
- Owner manual: open journal with controller, see Close focused, move to Work and activate it, use Back once to overview and again to world. Repeat with keyboard and mouse; visible Close works on both pages. Verify focus/readability and no accidental world action from the same dismissal input.
- Owner manual: close/reopen quickly, switch journal↔Pix, respawn/reset with a page open and confirm input returns with no stale focus or duplicate Back response. Progress/count/rewards and053/054 HUD behavior remain unchanged.

These manual cases remain pending until real evidence. Compile and explicit bindings do not establish native traversal, physical-key mapping or focus visibility in a cooked client.

## Alternatives considered

| Opportunity | Decision |
|---|---|
| Journal focus/Back recovery | Select: island-wide interaction, explicit source gap and installed local precedent, bounded existing UI. |
| More journal/Prompt wording | Defer: recent053/054 already addressed demonstrated guidance identity/priority gaps; another wording tweak is lower value. |
| Full new lesson or geometry redesign | Defer: greater regression and design uncertainty, with no stronger current evidence for a specific replacement. |
| Bulk auxiliary presentation rollout | Defer until the existing pilot's manual behavior informs extension. |

Local-only Producer work: reviewed journal/travel source and cited feature evidence; created only this brief. No editor, source, assets, specs or acceptance records changed. Supervisor owns editor/shutdown and subsequent worker dispatch.
