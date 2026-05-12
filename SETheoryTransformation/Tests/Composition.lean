import SETheoryTransformation.Examples.Composition

/-!
# Composition checks

SETheoryTransformation.Tests.Composition
-/

namespace SETheoryTransformation

example : splitThenMerge.relation = CompositionRelation.inverseLike := rfl

example : bindThenUnbind.left = OperatorCode.BD := rfl

example : authorizeThenAttest.right = OperatorCode.AT := rfl

end SETheoryTransformation
