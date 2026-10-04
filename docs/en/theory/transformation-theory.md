# Transformation Theory

Transformation theory provides the structural vocabulary
and formal effect constraints for describing atomic change.

It defines operators, families, kinds,
derived taxonomy queries,
effect dimensions,
operator footprints and required-change conditions,
composition relations,
and orthogonality relations.

## Core Rule

Transformations describe atomic change.

## Public Surface

The public Lean import is:

```lean
import SE.Transformation
```

The public surface reaches every retained production module in this repository.

## Taxonomy Authority

The authoritative classification functions are:

- operatorFamily
- familyKind
- operatorKind

`operatorKind` is derived from `operatorFamily` and `familyKind`.

Per-family and per-kind operator lists are not maintained independently.
`operatorsInFamily`, `operatorsInKind`, and `familiesInKind`
are derived from the authoritative mappings and canonical finite registries.

## Effect Semantics

Atomic operator effects are constrained by:

- footprint
- requirements
- characteristic
- StateModel

See [Effect Semantics](./effects.md) for the model and its generic results.

## Structural Relations

Composition is an ordered, partial lookup.

Orthogonality is a symmetric, partial lookup.

Effect-derived predicates and necessary conditions
provide additional consistency checks and constraints,
but do not replace those declared relations.

Absence of a declared rule means that this theory
has not specified a canonical relation for that pair.
