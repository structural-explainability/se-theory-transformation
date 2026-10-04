/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Effect.Dimension

/-!
# State Model

A state model interprets Transformation operators over abstract transformation
configurations. A state is a configuration: it may contain referents,
representations, components, relations, containment, bindings, lineage,
evidence, and standing. No concrete configuration representation is assumed.

A model supplies:

- the states;
- an agreement equivalence for each effect dimension;
- an atomic step relation for each operator, relating a before-configuration
  to an after-configuration.

`step op s t` is the intrinsic effect of one application of `op`. It does not
include incidental changes, which belong to separate operator steps or compound
transformations.

A model must satisfy two laws.

- Frame: a step leaves every dimension outside the operator footprint
  unchanged.
- Change: for every required clause of the operator, a step changes at least
  one dimension in that clause.

Two generic results follow.

- Preservation: if agreement on a set of dimensions suffices for a relation,
  and the operator footprint avoids them, a step preserves the relation.
- Breakage: if, for some required clause, agreement on every dimension in the
  clause is required for a relation, every step breaks the relation.

Only the sufficient direction of breakage follows from the laws. The converse
is a property of the maximal model for relations defined exactly by dimension
agreement.
-/

set_option autoImplicit false

namespace SE.Transformation
@[expose] public section

-- RR.DEFINES: TR.TYPE.STATE_MODEL
/-- A state model: configurations, per-dimension agreement, and atomic
operator steps. -/
structure StateModel where
  /-- The transformation configurations. -/
  State : Type
  /-- Agreement of two configurations with respect to one dimension. -/
  agree : Dimension → State → State → Prop
  /-- Agreement in each dimension is an equivalence. -/
  agree_equiv : ∀ d, Equivalence (agree d)
  /-- `step op s t`: `t` is the result of one atomic application of `op`
  to `s`. -/
  step : OperatorCode → State → State → Prop
  /-- Frame law: dimensions outside the footprint are unchanged. -/
  frame : ∀ {op s t}, step op s t → ∀ d, d ∉ footprint op → agree d s t
  /-- Change law: every required clause has a dimension that changes. -/
  change : ∀ {op s t}, step op s t → ∀ C, C ∈ requirements op →
    ∃ d, d ∈ C ∧ ¬ agree d s t

namespace StateModel

-- RR.DEFINES: TR.DEF.AGREEMENT_SUFFICES
/-- Agreement on every dimension in `D` suffices for the relation `P`. -/
def AgreementSuffices (M : StateModel) (D : List Dimension)
    (P : M.State → M.State → Prop) : Prop :=
  ∀ s t, (∀ d, d ∈ D → M.agree d s t) → P s t

-- RR.DEFINES: TR.DEF.AGREEMENT_REQUIRED
/-- The relation `P` requires agreement on the dimension `d`: whenever `P`
holds, the configurations agree on `d`. -/
def AgreementRequired (M : StateModel) (d : Dimension)
    (P : M.State → M.State → Prop) : Prop :=
  ∀ s t, P s t → M.agree d s t

-- RR.DEFINES: TR.THM.STEP_PRESERVES
/--
Frame-based preservation: if agreement on `D` suffices for `P` and the
footprint of `op` avoids `D`, a step of `op` preserves `P`.
-/
theorem step_preserves {M : StateModel} {D : List Dimension}
    {P : M.State → M.State → Prop} {op : OperatorCode} {s t : M.State}
    (hP : M.AgreementSuffices D P) (hD : ∀ d, d ∈ D → d ∉ footprint op)
    (h : M.step op s t) : P s t :=
  hP s t fun d hd => M.frame h d (hD d hd)

-- RR.DEFINES: TR.THM.STEP_BREAKS
/--
Required-change breakage: if some required clause `C` of `op` has the property
that `P` requires agreement on every dimension in `C`, then every step of `op`
breaks `P`.
-/
theorem step_breaks {M : StateModel} {P : M.State → M.State → Prop}
    {op : OperatorCode} {s t : M.State} {C : List Dimension}
    (hC : C ∈ requirements op) (hP : ∀ d, d ∈ C → M.AgreementRequired d P)
    (h : M.step op s t) : ¬ P s t := by
  intro hst
  obtain ⟨d, hd, hne⟩ := M.change h C hC
  exact hne (hP d hd s t hst)

