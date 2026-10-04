/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Effect.Model

/-!
# Sequences of Atomic Steps

A sequence is a list of operators applied in order, each as one atomic step.
`StateModel.SequenceStep M ops s t` says that `t` is reached from `s` by
applying the operators of `ops` in order, through some intermediate
configurations.

`sequenceFootprintUpperBound ops` is the union of the footprints of the
operators in `ops`. It is the set of dimensions that may be touched somewhere
in the sequence.

It is not the set of dimensions on which the final configuration may differ
from the initial one. A later step may restore a dimension that an earlier step
changed. The theorems below keep the two notions apart:

- a dimension outside the bound is preserved throughout the sequence, so the
  initial, every intermediate, and the final configurations agree on it;
- a dimension inside the bound may still agree at the end, as
  `sequenceFootprintUpperBound_not_net_change` shows.

Net effects, restoration, and inverse behavior are not defined here.
-/

set_option autoImplicit false

namespace SE.Transformation
@[expose] public section

-- RR.DEFINES: TR.DEF.SEQUENCE_FOOTPRINT_UPPER_BOUND
/--
The dimensions that may be touched somewhere in a sequence of operators: the
union of the footprints of its operators.

This is an upper bound on where change may occur. It says nothing about which
dimensions differ between the initial and final configurations.
-/
def sequenceFootprintUpperBound (ops : List OperatorCode) : List Dimension :=
  ops.flatMap footprint

/-- A dimension is in the bound exactly when some operator of the sequence has
it in its footprint. -/
theorem mem_sequenceFootprintUpperBound_iff {ops : List OperatorCode}
    {d : Dimension} :
    d ∈ sequenceFootprintUpperBound ops ↔
      ∃ op, op ∈ ops ∧ d ∈ footprint op := by
  simp [sequenceFootprintUpperBound, List.mem_flatMap]

/-- The empty sequence touches no dimension. -/
theorem sequenceFootprintUpperBound_nil :
    sequenceFootprintUpperBound [] = [] :=
  rfl

/-- The bound of a sequence with a first operator is that operator's footprint
together with the bound of the rest. -/
theorem sequenceFootprintUpperBound_cons (op : OperatorCode)
    (ops : List OperatorCode) :
    sequenceFootprintUpperBound (op :: ops) =
      footprint op ++ sequenceFootprintUpperBound ops :=
  rfl

/-- The bound of a concatenation is the concatenation of the bounds. -/
theorem sequenceFootprintUpperBound_append (xs ys : List OperatorCode) :
    sequenceFootprintUpperBound (xs ++ ys) =
      sequenceFootprintUpperBound xs ++ sequenceFootprintUpperBound ys := by
  simp [sequenceFootprintUpperBound, List.flatMap_append]

namespace StateModel

-- RR.DEFINES: TR.DEF.SEQUENCE_STEP
/--
`M.SequenceStep ops s t`: `t` is reached from `s` by applying the operators of
`ops` in order, each as one atomic step.
-/
inductive SequenceStep (M : StateModel) :
    List OperatorCode → M.State → M.State → Prop where
  /-- The empty sequence leaves the configuration as it is. -/
  | nil (s : M.State) : SequenceStep M [] s s
  /-- A first atomic step followed by a sequence. -/
  | cons {op : OperatorCode} {ops : List OperatorCode} {s t u : M.State} :
      M.step op s t → SequenceStep M ops t u → SequenceStep M (op :: ops) s u

/-- A one-operator sequence is exactly one atomic step. -/
theorem SequenceStep.singleton_iff {M : StateModel} {op : OperatorCode}
    {s t : M.State} : M.SequenceStep [op] s t ↔ M.step op s t := by
  constructor
  · intro h
    cases h with
    | cons hstep htail =>
      cases htail
      exact hstep
  · intro h
    exact SequenceStep.cons h (SequenceStep.nil t)

/-- A sequence of two parts passes through an intermediate configuration. -/
theorem SequenceStep.append_iff {M : StateModel} {xs ys : List OperatorCode}
    {s u : M.State} :
    M.SequenceStep (xs ++ ys) s u ↔
      ∃ m, M.SequenceStep xs s m ∧ M.SequenceStep ys m u := by
  induction xs generalizing s with
  | nil =>
    constructor
    · intro h
      exact ⟨s, SequenceStep.nil s, h⟩
    · rintro ⟨m, hm, hys⟩
      cases hm
      exact hys
  | cons op xs ih =>
    constructor
    · intro h
      cases h with
      | cons hstep htail =>
        obtain ⟨m, hxs, hys⟩ := ih.1 htail
        exact ⟨m, SequenceStep.cons hstep hxs, hys⟩
    · rintro ⟨m, hm, hys⟩
      cases hm with
      | cons hstep htail =>
        exact SequenceStep.cons hstep (ih.2 ⟨_, htail, hys⟩)

