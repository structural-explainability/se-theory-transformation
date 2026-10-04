# Composition

Composition describes sequencing among transformation operators.

The canonical composition lookup is ordered and explicitly partial.

## Authority

The authoritative declared composition definitions are:

```text
SE/Transformation/Relation/Composition.lean
SE/Transformation/Reference/Composition.lean
```

`composition? left right` returns:

- `some relation` when this theory specifies a canonical relation for the
  ordered pair; or
- `none` when no canonical composition relation is specified here.

`none` does not mean that the pair is invalid.

## Effect Constraints

`SE.Transformation.Effect.Composition`
uses operator footprints and required-change conditions
to state necessary conditions for restoration and
for declared inverse-like pairs.

These results do not establish that an operator actually restores
a prior configuration,
and they do not derive the declared composition lookup.

## Independent Relations

Composition and orthogonality answer different questions.

Composition describes sequencing.
Orthogonality records a separate relation between operator effects.

A pair may have both relations.
