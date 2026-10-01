module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Projection Family

SE.Transformation.Domain.Family.Projection

Projection transformations expose selected structure while omitting other
structure.

This module classifies projection-family operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- PR is the canonical projection-family operator. -/
def projectionOperators : List OperatorCode :=
  [
    OperatorCode.PR
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.PR = TransformationFamily.projection := rfl

end

end SE.Transformation
