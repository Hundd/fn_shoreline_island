# Supervisor correction review

Owner requested inspection/correction of pillars related to `campus045_lab_north_post_11700`. Existing delegated Supervisor review and deferred owner walkthrough apply.

On 2026-10-09 Supervisor reviewed before-north-11700.png and confirmed the defect. Direction approved: preserve XY, rotation, XY scales and roof top; adjust only Z location and scale to extend the ten affected columns into measured terrain. Leave eight supported south columns unchanged. Original physics, 046 and source must remain unchanged.

Exact full transforms approved by Supervisor on 2026-10-09 under the owner's correction request and continuing delegated review. Frozen correction-plan.json SHA256: `ae57bc24b1d2585b5250b8cf797a1816b373afc0859bd0d8aecd596cccbadb67`.

Independent arithmetic check passed for all ten entries: XY positions/scales and rotations unchanged; mesh maximum Z remains at the original roof elevation; mesh minimum Z is exactly 2 cm below measured terrain minimum. Nine north columns and the eastern south column are the only changes. This restores the intended grounded appearance without redesigning the map. The historical map approval and delta remain intact; this dated defect correction supersedes only the ten listed vertical transforms. Native readback, preservation checks, saved packages and after images are required before completion. Runtime tests remain deferred per owner instruction.


Final Supervisor acceptance: independently audited ten exact transforms and unchanged complete mesh/material/physics properties; reviewed all three after images. Named north and row feet meet terrain; south-east foot extends through slab edge to terrain without visible air gap. Correction accepted for saved editor delivery; owner runtime walkthrough remains deferred.
