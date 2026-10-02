# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

---

## [Unreleased]

### Planned

- Expand composition and orthogonality rule coverage, including investigating
  whether split and merge admit a justified orthogonality classification.
- Investigate a coherence law between composition and orthogonality, including
  whether absorbing, inverse-like, or redundant composition relations preclude
  orthogonality.

---

## [0.4.0] - 2026-10-02

### Added

- Added `SE.Transformation.Invariants` with finite regression guards for
  reference-list uniqueness and completeness, nonempty family and kind
  coverage, and agreement between derived queries and authoritative taxonomy
  mappings.
- Added the proof-facing membership theorems `operatorInFamily_iff`,
  `operatorInKind_iff`, and `operatorInKind_of_operatorInFamily`.
- Added decidable instances for `OperatorInFamily` and `OperatorInKind`.
- Added membership tests covering decidability, negative membership, and
  family-to-kind reasoning.
- Added reference registries for public vocabulary, predicates, and theorems.
- Expanded the stable Research Registry citation surface to 24 identifiers
  aligned one-to-one with `RR.DEFINES` declarations and `Spec.lean`.

### Changed

- Centralized operator classification in the authoritative `operatorFamily`
  and `familyKind` mappings, with `operatorKind` derived transitively from
  them.
- Replaced independently maintained family and kind operator lists with
  derived `operatorsInFamily`, `operatorsInKind`, and `familiesInKind`
  queries.
- Replaced the former conformance layer with explicit finite taxonomy
  invariants.
- Made composition explicitly partial and directional through `composition?`;
  absence of a rule now means that the theory specifies no canonical relation
  for that ordered pair.
- Made orthogonality explicitly partial and symmetric through
  `orthogonality?`, with symmetry enforced by the lookup and proved by
  `orthogonality_symm`.
- Clarified the distinction between composition and orthogonality as
  independent structural relations.
- Rebuilt the reference layer from the retained Lean public surface and
  authoritative taxonomy mappings.
- Updated documentation and tests to reflect the reduced theory boundary and
  current module structure.
- Clarified that persistence judgments and operational policy belong
  downstream rather than in foundational Transformation theory.

### Removed

- Removed `TransformationOutcome` and the associated outcome reference
  artifacts from Transformation theory.
- Removed the vacuous `OperatorAdmissible` predicate, operator-specification
  placeholder, admissibility documentation, and admissibility tests.
- Removed redundant per-family and per-kind Lean modules.
- Removed the `CompositionRule` and `OrthogonalityRule` wrapper structures.
- Removed `unknown` as a composition and orthogonality relation constructor;
  unspecified relations are represented by partial lookup failure instead.
- Removed `inverseLike` from orthogonality because inverse direction is not a
  degree of structural independence.
- Removed the former split/merge orthogonality classification where the theory
  did not justify an independence relation.

### Fixed

- Fixed production-module reachability so the retained theory is exercised by
  the public build and lint surfaces rather than leaving substantial source
  modules unreachable.
- Fixed taxonomy regression checks so they assert properties that can actually
  fail when the finite vocabulary changes.
- Fixed orthogonality representation so reversing an operator pair cannot
  produce a different canonical relation.
- Fixed stale reference mappings and source-module references after collapsing
  the family and kind module hierarchy.
- Fixed reference coverage so current citable Lean declarations and stable
  specification identifiers agree.

---

## [0.3.0] - 2026-10-01

### Added

- Added the repository-level `SE` production import surface.
- Added the `SE.Transformation` public theory import surface.
- Added the `SETest` test import surface and `SETest.Transformation`
  test aggregate.
- Added repository-specific `reference/theory-reference.toml`
  configuration for `se-theory-reference-kit`.
- Added generated-artifact currency checks and strict reference
  validation through the shared reference kit.
- Added explicit Batteries lint configuration for the
  `SE.Transformation` public module.
- Added standard repository accountability, annotation, VS Code,
  validation, and release-support files.
- Added generated transformation-kind registry data.

### Changed

- Migrated the Lean source tree from the legacy
  `SETheoryTransformation` namespace and module layout to
  `SE.Transformation`.
- Migrated Lean source files to the current Lean module system with
  explicit module declarations, imports, namespaces, and public surfaces.
- Reorganized transformation operators, families, kinds, relations,
  reference rules, outcomes, registries, specifications, and conformance
  declarations under the current `SE.Transformation` hierarchy.
- Updated Lean tests to the current `SETest.Transformation` hierarchy.
- Updated the package to Lean 4.32.1 and Mathlib v4.32.1.
- Replaced repository-specific reference tooling with the shared
  `se-theory-reference-kit`.
- Updated transformation reference configuration to use the actual
  operator, family, kind, outcome, composition, orthogonality, and type
  artifacts rather than Neutral Substrate mappings.
