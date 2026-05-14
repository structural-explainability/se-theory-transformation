import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Normative Transformations

SETheoryTransformation.Domain.Kind.Normative

Normative transformations apply permissions or authorizations
to a referent and record the application as a fact.

This module identifies normative operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- Operators classified under this transformation kind. -/
def normativeOperators : List OperatorCode :=
  [
    OperatorCode.AZ
  ]

/-- Kind membership is verified by the derived operatorKind function. -/
example : operatorKind OperatorCode.AZ = TransformationKind.normative := rfl

end SETheoryTransformation
