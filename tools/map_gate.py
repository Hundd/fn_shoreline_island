"""Offline deterministic review gate for map.yaml. Never imports or invokes Unreal/MCP.

Run after ``map_workflow.py check`` accepts the schema. This turns the
automatically-checkable part of blockout review (walking burden, target and
interaction density, wrong-choice recovery, learning purpose, return access,
orphaned targets) into a coded, machine-readable verdict so the planner and
reviewer obey a deterministic result instead of relying on prose judgment alone.
Subjective items (sightlines, aesthetics, enjoyment) remain with the human.

Exit codes: 0 = pass (advisories allowed), 1 = fail/blocked/invalid,
2 = usage error. The JSON verdict is always written to stdout.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import re
from pathlib import Path
import sys

import map_workflow as mw

GATE_VERSION = 1
DEFAULT = mw.DEFAULT

# Tunable review thresholds. Bump GATE_VERSION when these change meaningfully,
# since the review digest binds to the gate revision as well as the map data.
SEGMENT_LONG_M = 40.0
ROUTE_LONG_M = 120.0
TARGET_FLOOR_M2 = 4.0
ARENA_MIN_TARGETS = 2
CROWDED_DEVICES = 8
ARENA_PATTERNS = {"target_sequence", "shooting_gallery", "classification_arena"}


def review(data):
    """Deterministic findings over an already-valid map. Returns (violations, advisories).

    Violations are unambiguous defects the planner must resolve (e.g. an orphaned
    target marker no stage ever activates). Advisories are numeric heuristics a
    human reviewer must still judge (e.g. a long walk, a crowded zone).
    """
    violations, advisories = [], []
    zones = {z["id"]: z for z in data["zones"]}
    markers = {m["id"]: m for m in data["markers"]}
    stages = data["stages"]

    referenced = set()
    for stage in stages:
        referenced.update(stage["active_targets"])
    for mid, marker in markers.items():
        if marker["kind"] == "target" and mid not in referenced:
            violations.append({"code": "MARKER_UNUSED", "zone": marker["zone"],
                               "detail": f"target marker {mid} is never activated by any stage"})

    total = 0.0
    for connection in data["connections"]:
        length = sum(math.dist(p, q) for p, q in zip(connection["points"], connection["points"][1:]))
        total += length
        if length > SEGMENT_LONG_M:
            advisories.append({"code": "WALK_SEGMENT_LONG", "zone": None,
                               "detail": f"connection {connection['from']}->{connection['to']} is {length:.1f}m; review walking burden"})
    if total > ROUTE_LONG_M:
        advisories.append({"code": "WALK_ROUTE_LONG", "zone": None,
                           "detail": f"total route is {total:.1f}m; review cumulative walking"})

    has_lesson = False
    for zone in zones.values():
        if zone["pattern"] == "knowledge_room":
            has_lesson = True
        floor = zone["size"][0] * zone["size"][1]
        device_count = len(zone["devices"])
        target_count = sum(1 for m in markers.values() if m["zone"] == zone["id"] and m["kind"] == "target")
        if device_count > CROWDED_DEVICES:
            advisories.append({"code": "INTERACTION_CROWDED", "zone": zone["id"],
                               "detail": f"{device_count} devices in {zone['id']}; review interaction density"})
        if target_count:
            per_target = floor / target_count
            if per_target < TARGET_FLOOR_M2:
                advisories.append({"code": "DENSITY_TARGETS_HIGH", "zone": zone["id"],
                                   "detail": f"{target_count} targets in {floor:.0f} m\u00b2 ({per_target:.1f} m\u00b2/target); verify visibility and legibility"})
        if zone["pattern"] in ARENA_PATTERNS and target_count < ARENA_MIN_TARGETS:
            advisories.append({"code": "DENSITY_TARGETS_LOW", "zone": zone["id"],
                               "detail": f"only {target_count} target(s) in {zone['id']}; verify a meaningful choice exists"})
        if zone["pattern"] == "reward_room" and not re.search(r"badge|data", zone["reset"], re.IGNORECASE):
            advisories.append({"code": "RESET_UNVERIFIED", "zone": zone["id"],
                               "detail": "reward reset text does not mention badge/DATA preservation; verify replay"})

    for stage in stages:
        if len(stage["active_targets"]) == 1:
            advisories.append({"code": "FLOW_NO_WRONG_CHOICE", "zone": stage["zone"],
                               "detail": f"stage {stage['id']} has a single active target; verify wrong-choice recovery nearby"})

    if not has_lesson:
        advisories.append({"code": "LEARN_NO_LESSON", "zone": None,
                           "detail": "no knowledge_room zone; verify the learning objective is introduced before action"})
    if not any(m["kind"] == "exit" for m in markers.values()):
        advisories.append({"code": "LEARN_NO_EXIT", "zone": None,
                           "detail": "no exit marker declared; verify return access after completion"})

    return violations, advisories


def _code_blocker(raw):
    if "no verified reusable adapter" in raw:
        return "CONTRACT_ONLY"
    if "supports only nine targets" in raw:
        return "UNSUPPORTED_SEQUENCE"
    return "OPEN_ASSUMPTION"


def gate(data, library):
    """Full deterministic gate over a valid map: verdict, coded findings, counts, digest."""
    violations, advisories = review(data)
    plan = mw.compile_plan(data, library)
    blockers = [{"code": _code_blocker(raw), "detail": raw} for raw in plan["blockers"]]
    if blockers:
        verdict = "blocked"
    elif violations:
        verdict = "fail"
    else:
        verdict = "pass"
    payload = {"gate_version": GATE_VERSION, "map": data}
    review_digest = hashlib.sha256(
        json.dumps(payload, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode()
    ).hexdigest()
    return {
        "version": 1,
        "map_id": data["map"]["id"],
        "review_digest": review_digest,
        "verdict": verdict,
        "violations": violations,
        "advisories": advisories,
        "blockers": blockers,
        "counts": {
            "zones": len(data["zones"]),
            "stages": len(data["stages"]),
            "markers": len(data["markers"]),
            "connections": len(data["connections"]),
            "devices": len(data["devices"]),
            "targets": sum(1 for m in data["markers"] if m["kind"] == "target"),
            "violations": len(violations),
            "advisories": len(advisories),
            "blockers": len(blockers),
        },
    }


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", nargs="?", choices=["gate"], default="gate")
    parser.add_argument("spec", nargs="?", type=Path, default=DEFAULT)
    args = parser.parse_args(argv)
    try:
        spec = args.spec.resolve()
        data = mw.read_yaml(spec)
        library = mw.patterns()
        mw.validate(data, library)
        result = gate(data, library)
        print(json.dumps(result, indent=2))
        if result["verdict"] == "pass":
            print(f"GATE PASS: {result['map_id']} "
                  f"({result['counts']['advisories']} advisories)", file=sys.stderr)
            return 0
        print(f"GATE {result['verdict'].upper()}: {result['map_id']} "
              f"({result['counts']['violations']} violations, "
              f"{result['counts']['blockers']} blockers)", file=sys.stderr)
        return 1
    except (mw.Invalid, OSError, RecursionError) as exc:
        print(json.dumps({"verdict": "invalid", "errors": [str(exc)]}, indent=2))
        print("GATE INVALID:", exc, file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
