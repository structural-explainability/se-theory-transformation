module

set_option autoImplicit false

namespace SE.Transformation

public section

/--
Broad behavioral category of transformation. Each transformation family
belongs to exactly one transformation kind.
-/
inductive TransformationKind where
  | contextual
  | normative
  | observational
  | organizational
  | relational
  | structural
  | temporal
deriving DecidableEq, Repr

end

end SE.Transformation
