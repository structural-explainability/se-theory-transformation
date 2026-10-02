/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

set_option autoImplicit false

namespace SE.Transformation

public section

-- RR.DEFINES: TR.TYPE.TRANSFORMATION_KIND
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
