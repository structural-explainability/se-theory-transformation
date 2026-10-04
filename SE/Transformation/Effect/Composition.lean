/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Effect.Model
public import SE.Transformation.Reference.Composition

/-!
# Composition from Effects

`RestoresOn M a b D` says that in model `M`, applying `b` after `a` returns
every dimension in `D` to its starting value.

An operator can restore a dimension only if its footprint contains that
dimension.
This is a necessary condition.
It does not say that any operator pair does restore anything;
that needs further laws on the model.

The theorems below check that every declared inverse-like pair
meets the necessary condition.
-/

set_option autoImplicit false

namespace SE.Transformation
@[expose] public section

-- RR.DEFINES: TR.DEF.RESTORES_ON
/-- Applying `b` after `a` restores every dimension in `D`. -/
def RestoresOn (M : StateModel) (a b : OperatorCode) (D : List Dimension) :
    Prop :=
  ∀ s t, M.step a s t → ∃ u, M.step b t u ∧ ∀ d, d ∈ D → M.agree d s u

-- RR.DEFINES: TR.THM.RESTORES_REQUIRES_FOOTPRINT
/--
If `b` after `a` restores a dimension that `a` characteristically changes,
that dimension is in the footprint of `b`.
-/
theorem restores_requires_footprint {M : StateModel} {a b : OperatorCode}
    {D : List Dimension} {s t : M.State} {d : Dimension}
    (hr : RestoresOn M a b D) (hs : M.step a s t)
    (hc : characteristic a = some d) (hd : d ∈ D) : d ∈ footprint b := by
  refine Classical.byContradiction fun hnot => ?_
  obtain ⟨u, hu, hag⟩ := hr s t hs
  have h1 : M.agree d t u := M.frame hu d hnot
  have h2 : M.agree d s u := hag d hd
  have e := M.agree_equiv d
  exact M.change hs hc (e.trans h2 (e.symm h1))

-- RR.DEFINES: TR.THM.DECLARED_INVERSE_LIKE_NECESSARY
/--
For every declared inverse-like pair, the characteristic dimension of the first
operator is in the footprint of the second.
-/
theorem declared_inverseLike_necessary (a b : OperatorCode) (d : Dimension)
    (h : composition? a b = some CompositionRelation.inverseLike)
    (hc : characteristic a = some d) : d ∈ footprint b := by
  cases a <;> cases b <;> simp [composition?] at h <;>
    simp [characteristic] at hc <;> subst hc <;> decide

end
end SE.Transformation
