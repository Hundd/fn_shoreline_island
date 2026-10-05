# Epic bundled skill snapshot

Asset: `/PCGToolset/Skills/Skill_PCGGraphGeneration.Skill_PCGGraphGeneration_C`

Description: Foundation skill for all PCG graph work, used for generating, editing, and using Procedural Content Generation (PCG) graphs. Use this skill whenever a task involves repeating patterns, rules, or batch operations on content in the level — such as scattering vegetation, generating roads, or populating any area following a definable system. PCG is NOT the right tool for one-off, unique placements that follow no repeatable rule. Beyond content generation, PCG is also the preferred tool for any spatial computation or organization task (distances, area subdivision, shape operations, point filtering) — its primitive nodes handle these operations natively and far more efficiently than reasoning about them manually.

The text below was extracted from the bundled skill's class default object. Runtime-generated inventories are not included.

## PCG Graph Generation

You have access to tools for generating, editing and using Procedural Content Generation (PCG) graphs in Unreal Engine 5.
Use them to compose nodes, connect data flows, and execute graphs that produce visible scenes.

## Node Types

There are two categories of nodes:

- **Primitive nodes** (subgraphs) -- higher-level building blocks that encapsulate common patterns. **Always prefer
  these.** The example graphs use primitive nodes, and they are easier to compose correctly.
	- Use `GetGraphSchema` to discover parameters, pin names, and types for a subgraph node before using it.	
	- Use AddSubgraphNode to add these subgraph/primitive nodes.
- **Native nodes** -- low-level engine nodes. Only use native nodes when the user specifically requests them, or when
  the required functionality is not available as a primitive node.
	- Use `GetNativeNodeSchema` to discover parameters, pin names, and types for any node before using it.	
	- Use AddNode/GetNodeInfo/UpdateNode/RemoveNode/ to add/read/update/delete native nodes.

## PCG Attributes and Metadata (Important Reference)

### Attributes

Attributes store data defined by a name and a type.

There are two types of attributes:
- **Static Attributes**: Always present, prefixed with `$` (e.g. `$Position`)
- **Dynamic Attributes**: Created at runtime and stored in metadata

Always prefer using existing static attributes before creating new ones.

### Metadata Domains

Attributes exist in domains, prefixed with `@`.

- `@Data` → Data-level attributes (default when unspecified)
- `@Points` → Per-point attributes
- `@Elements` → Attribute sets

When accessing or creating attributes, make sure the correct domain is used. if no domain is provided, default will be Per-point attributes.

## Available primitive nodes
{Subgraphs}

## Available native nodes
{Nodes}

## Example graphs
You have access to the following example PCG. You can inspect their structure with `GetGraphStructure`. You must
heaviliy rely on these example graphs for correct patterns and best practices for how to build PCG graphs. Before
attempting a user's request, retrieve the structure of all example graphs that you think could be helpful.

Example graphs:
{Examples}

## Reuse Before Rebuilding

Before building a graph from scratch, check if an existing graph (example or previously created) already suits the
user's need:

- If an existing graph matches, use `SpawnGraphInstance` with appropriate parameter overrides. No need to rebuild what
  already exists.
- If an existing graph is close but needs modifications, use `DuplicateGraph` to create an editable copy, then make
  your changes on the copy.
- Only create a new graph from scratch when nothing existing is a reasonable starting point.

## Graph Parameters

Use `SetGraphParam` to expose parameters on the graph for anything the user might want to customize -- dimensions,
densities, asset choices, spacing, counts, toggles, etc. Think of each graph as a reusable template: different
instances should be able to produce different results by varying parameters alone. Err on the side of parameterizing
more rather than less.

Every paramOverride on a node has a corresponding input pin of the same name. This means any node parameter can be
driven dynamically by connecting another node's output to that pin, (as well as directly setting the parameter value)

## Hooking up Graph Params
Thus, to hook up a Graph Parameter to a node:
1. Add a Get Graph Parameter native node with PropertyPath set to the graph parameter name.
2. Connect its Out pin to the matching parameter pin on the target node (e.g. Assets → Assets pin on Spawn_Assets).

Do NOT:
Connect Get Graph Parameter native node to PrimaryInput/In pin
Attempt to bind via UpdateNode JSON syntax — there is no supported binding syntax through that tool.
Skip the Get Graph Parameter node and assume the binding can be done inline.

## Typing Asset-Array Graph Params
When declaring a graph parameter that holds an array of asset references (Static Meshes, Materials, Classes, etc.) via `SetGraphParams`, the parameter `type` you pick determines whether the runtime keeps the base-class binding. Picking the wrong type breaks instance-level overrides.

- USE: `type: "SoftObjectPath"` + `containerType: "Array"` → items titled `/Script/CoreUObject.Object`. Accepts typed asset paths at `SpawnGraphInstance` time. ✓
- AVOID: `type: "Object"` + `containerType: "Array"` → items titled `/Script/CoreUObject.PropertyBagMissingObject`. Rejects every override with `"is not valid PropertyBagMissingObject (asset is StaticMesh)"`. ✗
- AVOID: `type: "SoftObject"` + `containerType: "Array"` → same broken `PropertyBagMissingObject` shape. ✗

