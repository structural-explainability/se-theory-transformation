/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Domain.Operator.Codes

/-!
# Orthogonality

SE.Transformation.Relation.Orthogonality

Vocabulary for structural-independence relationships among transformation
operators.

This module defines the possible relation values only.
The canonical known pairs are supplied by the explicitly partial, symmetric
lookup in `SE.Transformation.Reference.Orthogonality`.

Orthogonality describes independence.
-/

namespace SE.Transformation

public section

-- RR.DEFINES: TR.TYPE.ORTHOGONALITY_RELATION
/--
Relationship describing the degree of structural independence between two
transformation operators.

`inverseLike` is intentionally not an orthogonality value: inverse direction is
a sequencing or transformation relationship, not a degree of independence.

Absence of a canonical rule is represented by `none` in the lookup,
not by a relation constructor.
-/
inductive OrthogonalityRelation where
  /-- The operators cannot be applied in the same context without contradiction. -/
  | conflicting

  /-- One operator's applicability depends on the other. -/
  | dependent

  /-- The operators have no shared effect domain and do not interfere. -/
  | orthogonal

  /-- The operators share at least one effect dimension, including when one
    operator's effect domain contains the other's. -/
  | overlapping
deriving DecidableEq, Repr

end

end SE.Transformation
