/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Core.Domain.Operator.Codes
public import SE.Transformation.Core.Domain.Operator.Semantics
public import SE.Transformation.Core.Domain.Kind.Observational
public import SE.Transformation.Core.Domain.Kind.Organizational

/-!
# Conformance

Internal conformance results showing that the transformation taxonomy
satisfies its structural invariants.
-/

namespace SE.Transformation.Conformance

public section

/-- Every operator has a unique family. -/
theorem operator_family_unique_proof :
    ∀ op : OperatorCode,
      ∃ f : TransformationFamily,
        operatorFamily op = f ∧
        ∀ f', operatorFamily op = f' → f = f' := by
  intro op
  refine ⟨operatorFamily op, rfl, ?_⟩
  intro f' h
  exact h

/-- Every family has a unique kind. -/
theorem family_kind_unique_proof :
    ∀ f : TransformationFamily,
      ∃ k : TransformationKind,
        familyKind f = k ∧
        ∀ k', familyKind f = k' → k = k' :=
  fun f =>
    ⟨familyKind f, rfl, fun _ h => h⟩

/-- `operatorKind` is definitionally derived from family membership. -/
theorem kind_derived_proof :
    ∀ op : OperatorCode,
      operatorKind op = familyKind (operatorFamily op) :=
  fun _ => rfl

/-- Operators in the same family have the same transformation kind. -/
theorem same_family_same_kind_proof :
    ∀ op1 op2 : OperatorCode,
      operatorFamily op1 = operatorFamily op2 →
      operatorKind op1 = operatorKind op2 :=
  fun _ _ h => congrArg familyKind h

/--
Every transformation kind is inhabited by at least one operator.
-/
theorem all_kinds_inhabited_proof :
    ∀ k : TransformationKind,
      ∃ op : OperatorCode, operatorKind op = k := by
  intro k
  cases k with
  | contextual =>
      exact ⟨OperatorCode.BD, rfl⟩
  | normative =>
      exact ⟨OperatorCode.AZ, rfl⟩
  | observational =>
      exact ⟨OperatorCode.PR, rfl⟩
  | organizational =>
      exact ⟨OperatorCode.EM, rfl⟩
  | relational =>
      exact ⟨OperatorCode.LK, rfl⟩
  | structural =>
      exact ⟨OperatorCode.SP, rfl⟩
  | temporal =>
      exact ⟨OperatorCode.VS, rfl⟩

/--
Every transformation kind is represented by at least one family.
-/
theorem all_kinds_have_family_proof :
    ∀ k : TransformationKind,
      ∃ f : TransformationFamily, familyKind f = k := by
  intro k
  cases k with
  | contextual =>
      exact ⟨TransformationFamily.contextual, rfl⟩
  | normative =>
      exact ⟨TransformationFamily.normative, rfl⟩
  | observational =>
      exact ⟨TransformationFamily.attestation, rfl⟩
  | organizational =>
      exact ⟨TransformationFamily.containment, rfl⟩
  | relational =>
      exact ⟨TransformationFamily.association, rfl⟩
  | structural =>
      exact ⟨TransformationFamily.aggregation, rfl⟩
  | temporal =>
      exact ⟨TransformationFamily.branching, rfl⟩

end

end SE.Transformation.Conformance
