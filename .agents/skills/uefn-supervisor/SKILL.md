---
name: uefn-supervisor
description: Supervise UEFN map work by launching the editor through Epic Games Launcher, handling editor health and saves, and coordinating Producer, Planner, Implementer, and independent QA subagents. Use for supervised UEFN workflows; preserve human design approval before implementation.
---

# Supervisor

Act as the high-level coordinator for the user's UEFN task. Own editor availability, crash/dialog recovery, save verification, agent handoffs, and final evidence. Delegate product direction to a Producer when needed, concrete design to a planning subagent, and approved execution to an implementation subagent, and independent acceptance verification to a cost-controlled QA subagent (model resolved per host from `.agents/workflow-models.yaml`).

Creating or editing this skill does not itself launch UEFN or begin map work. During invocation, use the user's concrete map request or approved feature bundle; if neither exists and the user asked what to improve, dispatch the Producer to recommend a direction. Otherwise ask for the intended work before dispatching design or implementation. Editor-only supervision requests can proceed without inventing a map task.

## Load the operating context

Resolve the target project and read its `AGENTS.md`, `docs/AI_MAP_WORKFLOW.md`, and `.cline/skills/uefn-editor-safety/SKILL.md`. The usual project is `C:/labs/fn_shoreline_island`, but honor another user-selected project.

Read these sibling skills and require each worker to read its assigned skill directly:

- [Producer](../uefn-producer/SKILL.md) when selecting or prioritizing improvements
- [Planning](../uefn-map-planning/SKILL.md)
- [Implementation](../uefn-map-implementation/SKILL.md)
- [QA / Gameplay Verifier](../uefn-gameplay-verifier/SKILL.md)
- [Unreal MCP](C:/Users/Andrii_Polchaninov/.codex/skills/unreal-engine-mcp-codex/SKILL.md) for live editor work

Before Windows UI control, discover and read the installed `computer-use:computer-use` skill and its required guidance and confirmations references. Do not hardcode a plugin version, screen coordinates, launcher executable, launch URI, or MCP schema. Use available native tools and observe actual state. Report missing capabilities without claiming supervision is active.

## Editor ownership and startup

The Supervisor owns launcher/UI recovery. Exactly one participant owns live editor access at a time, including read-only MCP calls and UI interactions. Keep a compact coordination record under the feature's `evidence/supervisor.md` with phase, worker IDs, editor owner, last saved checkpoint, pending operation, incidents, and next action. Before a feature exists, keep this state in the conversation.

Inspect existing windows/processes and project identity first. Reuse the correct running editor. If it is closed, open Epic Games Launcher, find the installed Unreal Editor for Fortnite in its Library, and launch it through the observed launcher control. Open the requested `.uefnproject` and verify the loaded project. This skill invocation authorizes routine launch/relaunch for the requested task; do not repeatedly ask the user to start the editor. Account sign-in, missing installation, or ambiguous project selection may require user input.

Wait for the editor to finish loading, using bounded observations and meaningful progress updates. Discover native MCP toolsets/schemas and establish readiness. Do not interpret a loading window, long cook, or slow shader compilation as a crash. Do not start a duplicate editor because an MCP connection failed.

## Coordinate Producer, Planner, Implementer, and QA

For map work, use collaboration subagents, not new user-owned chats. Create or reuse the workers needed for the current phase and retain their IDs. Use the Producer for requests to suggest features, select improvements, or develop product direction; a concrete user-specified change can go directly to the Planner:

- **Producer:** Read `$uefn-producer`, inspect local project evidence, choose a recommended improvement, and return a feature brief with priority rationale, success criteria, constraints, and open questions. No gameplay mutations or design approval. Feed this brief and the original user request to the Planner when planning is in scope. A recommendations-only request ends with the brief.

- **Planner:** Read `$uefn-map-planning`, inspect the requested feature, prepare the spec/map/review bundle, and return concrete preview/plan paths, blockers, acceptance scenarios, and review digest. No gameplay mutations. Under this Supervisor, return an approved handoff to the Supervisor instead of implementing in the planner's own context.
- **Implementer:** Read `$uefn-map-implementation`. Initially acknowledge standby only; perform no editor calls, file edits, goal creation, or implementation until the Supervisor sends an approved ready handoff. Then implement, validate, playtest, and return requirement-linked evidence and verified shutdown state.

- **QA / Gameplay Verifier:** Read `$uefn-gameplay-verifier`. Independently verify the implemented feature, report requirement-linked acceptance evidence and reproducible defects, and confirm shutdown. Own QA evidence only; send fixes back to the Implementer. Dispatch after the Implementer has saved, stopped playtests, and released editor ownership.

Include the repository root, user request, relevant constraints, assigned file ownership, editor-access rule, and actual human approval evidence when applicable in each dispatch. Keep default model settings for Producer and Planner. For Implementer and QA, resolve the required model per host from `worker_model` in `.agents/workflow-models.yaml` (the single source of truth), then dispatch on that host's native mechanism: Codex CLI `collaboration.spawn_agent` with `model: <resolved>`, `fork_turns: "none"`, and `task_name: "implementer"` / `"gameplay_verifier"`; Claude Code native subagents with the resolved `model:` frontmatter; Cline `spawn_agent` / `team_spawn_teammate` (no `model` override, so the worker inherits the parent model — record that limitation). Use the same resolved model even for initial standby dispatch. Never inherit the Supervisor's model for Implementer or QA on hosts that support an override, and never silently substitute a frontier model. If the resolved model or dispatch is unavailable on a host, report that role's work as pending/not run. Reuse only workers originally created with the resolved model; record host, requested model, and worker ID in evidence. Replace existing Implementer/QA workers on another or unknown model only after pending calls finish and editor ownership is released; pass the saved checkpoint to the replacement.

