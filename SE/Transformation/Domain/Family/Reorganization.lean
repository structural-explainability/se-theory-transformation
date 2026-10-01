module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Reorganization Family

SE.Transformation.Domain.Family.Reorganization

Reorganization transformations rearrange declared structure without adding
or removing declared parts.

This module classifies reorganization-family operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- RO is the canonical reorganization-family operator. -/
def reorganizationOperators : List OperatorCode :=
  [
    OperatorCode.RO
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.RO = TransformationFamily.reorganization := rfl

end
end SE.Transformation
