# Supervisor concrete design review — 2026-10-08

Decision: approve the bounded feature 045 pilot under the owner's explicit delegation to review the plan independently and then run Builder. This is Supervisor review under actual human authorization, not a claim that the owner personally viewed these artifacts.

Reviewed `spec.md`, `plan.md`, `tasks.md`, `map.yaml`, `scene-delta.json`, `review.md`, generated implementation/preview content, live actor/component surveys, measured mesh bounds, player-height before captures and real Neo asset images. The local HTML browser action was blocked because file URLs are disallowed; no browser workaround was attempted. Preview geometry and annotations were reviewed directly from SVG/implementation source, alongside the actual scene/asset images.

## Findings and disposition

- R01/R02: Neo cream paving, teal window frames, silver segmented columns and projecting cornices form a coherent campus kit. Requested player-height structural detail is present. The rejected stretched-wall option is absent from the final delta.
- R02/R03: Eighteen conduit poles at existing post centers preserve open lower bays. Pole height is near native scale. Their bases are wider than retained collision; this is an explicit visual/contact limitation for owner review, accepted for this decorative pilot. No new collision or low opaque wall obstructs the existing routes. Upper windows start at Z3300 cm; existing lesson staging and signs remain.
- R03: Exact eighteen component references specify only `bVisible=false` and `bHiddenInGame=true`; original BodyInstance/poses/meshes remain. New actors use NoCollision. Gameplay sources, devices, destinations, Pix and reward/reset logic are outside the delta. Builder must confirm these properties and preserve source hashes.
- R01/R04: The paving footprint is now explicit: 30 m approach plus 30 m through the hub; raised promenade is layered above the lower plaza at the measured existing surfaces. Skins span approximately 0.48–1.25 cm above original surfaces. Unique ground coverage is 1560 square meters. Builder must inspect actual seams and foot-level presentation in editor captures.
- R04: Independently counted 160 placements, 160 unique labels, four native mesh assets and eighteen render-only changes. The actual scene-delta SHA256 matches its map settings binding. Full transforms include rotation/scale. No actors are to be deleted, and no prefab is blindly substituted for gameplay content.
- R05: Independently ran the deterministic gate: PASS, zero violations, zero blockers, one `LEARN_NO_LESSON` advisory. Accepted because this is an architectural pass around existing lessons; adding a new learning room is outside scope. No gameplay test or runtime acceptance is claimed.

Approved manifest digest: `831baad77f35f33f01de98df94daeb09798317e925edb1431a054f89dc5ea530`.

Builder delivery requires checkpoint, exact scoped mutations, native asset/transform/collision readback, unchanged-source audit, affected-package saves, after captures and nonrunning session confirmation. Owner requested skipping tests; validation/cooking/push/gameplay QA and memory/runtime acceptance remain deferred. The pilot does not claim to finish the art pass on every island building.
