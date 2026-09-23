# Confidence clue action sound — 2026-09-23

The Confidence Core station source now has an editable `audio_player_device`
and calls `Play(input_player)` only after a valid positive adjustment changes
confidence, or after each +20% clue update in the repeated-clue challenge.
Unclaimed presses, solved state, wrong challenge controls, out-of-range
adjustments, and negative adjustments do not call the new cue. The integer
state, targets, door sequence, and badge logic were not changed. Verse
`BuildAll` returned zero diagnostics.

UEFN contains a dedicated `pix_confidence_clue_audio` Audio Player using
Creative's `MoveTool_Select_01_Cue` (0.633 seconds), at volume 0.65,
`Gameplay Only`, hidden, `Instigator Only`, playback at the instigating
player, with auto-play and looping disabled. Its saved settings read back.
The four live Confidence Core Verse actors—`energy_station_0` and
`energy_station_2_station` through `energy_station_4_station`—each have their
`confidence_audio.savedActor` set to that device. All four references read
back after explicit actor saves; the Audio Player was also saved.

No project validation or Play-in-Client session was run under the owner's
instruction to skip those checks. Before accepting AC-024, audition positive
clues, repeat-step timing, invalid inputs, boundary cases, and two-player
audibility.
