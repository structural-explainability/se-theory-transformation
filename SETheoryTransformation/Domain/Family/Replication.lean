import SETheoryTransformation.Domain.Operator.Semantics

/-!
# Replication Family

SETheoryTransformation.Domain.Family.Replication

Replication transformations produce a full structural copy of a
referent. The identity status of the copy is regime-specific.

This module classifies replication-family operators only.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/-- CP is the canonical replication-family operator. -/
def replicationOperators : List OperatorCode :=
  [
    OperatorCode.CP
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.CP = TransformationFamily.replication := rfl

end SETheoryTransformation
