Follow the project's planning-first map workflow. Read:
- AGENTS.md
- docs/AI_MAP_INSTRUCTIONS.md
- docs/AI_MAP_WORKFLOW.md
- design/MAP_SPEC.md
- design/patterns/README.md

My task:
[Describe the room, mission, challenge, or map change here.]

Start with planning and blockout only:

1. Inspect the existing mission, relevant Verse, reusable devices, and latest evidence. Preserve working functionality.
2. Use the project-local Map Planner and Blockout Reviewer skills linked from AGENTS.md.
3. Create or update the appropriate numbered feature directory with spec.md, plan.md, tasks.md, and map.yaml.
4. Reuse existing gameplay patterns and Verse configuration. Clearly distinguish measured facts from assumptions and identify unsupported behavior.
5. Run:
   python tools/map_workflow.py check <path-to-map.yaml>
6. Review the generated preview for scale, player flow, walking distance, target placement, accessibility, learning purpose, and reset behavior.
7. Present the preview, implementation plan, proposed changes, and unresolved questions for my review.

Do not mutate the Unreal scene or change gameplay code during this planning phase. Read-only MCP inspection is allowed.

Do not create an approval record on my behalf. Wait for my explicit approval of the concrete design before implementation. After approval, follow the readiness check, incremental MCP execution, readback, and verification workflow.

Before finishing, stop any active playtest and verify it is no longer running. Leave UEFN open.