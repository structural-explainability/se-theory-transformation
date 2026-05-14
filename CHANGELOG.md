# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

---

## [Unreleased]

### Planned

- Additional transformation theorem structure
- Expanded composition and orthogonality rule coverage
- Stronger generated artifact validation
- Lean surface coverage checks for exported reference artifacts

---

## [0.2.0] - 2026-05-14

### Added

- Expanded transformation taxonomy from earlier operator/class to current operator-family-kind model.
- Added `TransformationFamily` vocabulary with fourteen family constructors.
- Added `TransformationKind` vocabulary with seven kind constructors.
- Added Lean-side operator-to-family mapping through `operatorFamily`.
- Added Lean-side family-to-kind mapping through `familyKind`.
- Added derived `operatorKind` mapping.
- Added taxonomy conformance evidence and proofs in `SETheoryTransformation.Conformance`.
- Added Lean-side reference enumerations for operators, families, kinds, and outcomes.
- Added `TestAll` Lean test aggregate target.
- Added generated reference export command: `se-ref-export`.
- Added command split under `src/se_theory_transformation/commands/`.
- Added deterministic JSON export support for generated `data/transformation/` artifacts.
- Added Python tests for export behavior and CLI entry-point wiring.
- Added durable documentation pattern using authority pointers instead of duplicated vocabulary tables.

### Changed

- Replaced obsolete transformation-basis layer with the current operator-family-kind taxonomy.
- Removed active `transformation-basis` reference artifact from the repository contract.
- Updated reference artifacts to align with completed working Lean definitions.
- Updated `reference/index.toml` to remove obsolete basis artifact and use `composition-registry.json`.
- Updated `transformation-operators.toml` to use confirmed family and kind mappings from Lean.
- Updated `transformation-families.toml` from seven families to fourteen families.
- Updated `transformation-kinds.toml` to align with the seven Lean constructors.
- Updated `transformation-outcomes.toml` to align with `TransformationOutcome`.
- Updated `transformation-types.toml` to remove stale basis-era descriptions and duplicate entries.
- Updated composition reference artifacts to match current `CompositionRelation` vocabulary.
- Updated orthogonality reference artifacts to match current `OrthogonalityRelation` vocabulary.
- Updated README and docs to reduce drift by linking to authoritative Lean and reference files.
- Updated build/check workflow to include `se-ref-validate` and `se-ref-export --check`.
- Updated Python coverage from below threshold to above threshold with targeted tests.

### Removed

- Removed obsolete `TransformationBasis` layer from active repository scope.
- Removed stale `RF reference` operator documentation in favor of current `LK link` vocabulary.
- Removed duplicated operator, family, relation, and outcome inventories from README-style documentation.
- Removed obsolete `TestExport` assumption in favor of explicit test targets and `TestAll`.

### Fixed

- Fixed stale Lean test imports for composition and orthogonality reference modules.
- Fixed missing `ref_export_main` CLI entry point by adding `se-ref-export` command support.
- Fixed command-module organization to avoid a growing monolithic `cli.py`.
- Fixed Ruff unused-import warnings in the combined command dispatcher.
- Fixed generated artifact naming to use `composition-registry.json`.

---

## [0.1.0] - 2026-05-12

### Added

- Initial Lean 4 repository scaffold
- Public import surface (`SETheoryTransformation.lean`)
- Transformation operator vocabulary
- Transformation class vocabulary
- Composition relation vocabulary
- Orthogonality relation vocabulary
- Transformation outcome vocabulary
- Initial operator composition examples
- Initial Lean test structure
- JSON schemas for transformation registries
- Machine-readable transformation registries
- Manifest, citation, and release metadata
- Python validation scaffold
- Reference artifact validation surface

---

## Notes on versioning and releases

- We use **SemVer**:
  - **MAJOR** - breaking changes to formal surface or validation semantics
  - **MINOR** - backward-compatible additions to theory vocabulary or artifacts
  - **PATCH** - fixes, documentation, tooling
- Versions are driven by git tags. Tag `vX.Y.Z` to release.
- Docs are deployed per version tag and aliased to **latest**.

## Release Procedure (Required)

Follow these steps exactly when creating a new release.

### Task 1. Update release metadata (manual edits)

1.1. CITATION.cff: update version and date-released
1.2. lakefile.toml: update version
1.3. CHANGELOG.md: add section, move unreleased entries, update links

### Task 2. Sync and Validate

Sync reads `CITATION.cff` version and `date-released`
and updates `pyproject.toml` fallback-version.

```shell
uv run se-manifest-version-sync
uv sync --extra dev --extra docs --upgrade

lake build
lake build TestAll

uv run se-ref-validate
uv run se-ref-export
uv run se-ref-export --check
uv run se-validate --strict

git add -A
uvx pre-commit run --all-files
# repeat if changes were made
git add -A
uvx pre-commit run --all-files

uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build
uvx pre-commit run --all-files
```

### Task 3. Commit, tag, push

```shell
git add -A
git commit -m "Prep X.Y.Z"
git push -u origin main
```

Verify actions run on GitHub. After success:

```shell
git tag vX.Y.Z -m "X.Y.Z"
git push origin vX.Y.Z
```

### Task 4. After tagging, verify tag consistency

```shell
uv run se-validate --require-tag
```

Confirms CITATION.cff version matches the pushed git tag.
Run this after `git push origin vX.Y.Z`; it will fail before that point.

## Only As Needed (delete a tag)

```shell
git tag -d vX.Z.Y
git push origin :refs/tags/vX.Z.Y
```

## Links

[Unreleased]: https://github.com/structural-explainability/se-theory-transformation/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v0.2.0
[0.1.0]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v0.1.0
