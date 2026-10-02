/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Relation.Composition

/-!
# Composition Reference

SE.Transformation.Reference.Composition

Canonical seed rules for transformation operator composition.

These rules specify the composition relation for known operator pairs.
Additional rules may be added as the operator catalog grows.
-/

namespace SE.Transformation

@[expose] public section

-- RR.DEFINES: TR.RULE.AUTHORIZE_THEN_ATTEST


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

-- RR.DEFINES: TR.RULE.BIND_THEN_UNBIND
/-- Bind followed by unbind: establishes then removes a bearer association. -/
def bindThenUnbind : CompositionRule :=
  {
    left     := OperatorCode.BD
    right    := OperatorCode.UB
    relation := CompositionRelation.inverseLike
  }

-- RR.DEFINES: TR.RULE.SPLIT_THEN_MERGE
/-- Split followed by merge: divides then recombines a structure. -/
def splitThenMerge : CompositionRule :=
  {
    left     := OperatorCode.SP
    right    := OperatorCode.MG
    relation := CompositionRelation.inverseLike
  }

end

end SE.Transformation
