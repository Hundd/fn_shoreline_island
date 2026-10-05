# Epic bundled skill snapshot

Asset: `/PCGToolset/Skills/Skill_PCGShapeGrammarDefinition.Skill_PCGShapeGrammarDefinition_C`

Description: Skill for generating, editing and using the Shape Grammar Framework — PCG-driven procedural layout generation along splines using ShapeGrammarDefinition, Rule, and Module assets.

The text below was extracted from the bundled skill's class default object. Runtime-generated inventories are not included.

## Shape Grammar Framework — Skill Instructions

This skill covers creating, editing, and inspecting ShapeGrammarDefinition and Rule assets from the PCGPrimitives Grammar system. These assets drive procedural layout generation along splines (roads, building facades, paths, etc.).

---

## How a ShapeGrammarDefinition Is Used

A ShapeGrammarDefinition is **not placed as an actor in the level**. It is a data asset referenced inside a **PCG graph** via the `Assign_ShapeGrammarDefinition` primitive.

Typical PCG graph flow:
```
Spline Input
  → [optional: Extract_Segments]        ← pre-segments curves into straight lines if needed
  → Assign_ShapeGrammarDefinition        ← applies the definition along the spline
      ├─ Footprints output               ← 2D polygon footprint of the generated layout
      └─ Points output                   ← points for each spawned grammar module
```

The `Assign_ShapeGrammarDefinition` primitive takes a spline (open, closed, or polygon) as its primary input and applies the definition's grammar rules to generate module placements along it. The `Size` parameter on the primitive controls the maximum cross-section width available for the definition to fill.

---

## System Architecture

```
Assign_ShapeGrammarDefinition (PCG primitive in graph)
  └─ ShapeGrammarDefinition → BP_ShapeGrammarDefinition   ← Tier 1: Shape Grammar Definition
                                 └─ Slots[] → STC_Slot      ← Tier 2: Slot struct
                                      └─ shape Grammar Rules[] → BP_ShapeGrammarRule   ← Tier 3: Rule
                                           └─ rule → STC_Rule             ← Tier 4: Rule struct
                                                └─ modules Infos[] → STC_Module ← Tier 5: Module
```

---

## Asset Classes

- **ShapeGrammarDefinition** class: `/PCGPrimitives/Grammar/BP/BP_ShapeGrammarDefinition.BP_ShapeGrammarDefinition_C`
- **Rule** class: `/PCGPrimitives/Grammar/BP/BP_ShapeGrammarRule.BP_ShapeGrammarRule_C`
- **Empty SGD template**: `/PCGPrimitives/Grammar/DataAsset/SGD_empty.SGD_empty`
- **Empty Rule template**: `/PCGPrimitives/Grammar/DataAsset/RULE_empty.RULE_empty`
- **PCG Primitive that uses the definition**: `Assign_ShapeGrammarDefinition` at `/PCGPrimitives/Primitives/Assign/Assign_ShapeGrammarDefinition.Assign_ShapeGrammarDefinition`
- **Rule PCG primitive**: `Assign_Rule` at `/PCGPrimitives/Primitives/Assign/Assign_Rule.Assign_Rule`

---

## Assign_ShapeGrammarDefinition Primitive Parameters

| Parameter | Type | Description |
|---|---|---|
| `ShapeGrammarDefinition` | Asset ref (`BP_ShapeGrammarDefinition_C`) | The definition to apply to the input splines |
| `Size` | Float (cm) | Maximum cross-section size available for the definition to fill. Scalable slots adapt to fit this size |
| `UseAttributeForSize` | String | If not blank, uses this attribute name from the input data to drive `Size` per-point |
| `SpawnAssets` | Bool | Whether to spawn the actual mesh assets |

**Inputs:** `PrimaryInput` — Spline, ClosedSpline, or Polygon2D

**Outputs:**
- `Footprints` — 2D polygon footprint of the combined generated layout. Reuse as an exclusion area (e.g. with `Compose_Exclusion`) to block other procedural content
- `Points` — points corresponding to each spawned grammar module

---

## Existing Examples (for reference)

### Blockout / Demo Definitions
- `/PCGPrimitives/Grammar/DataAsset/Bldg_Demo/SGD_Bldg_Demo.SGD_Bldg_Demo` — vertical building with 3 floor types
- `/PCGPrimitives/Grammar/DataAsset/Road_Demo/SGD_Road_Demo.SGD_Road_Demo` — simple horizontal road
- `/PCGPrimitives/Grammar/DataAsset/Road_Demo/SGD_Sidewalk_Basic.SGD_Sidewalk_Basic` — sidewalk definition
- `/PCGPrimitives/Grammar/DataAsset/Bldg_Advanced_Template/SGD_Bldg_Advance_Template.SGD_Bldg_Advance_Template` — advanced building

