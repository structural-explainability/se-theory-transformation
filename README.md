# SE Theory: Transformation

[![Docs Site](https://img.shields.io/badge/docs-site-blue?logo=github)](https://structural-explainability.github.io/se-theory-transformation/)
[![Repo](https://img.shields.io/badge/repo-GitHub-black?logo=github)](https://github.com/structural-explainability/se-theory-transformation)
[![Tooling](https://img.shields.io/badge/python-3.15%2B-blue?logo=python)](./pyproject.toml)
[![License](https://img.shields.io/badge/license-MIT-yellow.svg)](./LICENSE)

[![CI-Lean](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-lean.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-lean.yml)
[![CI](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-python-zensical.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-python-zensical.yml)
[![Docs](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/deploy-zensical.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/deploy-zensical.yml)
[![Links](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/links.yml)

> Lean 4 formalization of foundational transformation theory for Structural Explainability.

This repository defines structural transformation vocabulary and relations.

It does not decide what persists through a transformation. Persistence,
identity-regime behavior, domain-specific survival criteria, and operational
policy belong downstream.

For the full documentation, see [`docs/en/index.md`](./docs/en/index.md).

## Authority

Lean source files are authoritative for formal definitions, predicates, axioms,
theorems, proof obligations, and reference rules.

Reference artifacts under `reference/` and generated artifacts under
`data/transformation/` mirror the Lean public surface.
They do not define theory semantics independently of Lean.

## Import

Downstream Lean projects should import the public surface:

```text
import SETheoryTransformation
```

The public import surface is curated in:

```text
SETheoryTransformation.lean
SETheoryTransformation/Surface.lean
```

## Build

Use VS Code Menu:
View / Command Palette / `Developer: Reload Window` to refresh.

```shell
elan self update
lake update
lake build
lake build TestAll
uv run se-ref-validate
uv run se-ref-export --check
uv run se-validate --strict
```

## Command Reference

<details>
<summary>Show command reference</summary>

### In a machine terminal

Open a machine terminal where you want the project:

```shell
git clone https://github.com/structural-explainability/se-theory-transformation

cd se-theory-transformation
code .
```

### In a VS Code terminal

```shell
uv self update
uv python pin 3.15
uv sync --extra dev --extra docs --upgrade

# install git hooks once per clone
uvx pre-commit install

# build Lean (source of truth)
lake build
lake build TestAll

# generate/check registry artifacts
uv run se-validate
uv run se-ref-validate
uv run se-ref-export
uv run se-ref-export --check
uv run se-validate --strict

# autofix and manual fix issues
git add -A
uvx pre-commit run --all-files
# repeat if changes were made
git add -A
uvx pre-commit run --all-files

# do chores
uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build

# save progress
git add -A
git commit -m "update"
git push -u origin main
```

</details>

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)

## Manifest

[SE_MANIFEST.toml](./SE_MANIFEST.toml)
