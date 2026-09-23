# Six action-specific AI sounds — 2026-09-23

Six separate, hidden UEFN Audio Players are saved as `Gameplay Only`,
`Instigator Only`, at the `Instigating Player`, with auto-play, hit playback,
and looping disabled. Each has a different short Creative-owned cue:

| Learning action | Actual Verse trigger | Saved Audio Player | Cue and duration |
| --- | --- | --- | --- |
| Pattern scan | First successfully moved robot tile of a valid owned Run | `pix_pattern_scan_audio` | `MoveTool_Highlight_01_Cue`, 0.379 s |
| Correct classification | Item reaches its matching category in manual or rule execution | `pix_classifier_match_audio` | `MoveTool_QuickBar_Add_Cue`, 0.596 s |
| Confidence increase | Accepted +10% adjustment or applied +20% repeated clue | `pix_confidence_clue_audio` | `MoveTool_Select_01_Cue`, 0.633 s |
| Error detected | Completed AI Error Lab run reveals a mismatch | `pix_error_detected_audio` | `MoveTool_Negative_01_Cue`, 0.827 s |
| Tool connection | An allowed AI Tool Lab Scan Object/Announce Result response link actually changes | `pix_tool_connection_audio` | `MoveTool_Granted_02_Cue`, 0.991 s |
| GrowPlant skill activation | First executable step of each GrowPlant invocation | `pix_skill_activation_audio` | `MoveTool_IncomingMessage_01_Cue`, 1.150 s |

Each source's new `audio_player_device` field points through its generated
`savedActor` wrapper to the corresponding placed Audio Player. UEFN readback
matched all 24 expected station references: four stations for each of the six
actions. A separate post-save read returned all six cue paths and confirmed
their gameplay-only, instigator-only, player-location, non-looping settings.
All affected station actors and Audio Players were explicitly saved through
UEFN. Verse `BuildAll` returned zero diagnostics after each source change.

The cues are supplemental. Existing on-screen results, badge trackers,
module-restoration audio, final Core audio, per-player state, and rewards were
not changed by these additions. No cue is bound directly to a raw Button
event, so unclaimed and blocked presses do not trigger it. A wrong but valid
scan or connection edit can still make its action sound because the scan or
edit actually occurred; the error cue is reserved for a detected mismatch.

Project validation and Play-in-Client were skipped at the owner's request.
T-021/AC-024 remain open until a human hears all six cues in context, checks
rapid repeats and wrong/retry paths, and confirms only the acting player hears
them in a two-player session.

The two table terms above were reconciled after the later Tool Lab and Skills
Lab presentation migrations. The underlying response and skill IDs remain
internal; this evidence update does not claim a new actor or runtime audit.
