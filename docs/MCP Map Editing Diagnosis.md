# MCP-Based Map Editing — Diagnosis and Recommendations

*Reviewed 2026-09-27 for `fn_shoreline_island`. Documentation only; the proposed workflow has not been implemented or benchmarked.*

## 1. Conclusion

Make a tested, reusable station the unit of map construction. Define its layout and bindings as structured data, apply changes through small sequential batches, and verify both editor state and the player experience before replicating it.

Batching can reduce agent/server round trips, but output quality depends on validating the design before repetition. Prioritize a complete reference station, anchor-relative geometry, reproducible configuration, and explicit acceptance gates.

## 2. Verified findings and limits

The review examined project source, local workflow guidance, feature evidence, current live MCP schemas, and Epic documentation. Counts describe the source snapshot on the review date.

| Finding | Evidence and interpretation |
| --- | --- |
| 32 Verse files and 412 `@editable` declarations | Counted recursively under `Content/`. |
| 334 device-reference fields, 61 `creative_prop` fields, 17 scalar fields | The device count includes three array fields. These are declarations, not assigned references on placed instances. |
| Repair station: 21 references and one integer | Nine buttons, teleporter, HUD, billboard, four props, four spawners, and progress device. |
| Editable arrays already exist | Journal trackers, data-blaster spawn pads, and prompt-blaster targets use arrays. |
| Recent verification evidence exists | 129 Markdown files under feature/global evidence directories, including September 27 reports. Looking only at `specs/evidence/` misses most evidence. |
| Sequential orchestration works for reads | One `execute_tool_script` call successfully queried `GetGameState` and then `GetSessionStatus`. No edit batch or performance benchmark was run. |

The previous estimate of 1,500–2,000 required calls was not measured and should not be used as a baseline. Source declarations do not account for placed instance counts, array lengths, shared targets, or existing bindings. Creating an actor is not required for every reference assignment.

Measure actual actors, reference edges, changed properties, editor operations, and outer MCP requests. A direct binding pass is proportional to the references processed; multiplying all devices by all fields does not describe its inherent complexity.

Absence from a particular skill does not prove that batching has never been used. Unavailable Git history also does not establish that recovery is impossible. Identify the actual available revision-control snapshot or backup mechanism before implementation.

## 3. Current editing surface

The map is `Content/fn_shoreline_island.umap`. Native Unreal MCP is available through the local editor. `.cline/mcp.json` documents the Cline connection; each active client must use its own configuration.

Use live discovery as the authority for exact names and schemas. The following routing was checked against the current connection:

| Concern | Toolset / operation |
| --- | --- |
| Browse/place Creative and Verse devices | `ValkyrieToolset.DeviceToolset` |
| Discover/read/write Verse device editables | `ListDeviceProperties`, `GetDeviceProperties`, `SetDeviceProperty` |
| Discover event/function binding options | `GetBindingOptions`; use event-binding tools for those connections |
| Native object properties | `ObjectTools.list_properties`, then corresponding get/set tools |
| Actor placement, transforms, geometry | `SceneTools`, `ActorTools`, `PrimitiveTools`, `StaticMeshTools`, according to the operation |
| Verse Scene Graph entities/components | `ValkyrieToolset.EntityToolset` |
| Viewport capture | `EditorToolset.EditorAppToolset.CaptureViewport` |
| Camera/projection | `GetCameraTransform`, `SetCameraTransform`, `WorldPosToScreenCoords` |
| Sequential orchestration | `editor_toolset.toolsets.programmatic.ProgrammaticToolset` |
| Verse compilation | `ValkyrieToolset.VerseToolset` |
| Play-in-Client and match state | `ValkyrieToolset.SessionToolset` |

`CaptureViewport` accepts a capture pose and optional annotation settings; `labeledActors` is returned metadata, not an input selection list. Screen projection locates an actor origin but cannot establish visibility, collision coverage, or unobstructed firing paths.

The local editor-safety and binding skills require sequential mutations with readback. A script can preserve this discipline: perform one mutation, read and assert its result, then perform the next. Keep all live-editor calls serialized, including calls inside scripts.

Use the owning schema for each object. `GetBindingOptions` describes events/functions, not Verse editables. Native device wrappers may require the documented `savedActor` binding adapter; do not treat Verse fields as ordinary UObject properties or generalize one reference format to every class.

## 4. Diagnosis

### Iteration cost

Separate agent round trips for repeated, predictable operations are a plausible source of overhead. Repeated schema discovery and rewriting similar placement instructions can add more. Their contribution has not yet been timed.

