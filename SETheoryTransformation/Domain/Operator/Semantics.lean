import SETheoryTransformation.Domain.Operator.Codes
import SETheoryTransformation.Domain.TransformationFamily
import SETheoryTransformation.Domain.TransformationKind

/-!
# Operator Semantics

SETheoryTransformation.Domain.Operator.Semantics

Semantic classification for transformation operators.

This module assigns each operator to its transformation family
and derives its transformation kind transitively through familyKind.
It does not define persistence behavior.
-/

namespace SETheoryTransformation

/--
The transformation family for each operator code.

Each operator belongs to exactly one family.
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

/--
The transformation kind for each family.

Each family belongs to exactly one kind.
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

/--
The transformation kind for each operator code.

Derived transitively from `operatorFamily` and `familyKind`.
Not independently asserted.
-/
def operatorKind : OperatorCode → TransformationKind :=
  familyKind ∘ operatorFamily

/--
Predicate: operator `op` belongs to family `f`.
-/
def OperatorInFamily (op : OperatorCode) (f : TransformationFamily) : Prop :=
  operatorFamily op = f

/--
Predicate: operator `op` belongs to kind `k`.

Holds transitively: op → family → kind.
-/
def OperatorInKind (op : OperatorCode) (k : TransformationKind) : Prop :=
  operatorKind op = k

end SETheoryTransformation
