/-!
# SETheoryTransformation.TransformationClass

Core classification vocabulary for kinds of transformation.

A transformation class describes a broad structural category of change.
Classes group operators that share similar structural behavior.

This module defines classification vocabulary only.
It does not define persistence semantics, regime behavior,
or admissibility criteria.
-/

namespace SETheoryTransformation

/--
Broad structural category of transformation behavior.

Transformation classes organize operators into semantically related
families of change.
-/
inductive TransformationClass where
  /--
  Rearrangement, projection, embedding, duplication,
  or linkage of existing structure.
  -/
  | structural

  /--
  Separation of one structure into multiple derived structures.
  -/
  | decomposition

  /--
  Combination of multiple structures into a derived structure.
  -/
  | aggregation

  /--
  Reduction or compression of structure.
  -/
  | compression

  /--
  Expansion, unfolding, or elaboration of structure.
  -/
  | elaboration

  /--
  Relocation across time, place, context, or frame.
  -/
  | relocation

  /--
  Sequential or divergent successor behavior.
  -/
  | evolution

  /--
  Attachment or removal of contextual dependency.
  -/
  | contextual

  /--
  Permission, admissibility, or governance behavior.
  -/
  | normative

  /--
  Evidentiary or observational assertion behavior.
  -/
  | observational
deriving DecidableEq, Repr

end SETheoryTransformation
