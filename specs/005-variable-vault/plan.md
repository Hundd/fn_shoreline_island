# Variable Vault Implementation Plan

- Status: Approved
- Specification: [spec.md](spec.md)

## Approach

Use owned preview doors to prevent one player's opened door from solving another's puzzle. The door is visual feedback; it must not block travel or trap a player. Clamp adjustment values to 0-10 with clear boundary feedback. Store energy and authored start/target values separately. Use a dedicated Verse device and isolated station execution.

## Delivery and verification

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.
