# Bounded runtime verification proposal

Status: temporary A+B runtime scope authorized by the actual human continuation recorded in `evidence/runtime-authorization.md`; saved and cooked diagnostic implementation now exists. Original map.yaml, review bundle and digest remain unchanged. This temporary diagnostic phase is distinct from replacing the primary Skills game or accepting production gameplay. See `evidence/runtime-b-checkpoint.md` for measured results and pending independent QA.

## A — Execute actual Verse fixtures, with one diagnostic device

Add a temporary `fn_shoreline_island_popbridge_diagnostic.verse` creative device. Its OnBegin constructs the exact seven nodes, seven jump edges and eight receivers from the existing feature039 map contract, including the repaired route_stage and terminal metadata. Invoke the actual `fn_shoreline_island_popbridge_fixtures.self_check(nodes, edges, receivers)` once; print a unique run identifier, tested configuration/source hashes recorded in evidence, BEGIN, returned integer, and END. Return0 is fixture success; any positive code is failure, not a successful launch. This does not execute Verse in Python or invent an off-editor Verse command.

Place exactly **one** diagnostic device, label `test_039_popbridge_self_check`, at primary-bay local `[30,3,0.5]` = world `[-2200,-18700,2450]`cm, after read-only confirming the spot is clear. It has no gameplay subscriptions, target surfaces, props, teleporter bindings, progress/tracker reference or player input. Build Verse, save the new diagnostic actor, cook/launch a private test session, read the actual runtime log, stop the game and verify non-running state. Absence of the unique END/return0 log is inconclusive. A second run after a repaired source revision gets a different run identifier.

Expected evidence: build diagnostics, diagnostic actor ref/pose, source hashes, actual runtime log lines with result0, self_check test coverage and limitations, final game state. This can establish executed pure Verse branch/validation transitions; it **cannot** establish controller ownership, gun attribution, collision, grounded/character origin, teleport recovery, visible cues, native failures or fun. A01 remains partly open after this alone.

## B — Small physical controller/recovery harness, separate from production

Only if physical adapter evidence is needed, temporarily place three stable cube decks inside the measured primary floor, well away from the old control row at localY13m and gardening demonstration around localY27m. Proposed exact deck centers, **top surface** coordinates:

| Node | Local meters | World top cm | Size meters | State |
|---|---|---|---|---|
| 0 starter | [10,17,1.2] | [-4200,-17300,2520] | [4,4,0.4] | Initially built, route_stage0 |
| 1 created landing | [14.5,17,1.2] | [-3750,-17300,2520] | [4,4,0.4] | Initially hidden, route_stage1 |
| 2 terminal | [19,17,1.2] | [-3300,-17300,2520] | [4,4,0.4] | Initially built, route_stage2, terminal=true |

Two +X jump edges, each0.5m gap; final footprint localX8..21,Y15..19. Original localY3..7 strip was rejected by actual canopy planter and production computer collisions. Native readback supports this +Y1200cm test-only translation with identical geometry/behavior; see `evidence/harness-placement-review.md`. Catch floor sample is worldZ2412cm,108cm below stable deck top. Translate test supports/spawn/bay/catch bounds together. Do not remove/move/hide the existing floor, controls, gardening props, primary controller or retired bays. Routine complete placement readback and cooked collision checks remain required; if a real obstruction emerges, stop affected placement rather than moving production actors.

No ramp or new spawn pad was added. Existing island spawn routing superseded Play From Here, so the test-only subclass positions the character once after routing settles: catch measurement then starter. Those startup teleports are not gun or jump evidence. Actual standing origin is77.15cm above deck/catch surface; controller normalizes feet with35cm tolerance. Test bay/catch bounds are configured to the north-strip footprint. All acceptance jumps and rifle hits use actual Computer Use input.

Logical actor inventory: one temporary PopBridge controller, three creative-prop decks, five data_target assemblies with five damage trigger surfaces, a test ribbon/HUD, test Replay/Return buttons, and an **isolated** nursery_progress plus test tracker. Test milestone0 may be assigned to node1; node2 has no milestone. Shared production progress/journal/Core/Agent are never bound. Controller finale may call complete_challenge2 on the isolated progress only; it cannot award/change production Skills progress. Existing shared safe blaster/loadout and hub destination may be referenced read-only; do not change them. Use distinct test target namespace and labels.

Five receiver records: teaching Load/Heat/Pop from node0 (Pop creates node1); saved-routine receiver from node1 creates node2; finale from terminal node2 creates=-2. The terminal is initially solid as required by the current adapter, so this harness tests first-platform reveal plus saved-sequence execution, not a second-platform reveal. The full production course still must verify every platform and both physical branches later.

Each machine gets three actual movable, natively non-colliding mechanism props and three ordered VFX references; use measured native Sphere/Cube and known material assets. Instantiate complete reusable target assemblies, discovering exact native settings and support references through serialized schemas; do not count an unbound default creative_device{} as a functioning VFX/board/trigger. Record the complete supporting-actor allocation before placement, then exact count/transforms/bindings readback. Necessary support assemblies are diagnostic only, all labeled/prefixed `test_039_`; no production target subscriptions are repointed.

## Concrete runtime observations

Run on repaired source revision only. Record fresh actual logs/screenshots and expected/actual results:

- First Heat/Pop shot acquires an eligible starter owner only for feedback; tiny puff and named expected step appear, prefix remains0. Load advances named cue to Heat, then Pop. Check initial ribbon and muted visual cues (QA01/QA02).
- Real damage hits carry player attribution. First deck collision remains absent until Pop commit; moving mechanism restores its complete home transform; later receiver visibly executes Load/Heat/Pop once. Rapid hit while pending and consumed receiver cannot duplicate execution.
- Measure character grounded/position at starter and created landing. Step/jump into the catch floor after teaching and after landing1: time to recovered stable landing≤1s, prefix/saved/built/visited/consumed unchanged. Do not inject a native failure by editing production geometry. Teleport-failure handling can remain explicitly unverified unless a safe diagnostic failure method is separately resolved.
- Leave the small test bounds during final execution's last beat: geometry/reward commit loses authority before the next monitor poll (QA03). Verify isolated tracker state, restored mechanism and cancelled generation. Test Return/Replay/removal/round reset without binding production progress; actual round tests may restart the private game normally.
- Diagnostic self_check covers malformed terminal shortcut/duplicate edge/wrong-stage records (QA04); the physical two-edge harness does not replace full equal-branch parkour acceptance.

## Rollback, shutdown and evidence boundary

Before placement save a recovery checkpoint and record existing actor/asset identities. Every temporary actor and new source is enumerated; serialize editor calls, read back configuration, and save only affected diagnostic actors. Do not overwrite/map-rebind existing actors. If configuration cannot be authored safely through available schema, report that limitation before execution.

At implementation handoff stop game and verify non-running; leave UEFN open and preserve the saved harness for independent QA. After QA and authorized fixes, remove only enumerated `test_039_` actors through supported editor controls, save affected diagnostic packages, and verify original actor refs/settings and production progress bindings unchanged. Preserve diagnostic source/evidence; removal permission belongs to this explicitly bounded temporary setup, never to unrelated actors. Record any failed cleanup/shutdown honestly.

This proposal introduces no workflow/schema extension and no circular prerequisite: approval of a temporary test harness permits testing an unverified adapter; it does not declare the final map executable. Executed fixture/controller evidence can support only the capabilities actually tested. A01/A02 remain open where full branches, per-machine presentation, cancellation/native failure or geometry are still unverified. Final production placement still follows regenerated concrete review, actual applicable human approval and readiness checks; do not request already granted layout/source approval again.
