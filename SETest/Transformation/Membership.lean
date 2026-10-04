/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Domain.Operator.Semantics

/-!
# Membership Checks

Checks that the membership predicates are usable by proofs:
decidable, and connected to the family and kind layering.
-/

namespace SE.Transformation

example :
    OperatorInFamily OperatorCode.CL TransformationFamily.scaling := by
  decide

example :
    ¬ OperatorInFamily OperatorCode.CL TransformationFamily.projection := by
  decide

example :
    OperatorInKind OperatorCode.CL TransformationKind.structural := by
  decide

example :
    ∀ op, OperatorInFamily op TransformationFamily.scaling →
      OperatorInKind op TransformationKind.structural :=
  fun _ h => operatorInKind_of_operatorInFamily h rfl

end SE.Transformation
