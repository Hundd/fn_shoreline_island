# Full production revision 039 — concrete review

2026-10-04. Changed layout awaiting actual human review; latest “go for it” authorizes production planning/intended replacement, not approval of this unseen geometry. Current production scene remains unchanged. `map.yaml` embeds the entire `production-scene.yaml` allocation/binding manifest in controller settings, so generated review digest covers the proposed scene contract. Original layout retained at `evidence/original-reviewed-map.yaml`; original digest `8af651188df0764becfce1f677b1b72e3486756bff77712da9c7fa4b0bccf7b5`. No new approval recorded.

## Material old/new crosswalk

Original northbound layout had a starter physically inside protected planter_wing_4, and approached protected north coral. It is superseded by this horizontal loop, **not** by the provisional200cm-gap draft. Shared shell remains unchanged. All seven closest-edge gaps are100cm, within actual fixture ceiling120cm. Two routes have equal branch travel640.31cm center-to-center and identical sequence/reward semantics. Every successful path has five actual jump landings. Runtime airborne token makes jumps essential even if an engine movement mode can cross a gap without jumping; do not claim gaps physically force jumping before cooked QA.

Local meters, origin worldcm `[-5200,-19000,2400]`; top1.2m, thickness0.4m for every deck:

| Index/node | Top center | Width×depth | Stage | Initially built |
|---|---|---|---|---|
|0 Starter|4,17.2,1.2|6×4|0|yes|
|1 First|10,17.2,1.2|4×4|1|no|
|2 Reuse|15,17.2,1.2|4×4|2|no|
|3 Fork|20,19.2,1.2|4×8|3|no|
|4 Moustache|25,15.2,1.2|4×4|4|no|
|5 Bucket|25,23.2,1.2|4×4|4|no|
|6 Finish|30,19.2,1.2|4×8|5|yes|

Edges0→1→2→3→4/5→6. Native props centered20cm below top. FootprintX1..32,Y13.2..25.2; east floor buffer2m, west1m. Protected wing occupies localX6.5..29.5,Y3.9..9.1,Z0..5.2; support4 localX16.5..19.5,Y7..10. North/south east pods X32.2..33.8,Y25.7..27.3 /12.7..14.3; course finish endsX32 between both pods. Coral startsY30.7 nearX13.3. Roof bottom4490cm gives1970cm above decks. Existing progress computer stays south at[-3500,-18500,2450]. Primary **owned** station computer at[-3500,-17000,2450] retires belowfloor; its old props/buttons/labels audited by exact savedActor refs in scene manifest. No shared root component is removed or collision-disabled.

## Arrival and presentation

There is no Skills arrival teleporter: live native inventory contains hub_destination and Rescue replay destination only. Preserve physical campus entry. From eastedge local(34,28.7), a3m corridor leads west to(4,28.7), then rampfoot(4,30.2,0). Three parallel body-height rays clear; native floors2400 at east/middle/west. Protected coral starts0.5m beyond corridor north edge; east pod ends below its south edge. Final capsule/access QA pending. No relocated hub spawn, harness startup teleport or new unlocking mechanism.

Ramp3m wide,11m plan length rises1.2m to starter edge(4,19.2,1.2),10.91% slope. Cube surface endpoints and exact transform in map/scene, localY axis rotated roll-6.225°. Reused mission board(4,30.7,2.0) faces south: `POPCORN PARKOUR → / Shoot LOAD HEAT POP / Jump onto what you make`. Ribbon(4,18.7,2.6) faces south beside starter. Finale board(30,22.7,2.8) faces south. Native text size/alignment readback plus cooked readability is an implementation check, not assumed asset capability.

Receivers0..7 local centers: (6.8,16,2.8),(6.8,17.2,2.8),(6.8,18.4,2.8),(11.8,17.2,2.8),(16.8,19.2,2.8),(21.8,15.2,2.8),(21.8,23.2,2.8),(30,22,2.8). First seven face-X; last faces-Y. Surface1.2×1.2m. Teach0/1/2→first, reuse3→reuse,4→fork,5/6→either branch,7→final basket after finish arrival. Symmetric fork firing anchors(20,16.7)/(20,21.7) are inside inset deck; shot lengths2.34m. Instruction mechanisms and decorations are noncolliding, below/aside receiver faces. Native prior shot samples to branch receiver centers were atX22.8; revisedX21.8 lies along the same clear segment. Production support readback/rays confirm final actual poses before cook.

