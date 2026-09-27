# Green-core lifecycle and respawn follow-up

One real solo client; production hub spawns retained. Native state started CanStart. No other mission conversion or prototype-gate claim is made.

## Green binding correction

- Controller green.SavedActor pointed to FortStaticMeshActor_UAID_E89C2592D1B5C40403_1964750578, unlike the working BuildingProp cores. This was consistent with the cooked green sphere surviving green.Hide().
- Saved a checkpoint, placed BuildingProp_UAID_E89C2592D1B59C0503_1396988571 (label prompt_lab_green_core_blaster), assigned /Engine/BasicShapes/Sphere and the existing /fn_shoreline_island/PromptLab/mi_prompt_green material. Full transform: location(9000,-4600,2750), rotation(0,0,0), scale(2.5,2.5,2.5). Movable, NoCollision, non-damageable, not spatially loaded.
- Rebound only the new controller's green wrapper to that BuildingProp. Read back the binding, transform, mesh, material and collision. Old static actor remains at its original transform with bHidden=true as a rollback copy.
- UEFN displayed Custom Material Detected, recommending TextureData for performance. Accepted the existing material assignment; this notice is recorded rather than claiming warning-free authoring. Saved assets; full PushChanges returned Completed.
- Cooked game: GREEN visible initially (solo-green-restored-initial-2026-09-27.png), disappears after a real BLUE hit at1 DATA (solo-green-hidden-after-blue-2026-09-27.png), and returns on real replay while1 DATA remains (solo-green-restored-replay-2026-09-27.png). This passes the narrow hide/restore correction.
- Cooked replay interaction text is now REPLAY PROMPT LAB: solo-replay-label-2026-09-27.png.
- Approaching the platform requires jumping its edge from nearby; an early jump hit the edge and stopped movement. Entry/navigation usability remains open.

## Actual respawn

- Corrected an earlier test-input mistake: helper click uses DeltaX/DeltaY, not X/Y. The earlier assertion that Respawn was disabled was unsupported.
- Opened the menu, focused Respawn with correct coordinates, activated it with Enter and confirmed the observed dialog with A. Actual elimination/respawn animation captured in solo-respawn-start-2026-09-27.png.
- Player returned to the hub with100 health, one equipped Pulse Rifle, infinite-ammo display and the previously earned1 DATA: solo-respawn-retains-data-blaster-2026-09-27.png.
- Fired for1.5 seconds after respawn; shots appeared, ammunition remained infinite, health100 and1 DATA unchanged: solo-respawn-blaster-fire-2026-09-27.png.
- This verifies solo manual-respawn inventory and ledger retention. Multiplayer/late joining and protection against another player's fire remain open.

## Shutdown

StopGame returned Completed. GetGameState returned CanStart. UEFN remains open. No task covering broader requirements is checked complete from these narrow observations.
