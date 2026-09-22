# Repair 0 Button Orientation

## Requirements

- R1: Every `repair_0` control-row button, including `repair_0_return_button`, must face the player approach side.
- R2: The change must preserve each device's position, scale, label, and configuration.

## Acceptance scenarios

### S1: Player-facing repair 0 controls

Given a player approaches the repair_0 controls from the label side,
when they view any control-row button,
then its usable front faces the player.
