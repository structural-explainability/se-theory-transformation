import SETheoryTransformation.Domain.Operator.Semantics
import SETheoryTransformation.Domain.TransformationFamily
import SETheoryTransformation.Domain.TransformationKind

/-!
# Specification

SETheoryTransformation.Spec

Formal requirement identifiers for the transformation taxonomy.

Each Req_TR_* definition names a design invariant the taxonomy must
satisfy. Conformance.lean maps each identifier to its formal predicate
and provides evidence of satisfaction.
-/

namespace SETheoryTransformation.Spec

open SETheoryTransformation

/-- Each operator code maps to exactly one transformation family. -/
def Req_TR_TAXONOMY_OPERATOR_FAMILY_UNIQUE (op : OperatorCode) : Prop :=
  ∃ f : TransformationFamily, operatorFamily op = f ∧ ∀ f' : TransformationFamily, operatorFamily op = f' → f' = f

/-- Each transformation family maps to exactly one transformation kind. -/
def Req_TR_TAXONOMY_FAMILY_KIND_UNIQUE (f : TransformationFamily) : Prop :=
  ∃ k : TransformationKind, familyKind f = k ∧ ∀ k' : TransformationKind, familyKind f = k' → k' = k

/-- operatorKind is the composition of operatorFamily and familyKind. -/
def Req_TR_TAXONOMY_KIND_DERIVED (op : OperatorCode) : Prop :=
  operatorKind op = familyKind (operatorFamily op)

/-- Operators sharing a family always share a kind. -/
def Req_TR_TAXONOMY_SAME_FAMILY_SAME_KIND (op1 op2 : OperatorCode) : Prop :=
  operatorFamily op1 = operatorFamily op2 → operatorKind op1 = operatorKind op2

/-- Every transformation kind has at least one operator. -/
def Req_TR_TAXONOMY_ALL_KINDS_INHABITED (k : TransformationKind) : Prop :=
  ∃ op : OperatorCode, operatorKind op = k

/-- Every transformation kind has at least one family. -/
def Req_TR_TAXONOMY_ALL_KINDS_HAVE_FAMILY (k : TransformationKind) : Prop :=
  ∃ f : TransformationFamily, familyKind f = k

end SETheoryTransformation.Spec
