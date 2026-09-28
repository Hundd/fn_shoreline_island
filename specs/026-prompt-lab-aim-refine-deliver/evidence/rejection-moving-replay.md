# Cooked rejection and moving-core replay — 2026-09-27

FR-005/007, AC-07 partial solo evidence. One connected player. No gameplay source, actor or device changes. Scoped Fortnite input verified foreground ownership; holds were bounded and released in finally blocks. Timestamp JSON records frame capture completion; nominal filename times are sampling requests.

## Rejection reset

`rejection-ready.png` shows the active color stage at 0 DATA, crosshair inside the GREEN answer ring. A bounded 80ms shot was released at160ms, followed by a camera turn to the nearby replay button and E released at380ms (`rejection-replay-timeline.json`). The input interval is consistent with replay during the target's authored 0.4s rejection reaction, though server processing timestamps are unavailable.

`rejection-reset-0600.png` shows accepted wrong-hit HUD, 0 DATA and the replay prompt. The wrong HUD remains briefly after reset. `rejection-reset-3600.png` shows the Knowledge explanation with color rings inactive; `rejection-reset-10500.png` shows the initial three cyan rings and SHOOT THE BLUE CORE HUD at0 DATA. Delayed rejection cleanup did not advance the restarted run or award DATA. Exact server-side overlap timing is not independently proven.

## Moving-core reset

After the above reset, BLUE, LARGE and LARGE BLUE were accepted using separate 80ms presses (`moving-reset-blue-hit.png`, `moving-reset-large-hit.png`, `moving-reset-largeblue-hit.png`). `moving-reset-active.png` confirms3 DATA.

The camera and character remained fixed in `moving-before-a.png` and `moving-before-b.png`, sampled about2s apart. The blue visual and ring both shift left between these frames, establishing live movement before reset. Replay E was released at2554ms (`moving-replay-timeline.json`). `moving-reset-intro.png` shows the restored initial color props without active rings and3 DATA. `moving-reset-initial.png` and `moving-reset-stable.png`, sampled about3.5s apart after the restarted intro, show the restored three color choices and3 DATA; the old moving acquisition did not resume or award progress during the observation.

This proves solo replay recovery from moving acquisition for the observed interval. It does not prove the complete5m sweep, exact4s legs, outer-third moving hit, finale cancellation, badge guard/retention, or multiplayer behavior. Those acceptance checks remain open. Client performance warning remains visible.

Shutdown: StopGame returned Completed; GetGameState returned CanStart. UEFN remains open.
