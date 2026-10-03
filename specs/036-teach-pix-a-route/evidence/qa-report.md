# Independent QA — Teach Pix a Route revision 1

Worker `/root/gameplay_verifier`, explicitly dispatched GPT-6.1 Sol. Reviewed 2026-10-03, final native checks at approximately 18:42 UTC. Exclusive editor ownership granted after Implementer's explicit no-in-flight handback. No delegation, gameplay/source/asset changes, QA fixtures or UI input were performed.

**Acceptance remains incomplete.** Focused independent source, offline arithmetic and live scene configuration checks found no confirmed blocking defect. These checks do not pass any cooked interactive acceptance scenario. Desktop lock observed in implementation evidence prevents player input and the separate Project > Validate Project menu. Supervisor retains UI recovery ownership; no unlock reply was available at QA handoff.

## Revision and approval

`python tools/map_workflow.py plan specs/036-teach-pix-a-route/map.yaml --ready` independently exited 0: approval matches. Digest `ba1ce86c11543b9b0acdb438b98ee722884baf82cfa327c9e50c9791c0d79fcc`. Source SHA256 independently matches Implementer's final production checkpoint: `4C26AD737F697C0CC8A1E0DF795D426ADD4ECEBC68FC3FF5D945463B98743290`.

## Fresh independent checks

Evidence: `qa-native-readback.json`; existing expected inventory: `scene-inventory.json`, approved `map.yaml`/`plan.md`. Native schemas discovered before reads; calls serialized.

- Correct live level `/fn_shoreline_island/fn_shoreline_island`; name search returns 154 dedicated `hangar_route_` actors. Controller configured true, footprint array128, closure3, outlines8, lights2.
- Robot home `(6650,-13600,2364)`, scale0.8; crate `(6650,-13600,2469)`, scale0.4. Load pad `(7950,-13600,2316)`, scale `(2,2,.03)`; closure `(7300,-13600,2318)`, scale `(3,6,.04)`; Home/Test controls `(6500,-13700,2414)` / `(8050,-13700,2414)` match approved placements. These are configuration reads, not visual/collision gameplay observations.
- Resolved Verse wrapper `savedActor` references freshly for robot, crate, Home/Test buttons, first/last footprints and shared round-settings device. Dedicated references match inventory. Full ordered binding audit remains Implementer's `native-audit.json`; QA sampled meaningful endpoints rather than claiming a fresh complete audit.
- Freshly sampled robot, crate, closure base, first and last footprint props: `bNoCollision=true`, `bCanBeDamaged=false`, `bRegisterWithStructuralGrid=false`. Full component-level coverage referenced from Implementer audit, not rerun independently.
- Read focused controller source: real owner-character grounded XY observations, 128 retained-point/6000cm limits, observed movement and retained-chord safety checks, endpoint-only pad connectors, generation/owner checks before synchronous movement, closed slab geometry including grazing, four-step yaw turns, actual paired positional readback and crate deposit checks before lights. First-route array survives revision; no Academy reward/loadout call or route-ID selection found. Cancellation invalidates generation synchronously, so suspended loops check it before any subsequent movement. These are source findings; respawn/round ordering still needs runtime observation.
- `python -m unittest tools.tests.test_route_geometry -v` independently passed all5 tests including2000 randomized edge-oracle comparisons. Compared Python bounds/slab arithmetic with Verse. Both approved bypass examples pass, direct old route intersects, diagonal shortcut rejects, straight old-route safe stop `(7065,-13600)` is10cm before inflated closure entry. This exercises Python reference arithmetic, not compiled Verse execution.

## Referenced build/cook evidence

Implementer final native BuildAll: zero diagnostics (`final-build.json`). Final production local validation finished18:34:52 UTC; remote cook finished18:36:23 UTC, channel Completed Successfully18:36:27 UTC (`final-cook-completion.json`, `final-session.json`). Source hash matches this checkpoint. No fresh cook/build claimed by QA and no redundant session launched. Separate Project > Validate Project remains blocked. The existing native category query reported no matched validation warnings; this is limited log evidence, not a claim that every warning category was inspected.

## Acceptance scenarios

All setups and expected results use `spec.md` AC-01..11 on final production scene. No real-player steps could be executed while locked; no player route, time, comprehension, delivery or multiplayer result is inferred from native configuration.

| Scenario / requirements | Required setup and steps | Expected | Actual / status / evidence |
|---|---|---|---|
| AC-01 R-01/02/03 | Uncoached player approaches, starts Home, walks Load, finds Test; record duration/confusion | Instructions understood;2–3min first play target assessed | **Blocked**: no interactive approach or timing. Source/labels configuration only; qa-native-readback.json |
| AC-02 R-02 | Fresh runs, distinct near-edge turned first demonstrations | Different recorded and replayed paths | **Blocked**: no player recordings; real sampling present in source |
| AC-03 R-04/05 | Test valid first route and observe carry/deposit/light1 | Actual dedicated pair arrives within tolerance; only light1 | **Blocked**: no delivery observed; fresh home/binding reads and source gates only |
| AC-04 R-03/04/05 | After delivery1, Test Old Route | Stops before closure with crate, invalid mark, light1 retained | **Blocked**: runtime absent; reference safe-stop arithmetic passes |
| AC-05 R-05/06 | Complete lower bypass, fresh run upper bypass | Both actual deliveries grant light2 | **Blocked**: both reference polylines safe; no actual walking/playback |
| AC-06 R-02/07 | Pause/backtrack/indirect route; jump/outside/warp/closure/overlength individually | Safe valid paths retained; specific retries preserve delivery1 | **Blocked**: safety/limit code reviewed; no rejection feedback exercised |
| AC-07 R-03/04/05 | Observe corner/closure envelope and marks; controlled endpoint/crate falsification, then restore and retest production | Envelope remains safe; pool<=128; false endpoint never credits | **Blocked**: no fixtures installed or falsification run. Sample native safety reads; source positional gate only |
| AC-08 R-08 | Cancel/Replay/departure/respawn/disconnect/round restart during recording/playback/finale | Old motion never resumes; clean state; revision keeps light1 | **Blocked**: no lifecycle scenario executed; generation checks reviewed |
| AC-09 R-08 | Genuine second player presses controls/walks near Load during owner's run | Isolation maintained | **Not run / unverified**: no genuine two-player session available; no matchmaking changes |
| AC-10 R-01/03/09 | Full muted-audio standing/crouched activity, exit and learning question | Clear marks/closure/labels; usable exit; understood revision | **Blocked**: no visual/player-comprehension observation |
| AC-11 R-01/08/10 | Final build/validation/cook, neighbor activity, spawn/respawn; shutdown | Prior behavior intact; final not Running | **Partial**: referenced native build/cook success; menu validation and interactive regressions blocked. Fresh shutdown state passes; does not pass whole AC |

## Findings and handback

No confirmed blocking source or native-configuration defect identified in this focused review. Runtime acceptance remains an open gate; this is not approval of gameplay quality. Next responsible role: Supervisor arranges desktop unlock, then this QA worker resumes interactive solo ACs and separate validation; real multiplayer remains explicitly unverified unless available. Any resulting defects return to Implementer through Supervisor.

Fresh native `GetGameState=Unconnected`, `GetSessionStatus=Disconnected`; no active game needed stopping. UEFN left open. No in-flight editor calls. Editor ownership released to Supervisor after final status read; QA report/data are the only files authored by this worker.
