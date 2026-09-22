# Align Repair Buttons to Return Reference

## Requirements

- R1: Every repair button except `repair_1_return_button` must use the same positional adjustment as the reference button.
- R2: The reference button must remain unchanged.
- R3: All repair buttons must retain their player-facing rotation and scale.

## Acceptance scenarios

### S1: Consistent repair controls

Given `repair_1_return_button` is the approved reference at Y=680 and Z=2476,
when the remaining repair buttons are adjusted,
then each has the same Y and Z coordinates while keeping its unique X coordinate, yaw -90 degrees, and scale 1.0.
