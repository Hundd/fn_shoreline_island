# Debug Workshop Implementation Plan

- Status: Approved
- Specification: [spec.md](spec.md)

## Approach

Reuse the visual language of the robot tiles and cargo docks. Supply small authored programs with editable choices, not unrestricted source text. Keep expected outcomes visible during execution. Separate program execution and result comparison so wrong edits produce understandable demonstrations. Specify concrete programs and their valid repairs in this plan before coding.

## Delivery and verification

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.
