# Cooked intro replay cancellation — 2026-09-27

FR-003/007, AC-07 partial evidence. One real connected player; no editor/gameplay mutation. Replay interaction was visible before testing (`timed-replay-prompt.png`). The bounded input/capture helper checked Fortnite foreground ownership, released E in finally blocks, and captured only that window. Raw measured event timestamps are in `replay-intro-timeline.json`; frame names describe requested times, while JSON records completion times including PNG capture overhead.

First E was released at 132ms. Knowledge HUD was absent in the first ~0.8s frame and present in the ~2.7s frame. A second E was pressed at ~3.2s and released at 3314ms, while the intro was still running.

- `timeline-second-0800.png`: the previous Knowledge HUD remains visible immediately after replay. Reset does not explicitly clear the shared HUD; do not claim this frame proves a newly emitted Knowledge message.
- `timeline-second-2900.png`: Knowledge explanation is visible; all color answer rings are still inactive.
- `timeline-old-deadline.png`: around 9.6s after first E (about 6.4s after replay), Knowledge remains visible and color rings are inactive. The canceled intro did not activate targets at its old 9s deadline.
- `timeline-new-deadline.png`: around 12.6s after first E (about 9.4s after replay), all three cyan color rings and labels are active; DATA is still 0.

This establishes cancellation of the old intro activation and subsequent restarted activation. Sampling supports the scripted 2s explanation start and 9s total intro but does not measure exact animation/HUD transition boundaries or the full 7s display continuously. Board readability and spectacle visibility were not assessed from this replay-button viewpoint. Rejection/moving-core/finale replay, badge retention, and multiplayer cases remain open.

Shutdown: native StopGame returned Completed and GetGameState returned CanStart. UEFN was left open. A later camera adjustment toward GREEN was captured as rejection-reset-aim.png, but no shot or rejection-reset interaction was performed; it is setup evidence only.
