# Independent production source review

2026-10-04; `/root/gameplay_verifier`, gpt-6.1-sol. Offline source scope only. Implementer retains exclusive editor ownership. QA made no editor/MCP/UI calls, source edits, scene edits, approval changes or task changes. No shutdown claim for Implementer's current session; shutdown belongs to the live owner.

Reviewed actual spec, production-revision.md, production-scene.yaml, embedded map contract, production-human-approval.md/approval.yaml, production generator/profile, generic controller/fixtures, nursery station/progress and academy journal. Human “looks good” approval records digest809dcd27d05f7e0711635d560f2615ab543ffb18195ea0e5008e386395d8087a. Historical “awaiting approval” prose in production-revision.md is superseded by the actual approval evidence; QA does not grant design approval.

Actual source SHA256 checkpoint:

| File | Hash |
|---|---|
| popbridge_production.verse | D916722EACA7BE4ABF06AF06BF68E26BD59017BF8B9DD18C19F9F941AC58446C |
| popbridge_controller.verse | 6B42411B4EB47C0A823E26063A1929777EB43263103E667DB36D70FAF1D5F90D |
| nursery_station.verse | D25452AEEA4111FC3C32A7E15FC852681690927A9D690FED118640980C9E6358 |
| popbridge_fixtures.verse | 223A293E0685799E2612BE2D108F7F8991A8055C486DF939983CE2A575FAD433 |

## Expected / actual source checks

| Requirement | Actual review evidence / disposition |
|---|---|
| R01/R08 primary-only retirement | nursery_station lines253–257 Hide and retired_primary early return precede every legacy setup/subscription, including dormant Return. Defaultfalse preserves other actors' code path. Native primary flag and exact legacy retirement refs still require audit. |
| R02 wrong-first acquisition | controller lines161–189 accepts initial teaching shots only while inset-grounded starter, claims owner then delegates wrong-order handling; Heat/Pop retain prefix and produce next-instruction cue. Production lines117–124 rejects any existing station claim before setting station0. |
| R03/R08 motion and cancellation | controller execute checks owner/generation/round/bay before and after delayed beats and before commit; stale cancellation cannot clear a newer token. release clears presentation, resets generation and restores every captured mechanism home; teaching/puff delayed endings check generation. Landings only Show/Hide; no deck displacement. Physical collision/motion remains untested for this production checkpoint. |
| R04 equal routes / terminal | Generated seven nodes stages0,1,2,3,4,4,5; edges0→1→2→3→4/5→6. Receivers5/6 symmetrically create branch4/5; finale7 requires terminal6. Fixture validation rejects stage shortcuts, wrong terminal prerequisites and invalid physical gaps; landing delegates ordered graph prerequisites. Both routes have five jumps. Static branch center distances equal640.31cm. |
| R04 geometry/landing | Offline assertions verified embedded scene exact equality and all seven profile world centers against approved local origin; all seven edge gaps100cm. Deck tops2520, sizes600×400/400×400/400×800cm match contract. Full-footprint grounded jump credit is separate from20cm shooting inset; standing origin77.15/tolerance35 retained. Native prop centers top−20cm, scales/collision and actual crouch origin require readback/playtest. |
| R06 decor/Pix | Profile lines143–185: indices0–29 six pieces per built deck1–5;30–32 moustache on left commit;33–42 right container+overflow on right commit;43–47 finale basket base always shown;48–52 finale overflow on final commit. Reset restores captured decor/Pix homes and hides conditional pieces. Left Pix world(-2610,-17390,2520) matches approved pose; finale+520X/+460Y moves moustache with Pix back home. Right route need not show left moustache. No delayed decor transition bypasses generic commit guards. |
| R07 badge/Core/Agent | Milestones0/1 remain actual node1/node2 landing callbacks; milestone2 only guarded final execution. Same nursery_progress authority completes existing three flags and one-time badge guard; Replay resets attempt but does not reset progress. No duplicate award authority added. Tracker/native shared authority integration remains untested. |
| R08 journal/ownership | production lines126–141 only clears matching source6/module6/current-generation journal activity; station release requires its claimed flag plus station0. Generic release invokes hook before generation increments. Reports require current owner/claim/valid attempt. Replay releases old claim and reacquires only after teleport success; failure leaves cleared attempt and Return message. |
| R09 binding configuration | Profile counts7 decks/8 targets/24 mechanisms/24 instructionFX/8 puffs/8 flourishes/53 decor/2Return, namespace39 and target IDs0–7 checked. Prop IsValid and device nonzero poses reject missing defaults; target poses duplicate rejection prevents duplicated target records. Native identity/cross-player attribution not proven by these checks. |

`python -m unittest discover -s tools/tests -p test_popbridge_contract.py`: nine tests passed. Additional read-only Python assertions: embedded production scene equality, seven generated world centers, seven100cm gaps,53decor entries passed. These are YAML/source checks, not Verse execution. Implementer's BuildAll empty diagnostics is reported implementation evidence, not an independent live build or behavioral pass.

## Disposition and mandatory native handoff checks

No new reproducible actionable source defect found in this checkpoint. Accepted for continued native binding and cooked verification within approved scope; no production physical acceptance implied.

The approved profile relies on native overrides: catch min[-5200,-19000,2300], max[-1800,-15300,2480] and bay maxZ3300. Generic defaults retain narrower legacy catch bounds[-4600,-18500,2200]..[-2400,-15600,2480] and bay maxZ3200. Missing overrides would omit starter/finish catch regions (R05); actual editable readback is required before cook. Source does not itself seed native scales/collision/support transforms.

