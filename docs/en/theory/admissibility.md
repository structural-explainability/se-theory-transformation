# Admissibility

Admissibility describes whether transformation vocabulary entries satisfy the
structural requirements of this theory.

It does not assert persistence, correctness for a domain, or operational
authorization.

## Authority

The authoritative Lean definitions are in:

```text
SETheoryTransformation/Domain/Operator/Admissibility.lean
SETheoryTransformation/Conformance.lean
```

Related taxonomy mappings are in:

```text
SETheoryTransformation/Domain/Operator/Semantics.lean
```

## Rule

```text
Admissibility checks structural conformance.
Persistence is evaluated downstream.
Operational policy belongs downstream.
```

## Notes

Admissibility is internal to the transformation theory layer.

A transformation operator may be admissible as vocabulary without being
appropriate for every domain, regime, or application.
