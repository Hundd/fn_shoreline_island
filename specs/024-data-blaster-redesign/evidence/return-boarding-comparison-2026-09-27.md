# Return boarding cooked comparison — 2026-09-27

Status: attachment and endpoint acceptance still open.

Started the current cooked game from the normal hub spawn. Walked to Prompt Lab without a temporary spawn fixture. Completed BLUE, LARGE, LARGE BLUE selection, moving acquisition and REACTOR; observed the8-DATA HUD and PROMPT MODULE ONLINE message with the activated rail. These bounded observations recheck the latest source cleanup and core-component collision build.

The added boarding ramp is present beyond the open module. Player stood on the ramp; multiple jump, backward-jump, interaction and simultaneous jump/interaction attempts did not enter a visible grinding state. Screenshot solo-return-boarding-ramp-unmounted-2026-09-27.png records the last attempt. No successful attachment or hub arrival claimed.

Revised the same ramp in the editor: center(12000,-6500,2566.6695), pitch23.6293777, scale(8.732125,3,0.4), retaining Cube/navy/BlockAll and the existing rail transform. This increases rise from200 to350 cm over800 cm horizontal run. Editor vertical traces fromz2900 report floor2410 atx11590, ramp2457.25 at11700, ramp2588.50 at12000. Thex12300 trace hits the rail at2778.60, so it does not prove the ramp's height below the rail; a below-rail trace is required. Full push pending. No Verse changes this run.

Full push completed. Below-rail trace at(12300,-6500) fromz2740 returned distance20.25, confirming ramp top2719.75 (about30.25 cm below the native rail start). Native readback confirms revised full transform. StopGame completed; GetGameState returned CanStart. UEFN remains open. Revised cooked attachment/endpoint test still required.