- Updated composition and orthogonality reference tables for generic
  reference-kit export.
- Regenerated transformation reference JSON artifacts and the generated
  transformation catalog from the canonical TOML reference artifacts.
- Updated Lean source-module references in transformation reference
  artifacts to the `SE.Transformation` namespace.
- Updated repository workflows, metadata, documentation, and development
  configuration to current Structural Explainability repository standards.

### Removed

- Removed the legacy `SETheoryTransformation` Lean module tree.
- Removed the legacy `SETheoryTransformation.Surface` intermediary
  public surface.
- Removed the legacy `test/` Lean test layout.
- Removed the repository-specific `se_theory_transformation` Python
  reference-loading, validation, export, and command implementation.
- Removed the associated repository-specific Python tests.
- Removed the legacy `reference/index.toml` artifact index in favor of
  `reference/theory-reference.toml`.

### Fixed

- Fixed Lean module visibility and import-boundary issues introduced by
  migration to the current module system.
- Fixed transformation reference configuration that incorrectly pointed
  to Neutral Substrate reference artifacts.
- Fixed composition and orthogonality reference mappings so the shared
  reference kit can resolve and export them independently.
- Fixed generated-reference drift; export and catalog checks now report
  all configured generated artifacts as current.
- Fixed reference-surface validation; all eight declared public Lean type
  symbols are registered.
- Fixed repository manifest validation under the current strict schema.

---

## [0.2.1] - 2026-05-15

### Changed

- Updated index.md to use the standard theory-repository documentation sections.
- Updated `ci-python-zensical.yml` required documentation sections to match
  the standard theory-repository structure.
- Updated README.md
- refactored to use ref_utils.py

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
- During `0.x` development, breaking formal-surface changes
  may occur in a **MINOR** release.

## Release Procedure (Required)

Follow these steps exactly when creating a new release.

### One-Time Zenodo Authorization

1. Sign in to Zenodo.
2. Open your profile menu in the upper-right.
3. Select GitHub.
4. Click Sync now.
5. Find structural-explainability/ this repo.
6. Turn on the repository toggle/slider.
7. Refresh the page and confirm it appears as enabled.
8. Zenodo will ingest future GitHub Releases from this repo.

### Task 1. Update release metadata (manual edits)

1.1. CITATION.cff: update version and date-released
1.2. lakefile.toml: update version
1.3. CHANGELOG.md: add section, move unreleased entries, update links
1.4. pyproject.toml: update version (near top of the file)

### Task 2. Set up and Validate

```shell
# set up or update Python environment
# Run repository checks.
.\sit.ps1

# Update GitHub Actions and pin all action references to immutable SHAs.
uvx gha-tools autoupdate --pin=all --write .github/workflows

# Update hooks.
uvx prek update
git add -A
uvx prek run --all-files

# Audit the resulting GitHub configuration for security findings.
# NO .github\workflows\deploy-zensical.yml
# YES  .github\workflows\deploy-zensical-lean.yml
uvx zizmor@latest .github/

# Validate.
uvx cffconvert --validate
uvx se-manifest-schema validate-manifest --strict

# Format Markdown.
npx markdownlint-cli2 --fix

# update lean
elan self update
lake update

# build Lean (source of truth)
# lake clean
lake build
lake test
lake lint

# Generate JSON artifacts and catalog from reference TOML.
uv run se-theory-reference inspect
uv run se-theory-reference export
uv run se-theory-reference catalog

# Validate the reference artifacts against the Lean public surface.
uv run se-theory-reference validate --strict

# Verify generated artifacts are current without rewriting them.
uv run se-theory-reference export --check
uv run se-theory-reference catalog --check

.\rel.ps1
.\sit.ps1
```

Review all generated and modified files before committing.

### Task 3. Commit and Push

```shell
git add -A
git commit -m "Prep X.Y.Z"
git push -u origin main
```

Verify that all required GitHub Actions complete successfully,
including the combined Zensical and Lean API documentation deployment.

### Task 4. Tag and Push the Release

After the required GitHub Actions succeed:

```shell
git tag vX.Y.Z -m "X.Y.Z"
git push origin vX.Y.Z
```

Create GitHub Release after pushing tag, for example
with a command like this:

```shell
gh release create v0.8.0 --verify-tag --title "0.8.0"  --generate-notes
```

## Only As Needed (delete a tag)

```shell
git tag -d vX.Z.Y
git push origin :refs/tags/vX.Z.Y
```

## Links

[Unreleased]: https://github.com/structural-explainability/se-theory-transformation/compare/v0.4.0...HEAD
[0.4.0]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v0.4.0
[0.3.0]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v0.3.0
[0.2.1]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v0.2.1
[0.2.0]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v0.2.0
[0.1.0]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v0.1.0
