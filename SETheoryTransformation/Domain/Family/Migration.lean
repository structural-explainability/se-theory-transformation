import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Migration Family

SETheoryTransformation.Domain.Family.Migration

Migration transformations move structure across time, location, context,
or frame.

This module classifies migration-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- SH is the canonical migration-family operator. -/
def migrationOperators : List OperatorCode :=
  [
    OperatorCode.SH
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.SH = TransformationFamily.migration := rfl

end SETheoryTransformation
