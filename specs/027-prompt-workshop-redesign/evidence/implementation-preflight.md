# Prompt Workshop implementation preflight — 2026-09-28

Approved digest: `5d603b90fe315ed87016c7c636522a7d7ac9477d01c8dae519900a408c36a1f0`. `plan --ready` passed. Current level is `/fn_shoreline_island/fn_shoreline_island`; session game state was `Unconnected` before mutation.

Recovery point: tracked editor assets at Git HEAD `ca4579fb09c47b5bcc896dfb60d90cd697fed7b5`; `git status --short` showed only feature-027 source, task, approval and evidence changes before editor mutation. The original 125 repair-area actor descriptors and floor bounds are in `repair-footprint-2026-09-28.json`. Exact station editable references, including the four shared hub spawners, one hub teleporter, and round settings, are in `repair-bindings-preflight.json`.

Old subscriptions are Verse `InteractedWithEvent.Subscribe` calls in `fn_shoreline_island_repair_station.verse`. Native `ListEventBindings` on repair_station_1 returned an empty list. Removing all four station VerseDevice actors retires those subscriptions without editing shared spawners or teleporter.

## Resolved scene delta

- Keep `repair_0_floor` through `repair_3_floor`, `garden_repair_walkway`, shared hub spawners, hub teleporter, round settings, Garden progression, and distant Prompt Lab shooting actors.
- Reuse one repair-area Inspect button, six repair-area choice buttons, one Send button, one Connect button, one Replay button, two billboard boards, and HUD devices. Move them to the approved local markers and bind them to one new workshop controller. The physical prompt board is static guidance; each player's assembled request is persistent in a personal HUD.
- Use existing Prompt Lab mesh/material templates for new workshop-local Pix, large/small blue cores, red core, reactor, scanner and module. Source props stay at the distant Prompt Lab. Set moving prop components to Movable; source template components are Static.
- Retire the four old repair_station VerseDevice actors, repair_progress, remaining old repair controls, legacy labels, old plant stage props and their labels after the new activity is wired. The `campus_garden_repair_supports` actor contains 70 components: old board posts, 36 button mounts, console rails, and plant trays. It must be reconciled with the new device positions before retiring obsolete collision.
- Update the owning hub-sign and journal Verse copy, which now compile with the workshop controller.

No scene mutation has yet been made. Exact prop pivots and actor-level settings require readback after placement.
