# Operator Taxonomy

The operator taxonomy classifies transformation operators through the Lean
taxonomy path.

```mermaid
flowchart LR
    OC["OperatorCode"] --> TF["TransformationFamily"]
    TF --> TK["TransformationKind"]
```

The authoritative Lean definitions are in:
`SE/Transformation/Domain/`.

## Rule

- Operators name atomic changes.
- Families group operators.
- Kinds group families.
