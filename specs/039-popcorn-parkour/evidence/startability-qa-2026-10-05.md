# First-use/startability diagnostic — 2026-10-05

Independent original gpt-6.1-sol QA. Approved feature039 digest809dcd27d05f7e0711635d560f2615ab543ffb18195ea0e5008e386395d8087a preserved. Read-only source/current-state inspection and bounded actual input; no source, design, asset, actor, settings or approval edits.

## Actual state

User attachment codex-clipboard-2d0edc04-a8cb-4a21-a0a2-9b23d0d8bbba.png depicts Final PopBridge sign, rifle, Core0/8 and default hub next-objective HUD. Fresh SessionToolset GetGameState returned Running; GetSessionStatus Connected. Fresh focused Fortnite screenshot matched that view. The faint top-left text is insufficient on its own to infer Edit Mode; authoritative current state is Running. This is not a demonstrated session-start failure.

Captures: startability-running-before.jpg, startability-running-after-shot.jpg, startability-finale-aligned-shot.jpg. Actual rifle click attempts produced no visible objective/help response or progression. Aim moved during initial click; debug_tag is not enabled in this cook, so no receiver-hit callback log was available. Consequently successful target7 hit delivery is **not independently proven** by these attempts. The silent rejection mechanism below is independently confirmed from source, not mislabeled as an instrumented hit test.

Fresh current editor log contains POPBRIDGE_PRODUCTION FIXTURE result=0 at2026-10-05T02:46:09.141UTC. This establishes startup diagnostic success, not current physical starter acceptance.

## SQA01 — medium: wrong-end first use has no actionable guidance (R01/R10; R04 guard remains correct)

Reproducer: arrive on the initially built finish deck without teaching/claiming PopBridge; see “Final PopBridge / One shot reuses your skill. Replay | Return” and shoot the visible receiver. Expected: preserve route/award prerequisites while explaining that this is the finish and directing player to the ramp/LOAD starter. Actual current visual: no starter direction; default HUD says Next1 Prompt Workshop; no explanatory message observed. Controller handle_shot lines161–167 returns silently for no-owner instruction>=3/from_landing<>0 or nonstarter present_landing. Therefore final receiver7 cannot start the attempt and provides no explanation even when an actual hit reaches that guard. Source production lines108–112 sets finale copy without a starter redirect and labels Replay, not Start.

Replay is not an unowned-start workaround: controller replay lines398–408 requires owner==input_agent before release/teleport/reclaim. An unowned button interaction would do nothing under this source. Physical unowned Replay/E was **not run** because user input interrupted navigation. Do not relabel Replay as Start while retaining owner-only behavior and claim that solves the issue.

Responsible layer: Planner/Producer choose brief within-intent wayfinding/help copy; Implementer applies text/HUD feedback preserving strict acquisition, five-jump/finale and badge guards. Suggested message intent: “This is the finish. Start at the ramp: shoot LOAD → HEAT → POP.” A new unowned-start teleport is a behavior change requiring explicit scope review; it is not a QA fix recommendation to silently bypass prerequisites.

## SQA02 — low: finale label and board text overlap (R06/R10)

User attachment and fresh focused capture show “Final PopBridge” superimposed over “One shot reuses your skill. Replay | Return”. The two text sources compete at the same top line. A within-intent text spacing/newline correction can be reviewed by Implementer; no geometry/font redesign was performed. This is an observed readability defect, separate from the source-backed no-owner silence.

## Actual start procedure and test limits

The actual supported acquisition is a **gun hit on LOAD/HEAT/POP at grounded starter node0 inside its20cm shooting inset**. Approved starter center(-4800,-17280,2520feet), with LOAD receiver(-4520,-17400), HEAT(-4520,-17280), POP(-4520,-17160). The mission board source line105 says “POPCORN PARKOUR -> ramp. Shoot LOAD HEAT POP. Jump onto what you make.” The finale is at the opposite end, terminal center(-2200,-17080); it is not a start receiver. Normal approach follows the existing south promenade to about(-220,-16000), west corridor then x≈-4800 ramp south to starter. If session is CanStart, begin the game first; **this user's observed session already was Running**.

Historical Oct4 actual tests in legacy-button-cleanup-qa.md establish grounded normal ramp entry, physical LOAD/HEAT/POP acquisition, both full routes and earned Replay/Return. These are historical evidence, not a fresh Oct5 LOAD pass. Current physical starter/mission-board view and unowned Replay response remain not run. At the bounded Replay approach, sky reported user input detected; mandatory refresh showed foreground Codex rather than Fortnite. QA stopped UI control rather than competing with the user. No new full route, observer cook or setup was performed.

## Shutdown

Supported StopGame Completed; fresh GetGameState CanStart. No assets or settings changed and no pending calls. UEFN left open. Exclusive live ownership released to Supervisor for repair. QA findings do not approve design or accept all R01–R10.