The project already contains binding readbacks and text inventories. The proposed improvement is a reusable specification and executor that compares intended and actual state, applies only necessary changes, and reports results. A Markdown inventory alone does not provide reproduction or rollback.

### Layout and gameplay quality

Features 015–020 document repeated orientation, support-clearance, restoration, and alignment changes. Feature 021 concerns interaction labels. This supports introducing a verified reference station; it does not establish that coordinate drift caused every correction.

Placement is not uniformly blind. Recent evidence includes editor captures, collision measurements, numeric readbacks, and cooked-client tests. The [hit-surface report](../specs/024-data-blaster-redesign/evidence/hit-surface-coverage-2026-09-27.md) records a measured correction followed by a remaining missed shot. Numeric geometry checks and runtime tests are complementary.

The stronger diagnosis is inconsistent acceptance coverage and unresolved failures. A successful transform write, screenshot, or compile does not prove usability. The [handoff report](../specs/024-data-blaster-redesign/evidence/handoff-2026-09-27.md) already distinguishes editor-proven bindings from unverified runtime behavior. Preserve that distinction throughout the workflow.

## 5. Proposed construction pattern

### A. Specify the player experience

Before island changes, create or update the feature's `spec.md`, `plan.md`, and `tasks.md` as required by `AGENTS.md`.

Describe the approach route, first visible instruction, interaction position, objective, feedback, retry/reset, and exit. Define testable clearances and coverage requirements. Establish a compact visual vocabulary for materials, colors, sign sizes, lighting, and spacing.

### B. Build one reference station

Graybox one complete station, bind its gameplay, and test its full loop before replication. Inspect approach, interaction, and exit views at player scale. Check readability, orientation, mount clearance, movement, wrong actions, success, and reset. Finish the visual treatment once layout and gameplay work.

Retain accepted dimensions, asset choices, configuration, and camera views as a reusable definition. Reuse can initially use an editor-side recipe; it does not require migrating the island to Scene Graph or adopting a native prefab system first.

### C. Define intended state as structured data

Use a machine-readable manifest, with Markdown generated as a readable report where useful:

| Data | Purpose |
| --- | --- |
| Schema/module versions and station ID | Identify and migrate the definition |
| Stable logical actor IDs and roles | Resolve objects without relying only on display labels |
| Asset/device types and required settings | Specify what must exist and how it behaves |
| Station anchor and local transforms | Reproduce geometry at different positions and orientations |
| Bindings between logical IDs | Express local and explicitly shared dependencies |
| Spatial constraints and camera poses | Repeat geometry and visual acceptance checks |
| Ownership scope and permitted changes | Protect unrelated actors from unintended edits |

Keep desired state separate from the observed inventory of actor identities, resolved `refPath` values, transforms/properties, and evidence. Revalidate paths against the editor. Stop on missing or ambiguous matches.

Make the manifest authoritative only for its declared scope. If a designer changes a managed value in the editor, reconcile that difference explicitly before applying it again.

### D. Compare, apply, and recover

1. Discover capabilities and schemas; inventory the target station.
2. Compute a reviewable difference: creates, updates, binding changes, and conflicts. Do not delete unmatched actors by default.
3. Save and establish a recoverable checkpoint before bulk edits.
4. Apply a small dependency-ordered batch: create/resolve targets, configure, then bind. Read back and assert each mutation before continuing.
5. Record completed operations and before/after values. Stop on failure and inspect partial state; execution scripts are not atomic transactions.
6. Save affected actors/assets and verify persisted values.
7. Reapply the same manifest. It should make zero changes and create no duplicates.

Keep compilation, content pushes, and runtime acceptance as separate stages. After a mutation timeout, inspect actual state before deciding whether to retry any operation.

### E. Validate before replication

Use three complementary gates:

- **Structural:** expected actors/classes, resolved bindings, station IDs, transform tolerances, settings, and save results.
- **Visual/spatial:** fixed approach and interaction captures, readable cues, coherent presentation, bounds/clearance checks, and coverage over the full animated extent where relevant.
- **Runtime:** real interactions or weapon hits, objective progression, wrong/retry paths, reset, solo flow, and multiplayer when state is shared.

Repeat structural checks for every copy. Verify a translated and rotated instance to test transform composition. Inspect each copy in its surroundings, and confirm references target the correct station or shared service.

Compile changed Verse, run UEFN project validation, and perform required playtests before marking corresponding implementation tasks complete. Record pending or failed checks explicitly. Stop the playtest game and verify its state at task completion; leave UEFN open.

## 6. Recommendations and priority

Original recommendation IDs are retained for continuity; implementation order changes.

