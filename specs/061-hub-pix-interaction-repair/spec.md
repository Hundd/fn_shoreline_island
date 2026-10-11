# 061 — Restore hub Pix interaction and collision

User requests repair of the existing hub Pix mission menu on approach and prevention of walking through Pix. User explicitly reserves game testing for manual work; do not launch a session, game, cook or push.

- R1: Restore the existing configured Pix travel controller at the current approved 060 location. Preserve actor identity, editables, eight destinations, menu behavior, owner guards, proximity radii and rewards.
- R2: Make the existing Pix solid through its main visible body meshes, preserving appearance and full transforms. Decorative face, antenna and text must not introduce a large invisible obstacle.
- R3: Save and record native compilation, class/reference/collision readback, disk persistence and stopped session state. Runtime acceptance remains manual.

Given a normal hub spawn and no active lesson/UI, when the player approaches Pix, then the existing mission invitation opens. Given Talk, then the same invitation opens. Given decline, walking beyond the existing 200 cm rearm area and approaching again restores the invitation. Given a mission selection/confirmation, then the same destination and earned progress are retained (R1, manual).

Given Pix, when the player walks into the body from front or side, then the player stops at the visible form and can walk around it (R2, manual).

Given saved repairs, when native Verse compilation and exact actor reload/readback run, then the configured class and references remain valid and physical body collision persists; final game is not running and editor stays open (R3).
