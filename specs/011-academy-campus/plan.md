# Plan

- Status: In progress; Variable Vault graybox shell built and saved, traversal
  acceptance pending.

## Design language

Build a small coastal academy rather than eight disconnected boxes. Reuse only
minor construction details such as trim thickness and safe doorway clearance;
do not copy the Variable Vault pavilion shell. Give every game a different
silhouette, roofline, entrance composition, and landmark:

- Path Garden: greenhouse and planters.
- Loop Lagoon: dock workshop and repeating lantern rhythm.
- Signal Lighthouse: harbor control room and beacon tower form.
- Variable Vault: power lab with energy conduits.
- Debug Workshop: repair garage and diagnostic props.
- Event Factory: compact production hall with bell/chute motifs.
- Build-a-Bot: robotics hangar.
- Tidepool Nursery: glassy coastal conservatory.

The intended structural families are greenhouse frames for Garden, an open dock
shed for Loop, a tall beacon hall for Signal, the existing enclosed power-lab
pavilion for Vault, an asymmetric repair garage for Debug, a stepped production
hall for Event, a broad robotics hangar for Bot, and a low conservatory with
planter wings for Nursery.

## Delivery sequence

1. Audit zone bounds, routes, available Fortnite assets, and current memory
   constraints.
2. Build one reversible room shell around Variable Vault as the template. Its
   regular grid and four stations make clearance problems easy to detect.
3. Save, launch a solo session, and verify entrance, four-station access,
   controls, boards, camera, exit, and unchanged gameplay.
4. Revise the kit, then build the other seven room shells one zone at a time.
5. Add hub paths, trees, planters, lighting, and landmarks after room footprints
   are stable.
6. Run the existing zone regressions plus validation and memory gates.

## Placement policy

New environment actors use the `campus_` prefix and zone-specific Outliner
folders. Maintain broad front entrances and at least one visually obvious exit.
Do not place decoration inside control interaction radii or moving-prop paths.

## First implementation checkpoint

The initial `campus_variable_vault_shell` is centered at
`(-7600, -2700, 2400)`. It uses one actor with a rear wall, two side walls, a
high roof, and five open-front bay columns. The shell spans the existing four
Vault stations without moving them. An editor viewport inspection shows the
station line beneath the roof with an unobstructed open front. Runtime traversal
is still pending because the first Play From Here launch returned the player to
the normal hub spawn.

## Distinct graybox checkpoint

Seven additional shells are saved without moving gameplay actors:

- `campus_path_greenhouse`: compact pergola frames, ridge, and side planters.
- `campus_loop_dock_sheds`: four offset dock roofs with alternating pitch and
  round markers.
- `campus_signal_beacon_hall`: four open signal portals around a tall beacon.
- `campus_debug_repair_garage`: asymmetric split roofs and exhaust stacks.
- `campus_event_stepped_factory`: four different-height production towers,
  chimneys, and an overhead conveyor.
- `campus_bot_aframe_hangar`: paired sloped roofs, ridge spine, and open bays.
- `campus_nursery_canopy_garden`: four separate round canopies with planter
  wings.

An aerial editor inspection confirms different silhouettes. These remain
graybox structures: material identity, windows, signs, native Fortnite props,
landscaping, paths, and runtime clearance evidence are still pending.

The first full content launch after this checkpoint timed out after 300 seconds
and the Session toolset subsequently reported `Disconnected` / `Unconnected`.
No runtime result is claimed. Diagnose the launch/cook before any shell receives
acceptance credit or before further environment density is added.
