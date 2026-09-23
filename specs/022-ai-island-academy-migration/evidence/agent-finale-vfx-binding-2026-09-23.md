# Agent Mode personal VFX binding — 2026-09-23

The earlier temporary hub VFX Spawner was removed because this MCP build could
not assign its classic device reference to a typed Verse field. A separate
direct-event route is available: the live Agent Badge tracker exposes `When
Complete`, and a placed VFX Creator exposes `SpawnAtPlayer`.

- Placed and saved `pix_agent_core_restoration_vfx` at the Pix Core hub. It is
  configured `Gameplay Only`, `Start Effects When Enabled = false`, `Bursts`,
  `Loop = Never`, a two-second loop duration, 1.5-second cyan sprites, 25%
  generation amount, and `Stick to Player = true`. The device properties were
  read back after editing.
- The live `fn_shoreline_bot_1_progress` Verse device's `badge_tracker`
  wrapper resolves to `fn_shoreline_bot_1_badge_tracker`. That tracker is the
  one whose value is set to one only after all three Agent Mission stages are
  complete and `badge_earned` was false.
- Added `fn_shoreline_bot_1_badge_tracker: When Complete` →
  `pix_agent_core_restoration_vfx: SpawnAtPlayer` through UEFN direct event
  binding. The binding was listed again after both actors were saved. No
  Verse source, badge value, journal count, gameplay device reference, or
  reward guard changed.

Epic's [Tracker device documentation](https://dev.epicgames.com/documentation/fortnite/using-tracker-devices-in-fortnite-creative)
describes `When Complete` as a device event. Its
[VFX Creator documentation](https://dev.epicgames.com/documentation/fortnite/using-vfx-creator-devices-in-fortnite-creative)
describes `Spawn at Player` as an effect at the triggering player's position
and `Loop = Never` as a one-shot effect. This supports the design choice, but
does not prove the local runtime outcome.

The owner requested that validation and playtesting be skipped. Therefore
whether the tracker event carries the expected player, whether the burst is
visible beside the existing eight-second personal UI overlay, and whether the
device cooks without warning remain open in-client checks. AC-009 and T-006
remain unchecked. The editor is left open and no session is running.