---

## ShapeGrammarDefinition Properties (`BP_ShapeGrammarDefinition`)

Property names are case-sensitive and must be passed exactly as shown.

| Property | Type | Description |
|---|---|---|
| `Slots` | Array of STC_Slot | Ordered list of slots in the cross-section |
| `main Grammar` | String | Controls slot ordering/repetition (e.g. `"L1, L2*, L3"`) |
| `rule Grammar` | String | Controls module placement within slots (e.g. `"C,W,Win*, D, Win*, W, C-"`) |
| `use Grammar` | Bool | Whether to apply grammar strings or place slots literally. Set to `false` when all slots should be placed exactly once with no grammar logic |
| `orientation` | Enum: `"vertical"` or `"horizontal"` | Vertical = building floors stacked; Horizontal = road lanes side by side |
| `Spawn on` | Enum: `"Segment"` or `"Spline"` | **Always set to `"Spline"`**. Segmentation is handled upstream by `Extract_Segments` |
| `Center base` | Bool | Center the definition on its base |
| `Centered Spline` | Bool | Center the layout on the spline |
| `Reverse Spline` | Bool | Reverse spline direction |
| `Description` | String | Human-readable description |
| `Minimum Size` | Float | Minimum cm size this definition can operate at |

---

## STC_Slot Struct (elements of the `Slots` array)

| Field | Type | Description |
|---|---|---|
| `symbol` | String | Grammar symbol identifying this slot (e.g. `"L1"`, `"C"`, `"Road"`) |
| `size` | Float | Width or height of the slot in cm. **Always verify against real mesh bounds** |
| `scalable` | Bool | Whether this slot stretches to fill remaining space |
| `mirror` | Bool | Flips the direction/orientation of the slot and its rules. Used to mirror a slot (e.g. `CurbL` vs `CurbR` use the same rule but opposite mirror values) |
| `offset` | Vector `{x, y, z}` | Positional offset applied to all rules in this slot. Z offset places slots at different heights (e.g. road surface at z=0, curbs at z=10, elevated highway at z=500) |
| `is corner` | Bool | Marks as a corner slot. When `true`, this slot's rule solves corners/curves instead of being placed linearly |
| `shape Grammar Rules` | Array of object refs | References to `BP_ShapeGrammarRule` assets. **Multiple rules can be assigned to a single slot** — they are all rendered simultaneously, layered on top of each other |

---

## Rule Properties (`BP_ShapeGrammarRule`)

The rule asset has a single top-level property:
- `rule` — a struct of type `STC_Rule`

### STC_Rule Struct Fields

| Field | Type | Description |
|---|---|---|
| `grammar` | String | Grammar string for module arrangement within this rule |
| `override profile grammar` | Bool | If true, uses this rule's own grammar string instead of the definition's `rule Grammar`. Almost always `true` in practice |
| `position on slot` | Float | Normalized position (0.0–1.0) within the slot width. `0.5` = centered |
| `modules Infos` | Array of STC_Module | Mesh modules mapped to grammar symbols |
| `use up vector` | Bool | Use a custom up vector for props that must remain upright |
| `up vector` | Vector `{x, y, z}` | Custom up vector, typically `{0, 0, 1}` for world-up |
| `rand Pos Range` | Vector `{x, y, z}` | Random position offset range (cm) |
| `rand Rot Range` | Vector `{x, y, z}` | Random rotation range (degrees) |
| `rand Scale Range` | Vector `{x, y, z}` | Random scale range (percent) |
| `pos Offset` | Vector `{x, y, z}` | Static positional offset (cm) |
| `override scale` | Vector `{x, y, z}` | Manual scale override. `{1,1,1}` = no override |
| `spawn Spline Mesh` | Bool | Use spline mesh deformation instead of static mesh placement |
| `spline Mesh angle Threshold` | Float | Angle threshold for spline mesh tangent continuity |
| `set Spline Mesh Roll` | Bool | Enable manual roll on spline mesh |
| `spline Roll Degrees` | Float | Roll amount in degrees for spline mesh |

---

## STC_Module Struct (elements of `modules Infos`)

