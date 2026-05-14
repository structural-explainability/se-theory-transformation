import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Structural Transformations

SETheoryTransformation.Domain.Kind.Structural

Structural transformations combine, divide, or scale the
structural complexity of a referent.

This module identifies structural operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- Operators classified under this transformation kind. -/
def structuralOperators : List OperatorCode :=
  [
    OperatorCode.CL,
    OperatorCode.EX,
    OperatorCode.MG,
    OperatorCode.SP
  ]

/-- Kind membership is verified by the derived operatorKind function. -/
example : operatorKind OperatorCode.CL = TransformationKind.structural := rfl
example : operatorKind OperatorCode.EX = TransformationKind.structural := rfl
example : operatorKind OperatorCode.MG = TransformationKind.structural := rfl
example : operatorKind OperatorCode.SP = TransformationKind.structural := rfl

end SETheoryTransformation
