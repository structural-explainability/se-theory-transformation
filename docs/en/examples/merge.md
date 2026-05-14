# Merge Example

This example illustrates a transformation operator informally.

It is not a formal definition and does not decide persistence.

## Operator

```text
MG  merge
```

## Intuition

A merge combines multiple referents or structural components into a unified
referent or aggregate.

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
Merge describes combination.
Persistence is evaluated downstream.
```
