import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Normative Family

SETheoryTransformation.Domain.Family.Normative

Normative transformations apply conditions to referents and record
the application as a fact. The record is neutral with respect to
normative interpretation.

This module classifies normative-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- AZ is the canonical normative-family operator. -/
def normativeOperators : List OperatorCode :=
  [
    OperatorCode.AZ
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.AZ = TransformationFamily.normative := rfl

end SETheoryTransformation
