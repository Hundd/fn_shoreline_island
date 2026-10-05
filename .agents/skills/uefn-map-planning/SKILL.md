---
name: uefn-map-planning
description: Plan UEFN rooms, missions, challenges, and map changes using this project's pattern-backed specs and offline blockout review before human-approved implementation. Use in fn_shoreline_island or projects with the same map workflow; not for unrelated code or tooling changes.
---

# UEFN Map Planning

Based on `docs/workflow_template_01.md` in `fn_shoreline_island`.
Start with planning and blockout for the user's requested change. Do not mutate the Unreal scene or change gameplay code during this phase. Read-only MCP inspection is allowed.

## Load project context

Resolve paths below against the target repository root, not this skill directory. Read:

- `AGENTS.md`
- `docs/AI_MAP_INSTRUCTIONS.md`
- `docs/AI_MAP_WORKFLOW.md`
- `design/MAP_SPEC.md`
- `design/patterns/README.md`

This skill is the single planner/reviewer role. If required workflow files are missing, report the missing prerequisites rather than inventing a compatible schema or approval process.

## Producer input

When a Producer brief is supplied, read it alongside the original user request and current evidence. Carry its player problem, learning goal, scope, and success criteria into the numbered feature spec. Check feasibility and resolve assumptions through inspection. Return changes that materially alter the intended experience to the Producer or Supervisor. A brief is input to planning, not an approved design or a substitute for the review bundle.

## Prepare the concrete design

1. Inspect the existing mission, relevant Verse, reusable devices, assets, bindings, and latest evidence. Preserve working functionality and the user's learning intent.
2. Create or update the appropriate numbered feature directory under `specs/` with `spec.md`, `plan.md`, `tasks.md`, and `map.yaml`. Define requirement IDs and Given/When/Then acceptance scenarios before implementation; link tasks to requirements. Label measured positions separately from estimates; use local XYZ meters with an explicit world-centimeter origin, and do not silently turn schematic envelopes into walls.
3. Reuse existing gameplay patterns and Verse configuration. Distinguish measured facts from assumptions. Identify missing adapters or unsupported behavior; pattern parameters do not prove a controller supports arbitrary configuration. Use the reusable prompts in `design/prompts.md` when helpful.
4. Run from the repository root:

   ```powershell
   python tools/map_workflow.py check <path-to-map.yaml>
   python tools/map_gate.py gate <path-to-map.yaml>
   ```

5. Inspect the generated preview and implementation plan. Resolve the gate's coded `violations` first and judge its `advisories` before the prose review; the gate deterministically covers walking burden, target and interaction density, wrong-choice recovery, learning purpose, return access and orphaned targets, leaving sightlines and enjoyment to human judgment. Review normal arrival, useful sightlines, board readability, target density, walking distance, stage transitions, wrong-choice recovery, reward/return and reset, plus scale, accessibility, entry/exit gates, interaction density, learning purpose and controller capabilities. Separate physical routes from information overlays and ensure choices exercise the learning objective rather than just adding editor objects. Inspect target positions and active sets, shared-device counts and controller capabilities; passing geometry checks cannot establish collision, weapon coverage, visual readability or multiplayer fairness. Record requirement-linked findings, blockers, accepted tradeoffs and needed playtests in the feature's `review.md`. Review is advice, not human approval.
6. Resolve blockers where evidence allows, regenerate the review bundle after changes, and present clickable paths to the actual preview and implementation plan, proposed scene changes, assumptions, and unresolved decisions for human review.

## Approval and implementation boundary

Wait for explicit human approval of the concrete design before map-design mutations. Do not create an approval record on the user's behalf. After actual approval, record its evidence and the current `generated/review-manifest.json` review digest in `approval.yaml`, following the project workflow.

Run:

```powershell
python tools/map_workflow.py plan <path-to-map.yaml> --ready
```

Do not execute draft plans, stale approvals, or plans with unresolved blockers. Approval covers only its actual scope and revision; material design changes require regenerated artifacts and renewed human review.

## Hand off after review approval

When presenting the concrete preview and plan for review, tell the user that explicit approval will hand off to `$uefn-map-implementation` to set an implementation goal, apply the required changes, and verify them. Review findings alone are not human approval.

After actual human approval is recorded and `plan --ready` passes, invoke the sibling [uefn-map-implementation skill](../uefn-map-implementation/SKILL.md): read its instructions and follow them in the current task. Pass the feature path, approved scope/revision, approval evidence and digest, implementation plan, and acceptance scenarios. Continue through implementation and verification without asking for the same approval again. Do not merely recommend the skill or stop after planning when implementation is authorized.

If the user explicitly requested planning only, deliver the approved planning bundle and name `$uefn-map-implementation` as the next step; do not start implementation without authorization. Missing/stale approval, readiness blockers, or material design changes remain in planning for human review.

Before finishing any task, stop active playtest games using supported controls and verify they are no longer running. Leave UEFN open. Report a shutdown failure rather than claiming completion.
