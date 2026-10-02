# SE Theory: Transformation

> Lean 4 formalization of foundational transformation theory for
> Structural Explainability (SE).

Transformations are defined independently.
Persistence is evaluated downstream.

## Covers

This repository covers:

- transformation operator vocabulary;
- transformation family vocabulary;
- transformation kind vocabulary;
- the authoritative operator-to-family mapping;
- the authoritative family-to-kind mapping;
- derived family and kind registry queries;
- composition relation vocabulary and a partial ordered-pair lookup;
- orthogonality relation vocabulary and a partial symmetric lookup;
- finite conformance invariants;
- machine-readable transformation registries; and
- a public Lean import surface.

## Does Not Own

This repository does not own:

- neutral substrate primitives;
- identity regimes;
- regime profiles;
- persistence verdicts;
- regime persistence semantics;
- operational admissibility policy;
- accountable entities;
- evolution protocols;
- domain mappings; or
- runtime systems.

## Authority

Lean source is authoritative for taxonomy semantics and structural relations.

The semantic classification path is:

```text
OperatorCode -> TransformationFamily -> TransformationKind
```

`operatorFamily` and `familyKind` are the sole authoritative mappings.
Derived lists and reference artifacts mirror those functions; they are not
independent sources of classification semantics.

Composition and orthogonality are explicitly partial. Absence of a rule means
that this theory has not specified a canonical relation for that pair.

## Primary Lean Locations

```text
SE/Transformation/Domain/
SE/Transformation/Relation/
SE/Transformation/Reference/
SE/Transformation/Registry.lean
SE/Transformation/Conformance.lean
SE/Transformation/Spec.lean
```

## Build

```shell
lake build
lake test
lake lint
```

## Import

Downstream Lean projects should import:

```lean
import SE.Transformation
```
