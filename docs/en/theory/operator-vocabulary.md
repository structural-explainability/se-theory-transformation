# Operator Vocabulary

Operators are named transformation primitives.

They define kinds of change, not survival judgments.

## Authority

The authoritative Lean definitions are in:

```text
SE/Transformation/Domain/Operator/
```

The semantic classification path is:

```text
OperatorCode -> TransformationFamily -> TransformationKind
```

`operatorFamily` is the sole operator-to-family mapping.
`familyKind` is the sole family-to-kind mapping.
`operatorKind` is derived from those two mappings.

The registry queries `operatorsInFamily`, `operatorsInKind`, and
`familiesInKind` are derived from the authoritative mappings and canonical
reference lists.

Persistence-specific interpretation belongs downstream.
