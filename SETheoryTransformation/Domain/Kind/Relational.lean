import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Relational Transformations

SETheoryTransformation.Domain.Kind.Relational

Relational transformations establish relationships between referents
or relocate a referent while preserving referential linkage.

This module identifies relational operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- Operators classified under this transformation kind. -/
def relationalOperators : List OperatorCode :=
  [
    OperatorCode.LK,
    OperatorCode.SH
  ]

/-- Kind membership is verified by the derived operatorKind function. -/
example : operatorKind OperatorCode.LK = TransformationKind.relational := rfl
example : operatorKind OperatorCode.SH = TransformationKind.relational := rfl

end SETheoryTransformation
