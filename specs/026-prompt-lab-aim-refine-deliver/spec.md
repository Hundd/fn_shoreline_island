# 026: Prompt Lab - Aim, Refine, Deliver

Status: planning and offline blockout only, 2026-09-27. No scene or gameplay-code changes authorized. No approval record.

## Intent and baseline

Make Prompt Lab feel like helping Pix operate a machine: aim at WHAT, add WHICH ONE when the request is ambiguous, acquire the moving core, then choose WHERE. Short scripted AI hints explain the action. Reuse the working feature-024 gun mission, which supersedes feature 023's buttons. Feature 025 documents its current geometry; this feature proposes a tighter arrangement and lower hint board. The old controller and its blaster handoff remain intact.

## Requirements

- FR-001 Preserve the single shared blaster/loadout, nine target IDs in their existing array order, five-hit sequence `[0,3,5,5,6]`, Data Energy, participant attribution, badge guard, legacy handoff, replay and finale. No new gun spawner or controller.
- FR-002 Reuse the existing platform and west ramp. Propose a common firing area around local `(24,46,0)` and target anchors listed in map.yaml, with a 3m clear approach/return lane and no mandatory jump, sprint, precision-platforming or walk between shooting stages. Envelopes are annotations, not walls.
- FR-003 Present the existing 2-second spectacle, 7-second Knowledge/HUD explanation, and current stage/wrong-hit messages. Lower/reposition the existing board to local `(30,34,4)` facing west. These are authored Pix hints; no live generative AI, conversational NPC, extra hint button or adaptive hint escalation is promised.
- FR-004 Keep equal cyan cues for answer choices, orange objective cue only for LARGE, readable word labels, the visual small/large distinction and generous hit coverage. Proposed hit anchors are 2.2m above platform level. Preserve assembly offsets and verify actual mesh pivots, maximum pulsed ring footprint and outer-third hits before acceptance. Color must not be the only usable cue.
- FR-005 Wrong hits preserve stage and DATA and permit immediate retry. Inactive/completed targets cannot award again or block later shots. Keep the moving core's existing local Y motion of +/-2.5m, four seconds per leg, two-second handoff and freeze-on-acquire behavior; no punitive timer.
- FR-006 Preserve automatic finale eligibility, one-time Prompt Badge ownership and existing reward arithmetic: five accepted solo hits add 1 DATA each, finale adds 3, so a fresh solo completion totals 8. Replay retains DATA/badge and can earn further DATA under existing rules; do not incorrectly promise a one-time DATA reward.
- FR-007 Preserve shared-room reset: replay cancels delayed reactions/movement and restores room state; round reset clears round state/DATA via managers; last enrolled participant leaving the playspace resets. Walking outside the room alone does not reset or remove eligibility in current source. Late entry joins current shared stage without a fresh full intro. Do not silently change these policies.
- FR-008 Keep the west walking exit available throughout. Completion does not require walking to the module or using the rail. Preserve the existing rail/door/module geometry and enable timing; rail boarding and hub endpoint remain an inherited feature-024 test gap, not a verified return route. Reverse walking-route acceptance is required.
- FR-009 This phase produces an offline preview, generated plan, requirement-linked review and evidence only. Implementation requires resolved blockers, real human approval of the concrete revision, readiness check, serialized MCP, full readback, validation/cook and gameplay evidence. Finish with no running playtest and UEFN open.

## Given / When / Then acceptance

1. **AC-01 (FR-001/002/003):** Given a fresh player with the hub blaster, when they walk up the west ramp through the current entry zone, then the existing intro starts and BLUE/RED/GREEN activate; no button sequence, jump or reading detour is required.
2. **AC-02 (FR-001/004/005):** Given the color stage, when RED or GREEN is shot then BLUE is hit in its outer third, then wrong feedback preserves progress and BLUE advances once to 1 DATA. Text labels remain readable without relying only on hue.
3. **AC-03 (FR-003/004/005):** Given two blue sizes, when LARGE is shot and SMALL BLUE is tried before LARGE BLUE, then the prompt gains LARGE, the small choice safely rejects, and large blue succeeds (3 DATA). Both choices and RED have unobstructed shot paths from the firing area.
4. **AC-04 (FR-004/005):** Given acquisition, when the core moves within its 5m sweep and an early destination is shot, then only the core is active; hitting its outer third freezes visual/surface/cues and enables destinations (4 DATA).
5. **AC-05 (FR-005/006):** Given acquired core, when SCANNER and STORAGE are tried before REACTOR, then progress stays intact; REACTOR starts delivery and the entire finale completes, grants eligible badge ownership once and totals 8 DATA on a fresh solo run.
6. **AC-06 (FR-002/003/008):** Given a player completing from the firing area, when Pix delivers, then the core-to-reactor action is visible and module completion is communicated by board/HUD without a forced 40m walk. The player can walk back west without jumping. Rail boarding is tested separately and never inferred from enablement.
7. **AC-07 (FR-005/006/007):** Given intro, rejection, moving-core or finale state, when Replay is used, then stale work cannot advance or reward the new run; initial props return, DATA/badge remain and the intro restarts. Round reset clears DATA. Walking out/re-entry preserves the current stage; last enrolled player leaving the playspace resets it.
8. **AC-08 (FR-001/006/007):** Given two real players sharing the room, when they alternate/simultaneously shoot, join mid-stage, respawn or replay, then each stage advances once and per-hit DATA goes to the actual shooter. Existing enrolled-participant finale policy is retained; a player who never enrolled earns no room reward. Record the walked-out enrolled-player case explicitly.
9. **AC-09 (FR-003/004):** Given a first-time player, when they finish, then they can explain why LARGE resolves two blue cores and WHERE determines delivery; obtain feedback on readable hints, target visibility, forgiving aim and enjoyment. Recognize that fixed prompts test matching rather than free-form prompt writing.
10. **AC-10 (FR-009):** Given this planning revision, when offline check and preview review finish, then artifacts record assumptions and no approval/gameplay completion is fabricated; game state is CanStart or Unconnected. After future implementation, build/validate/cook and AC-01 through AC-09 are required before acceptance.

## Human decisions still needed

1. Does the compact Aim / Refine / Deliver layout with **scripted Pix hints** meet the request? Recommendation: yes; live/generated or adaptive hints need a separate reusable adapter design.
2. Keep the rail optional and the west ramp as the dependable design for return, or include a separately surveyed rail repair in the scope? Recommendation: optional rail; no rail mutations in this revision.
3. Keep the existing shared participation/reset policy? Recommendation: preserve it for this layout change. Room-exit reset or per-player progress would be new gameplay-code scope.

Answering these questions is not automatically approval to implement. Approval must identify the concrete generated revision, with blockers resolved first.
