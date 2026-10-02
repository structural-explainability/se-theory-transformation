/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Reference.Composition

/-!
# Composition Checks

Checks for the explicitly partial canonical composition lookup.
-/

namespace SE.Transformation

example :
    composition? OperatorCode.SP OperatorCode.MG =
      some CompositionRelation.inverseLike :=
  rfl

example :
    composition? OperatorCode.BD OperatorCode.UB =
      some CompositionRelation.inverseLike :=
  rfl

example :
    composition? OperatorCode.AZ OperatorCode.AT =
      some CompositionRelation.composable :=
  rfl

example :
    composition? OperatorCode.AT OperatorCode.AZ = none :=
  rfl

end SE.Transformation
