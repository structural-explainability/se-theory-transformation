/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Registry

/-!
# Invariants

SE.Transformation.Invariants

Finite regression guards for the transformation taxonomy.

`operatorFamily` and `familyKind` are total functions, so "every operator has
exactly one family" holds by construction and is not restated here. The
statements below can fail when the taxonomy is edited:

- the reference lists are duplicate-free and complete;
- no family and no kind is empty;
- the derived queries `operatorsInFamily`, `operatorsInKind` and
  `familiesInKind` agree with their membership specifications.
-/

namespace SE.Transformation

public section

/-- `referenceOperators` has no duplicates. -/
theorem referenceOperators_nodup : referenceOperators.Nodup := by
  decide

/-- `referenceFamilies` has no duplicates. -/
theorem referenceFamilies_nodup : referenceFamilies.Nodup := by
  decide

/-- `referenceKinds` has no duplicates. -/
theorem referenceKinds_nodup : referenceKinds.Nodup := by
  decide

/-- Every operator code occurs in `referenceOperators`. -/
theorem referenceOperators_complete
    (op : OperatorCode) :
    op ∈ referenceOperators := by
  cases op <;> decide

/-- Every transformation family occurs in `referenceFamilies`. -/
theorem referenceFamilies_complete
    (f : TransformationFamily) :
    f ∈ referenceFamilies := by
  cases f <;> decide

/-- Every transformation kind occurs in `referenceKinds`. -/
theorem referenceKinds_complete
    (k : TransformationKind) :
    k ∈ referenceKinds := by
  cases k <;> decide

/-- Membership in `operatorsInFamily` is exactly family membership. -/
theorem mem_operatorsInFamily_iff
    {op : OperatorCode}
    {f : TransformationFamily} :
    op ∈ operatorsInFamily f ↔ operatorFamily op = f := by
  simp [operatorsInFamily, referenceOperators_complete]

/-- Membership in `operatorsInKind` is exactly kind membership. -/
theorem mem_operatorsInKind_iff
    {op : OperatorCode}
    {k : TransformationKind} :
    op ∈ operatorsInKind k ↔ operatorKind op = k := by
  simp [operatorsInKind, referenceOperators_complete]

/-- Membership in `familiesInKind` is exactly the `familyKind` assignment. -/
theorem mem_familiesInKind_iff
    {f : TransformationFamily}
    {k : TransformationKind} :
    f ∈ familiesInKind k ↔ familyKind f = k := by
  simp [familiesInKind, referenceFamilies_complete]

/-- Every family has at least one operator. -/
theorem operatorsInFamily_ne_nil
    (f : TransformationFamily) :
    operatorsInFamily f ≠ [] := by
  cases f <;> decide

/-- Every kind has at least one family. -/
theorem familiesInKind_ne_nil
    (k : TransformationKind) :
    familiesInKind k ≠ [] := by
  cases k <;> decide

/-- Every kind has at least one operator. -/
theorem operatorsInKind_ne_nil
    (k : TransformationKind) :
    operatorsInKind k ≠ [] := by
  cases k <;> decide

end

end SE.Transformation
