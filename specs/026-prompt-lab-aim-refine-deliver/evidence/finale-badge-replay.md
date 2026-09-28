# Cooked finale cancellation, recovery and badge replay — 2026-09-27

FR-001/005/006/007, AC-05/07 partial solo evidence. One connected player; no actor, controller or Verse mutations. Fortnite-scoped foreground checks, bounded input with finally release, and game-window-only captures were used. Timeline JSON records measured event/frame completion times, including capture overhead.

## Finale cancellation

Separate BLUE/LARGE/LARGE BLUE and acquisition hits reached4 DATA (`finale-reset-reactor-aim.png`). A single80ms reactor press produced CLEAR DESTINATION! +1 DATA and visible Pix movement (`finale-reset-trigger.png`). E replay was released at1028ms after the timer began; reactor shot release was167ms (`finale-replay-timeline.json`). This reset occurred during delivery, before completion.

The restarted intro restored initial props (`finale-reset-intro.png`). At12s and16s after the shot, initial color choices were active, DATA remained5 and the return rail was absent from the same camera viewpoint (`finale-reset-initial.png`, `finale-reset-stable.png`). The canceled finale did not grant its delayed3 DATA, advance the new run, or restore its return effect during observation. Badge state immediately after cancellation was not queried, so absence of badge reward is not independently claimed from these frames.

## Recovery and repeatable DATA

The restarted run accepted the next four hits (`finale-recovery-blue.png`, `finale-recovery-large.png`, `finale-recovery-acquire.png`:9 DATA), then REACTOR (`finale-recovery-delivery.png`). Completion showed PROMPT MODULE ONLINE and1/8 modules online (`finale-recovery-result.png`). Replay preserved13 DATA (`badge-replay-balance.png`), matching5 retained DATA plus8 from the recovered run.

A further replayed run accepted four hits to17 DATA (`badge-repeat-acquire.png`) and REACTOR/delivery to21 (`badge-repeat-result.png`). The existing repeated DATA policy is verified: each complete solo run can earn another8 DATA; this is not a one-time DATA award.

## Badge ownership and respawn

After the two successful completions separated by replay, confirmed respawn returned to the hub with21 DATA and one infinite-ammo Pulse Rifle (`badge-journal-hub.png`). Opening the actual personal journal (`badge-journal-near.png` interaction, `badge-journal-after-repeat.png` result) showed `PIX AI CORE: 1/8 MODULES ONLINE` and `Prompt Lab: ONLINE`, all other modules offline/locked. This establishes retained Prompt Lab ownership and no increase to the module count from repeated Prompt Lab completion. The unchanged manager's `award_prompt_badge` guard sets tracker value1 only when `badge_earned` is false; source inspection supports this runtime result but is not substituted for it.

Multiplayer attribution/eligibility, late joining, last-participant playspace departure, full motion/outer-third coverage and first-time human feedback remain unverified. Client performance warning remains visible. StopGame returned Completed and GetGameState returned CanStart; UEFN remains open.
