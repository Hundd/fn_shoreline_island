# Action audio reference probe — 2026-09-23

The Classifier's `execute_manual` and `execute_rule` functions distinguish an
actual correct category placement from invalid presses and wrong answers after
the boat reaches a dock. A temporary `@editable audio_player_device` and
`Play(input_player)` calls were added at those two success points. Verse
`BuildAll` returned zero diagnostics.

UEFN exposed the new `classification_audio` field as an
`audio_player_device` reference. A hidden Audio Player was temporarily placed
with Creative's 0.596-second `MoveTool_QuickBar_Add_Cue`, configured for
`Gameplay Only`, `Instigator Only`, playback at the instigating player, no
auto-play or looping, and volume 0.7. Its settings read back correctly.
However, `SetDeviceProperty` rejected that placed actor path as “not valid
audio_player_device” for the Verse field. The station's reference remained
unassigned. The station's existing HUD Message `ShowEvent` is not a safe
substitute: the same HUD also shows invalid choices and mismatch explanations.

The temporary Verse field and calls were removed, Verse `BuildAll` again
returned zero diagnostics, and the exactly named temporary Audio Player was
removed from the level; a subsequent actor search returned none. No existing
device binding, gameplay state, reward, or prior audio cue was changed.
T-021 remains open. Assigning a classic Audio Player to Verse through the
editor UI, or another verified action-gated route, is needed before wiring the
six action cues. Project validation and in-client audition were skipped at
the owner's request.

## Wrapper assignment follow-up

The placed Creative device must be assigned to the Verse field's generated
wrapper, not directly to the field through `SetDeviceProperty`. An existing
Button field's wrapper exposed `savedActor`, which read back its real placed
Button. A new Classifier `audio_player_device` field exposed the same
property. Setting `savedActor` to an existing Audio Player returned success
and read back the actor path, proving the reference mechanism.

A dedicated hidden `pix_classifier_match_audio` was then placed with
`MoveTool_QuickBar_Add_Cue` at volume 0.7, Gameplay Only, Instigator Only,
at the instigating player, no auto-play and no looping. All settings read back.
The `classification_audio` wrapper on each of four `signal_station_*` actors
was set to the dedicated device and each read back the exact actor path.
Verse source now calls `classification_audio.Play(input_player)` only after
the correct-category checks in `execute_manual` and `execute_rule`.

An intermediate build of the field-only source returned zero diagnostics.
The final build with the two `Play` calls reached `Verse compile starting` at
2026-09-23 10:47:06 UTC, then stopped advancing the editor log. The MCP
`BuildAll` call and a subsequent read-only `GetSessionStatus` call both hit
their five-minute timeouts; the editor process remained alive and responsive.
Thus the final compile, persistence of the four wrapper references, and save
of the new Audio Player are **not confirmed**. No in-client audition or
project validation was run. Once UEFN responds, inspect the build result,
save/read back all five affected actors, then continue the other five
action-specific cues.

## Recovered editor and saved Classifier cue

The owner confirmed a Save Content dialog and saved the changes. The editor
log then recorded an incremental compile success and `VerseBuild: SUCCESS --
Build complete` at 2026-09-23 11:01:55 UTC. MCP status returned
`Disconnected`, showing that editor calls were responsive again. All four
Classifier wrappers still pointed to the dedicated cue and the four station
actors plus `pix_classifier_match_audio` were explicitly saved via UEFN.
The earlier unconfirmed-build warning above is retained as the timeline, not
the current state. The cue still needs in-client audition and two-player
isolation checks when playtesting resumes.
