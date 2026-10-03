# Blockout review — revision 1

Planning review; no human approval or gameplay acceptance.

`python tools/map_workflow.py check specs/036-teach-pix-a-route/map.yaml` passes with zero execution blockers and draft/non-executable status. Reviewed map, spec, plan, generated SVG/HTML source, marker table and implementation YAML; Supervisor independently reviewed the first spec/plan. Rendered visual review unavailable: the earlier browser file-URL request was blocked by security policy and was not retried or worked around. Structural/coordinate review cannot establish visual readability.

## Findings

- R-01/06: Correct new hangar and ground surface. Fresh route measurements support both bypasses, beyond the earlier firing-fan evidence. 18x16 m playground avoids preserved toolbox/stairs; 3 m west route remains open. Physical bypasses are 5 m wide, yielding 3.5 m of valid robot-center space after clearance margins. Swept route, pads and actual models still need cooked clearance checks.
- R-02/03: Physical demonstration remains the main input. Home/Test buttons only control recording/playback lifecycle. No list of route IDs or fixed intermediate waypoints substitutes for movement. Six-meter first strip allows two visibly different demonstrations; 0.5 m/corner polyline is an honest approximation. Footprint pool, limits and overlength behavior are explicit and bounded.
- R-04/05: Safety is deterministic authored geometry, not a claimed navigation adapter. Whole-segment checking and in-place yaw avoid corner cutting. Actual correct robot/crate readback plus deposit gate prevents success solely from a callback. Cancellable synchronous steps avoid late MoveTo completion after reset. Geometry and cancellation are material risks requiring targeted tests after implementation.
- R-05/06: The closure intersection guarantee is derived in evidence/feasibility.md: all continuous first paths must cross the future inflated slab. Both expanded-floor bypasses remain valid. The robot does not invent a detour; the player's second demonstration causes the changed result.
- R-06/07: Ordinary first route is13 m; bypass example24 m; no speed requirement or penalties. Limits allow detours and backtracking while rejecting jumps, unsafe chords, teleports and out-of-zone gaps with a specific message. Pausing is harmless. The 2–3 minute experience target is not yet measured.
- R-08/09: Single-owner shared props; actual active-character identity and cancel-before-reset required. The closure is visibly marked non-colliding safety space, not a trap. Character can always walk out; stepping through the safety area during recording rejects the demonstration immediately. Existing badges/loadout and adjacent missions are untouched.
- R-03/10: v1 preview has one playground, central closure marker, home/load, upper/lower example markers and a linear teaching lifecycle. It does not draw a player's unknown future polyline or detailed 3x6 m closure outline; the exact footprint is in settings and plan.md. No gameplay stage is falsely assigned to a forced route. Human review must read these together. Footprint density, instructional board visibility and model motion quality remain explicit acceptance checks.

## Outcome and next gate

No unresolved concept/geometry decision prevents presenting this concrete revision. New recorder/controller work is intentionally scoped, not hidden behind a pattern. Existing corridor contract contributes floor flow only; contract-only checkpoint was rejected because no respawn checkpoint is required. No new pattern/runtime support is falsely declared.

Need actual human approval of this preview and plan before implementation. No approval.yaml exists. After approval, invoke uefn-map-implementation, run readiness, implement and independently verify AC-01..11. Record multiplayer unavailable honestly if session capacity prevents a genuine second player. No gameplay task is checked off. Final game Unconnected/session Disconnected; no in-flight calls, editor open.
