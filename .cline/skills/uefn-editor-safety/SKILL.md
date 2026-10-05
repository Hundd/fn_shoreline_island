---
name: uefn-editor-safety
description: Safe editor-operation rules for UEFN work through Unreal MCP. Use when making map/asset edits, searching the asset registry, or saving editor-owned assets.
---

# UEFN Editor Safety

Before map-design mutations, consume the approved planning bundle following
`docs/AI_MAP_WORKFLOW.md` and the uefn-map-implementation skill. Read-only
inspection can precede approval. MCP implements resolved design; if scale,
geometry, mechanics or target logic are missing, return to planning rather than
improvise.

- Treat binary `.uasset` and `.umap` files as editor-owned. Make asset and map
  changes through UEFN / Unreal MCP and save all affected actors. Do not rename
  or move `Content/__ExternalActors__` or `Content/__ExternalObjects__` (World
  Partition data) manually.
- Serialize editor calls: issue one editor mutation at a time and read back the
  result before the next.
- Save/readback audit every batch of edits (confirm exact transform or property
  values) before trusting them.
- Scope asset-registry searches to an explicit content folder. A global search
  currently encounters a missing `AmbientAudio` plugin path.
- Never commit `Binaries/`, `DerivedDataCache/`, `Intermediate/`, or `Saved/`.
- Prefer `ObjectTools.list_properties` before `get_properties` / `set_properties`;
  property names vary by class and cannot be guessed.
