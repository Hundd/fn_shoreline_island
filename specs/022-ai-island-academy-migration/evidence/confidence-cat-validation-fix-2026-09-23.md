# Confidence Core cat mesh validation fix — 2026-09-23

The owner's UEFN autofix cleared the disallowed
`/Hermes/Props/ClayTile/ClayTile_CatStatue_A` mesh reference from all four
`*_mystery_cat` actors. The next project upload passed validation and cooked,
but a live post-autofix read found `staticMesh = null` on each actor and
zero-sized actor bounds. Thus the previous `confidence-mystery-cat` visual
claim was no longer true even though gameplay and validation ran.

To restore AC-046 without a disallowed Fortnite reference, a small
project-owned low-poly cat silhouette was authored at `Resources/AcademyCat.obj`
and imported through UEFN as
`/fn_shoreline_island/Academy/sm_academy_cat`. The imported mesh has valid
bounds (-130,-40,0) to (150,48,355) cm and 88 triangles. It was saved in
UEFN, then assigned to the existing four cat actors. Each actor was saved
and read back with that same mesh and its preserved
`/fn_shoreline_island/Academy/mi_academy_gold` material. No Verse device
reference, transform, reward, or progress state was changed.

The fresh UEFN session launch after those saves returned `Completed`.
The editor log at 19:43:13 UTC reports `FlowStep_RunLocalValidation(): Complete`
and `Project fn_shoreline_island up to date`; at 19:44:52 UTC it reports
`Successfully activated content on all platforms`. Verse also built
successfully at 19:43:09 UTC. The session was stopped; MCP then reported
`Disconnected` and `Unconnected`.

This proves the new asset/reference validates and cooks. It does not prove
the cat is recognizable behind the door in-client or that the reveal, replay,
and two-player behavior work. A current memory calculation is also still
missing from this evidence.
