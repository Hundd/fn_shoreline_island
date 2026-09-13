# Implementation plan

1. Extend the existing journal with an explicit Restored work page and Overview
   navigation. Reuse authoritative Garden/Loop state and the six stable tracker
   indices; keep the existing Overview geometry and Close hit target. The work
   page uses a taller text area with eight concise rows.
2. Add three field-observation devices on existing paths, with personal answer
   panels and fixed fixtures. Place and inspect their signs through UEFN.
3. Add a separately selected Nursery remix after normal completion. Reuse the
   evaluator and visible execution while keeping remix state/rewards separate
   from the normal challenge progression. Provide explicit exit and Replay.
4. Test each slice solo before broadening it, then verify lifecycle, concurrent
   clients, route presentation and release checks. Earlier milestone gaps remain
   tracked in implementation-status.md; this feature does not close them.

Initial slice: FR-004 journal presentation. No new actors or badge bindings are
needed. Observe fresh and earned reads, page transitions and unchanged tracker
values in Fortnite. Record source hash and evidence before checking tasks.

2026-09-12: The journal slice builds and passes focused solo fresh/Garden-earned,
Work/Back, Close and reopen checks. Final labels Work and Back fit the existing
210-pixel navigation button; Close retains its original position. See
[evidence](evidence/journal-work-2026-09-12.md). Other earned rows and lifecycle
remain pending. No actor changes were needed.

Observation slice: use one Verse controller with three buttons and three compact
billboards along the Garden, Lagoon and Lighthouse paths. A personal canvas asks
the fixed prediction, then shows the selected answer and explanation. All three
fixtures have two answers, Again and Close; no tracker or progression dependency
is exposed. Per-panel generations reject callbacks from replaced panels. Bind
the existing round-settings device and four spawners for cleanup, and remove
departed players from transient state. Board text remains shared and neutral.
Editor placement must check existing floor bounds and nearby actors before save.

Observation placement: Garden button (900, 2300, 2500), Lagoon button
(-950, 3450, 2500), Lighthouse cargo button (-1950, 1500, 2500). All use
existing floors near height 2400. Signs face the approach, offset behind their
buttons. The Lagoon spot sits beyond the existing route sign. Explicit editable
fields follow the project's native-device wrapper binding pattern. Seven new
actors and eleven savedActor references are saved and read back in
[the placement record](evidence/observations-placement-2026-09-12.json).

2026-09-12: Observation slice builds and passes focused solo both-answer,
explanation, Again, Close and walking checks at all three spots. Journal fresh
badge state and recommendation remain unchanged afterward. Explicit canvas slot
sizing fixes the small-background issue found in the first trial. See
[runtime evidence](evidence/observations-2026-09-12.md). Lifecycle, multiplayer,
earned-state retention and release checks remain open.

Nursery remix implementation: add a Remix / Normal button and label to each of
the four existing Nursery stations. The current owner may enter only after all
three normal challenges and the Nursery badge are complete. A station-local
remix flag selects two-bed evaluation and the authored definition
Plant, Water, Wait, Harvest; the caller starts Care, Care, Care. Normal selected
challenge and completion flags stay in the progress device unchanged. Remix
success displays the three-caller/nine-expanded goal without calling normal
completion or reward functions. Replay restores remix defaults. Remix / Normal
also exits during execution by invalidating its generation, then restores the
normal selected challenge. Hub, respawn, departure and round cleanup use the
existing release path. Add the new label after existing display indices to
preserve all current board bindings.

Journal lifecycle slice: subscribe to the existing bound Garden manager's four
hub spawners and round-settings device, plus playspace departure. Close personal
panels on spawn/round reset and remove departed entries. Give each rendered panel
a unique callback generation, so queued clicks from a closed or replaced page
cannot reopen UI or dismiss a newer panel. These handlers only manage journal
widgets; authoritative progress remains read-only. Verify page navigation,
respawn, round restart and subsequent opening in a live session before closing
the lifecycle acceptance task.

Observation lifecycle follow-up: use a controller-wide monotonically increasing
generation when closing/replacing panels. A departed player's removed state must
not cause a newly created panel to reuse an old callback generation. Clear all
transient observation states on round start after removing their widgets. Keep
the counter across round callbacks within the device lifetime. Test respawn with
an answer open, reopen/Again/Close, and gameplay restart with a question open.

2026-09-13 Bot ending integration: unchanged Bot sources passed all three normal
stages, Hub return and repeated journal Overview/Work/Back/Close visits. Bot
remained exactly 1/1 and its restored-work contribution fit the panel. No second
ending appeared during journal use. See [evidence](evidence/bot-journal-2026-09-13.md).
Post-Bot remix and other earned badge preservation still need coverage.
