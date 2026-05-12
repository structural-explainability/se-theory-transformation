import SETheoryTransformation.Operator.Codes

/-!
# Composition

SETheoryTransformation.Composition

Composition relations for transformation operators.

This module describes sequencing only. It does not assert persistence.
-/

namespace SETheoryTransformation

inductive CompositionRelation where
  | composable
  | conditionallyComposable
  | nonComposable
  | redundant
  | absorbing
  | inverseLike
  | unknown
deriving DecidableEq, Repr

structure CompositionRule where
  left : OperatorCode
  right : OperatorCode
  relation : CompositionRelation
deriving Repr

end SETheoryTransformation
