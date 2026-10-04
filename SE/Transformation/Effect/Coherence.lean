/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Effect.Composition
public import SE.Transformation.Effect.Orthogonality

/-!
# Coherence of Composition and Effects

A declared inverse-like composition relation needs the second operator to be
able to change what the first must change.
Footprints are upper bounds that contain every required dimension,
so such a pair cannot have disjoint effects.

This is a consistency result about the declared composition entries.
It does not derive the composition vocabulary and
does not show that any pair restores anything.
-/

set_option autoImplicit false

namespace SE.Transformation
@[expose] public section

-- RR.DEFINES: TR.THM.DECLARED_INVERSE_LIKE_EFFECTS_OVERLAP
/--
Every declared inverse-like pair has overlapping effects, so no declared
inverse-like pair is effect-disjoint.
-/
theorem declared_inverseLike_effectsOverlap (a b : OperatorCode)
    (h : composition? a b = some CompositionRelation.inverseLike) :
    EffectsOverlap a b := by
  obtain ⟨C, hC⟩ := List.exists_mem_of_ne_nil _ (requirements_ne_nil a)
  obtain ⟨d, hd, hdb⟩ := declared_inverseLike_footprint_necessary a b h C hC
  exact (effectsOverlap_iff a b).2 ⟨d, requirements_subset_footprint hC hd, hdb⟩

end
end SE.Transformation
