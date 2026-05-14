# Operator Vocabulary

Operators are named transformation primitives.

They define kinds of change, not survival judgments.

## Rule

```text
Transformation operators describe change.
Persistence theory evaluates what survives change.
```

## Authority

The authoritative Lean definitions are in:

```text
SETheoryTransformation/Domain/Operator/Codes.lean
SETheoryTransformation/Domain/Operator/Labels.lean
SETheoryTransformation/Domain/Operator/Semantics.lean
```

Operator-to-family mappings are defined in:

```text
SETheoryTransformation/Domain/Operator/Semantics.lean
```

The reference registry mirror is in:

```text
reference/transformation-operators.toml
```

Generated data artifacts are in:

```text
data/transformation/operator-registry.json
data/transformation/transformation-catalog.json
```

## Notes

Operator labels are presentation labels only.

The semantic classification path is:

```text
OperatorCode -> TransformationFamily -> TransformationKind
```

Persistence-specific interpretation belongs downstream.
