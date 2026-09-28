# Replay and respawn observations — 2026-09-27

Cooked solo test, one connected player. StartSession used Play From Here at world (7600,-5450,2520), yaw90, pitch-15. The initial scene already showed the rail effect despite 0 DATA; this does not establish a pristine room reset. No gameplay source or scene mutations were made during this test.

## Observed results

- Walking forward exposed the actual `REPLAY PROMPT LAB` interaction (`replay-focused-close.png`). Pressing E cleared the visible rail effect (`replay-accepted-intro.png`); after the introductory interval, the three color rings were active (`replay-board-observation.png`). Exact 2s/7s timing and immediate intro text were not captured.
- An initial shot at a decorative blue sphere hit the wrong active surface: wrong feedback and 0 DATA remained (`replay-earned-data.png`). This is not a successful blue hit.
- Re-aiming at the blue answer ring and firing an 80ms bounded press produced BLUE success and +1 DATA (`replay-earned-data-b.png`). The next capture confirmed the balance was 1 (`replay-with-data-prompt.png`).
- Returning the camera to the actual replay control and pressing E preserved 1 DATA and the single Pulse Rifle (`replay-retains-data.png`). The following menu capture shows the color rings active again (`respawn-menu.png`). This proves replay from the post-BLUE stage restores the initial color stage while retaining DATA; it does not prove cancellation during intro, rejection, moving-core or finale states, nor badge retention.
- Selected the visible Creative Options > Respawn control and confirmed its dialog (`respawn-confirmation.png`, `respawn-start.png`). The player returned to the normal hub with 100 health, 1 DATA and one infinite-ammunition Pulse Rifle (`respawn-result.png`). This is a solo respawn result, not multiplayer attribution or late-join evidence.

The client performance warning remained visible. V01–V03 remain open for their outstanding acceptance checks. Native StopGame returned Completed; subsequent GetGameState returned CanStart. UEFN remains open.
