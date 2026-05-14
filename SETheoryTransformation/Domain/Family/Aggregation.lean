import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Aggregation Family

SETheoryTransformation.Domain.Family.Aggregation

Aggregation transformations combine multiple structures into a derived structure.

This module classifies aggregation-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- Operators in this transformation family. -/
def aggregationOperators : List OperatorCode :=
  [
    OperatorCode.MG
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.MG = TransformationFamily.aggregation := rfl

end SETheoryTransformation
