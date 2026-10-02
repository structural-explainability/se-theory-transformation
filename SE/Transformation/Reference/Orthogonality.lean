/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Relation.Orthogonality

/-!
# Orthogonality Reference

SE.Transformation.Reference.Orthogonality

Canonical seed rules for transformation operator orthogonality.

These rules specify the orthogonality relation for known operator pairs.
The pair is unordered: {left, right} and {right, left} carry the same relation.
Additional rules may be added as the operator catalog grows.
-/

namespace SE.Transformation

@[expose] public section

-- RR.DEFINES: TR.RULE.AUTHORIZE_AND_ATTEST
/-- Authorization and attestation: distinct effect domains, no structural interference.
    Note: AZ and AT also appear as composable in Reference.Composition.
    Orthogonal (distinct domains) and composable (meaningful sequence)
    are not contradictory. AZ affects normative status; AT records a claim. -/
def authorizeAndAttest : OrthogonalityRule :=
  {
    left     := OperatorCode.AZ
    right    := OperatorCode.AT
    relation := OrthogonalityRelation.orthogonal
  }
-- RR.DEFINES: TR.RULE.PROJECT_AND_COLLAPSE
/-- Project and collapse: both reduce structural complexity, partial shared domain. -/
def projectAndCollapse : OrthogonalityRule :=
  {
    left     := OperatorCode.PR
    right    := OperatorCode.CL
    relation := OrthogonalityRelation.overlapping
  }

-- RR.DEFINES: TR.RULE.SPLIT_AND_MERGE
/-- Split and merge: structural inverses with symmetric opposing directions. -/
def splitAndMerge : OrthogonalityRule :=
  {
    left     := OperatorCode.SP
    right    := OperatorCode.MG
    relation := OrthogonalityRelation.inverseLike
  }

end

end SE.Transformation
