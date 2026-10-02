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

`OperatorInFamily` and `OperatorInKind` are the Prop-valued membership
predicates for downstream proofs, for example statements of the form
"every operator in family `f` satisfies `P`". They are definitionally the
equations `operatorFamily op = family` and `operatorKind op = kind`, and are
decidable. `operatorsInFamily`, `operatorsInKind` and `familiesInKind` in
`SE.Transformation.Registry` are the computational counterparts.
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
/--
Predicate asserting that operator `op` belongs to family `family`.

This is the Prop-valued form of the authoritative mapping `operatorFamily`:
it holds exactly when `operatorFamily op = family`
(`operatorInFamily_iff`).
Downstream proofs should state "for every operator
in family `family`" with this predicate,
so the statement does not depend on
how the mapping is represented.
It is decidable (see the instance below).
-/
def OperatorInFamily
    (op : OperatorCode)
    (family : TransformationFamily) :
    Prop :=
  operatorFamily op = family

-- RR.DEFINES: TR.DEF.OPERATOR_IN_KIND
/--
Predicate asserting that operator `op` belongs to kind `kind`.

This is the Prop-valued form of the derived mapping `operatorKind`: it holds
exactly when `operatorKind op = kind` (`operatorInKind_iff`).
Membership in a kind follows from membership in a family of that kind
(`operatorInKind_of_operatorInFamily`).
It is decidable (see the instance below).
-/
def OperatorInKind
    (op : OperatorCode)
    (kind : TransformationKind) :
    Prop :=
  operatorKind op = kind

-- RR.DEFINES: TR.THM.OPERATOR_IN_FAMILY_IFF
/-- `OperatorInFamily op family` unfolds to `operatorFamily op = family`. -/
theorem operatorInFamily_iff {op : OperatorCode} {f : TransformationFamily} :
    OperatorInFamily op f ↔ operatorFamily op = f := Iff.rfl

-- RR.DEFINES: TR.THM.OPERATOR_IN_KIND_IFF
/-- `OperatorInKind op kind` unfolds to `operatorKind op = kind`. -/
theorem operatorInKind_iff {op : OperatorCode} {k : TransformationKind} :
    OperatorInKind op k ↔ operatorKind op = k := Iff.rfl

-- RR.DEFINES: TR.THM.OPERATOR_IN_KIND_OF_OPERATOR_IN_FAMILY
/--
An operator in a family is in the kind of that family.

This is the operator, family and kind layering stated as a lemma: if `op` is
in `family` and `familyKind family = kind`, then `op` is in `kind`.
-/
theorem operatorInKind_of_operatorInFamily {op : OperatorCode}
    {f : TransformationFamily} {k : TransformationKind}
    (hf : OperatorInFamily op f) (hk : familyKind f = k) :
    OperatorInKind op k := by
  unfold OperatorInFamily at hf
  unfold OperatorInKind operatorKind
  rw [hf]; exact hk

/--
Family membership is decidable, so finite statements about operators in a
family can be checked with `decide`.
-/
instance (op : OperatorCode) (f : TransformationFamily) :
    Decidable (OperatorInFamily op f) :=
  inferInstanceAs (Decidable (operatorFamily op = f))

/--
Kind membership is decidable, so finite statements about operators in a kind
can be checked with `decide`.
-/
instance (op : OperatorCode) (k : TransformationKind) :
    Decidable (OperatorInKind op k) :=
  inferInstanceAs (Decidable (operatorKind op = k))
end

end SE.Transformation
