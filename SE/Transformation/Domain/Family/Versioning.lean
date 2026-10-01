module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Versioning Family

SE.Transformation.Domain.Family.Versioning

Versioning transformations create controlled successor states with declared
lineage.

This module classifies versioning-family operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

module

public import SE.Transformation.Domain.Family.Aggregation
public import SE.Transformation.Domain.Family.Branching
public import SE.Transformation.Domain.Family.Decomposition
public import SE.Transformation.Domain.Family.Migration
public import SE.Transformation.Domain.Family.Projection
public import SE.Transformation.Domain.Family.Reorganization
public import SE.Transformation.Domain.Family.Versioning
public import SE.Transformation.Domain.TransformationKind

/-!
SE.Transformation.Domain.Family.lean

-/

namespace SE.Transformation

public section

end

end SE.Transformation


/-- VS and RV are canonical versioning-family operators. -/
def versioningOperators : List OperatorCode :=
  [
    OperatorCode.VS,
    OperatorCode.RV
  ]

/-- Family membership is verified by the derived operatorFamily function. -/
example : operatorFamily OperatorCode.VS = TransformationFamily.versioning := rfl
example : operatorFamily OperatorCode.RV = TransformationFamily.versioning := rfl

end SE.Transformation
