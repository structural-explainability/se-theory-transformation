# Project Example

This example illustrates a transformation operator informally.

It is not a formal definition and does not decide persistence.

## Operator

```text
PR  project
```

## Intuition

A project transformation derives a selected view or representation from a
referent.

## Formal authority

The authoritative operator definition is in:

```text
SETheoryTransformation/Domain/Operator/Codes.lean
SETheoryTransformation/Domain/Operator/Labels.lean
SETheoryTransformation/Domain/Operator/Semantics.lean
```

The reference mirror is in:

```text
reference/transformation-operators.toml
```

## Boundary

```text
Project describes selected representation.
Persistence is evaluated downstream.
```
