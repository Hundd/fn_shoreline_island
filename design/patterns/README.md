# Gameplay patterns

Read each `pattern.yaml` as a compact contract. Reuse its existing adapter before
inventing another implementation. The format is defined in
[MAP_SPEC.md](../MAP_SPEC.md); the workflow is in
[AI_MAP_WORKFLOW.md](../../docs/AI_MAP_WORKFLOW.md).

| Pattern | Current reusable basis |
|---|---|
| [spawn_room](spawn-room/pattern.yaml) | Spawn pads and shared Data Blaster loadout hooks |
| [knowledge_room](knowledge-room/pattern.yaml) | Prompt controller's timed Knowledge/HUD phase |
| [shooting_gallery](shooting-gallery/pattern.yaml) | Shared data_target and data_blaster; mission still supplies correctness |
| [target_sequence](target-sequence/pattern.yaml) | Prompt controller's fixed `[0,3,5,5,6]` sequence; no generic sequence engine |
| [classification_arena](classification-arena/pattern.yaml) | Contract only; inspect existing repair/variable-vault systems before adaptation |
| [wave_arena](wave-arena/pattern.yaml) | Contract only; non-combat learning batches |
| [reward_room](reward-room/pattern.yaml) | Existing progress manager, badge guard, replay and finale |
| [corridor](corridor/pattern.yaml) | Existing floor/ramp geometry and entry detection |
| [portal](portal/pattern.yaml) | Existing teleporter devices and unlock logic |
| [checkpoint](checkpoint/pattern.yaml) | Contract only; recovery lifecycle needs verification |

These are ten design contracts, not ten shipped prefabs. Device class names are
intent identifiers; discover actual UEFN types/properties before implementation.
