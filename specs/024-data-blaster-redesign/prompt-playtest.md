# Prompt Lab acceptance run

Status: partially run in a cooked solo client. See evidence/solo-recovery-2026-09-27.md for bounded observations and screenshots. Login and cooking are working. Cooperative and full lifecycle/readability acceptance remain open; editor captures and successful Verse compilation do not satisfy those checks. Record build/cook identifiers, player count, results, screenshots/capture paths and warnings in evidence before checking feature tasks.

## Preconditions and expected rewards

Use the enabled feature-024 controller and Data Energy manager with the legacy use_blaster_mode flag true. All 16 legacy primary buttons must be hidden; replay remains available. The nine target IDs read back as 0–8, reward_value=1 for each, and objective=true only for target 3 (LARGE).

One fresh solo sequence has five accepted hits: BLUE, LARGE, LARGE BLUE, moving LARGE BLUE, REACTOR. Expected totals after those hits are 1, 2, 3, 4, 5 DATA; the module finale adds 3, producing 8 DATA. Wrong and inactive hits must not change the total. Five animated visual orbs represent a reward delivery; their count is separate from reward_value.

## Solo sequence

| Check | Action | Required observation | Result/evidence |
|---|---|---|---|
| FR-001/004 | Start a fresh game from the hub. | Exactly one usable Data Blaster is equipped automatically; HUD starts at 0 DATA. Fire continuously beyond magazine capacity, check reload, player/environment damage and item dropping. | Partial solo: equipped Pulse Rifle,0 DATA and five-second unlimited fire observed. Health stayed100 and no surrounding destruction observed. PvP/drop checks remain open. |
| FR-001/009 | Respawn, then join a game already in progress. | Each player receives the same blaster; unlimited ammunition and protection remain active. Existing player's Data Energy survives respawn; a fresh joining player sees zero. | Solo manual respawn passed: hub return, one equipped infinite-ammo blaster,100 health, retained1 DATA and usable fire. See evidence/green-core-respawn-2026-09-27.md. Late join/multiplayer remain open. |
| FR-005/009 | Enter Prompt Lab, including a Play From Here spawn already inside its entry zone. | Intro begins without requiring exit/re-entry: approximately 2 s spectacle, then 7 s AI Knowledge idea/example, then the first shooting choice. | Partial solo: normal approach/platform entry and readable full Knowledge HUD observed. Exact timing and occupant initialization acceptance remain open. |
| FR-002/003 | During the first round, shoot RED or GREEN, then immediately shoot BLUE away from its center. | Wrong shot gives immediate sound, sparks/grey ring/X feedback with no penalty; BLUE remains available and succeeds without precision aiming. Equal cyan answer cues do not reveal correctness. Total becomes 1. | Partial solo: RED rejection/BLUE retry and equal cyan choices observed. Grey/sparks/sound timing and forgiving edge-hit check remain open. |
| FR-006 | Inspect the two blue sizes, shoot LARGE, then choose SMALL BLUE before LARGE BLUE. | LARGE alone has the orange objective cone. Prompt adds LARGE; small blue is a forgiving wrong answer. Large blue advances the round. Totals become 2 then 3. | Solo SMALL BLUE rejection captured a grey ring with2 DATA and100 health; separate LARGE BLUE retry advanced to3 DATA. See evidence/small-blue-retry-2026-09-27.md. All board variants and sound/X timing remain open. |
| FR-003/006 | Watch the moving large blue core; try a destination before acquiring it, then shoot the moving core away from its center. | Ring, label, particles and generous hit surface follow the core. Early destination shots do nothing. Acquiring the moving core stops its motion and enables three destinations. Total becomes 4. | Partial solo: stationary-camera screenshots show motion; separate acquisition froze core and activated destinations at4 DATA. Early-destination, edge-hit and complete cue-follow checks remain open. |
| FR-002/006 | Shoot SCANNER or STORAGE, then REACTOR. | Wrong destination does not undo acquisition or remove rewards. Correct destination starts delivery and total becomes 5. | Solo SCANNER rejection and REACTOR recovery observed; captures in solo-recovery evidence. STORAGE not separately tested. |
| FR-004/007 | Observe the entire finale. | Core/Pix delivery and beam are visible; reactor spins; four lights and cable effects activate sequentially; module opens; existing Prompt badge is awarded once; bonus makes 8 DATA; return rail becomes usable and reaches the hub safely. | Partial solo: Pix delivery, module completion/badge message and8 DATA observed. Each finale component, badge duplicate guard and ride endpoint need separate evidence. |
| FR-002/009 | Shoot completed/inactive targets and replay the room. | Completed shots cannot duplicate stage rewards. Replay restores props, door, cue states and motion, retains the already-earned badge/Data Energy, and begins the intro. | Partial: replay after BLUE restored initial core visuals/Knowledge intro and retained1 DATA. Completed-target, door/motion/finale and badge cases remain open. |

## Cooperative and lifecycle checks

Use two players. Both enter the room; alternate correct shots and attempt simultaneous hits. The room advances once per accepted stage. Only the actual shooter receives each hit reward; each active participating player receives the 3-DATA finale bonus. A player who never entered the room receives no Prompt badge/bonus from another player's completion. No player receives duplicate badge progress.

Replay during intro, wrong feedback, moving-core acquisition and delivery. Reset the round during the finale. Have the sole participant leave during intro and delivery, then enter again. Confirm delayed work cannot reopen the module, move props, activate the return rail or award stale rewards after reset. Round reset clears the HUD to zero. Join/leave during cooperative progress must preserve shared stage and accurate attribution. Record each case separately; status: not run.

## Phase C player feedback gate

Observe a player using normal engagement distance and ordinary aiming. Ask the source document's seven questions: can they immediately tell what can be shot; hit without precision aiming; feel satisfying hit feedback; recover instantly from a wrong shot; understand the lesson; see gameplay demonstrate it; and enjoy play while ignoring the explanation? Record their observations and concrete fixes. This gate remains unpassed until observed evidence supports it; compilation and editor inspection are insufficient.

## End of run

Run Project > Validate Project and record remaining warnings intentionally accepted. Stop any running game with End Game/StopGame or stop the session. Read back CanStart or Unconnected and leave the editor open. Only then record corresponding validation/playtest tasks as complete. Convert the seven other minigames after the Prompt gate passes.

## Latest collision/boarding comparison

See evidence/inactive-surfaces-return-boarding-2026-09-27.md: below-arena parking allowed LARGE BLUE selection, moving acquisition, REACTOR and8-DATA completion from a normal engagement position. The earlier retired GREEN NoCollision change also allowed LARGE near its previously failed firing position. Return attachment failed from the floor; boarding ramp added with native geometry checks, awaiting cooked attachment/endpoint test. Five core visual components corrected to explicit NoCollision after native inspection. These bounded successes do not pass the complete Prompt/cooperative/player-feedback gate.

Return boarding comparison: cooked ramp present and player stood on it, but jump/interaction did not attach. Same ramp revised to350 cm rise over800 cm run; attachment and hub endpoint acceptance remain open. See evidence/return-boarding-comparison-2026-09-27.md.
