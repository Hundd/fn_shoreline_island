# Confidence Core: Check Before You Trust

Revision 4 player-review correction, 2026-09-30. The wallward solo layout was implemented and the player's latest cooked screenshot says it looks much better. Replay and Return appear to hang in the air, and the three circles remain after completion. Mount the two existing switches on the retained front rail and hide the finished targets until Replay or a new run. The four-action lesson, Pulse Rifle, badge and solo-only scope remain unchanged. Revision 1's cooperative draft is archived in `history/revision-1/`.

## Player experience and learning

One core, one bay, three stationary actions: **CHECK**, **COOL**, **RELEASE**. Prompt: **MAKE THE CORE SAFE**. Pix predicts `SAFE - 90% CONFIDENT`, but this is a claim, not a measurement. Check inside, discover heat, cool the core, check again, release. All four actions happen from the same spot.

| Step | Persistent evidence | Useful action/result |
|---|---|---|
| Check the claim | `Pix: SAFE, 90% confident` / `Outside: COOL; Inside: UNKNOWN` | CHECK reveals inside HOT; mark the original prediction `WRONG FOR THIS CORE`. |
| Fix the problem | `Inside: HOT - cooling needed` | COOL gives a brief cooling pulse; casing changes but board says `Inside: NOT RECHECKED`. |
| Verify the change | `Cooled; Inside: NOT RECHECKED` | CHECK takes fresh readings: outside COOL, inside COOL, `FRESH CHECK`. |
| Finish | Both fresh readings stay visible | RELEASE marks the core ready and awards the existing Confidence Badge. |

First-run target: 45-90 seconds; first shot within 10 seconds, without a timer. Discovery and visible feedback supply the payoff. No escort, moving aim or percentage arithmetic. Readings and percentage are authored examples, not a calibrated model or real reactor training. A new measurement is independent evidence; repeating Pix's claim is not.

## Requirements

- S-01 **Compact solo bay.** Required play stays on the valid first floor, local X=84..112, Y=0..35 m. The proposed firing point is local (100,20) on the beige/yellow strip, about 11 m from the annotated hub arrival; route width is 3 m and Return stays accessible. Preserve support footprint/neighbors. No island matchmaking change.
- S-02 **Stable actions.** Three stationary 1.5 m faces, 3 m apart and 8 m ahead of the proposed firing point: A CHECK, B COOL, C RELEASE. Words/icons, meanings and positions never change during play. CHECK takes fresh outside/inside measurements; COOL applies cooling; RELEASE finishes after verification. Reuse rifle/loadout. Core is a named display object, not a shooting target.
- S-03 **Evidence matters.** Success IDs [0,1,0,2]. Initial inside HOT contradicts confident SAFE. Cooling invalidates prior readings until a fresh CHECK. RELEASE refuses unknown, hot or stale inside state. Never add confidence percentage per clue or teach that confident answers are always wrong.
- S-04 **Immediate retries.** Accepted-action cue within 0.25 seconds; authored result within 1 second. Result stays at least 1 second; next choice arms after a minimum 1.5-second transition and 0.5-second quiet-hit interval. Held fire cannot auto-check the next step. Premature actions give a reason with no penalty/restart; first mistake gives the principle, second names the useful action. Repeating CHECK on a still-hot core confirms HOT without credit; do not label that a bad measurement. Hints/readings persist until another action/reset. Hit and finish effects should be clearly visible from the firing lane without flashing or hiding the evidence.
- S-05 **Lifecycle.** Auto-ready within 0.5 seconds of the sole local player's entry. No Start/Join, claim, team or spectator workflow. Only their in-bay hits advance. Leave, death/respawn, disconnect and round reset cancel callbacks and invalidate readings. Reentry/replay starts from the unverified claim; fresh-check flags cannot carry over.
- S-06 **Finish and progress.** Three milestones: discovered contradiction, verified fresh results, checked release. Three lights plus 0/3..3/3 text; cooling alone is not proof of safety. Commit all three retained energy_progress sections only on valid release, preserving tracker/journal/finale and badge guard. After the final hit cue, hide all three action rings and labels and disable their hit surfaces until Replay or a new run. Two ordinary buttons: Replay after completion and Return any time. Recap: `Check the claim. Check the change. Then act.`
- S-07 **Useful objects only.** One static core with a brief non-flashing cooling effect, one support if necessary, three targets, one evidence board, three lights, at most two practical lamps and one useful shelter. No carriage, conveyors, moving valve, scanner gantry, lift, shutters, dispatch route, pipe maze, dressing quota or prop-percentage requirement. Evidence persists and hints are automatic; no Pause/Repeat/Help buttons.
- S-08 **Clarity and safety.** Claim/readings/choices/core fit one forward view from the yellow firing strip. Keep the target row and core toward the back wall, with the main board above and behind the action labels; the middle label must not cover any evidence-board line from that firing point. Older readings are marked OLD/NOT RECHECKED. Text duplicates color/audio and icons render in cooked content. Action labels need strong contrast and must face the solo player on either side of the circles. Mount Replay and Return on the existing front rail at reachable, distinct positions; neither switch should appear to float over the floor or block a target. No unrelated Prompt Workshop request or persistent zero-data overlay should cover this bay. Hit surfaces have no occluding prop. Preserve valid floors and debug-labeled support; retire exact energy-owned obsolete presentation only after audit. Repair the previously measured 48 cm seam if reconfirmed; never add overlapping coplanar floor under retained support.
- S-09 **Real acceptance.** Build, validate, cook and test solo approach, premature release, repeated CHECK/COOL, hints, held fire, reset, badge/journal and routes. Record learning and enjoyment. Stop and verify non-running game; leave UEFN open.

