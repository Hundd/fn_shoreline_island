"""Offline map validate/preview/plan/check. Never imports or invokes Unreal/MCP."""
from __future__ import annotations

import argparse
import hashlib
import html
import json
import math
from pathlib import Path
import re
import sys

try:
    import yaml
except ImportError:
    raise SystemExit("Install planning dependency: python -m pip install -r tools/requirements-map.txt")

import map_schema as schema

ROOT = Path(__file__).resolve().parents[1]
DEFAULT = ROOT / "specs/025-map-planning-workflow/map.yaml"
KINDS = {"spawn": "#42a86b", "target": "#e25757", "weapon": "#b377dc", "knowledge": "#329bd0",
         "exit": "#526476", "checkpoint": "#db8b29", "reward": "#c79c17"}


class Invalid(ValueError):
    pass


class UniqueLoader(yaml.SafeLoader):
    pass


def mapping(loader, node, deep=False):
    result = {}
    for key_node, value_node in node.value:
        key = loader.construct_object(key_node, deep=deep)
        if not isinstance(key, str) or key in result:
            raise Invalid(f"line {key_node.start_mark.line + 1}: non-string or duplicate key {key!r}")
        result[key] = loader.construct_object(value_node, deep=deep)
    return result


UniqueLoader.add_constructor(yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG, mapping)


def read_yaml(path):
    try:
        text = Path(path).read_text(encoding="utf-8-sig")
        if len(text) > 1_000_000:
            raise Invalid(f"{path}: exceeds 1 MB planning limit")
        if any(isinstance(token, (yaml.tokens.AliasToken, yaml.tokens.AnchorToken)) for token in yaml.scan(text)):
            raise Invalid(f"{path}: aliases/anchors are not supported; keep specs explicit")
        result = yaml.load(text, Loader=UniqueLoader)
        # Reject timestamps, sets, nonfinite values, and other implicit non-JSON data.
        json.dumps(result, allow_nan=False)
        return result
    except (OSError, yaml.YAMLError, TypeError, ValueError, RecursionError) as exc:
        raise Invalid(f"{path}: {exc}") from exc


def unique(items, label, errors):
    ids = [item["id"] for item in items]
    if len(ids) != len(set(ids)):
        errors.append(f"{label}: duplicate ids")
    for value in ids:
        if not re.fullmatch(r"[a-z][a-z0-9_]*", value):
            errors.append(f"{label}: invalid id {value!r}; use snake_case")
    return {item["id"]: item for item in items}


def patterns(directory=ROOT / "design/patterns"):
    result = {}
    for path in sorted(directory.glob("*/pattern.yaml")):
        item = read_yaml(path)
        errors = schema.check(item, schema.PATTERN, str(path))
        if errors:
            raise Invalid("\n".join(errors))
        if item["version"] != 1 or item["id"] in result:
            raise Invalid(f"{path}: unsupported version or duplicate pattern")
        names = [p["name"] for p in item["parameters"]]
        if len(names) != len(set(names)) or not item["debug"]:
            raise Invalid(f"{path}: duplicate parameters or missing debug requirements")
        result[item["id"]] = item
    if not result:
        raise Invalid("No pattern contracts found")
    return result


def inside(point, zone):
    return all(origin - 0.001 <= coordinate <= origin + extent + 0.001
               for coordinate, origin, extent in zip(point, zone["position"], zone["size"]))


