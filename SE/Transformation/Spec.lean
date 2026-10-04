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

/-- Stable citation identifier for the `Dimension` type. -/
def TR_TYPE_DIMENSION : String :=
  "TR.TYPE.DIMENSION"
/-- Stable citation identifier for the `StateModel` structure. -/
def TR_TYPE_STATE_MODEL : String :=
  "TR.TYPE.STATE_MODEL"

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

/-- Stable citation identifier for `referenceDimensions`. -/
def TR_DEF_REFERENCE_DIMENSIONS : String :=
  "TR.DEF.REFERENCE_DIMENSIONS"
/-- Stable citation identifier for `footprint`. -/
def TR_DEF_FOOTPRINT : String :=
  "TR.DEF.FOOTPRINT"
/-- Stable citation identifier for `requirements`. -/
def TR_DEF_REQUIREMENTS : String :=
  "TR.DEF.REQUIREMENTS"
/-- Stable citation identifier for `characteristic`. -/
def TR_DEF_CHARACTERISTIC : String :=
  "TR.DEF.CHARACTERISTIC"
/-- Stable citation identifier for `StateModel.AgreementSuffices`. -/
def TR_DEF_AGREEMENT_SUFFICES : String :=
  "TR.DEF.AGREEMENT_SUFFICES"
/-- Stable citation identifier for `StateModel.AgreementRequired`. -/
def TR_DEF_AGREEMENT_REQUIRED : String :=
  "TR.DEF.AGREEMENT_REQUIRED"
/-- Stable citation identifier for `maximalModel`. -/
def TR_DEF_MAXIMAL_MODEL : String :=
  "TR.DEF.MAXIMAL_MODEL"
/-- Stable citation identifier for `EffectsDisjoint`. -/
def TR_DEF_EFFECTS_DISJOINT : String :=
  "TR.DEF.EFFECTS_DISJOINT"
/-- Stable citation identifier for `EffectsOverlap`. -/
def TR_DEF_EFFECTS_OVERLAP : String :=
  "TR.DEF.EFFECTS_OVERLAP"
/-- Stable citation identifier for `RestoresOn`. -/
def TR_DEF_RESTORES_ON : String :=
  "TR.DEF.RESTORES_ON"

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

/-- Stable citation identifier for `requirements_ne_nil`. -/
def TR_THM_REQUIREMENTS_NE_NIL : String :=
  "TR.THM.REQUIREMENTS_NE_NIL"
/-- Stable citation identifier for `requirements_clause_ne_nil`. -/
def TR_THM_REQUIREMENTS_CLAUSE_NE_NIL : String :=
  "TR.THM.REQUIREMENTS_CLAUSE_NE_NIL"
/-- Stable citation identifier for `requirements_subset_footprint`. -/
def TR_THM_REQUIREMENTS_SUBSET_FOOTPRINT : String :=
  "TR.THM.REQUIREMENTS_SUBSET_FOOTPRINT"
/-- Stable citation identifier for `characteristic_eq_some_iff`. -/
def TR_THM_CHARACTERISTIC_EQ_SOME_IFF : String :=
  "TR.THM.CHARACTERISTIC_EQ_SOME_IFF"
/-- Stable citation identifier for `StateModel.step_preserves`. -/
def TR_THM_STEP_PRESERVES : String :=
  "TR.THM.STEP_PRESERVES"
/-- Stable citation identifier for `StateModel.step_breaks`. -/
def TR_THM_STEP_BREAKS : String :=
  "TR.THM.STEP_BREAKS"
/-- Stable citation identifier for `maximalModel_step_exists`. -/
def TR_THM_MAXIMAL_MODEL_STEP_EXISTS : String :=
  "TR.THM.MAXIMAL_MODEL_STEP_EXISTS"
/-- Stable citation identifier for `maximalModel_breaks_agreementOn_iff`. -/
def TR_THM_MAXIMAL_MODEL_BREAKS_IFF : String :=
  "TR.THM.MAXIMAL_MODEL_BREAKS_IFF"
/-- Stable citation identifier for `effectsDisjoint_iff`. -/
def TR_THM_EFFECTS_DISJOINT_IFF : String :=
  "TR.THM.EFFECTS_DISJOINT_IFF"
/-- Stable citation identifier for `StateModel.step_preserves_of_effectsDisjoint`. -/
def TR_THM_STEP_PRESERVES_OF_EFFECTS_DISJOINT : String :=
  "TR.THM.STEP_PRESERVES_OF_EFFECTS_DISJOINT"
/-- Stable citation identifier for `declared_orthogonal_effects_disjoint`. -/
def TR_THM_DECLARED_ORTHOGONAL_EFFECTS_DISJOINT : String :=
  "TR.THM.DECLARED_ORTHOGONAL_EFFECTS_DISJOINT"
/-- Stable citation identifier for `declared_overlapping_effects_overlap`. -/
def TR_THM_DECLARED_OVERLAPPING_EFFECTS_OVERLAP : String :=
  "TR.THM.DECLARED_OVERLAPPING_EFFECTS_OVERLAP"
/-- Stable citation identifier for `restoration_needs_footprint`. -/
def TR_THM_RESTORATION_NEEDS_FOOTPRINT : String :=
  "TR.THM.RESTORATION_NEEDS_FOOTPRINT"
/-- Stable citation identifier for `declared_inverseLike_footprint_necessary`. -/
def TR_THM_DECLARED_INVERSE_LIKE_FOOTPRINT_NECESSARY : String :=
  "TR.THM.DECLARED_INVERSE_LIKE_FOOTPRINT_NECESSARY"

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
