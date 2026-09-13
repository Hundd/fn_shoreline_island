# Four Nursery stations - 2026-09-12

Construction and focused solo capacity checks PASS below. T-030 remains
open because two/four-player isolation requires additional clients.

## Revision and construction

UEFN 42.10, map `Content/fn_shoreline_island.umap`. Nursery Verse sources are
unchanged from [three-challenge acceptance](three-challenges-2026-09-12.md):

- Fixtures SHA-256: `5E1C339A718829BCE7F6E0BB85D923A597BB123C0EC62B8BAE87638C9654A164`.
- Progress: `220E56694DC471A083720D1E087F680969F8BAB915EAEC9354E8CD41860C8676`.
- Station: `D829964322419BED8CA248FEB632F16711C67A618C3C45C810F009BEC7FB0316`.

The original 44 actors were read back and saved before expansion. Native
properties and geometry materials/mobility matched; transforms matched within
floating-point tolerance. Three independent sets add 37 devices and five
geometry actors each: 126 additions, 170 Nursery actors in total. Only the
original progress and badge actors are shared within the Nursery.

| Station | ID | Center X | Center Y | Native references |
| --- | --- | --- | --- | --- |
| 1 | 0 | -3500 | -17000 | 45 existing |
| 2 | 1 | -6900 | -17000 | 45 added, matched |
| 3 | 2 | -10300 | -17000 | 45 added, matched |
| 4 | 3 | -13700 | -17000 | 45 added, matched |

Each new station uses its own controls, HUD, boards, robot and three planters.
Its five hub references intentionally target the existing teleporter and four
spawners. All three progress references target the existing Nursery progress
script; station IDs read back as 1, 2 and 3. Native asset placement offsets were
corrected with explicit transforms before saving. Floors retain scale (34,37,1.5)
and top Z2400, meeting laterally and joining Bot at Y-15300. No external actor
files were moved or renamed manually.

[Construction and binding audit](four-stations-2026-09-12.json) records source
readback, new actor paths, and all 135 bindings. [Final saved-property audit](four-stations-audit-2026-09-12.json)
records 126 unique added actors with no transform/property mismatches. Verse
BuildAll returned an empty diagnostic list after construction.

## Runtime and remaining acceptance

One continuous solo session, `5d0d05395c22481680ebf05875c7371a`, launched at
Station 4. StartSession returned Completed. Capture resolution was 1920x1080.

| Check | Expected | Observed | Result |
| --- | --- | --- | --- |
| Station 4 claim | Local controls and initial challenge activate | [Station 4](captures/nursery-four-claim4-002.png) claimed; its Run board showed Challenge 1 and default definition | PASS |
| Copied failure | Harvest before Wait stops safely, no award | [Stopped trace](captures/nursery-four-wrong4-014.png) names step 3, Planted and needed Wait; all flags no, Badge 0/1 | PASS |
| Copied correction | Water/Plant/Wait/Harvest completes and unlocks Next | [Success](captures/nursery-four-success4-019.png) shows first flag yes, other two no, Badge 0/1, raised plant and function explanation | PASS |
| Next | Challenge 2 becomes selected at defaults | [Stage 2](captures/nursery-four-stage2-002.png), followed by transfer readback | PASS |
| Three lateral joins | Player walks from 4 to 3 to 2 to 1 without falling or obstruction | [4-to-3](captures/nursery-four-join43-002.png), [3-to-2](captures/nursery-four-join32-002.png), [2-to-1](captures/nursery-four-join21-002.png) | PASS |
| Four sequential claims and progress | Completed Challenge 1 survives; Challenge 2 remains selected with authored defaults | [Station 3](captures/nursery-four-transfer3-002.png), [Station 2](captures/nursery-four-transfer2-002.png), [Station 1](captures/nursery-four-transfer1-002.png) all show Done 1 yes / 2 no / 3 no, Badge 0/1, Water/Plant/Harvest/Wait and Care/Care/Care | PASS |
| Hub return | Player returns to academy hub | [Hub](captures/nursery-four-hub-002.png), after using Station 1's return control | PASS |

Five quick Run presses were sent during the initial wrong run. The result was
the expected stopped trace with unchanged program and no award. This does not
complete AC-004: edit, Next and Replay spam during a longer valid run still need
direct observation. Transfers were after execution, so they do not prove active
cancellation. No multiplayer, muted-audio or final release claim is made.

Fortnite was closed after testing. Process count was zero and editor session
status was Disconnected. No task was checked solely for these partial results.

Existing presentation issues (robot/bed label occlusion, HUD/mission overlap,
signposted hub route) remain open, as do full-set replay, six hints, rapid inputs,
respawn/round lifecycle, two/four-player tests, project validation and memory.
