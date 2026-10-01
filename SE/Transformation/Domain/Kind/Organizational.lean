module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Organizational Transformations

SE.Transformation.Domain.Kind.Organizational

Organizational transformations change the structural arrangement
or placement of referents without altering their content.

This module identifies organizational operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- Operators classified under this transformation kind. -/
def organizationalOperators : List OperatorCode :=
  [
    OperatorCode.EM,
    OperatorCode.RO
  ]

/-- Kind membership is verified by the derived operatorKind function. -/
example : operatorKind OperatorCode.EM = TransformationKind.organizational := rfl
example : operatorKind OperatorCode.RO = TransformationKind.organizational := rfl

end

end SE.Transformation
