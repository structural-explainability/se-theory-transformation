/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Effect.Dimension
public import SE.Transformation.Reference.Orthogonality

/-!
# Orthogonality from Effects

Two operators have disjoint effects when their footprints
share no dimension, and overlapping effects otherwise.

These notions are derived from the footprint table.
The canonical orthogonality lookup remains the declared reference.
The theorems below check that the two agree on every declared pair.
-/

set_option autoImplicit false

namespace SE.Transformation
@[expose] public section

-- RR.DEFINES: TR.DEF.OVERLAP_B
/-- Whether two operators share an effect dimension. -/
def overlapB (a b : OperatorCode) : Bool :=
  (footprint a).any fun d => decide (d ∈ footprint b)

-- RR.DEFINES: TR.DEF.EFFECTS_DISJOINT
/-- The footprints of two operators share no dimension. -/
def EffectsDisjoint (a b : OperatorCode) : Prop := overlapB a b = false

-- RR.DEFINES: TR.DEF.EFFECTS_OVERLAP
/-- The footprints of two operators share a dimension. -/
def EffectsOverlap (a b : OperatorCode) : Prop := overlapB a b = true

instance (a b : OperatorCode) : Decidable (EffectsDisjoint a b) :=
  inferInstanceAs (Decidable (overlapB a b = false))

instance (a b : OperatorCode) : Decidable (EffectsOverlap a b) :=
  inferInstanceAs (Decidable (overlapB a b = true))

-- RR.DEFINES: TR.THM.DECLARED_ORTHOGONAL_DISJOINT
/-- Every declared orthogonal pair has disjoint effects. -/
theorem declared_orthogonal_disjoint (a b : OperatorCode)
    (h : orthogonality? a b = some OrthogonalityRelation.orthogonal) :
    EffectsDisjoint a b := by
  cases a <;> cases b <;>
    simp [orthogonality?, EffectsDisjoint, overlapB, footprint] at h ⊢

-- RR.DEFINES: TR.THM.DECLARED_OVERLAPPING_OVERLAP
/-- Every declared overlapping pair has overlapping effects. -/
theorem declared_overlapping_overlap (a b : OperatorCode)
    (h : orthogonality? a b = some OrthogonalityRelation.overlapping) :
    EffectsOverlap a b := by
  cases a <;> cases b <;>
    simp [orthogonality?, EffectsOverlap, overlapB, footprint] at h ⊢

end
end SE.Transformation
