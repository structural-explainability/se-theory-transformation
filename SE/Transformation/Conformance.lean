/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Registry

/-!
# Conformance

Finite regression invariants for the Transformation taxonomy.

These theorems verify properties that can drift when the vocabulary changes:
reference-list uniqueness and completeness, nonempty family/kind coverage,
and agreement between the derived registry queries and the authoritative
taxonomy functions.
-/

namespace SE.Transformation.Conformance

open SE.Transformation

public section

/-- The canonical operator registry contains no duplicate operator codes. -/
theorem referenceOperators_nodup :
    referenceOperators.Nodup := by
  decide

/-- The canonical family registry contains no duplicate families. -/
theorem referenceFamilies_nodup :
    referenceFamilies.Nodup := by
  decide

/-- The canonical kind registry contains no duplicate kinds. -/
theorem referenceKinds_nodup :
    referenceKinds.Nodup := by
  decide

/-- Every `OperatorCode` occurs in the canonical operator registry. -/
theorem referenceOperators_complete
    (op : OperatorCode) :
    op ∈ referenceOperators := by
  cases op <;> decide

/-- Every `TransformationFamily` occurs in the canonical family registry. -/
theorem referenceFamilies_complete
    (family : TransformationFamily) :
    family ∈ referenceFamilies := by
  cases family <;> decide

/-- Every `TransformationKind` occurs in the canonical kind registry. -/
theorem referenceKinds_complete
    (kind : TransformationKind) :
    kind ∈ referenceKinds := by
  cases kind <;> decide

/--
Membership in `operatorsInFamily` is exactly canonical-registry membership
together with the authoritative operator-to-family classification.
-/
@[simp]
theorem mem_operatorsInFamily_iff
    (op : OperatorCode)
    (family : TransformationFamily) :
    op ∈ operatorsInFamily family ↔
      op ∈ referenceOperators ∧
        operatorFamily op = family := by
  simp [operatorsInFamily]

/--
Membership in `operatorsInKind` is exactly canonical-registry membership
together with the derived operator-to-kind classification.
-/
@[simp]
theorem mem_operatorsInKind_iff
    (op : OperatorCode)
    (kind : TransformationKind) :
    op ∈ operatorsInKind kind ↔
      op ∈ referenceOperators ∧
        operatorKind op = kind := by
  simp [operatorsInKind]

/--
Membership in `familiesInKind` is exactly canonical-registry membership
together with the authoritative family-to-kind classification.
-/
@[simp]
theorem mem_familiesInKind_iff
    (family : TransformationFamily)
    (kind : TransformationKind) :
    family ∈ familiesInKind kind ↔
      family ∈ referenceFamilies ∧
        familyKind family = kind := by
  simp [familiesInKind]

/-- Every transformation family has at least one canonical operator. -/
theorem operatorsInFamily_nonempty
    (family : TransformationFamily) :
    ∃ op, op ∈ operatorsInFamily family := by
  cases family <;>
    simp [operatorsInFamily, referenceOperators, operatorFamily]

/-- Every transformation kind has at least one canonical family. -/
theorem familiesInKind_nonempty
    (kind : TransformationKind) :
    ∃ family, family ∈ familiesInKind kind := by
  cases kind <;>
    simp [familiesInKind, referenceFamilies, familyKind]

/-- Every transformation kind has at least one canonical operator. -/
theorem operatorsInKind_nonempty
    (kind : TransformationKind) :
    ∃ op, op ∈ operatorsInKind kind := by
  cases kind <;>
    simp [
      operatorsInKind,
      referenceOperators,
      operatorKind,
      operatorFamily,
      familyKind
    ]

end

end SE.Transformation.Conformance