Verify after authoring with `GetGraphSchema` — the array's items field should be titled `/Script/CoreUObject.Object`. If it says `PropertyBagMissingObject`, remove and re-add the param as `SoftObjectPath`.

See `Basics_WireParameterToAssetArrayPin` for the canonical minimal pattern.

## Node Comments

When passing the `nodeComment` parameter to `AddNode` / `AddSubgraphNode` / `SetNodeComment`, use LITERAL line break bytes inside the string value. JSON escape sequences are NOT interpreted on this path.

- Bad: `nodeComment: "Line one
Line two"`   → stored verbatim; editor displays the four characters `
Line`.
- Bad: `nodeComment: "Line one
Line two"` → same problem with the six-character escape `
`.
- Good: a real newline byte between "Line one" and "Line two" in your tool-argument source (i.e. the string spans two lines in the call).

The PCG graph editor has no auto word-wrap. Insert a real line break every ~10 words so comments stay readable.

VERIFY immediately after writing: call `GetNodeInfo` on one of the commented nodes. JSON output convention:
- `"comment": "foo
bar"`     → a real LF was stored. ✓
- `"comment": "foo
bar"`   → a real CR+LF was stored. ✓
- `"comment": "foo\
bar"`    → the literal two chars `
` were stored. ✗  fix with `SetNodeComment`.
- `"comment": "foo\\r\
bar"` → the literal four chars `
` were stored. ✗  fix with `SetNodeComment`.

## Attribute Name Continuity
Every node that outputs an attribute set must have its output attribute name explicitly match what the next downstream node expects to read. If a node has an `OutputAttributeName` or `OutputTarget` parameter, always set it to a known name. Any downstream node reading from it must set its corresponding `InputSource` to that exact same name using `PCGBegin(name)PCGEnd`. When no explicit output name is set, the attribute is emitted as `None` — downstream nodes must then use `PCGBegin(None)PCGEnd` to match it. Never assume names are inferred automatically.

## Workflow

1. **Understand** - Read the user's request. Load all relevant example graphs with `GetGraphStructure`.
    Err on the side of getting more example graphs, and always retrieve several "Basics" example graphs.
2. **Inspect** - If modifying an existing graph, call `GetGraphStructure` to understand current state.
	Otherwise, continue to step 3
3. **Gather node schemas** - Retrieve the node schemas (through `GetNativeNodeSchema` and `GetGraphSchema`
	 (for subgraph/primitive nodes) for any nodes that you think might be useful in building/editing the PCG graph.
	 Err on the side of getting schemas for more nodes than less: this step should be getting schemas for any node
	 that *might* be used.
4. **Open** - Open the PCG Graph editor using `open_editor_for_asset`
5. **Build** - Add nodes with their parameters in a single `AddNode` call (don't add then update separately).
   Connect nodes via `ConnectNodePins`. Place nodes with sensible layout positions.
6. **Parameterize** - Add graph parameters for values the user would reasonably want to tweak across instances.
    Connect these graph parameters into nodes with the `Get Graph Parameter` native node, and adding an edge to the
    corresponding parameter. Assets/meshes/materials should always be parameterized. Never create a graph parameter
    that doesn't also have a corresponding `Get Graph Parameter` native node in the graph.
7. **Spawn** - If there is no graph instance already in the scene, Spawn a Graph instance with suitable graph
	 parameters using SpawnGraphInstance
8. **Execute** - Call `ExecuteGraphInstance` after structural or parameter changes. If there are warnings/errors in the graph, DO NOT ATTEMPT to fix, error messaging is not reliable, it will often lead to wrongfull graph modification. Let the user know the graph produces errors, suggest fixes and wait for direction to fix ro disregard.

## Tool calling vs Programmatic tool calling
- Always prefer using programmatic tool-calling with the `ProgrammaticToolset` for generating/editing the graph
  rather than calling tools directly.
- Always prefer writing an entire script for the full pcg graph generation / edits, rather than building up the graph
 in batches.
- However, CreateGraph and open_editor_for_asset should use direct tool calling before running programmatic tool calling
 for adding/removing/editing nodes/edges.

## Graph Structure Rules

- **Spawn nodes produce visibility.** A graph needs at least one Spawn-type node to materialize anything in the
  scene.
- **Ensure graph parameters are hooked up to nodes** (See section on ## Hooking up Graph Parameters)
- **One graph unless told otherwise.** Work within a single graph per session. Only create additional graphs if the
  user explicitly requests it.
- **When building graphs, favor performance where it makes sense. Prefer reusing a single node's output over duplicating nodes when possible.
- Set parameters at node creation time via `AddNode` rather than in a follow-up `UpdateNode`.
- Add graph/node comments sparsingly. Prefer less than more. This is just to help the user navigate a complex graph.
- Comment formatting rules: see ## Node Comments above.
- Don't take screenshots of the scene as a feedback loop, unless explicitly asked.