def validate(data, library):
    errors = schema.check(data, schema.MAP)
    if errors:
        raise Invalid("\n".join(errors))
    warnings = []
    meta = data["map"]
    if data["version"] != 1:
        errors.append("version: only 1 is supported")
    if not re.fullmatch(r"[a-z][a-z0-9_]*", meta["id"]):
        errors.append("map.id: use snake_case")
    vectors = [("map.size", meta["size"], True), ("map.origin_cm", meta["origin_cm"], False)]
    for zone in data["zones"]:
        vectors += [(zone["id"] + ".position", zone["position"], False), (zone["id"] + ".size", zone["size"], True)]
    vectors += [(m["id"] + ".position", m["position"], False) for m in data["markers"]]
    vectors += [("connection.point", p, False) for c in data["connections"] for p in c["points"]]
    for name, vector, positive in vectors:
        if len(vector) != 3 or (positive and any(x <= 0 for x in vector)):
            errors.append(f"{name}: expected XYZ triple{' with positive dimensions' if positive else ''}")
    if errors:
        raise Invalid("\n".join(errors))
    zones = unique(data["zones"], "zones", errors)
    markers = unique(data["markers"], "markers", errors)
    devices = unique(data["devices"], "devices", errors)
    stages = unique(data["stages"], "stages", errors)
    unique(data["assumptions"], "assumptions", errors)
    if not zones or not stages or not data["player_flow"]:
        errors.append("zones, stages and player_flow must not be empty")
    if meta["min_path_width"] < 1 or meta["position_tolerance"] <= 0:
        errors.append("map: path width must be >= 1m and position tolerance positive")
    bounds = {"position": [0, 0, 0], "size": meta["size"]}
    param_types = {"string": str, "integer": int, "number": float, "boolean": bool, "strings": [str], "integers": [int]}
    for zone in zones.values():
        label = zone["id"]
        if not inside(zone["position"], bounds) or not inside([a+b for a,b in zip(zone["position"], zone["size"])], bounds):
            errors.append(f"{label}: zone outside map bounds")
        if min(zone["size"][:2]) < meta["min_path_width"] or zone["size"][2] < 2.5:
            errors.append(f"{label}: insufficient width/depth/headroom")
        if zone["pattern"] not in library:
            errors.append(f"{label}: unknown pattern {zone['pattern']}")
            continue
        pattern = library[zone["pattern"]]
        allowed = {p["name"] for p in pattern["parameters"]}
        for key in zone["parameters"]:
            if key not in allowed:
                errors.append(f"{label}: unsupported pattern parameter {key}")
        for p in pattern["parameters"]:
            if p["name"] in zone["parameters"]:
                errors += schema.check(zone["parameters"][p["name"]], param_types[p["type"]], label + ".parameters." + p["name"])
            elif p["required"]:
                errors.append(f"{label}: required parameter {p['name']}")
        for key, value in zone["parameters"].items():
            if key.endswith("_count") and type(value) is int and value < 1:
                errors.append(f"{label}.{key}: must be positive")
            if key in ("width_m", "duration_seconds") and type(value) in (int, float) and value <= 0:
                errors.append(f"{label}.{key}: must be positive")
            if isinstance(value, list) and not value:
                errors.append(f"{label}.{key}: must not be empty")
        if type(zone["parameters"].get("width_m")) in (int,float) and zone["parameters"]["width_m"] < meta["min_path_width"]:
            errors.append(f"{label}: corridor width below map minimum")
        for key in ("destination", "recovery_zone"):
            if isinstance(zone["parameters"].get(key), str) and zone["parameters"][key] not in zones:
                errors.append(f"{label}.{key}: unknown zone")
        classes = {devices[d]["class"] for d in zone["devices"] if d in devices}
        for needed in pattern["expected_devices"]:
            if needed not in classes:
                errors.append(f"{label}: missing required device class {needed}")
        for d in zone["devices"]:
            if d not in devices:
                errors.append(f"{label}: unknown device {d}")
        if pattern["implementation_status"] == "contract_only":
            warnings.append(f"{label}: {pattern['id']} needs a verified adapter before execution")
        for other in zone["overlap_with"]:
            if other not in zones or other == label or label not in zones[other]["overlap_with"]:
                errors.append(f"{label}: overlap_with must be reciprocal and reference another zone")
    zone_list = list(zones.values())
    for index, a in enumerate(zone_list):
        for b in zone_list[index+1:]:
            overlaps = all(max(a["position"][i], b["position"][i]) < min(a["position"][i]+a["size"][i], b["position"][i]+b["size"][i]) for i in range(3))
            if overlaps and b["id"] not in a["overlap_with"]:
                errors.append(f"{a['id']}/{b['id']}: undeclared overlapping zones")
    used = {d for z in zones.values() for d in z["devices"]}
    for d in devices.values():
        if d["count"] < 1:
            errors.append(f"{d['id']}: device count must be positive")
        if d["id"] not in used:
            errors.append(f"{d['id']}: device has no owning/using zone")
    target_ids = []
    for m in markers.values():
        if m["zone"] not in zones or not inside(m["position"], zones[m["zone"]]):
            errors.append(f"{m['id']}: marker outside or missing zone")
        if m["kind"] == "target":
            if "target_id" not in m or m["target_id"] < 0:
                errors.append(f"{m['id']}: target requires nonnegative target_id")
            else:
                target_ids.append(m["target_id"])
        elif "target_id" in m:
            errors.append(f"{m['id']}: target_id only belongs on targets")
    if len(set(target_ids)) != len(target_ids):
        errors.append("markers: duplicate target_id")
    edges = set()
    for c in data["connections"]:
        a, b = c["from"], c["to"]
        if a not in zones or b not in zones or a == b:
            errors.append(f"connection {a}->{b}: unknown/self endpoint")
            continue
        if (a,b) in edges:
            errors.append(f"connection {a}->{b}: duplicate")
        edges.add((a,b))
        if c["width"] < meta["min_path_width"]:
            errors.append(f"connection {a}->{b}: insufficient path width")
        points = c["points"]
        if len(points) < 2 or not inside(points[0], zones[a]) or not inside(points[-1], zones[b]):
            errors.append(f"connection {a}->{b}: requires entry/exit points inside endpoint zones")
        for p in points:
            if not inside(p, bounds):
                errors.append(f"connection {a}->{b}: waypoint outside map")
        for p,q in zip(points, points[1:]):
            horizontal = math.dist(p[:2], q[:2])
            rise = abs(p[2]-q[2])
            if c["mode"] in ("walk", "ramp") and rise > max(0.2, horizontal * 0.125):
                errors.append(f"connection {a}->{b}: excessive step/slope; review accessibility")
        length = sum(math.dist(p,q) for p,q in zip(points, points[1:]))
        if length > 40:
            warnings.append(f"connection {a}->{b}: {length:.1f}m travel; review walking burden")
        if c["gate"] != "always" and c["gate"] not in stages:
            errors.append(f"connection {a}->{b}: unknown stage gate {c['gate']}")
    flow = data["player_flow"]
    if len(set(flow)) != len(flow) or set(flow) != set(zones):
        errors.append("player_flow: v1 must list every zone once in intended visit order")
    for a,b in zip(flow, flow[1:]):
        if (a,b) not in edges:
            errors.append(f"player_flow: missing directed connection {a}->{b}")
    seen = set()
    previous_stage = None
    previous_zone_index = -1
    for stage in stages.values():
        if stage["zone"] not in zones:
            errors.append(f"{stage['id']}: unknown stage zone")
        if any(r not in seen for r in stage["requires"]):
            errors.append(f"{stage['id']}: dependencies must precede stage (no cycles)")
        if seen and not stage["requires"]:
            errors.append(f"{stage['id']}: missing predecessor")
        if previous_stage is not None and previous_stage not in stage["requires"]:
            errors.append(f"{stage['id']}: v1 linear sequence must require previous stage {previous_stage}")
        if stage["zone"] in flow:
            current_index = flow.index(stage["zone"])
            if current_index < previous_zone_index:
                errors.append(f"{stage['id']}: mission zone order disagrees with player_flow")
            previous_zone_index = current_index
        for m in stage["active_targets"]:
            if m not in markers or markers[m]["kind"] != "target" or markers[m]["zone"] != stage["zone"]:
                errors.append(f"{stage['id']}: invalid active target {m}")
        if "success_target" in stage and stage["success_target"] not in stage["active_targets"]:
            errors.append(f"{stage['id']}: success target must be active")
        if stage["active_targets"] and "success_target" not in stage:
            errors.append(f"{stage['id']}: active targets require a success target in v1")
        seen.add(stage["id"])
        previous_stage = stage["id"]
    stage_order = list(stages)
    for c in data["connections"]:
        first_destination = next((i for i,s in enumerate(stages.values()) if s["zone"] == c["to"]), None)
        if c["gate"] in stages and first_destination is not None and stage_order.index(c["gate"]) >= first_destination:
            errors.append(f"connection {c['from']}->{c['to']}: gate depends on destination or later stage (deadlock)")
    for zone in zones.values():
        local_targets = [m for m in markers.values() if m["zone"] == zone["id"] and m["kind"] == "target"]
        if "target_count" in zone["parameters"]:
            if zone["parameters"]["target_count"] != len(local_targets):
                errors.append(f"{zone['id']}: target_count does not match markers")
            count = sum(devices[d]["count"] for d in zone["devices"] if d in devices and devices[d]["class"] == "fn_shoreline_island_data_target")
            if count != len(local_targets):
                errors.append(f"{zone['id']}: target device count does not match markers")
        if "sequence" in zone["parameters"]:
            actual = [markers[s["success_target"]]["target_id"] for s in stages.values()
                      if s["zone"] == zone["id"] and s.get("success_target") in markers and "target_id" in markers[s["success_target"]]]
            if actual != zone["parameters"]["sequence"]:
                errors.append(f"{zone['id']}: sequence disagrees with stage success targets")
        if not any(s["zone"] == zone["id"] for s in stages.values()):
            errors.append(f"{zone['id']}: no gameplay stage/purpose in mission sequence")
    for a in data["assumptions"]:
        if a["status"] == "open":
            warnings.append(f"open assumption {a['id']}: {a['detail']}")
        elif a["evidence"].lower() in ("none", "pending", "unknown"):
            errors.append(f"{a['id']}: resolved assumptions require evidence")
    if errors:
        raise Invalid("\n".join(errors))
    return warnings