## Given / When / Then acceptance

| ID | Requirements | Scenario |
|---|---|---|
| AC-01 | S-01/02/05/08 | Given hub arrival, when entering, then rifle/prompt are ready without a button, choices/core/readings are visible and shared access is safe. |
| AC-02 | S-03/04 | Given confident claim and unknown inside, when shooting RELEASE or COOL, then no credit is given and guidance requests evidence; CHECK reveals HOT and rejects this claim without generalizing about all confidence. |
| AC-03 | S-03/04/06 | Given HOT, when shooting CHECK again then COOL, then repeat confirms HOT without another milestone, and cooling changes appearance but explicitly requires fresh measurement. |
| AC-04 | S-03/04 | Given cooling finished, when shooting RELEASE, then stale/unknown evidence prevents success; CHECK supplies fresh COOL readings and RELEASE can now finish. |
| AC-05 | S-02/04/08 | Given muted audio, when making two mistakes or holding fire through feedback, then hints persist, edge hits register and no later stage gets accidental credit; moving aim/timed action is unnecessary. |
| AC-06 | S-05/06 | Given partial/completed play, when leaving during feedback, respawning, disconnecting, replaying or resetting round, then readings/generation reset and badges never duplicate. |
| AC-07 | S-06/08 | Given final release and saved scene, when checking journal/finale, buttons, actor counts and floor seams, then badge is recognized, Return works before/after finish, and obsolete machinery is absent without harming shared support. |
| AC-08 | S-03/08/09 | Given a first-time solo tester without coaching, when playing, then record time/confusion/enjoyment and ask why 90% was not proof and why another check was needed. Assess learning from their explanation, not completion alone. Extra testers are follow-up, not a hidden three-person gate. |
| AC-09 | S-09 | Given final production content, when technical checks and solo scenarios finish, then record actual results/unverified checks and confirm shutdown. |
| AC-10 | S-01/02/04/08 | Given the solo bay before and after completion, when standing on the yellow firing strip and viewing from behind the circles, then all action names and every evidence-board line remain readable without overlap; Return remains accessible; unrelated global HUD text is absent; and accepted hits/final release give visible feedback without obscuring the evidence. |
| AC-11 | S-05/06/08 | Given a completed solo run, when the final hit cue finishes, then all three rings and action labels disappear, their hit surfaces remain inactive, and the result board, progress and Replay/Return stay available; when Replay or a new run begins, then the same three targets reappear in their fixed places. Both switches rest visibly on the existing rail and remain separately usable. |

## Scope

One confident mistake demonstrates verification before/after intervention; this is neither accuracy estimation nor real heat physics. Multiple cores, random outcomes and variable confidence are future work. Changes to evidence sequence, decisions, action meanings or site require renewed review.
