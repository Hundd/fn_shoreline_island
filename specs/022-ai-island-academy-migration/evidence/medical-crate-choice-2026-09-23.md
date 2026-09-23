# Agent Mission medical-crate choice — editor implementation evidence

Requirement: AC-030 / T-027. This is implementation evidence, not runtime acceptance.

## Completed and read back

- Verse now stores a per-player Food/Medical/Mechanical choice, resets it with the attempt, names the selected crate on the plan board, and allows the first Pickup/Move/Drop stage only for Medical. Wrong choices give retry feedback without moving the bound prop. The existing connection control retains its later Launch role. `VerseToolset.BuildAll` returned zero diagnostics after the source changes.
- The four existing Verse-bound first-stage `seed` props were edited in UEFN to use a navy cube mesh with a `MEDICAL` text component. Their existing actor references and transforms were retained. Each actor was saved and its mesh, material, and text component read back. A viewport capture showed the visible labeled crate at station 1.
- Four mission-board Billboard defaults, four cell-3 destination Billboard defaults, four connection Billboard defaults, and four connection Button prompts were changed in UEFN, saved individually, and read back. Cell 3 now says Animal Research Station. The 20 edited actors and four new text components had no readback mismatches for those properties.
- All four stations now have three distinct crates: the Verse-bound navy MEDICAL cube, a static gold FOOD cube, and a static teal MECHANICAL cube. Food and Mechanical stand 100 and 200 cm to the positive-X side of the Medical prop, away from its negative-X delivery path. Each alternative was added through UEFN, labeled with a TextRender component, saved as an OFPA actor, and read back for mesh, material, label, collision, and overlap properties. A station-1 viewport capture visibly showed all three labeled choices beside the robot.
- All 12 crate mesh components and their `BoundingBoxComponent`s now read `bodyInstance.collisionEnabled = NoCollision` and `bGenerateOverlapEvents = false` after actor saves. The initial box readback had shown `QueryOnly`/`OverlapAllDynamic`; disabling that remaining overlap preserved the station-1 actor bounds. The four Medical actor references were not replaced. The new TextRender rows are included in `label-inventory-2026-09-23.csv`.

## Recovery note and remaining acceptance

- The first Food prop's original all-in-one property call applied in memory but was not saved before UEFN restarted. On reopening, its mesh/material persisted while collision had reverted. The collision, FOOD label, and all subsequent actors were then applied in smaller calls and saved/read back. Setting mesh and material separately avoided a recurring UEFN “Assign Materials” dialog.
- During recovery, one UEFN instance crashed with a logged D3D12 out-of-video-memory error. The user closed the Fortnite client and reopened UEFN; the later actor work above completed on the reopened editor.
- Project validation, memory calculation, a full Play-in-Client check, and gameplay/multiplayer acceptance remain deferred per the user's instruction to skip verification. The Verse build and editor readbacks above do not prove runtime behavior. Keep T-027 unchecked until its specified acceptance evidence is available.

The remaining capstone gap is the reusable delivery-skill interaction and the end-to-end six-action story, tracked separately under AC-028/T-025. The three-stage adaptation should not be treated as complete capstone acceptance.
