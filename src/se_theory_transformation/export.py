"""Export generated JSON artifacts from reference TOML files.

The reference/*.toml files are hand-authored registry mirrors.
The data/transformation/*.json files are generated artifacts derived
from those references.

This module does not define theory semantics.
"""

from dataclasses import dataclass
import json
from pathlib import Path
import tomllib
from typing import Any

ROOT_DIR = Path(__file__).resolve().parents[2]
REFERENCE_DIR = ROOT_DIR / "reference"
DATA_DIR = ROOT_DIR / "data" / "transformation"


JsonObject = dict[str, Any]


@dataclass(frozen=True)
class ExportSpec:
    """A generated JSON artifact export specification."""

    source_name: str
    source_table: str
    output_name: str
    schema: str
    payload_key: str


EXPORT_SPECS: tuple[ExportSpec, ...] = (
    ExportSpec(
        source_name="composition-rules.toml",
        source_table="rule",
        output_name="composition-registry.json",
        schema="se-composition-registry-1",
        payload_key="rules",
    ),
    ExportSpec(
        source_name="orthogonality-rules.toml",
        source_table="rule",
        output_name="orthogonality-matrix.json",
        schema="se-orthogonality-registry-1",
        payload_key="rules",
    ),
    ExportSpec(
        source_name="transformation-families.toml",
        source_table="family",
        output_name="transformation-family-registry.json",
        schema="se-transformation-family-registry-1",
        payload_key="families",
    ),
    ExportSpec(
        source_name="transformation-operators.toml",
        source_table="operator",
        output_name="operator-registry.json",
        schema="se-operator-registry-1",
        payload_key="operators",
    ),
    ExportSpec(
        source_name="transformation-outcomes.toml",
        source_table="outcome",
        output_name="outcome-registry.json",
        schema="se-outcome-registry-1",
        payload_key="outcomes",
    ),
)


def read_toml(path: Path) -> JsonObject:
    """Read a TOML file as a dictionary."""
    with path.open("rb") as file:
        data = tomllib.load(file)

    if not isinstance(data, dict):
        msg = f"Expected TOML object in {path}"
        raise ValueError(msg)

    return data


def ordered_table_values(document: JsonObject, table_name: str) -> list[JsonObject]:
    """Return nested table values sorted by order, then id/key."""
    table = document.get(table_name, {})
    if not isinstance(table, dict):
        msg = f"Expected [{table_name}.<id>] tables"
        raise ValueError(msg)

    entries: list[JsonObject] = []
    for key, value in table.items():
        if not isinstance(value, dict):
            msg = f"Expected table entry for {table_name}.{key}"
            raise ValueError(msg)

        entry = dict(value)
        entry.setdefault("id", key)
        entries.append(entry)

    return sorted(
        entries,
        key=lambda item: (
            item.get("order", 999_999),
            str(item.get("id", "")),
        ),
    )


def artifact_meta(document: JsonObject) -> JsonObject:
    """Return normalized metadata from a reference artifact."""
    meta = document.get("meta", {})
    if not isinstance(meta, dict):
        msg = "Expected [meta] table"
        raise ValueError(msg)

    return dict(meta)


def build_registry_payload(spec: ExportSpec) -> JsonObject:
    """Build one generated registry payload from one reference TOML file."""
    source_path = REFERENCE_DIR / spec.source_name
    document = read_toml(source_path)
    meta = artifact_meta(document)
    entries = ordered_table_values(document, spec.source_table)

    return {
        "schema": spec.schema,
        "source": meta.get("source", "se-theory-transformation"),
        "namespace": meta.get("namespace", "se.transformation"),
        "artifact": spec.output_name.removesuffix(".json"),
        "reference_artifact": meta.get(
            "artifact", spec.source_name.removesuffix(".toml")
        ),
        "reference_path": source_path.as_posix(),
        spec.payload_key: entries,
    }


def build_transformation_catalog() -> JsonObject:
    """Build the generated transformation catalog from reference artifacts."""
    operators = ordered_table_values(
        read_toml(REFERENCE_DIR / "transformation-operators.toml"),
        "operator",
    )
    families = ordered_table_values(
        read_toml(REFERENCE_DIR / "transformation-families.toml"),
        "family",
    )
    kinds = ordered_table_values(
        read_toml(REFERENCE_DIR / "transformation-kinds.toml"),
        "kind",
    )
    outcomes = ordered_table_values(
        read_toml(REFERENCE_DIR / "transformation-outcomes.toml"),
        "outcome",
    )
    composition_rules = ordered_table_values(
        read_toml(REFERENCE_DIR / "composition-rules.toml"),
        "rule",
    )
    orthogonality_rules = ordered_table_values(
        read_toml(REFERENCE_DIR / "orthogonality-rules.toml"),
        "rule",
    )

    return {
        "schema": "se-transformation-catalog-1",
        "source": "se-theory-transformation",
        "namespace": "se.transformation",
        "artifact": "transformation-catalog",
        "reference_paths": [
            (REFERENCE_DIR / "composition-rules.toml").as_posix(),
            (REFERENCE_DIR / "orthogonality-rules.toml").as_posix(),
            (REFERENCE_DIR / "transformation-families.toml").as_posix(),
            (REFERENCE_DIR / "transformation-kinds.toml").as_posix(),
            (REFERENCE_DIR / "transformation-operators.toml").as_posix(),
            (REFERENCE_DIR / "transformation-outcomes.toml").as_posix(),
        ],
        "operators": operators,
        "families": families,
        "kinds": kinds,
        "outcomes": outcomes,
        "composition_rules": composition_rules,
        "orthogonality_rules": orthogonality_rules,
    }


def encode_json(payload: JsonObject) -> str:
    """Encode a JSON payload deterministically."""
    return (
        json.dumps(
            payload,
            indent=2,
            sort_keys=False,
            ensure_ascii=True,
        )
        + "\n"
    )


def write_or_check(path: Path, content: str, *, check: bool) -> bool:
    """Write a file or check whether it is current.

    Returns True when the file is current or was written.
    Returns False when check mode finds stale content.
    """
    if check:
        if not path.exists():
            print(f"[stale] {path.as_posix()} is missing")
            return False

        current = path.read_text(encoding="utf-8")
        if current != content:
            print(f"[stale] {path.as_posix()} is out of date")
            return False

        print(f"[ok   ] {path.as_posix()}")
        return True

    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")
    print(f"[write] {path.as_posix()}")
    return True


def export_registry(spec: ExportSpec, *, check: bool) -> bool:
    """Export one registry JSON artifact."""
    payload = build_registry_payload(spec)
    output_path = DATA_DIR / spec.output_name
    return write_or_check(output_path, encode_json(payload), check=check)


def export_catalog(*, check: bool) -> bool:
    """Export the combined transformation catalog JSON artifact."""
    payload = build_transformation_catalog()
    output_path = DATA_DIR / "transformation-catalog.json"
    return write_or_check(output_path, encode_json(payload), check=check)


def run_ref_export(*, check: bool = False) -> int:
    """Export generated JSON artifacts from reference TOML files."""
    results = [export_registry(spec, check=check) for spec in EXPORT_SPECS]
    results.append(export_catalog(check=check))

    if all(results):
        if check:
            print("Reference exports are current.")
        else:
            print("Reference export completed.")
        return 0

    print("Reference exports are stale.")
    return 1