Profile supports_valid lines95–115 is not a comprehensive alias detector: a repeated valid mechanism/decor prop or nonzero-pose VFX reference can pass. For example, binding instructionFX[0] and[1] to the same valid native VFX passes these source checks; later asynchronous End could suppress another beat. This is a configuration counterexample, not evidence the worker actually duplicated refs. Perform authoritative savedActor/native identity audit across all support arrays, target surfaces/labels/cues, decks, Pix, Replay/Return and existing shared authorities; maintain disjoint independent mechanisms/effects and deck/decor identities. No custom-device equality assumption replaces that audit.

Still required: actual fixture self_check for production cooked profile, native counts/poses/identity/collision/protected-shell comparison, Project Validate, physical campus/ramp arrival, both full routes/five jumps,20cm rim, crouch/walk denial, each-gap<=1s recovery and teleport failure, Replay/Return/departure/round/final-beat cancellation, one-time badge/Core/Agent integration, readable muted feedback and learning/enjoyment observations. No live ownership acquired or pending QA editor calls.

## Offline delta retest — Return wrappers / label opt-in / board text

Later stable source checkpoint reported BuildAll[] by Implementer; QA again made no live calls. Actual hashes: production profile086DA5627B62B4CC8EB21A2DB65191D8B66CE43185139EA3717891DE91920C6C; shared data_target2B8C2AEF7EF47A380DEACF6195256CC21F75BA07EBE5C100E0CE52CAEDA11997; generatorEBC7CCECB8AA90332720F936047E356E04F7F1E4B1670D1164C37FC666D98CEB.

Accepted source deltas: profile lines21–22 exposes two native Return wrappers, line37 copies course_returns into inherited return_buttons before count/reference validation and generic initialize subscribes those same buttons. Generator emits the identical wiring. Neither routing nor owner-release semantics changed. Both distinct actual native Return identities still need QA readback.

Shared data_target line37 stationary_x_facing defaultsfalse; pulse_cues lines259–260 changes only opted-in X-facing label translation from legacy X−20/Z+200 to X−20/configured label height. Other default targets keep previous behavior. Y-facing branch lines261–270 remains independently controlled by stationary_y_facing/positive_y and wins if both flags set. Production first seven −X targets therefore require x=true,y=false; final −Y receiver requires x=false,y=true,positive_y=false. Source cannot verify those editable assignments or billboard rotation; later native audit must. Opt-in adds no target movement or hit-attribution changes. Existing X ring pulse is retained; label readability awaits actual cook.

Profile lines101–109 sets/show/updates mission and finale board text, Replay text and both Return text values after startup handshake and initialization. Short instructions preserve reviewed shoot/jump/reuse intent. Generator agrees. Mission/final native board refs are not included in supports_valid's nonzero-pose checks, so they require explicit identity/pose audit rather than treating successful profile initialization as proof they are bound. No observed actual missing binding asserted.

No new reproducible source regression found. Worker-reported183unique actors/133bindings remains implementation evidence until independent native/cooked handoff. These deltas do not establish physical acceptance, board readability, actual Return behavior or actor uniqueness. Implementer retains exclusive editor ownership; no QA pending editor calls or shutdown action.

## Offline diagnostic delta retest — 2026-10-04

QA made no editor/MCP/UI calls or source edits; Implementer retains exclusive live ownership. Actual SHA256: production profile `BBCDFD7E34678A245FA1DE54991209D6DB3323FF8E5CD913E06711F073F01321`; generator `7A4A1DEE6FE180B99AD7623A6EBA2D80A736E128D587EB696C9B7D441617540C`. Controller `6B42411B4EB47C0A823E26063A1929777EB43263103E667DB36D70FAF1D5F90D` and fixtures `223A293E0685799E2612BE2D108F7F8991A8055C486DF939983CE2A575FAD433` remain unchanged.

Profile lines42–45 now uses `supports_failure():int` and returns inactive for any nonzero result. Lines116 onward preserve strict validity, target ID/namespace/nonzero target/support poses, ring/cone IsValid, duplicate target-pose, effect pose, shared authority and Return pose checks; only diagnostic failure identifiers replace booleanfalse. Codes1000+index identify invalid prop in deck/mechanism/decor/Pix concatenation;2100..2700 distinguish target contract/support checks;3000/4000 ring/cone;5000 duplicate target pose;6000 effect;7000 shared support;8000 Return. In particular2500 is exactly target0's zero label_board transform, not a generic failure or permission to initialize. Success remains0. Count failure remains a separate early return before indexed references.

Read-only Python AST extraction asserted the generator's entire diagnostic/hook string appears byte-for-byte in saved production Verse, and verified fail-closed reference check→fixture self_check→await_target_startup→initialize order. PASS. Startup handshake, owner/release/journal hooks and gameplay controller remain unchanged. There is no relaxation accepting a zero label transform and no fixture bypass. Existing alias/native identity caveat remains: these diagnostics do not prove distinct native objects or intended label rotation/material/collision.

Worker BuildAll[] and corrected native seven full label transforms/positive ramp/material flags are implementation evidence pending independent native and cooked retest. Scratch branch/cook infrastructure recovery does not change this source verdict. No new actionable source regression found; this accepts the diagnostic delta for continued testing, not the production course.

