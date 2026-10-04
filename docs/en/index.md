# SE Theory: Transformation

> Lean 4 formalization of foundational transformation theory for
> Structural Explainability (SE).

Transformations are defined independently.

- [Lean API Reference](https://structural-explainability.github.io/se-theory-transformation/lean/)
- [GitHub Repository](https://github.com/structural-explainability/se-theory-transformation)

## Scope

Transformation theory defines transformation kinds, families, operations,
composition relations, and orthogonality relations.

Persistence judgments and operational policy are out of this scope.

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

## Build

```shell
lake build
lake test
lake lint
```

## Import

```lean
import SE.Transformation
```
