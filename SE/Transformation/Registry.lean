/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Domain.Operator.Semantics
public import SE.Transformation.Domain.TransformationFamily
public import SE.Transformation.Domain.TransformationKind
public import SE.Transformation.Outcome

/-!
# Registry

Reference vocabulary objects for the Transformation theory.

These lists provide Lean-side reference enumerations for operators,
families, kinds, and outcomes. They do not replace the machine-readable
registries under `reference/`.
-/

namespace SE.Transformation

public section

/-- All operator codes in alphabetical order. -/
def referenceOperators : List OperatorCode :=
  [
    OperatorCode.AT,
    OperatorCode.AZ,
    OperatorCode.BD,
    OperatorCode.BR,
    OperatorCode.CL,
    OperatorCode.CP,
    OperatorCode.EM,
    OperatorCode.EX,
    OperatorCode.LK,
    OperatorCode.MG,
    OperatorCode.PR,
    OperatorCode.RO,
    OperatorCode.RV,
    OperatorCode.SH,
    OperatorCode.SP,
    OperatorCode.UB,
    OperatorCode.VS
  ]

/-- All transformation families in alphabetical order. -/
def referenceFamilies : List TransformationFamily :=
  [
    TransformationFamily.aggregation,
    TransformationFamily.association,
    TransformationFamily.attestation,
    TransformationFamily.branching,
    TransformationFamily.containment,
    TransformationFamily.contextual,
    TransformationFamily.decomposition,
    TransformationFamily.migration,
    TransformationFamily.normative,
    TransformationFamily.projection,
    TransformationFamily.replication,
    TransformationFamily.reorganization,
    TransformationFamily.scaling,
    TransformationFamily.versioning
  ]

/-- All transformation kinds in alphabetical order. -/
def referenceKinds : List TransformationKind :=
  [
    TransformationKind.contextual,
    TransformationKind.normative,
    TransformationKind.observational,
    TransformationKind.organizational,
    TransformationKind.relational,
    TransformationKind.structural,
    TransformationKind.temporal
  ]

/-- All transformation outcomes in alphabetical order. -/
def referenceOutcomes : List TransformationOutcome :=
  [
    TransformationOutcome.BRK,
    TransformationOutcome.IGN,
    TransformationOutcome.INH,
    TransformationOutcome.MIX,
    TransformationOutcome.PRS,
    TransformationOutcome.UNK
  ]
end

end SE.Transformation
