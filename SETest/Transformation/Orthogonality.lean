/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Reference.Orthogonality

/-!
# Orthogonality checks

SE.Transformation.Tests.Orthogonality
-/

namespace SE.Transformation

example : authorizeAndAttest.relation = OrthogonalityRelation.orthogonal := rfl

example : splitAndMerge.left = OperatorCode.SP := rfl

example : projectAndCollapse.right = OperatorCode.CL := rfl

end SE.Transformation
