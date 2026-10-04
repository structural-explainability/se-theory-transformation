/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

/-!
# Operator Codes

ASCII-safe operator codes for Transformation theory.

These codes name kinds of change.
-/

set_option autoImplicit false

namespace SE.Transformation

public section

-- RR.DEFINES: TR.TYPE.OPERATOR_CODE
/--
Canonical two-letter code identifying a transformation operator.
-/
inductive OperatorCode where
  | AT
  | AZ
  | BD
  | BR
  | CL
  | CP
  | EM
  | EX
  | LK
  | MG
  | PR
  | RO
  | RV
  | SH
  | SP
  | UB
  | VS
deriving DecidableEq, Repr

end

end SE.Transformation
