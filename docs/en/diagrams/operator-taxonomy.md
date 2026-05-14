# Operator Taxonomy

The operator taxonomy classifies transformation operators through the Lean
taxonomy path:

```text
OperatorCode -> TransformationFamily -> TransformationKind
```

The authoritative Lean definitions are in:

```text
SETheoryTransformation/Domain/Operator/Codes.lean
SETheoryTransformation/Domain/Operator/Labels.lean
SETheoryTransformation/Domain/Operator/Semantics.lean
SETheoryTransformation/Domain/TransformationFamily.lean
SETheoryTransformation/Domain/TransformationKind.lean
```

The reference registry mirrors are in:

```text
reference/transformation-operators.toml
reference/transformation-families.toml
reference/transformation-kinds.toml
```

Generated data is in:

```text
data/transformation/operator-registry.json
data/transformation/transformation-family-registry.json
data/transformation/transformation-catalog.json
```

## Rule

```text
Operators define changes.
Families group operators.
Kinds group families.
Persistence is evaluated downstream.
```
