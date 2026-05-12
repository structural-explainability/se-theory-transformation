import SETheoryTransformation.Operator.Codes

/-!
# Orthogonality

SETheoryTransformation.Orthogonality

Orthogonality relations for transformation operators.

This module describes semantic independence among operators.
-/

namespace SETheoryTransformation

inductive OrthogonalityRelation where
  | orthogonal
  | overlapping
  | dependent
  | inverseLike
  | conflicting
  | unknown
deriving DecidableEq, Repr

structure OrthogonalityRule where
  left : OperatorCode
  right : OperatorCode
  relation : OrthogonalityRelation
deriving Repr

end SETheoryTransformation
