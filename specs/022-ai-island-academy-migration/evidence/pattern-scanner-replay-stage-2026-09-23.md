# Pattern Scanner replay-stage persistence — 2026-09-23

Scope: AC-004 / T-004, post-badge Replay all in Pattern Scanner.

Source inspection found that the station's `on_next` wrapped its own
`challenge` from 3 to 1, but the shared progress device retained the
player's `challenge = 2` after the badge award. `release` did not modify that
progress value, and `on_claim` loaded it again. Thus leaving during Replay
all would return the player to challenge 3 rather than their selected
replay challenge.

After an accepted Next/Replay all action, the station now copies the selected
zero-based challenge into the existing `loop_player_progress` object for
that player. The color prediction and robot puzzle reset still happen as
before. The `badge_earned` flag, Tracker value, one-time award guard, other
players' state, and device references were not changed.

UEFN `VerseToolset.BuildAll` returned `returnValue: []` (zero diagnostics).
This is source/build evidence only. Leaving/reclaiming at each replay stage,
round reset, reward retention, and two-player independence still need an
in-client check when playtesting resumes.
UEFN reported `Disconnected` / `Unconnected`; the editor was left open.
