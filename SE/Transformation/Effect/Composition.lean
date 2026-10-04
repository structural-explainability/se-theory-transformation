/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Effect.Model
public import SE.Transformation.Reference.Composition

/-!
# Composition Constraints from Effects

`RestoresOn M a b D` says that in model `M`, applying `b` after `a` returns
every dimension in `D` to its starting agreement.

The results here are necessary conditions only. An operator cannot restore a
dimension that it cannot touch. That a footprint relationship is compatible
with restoration does not show that any pair restores anything: actual
restoration needs further laws on the model.
-/

set_option autoImplicit false

namespace SE.Transformation
@[expose] public section

-- RR.DEFINES: TR.DEF.RESTORES_ON
/-- Applying `b` after `a` returns every dimension in `D` to its starting
agreement. -/
def RestoresOn (M : StateModel) (a b : OperatorCode) (D : List Dimension) :
    Prop :=
  ∀ s t, M.step a s t → ∃ u, M.step b t u ∧ ∀ d, d ∈ D → M.agree d s u

-- RR.DEFINES: TR.THM.RESTORATION_NEEDS_FOOTPRINT
/--
Necessary condition for restoration: if `b` after `a` restores a set of
dimensions containing every member of a required clause `C` of `a`, then some
member of `C` lies in the footprint of `b`.
-/
theorem restoration_needs_footprint {M : StateModel} {a b : OperatorCode}
    {D : List Dimension} {s t : M.State}
    (hr : RestoresOn M a b D) (hs : M.step a s t) {C : List Dimension}
    (hC : C ∈ requirements a) (hD : ∀ d, d ∈ C → d ∈ D) :
    ∃ d, d ∈ C ∧ d ∈ footprint b := by
  obtain ⟨d, hd, hne⟩ := M.change hs C hC
  refine ⟨d, hd, Classical.byContradiction fun hnot => ?_⟩
  obtain ⟨u, hu, hag⟩ := hr s t hs
  have h1 : M.agree d t u := M.frame hu d hnot
  have h2 : M.agree d s u := hag d (hD d hd)
  have e := M.agree_equiv d
  exact hne (e.trans h2 (e.symm h1))

-- RR.DEFINES: TR.THM.DECLARED_INVERSE_LIKE_FOOTPRINT_NECESSARY
/--
Necessary footprint condition for declared inverse-like pairs: every required
clause of the first operator contains a dimension in the footprint of the
second.

This does not show that the second operator restores anything.
-/
theorem declared_inverseLike_footprint_necessary (a b : OperatorCode)
    (h : composition? a b = some CompositionRelation.inverseLike) :
    ∀ C, C ∈ requirements a → ∃ d, d ∈ C ∧ d ∈ footprint b := by
  cases a <;> cases b <;> simp [composition?] at h <;> decide

end
end SE.Transformation
