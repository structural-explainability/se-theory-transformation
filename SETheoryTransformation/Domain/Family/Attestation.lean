import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Attestation Family

SETheoryTransformation.Domain.Family.Attestation

Attestation transformations record verified claims about referents
without altering the referent's identity conditions.

This module classifies attestation-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- AT is the canonical attestation-family operator. -/
def attestationOperators : List OperatorCode :=
  [
    OperatorCode.AT
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.AT = TransformationFamily.attestation := rfl

end SETheoryTransformation
