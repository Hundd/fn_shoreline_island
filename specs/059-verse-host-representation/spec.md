# 059 — Replace Agency computer host representations

User requested replacement of all Agency computers, explicitly prompt_blaster_target_0 and future placements. Hiding alone is insufficient. The user delegates this task's plan review to agents and reserves gameplay testing for manual work. No session, game, cook, push or playtest is permitted; the paused improvement automation stays paused.

## Requirements

- R1: Inventory actual mesh instances across the open level and classify actual purposes; include generic props and renamed hosts. Baseline is 71 computers among 3,618 inspected actors, with zero inaccessible actors (inventory.md).
- R2: Replace the mesh representation of each auxiliary host while retaining its exact actor GUID/path, script instance/class, full transform, native bindings, Verse editable references, folder, tags and enabled state. Keep target graphics, controls, hit surfaces and their collision unchanged.
- R3: Prove the native component Static Mesh field on a separately reviewed reversible one-actor pilot before rollout. The original actor staticMesh setter was rejected and remains null. Fresh UEFN Details inspection exposes an active Static Mesh asset picker on the existing StaticMeshComponent. Require suitable appearance/material, save, native Verse compilation, reacquisition and persistence evidence. UI availability and inherited-component editability metadata justify this bounded experiment, not a persistence claim. No class-default edits or stateful actor replacement.
- R4: Use /VerseEngineAssets/Cube.Cube as a neutral gray grid editor locator (measured 100 cm cube, centered pivot). Pilot writes existing component mesh first; only if Cube succeeds but unsuitable Agency MID persists, clear that component overrideMaterials through the native per-instance property/reset route. Preserve actor flags. Conditional rollout uses nonphysical runtime-hidden configuration for proven auxiliary roles; settings are not evidence of cooked behavior.
- R5: Apply an explicit future-placement configuration and readback process. Do not claim a verified project default/template unless one is independently established. Do not duplicate live bindings as a factory.
- R6: Preserve gameplay, reward, progression, replay, Return, reset and solo/shared behavior. Native editor-only validation and compilation must be recorded; gameplay acceptance stays manual.

## Acceptance scenarios

Given all actor descriptors, when the component census runs, then every matching computer has an exact role/baseline and all errors are counted (R1).

Given prompt_blaster_target_0, when its existing StaticMeshComponent0 Static Mesh field is set to Cube through the native Details field or matching ObjectTools component setter, then the same actor/script render the cube, actor staticMesh remains null and all transforms/references/flags remain unchanged; otherwise restore the captured component mesh/material state and stop (R2–R4).

Given the saved pilot, when Verse is compiled and safe actor reload or other supported disk persistence check completes, then the representation survives with identity and fields intact. Unavailable/rejected reload is reported, not treated as proof (R3).

Given a successful pilot and agent-reviewed rollout, when the other 70 hosts are configured in small groups, then all 71 have neutral meshes and auxiliary flags, and no actual target/control mesh or binding is changed (R2,R4).

Given a newly placed Verse device, when a successfully proven placement process is followed, then its existing component mesh is read back as cube, actor override stays at the native baseline, auxiliary flags/identity are verified, and save/build persistence is checked. Generated class defaults remain honestly unchanged (R5).

Given the owner later runs gameplay, when spawning, shooting targets, completing/replaying each lesson and returning/resetting, then behavior and intended collision match baseline (R6; manual pending).
