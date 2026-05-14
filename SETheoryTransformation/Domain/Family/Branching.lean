import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Branching Family

SETheoryTransformation.Domain.Family.Branching

Branching transformations create divergent continuities from a source.

This module classifies branching-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- BR is the canonical branching-family operator. -/
def branchingOperators : List OperatorCode :=
  [
    OperatorCode.BR
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.BR = TransformationFamily.branching := rfl

end SETheoryTransformation
