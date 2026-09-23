# Module-to-Core route reset guard — 2026-09-23

Scope: AC-023 / T-020, the first-award, player-local data-route animation.

Source inspection found that a badge completion spawned the route
asynchronously without carrying the current round token. If Round Begin ran
before that coroutine started, cleanup could finish first and the old-round
route could appear afterward. Closing a route also removed the canvas but did
not immediately invalidate its sleeping frame loop. Departure left route
entries in the journal's per-player maps.

The completion callback now passes the journal's round generation to
`show_data_transfer`. That coroutine refuses to add UI when its token is
stale. `close_data_transfer` now invalidates the frame generation while
removing the canvas, and departure prunes the removed player's route and
generation entries. Existing badge completions and the saved central Core
pulse remain the only triggers; no reward or progress write was added.

UEFN `VerseToolset.BuildAll` returned `returnValue: []` (zero diagnostics).
This is source/build evidence only. In-client visibility, round-reset,
respawn, departure, and two-player independence checks remain deferred at the
owner's request, as does the decision whether a physical world beam is needed.
The UEFN session API returned `Disconnected` / `Unconnected`; the editor was
left open and no playtest was started.
