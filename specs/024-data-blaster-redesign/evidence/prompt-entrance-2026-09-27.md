# Prompt entrance cleanup

FR-007/010, one cooked solo client. The source's broader Prompt acceptance gate remains open.

- Native inspection found path_water_button, path_plant_button, path_wait_button and path_harvest_button still visibleDuringGame=true, although the game manager disables them. Set false on those four editor-owned devices and saved assets. Readbacks all returned false.
- Inspected hub_signs.verse: it refreshed the retired labels with SCAN BLUE CORE / CHOOSE THE CORE / FIND THE REACTOR / SEND TO PIX every3 seconds and called ShowText. Removed those four labels from the refreshed arrays and HideText them at OnBegin.
- Updated both Prompt entrance signs to direct players LEFT toward glowing targets/the arena. Preserved the permitted hub-return control and optional practice stations.
- BuildAll returned no diagnostics. Full PushChanges returned Completed. Local log recorded Finished basic user validation and FlowStep_RunLocalValidation Complete.
- Cooked hub screenshot shows the two new signs and no retired buttons or four-step labels: solo-prompt-entrance-clean-2026-09-27.png. A later capture after the3-second refresh interval still shows them hidden: solo-prompt-entrance-refresh-2026-09-27.png. Timestamp samples02:22:20 and02:23:23 UTC bracket the later capture.
- This verifies entrance text/visibility only. Platform-edge access, full board readability, feedback/enjoyment, return ride and cooperative lifecycle still require work. The seven other missions remain unconverted pending the prototype gate.
- End of run: StopGame returned Completed; GetGameState returned CanStart. UEFN remains open.
