# Specialist dispatch and boundaries

This workflow applies to Learning Designer, Player Experience Reviewer, Technical Scout, Art Director, and Playtest Analyst. Read it before performing a specialist role. Creating or editing these skills does not start reviews or launch workers.

## Model and dispatch

All five specialists use `worker_model` from `.agents/workflow-models.yaml`. Read it at dispatch time; do not copy model IDs into skills or use `producer_model`. This is the user's initial model policy and can be updated later.

- Codex CLI or desktop with `collaboration.spawn_agent`: set `task_name` to the role's task name, `model` to `worker_model.codexcli`, and `fork_turns: "none"`.
- Claude Code: dispatch a native subagent with `model:` frontmatter matching `worker_model.claudecode`.
- Cline: use native `spawn_agent` / `team_spawn_teammate`; these tools have no model override. Record that `worker_model.cline` inherits the parent's model and cannot be pinned.

The parent dispatches a worker for a standalone specialist request or through the Supervisor. A worker already dispatched on the resolved model continues with its role and does not recursively dispatch itself. Give it the repository root, absolute skill path, original request, relevant evidence and revision, exact output ownership, and editor-access constraints. Record host, model, and worker ID. Reuse only workers with the correct model; release editor ownership and finish pending calls before replacing a mismatched worker. If the required model or dispatch is unavailable, report work as pending rather than silently substituting the parent or another model.

## Shared operating context

Read `AGENTS.md`, `plan.md`, `docs/AI_MAP_WORKFLOW.md`, and relevant current specs, source, reviews, and evidence. Follow superseding decisions. Keep scope tied to the user's request and distinguish observations, interpretations, and proposals. Cite local paths and precise source locations. Missing evidence is an explicit limitation.

Write only the assigned specialist report. By default use `specs/NNN-feature/evidence/<role>-review.md` for an existing feature, or `docs/specialists/<topic>/<role>.md` before a feature exists. Update the relevant report instead of creating duplicates; the coordinator assigns distinct paths for concurrent work. Include the request, date, feature revision or evidence inspected, findings, uncertainties, and handoff. Reports are advisory inputs, not approval or acceptance records.

Do not edit gameplay, Verse, devices, binary assets, approved design artifacts, `approval.yaml`, or acceptance task status. The Producer owns priorities, the Planner consolidates recommendations into the design/specs, the Implementer owns approved gameplay edits, and QA owns independent requirement verification. Material changes to approved design return to planning and human review.

Use offline evidence by default. Only the Technical Scout may request read-only live inspection in these specialist assignments, with the Unreal MCP skill and explicit serialized editor ownership. Other specialists hand evidence needs to the Supervisor or QA. No specialist starts a playtest. All editor calls, including inspection, remain serialized across the team.

Under the Supervisor, return the report path and a compact handoff to the parent. Do not spawn other roles or send messages to user-owned chats. The Supervisor calls only specialists relevant to the current uncertainty, schedules within available worker slots, and gathers their findings before Planner consolidation. Offline work may overlap only with distinct file ownership. Standalone requests end with the specialist report; do not initiate implementation.
