# Orthogonality

Orthogonality is a declared relation among selected pairs
of transformation operators.

The canonical orthogonality lookup is explicitly partial and symmetric.

## Authority

The authoritative declared relations are:

```text
SE/Transformation/Relation/Orthogonality.lean
SE/Transformation/Reference/Orthogonality.lean
```

`orthogonality? left right` returns:

- `some relation` when this theory specifies a canonical relation for the
  unordered pair; or
- `none` when no canonical orthogonality relation is specified here.

The Lean theorem `orthogonality_symm` guarantees that reversing a pair
cannot change its orthogonality result.

## Effect Relationships

`EffectsDisjoint` and `EffectsOverlap`
are derived from operator footprints.

They are not definitions of the full orthogonality relation.

The effect layer checks that currently declared
orthogonal and overlapping entries are consistent
with the corresponding footprint-derived predicates.

`inverseLike` is a composition relation,
not an orthogonality value.
