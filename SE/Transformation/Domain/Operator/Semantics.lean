module

public import SE.Transformation.Domain.Operator.Codes
public import SE.Transformation.Domain.TransformationFamily
public import SE.Transformation.Domain.TransformationKind

/-!
# Operator Semantics

SE.Transformation.Domain.Operator.Semantics

Authoritative semantic classification for transformation operators.

`operatorFamily` is the sole operator-to-family mapping.
`familyKind` is the sole family-to-kind mapping.
`operatorKind` is derived from those two functions.

Reference artifacts and derived operator lists must mirror these mappings;
they are not independent sources of taxonomy semantics.

The kind classification groups families by the principal structural dimension
of change represented in this theory:

- contextual: contextual binding or unbinding;
- normative: authorization or other normative standing;
- observational: attestation, replication, or projection;
- organizational: containment or reorganization;
- relational: association or migration;
- structural: aggregation, decomposition, or scaling; and
- temporal: branching or versioning.

These classifications describe transformation structure only.
They do not determine persistence.
-/

namespace SE.Transformation

@[expose] public section

-- RR.DEFINES: TR.DEF.OPERATOR_FAMILY
/--
The transformation family for each operator code.

Each operator belongs to exactly one family.
This definition is the authoritative operator-to-family mapping.
-/
def operatorFamily : OperatorCode → TransformationFamily
  | OperatorCode.AT => TransformationFamily.attestation
  | OperatorCode.AZ => TransformationFamily.normative
  | OperatorCode.BD => TransformationFamily.contextual
  | OperatorCode.BR => TransformationFamily.branching
  | OperatorCode.CL => TransformationFamily.scaling
  | OperatorCode.CP => TransformationFamily.replication
  | OperatorCode.EM => TransformationFamily.containment
  | OperatorCode.EX => TransformationFamily.scaling
  | OperatorCode.LK => TransformationFamily.association
  | OperatorCode.MG => TransformationFamily.aggregation
  | OperatorCode.PR => TransformationFamily.projection
  | OperatorCode.RO => TransformationFamily.reorganization
  | OperatorCode.RV => TransformationFamily.versioning
  | OperatorCode.SH => TransformationFamily.migration
  | OperatorCode.SP => TransformationFamily.decomposition
  | OperatorCode.UB => TransformationFamily.contextual
  | OperatorCode.VS => TransformationFamily.versioning

-- RR.DEFINES: TR.DEF.FAMILY_KIND
/--
The transformation kind for each family.

Each family belongs to exactly one kind.
This definition is the authoritative family-to-kind mapping.
-/
def familyKind : TransformationFamily → TransformationKind
  | TransformationFamily.aggregation    => TransformationKind.structural
  | TransformationFamily.association    => TransformationKind.relational
  | TransformationFamily.attestation    => TransformationKind.observational
  | TransformationFamily.branching      => TransformationKind.temporal
  | TransformationFamily.containment    => TransformationKind.organizational
  | TransformationFamily.contextual     => TransformationKind.contextual
  | TransformationFamily.decomposition  => TransformationKind.structural
  | TransformationFamily.migration      => TransformationKind.relational
  | TransformationFamily.normative      => TransformationKind.normative
  | TransformationFamily.projection     => TransformationKind.observational
  | TransformationFamily.replication    => TransformationKind.observational
  | TransformationFamily.reorganization => TransformationKind.organizational
  | TransformationFamily.scaling        => TransformationKind.structural
  | TransformationFamily.versioning     => TransformationKind.temporal

-- RR.DEFINES: TR.DEF.OPERATOR_KIND
/--
The transformation kind for an operator code.

The result is derived transitively through `operatorFamily` and `familyKind`;
it is not an independent classification.
-/
def operatorKind (op : OperatorCode) : TransformationKind :=
  familyKind (operatorFamily op)

-- RR.DEFINES: TR.DEF.OPERATOR_IN_FAMILY
/-- Predicate asserting that operator `op` belongs to family `family`. -/
def OperatorInFamily
    (op : OperatorCode)
    (family : TransformationFamily) :
    Prop :=
  operatorFamily op = family

-- RR.DEFINES: TR.DEF.OPERATOR_IN_KIND
/-- Predicate asserting that operator `op` belongs to kind `kind`. -/
def OperatorInKind
    (op : OperatorCode)
    (kind : TransformationKind) :
    Prop :=
  operatorKind op = kind

end

end SE.Transformation
