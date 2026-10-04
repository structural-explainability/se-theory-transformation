/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Effect

/-!
# Effect Sequence Checks

Regression checks for sequence footprints and the sequence theorems, and for
the coherence of declared inverse-like composition with effects.
-/

namespace SE.Transformation

open Dimension

/-! ## Sequence footprint upper bound -/

example : sequenceFootprintUpperBound [] = [] := rfl

example : sequenceFootprintUpperBound [OperatorCode.AT, OperatorCode.AZ] =
    [evidence, standing] := rfl

example : sequenceFootprintUpperBound [OperatorCode.BD, OperatorCode.UB] =
    [binding, binding] := rfl

example : evidence ∈ sequenceFootprintUpperBound [OperatorCode.AZ, OperatorCode.AT] := by
  decide

example : evidence ∉ sequenceFootprintUpperBound [OperatorCode.AZ, OperatorCode.BD] := by
  decide

/-! ## Sequence steps -/

example (s t : maximalModel.State) :
    maximalModel.SequenceStep [OperatorCode.AZ] s t ↔
      maximalModel.step OperatorCode.AZ s t :=
  StateModel.SequenceStep.singleton_iff

/-- Preservation across a two-step sequence: `AZ` then `AT` never touch
`binding`. -/
example (s t : maximalModel.State)
    (h : maximalModel.SequenceStep [OperatorCode.AZ, OperatorCode.AT] s t) :
    maximalModel.agree binding s t :=
  h.agree_of_untouched (by decide)

/-- A difference in `standing` after `AZ`, `AT` lies in the sequence bound. -/
example (s t : maximalModel.State)
    (h : maximalModel.SequenceStep [OperatorCode.AZ, OperatorCode.AT] s t)
    (hne : ¬ maximalModel.agree standing s t) :
    standing ∈ sequenceFootprintUpperBound [OperatorCode.AZ, OperatorCode.AT] :=
  h.touched_of_not_agree hne

/-- Touched is not net change. -/
example : ∃ s t, maximalModel.SequenceStep [OperatorCode.BD, OperatorCode.UB] s t ∧
    binding ∈ sequenceFootprintUpperBound [OperatorCode.BD, OperatorCode.UB] ∧
      maximalModel.agree binding s t :=
  sequenceFootprintUpperBound_not_net_change

/-! ## Coherence of declared inverse-like composition with effects -/

example : EffectsOverlap OperatorCode.BD OperatorCode.UB :=
  declared_inverseLike_effectsOverlap OperatorCode.BD OperatorCode.UB rfl

example : EffectsOverlap OperatorCode.SP OperatorCode.MG :=
  declared_inverseLike_effectsOverlap OperatorCode.SP OperatorCode.MG rfl

end SE.Transformation
