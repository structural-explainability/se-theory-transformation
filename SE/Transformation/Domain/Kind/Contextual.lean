module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Contextual Transformations

SE.Transformation.Domain.Kind.Contextual

Contextual transformations attach or remove bearer contexts,
conditions, or dependencies.

This module identifies contextual operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- Operators classified under this transformation kind. -/
def contextualOperators : List OperatorCode :=
  [
    OperatorCode.BD,
    OperatorCode.UB
  ]

/-- Kind membership is verified by the derived operatorKind function. -/
example : operatorKind OperatorCode.BD = TransformationKind.contextual := rfl
example : operatorKind OperatorCode.UB = TransformationKind.contextual := rfl

end

end SE.Transformation
