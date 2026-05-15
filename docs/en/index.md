# SE Theory: Transformation

> Lean 4 formalization of foundational transformation theory for
> Structural Explainability (SE).

For normative definitions, stability guarantees, and theorem statements,
see `SETransformation.lean` (the authoritative source).
This document provides a brief orientation only.

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
uv run se-ref-validate
uv run se-ref-export --check
uv run se-validate --strict
```

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

## Tooling

Python and other tooling may be used for:

- documentation generation
- formatting and linting
- repository automation
- reference artifact validation
- generated contract export checks

They must not:

- define correctness
- validate theory semantics independently of Lean
- replace Lean definitions or proofs
- introduce downstream theory dependencies
