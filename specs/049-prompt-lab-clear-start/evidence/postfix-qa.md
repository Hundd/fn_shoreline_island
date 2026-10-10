# Independent postfix QA — revision 3

2026-10-09, `/root/gameplay_verifier`, host-resolved gpt-6.1-sol. Approved scope is only entry volume actor Z2600→2360. No gameplay/source/editor mutation was performed by QA. Final scoped result: AC-01/02 pass; AC-03 partially verified; AC-04 scoped readback passes with scene-diff limits described below.

## Cooked solo trials

Fresh StartSession completed, followed by StartGame. Initial player was grounded near Replay. A ready start is counted only after initial BLUE choices appeared; E presses interrupted before readiness are not counted.

| Trial | Trigger | Observed result |
| --- | --- | --- |
| 1 | Initial grounded occupancy near Replay, no E/jump | Optional journal/intro followed by BLUE choices; pass |
| 2 | Grounded Replay E #1 | Intro/reset then BLUE choices after a 10-second observation interval; pass |
| 3 | Grounded Replay E #2 | Intro/reset then BLUE choices; pass |
| 4 | Grounded Replay E #3 | Intro/reset then BLUE choices; pass |
| 5 | Grounded Replay E #4 | Intro/reset then BLUE choices; pass |
| 6 | Grounded Replay E #5 | Intro/reset then BLUE choices; pass |
| 7 | Grounded Replay E #6 | Intro/reset then BLUE choices; pass |
| 8 | Actual departure, normal menu Respawn, grounded hub→grass→arena-ramp approach | No jump/E required; Get ready then BLUE choices; pass |
| 9 | Post-completion grounded Replay | Get ready→Shoot BLUE after10s; active choices on minimap; pass |
| 10 | Second post-completion grounded Replay | Get ready→Shoot BLUE after10s; active choices on minimap; pass |

AC-01 final10/10 ready starts observed, zero observed failed starts. Timing observations establish choices after waiting10seconds, not a precise9-second stopwatch assertion. Source timing is unchanged per supervisor source comparison.

AC-02: standing/crouching and a stationary airborne jump followed by grounded landing kept Step1 and active choices. The pre-fix jump/landing reset did not recur. Horizontal travel out of the enrollment area changed journal to the regular Next Workshop entry, establishing actual departure/reset rather than relying on assumed bounds. Normal Respawn returned to the hub and the grounded approach recovered the optional mission. Captures: `postfix-qa-initial.png`, `postfix-qa-jump.png`, `postfix-qa-landed.png`, `postfix-qa-departure.png`, `postfix-qa-respawn-approach.png`.

## Sequence and reward observations

From the ramp-side firing position: BLUE→Step2/DATA1; LARGE→Step3/DATA2; deliberate red-ring shot produced “Not quite! Check the prompt and try another.” and retained Step3; large BLUE then produced Pix transformation/Step4/DATA3. After the handoff, the moving ring was visible at different observed positions; a stationary shot produced Target acquired/DATA4. A shot aimed at REACTOR produced the Pix delivery journal, followed by Prompt Badge earned and completed Step5/5, PIX AI CORE1/8 restored. `postfix-qa-wrong.png` and `postfix-qa-completion.png` preserve key results.

Five correct-hit transitions, safe wrong retry, moving target and Pix finale passed. Camera aiming uses supported drag, which also fires; attribution of every transient projectile to one exact target is limited. The explicit wrong trial used a stationary shot and observed retained stage. Active rings were visible from this firing position and did not prevent completion. Existing projection overlap near Replay remains deferred, not fixed or disproved globally.

Fresh completion's final DATA toast was missed; exact8DATA has not yet been independently captured. The first four cumulative balances1,2,3,4 were observed. Badge1/8 completion was captured. Post-completion Replay retention and one-time badge guard remain pending. West travel across the floor was possible, but a full west walking return to hub was not established; cyan course obstacles complicated the chosen path.

## Controls and limitations

Supported `press_key` has no hold duration; autorun across separate model/tool calls overshot nearby Replay. Bounded start→capture→stop within a single call now permits smaller movement. Two tool responses reported exactly: “user input was detected in this window; call get_window_state before continuing”. QA refreshed the view before further inputs. This is a tool detection, not proof of human takeover. Latest refresh showed the completed player looking down beside a yellow disk and white button; no further stale-coordinate input was issued.

## Scope verification and shutdown

Independent native scoped transform/settings/target binding readback remains pending. Implementer readback/save and supervisor41-source baseline zero-mismatch report are corroborating evidence, not substitutes for the pending native QA readback. Full unrelated scene-diff proof is not claimed.

Current last-known native state: Running/Connected. StopGame/StopSession and final readback still required. UEFN must remain open. No in-flight call at this checkpoint.


## Final addendum superseding pending checkpoints above

Trials9/10 each used the actual “E REPLAY PROMPT LAB” interaction, observed Get ready before waiting10seconds, then Shoot BLUE at Step1 with initial active choices visible on the minimap. `postfix-qa-trial9.png` and `postfix-qa-trial10.png`. After trial10, aiming at BLUE immediately produced Step2, “BLUE helped you choose. +1 DATA” and cumulative “9 DATA”, captured in `postfix-qa-balance.png`. There were no accepted hits between fresh completion and this BLUE hit, so known +1 and observed9 corroborate prior completion8 and retention through two Replays. This is an explicit inference rather than a captured8 toast. Badge remained1/8 during both Replay starts and BLUE progression. No second full completion was run, so the final duplicate-completion badge guard is source-corroborated, not independently exercised. Wrong-stage retained DATA is corroborated by final9 and known awards, not a contemporaneous wrong-shot balance toast.

Independent native entry actor transform is exactly location7500,-5200,2360; rotation0,0,-0; scale1,1,1. Dimensions6/12/3, boundsLow[-256,-256,0]/High[256,256,384], Gameplay Only, Any team/class, weapon fire and inspected native enter/exit/enable/disable fields match the baseline. All32 controller editable fields, including nine target references in original order and entry/replay references, compare equal against `live-survey.json`. Readback saved in `postfix-qa-native.json`. ObjectTools could list but not read Verse fields; correct DeviceToolset ListDeviceProperties/GetDeviceProperties on the placed actor succeeded. Wrapper physical bindings were not re-resolved, and target/other actor transforms were not exhaustively compared. Supervisor source evidence records41/41 unchanged against047; QA made no source edits.

AC-01 passes ten mixed ready starts plus normal respawn recovery. AC-02 passes the observed crouch/jump/landing and actual departure/reset cases. AC-03 is partially verified: five-hit progression, wrong retry, moving core/Pix, first badge and replay DATA retention passed with balance inference above; full west walking return and duplicate full-completion guard remain unrun. West travel across the floor was observed, but cyan obstacles complicated the chosen route and no complete return to hub is claimed. This is a QA coverage limitation, not a demonstrated new map defect. AC-04 passes the exact entry transform/native settings/controller preservation scope; no full unrelated scene-diff proof is claimed. Wider target visibility and first-time-player learning/fun requirements remain explicitly deferred.

Shutdown: StopGame returned Completed; StopSession returned; final native GetGameState=Unconnected and GetSessionStatus=Disconnected. UEFN remains open. Exclusive editor ownership released to Supervisor, no in-flight UI/native call. No implementation, task checkbox or approved-bundle edits by QA.
