module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Association Family

SE.Transformation.Domain.Family.Association

Association transformations establish undirected relationships between
referents without altering the structure of either referent.

This module classifies association-family operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- LK is the canonical association-family operator. -/
def associationOperators : List OperatorCode :=
  [
    OperatorCode.LK
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.LK = TransformationFamily.association := rfl

end

end SE.Transformation
