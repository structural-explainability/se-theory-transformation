import SETheoryTransformation.Domain.Operator.Semantics
import SETheoryTransformation.Domain.TransformationFamily
import SETheoryTransformation.Domain.TransformationKind
import SETheoryTransformation.Outcome

/-!
# Registry

SETheoryTransformation.Registry

Reference vocabulary objects for the transformation theory.

These lists provide Lean-side reference enumerations for operators,
families, kinds, and outcomes. They do not replace machine-readable
registries in reference/.
-/

namespace SETheoryTransformation

/-- All operator codes in alpha order. -/
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

/-- All transformation families in alpha order. -/
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

/-- All transformation kinds in alpha order. -/
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

/-- All transformation outcomes in alpha order. -/
def referenceOutcomes : List TransformationOutcome :=
  [
    TransformationOutcome.BRK,
    TransformationOutcome.IGN,
    TransformationOutcome.INH,
    TransformationOutcome.MIX,
    TransformationOutcome.PRS,
    TransformationOutcome.UNK
  ]

end SETheoryTransformation
