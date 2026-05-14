import SETheoryTransformation.Relation.Composition

/-!
# Composition Reference

SETheoryTransformation.Reference.Composition

Canonical seed rules for transformation operator composition.

These rules specify the composition relation for known operator pairs.
Additional rules may be added as the operator catalog grows.
-/

namespace SETheoryTransformation

/-- Authorization followed by attestation: applies a normative condition
    then records a verified claim about it. -/
def authorizeThenAttest : CompositionRule :=
  {
    left     := OperatorCode.AZ
    right    := OperatorCode.AT
    -- Note: AZ and AT are also classified as orthogonal in Reference.Orthogonality.
    -- Composable (meaningful sequence) and orthogonal (distinct effect domains)
    -- are not contradictory. AZ affects normative status; AT records a claim.
    relation := CompositionRelation.composable
  }

/-- Bind followed by unbind: establishes then removes a bearer association. -/
def bindThenUnbind : CompositionRule :=
  {
    left     := OperatorCode.BD
    right    := OperatorCode.UB
    relation := CompositionRelation.inverseLike
  }

/-- Split followed by merge: divides then recombines a structure. -/
def splitThenMerge : CompositionRule :=
  {
    left     := OperatorCode.SP
    right    := OperatorCode.MG
    relation := CompositionRelation.inverseLike
  }

end SETheoryTransformation
