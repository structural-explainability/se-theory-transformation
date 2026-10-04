/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Effect.Model
public import SE.Transformation.Reference.Orthogonality

/-!
# Effect Disjointness and Overlap

Two operators have disjoint effects when their footprints share no dimension,
and overlapping effects when they share at least one.

These are effect-domain facts derived from footprints. Footprints are upper
bounds, so disjointness is the strong direction: a step of one operator
preserves every dimension the other may change. Overlap records only that the
operators may touch a common dimension.

They do not derive the canonical `OrthogonalityRelation` vocabulary, which also
contains `conflicting` and `dependent`. The canonical lookup remains the
declared reference. The theorems comparing the two are consistency checks on
the declared entries, not derivations of them.
-/

set_option autoImplicit false

namespace SE.Transformation
@[expose] public section

/-- Whether two operators share an effect dimension. -/
def overlapB (a b : OperatorCode) : Bool :=
  (footprint a).any fun d => decide (d ∈ footprint b)

-- RR.DEFINES: TR.DEF.EFFECTS_DISJOINT
/-- The footprints of two operators share no dimension. -/
def EffectsDisjoint (a b : OperatorCode) : Prop :=
  overlapB a b = false

-- RR.DEFINES: TR.DEF.EFFECTS_OVERLAP
/-- The footprints of two operators share at least one dimension. -/
def EffectsOverlap (a b : OperatorCode) : Prop :=
  overlapB a b = true

instance (a b : OperatorCode) : Decidable (EffectsDisjoint a b) :=
  inferInstanceAs (Decidable (overlapB a b = false))

instance (a b : OperatorCode) : Decidable (EffectsOverlap a b) :=
  inferInstanceAs (Decidable (overlapB a b = true))

-- RR.DEFINES: TR.THM.EFFECTS_DISJOINT_IFF
/-- Effect disjointness is exactly the absence of a shared dimension. -/
theorem effectsDisjoint_iff (a b : OperatorCode) :
    EffectsDisjoint a b ↔ ∀ d, d ∈ footprint a → d ∉ footprint b := by
  simp [EffectsDisjoint, overlapB, List.any_eq_false]

/-- Effect overlap is exactly the presence of a shared dimension. -/
theorem effectsOverlap_iff (a b : OperatorCode) :
    EffectsOverlap a b ↔ ∃ d, d ∈ footprint a ∧ d ∈ footprint b := by
  simp [EffectsOverlap, overlapB, List.any_eq_true]

-- RR.DEFINES: TR.THM.STEP_PRESERVES_OF_EFFECTS_DISJOINT
/--
If two operators have disjoint effects, a step of the second preserves every
dimension that the first may change.
-/
theorem StateModel.step_preserves_of_effectsDisjoint {M : StateModel}
    {a b : OperatorCode} (hab : EffectsDisjoint a b) {d : Dimension}
    (hd : d ∈ footprint a) {s t : M.State} (h : M.step b s t) :
    M.agree d s t :=
  M.frame h d ((effectsDisjoint_iff a b).1 hab d hd)

-- RR.DEFINES: TR.THM.DECLARED_ORTHOGONAL_EFFECTS_DISJOINT
/--
Consistency check: every declared orthogonal pair has disjoint effects.

The declared entries are not derived from footprints. This theorem records that
the footprints do not contradict the declared orthogonal pair.
-/
theorem declared_orthogonal_effects_disjoint (a b : OperatorCode)
    (h : orthogonality? a b = some OrthogonalityRelation.orthogonal) :
    EffectsDisjoint a b := by
  cases a <;> cases b <;> simp [orthogonality?] at h <;> decide

-- RR.DEFINES: TR.THM.DECLARED_OVERLAPPING_EFFECTS_OVERLAP
/--
Consistency check: every declared overlapping pair has overlapping effects.

Footprint overlap shows only that the operators may touch a common dimension.
-/
theorem declared_overlapping_effects_overlap (a b : OperatorCode)
    (h : orthogonality? a b = some OrthogonalityRelation.overlapping) :
    EffectsOverlap a b := by
  cases a <;> cases b <;> simp [orthogonality?] at h <;> decide

end
end SE.Transformation
