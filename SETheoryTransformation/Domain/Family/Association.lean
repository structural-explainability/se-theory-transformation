import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Association Family

SETheoryTransformation.Domain.Family.Association

Association transformations establish undirected relationships between
referents without altering the structure of either referent.

This module classifies association-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- LK is the canonical association-family operator. -/
def associationOperators : List OperatorCode :=
  [
    OperatorCode.LK
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.LK = TransformationFamily.association := rfl

end SETheoryTransformation
