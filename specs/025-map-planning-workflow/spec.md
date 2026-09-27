# Map planning before editor execution

Status: infrastructure authorized by the user; Prompt Lab example remains Draft.

- FR-001: Map design requests MUST produce a versioned, validated YAML map spec before editor mutations.
- FR-002: Specs MUST reuse named pattern contracts and describe flow, dimensions, interactions, devices, completion and reset behavior.
- FR-003: An offline generator MUST produce a readable top-down preview and deterministic implementation plan.
- FR-004: Editor implementation MUST require explicit human approval tied to the current spec, patterns, preview and plan. Unresolved assumptions MUST block execution readiness.
- FR-005: Prompt Lab MUST be documented without rebuilding it or changing existing Verse/assets/configuration connections.
- FR-006: Project agents MUST use incremental MCP operations, readback, deviation reporting and gameplay verification.

Acceptance scenarios:

1. Given a valid map, when check runs without Unreal, then validation, HTML/SVG preview and a draft YAML plan are produced (FR-001/002/003).
2. Given invalid references, geometry, pattern parameters, mission order or device coverage, when validation runs, then it exits nonzero with actionable errors (FR-001/002).
3. Given no approval, changed artifacts or unresolved assumptions, when execution readiness is checked, then it exits nonzero and never calls MCP (FR-004).
4. Given Prompt Lab's current sources and recorded/live transforms, when the example is generated, then its existing five-hit sequence and nine target identities are preserved and uncertain layout is labelled (FR-005).
5. Given a future implementation, when a logical edit group finishes, then agents compare readback to the approved plan and preserve unresolved gameplay tests (FR-006).
