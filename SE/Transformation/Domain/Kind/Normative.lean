/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Normative Transformations

SE.Transformation.Domain.Kind.Normative

Normative transformations apply permissions or authorizations
to a referent and record the application as a fact.

This module identifies normative operators only.
It does not define persistence behavior.
-/

namespace SE.Transformation

public section

/-- Operators classified under this transformation kind. -/
def normativeOperators : List OperatorCode :=
  [
    OperatorCode.AZ
  ]

/-- Kind membership is verified by the derived operatorKind function. -/
example : operatorKind OperatorCode.AZ = TransformationKind.normative := rfl

end
end SE.Transformation
