# Interaction clarity repair, 2026-09-28

Player report: Inspect and choice buttons showed text but no visible action. The player had not found or used Send to Pix.

Changed the workshop controller so its board, button labels, and persistent request HUD present the sequence as Inspect, choose WHAT/WHICH/WHERE, Send to Pix, then Connect. After each choice, the HUD names the next missing choice or points east to Send. Send immediately reports that Pix is fetching the core. Its action now moves Pix to the chosen core, carries Pix and the core together for 24 visible frames toward the selected destination, holds the result, and returns both props.

Enlarged and repositioned four saved billboard actors. Readback transforms: Inspect `(4550,700,2700)` scale `0.8`; Send `(7250,850,2750)` scale `1.25`; Connect `(9600,850,2750)` scale `1.0`; Replay `(10200,850,2650)` scale `0.7`. Readback texts were `1 INSPECT`, `3 SEND TO PIX`, `4 CONNECT`, and `REPLAY` respectively. Editor viewport capture showed the Inspect sign readable from the approach; cooked player-view readability remains unverified.

Validation: Verse BuildAll returned no diagnostics after the syntax correction; the later editor log reported `VerseBuild: SUCCESS -- Build complete`. SaveAssets returned true, PushChanges completed and the session entered Running. A runtime-error log query returned no matching entries. `python tools/map_workflow.py plan specs/027-prompt-workshop-redesign/map.yaml --ready` and `git diff --check` passed. Awaiting player observation of the full Inspect → choices → Send → Connect flow and Pix/core movement in the cooked client. Do not close T08, T12, or T13 based on editor evidence alone.

Session shutdown: StopGame returned Completed; subsequent GetGameState returned CanStart. UEFN editor remains open.

Player follow-up after the repair: “nice, i was able to play.” This confirms the prior discovery blocker is resolved in a cooked client. The report does not specify the visible Pix/core motion, the correct and incorrect outcomes, reset behavior, or multiplayer attribution, so the detailed acceptance tasks remain open.

The player subsequently requested “mark as done.” T14 records the reported playability issue as done. The broader feature acceptance tasks retain their separate evidence requirements.
