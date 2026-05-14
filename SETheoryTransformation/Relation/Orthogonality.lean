import SETheoryTransformation.Domain.Operator.Codes

/-!
# Orthogonality

SETheoryTransformation.Relation.Orthogonality

Orthogonality relations for transformation operators.

This module describes structural independence among operators.
It does not assert persistence.
-/

namespace SETheoryTransformation

/--
Relationship describing the degree of structural independence between
two transformation operators.

Orthogonality is symmetric: the relation for {left, right} is the same
as for {right, left}. It is about independence only. It does not decide
whether identity, meaning, obligation, evidence, context, or persistence
survives either operation.
-/
inductive OrthogonalityRelation where
  /-- The operators cannot be applied in the same context without contradiction. -/
  | conflicting

  /-- One operator's applicability depends on the other. -/
  | dependent

  /-- The operators stand in a symmetric inverse structural relationship. -/
  | inverseLike

  /-- The operators have no shared effect domain and do not interfere. -/
  | orthogonal

  /-- The operators share a partial effect domain. -/
  | overlapping

  /-- The orthogonality relation is unresolved or intentionally unspecified. -/
  | unknown

deriving DecidableEq, Repr

/--
An orthogonality rule over two transformation operators.

`left` and `right` name the operator pair.
The pair is unordered: orthogonality is symmetric.
`relation` describes the structural independence relationship.
-/
structure OrthogonalityRule where
  left     : OperatorCode
  right    : OperatorCode
  relation : OrthogonalityRelation
deriving Repr

end SETheoryTransformation
