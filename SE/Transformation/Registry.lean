/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Domain.Operator.Semantics
public import SE.Transformation.Domain.TransformationFamily
public import SE.Transformation.Domain.TransformationKind

/-!
# Registry

Canonical finite enumerations and derived queries for the Transformation theory.

The lists enumerate the finite vocabulary.
Family and kind membership are derived from the authoritative mappings in
`SE.Transformation.Domain.Operator.Semantics`; no per-family or per-kind
operator lists are maintained independently.
-/

namespace SE.Transformation

@[expose] public section

/-- All operator codes in canonical reference order. -/
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

/-- All transformation families in canonical reference order. -/
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

/-- All transformation kinds in canonical reference order. -/
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

-- RR.DEFINES: TR.DEF.OPERATORS_IN_FAMILY
/--
Return the canonical operators whose authoritative family is `family`.
-/
def operatorsInFamily
    (family : TransformationFamily) :
    List OperatorCode :=
  referenceOperators.filter fun op =>
    decide (operatorFamily op = family)

-- RR.DEFINES: TR.DEF.OPERATORS_IN_KIND
/--
Return the canonical operators whose derived transformation kind is `kind`.
-/
def operatorsInKind
    (kind : TransformationKind) :
    List OperatorCode :=
  referenceOperators.filter fun op =>
    decide (operatorKind op = kind)

-- RR.DEFINES: TR.DEF.FAMILIES_IN_KIND
/--
Return the canonical families whose authoritative transformation kind is
`kind`.
-/
def familiesInKind
    (kind : TransformationKind) :
    List TransformationFamily :=
  referenceFamilies.filter fun family =>
    decide (familyKind family = kind)

end

end SE.Transformation
