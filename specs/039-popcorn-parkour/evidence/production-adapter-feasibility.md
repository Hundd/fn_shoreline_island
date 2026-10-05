# Production adapter feasibility — offline only

2026-10-04. Reviewed tested generic controller, fixtures, diagnostic full seven-node/eight-receiver contract, three-deck harness, shared data_target/nursery_progress and academy_journal source. No editor calls, source edits or new goal. Geometry remains Planner-owned and subject to ready handoff.

## Supported configuration

Create a source-profile subclass of `fn_shoreline_island_popbridge_controller`, containing only record construction/configuration, without harness startup teleports or observer loops. Native complex class arrays expose UObject references rather than constructible record fields; tested flat editable device/prop arrays are the supported binding path. Build records from the final reviewed contract, then call inherited `await_target_startup()` and `initialize()`.

Flat required arrays: seven deck props; eight data_target devices ordered IDs0..7;24 movable noncolliding mechanism props, index receiver*3+instruction;24 instruction VFX; eight wrong-puff VFX; eight flourish VFX. Bind existing progress/blaster/hub destination, one Replay button, both Return buttons, ribbon and feedback. Native target assemblies independently bind surface, ring/cone mesh, label, selectable-ring and objective-cone VFX. No required default-identity references accepted. Optional target audio/hit particles may explicitly be omitted as supported by existing target guards; do not represent absent art as working.

| Node | Stage | Initially built | Milestone | Terminal |
|---|---:|---|---:|---|
| starter0 |0|yes|-1|no|
| first1 |1|no|0|no|
| reuse2 |2|no|1|no|
| fork3 |3|no|-1|no|
| left4/right5 |4|no|-1|no|
| finish6 |5|yes|-1|yes|

Edges:0→1→2→3;3→4/5;4/5→6. Receivers0/1 teach Load/Heat from0 with creates=-1;2 teaches Pop from0 creates1;3 from1 creates2;4 from2 creates3;5/6 from3 create4/5;7 from terminal6 creates=-2. Saved invocation instruction=3. Both branch producers remain equal and can create both decks. Existing validator requires deck X/Y>=400cm, positive thickness, equal heights, calculated positive gaps<=120cm and equal outgoing fork gaps within1cm. Profile metadata must come from final map, not diagnostic old coordinates.

Deck centers are top surfaces; prop transforms must subtract half thickness. Native collision/scale/mobility must be configured and read back. Verse supports Show/Hide, CanBeDamaged=false and mechanism TeleportTo(home+Z25) then home. No Verse collision setter exists. Deck collision must remain stable; decorative lobes/mechanisms/cosmetics use native noncollision. Landing credit uses grounded full footprint after checkpoint-anchored airborne proof; firing uses20cm inset.77.15cm standing-origin normalization and35cm tolerance are tested baseline values; final floor/standing/crouch/recovery measurements remain placement verification.

## Minimal bounded source work before placement

1. Implement profile construction and explicit count/identity validation, including all production refs. No new transition engine needed.
2. Add reusable per-machine created-decoration/flourish-prop refs and home/reset visibility handling. Current `flourish.Begin()` alone cannot reveal the required left moustache, right bucket or final basket overflow. Show only after validated commit; hide on attempt reset while retaining badge. Deck-attached five-lobe cream/yellow popcorn decoration should follow built-state visibility, otherwise hidden decks leave floating art. Exact prop counts/transforms remain Planner parameters.
3. Add guarded journal activity binding/reporting to generic transition checkpoints using existing `report_activity(player,6,6,step,3,message,generation)` convention; clear only this controller's owned activity on release. Current controller does not call journal. Core completion should continue through the existing nursery tracker CompleteEvent binding, not duplicate badge/Core awards.
4. Migrate badge description to PopBridge text when primary migration executes. Preserve `complete_challenge` and round_generation authority. Source milestone0/1 accepted landing and milestone2 final commit already call the authority; Replay resets only attempt, not progress. Badge SetValue(1) occurs only when all three completed and badge_earned was false. Existing academy_journal later_badge_trackers linkage and Agent prerequisite must be read back before replacing primary controls.
5. Decide native old-primary controller disable/removal explicitly in Planner scope: hiding buttons alone does not cancel its Verse subscriptions. Preserve other nursery stations and production progress. Generic controller does not claim `nursery_player_progress.station_id`, so retained old station listeners/entry routing must not compete for the same primary player. This is migration configuration/readiness, not a reason to demand full cooked acceptance before placement.

Shared-target startup_ready is additive: false initially, true only after OnBegin Hide/home capture/deactivate/hit subscription. Existing controllers ignore it; PopBridge waits up to10s then fails closed. It does not change shared target mission correctness or reward semantics. Target mission_id must use reviewed namespace; journal module7 is not evidence that target mission_id7 is appropriate.

## Actor allocation and sharing

Safe fully referenced baseline new allocation:1 profile+7 decks+8 target devices+8 damage surfaces+16 target mesh props+8 labels+16 independent target cue VFX+24 mechanism props+24 instruction VFX+8 wrong-puff VFX+8 flourish VFX+1 ribbon+1 HUD+3 buttons =133 actors if every support/control is new. Reused buttons/ribbon/HUD reduce count; existing progress/blaster/hub/journal are references, not new actors. Decorative popcorn (six lobes/center pieces per chosen deck), Pix moustache/bucket/basket and approach/ramp art are additional enumerated Planner allocations. Optional native target audio/particles are not included.

Do not share selectable-ring/objective-cone FX: each target pulses/ends independently. Do not assume one owner guarantees serialized teaching FX: `teach_effect` and clear_puff are spawned and rapid accepted teaching/wrong shots can overlap.24 instruction and8 puff refs avoid cancellation interference. Shared saved-routine FX could be optimized only with explicit effect-ownership serialization and tested cleanup; not necessary for readiness. Per-receiver flourishes remain independent actual refs for left/right/finale presentation. Mechanism props are never shared.

## Readiness versus acceptance

Actual full-contract Verse self_check result0 already proves logical route/metadata fixtures; cooked three-deck tests and independent QA prove bounded real gun/ordered motion/walk denial/jump/return behavior. These establish implementable capability, not final production acceptance. Remaining adapter readiness is concrete profile/ref validation plus cosmetic visibility and journal/migration hooks above, followed by compile and contract checks. Full final-route jumping, rim contact, recovery timing, both branches, reset/cancellation/foreign inputs, milestone/Core/Agent and visual/comedy acceptance belong to cooked production validation after approved placement. Keep those tasks pending without making their pre-placement completion a circular gate.
