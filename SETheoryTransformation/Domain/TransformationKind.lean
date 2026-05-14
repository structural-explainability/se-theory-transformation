/-!
# Transformation Kind

SETheoryTransformation.Domain.TransformationKind

Core classification vocabulary for kinds of transformation.

A transformation kind describes a broad behavioral category of change.
Each kind groups one or more transformation families.

This module defines classification vocabulary only.
It does not define persistence semantics, regime behavior,
or admissibility criteria.
-/

namespace SETheoryTransformation

/--
Broad behavioral category of transformation.

Each TransformationKind groups one or more TransformationFamily values.
Operators belong to a kind transitively through their family.
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

end SETheoryTransformation