| Field | Type | Description |
|---|---|---|
| `symbol` | String | Grammar token this module responds to |
| `mesh` | Object ref `{"refPath": "/Path/To/Mesh.Mesh"}` | The static mesh asset. Set to `"None"` to define an empty/gap module |
| `scalable` | Bool | If true, the grammar system may scale this module to fit. **Note: assumes `meshForwardAxis` is X** |
| `guessSize` | Bool | If true, uses mesh bounds to estimate module size |
| `size` | Float | Manual size in cm. **Always verify against actual mesh bounds** |
| `guessPivotOffset` | Bool | If true, auto-centers the pivot. **Prefer `true` for most environment meshes** |
| `pivotOffset` | Vector `{x, y, z}` | Manual pivot offset in cm |
| `meshForwardAxis` | Enum: `"X"`, `"Y"`, or `"Z"` | Which axis is the mesh's forward direction. **Always verify using `get_bounds`** |
| `flipForwardAxis` | Bool | Reverses the direction of `meshForwardAxis` |
| `debugColor` | LinearColor `{r, g, b, a}` | Debug visualization color (values 0–1) |

---

## PCG Attribute Names (used in BP_Read_ShapeGrammarDefinition)

These are the runtime PCG metadata attribute strings written by the reader Blueprint. They must match exactly in any downstream PCG graph nodes that read them.

| Attribute | Type | Description |
|---|---|---|
| `Slot ID` | int32 | Internal slot index |
| `SlotAsset` | SoftObjectPath | Reference to the slot's data asset |
| `Mirror` | bool | Mirror flag from STC_Slot |
| `Size` | float | Slot size |
| `Debug Color` | Vector4 | Slot debug color |
| `Rule ID` | int32 | Internal rule index |
| `Use Own Grammar` | bool | From STC_Rule |
| `Position On Slot` | float | From STC_Rule |
| `Module Grammar` | string | From STC_Rule |
| `Module Mesh` | SoftObjectPath | Module mesh reference |
| `Module Size` | float | Module size |
| `Module Debug Color` | Vector4 | Module debug color |

---

## Grammar String Syntax

This string defines the procedural grammar used to generate module combinations.

**Valid operators only:** `[]`, `{}`, `<>`, `*`, `+`, `,`, `:`
**Never use parentheses `()` — they are invalid and will break the system. Use `[]` for grouping.**

### Basic Syntax

| Expression | Meaning |
|---|---|
| `A` | Place module A exactly once |
| `A, B` | Place A then B once each in sequence |
| `A*` | Place A as many times as possible to fill available space |
| `A+` | Place A at least once, then as many times as possible |

### Grouping with `[]`

| Expression | Meaning |
|---|---|
| `[A, B]` | Place A and B together, once |
| `[A, B]*` | Repeat A and B together as many times as possible |
| `[A, B]2` | Place the combination exactly twice |

### Randomization and Weighting with `{}` and `:`

| Expression | Meaning |
|---|---|
| `{A, B, C}` | Randomly select and place A, B, or C once |
| `{A:2, B:1}` | Select A twice as often as B |

### Priority Selection with `<>`

| Expression | Meaning |
|---|---|
| `<A, B, C>` | Place A if enough space, otherwise B, otherwise C |

### How Grammar Applies

- The **Slot Grammar** (`main Grammar` field on the definition) controls which **slots** appear and how many times, using slot `symbol` values.
- The **Module Grammar** (`rule Grammar` on the definition, or per-rule `grammar` when `override profile grammar` is true) controls which **modules** appear within each slot, using module `symbol` values.

---

## Workflow: Inspecting an Existing Definition

```python
get_properties(
    "/Path/To/SGD_MyDefinition.SGD_MyDefinition",
    ["Slots", "main Grammar", "rule Grammar", "use Grammar", "orientation", "Center base", "Centered Spline", "Reverse Spline", "Description", "Minimum Size"]
)
```

To read a rule:
```python
get_properties(
    "/Path/To/RULE_MyRule.RULE_MyRule",
    ["rule"]
)
```

---

## Workflow: Creating a New Rule

1. Create a new data asset of type `BP_ShapeGrammarRule_C`:
```python
create_data_asset(
    folder_path="/Game/MyContent/",
    asset_name="RULE_MyLane",
    asset_type={"refPath": "/PCGPrimitives/Grammar/BP/BP_ShapeGrammarRule.BP_ShapeGrammarRule_C"}
)
```

