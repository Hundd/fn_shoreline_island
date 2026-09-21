# Plan

- Status: In progress; Variable Vault graybox shell built and saved, traversal
  acceptance pending.

## Design language

Build a small coastal academy rather than eight disconnected boxes. Use one
shared modular shell language—light walls, broad openings, high ceilings, blue
structural accents, warm path lighting—then give each room a landmark:

- Path Garden: greenhouse and planters.
- Loop Lagoon: dock workshop and repeating lantern rhythm.
- Signal Lighthouse: harbor control room and beacon tower form.
- Variable Vault: power lab with energy conduits.
- Debug Workshop: repair garage and diagnostic props.
- Event Factory: compact production hall with bell/chute motifs.
- Build-a-Bot: robotics hangar.
- Tidepool Nursery: glassy coastal conservatory.

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
