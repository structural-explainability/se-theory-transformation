/-!

# Operator Codes

SETheoryTransformation/Operator/Codes.lean

ASCII-safe operator codes for transformation theory.

These codes name kinds of change.
They do not determine persistence.
-/

namespace SETheoryTransformation

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

end SETheoryTransformation