Producer, Planner, Implementer, and QA are authorized roles for this workflow. Do not create further agents without a concrete need and authorization. At most three workers can be active alongside the Supervisor, so schedule QA after an earlier worker finishes and capacity is available. If capacity is unavailable, wait or report the scheduling blocker; do not bypass QA's model requirement by running it in the parent. Creating these skills alone does not dispatch workers. If subagent tools are unavailable, disclose that coordination cannot be provided and offer sequential execution; do not pretend workers exist.

While a worker owns editor access, the Supervisor may inspect local logs and worker progress without touching editor/MCP/UI state. Arrange explicit checkpoints after inspection, mutation batches, saves, validation, and playtests. At a checkpoint, require the worker to confirm no in-flight editor call before transferring access. A message requesting pause or an interrupted agent is not proof its pending tool call stopped. During suspected failure, stop new dispatches and wait for pending calls to resolve or time out before recovery.

Use bounded agent waits interleaved with useful health checks and progress updates. Offline work can overlap only when it does not edit the same files or approved artifacts. All live-editor calls remain serialized across the whole team.

## Approval and handoff

Present the actual preview and implementation plan with unresolved decisions for explicit human approval. This approval requirement comes from the project's map workflow and the planning skill; agent review, general permission to supervise, and an `approved` label alone do not satisfy it. Resolve review preparation before asking. Reuse valid approval for the same scope and revision.

Have the Planner record actual approval evidence and the current review-manifest digest, then run `python tools/map_workflow.py plan <map.yaml> --ready`. Send the Implementer the feature path, approved scope/revision, human evidence, digest, generated plan, acceptance scenarios, and current editor/checkpoint state only after readiness passes. The Implementer rechecks readiness and follows its skill's goal workflow; do not create competing goals in the Supervisor or standby worker.

If implementation uncovers a material design change or missing mechanics, stop mutations, release editor ownership, and return the issue to the Planner. Regenerate and obtain renewed human review for changed scope/revision. Do not weaken readiness or approval checks to resume faster.

## Independent QA handoff

After implementation verification, pass QA the feature path, approved revision and digest, acceptance scenarios, saved checkpoint, implementation evidence, and known warnings. The Implementer's own checks remain required; QA independently tests acceptance without assuming those checks passed. Route defects to the Implementer and retest affected scenarios after fixes. Material design changes return to planning and human approval. Reconcile task completion against QA evidence; do not report overall supervised acceptance while required QA is failed, blocked, or not run.

## Dialogs, crashes, and saves

Read the actual dialog text and available controls before acting. Capture relevant text or screenshots in feature evidence.

- Dismiss clearly informational dialogs and acknowledge recorded errors when doing so does not discard work, accept terms, submit reports, or alter project settings. Record build/validation errors before closing their dialogs; dismissal does not resolve the failure.
- Save authorized changes using observed editor controls or discovered native MCP tools. When a save prompt includes unrelated dirty assets, inspect and preserve them; do not blindly save or discard other work. Unclear recovery/overwrite prompts remain pending for inspection or a precise user decision.
- Do not automatically submit crash reports, accept licenses, publish, change accounts, or choose destructive recovery options. Do not repeatedly click through an unknown modal.
- For a confirmed crash, preserve available logs, crash details, last operation, and last verified checkpoint. Do not delete caches or recovery files as a speculative fix. Relaunch once through Epic Games Launcher when safe; another crash at the same step stops automatic restart attempts and requires diagnosis or user action. Do not force-kill a potentially saving or cooking editor just because it is slow.
- After recovery, verify the project, rediscover the live MCP connection/schemas, inspect dirty/recovered assets, and reconcile actual actor/property state against the checkpoint. An ambiguous mutation must be inspected before retrying. Never replay an entire batch blindly or assume unsaved work survived. Resume the Implementer with the reconciled delta.

Require checkpoint saves before risky edits and after each verified mutation group. Track affected assets, save results, failures, and any remaining dirty assets. Verify saves from supported dirty-state/status queries or observed UI and saved-file evidence where available; a successful click alone is insufficient. Rebuild and retest affected behavior after recovery. The Supervisor verifies the worker's evidence rather than accepting a success summary alone.

## Finish or hand back

Completion requires the approved changes, required Verse build/project validation/cooked playtests, evidence-linked tasks, independent QA acceptance, and verified saves. Report unavailable checks as unfinished work. For tooling-only tasks, use offline evidence as allowed by project rules.

Before each final response, coordinate shutdown of any active UEFN/Fortnite playtest through supported End Game or Stop Session controls and verify the game is no longer running. Leave UEFN open. If verification or shutdown fails, state that limitation plainly. Do not mark implementation complete while required verification or shutdown is missing.

Summarize the delivered behavior, evidence, save/editor/session state, and blockers. This skill supervises the active task; it does not install a daemon or promise monitoring after the turn ends. Set up recurring monitoring only when the user requests it, using the supported automation workflow.
