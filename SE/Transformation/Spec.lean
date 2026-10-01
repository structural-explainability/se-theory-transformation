/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

/-!
# Transformation Specification

Stable citation identifiers for the Transformation theory.
-/

namespace SE.Transformation.Spec

public section

-- ============================================================
-- TYPES
-- ============================================================

/-- Stable citation identifier for the `OperatorCode` type. -/
def TR_TYPE_OPERATOR_CODE : String :=
  "TR.TYPE.OPERATOR_CODE"

/-- Stable citation identifier for the `TransformationFamily` type. -/
def TR_TYPE_TRANSFORMATION_FAMILY : String :=
  "TR.TYPE.TRANSFORMATION_FAMILY"

/-- Stable citation identifier for the `TransformationKind` type. -/
def TR_TYPE_TRANSFORMATION_KIND : String :=
  "TR.TYPE.TRANSFORMATION_KIND"

/-- Stable citation identifier for the `TransformationOutcome` type. -/
def TR_TYPE_TRANSFORMATION_OUTCOME : String :=
  "TR.TYPE.TRANSFORMATION_OUTCOME"

/-- Stable citation identifier for the `CompositionRelation` type. -/
def TR_TYPE_COMPOSITION_RELATION : String :=
  "TR.TYPE.COMPOSITION_RELATION"

/-- Stable citation identifier for the `CompositionRule` type. -/
def TR_TYPE_COMPOSITION_RULE : String :=
  "TR.TYPE.COMPOSITION_RULE"

/-- Stable citation identifier for the `OrthogonalityRelation` type. -/
def TR_TYPE_ORTHOGONALITY_RELATION : String :=
  "TR.TYPE.ORTHOGONALITY_RELATION"

/-- Stable citation identifier for the `OrthogonalityRule` type. -/
def TR_TYPE_ORTHOGONALITY_RULE : String :=
  "TR.TYPE.ORTHOGONALITY_RULE"

-- ============================================================
-- DEFINITIONS
-- ============================================================

/-- Stable citation identifier for `operatorCodeLabel`. -/
def TR_DEF_OPERATOR_CODE_LABEL : String :=
  "TR.DEF.OPERATOR_CODE_LABEL"

/-- Stable citation identifier for `operatorFamily`. -/
def TR_DEF_OPERATOR_FAMILY : String :=
  "TR.DEF.OPERATOR_FAMILY"

/-- Stable citation identifier for `familyKind`. -/
def TR_DEF_FAMILY_KIND : String :=
  "TR.DEF.FAMILY_KIND"

/-- Stable citation identifier for `operatorKind`. -/
def TR_DEF_OPERATOR_KIND : String :=
  "TR.DEF.OPERATOR_KIND"

/-- Stable citation identifier for `OperatorInFamily`. -/
def TR_DEF_OPERATOR_IN_FAMILY : String :=
  "TR.DEF.OPERATOR_IN_FAMILY"

/-- Stable citation identifier for `OperatorInKind`. -/
def TR_DEF_OPERATOR_IN_KIND : String :=
  "TR.DEF.OPERATOR_IN_KIND"

-- ============================================================
-- REFERENCE RULES
-- ============================================================

/-- Stable citation identifier for the authorize-then-attest composition rule. -/
def TR_RULE_AUTHORIZE_THEN_ATTEST : String :=
  "TR.RULE.AUTHORIZE_THEN_ATTEST"

/-- Stable citation identifier for the bind-then-unbind composition rule. -/
def TR_RULE_BIND_THEN_UNBIND : String :=
  "TR.RULE.BIND_THEN_UNBIND"

/-- Stable citation identifier for the split-then-merge composition rule. -/
def TR_RULE_SPLIT_THEN_MERGE : String :=
  "TR.RULE.SPLIT_THEN_MERGE"

/-- Stable citation identifier for the authorize-and-attest orthogonality rule. -/
def TR_RULE_AUTHORIZE_AND_ATTEST : String :=
  "TR.RULE.AUTHORIZE_AND_ATTEST"

/-- Stable citation identifier for the project-and-collapse orthogonality rule. -/
def TR_RULE_PROJECT_AND_COLLAPSE : String :=
  "TR.RULE.PROJECT_AND_COLLAPSE"

/-- Stable citation identifier for the split-and-merge orthogonality rule. -/
def TR_RULE_SPLIT_AND_MERGE : String :=
  "TR.RULE.SPLIT_AND_MERGE"

end

end SE.Transformation.Spec
