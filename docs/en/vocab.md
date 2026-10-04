# Transformation Vocabulary

**Transformation theory** provides a structured vocabulary for describing change.

It defines transformation kinds, transformation families, named operations,
composition relations, and orthogonality relations.

## Scope

This theory names and organizes kinds of change and selected relations among
transformation operations.

The current theory does not define state-transition semantics for its
operations. Operations currently have prose descriptions, and their formal
relations are declared rather than derived from operational effects.

A future operational semantics could interpret each operation as a step
relation on states and make its effects available for formal reasoning.

Orthogonality is currently described in terms of effect domains that are not
yet formalized.

Persistence judgments and operational policy are out of this scope.

## Transformation Kinds

[**Transformation kinds**](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/transformation-kind-registry.json)
are the broadest categories of change.

## 17 Operations (named transformations)

- [**Operations**](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/operator-registry.json)
  are the concrete named transformations.
  Each operator belongs to exactly one family and therefore one kind.

## Transformation Families

[**Transformation families**](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/transformation-family-registry.json)
group operations by shared behavior within the broad transformation kinds.

Each operation belongs to exactly one transformation family,
and each transformation family belongs to exactly one transformation kind.

### Composition Relations

[**Composition relations**](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/composition-registry.json)
describe selected ordered pairs of operations.

Composition relations describe sequencing between operations.

### Orthogonality Relations

[**Orthogonality relations**](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/orthogonality-matrix.json)
describe selected ordered pairs of operations
in terms of structural independence.

## Summary

Transformation theory provides a structured vocabulary for
**what kind of change occurred**,
**how concrete operations are grouped**, and
**how some operations relate to one another**.
