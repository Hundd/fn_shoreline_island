---
name: uefn-map-implementation
description: Set a goal to implement an explicitly approved UEFN map plan through serialized Unreal MCP edits, then validate and playtest the required changes. Use after uefn-map-planning review approval in fn_shoreline_island or projects with the same workflow; not for unapproved design.
---

# UEFN Map Implementation

Implement the required changes in the approved feature bundle and carry them through gameplay verification. Resolve project paths against the target repository root.

## Required model and dispatch

The user requires implementation to run on a cost-controlled worker, not an inherited frontier model. The exact model is host-specific: read `worker_model` from `.agents/workflow-models.yaml` (the single source of truth) and resolve the entry for the host that is actually executing. Do not hardcode a model string in this skill, and do not silently substitute a different model.

Detect the host by the tools/config available, then dispatch on its native subagent mechanism:

- **Codex CLI** (`collaboration.spawn_agent` and goal tools present): dispatch `collaboration.spawn_agent` with `task_name: "implementer"`, `model: <worker_model.codexcli>`, and `fork_turns: "none"`. A full-history fork inherits the parent's model and cannot apply this override.
- **Claude Code** (`Task` tool and `.claude/agents/` present): dispatch a native subagent whose `model:` frontmatter is set to `<worker_model.claudecode>`.
- **Cline** (`spawn_agent` / `team_spawn_teammate` present): dispatch via `spawn_agent` / `team_spawn_teammate`. Cline's subagent tools expose no `model` override, so the worker inherits the parent model; record that `<worker_model.cline>` (i.e. `inherit`) could not be pinned.

Pass a self-contained message with repository root, this skill's absolute path, original request, approved scope/revision, feature and evidence paths, approval evidence and digest, acceptance criteria, assigned file ownership, goal state, and editor ownership/checkpoint.

An Implementer worker explicitly dispatched on the resolved model reads this skill and continues below; it does not recursively dispatch itself. Reuse only a worker originally spawned with that host's resolved model. An existing worker on another or unknown model must finish pending calls and release editor ownership before a replacement is dispatched with its checkpoint. Record the host, resolved model, and worker ID in coordination evidence. Do not silently substitute a different model, run implementation in the parent, or delegate implementation to a frontier-model worker. If the resolved model or dispatch is unavailable, report the limitation and leave implementation pending.

Creating or updating this skill does not dispatch implementation or start a goal. Parent coordination can use its existing model; the implementation worker owns the implementation goal and editor work.

## Establish scope and goal

Read `AGENTS.md`, `docs/AI_MAP_INSTRUCTIONS.md`, `docs/AI_MAP_WORKFLOW.md`, and the selected feature's `spec.md`, `plan.md`, `tasks.md`, `map.yaml`, `review.md`, generated implementation plan, and approval evidence. Read the project-local `.cline/skills/uefn-editor-safety/SKILL.md` and `.cline/skills/uefn-device-binding/SKILL.md` recipes. Use the available `unreal-engine-mcp-codex` skill for live editor operations.

Verify actual human approval of this scope and revision, not just an approved label. Do not fabricate approval. If approval is missing or stale, use the sibling [uefn-map-planning skill](../uefn-map-planning/SKILL.md) to prepare or refresh the review bundle and obtain approval before design mutations. Existing valid approval does not require another confirmation.

This workflow explicitly requests a goal for implementation. When invoked to implement changes, call `get_goal` first. If no unfinished goal exists, call `create_goal` with a concrete objective identifying the feature path, approved changes, and required validation, cooked playtests, evidence, and playtest shutdown. Omit `token_budget` unless the user explicitly requests one. If an active goal already covers this work, continue it; do not replace an unrelated unfinished goal. Report a conflicting goal and obtain user direction. If goal tools are unavailable, disclose that limitation and continue authorized work with `tasks.md` tracking.

Run from the repository root:

```powershell
python tools/map_workflow.py plan <path-to-map.yaml> --ready
```

Do not execute draft plans, stale approvals, or plans with unresolved blockers. Do not regenerate the approved bundle simply to make readiness pass. Preserve evidence and return changed design to planning and human review.

## Implement the approved delta

- Discover current MCP schemas and inspect the actual world. Resolve exact actor identities, assets, complete transforms, properties, editable references, and bindings. The generated plan describes intent; it is not executable MCP arguments.
- Compare current and intended state before edits. Reuse existing controllers, creative devices, prefabs, editable fields, ordered arrays, maps, and structs. Preserve working mission behavior, Prompt Lab target indices, and shared badge/Data Energy ownership. Do not treat pattern parameters as proof that a hardcoded controller is configurable, and never claim arbitrary sequences are supported by a hardcoded controller.
- Save a recovery checkpoint. Apply one logical group at a time with serialized editor calls. Discover property names before writing. Preserve rotation and scale when changing position; use complete transforms. Read back counts, transforms, settings, target order, and connections after each meaningful group, then save affected assets.
- Treat `.uasset` and `.umap` as editor-owned; never hand-edit or move World Partition external files. Keep changes inside the approved scope.
- Stop on ambiguous mutation outcomes; inspect state before deciding whether to retry. Record expected/actual values, call outcomes, and deviations under the feature's `evidence/`.
- Keep specs, plans, and tasks synchronized. Material layout or behavior changes invalidate the approval and return to planning; do not silently improvise missing mechanics or broaden scope.

## Verify and finish the goal

Read the approved acceptance scenarios and verifier role. Compare device counts (shared instances counted once), target IDs/order, transforms within declared tolerance, native settings, entry/exit gates, and progression/reward/reset bindings. Convert local meters with `world_cm = origin_cm + 100 * local_m` when the map contract uses those units.

Build changed Verse, run UEFN project validation, cook, and playtest spawn flow, objective progression, wrong-choice recovery, reset/replay, solo play, and multiplayer when devices share state. Verify learning clarity and return access. Record failures and intentionally retained warnings. Successful MCP calls and offline checks do not establish gameplay acceptance.

Check off each task only after corresponding validation or playtest evidence is recorded. Fix failures within approved scope and verify affected behavior; report unavailable controls or external blockers without claiming their checks passed.

Before every final response, stop any active playtest game through supported End Game or Stop Session controls and read back game state to verify it is no longer running. Leave UEFN open. Shutdown failure leaves required work unfinished.

Mark the goal complete with `update_goal` only when all required implementation, validation, gameplay acceptance, evidence, and shutdown work is actually finished. Follow the goal tool's rules for paused or blocked status; a first blocker does not justify marking blocked. Summarize changed zones/behavior, evidence, and any remaining limitations. If a budget was explicitly set, report final token usage returned by the completion tool.
