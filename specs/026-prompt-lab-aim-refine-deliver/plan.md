# Implementation proposal - awaiting review

## Reuse and evidence

Use `corridor`, `knowledge_room`, `target_sequence`, `reward_room`. Their existing adapters cover the proposal; `target_sequence` is the fixed Prompt controller, not an arbitrary data-driven sequence engine. No new pattern, Verse class or source edit is proposed. Read-only native inspection confirms controller `configured=true`, nine ordered target references, and 13 anchor transforms matching feature 025. Raw results: `evidence/read-only-inspection.json`.

Current native device references include Verse wrapper objects; those paths are not proof of underlying actor bindings. Feature 024's `handoff-binding-readback-2026-09-27.json` records earlier savedActor reconciliation. Discover ObjectTools properties and resolve wrappers before any native writes. No automatic rewrite of working bindings.

## Geometry and intended scene delta

Coordinates are local XYZ meters, origin world `(6000,-8500,2410)`cm. Platform 66 x 62m and west inbound ramp are historical measured evidence from feature 024. Today's 13 anchor readings are fresh; proposed locations and route clearances are design intent. Conversion is world_cm = origin_cm + 100 * local_m.

| ID / assembly | Measured anchor (m) | Proposed anchor (m) |
|---|---|---|
| 0 BLUE | 26.5,55,3.65 | 30,52,2.2 |
| 1 RED | 26.5,47,3.65 | 30,40,2.2 |
| 2 GREEN | 26.5,39,3.65 | 30,46,2.2 |
| 3 LARGE detail | 38.5,35,3.65 | 36,38,2.2 |
| 4 SMALL BLUE | 40,46,3.65 | 38,43,2.2 |
| 5 LARGE BLUE / moving | 39.5,55,3.65 | 38,51,2.2 |
| 6 REACTOR | 49.5,55,3.65 | 46,54,2.2 |
| 7 SCANNER | 49.5,43,3.65 | 46,48,2.2 |
| 8 STORAGE | 49.5,34,3.65 | 46,42,2.2 |
| Hint board | 35,46,11.9 | 30,34,4 |
| Module | 64,23,2.7 | unchanged |
| Rail actor | 63,20,3.4 | unchanged |
| Entry volume center | 15,33,1.9 | unchanged |

For each target, translate its existing surface, visual prop, label/ring/cone, VFX and sound assembly by the same anchor delta, preserving known relative offsets. Discover complete ownership first; do not move unrelated legacy machinery just because it is nearby. Move the bound reactor and reactor effects with target 6 only after surveying offsets and cable endpoints; door/module/rail remain fixed. Ring, label and particles follow hit surfaces at runtime; cone/objective effects and decorative props may not, so their home transforms must be reconciled too. Target Verse device origins are not necessarily the visual anchors.

Preserve trigger pitch90/yaw0/roll0 and scale3.5/3.5/2 from live readback until footprint survey proves otherwise. Preserve board yaw180/scale3. Do not treat these scale numbers as physical meters. Lowered targets retain current generous surfaces; actual pivots/bounds must prove floor clearance. Any need to shrink surfaces, alter target positions materially, or move machinery beyond these assemblies returns to design review.

No additional spawners, buttons, walls, physical gates, floor expansion or props are specified. Entry, shared managers, replay, HUD, module, door, rail, west/north ramps and legacy handoff are preserved. Move only the nine reconciled target assemblies and existing board. The generated `reconcile` entries describe intent, not executable payloads or instructions to duplicate devices.

## Player flow and hints

The illustrated entry path is `(15,33) -> (20,40) -> (24,46)`, about15.8m after the entry center. The knowledge zone is an information overlay inside the arena. Its 1m connection to the arena is illustrative, not a required walk. All shooting stages are intended to work around `(24,46)` with a 3m-wide maneuvering lane; no stage-specific waypoint triggers exist.

From that point, target-center distances are approximately6-23.4m horizontally. Color choices have6m center spacing; the blue size pair has8m spacing; destinations6m. RED is deliberately offset to y40 so it does not sit directly in front of SMALL BLUE during their shared active phase. These are point calculations; large trigger bounds and other scenery still need inspection.

Core5 moves along y48.5-53.5 at x38, then freezes. Preserve four seconds per leg and no deadline. Keep the lane behind the targets, not through the moving envelope. The optional arena-to-reward floor route `(24,47)->(24,59)->(55,59)` is43m and only reaches the reward envelope, not the module or rail. It is not required for reward and not a surveyed collision-free route; map v1 cannot display information-only completion edges. Never turn this diagram into a forced tour. West return uses the same approach in reverse; beyond-platform hub navigation and rail spline are not modeled.

| Moment | Existing hint surface and copy | Learning action |
|---|---|---|
| Entry | Board + 7s HUD: useful details help AI choose | Brief concept, then try it |
| Color | Board / HUD: SHOOT THE BLUE CORE | Match WHAT |
| Ambiguity | Board: Two blue cores! Shoot LARGE | Add WHICH ONE |
| Size | Board: GET THE LARGE BLUE CORE | Apply combined details |
| Acquisition | Board: shoot the moving core first | Acquire before sending |
| Destination | Board: Now shoot its destination: REACTOR | Specify WHERE |
| Wrong shot | Shooter HUD plus temporary X / grey cue | Read prompt, retry safely |
| Finale | Board + participant HUD | See outcome and badge |

The main board persists after timed HUD messages. Existing text is hardcoded; editor text changes would be overwritten. No new hint wording, localization system or adaptive response is implied by `map.yaml`. If the user wants them, approve a separate reusable configuration adapter before implementation.

## Blockers before execution

1. Human review of this exact layout/hint/return scope. No `approval.yaml` exists.
2. Complete assembly and native-binding survey, target bounds/collision, floor clearance, stage-specific shot paths and reactor/cable offsets. Resolve concrete full transforms without inventing pivots through MCP.
3. Survey entry-volume bounds and replay access; clear the3m lane and reverse west return. Record any scenery conflict. Rail repair is excluded; its historical failure stays visible.

Cooked tests are post-implementation acceptance gates, not prerequisites requiring an impossible pre-implementation playtest of the new design. Unresolved survey/design assumptions still block readiness.

## After explicit approval and blocker resolution

1. Regenerate changed review artifacts, present material changes again, record actual human approval with the current `generated/review-manifest.json` digest. Never manufacture approval from this plan.
2. Run `python tools/map_workflow.py plan specs/026-prompt-lab-aim-refine-deliver/map.yaml --ready`. Stop on any failure.
3. Read the project Implementer skill, rediscover schemas and reconcile current state. Save a recovery checkpoint. Keep all editor calls serialized.
4. Apply board and then target groups0-2,3-5,6-8 incrementally. Read back complete transforms, all bindings/IDs/counts, collision settings and full assembly offsets after each group; save affected actors. Stop on ambiguous results.
5. Read Verifier skill. Run UEFN project validation, full cook and fresh session; build Verse if any separately approved source change occurred. Execute spec AC-01 through AC-09, including multiplayer, replay at each async stage, actual learning feedback and reverse walking return. Keep inherited rail acceptance separately open unless actually proven.
6. Record expected/actual evidence before checking gameplay tasks. Stop the game/session, verify CanStart or Unconnected, leave UEFN open.
