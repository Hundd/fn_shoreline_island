# Project entry point

Read [AGENTS.md](AGENTS.md) before working here. Map creation and redesign must
follow [docs/AI_MAP_WORKFLOW.md](docs/AI_MAP_WORKFLOW.md): structured spec,
offline preview, validation, explicit human review, then approved MCP execution.
The role skills are in `.agents/skills/` (dispatch) with shared recipes in
`.cline/skills/`, and are linked from AGENTS.md. Existing
MCP connection configuration is client-specific; do not replace it to adopt this workflow.
