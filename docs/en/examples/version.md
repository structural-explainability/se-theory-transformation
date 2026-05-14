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

The authoritative operator definition is in:

```text
SETheoryTransformation/Domain/Operator/Codes.lean
SETheoryTransformation/Domain/Operator/Labels.lean
SETheoryTransformation/Domain/Operator/Semantics.lean
```

The authoritative family vocabulary is in:

```text
SETheoryTransformation/Domain/TransformationFamily.lean
```

The operator-to-family mapping is in:

```text
SETheoryTransformation/Domain/Operator/Semantics.lean
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
