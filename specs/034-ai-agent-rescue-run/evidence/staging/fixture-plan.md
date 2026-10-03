# Bounded cooked acceptance fixture — active temporary test setup

The production source passed a fixture-free Verse build, Launch Session validation/cook, and normal locked hub spawn on 2026-10-03. Independent QA stopped its baseline game and released editor ownership. The Implementer applied a reviewed temporary fixture for cooked acceptance and will remove it before final production validation.

## Scope and purpose

Temporarily position the one local test player once at the approved Dispatch firing area three seconds after normal hub spawn, while the seven-module gate is still locked. Seed exactly the seven existing prerequisite backing states at ten seconds. Do not grant the Agent badge, alter map actors, change matchmaking, or bypass the controller's normal entry test. All five decisions remain actual Pulse Rifle hits. The initial position is explicit test setup assistance: natural navigation from the hub and naturally earning all seven earlier modules remain separate, unproven checks.

The first controlled run attempted natural Dispatch-to-Route walking but the supported instantaneous key/autorun input overshot the Route firing radius and crossed mission bounds, causing an owner reset. For bounded mechanics verification, the revised temporary fixture positions the tester at Route only after the real Pix first leg reaches the closed gate, and at Check only after the original Medical prop physically drops at the lab and `rescue_actual_delivery[]` succeeds. Those position assists never create or advance mission state; they are clearly separate from natural walking acceptance. A generation change resets their one-shot flags for Replay. The final production source will contain no player teleport fixture.

The AC-11-only hook runs after the player deliberately shoots wrong choice C (`CRATE AT HOME`) at Delivery Check. It moves the original bound Medical prop from the lab back to its audited home and marks the test displacement. A subsequent deliberate B (`MEDICAL AT LAB`) must reject without a badge. On that physical rejection only, restore the original prop to the lab, clear the test displacement, and allow another deliberate B to award. Never add a player-facing mode or additional answer. Keep the existing final physical checks and shared award guard unchanged.

Add bounded diagnostic `Print` lines for prerequisite seeding, phase transitions, Pix/Medical transforms, owner station identity, physical reject/accept, and badge tracker. Source already logs wrong choices and movement failure. Do not log every movement frame. Use the diagnostics only to corroborate visible play, never as a substitute for cooked observation.

## Verification matrix for temporary run

1. Observe normal hub spawn, one fixture move to Dispatch at three seconds, and the locked state there before the seven-module seed at ten seconds. Confirm auto-start after the existing two-second wake-up and no route skipping. Record that hub-to-Dispatch navigation used test setup assistance.
2. Use actual rifle hits for remaining wrong choices and all correct choices. Record visible result and progress after each. The route positions are test setup assistance; record the actual Pix endpoint before each reposition. Natural walking of both transitions remains unverified.
3. At Delivery Check, test both wrong evidence choices, AC-11 physical reject and retry, badge once-only, Replay, Return, departure/reset and whichever cancellation controls are available. Record unsupported held-fire/multiplayer/round-reset scenarios explicitly.
4. Stop the cooked game, remove the entire fixture diff, search all `Content/*.verse` for fixture markers, rebuild, save, revalidate/cook production source, observe normal locked spawn again, and stop/read back non-running state. Do not check T-06/T-07 without the corresponding acceptance evidence.

The staged patch is `fixture.patch` in this directory. It must be reviewed against the then-current source before application; never apply blindly after another worker edits the file. Keep a production source copy/checksum and the exact temporary diff in evidence before any fixture build.

Production source SHA-256 before temporary edits: `3B79C01D3E16B52595D0C3A3E237ED5217FCAD6AC0125A2DF35452A2F191F94D` (`Content/fn_shoreline_island_bot_station.verse`, 2026-10-03 after fixture removal and successful production cook). Recompute it at QA handback; a mismatch requires inspecting the source diff before using the staged patch.
