import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Scaling Family

SETheoryTransformation.Domain.Family.Scaling

Scaling transformations change the structural complexity of a referent.
CL reduces complexity; EX increases it. Both operate on the same axis.

This module classifies scaling-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- CL and EX are the canonical scaling-family operators. -/
def scalingOperators : List OperatorCode :=
  [
    OperatorCode.CL,
    OperatorCode.EX
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.CL = TransformationFamily.scaling := rfl
example : operatorFamily OperatorCode.EX = TransformationFamily.scaling := rfl

end SETheoryTransformation
