# Prompt Blaster controller and target staging

- Added the three-round shooting controller, 2-second spectacle and 7-second AI Knowledge intro, BLUE selection, LARGE modifier gate, large-core choice, slow moving-core acquisition and REACTOR choice. Wrong shots retain stage/reward and call shared reject feedback. Correct accepted shots increase a separate Data Energy HUD.
- Finale code synchronizes Pix/core delivery, spins the reactor, sequences editable lights/cable effects, raises the door, reveals the module, awards the existing badge to active room participants, and enables the editable return rail. Lights/cables/rail are still unbound; this is source implementation, not evidence of rendered behavior.
- Reset generation checks and a cancellation event stop old finales; movement uses a race to cancel when acquisition or reset ends its stage. Replay resets the shared room while retaining earned badges/Data Energy. A sole departing participant resets the room; round reset clears session Data Energy.
- UEFN BuildAll returned no diagnostics after correcting reserved-identifier/vector-assignment errors. The latest build includes the dormant old-controller handoff flag and shared-target cleanup on reactivation.
- Placed nine shared target Verse devices and nine large, vertical, invisible damage-only trigger surfaces. Bound surfaces, ordinary-hit audio, wrong-hit audio, stable IDs, and mission ID. Only LARGE uses the objective flag; answer choices have equal flags. Readback confirms all nine non-null target references in the new controller.
- Bound existing Pix, blue/red/green/small/large cores, reactor, module, door, main board, replay, spectacle, reactor/module effects, feedback, and existing badge manager. Added a room-entry zone that allows weapon fire and a separate Data Energy HUD on layer 8. The entry setter rejected legacy baseMeshVisibleInGame; intended current zone/fire settings were subsequently read back.
- All created actors and edits were saved. Actor paths are in `prompt-blaster-actors.json`.
- The new controller remains configured=false. Target visual cues, LARGE marker, reward-orb animation, room lights/cables, return route, and legacy-button handoff still need completion before enabling it. No gameplay acceptance or visual-readability gate has passed, and no task is checked complete.
- Game-state readback after work: CanStart. The editor remains open and no match is running.

## Shared Data Energy follow-up

- Replaced the Prompt-only ledger with `fn_shoreline_island_data_energy.verse`, one reusable per-player ledger/HUD and a queued five-orb delivery animation. Correct hits award their actual shooter immediately; queued visual deliveries do not block the next answer. Round reset cancels flights, hides orbs, clears queued deliveries and session totals. Departure removes the player's ledger entry.
- Built with no diagnostics. Placed `academy_data_energy_manager`, bound its meter, Pix receiver and existing Round Settings, then bound the Prompt controller to this shared manager. Saved all dirty assets successfully.
- The five orb prop fields remain unbound and the shared manager remains configured=false. The orb flight is therefore source implementation only. No runtime grant, target-hit, orb, finale, solo, or multiplayer acceptance is claimed.
