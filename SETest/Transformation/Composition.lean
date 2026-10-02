/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Reference.Composition

/-!
# Composition checks

SE.Transformation.Tests.Composition
-/

namespace SE.Transformation

example : splitThenMerge.relation = CompositionRelation.inverseLike := rfl

example : bindThenUnbind.left = OperatorCode.BD := rfl

example : authorizeThenAttest.right = OperatorCode.AT := rfl

end SE.Transformation
