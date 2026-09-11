# Byte Island MVP Implementation Plan

- Status: Proposed
- Specification: `spec.md`

## Approach

Build the MVP with Creative devices in the existing
`Content/fn_shoreline_island.umap`. Keep the first pass as a graybox and prove
the complete player loop before adding decorative assets. Use Verse only if
device-only testing cannot satisfy state isolation or exactly-once rewards.

## Island Areas

### Hub

- Player Spawner for the safe arrival point (`FR-001`).
- HUD Message or Pop-up Dialog for the first objective (`FR-002`).
- Billboard, icon, and landmarked path toward Path Garden (`FR-003`,
  `NFR-002`).
- Return destination for the completion teleporter (`FR-010`).

### Path Garden

- Four labeled interaction points: Water, Plant, Wait, Harvest (`FR-004`).
- Trigger chain that advances only for the expected next step (`FR-005`).
- VFX, light, prop motion, or sound response for each accepted step (`FR-006`).
- Reset signal for an incorrect step (`FR-007`).
- Tracker or Score Manager for a one-per-player Circuit Badge (`FR-008`).
- Completion message defining algorithm (`FR-009`).
- Teleporter or clearly marked path back to the hub (`FR-010`).

## State Model

The logical states are:

```text
ready -> water_done -> plant_done -> wait_done -> complete
  ^            incorrect input resets to ready             |
  +---------------- round reset ----------------------------+
```

Completion reward state must be tracked per player. Puzzle input state may be
per player or intentionally cooperative; `OD-004` must be resolved before the
final device configuration is approved.

## Device Naming

Use names that expose responsibility in the Outliner, for example:

- `hub_player_spawner_01`
- `hub_path_garden_objective`
- `sequence_water_trigger`
- `sequence_reset_trigger`
- `sequence_badge_tracker`
- `sequence_hub_teleporter`

## Validation Strategy

- Run each acceptance scenario in `spec.md` during Launch Session.
- Test once with one player and once with at least two players.
- End and restart a round to verify complete state reset.
- Run **Project > Validate Project** and record errors and warnings.
- Capture one screenshot of the hub direction cue and one of Path Garden.

## Risks

- Shared trigger state may allow one player to disrupt another player's
  attempt. Resolve `OD-004` before final wiring.
- A Score Manager may award repeat completions unless guarded by per-player
  tracker state.
- Color-only pads would fail accessibility requirements; every pad needs a
  readable label or distinct symbol.
- Editor-owned map and external actor files must be saved and committed as one
  focused change after playtesting.
