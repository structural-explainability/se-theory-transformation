import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Reorganization Family

SETheoryTransformation.Domain.Family.Reorganization

Reorganization transformations rearrange declared structure without adding
or removing declared parts.

This module classifies reorganization-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- RO is the canonical reorganization-family operator. -/
def reorganizationOperators : List OperatorCode :=
  [
    OperatorCode.RO
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.RO = TransformationFamily.reorganization := rfl

end SETheoryTransformation
