# Owner verification handoff

2026-10-03: User explicitly instructed, "Finish task, I'll verify manually". Agent implementation work is closed out. This supersedes waiting for desktop unlock and further agent playtesting; it does not assert gameplay acceptance.

Saved delivery: Teach Pix a Route in the new hangar, dedicated controller/scene/marker assets. Verse build and five geometry tests pass, final native launch validation/cook succeeded, independent QA source/configuration checks found no confirmed blocking defect. See final-build.json, final-cook-completion.json and qa-report.md.

Owner checks:

1. Launch Session and approach HOME in the hangar. Use SHOW A ROUTE, walk to LOAD, then TRY MY ROUTE. Confirm footprints reflect your path and Pix delivers the crate.
2. Use TRY OLD ROUTE after the closure appears. Confirm Pix stops before it, keeps the crate and retains delivery 1.
3. Return HOME, show a new route around either side, then test it. Repeat with the other bypass and a different first demonstration.
4. Check unsafe routes, pause/backtrack, replay, cancellation, leaving and respawn. Confirm stale playback never resumes and existing Academy progress remains intact.
5. Check labels/footprints with sound muted, neighbor activity/spawn flow, and two-player isolation if available. Run Project > Validate Project. Full acceptance cases remain in spec.md AC-01..11.

Interactive cases and separate menu validation remain unverified. No requirement/task was marked passed solely because the owner took responsibility.

Supervisor's fresh native shutdown check at closeout: GetGameState=Unconnected; GetSessionStatus=Disconnected. UEFN left open; no editor mutations during closeout.
