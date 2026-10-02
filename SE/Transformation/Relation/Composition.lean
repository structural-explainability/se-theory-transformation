module

public import SE.Transformation.Domain.Operator.Codes

/-!
# Composition

SE.Transformation.Relation.Composition

Vocabulary for sequencing relationships among transformation operators.

This module defines the possible relation values only.
The canonical known pairs are supplied by the explicitly partial lookup in
`SE.Transformation.Reference.Composition`.

Composition describes sequencing and does not assert persistence.
-/

namespace SE.Transformation

public section

-- RR.DEFINES: TR.TYPE.COMPOSITION_RELATION
/--
Relationship describing whether one transformation operator may meaningfully
follow another.

Absence of a canonical rule is represented by `none` in the downstream lookup,
not by a relation constructor.
-/
inductive CompositionRelation where
  /-- The second operator dominates, erases, or absorbs the first. -/
  | absorbing

  /-- The operator sequence is generally meaningful. -/
  | composable

  /-- The operator sequence is meaningful only under additional constraints. -/
  | conditionallyComposable

  /-- The operators move in opposing directions but may not fully reverse. -/
  | inverseLike

  /-- The operator sequence is structurally invalid or incoherent. -/
  | nonComposable

  /-- The second operator adds no relevant structural change. -/
  | redundant
deriving DecidableEq, Repr

end

end SE.Transformation
