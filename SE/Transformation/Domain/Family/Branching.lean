module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Branching Family

SE.Transformation.Domain.Family.Branching

Branching transformations create divergent continuities from a source.

This module classifies branching-family operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- BR is the canonical branching-family operator. -/
def branchingOperators : List OperatorCode :=
  [
    OperatorCode.BR
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.BR = TransformationFamily.branching := rfl

end

end SE.Transformation