end StateModel

-- RR.DEFINES: TR.DEF.MAXIMAL_MODEL
/--
The maximal model. A step of `op` may change any dimensions inside the
footprint, and must change at least one dimension in every required clause. It
satisfies the two laws and assumes nothing further.
-/
def maximalModel : StateModel where
  State := Dimension → Nat
  agree d s t := s d = t d
  agree_equiv _ := ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩
  step op s t :=
    (∀ d, d ∉ footprint op → t d = s d) ∧
    (∀ C, C ∈ requirements op → ∃ d, d ∈ C ∧ t d ≠ s d)
  frame h d hd := (h.1 d hd).symm
  change h C hC :=
    match h.2 C hC with
    | ⟨d, hd, hne⟩ => ⟨d, hd, fun hag => hne hag.symm⟩

-- RR.DEFINES: TR.THM.MAXIMAL_MODEL_STEP_EXISTS
/-- Satisfiability: every operator has an admissible step in the maximal
model, so the frame law and the clause requirements are consistent. -/
theorem maximalModel_step_exists (op : OperatorCode) :
    ∃ s t, maximalModel.step op s t := by
  refine ⟨fun _ => 0, fun d => if d ∈ footprint op then 1 else 0, ?_, ?_⟩
  · intro d hd
    simp [hd]
  · intro C hC
    obtain ⟨d, hd⟩ := List.exists_mem_of_ne_nil C (requirements_clause_ne_nil hC)
    exact ⟨d, hd, by simp [requirements_subset_footprint hC hd]⟩

/-- Agreement on exactly the dimensions in `S`, in the maximal model. -/
def agreementOn (S : List Dimension) :
    maximalModel.State → maximalModel.State → Prop :=
  fun s t => ∀ d, d ∈ S → s d = t d

-- RR.DEFINES: TR.THM.MAXIMAL_MODEL_BREAKS_IFF
/--
Model-specific completeness. In the maximal model, every step of `op` breaks
agreement on `S` exactly when `S` contains some required clause of `op`.

This shows that the clause condition of `StateModel.step_breaks` is tight for
relations defined exactly by dimension agreement. It is a property of the
maximal model, not a consequence of the two laws.
-/
theorem maximalModel_breaks_agreementOn_iff (op : OperatorCode)
    (S : List Dimension) :
    (∀ s t, maximalModel.step op s t → ¬ agreementOn S s t) ↔
      ∃ C, C ∈ requirements op ∧ ∀ d, d ∈ C → d ∈ S := by
  constructor
  · intro hall
    refine Classical.byContradiction fun hno => ?_
    let t : Dimension → Nat := fun d => if d ∈ footprint op ∧ d ∉ S then 1 else 0
    have hstep : maximalModel.step op (fun _ => 0) t := by
      refine ⟨?_, ?_⟩
      · intro d hd
        simp [t, hd]
      · intro C hC
        have hnot : ¬ ∀ d, d ∈ C → d ∈ S := fun hsub => hno ⟨C, hC, hsub⟩
        have hex : ∃ d, d ∈ C ∧ d ∉ S := by
          refine Classical.byContradiction fun h => hnot ?_
          intro d hd
          exact Classical.byContradiction fun hdS => h ⟨d, hd, hdS⟩
        obtain ⟨d, hd, hdS⟩ := hex
        exact ⟨d, hd, by simp [t, requirements_subset_footprint hC hd, hdS]⟩
    exact hall _ t hstep fun d hd => by simp [t, hd]
  · rintro ⟨C, hC, hsub⟩ s t hstep hagree
    obtain ⟨d, hd, hne⟩ := hstep.2 C hC
    exact hne (hagree d (hsub d hd)).symm

end
end SE.Transformation
