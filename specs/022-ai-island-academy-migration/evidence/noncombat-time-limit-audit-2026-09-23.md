# Non-combat and time-limit audit — 2026-09-23

Requirement: AC-048 / T-045. This is source/editor evidence, not a runtime
no-timeout test.

- The loaded UEFN level has 1,325 actors. Its class inventory contains no
  Timer, Timed Objective, weapon-granting, sentry, guard/creature spawner,
  damage, or elimination device. The only apparent `skill_activation_audio`
  name match is an Audio Player, not a combat actor.
- A search of project `.verse` files found no Timer-device, countdown,
  time-limit, damage, weapon, elimination, or combat API reference. This
  supports the authored non-combat lesson structure but does not prove
  every in-client interaction is harmless.
- Saved Island Settings read `bAllowFriendlyFire = false`, `pickaxeDamagePreset
  = No Damage`, `pickaxeDestructionPreset = None`, `environmentDamagePreset =
  Off`, and both fall-damage flags false. These settings support the
  non-combat design independently of the device inventory.
- The live `IslandSettings0` actor read back `timeLimit = 300`,
  `roundTimeLimit = 5`, `roundTimeLimit_Override = false`, and one total
  round. Its elimination-to-end overrides and last-standing end condition
  are false. Epic's Island Settings documentation says an enabled five-minute
  Time Limit ends the round, while `None` imposes no time limit:
  https://dev.epicgames.com/documentation/fortnite/island-settings-in-unreal-editor-for-fortnite
- An editor-owned MCP write of `timeLimit = 0` returned success, but after
  saving `IslandSettings0`, a fresh property read returned 300 again. This
  field is apparently derived or rewritten. The write did not establish any
  change to the effective setting.
- The owner inspected the UEFN Details control: **Round > End Condition >
  Time Limit** is unchecked/blank. Checking it selects five minutes and does
  not offer `None`; they left it unchecked. This agrees with the saved
  `roundTimeLimit_Override = false`: the five-minute value is a dormant
  default, not evidence that a round deadline is enabled. No further Island
  Settings edit is needed for this configuration. The actor was explicitly
  saved after the owner's inspection; a fresh read still returned override
  false, round default five, and legacy `timeLimit` 300.

The prior suspicion of an active five-minute round limit is superseded by
the UI inspection and override readback. A solo and two-player no-timeout
check remains open under the owner's instruction to defer playtesting and
project validation.

## Round Settings follow-up

A fresh read-only live-level search found exactly one Round Settings actor,
`path_round_settings` (`Device_RoundSettings_V2_C_UAID_E89C2592D1B5C80003_1839433039`).
Its property schema exposes no time-limit override. Saved values read
`round_Override = false`, `bLastStandingWinsOverride = false`, and
`lastTeamStandingWins = -1`. Its `end Round` handler reports no instance or
default subscriptions, and `ListEventBindings` returned an empty list.
No authored Round Settings path was found that would add a deadline or
trigger a round end. This is editor-state evidence only, not a runtime
no-timeout test; no actor was changed.
