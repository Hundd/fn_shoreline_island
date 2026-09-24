# Confidence Core mystery cat — editor evidence

Requirement: AC-046 / T-043. This is source/editor evidence, not runtime
acceptance.

- Inspected the four preview-door positions and an existing Fortnite
  `SM_ClayTile_CatStatue_A` thumbnail. A first live UEFN placement at station
  1 was viewed with the door temporarily hidden in the editor. A 0.3-scale,
  90-degree side profile behind the door was recognizably cat-shaped. The
  door's editor visibility was restored after the capture.
- Placed one cat at each of the four Confidence Core stations at X = -3300,
  -6100, -8900, and -11700; Y = -1310, Z = 2400. All use the same cat mesh,
  Academy gold material, scale 0.3, and 90-degree yaw. Each actor was saved
  and read back for transform, mesh, material, `NoCollision`, overlap off,
  and actor damage off.
- Added one `mystery_cat` editable creative-prop field to each station and
  bound each to its own new actor. All four station actors were saved; the
  cat bindings and existing preview-door bindings were read back separately.
  No door actor or reward reference was replaced.
- Verse hides the cat when the station is unclaimed or running challenges
  2–3. Claiming/replaying challenge 1 shows it behind the closed door, so the
  existing door-rise animation reveals it on a successful threshold run.
  `VerseToolset.BuildAll` returned zero diagnostics.

One editor automation quirk was caught during staging: a rotation-only
`set_actor_transform` call reset the new actor's location and scale despite
the advertised partial-transform semantics. The full transform was then set
explicitly, saved, and read back before copying it to the other stations.
The initial combined wrapper `canBeDamaged` edit reported that property
unsupported; the `savedActor` binding had nevertheless applied and was read
back. Damage was disabled through each actor's supported `bCanBeDamaged`
property instead.

Project validation, memory calculation, and Play-in-Client remain deferred
at the owner's request. In-client door occlusion, revealed sightline, replay,
later-challenge hiding, and multiplayer behavior still require human
playtesting before T-043 can be checked off.

## Superseded asset choice

The `SM_ClayTile_CatStatue_A` reference in this original placement evidence
was later rejected by UEFN validation. The owner's autofix cleared it,
leaving the four actors without a mesh. A project-owned low-poly cat mesh
was then imported, assigned, saved, and validated; see
`confidence-cat-validation-fix-2026-09-23.md` for the current asset state.
