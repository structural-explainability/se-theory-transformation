# SE Theory: Transformations

Lean 4 formalization of foundational transformation theory for Structural
Explainability.

This repository defines structural transformation vocabulary and relations.
It does not decide what persists through those transformations.

## Core principle

```text
Transformations are defined independently.
Persistence is evaluated downstream.
```

## Scope

This repository covers:

- transformation operator, family, and kind vocabulary
- operator-to-family and family-to-kind mappings
- composition and orthogonality relations
- transformation outcome vocabulary
- Lean-side reference enumerations
- machine-readable transformation registries
- public Lean import surface

It does not own:

- neutral substrate primitives
- identity regimes
- regime profiles
- persistence behavior
- accountable entities
- exchange protocols
- domain mappings
- runtime systems

## Public Lean import

Downstream Lean projects should import the public surface:

```lean
import SETheoryTransformation
```

The public surface is curated in:

```text
SETheoryTransformation.lean
SETheoryTransformation/Surface.lean
```

## Authoritative source files

Lean source files are authoritative for formal definitions, mappings,
relations, predicates, proof obligations, and reference rules.

Primary locations:

```text
SETheoryTransformation/Domain/
SETheoryTransformation/Relation/
SETheoryTransformation/Reference/
SETheoryTransformation/Registry.lean
SETheoryTransformation/Outcome.lean
SETheoryTransformation/Conformance.lean
```

Machine-readable reference artifacts mirror the Lean surface:

```text
reference/
data/transformation/
```

Schemas for generated data artifacts are in:

```text
data/schema/
```

## Documentation rule

Documentation is descriptive only.

It may provide orientation, summaries, and navigation. It must not introduce
formal semantics absent from Lean.

## Build

```shell
lake build
lake build TestAll
uv run se-validate --strict
uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build
```
