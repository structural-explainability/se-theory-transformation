/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Effect.Dimension

/-!
# State Model

A state model interprets each operator
as a relation between before and after states,
and interprets each effect dimension as an equivalence on states.

`agree d s t` says that states `s` and `t` are
indistinguishable in dimension `d`.
`step op s t` says that `t` is a result of applying `op` to `s`.

A model must satisfy two laws.

- Frame: a step leaves every dimension outside the operator footprint
  unchanged.
- Change: a step changes the characteristic dimension of the operator.

Anything proved from these two laws holds in every model that satisfies them.

Two results follow directly.

- A relation determined by a set of dimensions
  is preserved by any operator whose footprint avoids those dimensions.
- A relation that implies agreement on a dimension is broken by any operator
  whose characteristic dimension is that dimension.

The first is a guarantee about what cannot change.
The second is a guarantee about what must change.
-/

set_option autoImplicit false

namespace SE.Transformation
@[expose] public section

-- RR.DEFINES: TR.TYPE.STATE_MODEL
/-- A state model: states, per-dimension agreement, and operator steps. -/
structure StateModel where
  /-- The states. -/
  State : Type
  /-- Indistinguishability of two states in one dimension. -/
  agree : Dimension → State → State → Prop
  /-- Agreement in each dimension is an equivalence. -/
  agree_equiv : ∀ d, Equivalence (agree d)
  /-- `step op s t`: `t` is a result of applying `op` to `s`. -/
  step : OperatorCode → State → State → Prop
  /-- Frame law: dimensions outside the footprint are unchanged. -/
  frame : ∀ {op s t}, step op s t → ∀ d, d ∉ footprint op → agree d s t
  /-- Change law: the characteristic dimension is changed. -/
  change : ∀ {op s t d}, step op s t → characteristic op = some d →
    ¬ agree d s t

namespace StateModel

-- RR.DEFINES: TR.DEF.DETERMINED_BY
/-- A relation is determined by dimensions `D` when agreement on `D` implies it. -/
def DeterminedBy (M : StateModel) (D : List Dimension)
    (P : M.State → M.State → Prop) : Prop :=
  ∀ s t, (∀ d, d ∈ D → M.agree d s t) → P s t

-- RR.DEFINES: TR.DEF.SENSITIVE_TO
/-- A relation is sensitive to a dimension when it implies agreement there. -/
def SensitiveTo (M : StateModel) (d : Dimension)
    (P : M.State → M.State → Prop) : Prop :=
  ∀ s t, P s t → M.agree d s t

-- RR.DEFINES: TR.THM.STEP_PRESERVES
/-- Frame rule: an operator whose footprint avoids `D` preserves a
relation determined by `D`. -/
theorem step_preserves {M : StateModel} {D : List Dimension}
    {P : M.State → M.State → Prop} {op : OperatorCode} {s t : M.State}
    (hP : M.DeterminedBy D P) (hD : ∀ d, d ∈ D → d ∉ footprint op)
    (h : M.step op s t) : P s t :=
  hP s t fun d hd => M.frame h d (hD d hd)

-- RR.DEFINES: TR.THM.STEP_BREAKS
/-- Change rule: an operator whose characteristic dimension is `d` breaks a
relation sensitive to `d`. -/
theorem step_breaks {M : StateModel} {d : Dimension}
    {P : M.State → M.State → Prop} {op : OperatorCode} {s t : M.State}
    (hP : M.SensitiveTo d P) (hc : characteristic op = some d)
    (h : M.step op s t) : ¬ P s t :=
  fun hst => M.change h hc (hP s t hst)

end StateModel

-- RR.DEFINES: TR.DEF.MAXIMAL_MODEL
/--
The maximal model: each operator may change any subset of its footprint, and
must change its characteristic dimension. It satisfies the two laws and
assumes nothing further.
-/
def maximalModel : StateModel where
  State := Dimension → Nat
  agree d s t := s d = t d
  agree_equiv _ := ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩
  step op s t :=
    (∀ d, d ∉ footprint op → t d = s d) ∧
    (∀ d, characteristic op = some d → t d ≠ s d)
  frame h d hd := (h.1 d hd).symm
  change h hc := fun hag => h.2 _ hc hag.symm

-- RR.DEFINES: TR.THM.MAXIMAL_MODEL_STEP_EXISTS
/-- The laws are satisfiable: every operator has a step in the maximal model. -/
theorem maximalModel_step_exists (op : OperatorCode) :
    ∃ s t, maximalModel.step op s t := by
  refine ⟨fun _ => 0, fun d => if d ∈ footprint op then 1 else 0, ?_, ?_⟩
  · intro d hd
    simp [hd]
  · intro d hc
    have := characteristic_mem_footprint op d hc
    simp [this]

end
end SE.Transformation
