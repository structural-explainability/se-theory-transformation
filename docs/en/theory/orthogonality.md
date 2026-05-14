# Orthogonality

Orthogonality describes structural independence among transformation
operators.

An orthogonality rule describes whether two operators have distinct, shared,
dependent, conflicting, inverse-like, or unresolved effect domains. It does not
assert persistence.

## Authority

The authoritative Lean definitions are in:

```text
SETheoryTransformation/Relation/Orthogonality.lean
SETheoryTransformation/Reference/Orthogonality.lean
```

The reference registry mirror is in:

```text
reference/orthogonality-rules.toml
```

Generated data artifacts are in:

```text
data/transformation/orthogonality-matrix.json
```

## Use

Orthogonality helps keep the operator vocabulary distinguishable.

It is a structural independence check, not a value judgment.

## Rule

```text
Orthogonality describes independence.
Composition describes sequencing.
Persistence is evaluated downstream.
```
