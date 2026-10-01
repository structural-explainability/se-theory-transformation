module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Observational Transformations

SE.Transformation.Domain.Kind.Observational

Observational transformations produce views, copies, or verified
records of a referent without altering the referent itself.

This module identifies observational operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- Operators classified under this transformation kind. -/
def observationalOperators : List OperatorCode :=
  [
    OperatorCode.AT,
    OperatorCode.CP,
    OperatorCode.PR
  ]

/-- Kind membership is verified by the derived operatorKind function. -/
example : operatorKind OperatorCode.AT = TransformationKind.observational := rfl
example : operatorKind OperatorCode.CP = TransformationKind.observational := rfl
example : operatorKind OperatorCode.PR = TransformationKind.observational := rfl

end

end SE.Transformation
