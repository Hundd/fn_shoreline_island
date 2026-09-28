# Cooked moving sweep and peripheral acquisition — 2026-09-27

FR-004/005, AC-04 solo evidence. One connected player, unchanged gameplay/source/editor state. The first automated setup missed the replay prompt and remained at0 DATA; `coverage-prep-*` images and coverage-preparation.json are unsuccessful setup evidence, not objective acceptance. Live camera alignment was corrected (`coverage-replay-centered.png`), E interaction accepted, and separate BLUE/LARGE hits verified1/2 DATA. `coverage-largeblue-aim.png` precedes the accepted third hit.

## Handoff and moving sweep

After the third hit,21 frames were sampled at nominal0.5s intervals with no further keyboard/mouse input (`sweep-00.png` through `sweep-20.png`, moving-sweep-timeline.json). No moving ring was visible in early frames; the sole moving ring appeared after the2s handoff. DATA stayed3 during the sweep. Core visual and ring shifted together.

Screen-space cyan-bound measurements are in moving-sweep-screen-analysis.json. Moving-ring center progressed right from978.5px at capture completion2805ms to1037.5px at6313ms, reversed left to908px at10307ms, then began turning right. This supports the observed handoff and approximately4s between extrema. Capture completion includes about0.3s image-save overhead; pulse, projection and occasional occlusion affect bounds. The first movement leg starts at home rather than the opposite extremum. The unchanged source commands world-Y offsets+/-250cm with4s MoveTo legs, corresponding to5m between commanded extremes. Screenshots corroborate motion and timing but do not independently measure those world coordinates.

## Immediate peripheral hit and freeze

The live cyan ring was sampled from the fixed viewport, with no aiming or walking input. On the selected sample, bounds were x885..972, y468..575. Reticle(960,540) was at normalized elliptical radial distance0.80246, in the outer third of the visible ring. The original unmodified bitmap was preserved as moving-outer-immediate-before.png. Pixel acquisition completed at2561ms and firing began at2571ms, a10ms gap; release occurred2733ms. A requested80ms hold had162ms measured duration due scheduling. Raw evidence is moving-outer-shot.json. No further shots were sent.

`moving-outer-result.png` shows TARGET ACQUIRED, destination choices active and4 DATA; `moving-outer-frozen.png` about2.5s later shows the same stationary core and4 DATA from the same camera. This materially strengthens the moving outer-third hit/freeze check compared with earlier separate-tool captures. Exact server impact coordinates/timestamps are unavailable, so the claim is a promptly fired peripheral aim accepted in the cooked game, not an instrumented server collision coordinate.

The first sampling-helper invocation failed to compile its Drawing reference and sent no shot; the corrected helper stopped on errors and validated ring dimensions before the single shot. Helpers are local Saved cache work only. Other coverage/readability, multiplayer/departure, first-time feedback and manual validation limitations remain open. Performance warning remains visible.

Shutdown: StopGame Completed; GetGameState CanStart. UEFN remains open.
