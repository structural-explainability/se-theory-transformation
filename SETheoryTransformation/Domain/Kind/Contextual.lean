import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Contextual Transformations

SETheoryTransformation.Domain.Kind.Contextual

Contextual transformations attach or remove bearer contexts,
conditions, or dependencies.

This module identifies contextual operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- Operators classified under this transformation kind. -/
def contextualOperators : List OperatorCode :=
  [
    OperatorCode.BD,
    OperatorCode.UB
  ]

/-- Kind membership is verified by the derived operatorKind function. -/
example : operatorKind OperatorCode.BD = TransformationKind.contextual := rfl
example : operatorKind OperatorCode.UB = TransformationKind.contextual := rfl

end SETheoryTransformation
