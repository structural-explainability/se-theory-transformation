module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Decomposition Family

SE.Transformation.Domain.Family.Decomposition

Decomposition transformations separate one structure into multiple derived
structures.

This module classifies decomposition-family operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- SP is the canonical decomposition-family operator. -/
def decompositionOperators : List OperatorCode :=
  [
    OperatorCode.SP
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.SP = TransformationFamily.decomposition := rfl

end

end SE.Transformation
