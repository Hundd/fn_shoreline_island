# Fresh journal retest - 2026-09-21

## Scope

- Solo Play-in-Client session on `/fn_shoreline_island/fn_shoreline_island`.
- Project compatibility version `42.20`.
- Focused regression check after the academy journal build fix.

## Build

- `VerseToolset.BuildAll` returned no diagnostics.

## Results

- PASS: a fresh player opened **My Restoration Journal** at the academy stand.
- PASS: Overview showed Garden, Loop, Signal, Energy, Debug, Event, Nursery,
  and Bot as **Ready to try**.
- PASS: the recommendation remained **Path Garden: grow supplies for the
  academy.**
- PASS: Work showed the same eight zones as **Not yet restored**.
- PASS: the visible tracker remained `0/1`; opening Work did not award progress.
- PASS: Close followed by reopening restored the Overview without a stale Work
  panel.

## Evidence

- [Fresh Work page](captures/work-fresh-2026-09-21.png)
- [Overview after Close/reopen](captures/overview-reopen-2026-09-21.png)

## Still open

- Earned contribution rows for Loop, Signal, Energy, Debug, Event, and Nursery.
- Numeric-neutrality checks against authoritative tracker values, beyond the
  visible unchanged `0/1` objective in this fresh session.
- Multiplayer and release validation.

The Session toolset did not expose a client log for this run, despite reporting
the match as running, so no client-log evidence is claimed.
