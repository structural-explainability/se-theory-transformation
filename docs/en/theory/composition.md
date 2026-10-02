# Composition

Composition describes sequencing among transformation operators.

The canonical composition lookup is ordered and explicitly partial.

## Authority

The authoritative Lean definitions are:

```text
SE/Transformation/Relation/Composition.lean
SE/Transformation/Reference/Composition.lean
```

`composition? left right` returns:

- `some relation` when this theory specifies a canonical relation for the
  ordered pair; or
- `none` when no canonical composition relation is specified here.

`none` does not mean that the pair is invalid.

Composition and orthogonality answer different questions.
Composition describes sequencing; orthogonality describes effect-domain
independence. A pair may have both relations.

Persistence is evaluated downstream.