| Priority | Recommendation | Revised scope |
| --- | --- | --- |
| First | **R6 — Reference station and relative placement** | Verify one station, then compose local transforms through its anchor. Record units, axes, pivots, and scale policy. |
| First | **R1 — Visual feedback during editing** | Inspect repeatable player views after meaningful layout batches, alongside numeric checks. |
| First | **R8 — Acceptance evidence** | Record structural, visual, and runtime results against requirements; a screenshot alone is insufficient. |
| First | **R2 — Sequential programmatic batches** | Use bounded scripts for repetitive known operations, with per-mutation readback and failure reporting. |
| First | **R5 — Tool routing** | Add the owning-tool decision table to shared workflow guidance and align it with live schemas. |
| Next | **R3 — Manifest and executor** | Pilot desired state, observed inventory, difference generation, and repeatable application. |
| Next | **R7 — Schema caching** | Cache by editor/toolset version and class identity. Refresh after relevant compilation, schema changes, or reconnects where compatibility cannot be established. |
| Selective | **R4 — Verse simplification** | Use arrays for interchangeable collections and named fields for distinct roles. Refactor for demonstrated maintenance savings. |

### Batching constraints

Call `get_execution_environment` before `execute_tool_script`, follow its current instructions, and inspect output schemas before composing calls. Use short helpers and return structured results. The current environment provides sandboxed orchestration through `execute_tool`, not unrestricted Python execution.

Batching reduces outer requests and context overhead while preserving underlying editor operations. It does not guarantee faster cooking, compilation, or saves. One successful read-only batch does not prove every mutation tool is compatible or that an entire feature belongs in one script.

### Transform constraints

Compose rotations and offsets through the anchor; coordinate addition alone does not support rotated stations. Epic documents a current XYZ/LUF mismatch in Python toolsets. Verify the coordinate adapter on a known small example before bulk placement, and visually confirm facing and support alignment.

### Verse constraints

Editable arrays reduce repeated declarations and loops but still require assignment of elements. They do not inherently reduce reference edges or guarantee one MCP write can populate them. Verify the actual property schema and write/read behavior first.

Existing `*_fixtures.verse` files contain challenge data, not editor map constructors. Keep persistent editor authoring separate from runtime behavior. Do not assume a runtime fixture device can spawn, bind, and persist arbitrary Creative devices; prove required capabilities before adopting that architecture.

## 7. Pilot and measurement

Use one repair control row containing buttons, mounts, labels, and gameplay bindings. Create its feature specification before implementation, using the next available feature number.

The pilot should:

1. Inventory and capture the existing row; establish a recovery checkpoint.
2. Define its anchor, managed actors/settings, bindings, constraints, and camera views.
3. Generate and apply a bounded difference through sequential orchestration.
4. Record operation readbacks, saves, and acceptance evidence.
5. Demonstrate that an unchanged second application performs zero mutations.
6. Verify a translated/rotated copy, including local/shared references.
7. Complete project validation and relevant solo/multiplayer acceptance before wider adoption.

Measure elapsed time to acceptance, outer MCP calls, underlying editor operations, schema-discovery overhead, failures, and corrective passes. Record editor version, station size, and whether compile/cook/session startup is included so comparisons are meaningful.

Set speedup targets after collecting a comparable baseline. Success requires reduced effort without weaker acceptance evidence. Scale to the island only after the pilot demonstrates repeatability and reliable failure recovery.

## 8. Sources

- [Repository guidelines](../AGENTS.md), [editor safety](../.cline/skills/uefn-editor-safety/SKILL.md), [device binding](../.cline/skills/uefn-device-binding/SKILL.md), and [spec workflow](../.cline/skills/uefn-spec-workflow/SKILL.md).
- [Repair station declarations](../Content/fn_shoreline_island_repair_station.verse) and [example challenge fixtures](../Content/fn_shoreline_island_signal_fixtures.verse).
- [Reference alignment](../specs/020-align-repair-buttons-to-return-reference/spec.md), [interaction labels](../specs/021-repair-button-interaction-labels/spec.md), and feature evidence linked above.
- Live tool schemas and read-only programmatic probe inspected 2026-09-27. Re-discover before implementation; schemas can change.
- [Epic: UEFN MCP](https://dev.epicgames.com/documentation/fortnite/uefn-mcp) — supported workflows, incremental edits, coordinate limitations, and editor hitching.
- [Epic: Editable Properties](https://dev.epicgames.com/documentation/fortnite/editable-properties-in-verse?lang=en-US) — editable references, arrays, and assignment of array elements.
