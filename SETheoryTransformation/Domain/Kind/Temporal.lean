import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Temporal Transformations

SETheoryTransformation.Domain.Kind.Temporal

Temporal transformations produce versioned successors, divergent
continuations, or reversions to prior states.

This module identifies temporal operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- Operators classified under this transformation kind. -/
def temporalOperators : List OperatorCode :=
  [
    OperatorCode.BR,
    OperatorCode.RV,
    OperatorCode.VS
  ]

/-- Kind membership is verified by the derived operatorKind function. -/
example : operatorKind OperatorCode.BR = TransformationKind.temporal := rfl
example : operatorKind OperatorCode.RV = TransformationKind.temporal := rfl
example : operatorKind OperatorCode.VS = TransformationKind.temporal := rfl

end SETheoryTransformation
