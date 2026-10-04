# Transformation Vocabulary

**Transformation theory** provides a structured vocabulary for describing change.

It defines transformation kinds, transformation families, named operations,
atomic effect semantics, composition relations, and orthogonality relations.

## Scope

This theory names and organizes kinds of change
and formalizes constraints on the intrinsic effects
of individual transformation operations.

One application of an operator is modeled as an atomic step
between abstract transformation configurations.

For each operator:

- `footprint` gives a conservative upper bound on the dimensions
  the atomic step may change;
- `requirements` gives the required-change clauses that every step
  must satisfy; and
- `characteristic`, when defined, identifies the single required dimension
  of an operator whose complete requirement is one singleton clause.

Composition and orthogonality remain explicitly declared,
partial relations among operators.
The effect semantics supplies additional derived predicates and
necessary conditions; it does not replace those declarations.

Persistence judgments and operational policy are out of this scope.

## Transformation Kinds

[**Transformation kinds**](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/transformation-kind-registry.json)
are the broadest categories of change.

## 17 Operations (named transformations)

[**Operations**](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/operator-registry.json)
are the concrete named transformations.

Each operator belongs to exactly one family and therefore one kind.

The generated operator registry also exposes
the current `footprint` and `requirements` for every operator.

## Transformation Families

[**Transformation families**](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/transformation-family-registry.json)
group operations by shared behavior within the broad transformation kinds.

Each operation belongs to exactly one transformation family,
and each transformation family belongs to exactly one transformation kind.

## Effect Semantics

[**Effect semantics**](./theory/effects.md)
formalize effect dimensions,
operator footprints,
required-change conditions,
and abstract atomic operator steps.

## Composition Relations

[**Composition relations**](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/composition-registry.json)
describe selected ordered pairs of operations.

Composition relations describe sequencing between operations.

## Orthogonality Relations

[**Orthogonality relations**](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/orthogonality-matrix.json)
describe selected unordered pairs of operations.

Composition and orthogonality are independent ways
of describing relationships among operations.

## Summary

Transformation theory provides a structured vocabulary for

- what kind of change occurred;
- how concrete operations are grouped;
- what dimensions an atomic operation may or must change; and
- how selected operations relate to one another.
