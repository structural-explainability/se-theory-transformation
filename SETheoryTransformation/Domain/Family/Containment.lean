import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Containment Family

SETheoryTransformation.Domain.Family.Containment

Containment transformations place a referent inside a containing
structure, establishing a hierarchical membership relationship.

This module classifies containment-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- EM is the canonical containment-family operator. -/
def containmentOperators : List OperatorCode :=
  [
    OperatorCode.EM
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.EM = TransformationFamily.containment := rfl

end SETheoryTransformation