def digest(data):
    return hashlib.sha256(json.dumps(data, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode()).hexdigest()


def compile_plan(data, library):
    used = {z["pattern"]: library[z["pattern"]] for z in data["zones"]}
    steps = [{"step": "inspect_existing", "map": data["map"]["id"], "verify": "Confirm project/world, actor identities, full transforms, bindings and checkpoint before mutations."}]
    for z in data["zones"]:
        steps.append({"step": "reconcile_zone", "zone": z["id"], "pattern": z["pattern"],
                      "policy": "reuse_first; create or move only after an approved resolved delta",
                      "position_cm": [round(o+p*100, 6) for o,p in zip(data["map"]["origin_cm"], z["position"])],
                      "size_cm": [round(s*100, 6) for s in z["size"]], "parameters": z["parameters"],
                      "markers": [m for m in data["markers"] if m["zone"] == z["id"]],
                      "verify": "Compare envelope and marker positions; preserve full rotation/scale; save/readback."})
    for d in data["devices"]:
        steps.append({"step": "reconcile_device", "device": d,
                      "verify": "Discover class/editable schemas; resolve existing references; assert count/settings after any approved edit."})
    steps += [{"step": "bind_logic", "stages": data["stages"], "connections": data["connections"],
               "verify": "Read back ordered target arrays, shared systems and required entry/exit gates."},
              {"step": "verify_gameplay", "checks": ["Verse build if changed", "UEFN validation/cook", "spawn and approach", "objective sequence and wrong choices", "replay/round reset", "solo", "multiplayer shared state", "learning clarity and enjoyment", "stop game and confirm state"],
               "verify": "Record expected/actual, deviations and evidence; transport success is not acceptance."}]
    blockers = [a["id"] + ": " + a["detail"] for a in data["assumptions"] if a["status"] == "open"]
    blockers += [p["id"] + ": no verified reusable adapter" for p in used.values() if p["implementation_status"] == "contract_only"]
    for z in data["zones"]:
        if z["pattern"] == "target_sequence" and (z["parameters"].get("sequence") != [0,3,5,5,6]
                or z["parameters"].get("target_count") != 9 or z["parameters"].get("shared_state") is not True):
            blockers.append(z["id"] + ": existing Prompt adapter supports only nine targets, shared state and sequence [0,3,5,5,6]")
    return {"version": 1, "map_id": data["map"]["id"], "spec_digest": digest(data), "patterns_digest": digest(used),
            "status": "draft_requires_explicit_human_approval", "executable": False, "blockers": blockers,
            "position_tolerance_m": data["map"]["position_tolerance"], "implementation": steps}


def render(data):
    esc = lambda text: html.escape(str(text), quote=True)
    scale, pad, top = 10, 45, 65
    width = max(820, data["map"]["size"][0]*scale+pad*2)
    height = data["map"]["size"][1]*scale+top+70
    xy = lambda p: (pad+p[0]*scale, top+p[1]*scale)
    parts = [f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {width} {height}" role="img" aria-label="{esc(data["map"]["title"])} blockout">',
             '<defs><marker id="arrow" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0,0 L6,3 L0,6" fill="#246486"/></marker></defs>',
             '<style>text{font-family:Arial,sans-serif;fill:#172e43} .label{font-size:12px;paint-order:stroke;stroke:white;stroke-width:3px;stroke-linejoin:round} .zone{font-size:14px;font-weight:bold}</style>',
             f'<rect width="{width}" height="{height}" fill="#f4f7fa"/>',
             f'<text x="{pad}" y="25" font-size="19">{esc(data["map"]["title"])} — DRAFT / review required</text>',
             f'<text x="{pad}" y="46" font-size="12">Top-down meters · X right, Y down · envelopes ≠ walls · paths are illustrative</text>']
    # Paint large envelopes first so a lesson overlay cannot be obscured by its arena.
    for index,z in enumerate(sorted(data["zones"], key=lambda z: z["size"][0]*z["size"][1], reverse=True)):
        x,y=xy(z["position"]); w,h=[n*scale for n in z["size"][:2]]
        parts += [f'<rect x="{x}" y="{y}" width="{w}" height="{h}" fill="{["#dce9f2","#e8e1f2","#dbeee8","#f6edd4"][index%4]}" fill-opacity="0.65" stroke="#6a8397" stroke-dasharray="5 3"/>',
                  f'<text class="zone" x="{x+7}" y="{y+19}">{esc(z["label"])}</text>',
                  f'<text font-size="11" x="{x+7}" y="{y+35}">{esc(z["size"][0])} × {esc(z["size"][1])}m</text>']
    for c in data["connections"]:
        points=" ".join(f"{x},{y}" for x,y in map(xy,c["points"]))
        parts.append(f'<polyline points="{points}" fill="none" stroke="#246486" stroke-width="2" stroke-dasharray="5 3" marker-end="url(#arrow)"><title>{esc(c["from"]+" → "+c["to"]+" / "+c["gate"])}</title></polyline>')
    for index,m in enumerate(data["markers"],1):
        x,y=xy(m["position"])
        parts += [f'<g><title>{esc(m["label"])}; XYZ {esc(m["position"])}; {esc(m["source"])}</title><circle cx="{x}" cy="{y}" r="8" fill="{KINDS[m["kind"]]}" stroke="white"/>',
                  f'<text x="{x}" y="{y+3}" text-anchor="middle" font-size="9" style="fill:white">{index}</text></g>']
    parts += [f'<path d="M{pad},{height-35} h100" stroke="#172e43" stroke-width="3"/><text x="{pad+110}" y="{height-30}" font-size="12">10m | Z shown in marker table; ramps/collision need in-game checks</text>', '</svg>']
    svg="\n".join(parts)+"\n"
    rows="".join(f'<tr><td>{i}</td><td>{esc(m["kind"])}</td><td>{esc(m["label"])}</td><td>{esc(m["position"])}</td><td>{esc(m["source"])}</td></tr>' for i,m in enumerate(data["markers"],1))
    stages="".join(f'<li><b>{esc(s["id"])}</b>: {esc(s["purpose"])} — {esc(s["completion"])}</li>' for s in data["stages"])
    assumptions="".join(f'<li>{esc(a["status"])} — {esc(a["detail"])}</li>' for a in data["assumptions"])
    legend=" · ".join(f'<span style="color:{color}">● {kind}</span>' for kind,color in KINDS.items())
    page=f'''<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>{esc(data["map"]["title"])} blockout</title>
<style>body{{font:15px system-ui,sans-serif;max-width:1100px;margin:24px auto;padding:0 20px;color:#172e43;background:#fff}}svg{{width:100%;max-height:900px}}table{{border-collapse:collapse;width:100%}}th,td{{text-align:left;border-bottom:1px solid #ccd8df;padding:8px}}td:last-child{{font-size:12px;overflow-wrap:anywhere}}li{{margin:8px 0}}.notice{{background:#fff3cf;padding:14px}}</style>
<h1>{esc(data["map"]["title"])} review</h1><p class="notice">DRAFT — not approved for Unreal execution. Numbered markers use the table below. This preview is a planning aid, not collision or gameplay validation.</p>
<p>{esc(data["map"]["learning_objective"])}</p>{svg}<p>{legend}</p>
<h2>Markers</h2><table><tr><th>#</th><th>Kind</th><th>Label</th><th>Local XYZ (m)</th><th>Source</th></tr>{rows}</table>
<h2>Mission sequence</h2><ol>{stages}</ol><h2>Assumptions and review gaps</h2><ul>{assumptions}</ul></html>'''
    return svg,page


def artifacts(data, library):
    plan=compile_plan(data, library)
    svg,page=render(data)
    result={"preview.svg": svg, "preview.html": page, "implementation.yaml": yaml.safe_dump(plan, sort_keys=False, allow_unicode=True)}
    hashes={name: hashlib.sha256(content.encode()).hexdigest() for name,content in result.items()}
    manifest={"version":1,"map_id":data["map"]["id"],"files":hashes,"review_digest":digest(hashes)}
    result["review-manifest.json"]=json.dumps(manifest, indent=2)+"\n"
    return result,plan,manifest


def ready(spec_path, expected, plan, manifest, approval_path):
    errors=[]
    for name,content in expected.items():
        path=spec_path.parent/"generated"/name
        if not path.is_file() or path.read_bytes()!=content.encode():
            errors.append(f"stale/missing artifact: {path}; regenerate and review")
    if not Path(approval_path).is_file():
        raise Invalid(f"No human approval record at {approval_path}. Present the current preview/plan for explicit review; do not create approval on the user's behalf.")
    approval=read_yaml(approval_path)
    errors += schema.check(approval, schema.APPROVAL, "approval")
    if not errors and approval["review_digest"]!=manifest["review_digest"]:
        errors.append("approval is stale: review_digest does not match current artifacts")
    errors += ["unresolved execution blocker: "+b for b in plan["blockers"]]
    if errors:
        raise Invalid("\n".join(errors))


def main(argv=None):
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command",choices=["validate","preview","plan","check"])
    parser.add_argument("spec",nargs="?",type=Path,default=DEFAULT)
    parser.add_argument("--ready",action="store_true",help="Read-only check of current artifacts, approval and execution blockers (plan only)")
    parser.add_argument("--approval",type=Path,help="Approval YAML; defaults to approval.yaml beside the spec")
    args=parser.parse_args(argv)
    if (args.ready or args.approval) and (args.command!="plan" or not args.ready):
        parser.error("--ready/--approval are only valid with plan --ready")
    try:
        spec=args.spec.resolve()
        data=read_yaml(spec); library=patterns(); warnings=validate(data,library)
        for warning in warnings:
            print("REVIEW:",warning)
        if args.command=="validate":
            print(f"VALID: {spec}")
            return 0
        outputs,plan,manifest=artifacts(data,library)
        if args.ready:
            ready(spec,outputs,plan,manifest,args.approval or spec.parent/"approval.yaml")
            print("READY FOR AGENT PREFLIGHT: approval matches; discover live schemas and reconcile actual scene before editing.")
            return 0
        destination=spec.parent/"generated"
        destination.mkdir(exist_ok=True)
        # Always generate the complete bundle so review hashes cannot mix revisions.
        for name,content in outputs.items():
            (destination/name).write_bytes(content.encode())
        print(f"DRAFT: {destination}\nReview digest: {manifest['review_digest']}\nExecution blockers: {len(plan['blockers'])}; explicit human approval required.")
        return 0
    except (Invalid,OSError,RecursionError) as exc:
        print("INVALID:",exc,file=sys.stderr)
        return 1


if __name__=="__main__":
    sys.exit(main())
