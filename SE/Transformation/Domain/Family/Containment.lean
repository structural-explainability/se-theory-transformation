module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Containment Family

SE.Transformation.Domain.Family.Containment

Containment transformations place a referent inside a containing
structure, establishing a hierarchical membership relationship.

This module classifies containment-family operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- EM is the canonical containment-family operator. -/
def containmentOperators : List OperatorCode :=
  [
    OperatorCode.EM
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.EM = TransformationFamily.containment := rfl

end

end SE.Transformation
