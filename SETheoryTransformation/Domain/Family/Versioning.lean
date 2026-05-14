import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Versioning Family

SETheoryTransformation.Domain.Family.Versioning

Versioning transformations create controlled successor states with declared
lineage.

This module classifies versioning-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- VS and RV are canonical versioning-family operators. -/
def versioningOperators : List OperatorCode :=
  [
    OperatorCode.VS,
    OperatorCode.RV
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.VS = TransformationFamily.versioning := rfl
example : operatorFamily OperatorCode.RV = TransformationFamily.versioning := rfl

end SETheoryTransformation
