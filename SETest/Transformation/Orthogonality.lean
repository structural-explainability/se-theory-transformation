/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Reference.Orthogonality

/-!
# Orthogonality Checks

Checks for the explicitly partial, symmetric canonical orthogonality lookup.
-/

namespace SE.Transformation

example :
    orthogonality? OperatorCode.AZ OperatorCode.AT =
      some OrthogonalityRelation.orthogonal :=
  rfl

example :
    orthogonality? OperatorCode.AT OperatorCode.AZ =
      some OrthogonalityRelation.orthogonal :=
  rfl

example :
    orthogonality? OperatorCode.PR OperatorCode.CL =
      some OrthogonalityRelation.overlapping :=
  rfl

example :
    orthogonality? OperatorCode.CL OperatorCode.PR =
      some OrthogonalityRelation.overlapping :=
  rfl

example :
    orthogonality? OperatorCode.SP OperatorCode.MG =
      some OrthogonalityRelation.overlapping :=
  rfl

end SE.Transformation
