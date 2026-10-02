/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Relation.Orthogonality

/-!
# Orthogonality Reference

Canonical known orthogonality rules for transformation operators.

The lookup is intentionally partial. `none` means that this theory does not
currently specify a canonical orthogonality relation for the pair.

The lookup itself enforces symmetry, so reversing the two operators cannot
produce a different orthogonality relation.

Composition and orthogonality remain independent axes: a pair may have both a
composition relation and an orthogonality relation without contradiction.
-/

namespace SE.Transformation

@[expose] public section

-- RR.DEFINES: TR.DEF.ORTHOGONALITY_LOOKUP
/--
Return the canonical orthogonality relation for an operator pair when one is
specified by this theory.
-/
def orthogonality? : OperatorCode → OperatorCode → Option OrthogonalityRelation
  | OperatorCode.AZ, OperatorCode.AT => some OrthogonalityRelation.orthogonal
  | OperatorCode.AT, OperatorCode.AZ => some OrthogonalityRelation.orthogonal
  | OperatorCode.PR, OperatorCode.CL => some OrthogonalityRelation.overlapping
  | OperatorCode.CL, OperatorCode.PR => some OrthogonalityRelation.overlapping
  | _, _ => none

-- RR.DEFINES: TR.RULE.AUTHORIZE_AND_ATTEST
/-- Authorization and attestation have canonically orthogonal effect domains. -/
@[simp]
theorem authorizeAndAttest :
    orthogonality? OperatorCode.AZ OperatorCode.AT =
      some OrthogonalityRelation.orthogonal :=
  rfl

-- RR.DEFINES: TR.RULE.PROJECT_AND_COLLAPSE
/-- Projection and collapse have canonically overlapping effect domains. -/
@[simp]
theorem projectAndCollapse :
    orthogonality? OperatorCode.PR OperatorCode.CL =
      some OrthogonalityRelation.overlapping :=
  rfl

/-- The canonical orthogonality lookup is symmetric. -/
theorem orthogonality_symm
    (left right : OperatorCode) :
    orthogonality? left right = orthogonality? right left := by
  cases left <;> cases right <;> rfl

/--
An orthogonality relation is specified exactly for the two canonical unordered
pairs currently declared by this theory.
-/
theorem orthogonality_defined_iff
    (left right : OperatorCode) :
    (∃ relation, orthogonality? left right = some relation) ↔
      (left = OperatorCode.AZ ∧ right = OperatorCode.AT) ∨
      (left = OperatorCode.AT ∧ right = OperatorCode.AZ) ∨
      (left = OperatorCode.PR ∧ right = OperatorCode.CL) ∨
      (left = OperatorCode.CL ∧ right = OperatorCode.PR) := by
  cases left <;> cases right <;> simp [orthogonality?]

end

end SE.Transformation
