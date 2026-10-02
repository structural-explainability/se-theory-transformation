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

/-- Stable citation identifier for the `CompositionRelation` type. -/
def TR_TYPE_COMPOSITION_RELATION : String :=
  "TR.TYPE.COMPOSITION_RELATION"

/-- Stable citation identifier for the `OrthogonalityRelation` type. -/
def TR_TYPE_ORTHOGONALITY_RELATION : String :=
  "TR.TYPE.ORTHOGONALITY_RELATION"

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

/-- Stable citation identifier for `operatorsInFamily`. -/
def TR_DEF_OPERATORS_IN_FAMILY : String :=
  "TR.DEF.OPERATORS_IN_FAMILY"

/-- Stable citation identifier for `operatorsInKind`. -/
def TR_DEF_OPERATORS_IN_KIND : String :=
  "TR.DEF.OPERATORS_IN_KIND"

/-- Stable citation identifier for `familiesInKind`. -/
def TR_DEF_FAMILIES_IN_KIND : String :=
  "TR.DEF.FAMILIES_IN_KIND"

/-- Stable citation identifier for the partial composition lookup. -/
def TR_DEF_COMPOSITION_LOOKUP : String :=
  "TR.DEF.COMPOSITION_LOOKUP"

/-- Stable citation identifier for the partial symmetric orthogonality lookup. -/
def TR_DEF_ORTHOGONALITY_LOOKUP : String :=
  "TR.DEF.ORTHOGONALITY_LOOKUP"

-- ============================================================
-- THEOREMS
-- ============================================================

/-- Stable citation identifier for `operatorInFamily_iff`. -/
def TR_THM_OPERATOR_IN_FAMILY_IFF : String :=
  "TR.THM.OPERATOR_IN_FAMILY_IFF"

/-- Stable citation identifier for `operatorInKind_iff`. -/
def TR_THM_OPERATOR_IN_KIND_IFF : String :=
  "TR.THM.OPERATOR_IN_KIND_IFF"

/-- Stable citation identifier for `operatorInKind_of_operatorInFamily`. -/
def TR_THM_OPERATOR_IN_KIND_OF_OPERATOR_IN_FAMILY : String :=
  "TR.THM.OPERATOR_IN_KIND_OF_OPERATOR_IN_FAMILY"

-- ============================================================
-- REFERENCE RULES
-- ============================================================
-- ============================================================
-- REFERENCE RULES
-- ============================================================

/-- Stable citation identifier for authorization followed by attestation. -/
def TR_RULE_AUTHORIZE_THEN_ATTEST : String :=
  "TR.RULE.AUTHORIZE_THEN_ATTEST"

/-- Stable citation identifier for binding followed by unbinding. -/
def TR_RULE_BIND_THEN_UNBIND : String :=
  "TR.RULE.BIND_THEN_UNBIND"

/-- Stable citation identifier for splitting followed by merging. -/
def TR_RULE_SPLIT_THEN_MERGE : String :=
  "TR.RULE.SPLIT_THEN_MERGE"

/-- Stable citation identifier for authorization and attestation orthogonality. -/
def TR_RULE_AUTHORIZE_AND_ATTEST : String :=
  "TR.RULE.AUTHORIZE_AND_ATTEST"

/-- Stable citation identifier for projection and collapse orthogonality. -/
def TR_RULE_PROJECT_AND_COLLAPSE : String :=
  "TR.RULE.PROJECT_AND_COLLAPSE"

end

end SE.Transformation.Spec
