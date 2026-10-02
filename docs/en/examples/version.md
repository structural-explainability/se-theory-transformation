# Version Example

This example illustrates a transformation operator informally.

It is not a formal definition and does not decide persistence.

## Operator

```text
VS  version
```

## Intuition

A version transformation produces or identifies a temporally ordered version or
successor of a referent.

Versioning preserves provenance linkage, but this example does not decide
whether identity persists through the version relation.

## Formal authority

The authoritative operator definitions are in:

```text
SE/Transformation/Domain/Operator/
```

The authoritative family vocabulary is in:

```text
SE/Transformation/Domain/TransformationFamily.lean
```

The operator-to-family mapping is in:

```text
SE/Transformation/Domain/Operator/Semantics.lean
```

The reference mirrors are in:

```text
reference/transformation-operators.toml
reference/transformation-families.toml
```

## Boundary

```text
Version describes temporal succession.
Persistence is evaluated downstream.
```
