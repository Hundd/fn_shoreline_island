"""Independently reconcile saved editor receipts against the frozen design."""
import collections
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
FEATURE = HERE.parent
ROOT = FEATURE.parent.parent

def read(path):
    return json.loads(path.read_text(encoding="utf-8-sig"))

expected = {p["label"]: p for p in read(FEATURE / "scene-delta.json")["placements"]}
records = []
for path in sorted(HERE.glob("batch-*.json")):
    batch = read(path)
    assert batch["saved"] and batch["count"] == len(batch["records"]), path
    records.extend(batch["records"])
seen = set()
max_error = 0.0
for actual in records:
    label = actual["label"]
    assert label not in seen, f"Duplicate receipt: {label}"
    seen.add(label)
    planned = expected[label]
    assert actual["group"] == planned["group"]
    assert actual["role"] == planned["role"]
    assert actual["source"] == planned["source"]
    for kind, values in planned["transform"].items():
        for key, value in values.items():
            error = abs(actual["transform"][kind][key] - value)
            max_error = max(max_error, error)
            assert error < 0.001, (label, kind, key, error)
    props = actual["properties"]
    assert props["staticMesh"]["refPath"] == planned["asset"], label
    assert props["overrideMaterials"] == [], label
    assert props["bodyInstance"]["collisionEnabled"] == "NoCollision", label
    assert props["bodyInstance"]["collisionProfileName"] == "NoCollision", label
    assert props["bUseDefaultCollision"] is False, label
    assert actual["saved"] and actual["dirty"] is False, label
    assert "/__ExternalActors__/" in actual["asset_path"], label

baseline = read(HERE / "verse-baseline.json")
for source in baseline:
    path = ROOT / source["path"]
    assert hashlib.sha256(path.read_bytes()).hexdigest().upper() == source["sha256"].upper(), path
report = {
    "scope": "Independent offline reconciliation of native saved receipts; not gameplay testing",
    "expected": len(expected),
    "verified_receipts": len(records),
    "complete": seen == set(expected),
    "by_group": dict(collections.Counter(r["group"] for r in records)),
    "by_role": dict(collections.Counter(r["role"] for r in records)),
    "maximum_numeric_transform_error": max_error,
    "unchanged_verse_files": len(baseline),
    "all_receipts_match": True,
}
if (HERE / "implementation-protected-after.json").exists():
    before = read(HERE / "implementation-protected-before.json")
    after = read(HERE / "implementation-protected-after.json")
    actual_by_ref = {r["actor"]["refPath"]: r for r in after["records"]}
    assert len(actual_by_ref) == len(before["records"]) == 2046
    for original in before["records"]:
        actual = actual_by_ref[original["actor"]["refPath"]]
        for key, value in original.items():
            assert actual[key] == value, (original["label"], key)
    assert after["world_count"] == 2046 + len(expected)
    report["original_actors_preserved"] = len(actual_by_ref)
    report["pilot_complete_mesh_records_preserved"] = before["pilot_count"]
if (HERE / "supports-final-audit.json").exists():
    before = read(HERE / "implementation-supports-before.json")
    after = read(HERE / "supports-final-audit.json")
    actual_by_ref = {r["component"]["refPath"]: r["actual"] for r in after["records"]}
    assert len(actual_by_ref) == len(before["records"]) == 39
    for original in before["records"]:
        actual = actual_by_ref[original["component"]["refPath"]]
        intended = dict(original["actual"], bVisible=False, bHiddenInGame=True)
        assert actual == intended, original["component"]
    report["support_changes_limited_to_render_flags"] = len(actual_by_ref)
if (HERE / "packages-final-audit.json").exists():
    packages = read(HERE / "packages-final-audit.json")
    assert packages["new_actor_count"] == 1457
    assert len(packages["records"]) == 1465
    assert len({r["actor"]["refPath"] for r in packages["records"]}) == 1465
    assert all(r["dirty"] is False and "/__ExternalActors__/" in r["asset_path"] for r in packages["records"])
    assert packages["level_dirty"] is False and packages["save_all"] is True
    report["final_clean_actor_packages"] = len(packages["records"])
    report["level_saved_clean"] = True
(HERE / "supervisor-receipt-audit.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
print(json.dumps(report))
