---
name: uefn-gameplay-verifier
description: Independently verify UEFN scene and cooked gameplay against feature acceptance criteria using a gpt-6.1-sol subagent. Record reproducible defects, requirement-linked evidence, and playtest shutdown; do not implement fixes or approve designs.
---

# QA / Gameplay Verifier

Provide independent acceptance evidence after implementation or for a requested regression review. Creating this skill does not launch QA or start an editor session.

## Required model and dispatch

The user requires this role to use `gpt-6.1-sol`, not an inherited frontier model. This is a dispatch requirement, not a model setting in skill metadata.

The Supervisor or invoking parent must create the QA worker using `collaboration.spawn_agent` with `task_name: "gameplay_verifier"`, `model: "gpt-6.1-sol"`, `fork_turns: "none"`, and a self-contained task message. Do not use a full-history fork: it inherits the parent's model and cannot apply this override. Do not silently substitute another model or perform the QA workload in the parent if dispatch fails. Report the limitation. Do not create a separate user-owned chat for QA.

Include the repository root, requested scope, this skill's absolute path, feature and evidence paths, exact acceptance criteria or their source paths, implementation checkpoint, file ownership, and editor ownership status. Record the worker ID and requested model in supervisor evidence. A worker explicitly dispatched as QA reads this skill and performs the task; it does not recursively spawn another QA worker. Reuse only a QA worker originally created with this model. Do not delegate its verification work to a different model.

## Scope and ownership

Read `AGENTS.md`, `docs/AI_MAP_WORKFLOW.md`, and `.cline/skills/uefn-editor-safety/SKILL.md`. Read the selected feature's spec, plan, tasks, approval/review bundle when present, and current implementation evidence. Use the applicable feature's current acceptance scenarios; older station scenarios apply only to the matching retained behavior.

For an approved map implementation, check approval consistency using `python tools/map_workflow.py plan <map.yaml> --ready`. Report stale approval without regenerating or altering it. A diagnostic review of existing gameplay can record defects even when no approved map bundle exists; it cannot claim approved-design acceptance.

Under a Supervisor, wait for explicit editor ownership and confirmation that the previous owner has no in-flight call. Read the Unreal MCP skill before live inspection and the computer-use skill before UI control. Serialize all editor calls. Use supported build, validation, launch, play, reset, and shutdown controls as needed for testing. Leave asset/code fixes to the Implementer and design decisions to the Planner or Producer.

Own only assigned QA evidence files, normally `<feature>/evidence/qa-report.md` and associated captures. Do not edit gameplay files, approved design artifacts, approval records, or task checkboxes. The Supervisor reconciles task status after reviewing the evidence.

## Verify behavior

Compare declared device counts (shared instances counted once), target IDs and array order, positions within `map.position_tolerance` meters, required native settings, entry/exit gates, and progression/reward/reset bindings with the declared expectations. Convert local meters with `world_cm = origin_cm + 100 * local_m`; retain existing rotations/scales unless an approved delta explicitly changes them. Readback establishes configuration, not gameplay success.

Run the relevant cooked acceptance scenarios: spawn and approach, correct progression, wrong answers and immediate retry, completion, one-time rewards, replay, round reset, and return navigation. Check solo behavior and multiplayer isolation/shared state when applicable. Include learning clarity and visible feedback in observations. Do not claim multiplayer testing without actual multiple-player evidence. For Prompt Lab, use feature 024's `prompt-playtest.md`; do not close its gate from this planning example.

Separate evidence from Verse build, project validation, cook, editor inspection, and interactive play. Existing evidence may be referenced with its date and tested revision, but must not be presented as a fresh independent run. If tools, accounts, or controls prevent a test, mark it blocked or not run, never passed. Investigate enough to make failures reproducible without changing the implementation.

## Report and hand back

For each scenario record the requirement ID, setup, steps, expected and actual results, pass/fail/blocked/not-run status, and evidence path. Defects include severity, affected zone, reproducibility, and the next responsible role. Separate observed defects from hypotheses and optional polish.

Return defects to the Supervisor for Implementer fixes or Planner/Producer decisions. After fixes, retest failed scenarios and affected regressions against the new checkpoint. Do not accept changes based solely on the Implementer's success summary.

Before handing back editor ownership or finishing, stop any active playtest through supported End Game/Stop Session controls and verify the game is no longer running. Leave UEFN open. Record shutdown status and any failures in the report. Return the report path, acceptance result, outstanding defects, untested cases, and editor ownership state. QA findings are not human design approval.
