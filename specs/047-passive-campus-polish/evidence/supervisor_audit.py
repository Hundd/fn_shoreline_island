"""Independent reconciliation of native editor receipts; no runtime tests."""
import copy
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
FEATURE = HERE.parent
ROOT = FEATURE.parent.parent

def read(path):
    return json.loads(path.read_text(encoding="utf-8-sig"))

delta = read(FEATURE / "scene-delta.json")
planned = {r["label"]: r for r in delta["placements"]}
sources = {r["component"]["refPath"]: r for r in delta["component_changes"]}
records = []
for path in sorted(HERE.glob("implementation-batch-*.json")):
    records.extend(read(path)["records"])
assert len({r["label"] for r in records}) == len(records)
if (HERE / "implementation-correction-final.json").exists():
    by_label = {r["label"]: r for r in records}
    for correction in read(HERE / "implementation-correction-final.json")["records"]:
        original = by_label[correction["label"]]
        assert correction["before_transform"] == original["transform"]
        assert correction["properties"] == original["properties"]
        assert correction["actor"] == original["actor"]
        original.update(correction)
max_error = 0
for r in records:
    p = planned[r["label"]]
    assert r["group"] == p["group"] and r["role"] == p["role"]
    for kind, values in p["transform"].items():
        for key, value in values.items():
            error = abs(r["transform"][kind][key] - value)
            max_error = max(max_error, error)
            assert error < 1e-6, (r["label"], kind, key)
    props = r["properties"]
    assert props["staticMesh"]["refPath"] == p["asset"]
    assert props["overrideMaterials"] == []
    assert props["bUseDefaultCollision"] is False
    for key, value in p["collision_settings"].items():
        assert props["bodyInstance"][key] == value, (r["label"], key)
    assert r["dirty"] is False and "/__ExternalActors__/" in r["package"]

changed = []
roundoff = []
for path in sorted(HERE.glob("implementation-source-batch-*.json")):
    changed.extend(read(path)["records"])
assert len({r["component"]["refPath"] for r in changed}) == len(changed)
for r in changed:
    source = sources[r["component"]["refPath"]]
    expected = copy.deepcopy(r["before"])
    for key, value in source["before"].items():
        assert expected[key] == value, (r["component"], key)
    for key, value in source["after"].items():
        if isinstance(value, dict):
            expected[key].update(value)
        else:
            expected[key] = value
    actual = copy.deepcopy(r["after"])
    if actual["BodyInstance"]["maxAngularVelocity"] != expected["BodyInstance"]["maxAngularVelocity"]:
        assert "BodyInstance" in source["after"]
        assert expected["BodyInstance"]["maxAngularVelocity"] == 3600
        assert actual["BodyInstance"]["maxAngularVelocity"] == 3599.999755859375
        roundoff.append(r["component"]["refPath"])
        actual["BodyInstance"]["maxAngularVelocity"] = 3600
    assert actual == expected, r["component"]
    assert r["dirty"] is False and "/__ExternalActors__/" in r["package"]

baseline = read(HERE / "verse-baseline.json")
for r in baseline:
    assert hashlib.sha256((ROOT / r["path"]).read_bytes()).hexdigest().upper() == r["sha256"].upper()
report = {
    "scope": "Offline independent reconciliation of native receipts; no runtime tests",
    "verified_placements": len(records), "expected_placements": len(planned),
    "verified_source_changes": len(changed), "expected_source_changes": len(sources),
    "complete": len(records) == len(planned) and len(changed) == len(sources),
    "maximum_transform_error": max_error,
    "accepted_bench_roundoff_records": len(roundoff),
    "all_other_fields_match": True, "verse_hashes_unchanged": len(baseline),
}
if (HERE / "implementation-inventory-after.json").exists():
    before = read(HERE / "implementation-preflight.json")["world_descriptors"]
    after = read(HERE / "implementation-inventory-after.json")["records"]
    def identity(r):
        return json.dumps(r["actorPath"], sort_keys=True)
    current = {identity(r): r for r in after}
    assert len(before) == 3503 and len(current) == 3618
    assert all(current[identity(r)] == r for r in before)
    report["original_descriptors_unchanged"] = len(before)
if (HERE / "implementation-original-transforms-after.json").exists():
    prior = ROOT / "specs/046-fortnite-campus-extension/evidence"
    baseline_records = read(prior / "implementation-protected-after.json")["records"]
    for path in prior.glob("batch-*.json"):
        baseline_records.extend(read(path)["records"])
    baselines = {r["actor"]["refPath"]: r["transform"] for r in baseline_records}
    grounding = ROOT / "specs/045-fortnite-campus-pilot/evidence/post-grounding-2026-10-09/repair-receipts.json"
    for r in read(grounding)["records"]:
        baselines[r["actor"]["refPath"]] = r["transform"]
    actual = read(HERE / "implementation-original-transforms-after.json")["records"]
    assert len(baselines) == len(actual) == 3503
    assert all(r["transform"] == baselines[r["actor"]["refPath"]] for r in actual)
    report["original_full_transforms_unchanged"] = len(actual)
(HERE / "supervisor-receipt-audit.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
print(json.dumps(report))
