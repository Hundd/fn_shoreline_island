# Harbor 3 start cue: implementation readback

- Date: 2026-09-22
- Map: `/fn_shoreline_island/fn_shoreline_island`
- Player count: one attempted fresh session.

## Saved editor result

Two persistent, two-sided Billboard devices were placed beside the Harbor 3
claim control (station ID 2) at X=-7990, Y=420:

1. `signal_2_start_here_sign`, Z=3050, text size 24:
   `SIGNAL LIGHTHOUSE` / `START HERE: PRESS CLAIM`
2. `signal_2_how_to_play_sign`, Z=2800, text size 20:
   `1. CLAIM THE HARBOR` / `2. READ THE CARGO LABEL` /
   `3. SEND IT TO ITS MATCHING DOCK`

Both devices are enabled during every phase, visible from both sides, use a
5,000-tile view distance, and were saved as World Partition actors. Verse
`BuildAll` returned no diagnostics after the placement.

## Session result and remaining check

A fresh session cooked and entered the running state. The requested Play From
Here location was ignored by UEFN and the client spawned at the island default
Path Garden point, so Harbor 3 visibility was not exercised in this session.
The session/game was stopped and the MCP connection returned to `Disconnected`.

**Pending:** walk the campus route to Harbor 3 in a fresh solo session and
visually confirm both signs can be read before the Claim control is used.
