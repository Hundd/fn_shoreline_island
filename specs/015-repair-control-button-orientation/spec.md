# Repair Control Button Orientation

## Requirements

- R1: Every interactable button in the `repair_1` control row must face the player approach side.
- R2: The change must preserve each button's position, scale, label, and device configuration.

## Acceptance scenarios

### S1: Player-facing controls

Given a player approaches the repair controls from the label side,
when they view the claim, slot, run, help, replay, and return buttons,
then each button's usable front faces the player.

### S2: Layout preservation

Given the corrected controls,
when compared with their original layout,
then no control has moved or changed scale.
