# SE Theory: Transformations

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

## Transformations

Transformations are defined independently.
Persistence is evaluated downstream.

This repository treats transformations as formal structural changes that can be
named, grouped, related, composed, and exposed for downstream theory.

## Dependencies

This repository is a theory-layer repository for Structural Explainability.

It is intended to be consumed downstream by repositories that evaluate identity,
persistence, regime behavior, domain mappings, or operational policy.

## Covers

This repository covers:

- transformation operator vocabulary
- transformation family vocabulary
- transformation kind vocabulary
- operator-to-family mappings
- family-to-kind mappings
- composition relation vocabulary
- orthogonality relation vocabulary
- transformation outcome vocabulary
- Lean-side reference enumerations
- machine-readable transformation registries
- public Lean import surface

## Owns

This repository owns:

- Lean definitions under `SETheoryTransformation/`
- the public import surface `SETheoryTransformation.lean`
- curated exports in `SETheoryTransformation/Surface.lean`
- reference artifacts under `reference/`
- generated transformation artifacts under `data/transformation/`
- transformation schemas under `data/schema/`
- validation and export tooling for transformation artifacts

## Does not own

This repository does not own:

- neutral substrate primitives
- identity regimes
- regime profiles
- regime classification matrices
- persistence behavior
- regime persistence semantics
- accountable entities
- exchange protocols
- domain mappings
- runtime systems

## Design Constraints

Lean source files are authoritative for formal definitions, mappings,
relations, predicates, proof obligations, and reference rules.

Python and generated data may mirror, validate, export, or document the Lean
surface. They must not define theory semantics independently of Lean.

Constructor-level vocabulary is intentionally not duplicated in this README.
See the Lean source files and reference registries for current values.

## Documentation Constraints

Documentation is descriptive only.

It may provide orientation, summaries, and navigation. It must not introduce
formal semantics absent from Lean.

## Contents

Primary Lean locations:

```text
    SETheoryTransformation/Domain/
    SETheoryTransformation/Relation/
    SETheoryTransformation/Reference/
    SETheoryTransformation/Outcome.lean
    SETheoryTransformation/Registry.lean
    SETheoryTransformation/Conformance.lean
```

Machine-readable artifacts mirror the Lean surface and reference registries:

```text
    reference/
    data/transformation/
```

Schemas for generated data artifacts are in:

```text
    data/schema/
```

Central public vocabulary includes:

```text
    OperatorCode
    TransformationFamily
    TransformationKind
    CompositionRelation
    CompositionRule
    OrthogonalityRelation
    OrthogonalityRule
    TransformationOutcome
```

## Build

```shell
elan self update
lake update
lake build
lake build TestAll
```

## Import

Downstream Lean projects should import the public surface:

```lean
import SETheoryTransformation
```

The public import surface is curated in:

```text
SETheoryTransformation.lean
SETheoryTransformation/Surface.lean
```

## Tooling

Python and other tooling may be used for:

- documentation generation
- formatting and linting
- repository automation
- registry validation
- generated artifact checks

They must not:

- define correctness
- validate theory semantics independently of Lean
- replace Lean definitions or proofs

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