-- RR.DEFINES: TR.THM.SEQUENCE_AGREE_OF_UNTOUCHED
/--
A dimension outside the sequence bound is preserved: the initial and final
configurations agree on it.
-/
theorem SequenceStep.agree_of_untouched {M : StateModel}
    {ops : List OperatorCode} {s t : M.State} {d : Dimension}
    (h : M.SequenceStep ops s t) (hd : d ∉ sequenceFootprintUpperBound ops) :
    M.agree d s t := by
  induction h with
  | nil s => exact (M.agree_equiv d).refl s
  | @cons op ops s t u hstep _ ih =>
    have hnot : d ∉ footprint op ∧ d ∉ sequenceFootprintUpperBound ops := by
      simpa [sequenceFootprintUpperBound_cons, List.mem_append, not_or] using hd
    exact (M.agree_equiv d).trans (M.frame hstep d hnot.1) (ih hnot.2)

-- RR.DEFINES: TR.THM.SEQUENCE_PRESERVES
/--
Frame-based preservation lifts to sequences: if agreement on `D` suffices for
`P` and the sequence bound avoids `D`, a sequence of steps preserves `P`.
-/
theorem SequenceStep.preserves {M : StateModel} {D : List Dimension}
    {P : M.State → M.State → Prop} {ops : List OperatorCode}
    {s t : M.State} (hP : M.AgreementSuffices D P)
    (hD : ∀ d, d ∈ D → d ∉ sequenceFootprintUpperBound ops)
    (h : M.SequenceStep ops s t) : P s t :=
  hP s t fun d hd => h.agree_of_untouched (hD d hd)

-- RR.DEFINES: TR.THM.SEQUENCE_AGREE_THROUGH_OF_UNTOUCHED
/--
Preservation throughout a history: if a dimension is outside the bound of a
two-part sequence, the initial configuration agrees on it with the intermediate
configuration and the intermediate with the final one.
-/
theorem SequenceStep.agree_through_of_untouched {M : StateModel}
    {xs ys : List OperatorCode} {s u : M.State} {d : Dimension}
    (h : M.SequenceStep (xs ++ ys) s u)
    (hd : d ∉ sequenceFootprintUpperBound (xs ++ ys)) :
    ∃ m, M.SequenceStep xs s m ∧ M.SequenceStep ys m u ∧
      M.agree d s m ∧ M.agree d m u := by
  obtain ⟨m, hxs, hys⟩ := SequenceStep.append_iff.1 h
  rw [sequenceFootprintUpperBound_append] at hd
  have hx : d ∉ sequenceFootprintUpperBound xs := fun hx =>
    hd (List.mem_append.2 (Or.inl hx))
  have hy : d ∉ sequenceFootprintUpperBound ys := fun hy =>
    hd (List.mem_append.2 (Or.inr hy))
  exact ⟨m, hxs, hys, hxs.agree_of_untouched hx, hys.agree_of_untouched hy⟩

/-- A difference between initial and final configurations lies inside the
sequence bound. -/
theorem SequenceStep.touched_of_not_agree {M : StateModel}
    {ops : List OperatorCode} {s t : M.State} {d : Dimension}
    (h : M.SequenceStep ops s t) (hne : ¬ M.agree d s t) :
    d ∈ sequenceFootprintUpperBound ops :=
  Classical.byContradiction fun hd => hne (h.agree_of_untouched hd)

end StateModel

-- RR.DEFINES: TR.THM.SEQUENCE_FOOTPRINT_NOT_NET_CHANGE
/--
Touched is not net change. In the maximal model, the sequence `BD`, `UB` may
touch `binding`, which is in its bound, while the initial and final
configurations still agree on `binding`.
-/
theorem sequenceFootprintUpperBound_not_net_change :
    ∃ s t, maximalModel.SequenceStep [OperatorCode.BD, OperatorCode.UB] s t ∧
      Dimension.binding ∈
        sequenceFootprintUpperBound [OperatorCode.BD, OperatorCode.UB] ∧
      maximalModel.agree Dimension.binding s t := by
  let s : maximalModel.State := fun _ => 0
  let m : maximalModel.State := fun d => if d = Dimension.binding then 1 else 0
  have h1 : maximalModel.step OperatorCode.BD s m := by
    refine ⟨?_, ?_⟩
    · intro d hd
      have hdb : d ≠ Dimension.binding := by
        intro hb
        exact hd (by simp [footprint, hb])
      simp [s, m, hdb]
    · intro C hC
      simp [requirements] at hC
      subst hC
      exact ⟨Dimension.binding, by simp, by simp [s, m]⟩
  have h2 : maximalModel.step OperatorCode.UB m s := by
    refine ⟨?_, ?_⟩
    · intro d hd
      have hdb : d ≠ Dimension.binding := by
        intro hb
        exact hd (by simp [footprint, hb])
      simp [s, m, hdb]
    · intro C hC
      simp [requirements] at hC
      subst hC
      exact ⟨Dimension.binding, by simp, by simp [s, m]⟩
  refine ⟨s, s, ?_, ?_, rfl⟩
  · exact StateModel.SequenceStep.cons h1
      (StateModel.SequenceStep.cons h2 (StateModel.SequenceStep.nil s))
  · simp [sequenceFootprintUpperBound, footprint]

end
end SE.Transformation
