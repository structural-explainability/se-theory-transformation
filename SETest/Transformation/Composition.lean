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
