/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Effect
public import SE.Transformation.Registry

/-!
# Effect Semantics Checks

Regression checks for the operator footprint and required-change tables, the
derived characteristic, the effect relations, and the generic theorems.
-/

namespace SE.Transformation

open Dimension

/-! ## Footprints -/

example : footprint OperatorCode.AT = [evidence] := rfl
example : footprint OperatorCode.AZ = [standing] := rfl
example : footprint OperatorCode.BD = [binding] := rfl
example : footprint OperatorCode.UB = [binding] := rfl
example : footprint OperatorCode.LK = [association] := rfl
example : footprint OperatorCode.EM = [containment] := rfl
example : footprint OperatorCode.RO = [arrangement] := rfl
example : footprint OperatorCode.BR = [lineage] := rfl
example : footprint OperatorCode.CL = [content, composition, arrangement] := rfl
example : footprint OperatorCode.EX = [content, composition, arrangement] := rfl
example : footprint OperatorCode.SH =
    [binding, association, containment, arrangement] := rfl
example : footprint OperatorCode.CP =
    [referentPopulation, representationPopulation, lineage] := rfl
example : footprint OperatorCode.VS =
    [lineage, referentPopulation, representationPopulation] := rfl
example : footprint OperatorCode.PR =
    [content, arrangement, composition, representationPopulation, lineage] := rfl
example : footprint OperatorCode.SP =
    [content, arrangement, composition, referentPopulation] := rfl
example : footprint OperatorCode.MG = referenceDimensions := rfl
example : footprint OperatorCode.RV = referenceDimensions := rfl

/-! ## Required-change clauses -/

example : requirements OperatorCode.AT = [[evidence]] := rfl
example : requirements OperatorCode.AZ = [[standing]] := rfl
example : requirements OperatorCode.BD = [[binding]] := rfl
example : requirements OperatorCode.UB = [[binding]] := rfl
example : requirements OperatorCode.LK = [[association]] := rfl
example : requirements OperatorCode.EM = [[containment]] := rfl
example : requirements OperatorCode.RO = [[arrangement]] := rfl
example : requirements OperatorCode.BR = [[lineage]] := rfl
example : requirements OperatorCode.VS = [[lineage]] := rfl
example : requirements OperatorCode.RV = [[lineage]] := rfl
example : requirements OperatorCode.SP = [[composition]] := rfl
example : requirements OperatorCode.MG = [[composition, referentPopulation]] := rfl
example : requirements OperatorCode.CL = [[composition, arrangement]] := rfl
example : requirements OperatorCode.EX = [[content, composition, arrangement]] := rfl
example : requirements OperatorCode.SH =
    [[binding, association, containment, arrangement]] := rfl
example : requirements OperatorCode.CP =
    [[referentPopulation, representationPopulation], [lineage]] := rfl
example : requirements OperatorCode.PR =
    [[representationPopulation], [lineage]] := rfl

/-! ## Derived characteristic -/

example : characteristic OperatorCode.AT = some evidence := rfl
example : characteristic OperatorCode.SP = some composition := rfl
example : characteristic OperatorCode.RV = some lineage := rfl
example : characteristic OperatorCode.CP = none := rfl
example : characteristic OperatorCode.PR = none := rfl
example : characteristic OperatorCode.EX = none := rfl
example : characteristic OperatorCode.MG = none := rfl
example : characteristic OperatorCode.SH = none := rfl

/-- Exactly eleven operators have a characteristic dimension. -/
example :
    (referenceOperators.filter fun op => (characteristic op).isSome).length = 11 := by
  decide

/-! ## Effect relations -/

example : EffectsDisjoint OperatorCode.AZ OperatorCode.AT := by decide
example : EffectsOverlap OperatorCode.PR OperatorCode.CL := by decide
example : EffectsOverlap OperatorCode.SP OperatorCode.MG := by decide
example : ¬ EffectsDisjoint OperatorCode.PR OperatorCode.CL := by decide
example : EffectsDisjoint OperatorCode.BD OperatorCode.RO := by decide

/-- Review count: ordered operator pairs with disjoint effects. -/
example :
    (referenceOperators.flatMap fun a =>
      referenceOperators.filter fun b => a != b && !overlapB a b).length = 154 := by
  decide +kernel

/-- Review count: ordered operator pairs with overlapping effects. -/
example :
    (referenceOperators.flatMap fun a =>
      referenceOperators.filter fun b => a != b && overlapB a b).length = 118 := by
  decide +kernel

/-! ## Generic theorems on the maximal model -/

example (op : OperatorCode) : ∃ s t, maximalModel.step op s t :=
  maximalModel_step_exists op

/-- Preservation: `AZ` cannot change `binding`. -/
example (s t : maximalModel.State) (h : maximalModel.step OperatorCode.AZ s t) :
    agreementOn [binding] s t :=
  StateModel.step_preserves (M := maximalModel) (D := [binding])
    (P := agreementOn [binding]) (fun _ _ hag => hag) (by decide) h

/-- Breakage: every `BD` step changes `binding`, so it breaks agreement on it. -/
example (s t : maximalModel.State) (h : maximalModel.step OperatorCode.BD s t) :
    ¬ agreementOn [binding] s t :=
  StateModel.step_breaks (M := maximalModel) (P := agreementOn [binding])
    (C := [binding]) (by decide)
    (fun d hd s t hst => hst d (by simpa using hd)) h

/-- A clause alone is not enough unless every member is required: `SH` has a
disjunctive clause, so agreement on `binding` alone is not broken by every
step. -/
example : ¬ ∀ s t, maximalModel.step OperatorCode.SH s t →
    ¬ agreementOn [binding] s t := by
  rw [maximalModel_breaks_agreementOn_iff]
  decide

end SE.Transformation
