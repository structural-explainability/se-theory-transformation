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

This repository defines
transformation operators, transformation families,
composition vocabulary, admissibility vocabulary,
and orthogonality tests.

It does not define persistence, regime identity, or
domain-specific survival criteria.
Those belong downstream.

## Transformations

Transformations are defined independently.
Persistence is evaluated relative to them.

## Dependencies

None.
This repository is upstream of neutral substrate,
identity regimes, and persistence theory.

## Covers

- Transformation operator vocabulary
- Transformation family registry
- Composition relation vocabulary
- Orthogonality relation vocabulary
- Transformation outcome vocabulary
- Machine-readable operator registries
- Machine-readable composition rules
- Machine-readable orthogonality matrix
- JSON schemas for transformation registries
- Lean types for operator codes, composition relations, orthogonality relations, and outcomes
- Example composition witnesses
- Example orthogonality witnesses

## Owns

### Transformation operators

```text
CP  copy
PR  project
EM  embed
RF  reference
RO  reorder

SP  split
MG  merge
CL  collapse
EX  expand

SH  shift
VS  version
BR  branch
RV  revert

BD  bind
UB  unbind
AZ  authorize
AT  attest
```

### Transformation families

- structural
- decomposition
- aggregation
- compression
- elaboration
- relocation
- evolution
- contextual
- normative
- observational

### Composition relation vocabulary

- composable
- conditionally-composable
- non-composable
- redundant
- absorbing
- inverse-like
- unknown

### Orthogonality relation vocabulary

- orthogonal
- overlapping
- dependent
- inverse-like
- conflicting
- unknown

### Transformation outcome vocabulary

Outcome vocabulary used when evaluating structural effects.
Persistence-specific interpretation belongs downstream.

```text
PRS  preserves structure
BRK  breaks structure
INH  inherits structure
IGN  ignores structure
MIX  mixed / partial
UNK  unresolved
```

## Does not own

- Neutral substrate primitives
- Identity regimes
- Regime profiles
- Regime classification matrices
- Persistence behavior
- Regime persistence semantics
- Domain mappings or operational validation
- Runtime systems

## Design Constraints

- Lean is the only source of truth for correctness.
- Registries are descriptive/exported artifacts, not independent authorities.
- No persistence claims are made in this repository.
- No regime-specific survival criteria are defined here.
- No cross-repo imports are required at this layer.
- All formal guarantees are expressed as Lean definitions, predicates, or theorems.

## Documentation Constraints

- The documentation layer is descriptive only.
- Documentation sections must mirror Lean module structure.
- Documentation must not introduce formal semantics absent from Lean.

### Authority

Lean source files are the only authoritative definition of:

- types
- predicates
- theorems
- proof obligations
- formal transformation relations

Machine-readable registries must mirror the Lean surface.

### Prohibited in docs

- Restating formal definitions in alternative incompatible form
- Introducing new terminology not present in Lean or registries
- Encoding rules or invariants not present in Lean
- Making persistence claims
- Making regime-specific claims
- Diverging naming from Lean modules

### Allowed in docs

- Explanatory summaries
- Structural descriptions
- Navigation and orientation
- Non-authoritative theorem descriptions
- Registry summaries

## Contents

```text
se-theory-transformation/
  README.md
  AGENTS.md
  AGENT_CONDUCT.md
  CITATION.cff
  LICENSE
  MANIFEST.toml
  SE_MANIFEST.toml

  lakefile.toml
  lean-toolchain

  SETheoryTransformation/
    Basic.lean
    TransformationClass.lean
    Operator.lean
    Family.lean
    Composition.lean
    Outcome.lean
    Orthogonality.lean
    Registry.lean

    Transformation/
      Primitive.lean
      Structural.lean
      Temporal.lean
      Contextual.lean
      Normative.lean
      Observational.lean

    Operator/
      Codes.lean
      Semantics.lean
      Admissibility.lean

    Family/
      Branching.lean
      Decomposition.lean
      Aggregation.lean
      Projection.lean
      Reorganization.lean
      Versioning.lean
      Migration.lean

    Examples/
      Composition.lean
      Orthogonality.lean

    Tests/
      Orthogonality.lean
      Composition.lean
      Admissibility.lean

  data/
    transformation/
      operator-registry.json
      transformation-catalog.json
      transformation-family-registry.json
      outcome-registry.json
      composition-rules.json
      orthogonality-matrix.json

    schema/
      operator-registry.schema.json
      transformation-catalog.schema.json
      transformation-family-registry.schema.json
      outcome-registry.schema.json
      composition-rules.schema.json
      orthogonality-matrix.schema.json

  docs/
    index.md
    theory/
      transformation-theory.md
      operator-vocabulary.md
      composition.md
      orthogonality.md
      admissibility.md

    examples/
      split.md
      merge.md
      branch.md
      project.md
      version.md
      reorganization.md

    diagrams/
      operator-taxonomy.md
      composition-flow.md
      orthogonality-grid.md

  scripts/
    export_contracts.py
    validate_registries.py
    generate_reports.py

  reports/
    operator_registry_report.md
    orthogonality_report.md
    composition_report.md

  tests/
    test_registry_shapes.py
    test_operator_codes.py
    test_schema_validation.py
```

## See Especially

```text
SETheoryTransformation/Operator/Codes.lean
SETheoryTransformation/Operator/Semantics.lean
SETheoryTransformation/Family/*.lean
data/transformation/operator-registry.json
data/transformation/transformation-family-registry.json
data/transformation/orthogonality-matrix.json
```

## Build

Use VS Code Menu:
View / Command Palette / `Developer: Reload Window` to refresh.

```shell
elan self update
lake update
lake build
lake build TestExport
```

## Import

Single import surface:

```lean
import SETheoryTransformation
```

## Tooling

Python and other tooling may be used for:

- documentation generation
- formatting and linting
- repository automation

They must not:

- define correctness
- validate theory semantics
- replace Lean proofs

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

uvx pre-commit install

git add -A
uvx pre-commit run --all-files
# repeat if changes were made
git add -A
uvx pre-commit run --all-files

# OPTIONAL:
# Scaffold reference/ artifacts from Lean 4 source.
# Adds stubs for new symbols.
# Preserves existing descriptions, names, and cite_ids.
uv run se-ref-scaffold --dry-run
uv run se-ref-scaffold

# OPTIONAL OVERWRITE:
# Use carefully. Re-derives scaffolded fields and may overwrite
# existing descriptions, names, and cite_ids.
uv run se-ref-scaffold --overwrite

# IMPORTANT: Run checks
uv run se-validate --strict

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
