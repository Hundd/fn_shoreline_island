# AI Island Academy

UEFN project: `fn_shoreline_island.uefnproject`. Product direction is in
[plan.md](plan.md); planned gameplay and evidence live in [specs/](specs/README.md).

AI map changes follow the [planning and blockout workflow](docs/AI_MAP_WORKFLOW.md).
Use the [step-by-step instructions](docs/AI_MAP_INSTRUCTIONS.md) to run a map change.
Read [AGENTS.md](AGENTS.md) before implementation. Prompt Lab's first migration is
a [draft spec](specs/025-map-planning-workflow/map.yaml), with an
[HTML preview](specs/025-map-planning-workflow/generated/preview.html) and
[implementation plan](specs/025-map-planning-workflow/generated/implementation.yaml).

From the repository root, using Python 3.10+ with PyYAML:

```powershell
python -m pip install -r tools/requirements-map.txt
python tools/map_workflow.py check
python -m unittest discover -s tools/tests -v
```

The dependency is already available in this workspace. Commands do not launch
Unreal or alter the island. UEFN remains authoritative for Verse builds,
content validation/cooking and gameplay playtests.
