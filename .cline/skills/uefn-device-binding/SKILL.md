---
name: uefn-device-binding
description: Bind and read/write Verse device references against editor actors in UEFN through Unreal MCP. Use when wiring a Verse device to placed actors, inspecting a VerseDevice script subobject, getting/setting device properties, or swapping a runtime creative_prop target.
---

# UEFN Verse Device Binding

Use the `unreal-mcp` toolset for all editor actor work. The current map is
`/fn_shoreline_island/fn_shoreline_island`.

## Core recipe

1. A Verse-authored device is placed in the editor as a `VerseDevice` actor.
   `DeviceToolset` `GetDeviceProperties` / `SetDeviceProperties` takes that
   outer `VerseDevice` actor.
2. Inspect the Verse object's `script` subobject with `ObjectTools` — but
   reading Verse fields directly through `ObjectTools` **fails**. Do not read
   `.verse` fields as plain object properties.
3. Get the native device wrapper objects through `GetDeviceProperties`. Read and
   write their `savedActor` field through `ObjectTools`.
4. Bind a custom Verse device reference into a placed actor with
   `SetDeviceProperty`, using the target script object's `refPath`.

## Actor / mesh choices

- `FortStaticMeshActor` — fine for static graybox geometry; **does not work** as
  a runtime `creative_prop` target (invalid `TeleportTo` / `creative_prop`
  behavior).
- For moving / `creative_prop` targets, use a native `BuildingProp` actor with
  its `StaticMeshComponent0` mesh set and `Mobility` = `Movable`.

## Safety

Follow `.cline/skills/uefn-editor-safety/SKILL.md` for editor-call safety:
serialize calls, save/readback, and scope asset-registry searches to a single
content folder (a global search hits a missing `AmbientAudio` plugin path).