2. Set the `rule` property with the full STC_Rule struct:
```python
set_properties(
    "/Game/MyContent/RULE_MyLane.RULE_MyLane",
    json.dumps({
        "rule": {
            "position on slot": 0.5,
            "override profile grammar": True,
            "grammar": "A*",
            "modules Infos": [
                {
                    "mesh": {"refPath": "/Path/To/SM_MyMesh.SM_MyMesh"},
                    "symbol": "A",
                    "scalable": True,
                    "guessSize": True,
                    "size": 100.0,
                    "guessPivotOffset": True,
                    "pivotOffset": {"x": 0, "y": 0, "z": 0},
                    "meshForwardAxis": "X",
                    "flipForwardAxis": False,
                    "debugColor": {"r": 0, "g": 0.5, "b": 1, "a": 1}
                }
            ],
            "use up vector": False,
            "up vector": {"x": 0, "y": 0, "z": 0},
            "rand Pos Range": {"x": 0, "y": 0, "z": 0},
            "rand Rot Range": {"x": 0, "y": 0, "z": 0},
            "rand Scale Range": {"x": 0, "y": 0, "z": 0},
            "pos Offset": {"x": 0, "y": 0, "z": 0},
            "override scale": {"x": 1, "y": 1, "z": 1},
            "spawn Spline Mesh": False,
            "spline Mesh angle Threshold": 0.998,
            "set Spline Mesh Roll": False,
            "spline Roll Degrees": 0.0
        }
    })
)
```

3. Save the asset.

---

## Workflow: Creating a New ShapeGrammarDefinition

1. First, create all needed Rule assets (see above).

2. Create the definition data asset:
```python
create_data_asset(
    folder_path="/Game/MyContent/",
    asset_name="SGD_MyRoad",
    asset_type={"refPath": "/PCGPrimitives/Grammar/BP/BP_ShapeGrammarDefinition.BP_ShapeGrammarDefinition_C"}
)
```

3. Set all definition properties including the Slots array:
```python
set_properties(
    "/Game/MyContent/SGD_MyRoad.SGD_MyRoad",
    json.dumps({
        "Slots": [
            {
                "symbol": "SW",
                "size": 200.0,
                "scalable": False,
                "mirror": False,
                "offset": {"x": 0, "y": 0, "z": 0},
                "is corner": False,
                "shape Grammar Rules": [
                    {"refPath": "/Game/MyContent/RULE_MySidewalk.RULE_MySidewalk"}
                ]
            },
            {
                "symbol": "L",
                "size": 400.0,
                "scalable": True,
                "mirror": False,
                "offset": {"x": 0, "y": 0, "z": 0},
                "is corner": False,
                "shape Grammar Rules": [
                    {"refPath": "/Game/MyContent/RULE_MyLane.RULE_MyLane"}
                ]
            }
        ],
        "main Grammar": "SW, L*, SW",
        "rule Grammar": "",
        "use Grammar": True,
        "orientation": "horizontal",
        "Spawn on": "Spline",
        "Center base": True,
        "Centered Spline": True,
        "Reverse Spline": False,
        "Description": "A simple road definition with sidewalks.",
        "Minimum Size": 600.0
    })
)
```

4. Save the asset.

---

## Workflow: Editing an Existing Definition

1. Read current values with `get_properties`.
2. Modify the relevant fields in Python.
3. Write back with `set_properties` — pass the **complete** struct for array fields (`Slots`, `modules Infos`). Partial writes overwrite the whole array.
4. Save the asset.

---

## Naming Conventions

- Shape Grammar Definitions: `SGD_<Description>` (e.g. `SGD_Road_Highway`, `SGD_Bldg_Office`)
- Rules: `RULE_<Description>` (e.g. `RULE_Car_Lane`, `RULE_Bldg_Floor_L1`)
- Organize assets in subfolders by type: `/Road_Demo/`, `/Bldg_Demo/`, etc.

---

## Advanced Techniques

### 1. Multiple Rules Per Slot (Layering)
A single slot can have **multiple rules** in its `shape Grammar Rules` array. All are rendered simultaneously, layered at the same slot position. Standard technique for compositing road surface + lane markings + props.

### 2. Mirror Flag for Symmetric Pairs
The `mirror: true` flag on a slot mirrors its rule. Use this to create symmetric pairs from a single rule asset:
- `CurbL` (mirror: false) and `CurbR` (mirror: true) both reference the same `RULE_Road_Curb`

### 3. Z Offset for Elevation
Use `offset.z` to place slots at different heights:
- Road surface: `z: 0`
- Lane markings (avoid z-fighting): `z: 1` to `z: 2`
- Curbs: `z: 10` to `z: 15`
- Elevated highway: `z: 500`
- Embanked/below-ground road: `z: -400`

