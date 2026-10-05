# Independent production QA followup — 2026-10-04

Verifier: original gpt-6.1-sol worker. Approved revision remains 809dcd27d05f7e0711635d560f2615ab543ffb18195ea0e5008e386395d8087a. This bounded followup supplements production-qa-report.md and production-qa-retest.md; it does not accept every R01–R10 case.

## Actual results

- **Physical finish Return activation/teleport verified (R08).** From an explicitly authorized terminal test-setup spawn, actual player approached the button at (-2060,-16830,2610). Final observed camera correction and physical E teleported the character to the visible hub. Fresh telemetry at 17:35:10.967 UTC reports (-700,1500,2489.15), grounded. See production-qa-followup-return-final.jpg and production-qa-followup-actual.log. No synthetic events or player-pose injection were used. This setup round had no course owner and Core 0; owned activity release and retained awarded Core were **not** verified by this Return result. Earlier blue-button aiming was Replay, not finish Return, and is not evidence of a Return defect.
- **Actual starter gun teaching progression verified through prefix 2 (R02).** Real Load shot at 17:24:28.885 yielded result 1/prefix 1/token 2; Heat at 17:25:04.015 yielded result 1/prefix 2. production-qa-followup-prefix.jpg shows LOAD, HEAT, NEXT: POP readable from the starter view. The initial next-Load caption has the defect below. Prefix-1 next-Heat exhaustive clarity remains unverified.
- Entry Return attempts from the starter did not establish a prompt within bounded aiming. Those attempts do not prove broken interaction logic; finish Return now demonstrates the physical mechanism.

## PQA04 — medium: initial teaching caption overlaps adjacent HEAT

Expected R02/R10: clear brief visual cues identify the next instruction without ambiguity. Actual initial starter view in production-qa-followup-teach.jpg shows the single-line NEXT: LOAD extending into adjacent HEAT text. Reproducer: acquire normal starter view, look slightly up before the first Load shot; inspect the three adjacent captions. Native restored label placements are retained, so this is a rendered text-width problem rather than the previously repaired zero-position/facing defect.

Source: Content/fn_shoreline_island_popbridge_controller.verse:355, teaching_cues(), assigns `NEXT: {instruction_name(state.prefix)}`. Recommended owner: Implementer. Supervisor has identified an intended-scope correction to place NEXT and the instruction on separate lines, followed by actual rendered retest of all three prefix states. No QA implementation edits made. PQA03 exhaustive clarity must not be treated as closed solely from prior native pose checks.

## Test setup and limits

Supported editor SetCameraTransform and Session StartSession Play From Here were used only as authorized test setup. StartSession location alone initially spawned at the hub while Spawn At Viewport Camera was unchecked; enabling the observed option produced actual starter and subsequent terminal setup spawns verified in telemetry. StopGame/StartGame retained the initial setup location, so a separate supported StopSession/StartSession established terminal setup. These positions are not arrival, jump, route, ownership or award acceptance evidence. Both full real routes and normal ramp arrival remain evidenced by prior independent reports.

Second Replay followed by a second full completion in the same award lifetime was not executed. Owned Return/Core retention, exact rim/crouch, callback final-beat cancellation, native teleport failure, multiplayer ownership and exhaustive journal/Agent interactions retain the limits recorded in previous reports. No new physical pass is inferred from compilation, source or Python tests.

## Shutdown and release

StopGame returned Completed; fresh GetGameState returned CanStart. Native production debug_tag was restored from 039-production-QA-followup to empty and read back empty. Targeted map save returned true and is_dirty returned false. Original editor camera was restored; Spawn At Viewport Camera was restored unchecked, recorded in production-qa-followup-restored.jpg. UEFN remains open. All calls completed; editor ownership explicitly released to Supervisor for the caption fix.
