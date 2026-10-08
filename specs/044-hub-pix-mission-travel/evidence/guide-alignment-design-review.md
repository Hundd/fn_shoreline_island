# Pix / Talk corrective alignment — Planner disposition

Date: 2026-10-08. Offline Planner review of sole editor owner's measured readback; Planner made no editor calls.

## Actual owner instruction and scope

Supervisor relayed the owner's current defect report: "also talk to Pix and Pix are far from each other". This requests correction of the approved R01 guide interaction. Original explicit human design approval remains recorded in ../approval.yaml, review digest `6f594395a6bbf4c927d6495c2349c084b2d1f753b580d96ec819597b83edfe7f`. This review is a corrective disposition, not a newly manufactured human approval.

## Measurements and exact corrective delta

Implementer measured current Pix actor pose (-100,2700,2412) cm, pitch/yaw/roll (0,180,0), unit scale. Its visible body center is (-100,2700,2474), head center (-100,2700,2549); no XY child offset. Full assembly bounds (-228,2572,2284)..(28,2828,2677) include the root helper. Talk is at (-100,2500,2500), yaw180, unit scale. The existing 200cm horizontal separation therefore appears in the actual visible figure, not merely an editor pivot mismatch.

Move ONLY the existing Pix assembly to (-100,2575,2412) cm, retain (0,180,0) rotation, unit scale and all 15 component local transforms. Exact translation delta (0,-125,0) cm. Horizontal separation from Talk becomes75cm; from the unchanged invitation center (-100,2450) becomes125cm. Do not move Talk, travel controller, trigger center, screens, field-note controls, paths or destination teleports. Keep approach radius125cm, re-arm200cm and existing lifecycle/mission/menu behavior.

Ground confirmation from Implementer: center and all four ±25cm footprint corners traced fromZ2450 down2200 returned distance38cm, actual surfaceZ2412. Center high ray2600→2200 returned188cm, also2412. Larger ±60cm corners return2412 west/2400 east, matching the original X footprint's12cm platform detail; no higher surface was found below the helper. Some high2800 corner rays hit existing helper/mesh geometry instead of the floor and are explicitly not floor evidence. Retain current baseZ2412; do not flatten, raise or edit geometry. These bounded rays are not a pawn capsule sweep or cooked appearance acceptance.

## Materiality judgment

This is a nonmaterial corrective alignment within the existing approved guide interaction envelope, directly addressing owner feedback under R01. It preserves the same character, control, spatial role, approach/re-arm behavior, walking routes, eight choices, mission entrances, rewards and learning goals. The measured full assembly follows its actor pose. No new design decision or renewed design approval is required for this exact delta. Material changes to controls, triggers, guide location outside the original area or route interference would return to planning.

## Artifact and digest handling

Keep the original approved spec.md, plan.md, map.yaml, generated review artifacts, manifest and approval.yaml byte-for-byte as the historical reviewed baseline. Do not update the approval digest to imply that the human reviewed new coordinates. The sibling guide-alignment-delta.yaml records the authorized bounded correction and supersedes only the original Pix pose for current implementation/as-built readback. Link this disposition and actual results from implementation.md and tasks evidence so planned-versus-actual behavior remains traceable. Original draft preview remains the original revision, not a claim of this corrected pose.

Implementer must record full post-move actor/component pose/bounds, preservation of Talk/trigger/scene identities, save result and clean package readback. Owner runtime proximity/readability/collision confirmation remains pending. The separately authorized content push is Supervisor/Implementer work; this offline review performs no session/push/validation/gameplay operation.
