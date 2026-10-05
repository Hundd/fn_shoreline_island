---
name: pcg-shape-grammar-definition
description: Author and inspect Unreal PCG Shape Grammar definitions and rules for modular layouts along splines, including paths, facades, and corridors. Requires the PCG graph-generation workflow and live supporting tools.
---

# Skill_PCGShapeGrammarDefinition

Codex adapter for Epic's bundled Unreal Agent Skill. Source: `/PCGToolset/Skills/Skill_PCGShapeGrammarDefinition.Skill_PCGShapeGrammarDefinition_C`, read from UEFN 42.30 (CL 58557680) on 2026-10-05. This adapter contains the bundled instructions, not a replacement PCG engine plugin.

## Capability check and project integration

- Discover live Unreal MCP toolsets before use. The installation-time session exposed neither PCG tools nor AgentSkillToolset. The skill assets exist, but installing this adapter does not enable those tools.
- When AgentSkillToolset is exposed, discover its schema and load the original skill through GetSkills. Prefer the live generated instructions to this snapshot.
- Read [Epic's bundled instructions](references/epic-instructions.md) for domain guidance. Tool names there are references; discover current schemas before calling tools.
- Graph-generation snapshot placeholders `{Subgraphs}`, `{Nodes}`, and `{Examples}` require live skill generation/schema discovery. They are not available node inventories. Never invent substitutions.
- Follow the target project's AGENTS.md. In fn_shoreline_island, use the existing map-planning approval gate for player-visible changes, serialize editor calls, checkpoint and verify logical groups, and record cooked playtest evidence. Repository instructions take precedence over conflicting batching or screenshot guidance in the upstream snapshot.
- If required tools are absent, report that prerequisite and limit work to inspection/planning. Do not patch engine files, force-enable unsupported UEFN plugins, or substitute actor scattering while claiming PCG execution.
- Load the sibling [PCG graph-generation skill](../pcg-graph-generation/SKILL.md) before composing a graph that consumes grammar assets.

Source documentation: https://dev.epicgames.com/documentation/unreal-engine/working-with-pcg-and-llms-using-unreal-mcp-in-unreal-engine?application_version=5.8

