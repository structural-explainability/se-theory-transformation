# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

---

## [Unreleased]

### Planned

- Additional operator semantics
- Orthogonality relation expansion
- Composition admissibility rules
- Registry export validation
- Lean surface validation tooling
- Reference artifact generation
- Transformation theorem structure

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
uv run se-validate --strict
git add -A
uvx pre-commit run --all-files
uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build
lake build
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

[Unreleased]: https://github.com/structural-explainability/se-theory-transformation/compare/v0.3.0...HEAD
[0.1.0]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v0.1.0
