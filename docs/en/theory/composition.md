# Composition

Composition describes sequencing among transformation operators.

A composition rule describes whether one operator may meaningfully follow
another operator. It does not assert persistence.

## Authority

The authoritative Lean definitions are in:

```text
SETheoryTransformation/Relation/Composition.lean
SETheoryTransformation/Reference/Composition.lean
```

The reference registry mirror is in:

```text
reference/composition-rules.toml
```

Generated data artifacts are in:

```text
data/transformation/composition-registry.json
```

## Rule

```text
Composition describes sequencing.
Persistence describes survival.
```

## Notes

Composition and orthogonality answer different questions.

Two operators may be composable because they form a meaningful sequence while
also being orthogonal because they affect distinct domains.
