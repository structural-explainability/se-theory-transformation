# Orthogonality

Orthogonality describes structural independence among transformation
operators.

The canonical orthogonality lookup is explicitly partial and symmetric.

## Authority

The authoritative Lean definitions are:

```text
SE/Transformation/Relation/Orthogonality.lean
SE/Transformation/Reference/Orthogonality.lean
```

`orthogonality? left right` returns:

- `some relation` when this theory specifies a canonical relation for the
  unordered pair; or
- `none` when no canonical orthogonality relation is specified here.

The Lean theorem `orthogonality_symm` guarantees that reversing a pair cannot
change its orthogonality result.

`inverseLike` is not an orthogonality value. Inverse direction is a sequencing
or transformation relationship rather than a degree of independence.

Persistence is evaluated downstream.
