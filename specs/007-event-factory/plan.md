# Event Factory Implementation Plan

- Status: Approved
- Specification: [spec.md](spec.md)

## Approach

Use two distinct labeled event buttons and visible chute/lamp props on owned stations. Store explicit event-to-response mappings per player; log the last event visibly rather than relying on timing or sound. Keep the factory completable with audio muted and without simultaneous inputs.

## Delivery and verification

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.
