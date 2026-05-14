import SETheoryTransformation.Reference.Orthogonality

/-!
# Orthogonality checks

SETheoryTransformation.Tests.Orthogonality
-/

namespace SETheoryTransformation

example : authorizeAndAttest.relation = OrthogonalityRelation.orthogonal := rfl

example : splitAndMerge.left = OperatorCode.SP := rfl

example : projectAndCollapse.right = OperatorCode.CL := rfl

end SETheoryTransformation
