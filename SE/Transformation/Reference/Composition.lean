/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Relation.Composition

/-!
# Composition Reference

Canonical known composition rules for transformation operators.

The lookup is intentionally partial. `none` means that this theory does not
currently specify a canonical composition relation for the ordered pair.
It does not mean that the pair is invalid or semantically unknown.

Composition is directional: `(left, right)` and `(right, left)` are distinct
queries.
-/

namespace SE.Transformation

@[expose] public section

-- RR.DEFINES: TR.DEF.COMPOSITION_LOOKUP
/--
Return the canonical composition relation for an ordered operator pair when
one is specified by this theory.
-/
def composition? : OperatorCode → OperatorCode → Option CompositionRelation
  | OperatorCode.AZ, OperatorCode.AT => some CompositionRelation.composable
  | OperatorCode.BD, OperatorCode.UB => some CompositionRelation.inverseLike
  | OperatorCode.SP, OperatorCode.MG => some CompositionRelation.inverseLike
  | _, _ => none

-- RR.DEFINES: TR.RULE.AUTHORIZE_THEN_ATTEST
/-- Authorization followed by attestation is a canonical composable pair. -/
@[simp]
theorem authorizeThenAttest :
    composition? OperatorCode.AZ OperatorCode.AT =
      some CompositionRelation.composable :=
  rfl

-- RR.DEFINES: TR.RULE.BIND_THEN_UNBIND
/-- Binding followed by unbinding is a canonical inverse-like sequence. -/
@[simp]
theorem bindThenUnbind :
    composition? OperatorCode.BD OperatorCode.UB =
      some CompositionRelation.inverseLike :=
  rfl

-- RR.DEFINES: TR.RULE.SPLIT_THEN_MERGE
/-- Splitting followed by merging is a canonical inverse-like sequence. -/
@[simp]
theorem splitThenMerge :
    composition? OperatorCode.SP OperatorCode.MG =
      some CompositionRelation.inverseLike :=
  rfl

/--
A composition relation is specified exactly for the three canonical ordered
pairs currently declared by this theory.
-/
theorem composition_defined_iff
    (left right : OperatorCode) :
    (∃ relation, composition? left right = some relation) ↔
      (left = OperatorCode.AZ ∧ right = OperatorCode.AT) ∨
      (left = OperatorCode.BD ∧ right = OperatorCode.UB) ∨
      (left = OperatorCode.SP ∧ right = OperatorCode.MG) := by
  cases left <;> cases right <;> simp [composition?]

end

end SE.Transformation
