# Personal AI module restoration cue — 2026-09-23

## Editor implementation

- Placed and saved `pix_module_restored_vfx`, a VFX Creator actor at the hub.
  Actor asset: `/fn_shoreline_island/__ExternalActors__/fn_shoreline_island/9/B2/A2D7TBLRIKX79SD4USQD43`.
- Set the effect to start only from an event during gameplay, use a light cyan
  burst of 12 sprites, never loop, last 1 second with 0.8-second sprites,
  and stick to the player. The device's `SpawnAtPlayer` function uses the
  event instigator; it does not represent shared hub progress.
- Connected `When Complete` on each existing first-seven module badge tracker
  to that VFX Creator's `SpawnAtPlayer`: Prompt Lab (`path_badge_tracker`),
  Pattern Scanner (`loop_badge_tracker`), AI Classifier
  (`signal_badge_tracker`), Confidence Core (`energy_0_badge_tracker`),
  AI Error Lab (`debug_station_1_badge_tracker`), AI Tool Lab
  (`event_station_1_badge_tracker`), and AI Skills Lab (the actor labeled
  `Tracker`). The Skills Lab `badge_tracker` Verse device property was traced
  through its `savedActor` wrapper to confirm that otherwise generic label.
- Saved every affected tracker and the VFX Creator. A separate live read
  returned exactly seven incoming `When Complete` -> `SpawnAtPlayer`
  bindings and the saved non-looping settings. The existing Agent Badge
  tracker remains bound only to the separate finale effect.
- No Verse source, tracker target, device reference, reward state, or badge
  completion logic changed. No Verse build was needed.

## Open runtime check

Under the owner's instruction to skip verification, the effect has not been
cooked or seen in a client. Before accepting AC-011, test all seven first-time
badge completions, replay, and two-player independence, and confirm that the
effect is short, readable, and does not duplicate a reward.
