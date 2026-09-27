# Map contract, version 1

The executable structural schema is [`tools/map_schema.py`](../tools/map_schema.py).
`tools/map_workflow.py` adds semantic validation. Use YAML, explicit string keys,
finite numbers and no duplicate keys, anchors, aliases or executable tags. Unknown
fields are errors except inside declared `parameters`/`settings` objects. Pattern
parameters are checked against their named contract; settings remain intentions
until checked against live device schemas. Python 3.10+ and PyYAML are sufficient.

All fields below are required unless marked optional. See the complete working
[Prompt Lab example](../specs/025-map-planning-workflow/map.yaml).

| Field | Meaning |
|---|---|
| `version` | Integer `1`; incompatible changes need a new version and validator |
| `map` | Snake-case id, title, theme, units=`meters`, `origin_cm` XYZ, positive XYZ `size`, learning_objective, source_feature, intent (`document_existing`/`propose_change`), min_path_width (at least 1m), positive position_tolerance in meters |
| `player_flow` | Zone IDs in intended first-visit order; v1 requires every zone exactly once |
| `zones` | id, label, pattern, local XYZ position, positive XYZ size, purpose, parameters, devices (shared device IDs), reciprocal overlap_with, completion and reset |
| `connections` | from/to zone IDs, mode (walk/ramp/portal/rail), width in meters, at least two XYZ points, gate (`always` or an earlier mission stage) |
| `markers` | id, kind (spawn/target/weapon/knowledge/exit/checkpoint/reward), zone, label, local XYZ position, source provenance; targets also need a unique nonnegative target_id |
| `devices` | id, class, positive count, source lookup/evidence, settings object. Declare shared instances once; many zones may reference them |
| `stages` | id, zone, purpose, requires (earlier stage IDs), active_targets, optional success_target (required when targets are active), completion |
| `assumptions` | id, detail, status (`open`/`resolved`), evidence. Open assumptions allow drafts but block execution readiness |

Positions use Unreal **XYZ** axes, expressed locally in meters. `position` is
the minimum corner of a zone envelope and marker positions are absolute within
the local map frame, not relative to their zone. `size` is full extent, not half
extent or actor scale. Conversion: `world_cm = origin_cm + 100 * local_m`.
Preview X points right and Y points down; it is not a north-oriented map.
Height is checked and listed but not rendered in top-down shapes. Rotations,
mesh pivots, collisions and full actor scales require a resolved execution delta.

Example zone fragment (not a standalone spec):

```yaml
id: gallery
label: Practice gallery
pattern: shooting_gallery
position: [20, 10, 0]
size: [30, 20, 8]
purpose: Recognize the requested feature.
parameters: {target_count: 3, friendly_fire: false}
devices: [shared_blaster, gallery_targets]
overlap_with: []
completion: Correct target accepted by the reusable controller.
reset: Deactivate targets and clear transient selection.
```

The validator checks references, geometry bounds, headroom, minimum route width,
declared overlap, endpoint membership, simple walking slope, ordered progression,
required device classes and target sequence/count consistency. Long routes produce
review notices. It cannot prove terrain connectivity, clear sightlines, wall/door
collision, target hit coverage, UI readability, gameplay fun or supported native
device settings. Reviewers must explicitly assess these before and during playtest.

`spawn` can annotate arrival from an external hub; its label/source must say so.
A weapon marker can annotate inventory already granted elsewhere; it must not
cause an extra weapon spawner. Markers and zone envelopes are design annotations,
not one-to-one actor placement commands. Deliberate overlap (for example a lesson
board inside an arena) must be declared on both zones.

Version 1 models a linear mission with optional gated connections. Parallel
objectives, branching progression, multi-floor navigation, detailed rail splines
and arbitrary target state machines need a reviewed schema/adapter extension.

## Pattern contract

Each `design/patterns/<name>/pattern.yaml` declares version, id, purpose,
parameters (name/type/required), expected_devices (class names), verse_behavior,
geometry, interaction, completion, reset, debug checks and implementation_status.
Optional parameters may be omitted; v1 supplies no hidden defaults. Supported
types: string, integer, number, boolean, strings and integers.

`existing_adapter` means reusable building blocks exist, not that an arbitrary
configuration is implemented. Inspect the stated adapter and its capabilities.
`contract_only` blocks execution until a reusable adapter has been implemented
and verified in a separately approved change. Update the contract with evidence.

## Generated plan and approval

`generated/implementation.yaml` has version, map_id, spec/pattern digests, draft
status, executable=false, blockers, position tolerance and ordered implementation
entries: inspect_existing, reconcile_zone, reconcile_device, bind_logic,
verify_gameplay. Each entry contains its intended state and verification step.
`reconcile` means inspect/reuse first, never blindly duplicate existing actors.
These are intent operations, not an API payload; the tool does not execute them.

`generated/review-manifest.json` hashes the exact UTF-8 bytes of both previews and
the plan. `approval.yaml` is separate so regeneration never fabricates approval.
Its schema is in map_schema.py: status=approved, reviewer, approved_at (quoted
ISO timestamp), evidence (reference to actual explicit approval), review_digest.
The hash is an audit consistency check, not a signature or authorization service.
