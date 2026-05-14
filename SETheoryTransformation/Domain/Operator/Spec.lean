import SETheoryTransformation.Domain.Operator.Codes
import SETheoryTransformation.Domain.Operator.Labels
import SETheoryTransformation.Domain.TransformationKind

/-!
# Operator Spec

SETheoryTransformation.Domain.Operator.Spec

Official short human-readable specifications for transformation operators.

These specifications define operator meaning at the vocabulary layer.
They describe kinds of change only.

They do not define persistence semantics, regime behavior,
or domain-specific survival criteria.
-/

namespace SETheoryTransformation

/-- Human-readable specification for a transformation operator. -/
structure OperatorSpec where
  code : OperatorCode
  label : String
  family : TransformationKind
  summary : String
deriving Repr

/-- Specification for CP: copy. -/
def copyOperator : OperatorSpec :=
  {
    code := OperatorCode.CP
    label := operatorCodeLabel OperatorCode.CP
    family := TransformationKind.structural
    summary := "Duplicate a representation without transferring or terminating the source."
  }

/-- Specification for PR: project. -/
def projectOperator : OperatorSpec :=
  {
    code := OperatorCode.PR
    label := operatorCodeLabel OperatorCode.PR
    family := TransformationKind.structural
    summary := "Expose a selected view while omitting other structure."
  }

/-- Specification for EM: embed. -/
def embedOperator : OperatorSpec :=
  {
    code := OperatorCode.EM
    label := operatorCodeLabel OperatorCode.EM
    family := TransformationKind.structural
    summary := "Place a structure inside a larger containing structure."
  }

/-- Specification for RF: reference. -/
def referenceOperator : OperatorSpec :=
  {
    code := OperatorCode.RF
    label := operatorCodeLabel OperatorCode.RF
    family := TransformationKind.structural
    summary := "Create an indirect pointer or citation to another structure."
  }

/-- Specification for RO: reorder. -/
def reorderOperator : OperatorSpec :=
  {
    code := OperatorCode.RO
    label := operatorCodeLabel OperatorCode.RO
    family := TransformationKind.structural
    summary := "Rearrange structure without adding or removing declared parts."
  }

/-- Specification for SP: split. -/
def splitOperator : OperatorSpec :=
  {
    code := OperatorCode.SP
    label := operatorCodeLabel OperatorCode.SP
    family := TransformationKind.decomposition
    summary := "Separate one structure into multiple derived structures."
  }

/-- Specification for MG: merge. -/
def mergeOperator : OperatorSpec :=
  {
    code := OperatorCode.MG
    label := operatorCodeLabel OperatorCode.MG
    family := TransformationKind.aggregation
    summary := "Combine multiple structures into one derived structure."
  }

/-- Specification for CL: collapse. -/
def collapseOperator : OperatorSpec :=
  {
    code := OperatorCode.CL
    label := operatorCodeLabel OperatorCode.CL
    family := TransformationKind.compression
    summary := "Compress structure into a reduced representation."
  }

/-- Specification for EX: expand. -/
def expandOperator : OperatorSpec :=
  {
    code := OperatorCode.EX
    label := operatorCodeLabel OperatorCode.EX
    family := TransformationKind.elaboration
    summary := "Expose or generate additional internal structure from a prior representation."
  }

/-- Specification for SH: shift. -/
def shiftOperator : OperatorSpec :=
  {
    code := OperatorCode.SH
    label := operatorCodeLabel OperatorCode.SH
    family := TransformationKind.relocation
    summary := "Move structure across time, location, context, or frame."
  }

/-- Specification for VS: version. -/
def versionOperator : OperatorSpec :=
  {
    code := OperatorCode.VS
    label := operatorCodeLabel OperatorCode.VS
    family := TransformationKind.evolution
    summary := "Create a controlled successor state with declared lineage."
  }

/-- Specification for BR: branch. -/
def branchOperator : OperatorSpec :=
  {
    code := OperatorCode.BR
    label := operatorCodeLabel OperatorCode.BR
    family := TransformationKind.evolution
    summary := "Create multiple divergent continuities from a source."
  }

/-- Specification for RV: revert. -/
def revertOperator : OperatorSpec :=
  {
    code := OperatorCode.RV
    label := operatorCodeLabel OperatorCode.RV
    family := TransformationKind.evolution
    summary := "Return toward a prior declared state."
  }

/-- Specification for BD: bind. -/
def bindOperator : OperatorSpec :=
  {
    code := OperatorCode.BD
    label := operatorCodeLabel OperatorCode.BD
    family := TransformationKind.contextual
    summary := "Attach a constraint, condition, context, or dependency."
  }

/-- Specification for UB: unbind. -/
def unbindOperator : OperatorSpec :=
  {
    code := OperatorCode.UB
    label := operatorCodeLabel OperatorCode.UB
    family := TransformationKind.contextual
    summary := "Remove a constraint, condition, context, or dependency."
  }

/-- Specification for AZ: authorize. -/
def authorizeOperator : OperatorSpec :=
  {
    code := OperatorCode.AZ
    label := operatorCodeLabel OperatorCode.AZ
    family := TransformationKind.normative
    summary := "Declare that a transformation pathway is permitted."
  }

/-- Specification for AT: attest. -/
def attestOperator : OperatorSpec :=
  {
    code := OperatorCode.AT
    label := operatorCodeLabel OperatorCode.AT
    family := TransformationKind.observational
    summary := "Assert that a structure, state, or transformation has evidentiary standing."
  }

/-- Official operator specifications. -/
def referenceOperatorSpecs : List OperatorSpec :=
  [
    copyOperator,
    projectOperator,
    embedOperator,
    referenceOperator,
    reorderOperator,
    splitOperator,
    mergeOperator,
    collapseOperator,
    expandOperator,
    shiftOperator,
    versionOperator,
    branchOperator,
    revertOperator,
    bindOperator,
    unbindOperator,
    authorizeOperator,
    attestOperator
  ]

end SETheoryTransformation