Popcorn art is intentional Cube/Sphere construction: five cream lobes+yellow heart below each created deck (30 props),3 moustache spheres, two5-piece colored containers with5 overflow spheres each (20props), all53 NoCollision. Flat deck surfaces never wobble. Existing Pix moves to left joke pose after valid branch commit, returns to finale pose before finale display; valid reset restores home and hides event overflow. Exact homes/poses in scene. Dedicated per-receiver mechanisms/effects:24 movable mechanisms,24instructionVFX,8wrongpuffs,8flourishes,16 independent target cueFX. No unsafe sharing of asynchronous teaching/puff FX. New actor allocation183 including1profile and1ramp, reusing existing Pix/mission+ribbon+final boards/HUD/Replay/entryReturn. Native actual inventory remains authoritative.

## Implementation sequence and bounded source work

After actual approval of regenerated digest and successful `plan --ready`:

1. Add production source-profile subclass with flat7deck/8target/24mechanism/24instructionFX/8puff/8flourish refs; construct exact reviewed records; count/identity fail-closed validation; await_target_startup→initialize. No inline UObject record construction or harness teleport/observer.
2. Add reusable decoration/Pix home/reset hooks: visibility follows committed built nodes and branch/finale commit, cancellation tokens guard delayed effects. Existing Show/Hide/TeleportTo APIs are already exercised. Native NoCollision/CanBeDamaged=false readback required; no invented Verse collision setter.
3. Add guarded existing journal `report_activity(player,6,6,step,3,message,generation)` and clear only owned activity. First accepted starter shot claims existing progress player station_id0 if free; release clears only its matching owned claim. Same nursery complete_challenge0/1/2 and existing badge tracker CompleteEvent remain Core/Agent authority. Update module7 guidance/badge description from GrowPlant to PopBridge; do not duplicate rewards.
4. Add old station `@editable retired_primary:logic=false`; primary actor only gets true. At OnBegin Hide then early return **before all subscriptions and dormant Return setup**. Other stations keep false/current retired behavior. Existing solo_active=false alone still subscribes Return and can reset reused Pix, so it is insufficient. New profile is sole primary Replay/Return listener. All other primary old control/display/plant refs retire exactly as manifest; primary computer parkedZ1800. Preserve progress/hub/journal/spawners and shared shell.
5. Build Verse, run actual fixture self_check for new profile data, verify source/profile counts/namespace39. Place incremental decks/ramp, read back all exact poses/scales/collision and shell unchanged. Place/support/bind independent target/effect assemblies, all53decoration refs and reused boards/Pix/buttons; audit native savedActor, not stale wrapper refs. Save meaningful checkpoints.
6. Validate Project/cook, then independent full production QA for both equal routes, all five jumps, rim/grounded denial, recovery<=1s at every gap and outer floor buffer, crouch/standing offset, Return/Replay/departure/round/stale shots, actual badge/Core/Agent, readable mute comedy, entry/ramp/first-use lesson. Stop game and verify nonrunning; leave editor open.

Source hooks above are concrete approved implementation tasks on known APIs, not new unverified jump capability or another prototype phase. Build/ref failures must be fixed before production binding. Material layout/behavior deviations return to review; routine native pose correction within10cm intended tolerance can be recorded/read back. No final full-course acceptance claim until cooked evidence.

## Evidence limits

A01 capability: actual diagnostic full7node/7edge/8receiver self_check result0; actual gun order/mechanism motion/reuse/recovery and airborne-required progression in independent B r04. A02 graph: both full logical routes checked, current offline exact gap/symmetry/bounds assertions. Native primitive bounds plus rays resolve location feasibility; ray-null alone is never used to clear a solid enclosing the ray origin. B verified only3decks, not this full course/cosmetic migration. Recovery<=1s, both physical routes, final badge integration and child enjoyment remain production acceptance tasks. Review preview source checked; rendered-image inspection must be reported separately. Approval pending is the only design execution gate if no new native/source blockers arise.
