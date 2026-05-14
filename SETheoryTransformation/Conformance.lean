import SETheoryTransformation.Core
import SETheoryTransformation.Spec

/-!
# Conformance

SETheoryTransformation.Conformance

Internal conformance: evidence that the transformation taxonomy
satisfies its own design invariants.

Invariants covered:
- operatorFamily is a total function (every operator has exactly one family)
- familyKind is a total function (every family has exactly one kind)
- operatorKind is derived, not independently asserted
- operators sharing a family always share a kind
- every kind is inhabited by at least one operator
- every kind is the image of at least one family
-/

namespace SETheoryTransformation.Conformance

open SETheoryTransformation
open SETheoryTransformation.Spec

-- ============================================================
-- EVIDENCE STRUCTURE
-- ============================================================

/--
Conformance evidence: maps each Req_TR_* identifier to its
formal predicate. All fields hold by the Req definitions;
the structure makes traceability explicit.
-/
structure ConformanceEvidence where
  operator_family_unique :
    ∀ op : OperatorCode,
    Req_TR_TAXONOMY_OPERATOR_FAMILY_UNIQUE op ↔
    (∃ f : TransformationFamily, operatorFamily op = f ∧ ∀ f', operatorFamily op = f' → f = f')
  family_kind_unique :
    ∀ f : TransformationFamily,
    Req_TR_TAXONOMY_FAMILY_KIND_UNIQUE f ↔
    (∃ k : TransformationKind, familyKind f = k)
  kind_derived :
    ∀ op : OperatorCode,
    Req_TR_TAXONOMY_KIND_DERIVED op ↔
    (operatorKind op = familyKind (operatorFamily op))
  same_family_same_kind :
    ∀ op1 op2 : OperatorCode,
    Req_TR_TAXONOMY_SAME_FAMILY_SAME_KIND op1 op2 ↔
    (operatorFamily op1 = operatorFamily op2 → operatorKind op1 = operatorKind op2)
  all_kinds_inhabited :
    ∀ k : TransformationKind,
    Req_TR_TAXONOMY_ALL_KINDS_INHABITED k ↔
    (∃ op : OperatorCode, operatorKind op = k)
  all_kinds_have_family :
    ∀ k : TransformationKind,
    Req_TR_TAXONOMY_ALL_KINDS_HAVE_FAMILY k ↔
    (∃ f : TransformationFamily, familyKind f = k)

/-- Concrete evidence. All fields hold by the Req definitions. -/
def taxonomyConformance : ConformanceEvidence where
  operator_family_unique  := fun _     => Iff.rfl
  family_kind_unique      := fun _     => Iff.rfl
  kind_derived            := fun _     => Iff.rfl
  same_family_same_kind   := fun _ _   => Iff.rfl
  all_kinds_inhabited     := fun _     => Iff.rfl
  all_kinds_have_family   := fun _     => Iff.rfl

-- ============================================================
-- SUBSTANTIVE PROOFS
-- ============================================================
-- The invariants hold not merely by definition but by the
-- exhaustive structure of the taxonomy itself.

/-- Every operator has a unique family: total functions satisfy ∃!. -/
theorem operator_family_unique_proof :
    ∀ op : OperatorCode, ∃ f : TransformationFamily, operatorFamily op = f ∧ ∀ f', operatorFamily op = f' → f = f' :=
  fun op => ⟨operatorFamily op, rfl, fun _ h => h.symm⟩

/-- Every family has a unique kind: total functions satisfy ∃!. -/
theorem family_kind_unique_proof :
    ∀ f : TransformationFamily, (∃ k : TransformationKind, familyKind f = k ∧ ∀ k', familyKind f = k' → k = k') :=
  fun f => ⟨familyKind f, rfl, fun _ h => h.symm⟩

/-- operatorKind holds definitionally as the composition. -/
theorem kind_derived_proof :
    ∀ op : OperatorCode, operatorKind op = familyKind (operatorFamily op) :=
  fun _ => rfl

/-- Same family implies same kind: follows from familyKind being a function. -/
theorem same_family_same_kind_proof :
    ∀ op1 op2 : OperatorCode,
    operatorFamily op1 = operatorFamily op2 →
    operatorKind op1 = operatorKind op2 :=
  fun _ _ h => congrArg familyKind h

/--
Every kind has at least one operator.
Witnesses are chosen as the structurally simplest operator per kind.
-/
theorem all_kinds_inhabited_proof :
    ∀ k : TransformationKind, ∃ op : OperatorCode, operatorKind op = k := by
  intro k
  cases k with
  | contextual    => exact ⟨OperatorCode.BD, rfl⟩
  | normative     => exact ⟨OperatorCode.AZ, rfl⟩
  | observational => exact ⟨OperatorCode.PR, rfl⟩
  | organizational => exact ⟨OperatorCode.EM, rfl⟩
  | relational    => exact ⟨OperatorCode.LK, rfl⟩
  | structural    => exact ⟨OperatorCode.SP, rfl⟩
  | temporal      => exact ⟨OperatorCode.VS, rfl⟩

/--
Every kind has at least one family.
Witnesses are chosen as the first family alphabetically per kind.
-/
theorem all_kinds_have_family_proof :
    ∀ k : TransformationKind, ∃ f : TransformationFamily, familyKind f = k := by
  intro k
  cases k with
  | contextual    => exact ⟨TransformationFamily.contextual,    rfl⟩
  | normative     => exact ⟨TransformationFamily.normative,     rfl⟩
  | observational => exact ⟨TransformationFamily.attestation,   rfl⟩
  | organizational => exact ⟨TransformationFamily.containment,  rfl⟩
  | relational    => exact ⟨TransformationFamily.association,   rfl⟩
  | structural    => exact ⟨TransformationFamily.aggregation,   rfl⟩
  | temporal      => exact ⟨TransformationFamily.branching,     rfl⟩

end SETheoryTransformation.Conformance
