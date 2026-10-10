# Technical startup review

2026-10-10. Advisory offline review for feature060 R1/R2 screen visibility. Host: Codex desktop; configured worker model: gpt-6.1-sol; worker: technical_scout. No editor, session, or gameplay changes performed. The Implementer retains exclusive editor ownership.

Inspected current academy journal source, hub signs and field observations source, feature060 spec/plan, structure-and-yaw evidence, widget-facing evidence references, and cooked-facing-investigation.md. Later push/default-spawn observations below are the Supervisor's dispatch evidence, not independently observed by this reviewer.

## Evidence and constraints

| Behavior | Reusable source/evidence | Finding and remaining question |
| --- | --- | --- |
| Initialize existing Core screens | Content/fn_shoreline_island_academy_journal.verse:170–187,563–565 | OnBegin starts one loop after a0.25s sleep. Initial empty core_snapshot permits a first write. No evidence establishes that cooked billboard rendering is ready then. |
| Retry text after initial write | Same source:617–633 | Only a changed logical status writes. core_snapshot is assigned even if the board/light/name clause or Z>1000 guard prevented a write. A skipped initial write can therefore remain suppressed indefinitely until status or round changes. This is a verified control-flow weakness; occurrence in this session is unproven. |
| Explicit text visibility | Same source:624–629; Content/fn_shoreline_island_hub_signs.verse:55–69; Content/fn_shoreline_island_field_observations.verse:99–116 | Core path uses SetText and UpdateDisplay without ShowText. Other existing signs use all three every3s. These APIs and cadence have local precedent. Whitespace alternation in those controllers does not prove that alternation is necessary here. |
| Spawn/round refresh | Journal:396–402,440–445,494–521 | Spawn/join initialize HUD; they do not invalidate the global screen snapshot. Round does invalidate it. Visible0/8 HUD proves player UI exists, not successful billboard rendering. |
| Facing versus startup | cooked-facing-investigation.md and Supervisor dispatch | Cold PlayFromHere showed eight blank screens; after push/default return all eight were readable with one yaw180 and seven yaw0. This weakens a universal yaw-only explanation, but spawn point, push and time changed together. It does not isolate a streaming race or rule out angle-dependent housing occlusion. |

## Prioritized diagnostic and smallest candidate repair

1. Keep all eight approved yaw0 poses and geometry fixed. Reproduce a genuinely fresh cooked start at the same arrival view, record initial and3/6/10s frames, then compare a fresh default-spawn start. Do not use PushChanges recovery alone as acceptance evidence.
2. Candidate presentation-only diagnostic: in existing navigation_refresh retain immediate changed-status updates, and add one global3s text refresh deadline. At loop start compute whether the deadline is due. The first player's existing snapshot batch may use `changed` or deadline-due to call the existing SetText, then ShowText, then UpdateDisplay. Consume the due flag after that batch and advance the deadline only when due, so additional players do not repeat forced writes. Keep light TurnOn/TurnOff exclusively under the existing changed-status condition. Do not alter snapshots used by HUD, module completion, rewards, or badge logic. No additional loop or spawn subscription is required.
3. The3s retry recovers cached missed initial writes without relying on an arbitrary one-time startup delay. Explicit ShowText addresses visibility state separately. Both together are the smallest practical hardening candidate, but a successful combined test cannot distinguish which mattered. If cause isolation is needed, test retry alone then add ShowText. Do not add whitespace variation unless the unchanged-text retry demonstrably fails while visibility and bindings are confirmed.
4. If still blank after repeated presentation calls, obtain serialized runtime evidence of bound board identity/transform and issued writes before editing geometry. A persistent invalid binding is a separate defect; retries cannot repair it. Then inspect the same player's view from front and side to test occlusion/facing independently.

## Verification handoff

Build Verse and validate after any source fix, then cold-cook at the original PlayFromHere arrival and default spawn with no intermediate push. Require all eight full WAITING/RESTORED labels to render and stay readable at normal FOV; exercise one real existing lesson completion and verify corresponding screen/light, journal count and one-time reward remain consistent. Verify return and reset without accepting a warm-session-only result. Implementer/QA must stop and verify the game nonrunning at completion; this offline role started no session.

Startup readiness/streaming is a hypothesis, not an established cause. Current evidence supports testing presentation retries before changing the approved wall or board poses. This report grants no design approval or gameplay acceptance.
