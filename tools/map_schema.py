"""Version-1 map contract. A small project-specific schema, not JSON Schema.

Dicts have closed fields; ? marks an optional field. A one-element list describes
array items; tuples enumerate allowed strings. `dict` is an explicitly open
configuration object, validated separately against pattern parameter contracts.
"""

TEXT = str
NUMBER = float  # finite int or float, excluding bool
VECTOR = [NUMBER]
PARAMETER = {"name": TEXT, "type": ("string", "integer", "number", "boolean", "strings", "integers"), "required": bool}
PATTERN = {
    "version": int, "id": TEXT, "purpose": TEXT, "parameters": [PARAMETER],
    "expected_devices": [TEXT], "verse_behavior": TEXT, "geometry": TEXT,
    "interaction": TEXT, "completion": TEXT, "reset": TEXT,
    "debug": [TEXT], "implementation_status": ("existing_adapter", "contract_only"),
}
ZONE = {
    "id": TEXT, "label": TEXT, "pattern": TEXT, "position": VECTOR, "size": VECTOR,
    "purpose": TEXT, "parameters": dict, "devices": [TEXT], "overlap_with": [TEXT],
    "completion": TEXT, "reset": TEXT,
}
MARKER = {
    "id": TEXT, "kind": ("spawn", "target", "weapon", "knowledge", "exit", "checkpoint", "reward"),
    "zone": TEXT, "label": TEXT, "position": VECTOR, "source": TEXT,
    "target_id?": int,
}
CONNECTION = {
    "from": TEXT, "to": TEXT, "mode": ("walk", "ramp", "portal", "rail"),
    "width": NUMBER, "points": [VECTOR], "gate": TEXT,
}
DEVICE = {"id": TEXT, "class": TEXT, "count": int, "source": TEXT, "settings": dict}
STAGE = {
    "id": TEXT, "zone": TEXT, "purpose": TEXT, "requires": [TEXT],
    "active_targets": [TEXT], "success_target?": TEXT, "completion": TEXT,
}
MAP = {
    "version": int,
    "map": {"id": TEXT, "title": TEXT, "theme": TEXT, "units": ("meters",),
            "origin_cm": VECTOR, "size": VECTOR, "learning_objective": TEXT,
            "source_feature": TEXT, "intent": ("document_existing", "propose_change"),
            "min_path_width": NUMBER, "position_tolerance": NUMBER},
    "player_flow": [TEXT], "zones": [ZONE], "connections": [CONNECTION],
    "markers": [MARKER], "devices": [DEVICE], "stages": [STAGE],
    "assumptions": [{"id": TEXT, "detail": TEXT, "status": ("open", "resolved"), "evidence": TEXT}],
}
APPROVAL = {
    "status": ("approved",), "reviewer": TEXT, "approved_at": TEXT,
    "evidence": TEXT, "review_digest": TEXT,
}


def check(value, schema, path="map"):
    """Return all structural errors, without accepting unknown fields or booleans as numbers."""
    import math

    errors = []
    if isinstance(schema, dict):
        if not isinstance(value, dict):
            return [f"{path}: expected object"]
        allowed = {key.rstrip("?") for key in schema}
        for key in value:
            if key not in allowed:
                errors.append(f"{path}: unknown field {key!r}")
        for field, child in schema.items():
            key = field.rstrip("?")
            if key in value:
                errors.extend(check(value[key], child, f"{path}.{key}"))
            elif not field.endswith("?"):
                errors.append(f"{path}.{key}: required")
    elif isinstance(schema, list):
        if not isinstance(value, list):
            return [f"{path}: expected array"]
        for index, child in enumerate(value):
            errors.extend(check(child, schema[0], f"{path}[{index}]"))
    elif isinstance(schema, tuple):
        if not isinstance(value, str) or value not in schema:
            errors.append(f"{path}: expected one of {schema}")
    elif schema is float:
        if type(value) not in (int, float) or not math.isfinite(value):
            errors.append(f"{path}: expected finite number")
    elif type(value) is not schema:
        errors.append(f"{path}: expected {schema.__name__}")
    elif schema is str and not value.strip():
        errors.append(f"{path}: must not be empty")
    return errors
