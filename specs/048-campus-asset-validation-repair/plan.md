# Repair plan

1. Discover live tool schemas and supported Creative prop templates for each diagnosed raw mesh.
2. Export complete affected actor/component state, inspect binding references, and save a recovery checkpoint.
3. Prove an equivalent native representation through a small validation pilot before applying serialized groups. Preserve transforms/materials/collision and verify counts/readback after each group.
4. Save and run UEFN validation/cook, record category-filtered diagnostics without signed URLs.
5. Stop session and verify nonrunning state.

## Design gate
This repair does not author a new map layout. An exact native Creative representation of existing passive assets is a technical compatibility fix. The design bundle in 045–047 remains the source of spatial/art intent; no synthetic map.yaml or approval is created for unchanged intent. If exact equivalence cannot be established, stop mutations and prepare review of the concrete alternatives.

## Coordination
Host: Codex CLI. Resolved worker model: gpt-6.1-sol from .agents/workflow-models.yaml. Original worker /root/implementer had unavailable tool exposure; replacement /root/repair_worker has live native MCP tool access and exclusive editor ownership assigned by /root.

## Measured compatibility decisions

- Native Blueprint defaults reproduce 10 diagnosed mesh families exactly, with the original transforms. The bench pilot passed native UEFN asset validation; the subsequent 10-family pilot showed only the StoreDisplay_02 Blueprint itself is disallowed. Collision remains NoCollision for decorative additions and the three original benches retain QueryOnly/BlockAll.
- CP_NeoSidewalk_Full was inspected as a paving alternative. Its native child uses Neo_Sidewalk_Str_1x1 but construction reasserts child rotation/collision. This trial was restored to the original mesh, transform and bounds before choosing another representation; no uncertain collision settings are rolled out.
- Supervisor /root, under the owner's continuing delegated passive-art review authority and explicit repair request, approved Engine BasicShapes Cube with existing project MI_CampusCream for the 592 paving actors. Each cube is compensated to the original world AABB, preserving footprint and top height exactly, with NoCollision. The expected visual compromise is loss of the original fine tile seams and beveled edges; the pale surface, route/layout and floor collision remain as before. This records actual delegated Supervisor review, not a claim of personal owner review of a new digest.
- Supervisor /root separately approved CP_Agency_Table_01 for the three StoreDisplay_02 work surfaces, preserving exact world AABB/top heights and NoCollision. Its actual native components are mesh, empty editor-only mesh and bounding box; no FX/gameplay component exists. All three world bounds match source exactly. Expected visual compromise is centered T-shaped feet and small tabletop panel details; see evidence/table-review.md and table-repair.json.

Full recovery/readback records are under evidence/before-*.json; the pre-mutation project was saved through native AssetTools. Per-group native replacement receipts are evidence/native-repair-*.json. No restricted Fortnite asset is copied or exported into project content.