### 4. Y Offset for Lateral Positioning
Use `offset.y` to shift a rule laterally within its slot, independent of slot width.

### 5. Tiny Slot Size for Overlay Rules
Slots that only carry props or overlays use `size: 0.01` or `size: 1`.

### 6. Empty/Gap Modules
Define a module with `mesh: "None"` and a specific `size` to create invisible spacing slots in the grammar.

### 7. `position on slot` for Fine Placement
`0.5` = centered, `0.84` = near the back edge (lamposts), `0.02` = near the front edge (road markings).

### 8. Corner Slots (`is corner: true`)
A corner slot's rule provides geometry filling the angular gap at spline corners. The rule contains progressively smaller angle pieces with a cascading priority grammar `C90*, C45*, C22*, C11*, C5*, C2*`.

### 9. `use Grammar: false` for Simple Definitions
When a definition has only one or two slots that should appear exactly once with no repetition, set `use Grammar: false` and leave `main Grammar` empty.

### 10. Pre-Segmentation with `Extract_Segments`
For straight-line placement, handle spline segmentation **upstream** in the PCG graph using `Extract_Segments` before passing the spline to `Assign_ShapeGrammarDefinition`. The definition always uses `Spawn on: Spline`.

---

## Key Rules

- **Always set the full struct** when writing array properties like `Slots` or `modules Infos`. Partial writes overwrite the array entirely.
- **Always save assets** after creating or modifying them using `save_asset`.
- **Symbol names** in grammar strings must exactly match the `symbol` fields in `STC_Slot` (for Slot Grammar) and `STC_Module` (for Module Grammar).
- **Never use parentheses `()` in grammar strings** — they are invalid. Use `[]` for grouping.
- **Always set `Spawn on` to `"Spline"`** — never `"Segment"`.
- **Always call `get_bounds` on source meshes** before setting `size`, `meshForwardAxis`, or `pivotOffset`.
- **Prefer `guessPivotOffset: true`** for environment meshes from external asset packs.
- **`scalable: true` assumes `meshForwardAxis: X`** — if a module uses a different forward axis, use fixed sizes instead.
- **Multiple rules on one slot** is the standard way to layer overlapping elements.
- **`mirror: true`** on a slot mirrors the rule — use it to create symmetric left/right pairs from a single rule asset.
- **Empty mesh modules** (`mesh: "None"`) are valid for controlled spacing gaps in the grammar.
- When the user doesn't specify a mesh, use the blockout primitives from `/PCGPrimitives/Grammar/Meshes/` as placeholders.
- Always inspect existing definitions/rules before editing them to avoid data loss.
- **A ShapeGrammarDefinition is never placed as a level actor.** It is always consumed by the `Assign_ShapeGrammarDefinition` PCG primitive inside a PCG graph.

---

## Available Meshes (PCGPrimitives Grammar Blockout)

Building meshes in `/PCGPrimitives/Grammar/Meshes/`:
- `L1_Wall`, `L1_Corner`, `L1_Corner_`, `L1_Door`, `L1_Window` (blue, 350cm tall)
- `L2_Wall`, `L2_Corner`, `L2_Corner_`, `L2_Door`, `L2_Window` (orange, 200cm tall)
- `L3_Wall`, `L3_Corner`, `L3_Corner_`, `L3_Door`, `L3_Window` (green, 50cm tall)
- Advanced building meshes in `Advanced_Building_Template/`: `SM_Bldg_Wall_S/M/L/XL`, `SM_Bldg_Win_S/M/L/XL`, `SM_Bldg_Door_S/M/L/XL`, `SM_Bldg_Column`, `SM_Bldg_Separator`, `SM_Bldg_CornerLeft_S`, `SM_Bldg_CornerRight_S`

Road/lane blockout meshes in `/PCGPrimitives/Grammar/Meshes/`:
- `SM_Lane_Car_400_500` — car lane (400cm wide, 500cm long)
- `SM_Lane_Bike_180_500`, `SM_Lane_Bike` — bike lane
- `SM_Lane_Bus_450_500` — bus lane
- `SM_Lane_Parking_300_500` — parking lane
- `SM_Lane_Sidewalk_300_500` — sidewalk tile
- `SM_Lane_Divider_15_500`, `SM_Lane_Divider_40_500` — road dividers
- `SM_Lane_Path_150_80`, `SM_Lane_Path_300_160` — footpath tiles


