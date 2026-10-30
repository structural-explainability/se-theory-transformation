# SE Theory: Transformation

> Lean 4 formalization of foundational Transformation theory
> for Structural Explainability.

This repository formalizes transformation vocabulary,
operator classifications, effect constraints, and
selected structural relationships among transformations.

Lean source files under `SE/` are authoritative for formal definitions,
predicates, assumptions, theorems, and proof obligations.

- [Lean API Reference](https://structural-explainability.github.io/se-theory-transformation/lean/)
- [GitHub Repository](https://github.com/structural-explainability/se-theory-transformation)
- [Transformation Vocabulary](vocab.md)
- [Effect Semantics](theory/effects.md)
structural-explainability
- [Research Doubts and Open Questions](https://github.com/structural-explainability/se-theory-transformation/blob/main/DOUBTS.md)
- [Research Decisions](https://github.com/structural-explainability/se-theory-transformation/blob/main/DECISIONS.md)

## Transformation

Transformation theory provides a formal vocabulary
for describing and relating changes to modeled structures.

It specifies transformation operators, their effect constraints,
and relationships among operations where those relationships
have been defined.

The vocabulary and effect models are formal abstractions.
Their use in a concrete application requires justification
that the modeled operations and effects adequately represent
the intended transformations.

Transformation theory does not independently determine
whether an operation preserves the identity of an
intended real-world referent.

## Scope

Repository scope is defined in `SE_MANIFEST.toml`.

## Exclusions

Repository exclusions are defined in `SE_MANIFEST.toml`.

## Import

Downstream Lean projects should import the public surface:

`import SE.Transformation`
