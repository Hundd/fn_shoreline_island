# Implementation plan — progress and navigation

Status: Draft. Scope is spec.md FR-001..010. No gameplay edits authorized here.

## Architecture

Reuse the journal's existing authoritative badge readers and recommendation order.
Create one shared module metadata table with stable IDs, display names, navigation
numbers and completion bindings; do not reorder the existing tracker array.
Display order Skills/Agent differs from tracker order Bot/Nursery.

Extend the existing journal UI owner or a small dedicated presentation component
to manage one persistent canvas per player. Maintain one current activity context
and one active destination pulse per player. Rebuild from authoritative state on
spawn; update on confirmed completion and controller stage events. Do not add a
second independently incremented completion counter or a polling loop per widget.

Use small reporting hooks in existing controllers for entered/stage_changed/exited
events. Audit actual stages, replay semantics, shared rooms and ownership before
implementing hooks. The journal currently has no generic local-stage adapter.
Replace or consolidate the existing transfer popup with the new 4-second handoff
so both overlays do not compete. Preserve the finale celebration with consistent copy.

Use Map Indicator devices for eight destinations and Hub, reusing existing ones
if found. Keep base location icons static; activate/deactivate objective pulses
for individual agents through the installed Verse API after verifying behavior.
Native capability reference: https://dev.epicgames.com/documentation/fortnite/verse-api/fortnitedotcom/devices/map_indicator_device
Device properties and marker visibility still require live schema inspection.

## Intended scene changes

- Reconcile up to nine destination indicators at measured, reachable entrances.
- Update existing hub/route signs to use Prompt Workshop and matching destination names.
- Bind existing journal/progress devices and activity controllers to presentation logic.
- Retain geometry, targets, mission rules, badge ownership and reward amounts.

## UI sketch

```text
RESTORE PIX'S AI CORE
3/8 modules restored
NEXT: CONFIDENCE CORE — marker 4
```

Inside a mission, the last line becomes its actual action with `Step X/Y`.
Place the compact panel clear of the reticle, minimap, native trackers and local
feedback. Exact screen margins require a cooked HUD inventory and readability check.

## Spatial review boundary

map.yaml and its generated preview are explicitly schematic: a corridor-pattern
navigation envelope with nine annotated destinations. They illustrate naming and
scope only. The origin, envelope and marker coordinates are diagram coordinates,
not a surveyed campus or placement payload. No connecting routes are invented.
Version 1 cannot express the island's free-order objective graph; spec.md owns
recommendation and finale rules. Before approval for implementation, replace the
schematic coordinates with measured entrance anchors and actual relevant routes,
or extend the map contract through a reviewed change. Regenerate the review bundle.

## Work order and validation

1. Audit live journal/tracker bindings, existing map devices, HUD settings, entrance
   transforms, route access and local-stage controllers. Record exact reuse/new counts.
2. Resolve map assumptions, stage adapter inventory and HUD placement. Update review
   and regenerate before asking for design approval; no approval.yaml yet.
3. After approval, checkpoint, implement authoritative progress/UI and lifecycle hooks;
   compile Verse and test a single completion/replay before expanding integration.
4. Serialize MCP indicator/sign edits, read back properties/transforms/bindings, save.
5. Build Verse, run full Project Validate, cook and playtest AC-01..12. Record actual
   results individually. Solo results cannot establish AC-09 multiplayer isolation.
6. Stop active playtest game, verify non-running state and leave UEFN open.

No cross-session save policy is added. Missing dependencies must remain visible
in review; a draft map validation pass does not establish controller support.
