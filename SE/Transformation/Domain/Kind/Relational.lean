module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Relational Transformations

SE.Transformation.Domain.Kind.Relational

Relational transformations establish relationships between referents
or relocate a referent while preserving referential linkage.

This module identifies relational operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- Operators classified under this transformation kind. -/
def relationalOperators : List OperatorCode :=
  [
    OperatorCode.LK,
    OperatorCode.SH
  ]

/-- Kind membership is verified by the derived operatorKind function. -/
example : operatorKind OperatorCode.LK = TransformationKind.relational := rfl
example : operatorKind OperatorCode.SH = TransformationKind.relational := rfl

end

end SE.Transformation
