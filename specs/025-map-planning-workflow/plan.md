# Implementation plan

Use Python 3.10+ and the already installed PyYAML 6.0.2. No web stack or editor dependency for planning. Implement a strict version-1 validation layer in Python, semantic checks, static SVG/HTML renderer and deterministic YAML plan compiler. Keep schema documentation beside the pattern library. No automatic MCP executor in v1.

Retain numbered feature prose as intent/acceptance authority; place machine-readable map.yaml and generated artifacts in the same feature directory. Store the Prompt Lab migration example here and reference feature 024 rather than altering its live gameplay requirements.

Use the existing .cline skill mechanism, routed explicitly from AGENTS.md for all agents; add a minimal CLAUDE.md pointer. Preserve both current MCP connection files and approval settings. Record human review in approval.yaml only after an explicit approval message; bind it to generated content hashes. Unknowns block execution checks, while draft checks remain usable for iteration.

Validation: focused Python unit/CLI tests including malformed specs, unsafe YAML, broken flow, target identity, device coverage, stale/tampered approval, deterministic generation and HTML escaping. Inspect the generated preview. Infrastructure checks can be completed with offline evidence; UEFN gameplay tasks remain pending unless actual editor/playtest evidence exists. Do not launch a playtest solely for documentation/tooling changes. Read final session state and stop any active game before handoff.
