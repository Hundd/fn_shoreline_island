# Player experience review — feature 060

Date: 2026-10-10. Request: supervisor team review and minimal refinements to the existing eight-screen station bank, followed by implementation under the user's stated approval. This advisory report does not record approval or acceptance.

Host: Codex; dispatched worker model policy: `worker_model.codexcli = gpt-6.1-sol`; worker ID/task: `/root/player_experience_reviewer`. Offline only; no editor, MCP, UI or playtest actions.

Evidence inspected: [spec](../spec.md), [plan](../plan.md), [map](../map.yaml), [review](../review.md), [scene delta](../scene-delta.json), [ground traces](final-ground.json), [front elevation](../generated/station-elevation.png), [top-down preview](../generated/preview.svg), and review manifest digest `d85a0e3042b367377e2dc6ebfa5a088937c4c93c148d6507b8c910d8d09162bd`. Consulted project roadmap and map workflow. The elevation is schematic and status text illustrative; no first-time player observations or cooked readability evidence were supplied.

## Prioritized findings

1. **P1 — Arrival approaches the back of the information wall (strong geometry inference; usability untested).** The measured hub-return marker is at Y1500; structural wall occupies Y2231..2266, and the plan's widget readback establishes one-sided text facing +Y. A returning player therefore approaches from the wall's back. Example: heading toward the old screen bank can now reveal cream wall rather than lesson status, especially across its solid left half. The pass-through is approximately aligned with hub return and offers a plausible route to the display fronts and Pix, but the preview does not show this journey or camera view. Minimal correction: make front/back and the return → opening → reading-side route explicit in the review drawing; preserve the unobstructed opening and clear view toward Pix. Cooked QA must verify that an uninstructed arrival can find the opening and Pix, then read the bank without an awkward detour. If that fails, return the actual obstruction to the Planner; moving/reversing existing boards is outside R2.

2. **P1 — The front elevation may mirror the actual lesson order (coordinate inference).** Plan column X values increase from screen 1 at -1500 to screen 4 at -600. Looking from +Y toward -Y, screen-right is -X; therefore those preserved columns appear 4,3,2,1 from viewer-left to right, unlike the elevation's 1,2,3,4. Minimal correction: verify the real camera orientation and render a faithful front elevation; label the schematic orientation if needed. Preserve actual actor transforms and lesson IDs. Do not relocate screens simply to match the drawing. This is a preview fidelity issue, not an established runtime defect.

3. **P2 — High screens and short text demand a real reading-position check (supported scale, uncertain legibility).** Upper pivots are 4.5m above the adjacent floor, with tops about 5.55m high. A player directly under the passage cannot comfortably compare all eight screens; a player farther away may struggle with smaller WAITING/RESTORED text. Minimal correction: keep the navy border outside the measured widget quad and ensure the existing positive-Y walkway provides a usable standing/camera position. Verify all actual longest runtime labels and both statuses at normal gameplay FOV and daylight. The illustrative elevation cannot establish font size or contrast in Fortnite. Retain current copy and bindings unless a specific existing defect is demonstrated.

4. **P2 — Passage headroom is a minimum grounded on sparse samples (measured dimensions, untested capsule).** Opening X=-980..-480 is 5m wide, overlapping 4.70m of the existing X=-950..-350 rear route; lintel underside Z2642 yields 2.30m above highest sampled support Z2412. These values support walking feasibility but do not prove floor corners, camera clearance or continuous collision. Minimal correction: use the specified structural collision only and retain NoCollision on all decorative pieces. Verify both directions and both edges with ordinary movement; headroom must be measured against the highest actual surface along the opening. R3 requires walking without jumping, not unrestricted jump clearance.

## Journey and handoff

Arrival/return → locate passage and Pix → reach the +Y reading side → compare existing numbered statuses → choose existing travel/activity access. A mistaken approach to the solid wall should recover through the visible opening without getting caught. Returning after progress should reveal the same lesson's updated screen/light and retained rewards. The proposal adds no interaction or tutorial burden; avoid adding buttons, new signage systems, benches, roofs or a hub redesign to resolve unproven friction.

Supervisor/Planner: correct preview orientation and explicitly document the approach from the back before treating front readability as demonstrated. Implementer: preserve board transforms, bindings, IDs and the opening; do not run the stale `build_review.py` as an authoritative regeneration without reconciling it, since its wall Y2335..2370 differs from the current scene delta Y2231..2266. QA owns functional acceptance.

## Cooked observation checklist

- Capture spawn and hub-return views without first repositioning the camera; record whether passage/Pix access is visible and walkable.
- Walk return → opening → Pix and back; traverse both opening edges and the full rear route without jump or snag. Record actual ground/headroom at corners.
- Capture all eight real front faces at normal gameplay FOV, a practical reading position, and an oblique side view. Confirm order against preserved actor IDs, readable complete text, no bezel clipping/flicker, and visible mounts.
- Trigger an existing real lesson status update and verify the matching board/light, journal and reward state; check reset and solo flow under R5.
- Record any need to back away, turn unexpectedly, or search for the opening as observations rather than assumed child behavior.
- End the game/stop the session and verify it is no longer running; leave UEFN open.

No gameplay acceptance or enjoyment claim is made by this offline review.
