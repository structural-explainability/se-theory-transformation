# Transformation Theory

Transformation theory provides the structural vocabulary for describing
change.

It defines operators, families, kinds, derived taxonomy queries, composition
relations, and orthogonality relations. It does not decide what survives a
transformation.

## Core Rule

```text
Transformations describe change.
Persistence is evaluated downstream.
```

## Public Surface

The public Lean import is:

```lean
import SE.Transformation
```

The public surface reaches every retained production module in this repository.

## Taxonomy Authority

The authoritative classification functions are:

```text
operatorFamily
familyKind
operatorKind
```

`operatorKind` is derived from `operatorFamily` and `familyKind`.

Per-family and per-kind operator lists are not maintained independently.
`operatorsInFamily`, `operatorsInKind`, and `familiesInKind` are derived from
the authoritative mappings and canonical finite registries.

## Structural Relations

Composition is an ordered, partial lookup.

Orthogonality is a symmetric, partial lookup.

Absence of a rule means that this theory has not specified a canonical
relation for that pair.

## Boundary

This repository owns transformation vocabulary and structural relations.

It does not own identity regimes, persistence verdicts, operational
admissibility, accountable entities, evolution protocols, domain mappings,
or runtime systems.
