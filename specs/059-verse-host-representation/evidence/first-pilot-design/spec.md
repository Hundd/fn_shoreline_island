# 059 — Replace Agency computer host representations

User requested replacement of all Agency computers, explicitly prompt_blaster_target_0 and future placements. Hiding alone is insufficient. The user delegates this task's plan review to agents and reserves gameplay testing for manual work. No session, game, cook, push or playtest is permitted; the paused improvement automation stays paused.

## Requirements

- R1: Inventory actual mesh instances across the open level and classify actual purposes; include generic props and renamed hosts. Baseline is 71 computers among 3,618 inspected actors, with zero inaccessible actors (inventory.md).
- R2: Replace the mesh representation of each auxiliary host while retaining its exact actor GUID/path, script instance/class, full transform, native bindings, Verse editable references, folder, tags and enabled state. Keep target graphics, controls, hit surfaces and their collision unchanged.
- R3: Prove the actor-level native staticMesh override on a reversible one-actor pilot before rollout. Require runtime component update, suitable appearance/material, save, native Verse compilation, reacquisition and persistence evidence. Generic reflection is only a candidate mechanism until this succeeds. No class-default edits, stateful actor replacement or speculative component patching.
- R4: Use /VerseEngineAssets/Cube.Cube as a neutral gray grid editor locator (measured 100 cm cube, centered pivot). Pilot writes mesh only. Conditional rollout uses nonphysical runtime-hidden configuration for proven auxiliary roles; settings are not evidence of cooked behavior.
- R5: Apply an explicit future-placement configuration and readback process. Do not claim a verified project default/template unless one is independently established. Do not duplicate live bindings as a factory.
- R6: Preserve gameplay, reward, progression, replay, Return, reset and solo/shared behavior. Native editor-only validation and compilation must be recorded; gameplay acceptance stays manual.

## Acceptance scenarios

Given all actor descriptors, when the component census runs, then every matching computer has an exact role/baseline and all errors are counted (R1).

Given prompt_blaster_target_0, when its actor staticMesh is set through native ObjectTools, then the same actor and script render the cube on their existing mesh component with all transforms/references unchanged; otherwise rollback and stop (R2–R4).

Given the saved pilot, when Verse is compiled and safe actor reload or other supported disk persistence check completes, then the representation survives with identity and fields intact. Unavailable/rejected reload is reported, not treated as proof (R3).

Given a successful pilot and agent-reviewed rollout, when the other 70 hosts are configured in small groups, then all 71 have neutral meshes and auxiliary flags, and no actual target/control mesh or binding is changed (R2,R4).

Given a newly placed Verse device, when the placement process is followed, then actor and component meshes are read back as cube, auxiliary flags/identity are verified, and save/build persistence is checked. Generated class defaults remain honestly unchanged (R5).

Given the owner later runs gameplay, when spawning, shooting targets, completing/replaying each lesson and returning/resetting, then behavior and intended collision match baseline (R6; manual pending).

