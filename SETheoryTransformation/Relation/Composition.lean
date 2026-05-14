import SETheoryTransformation.Domain.Operator.Codes

/-!
# Composition

SETheoryTransformation.Relation.Composition

Composition relations for transformation operators.

This module describes sequencing among operators.
It does not assert persistence.
-/

namespace SETheoryTransformation

/--
Relationship describing whether one transformation operator may meaningfully
follow another.

Composition is about sequencing only. It does not decide whether identity,
meaning, obligation, evidence, context, or persistence survives the sequence.
-/
inductive CompositionRelation where
  /-- The second operator dominates, erases, or absorbs the first. -/
  | absorbing

  /-- The operator sequence is generally meaningful. -/
  | composable

  /-- The operator sequence is meaningful only under additional constraints. -/
  | conditionallyComposable

  /-- The operators move in opposing directions but may not fully reverse. -/
  | inverseLike

  /-- The operator sequence is structurally invalid or incoherent. -/
  | nonComposable

  /-- The second operator adds no relevant structural change. -/
  | redundant

  /-- The composition relation is unresolved or intentionally unspecified. -/
  | unknown
deriving DecidableEq, Repr

/--
A composition rule over two transformation operators.

`left` is the earlier operator.
`right` is the later operator.
`relation` describes the sequencing relationship.
-/
structure CompositionRule where
  left     : OperatorCode
  right    : OperatorCode
  relation : CompositionRelation
deriving Repr

end SETheoryTransformation
