import SETheoryTransformation.Domain.Operator.Codes

/-!
# Operator Labels

SETheoryTransformation.Domain.Operator.Labels

Official ASCII-safe string labels for transformation operators.

Labels are short human-readable names for operator codes.
They do not define persistence semantics.
-/

namespace SETheoryTransformation

/-- Official short label for each transformation operator. -/
def operatorCodeLabel : OperatorCode → String
  | OperatorCode.AT => "attest"
  | OperatorCode.AZ => "authorize"
  | OperatorCode.BD => "bind"
  | OperatorCode.BR => "branch"
  | OperatorCode.CL => "collapse"
  | OperatorCode.CP => "copy"
  | OperatorCode.EM => "embed"
  | OperatorCode.EX => "expand"
  | OperatorCode.LK => "link"
  | OperatorCode.MG => "merge"
  | OperatorCode.PR => "project"
  | OperatorCode.RO => "reorder"
  | OperatorCode.RV => "revert"
  | OperatorCode.SH => "shift"
  | OperatorCode.SP => "split"
  | OperatorCode.UB => "unbind"
  | OperatorCode.VS => "version"

end SETheoryTransformation
