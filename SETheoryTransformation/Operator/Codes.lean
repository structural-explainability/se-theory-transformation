/-!

# Operator Codes

SETheoryTransformation/Operator/Codes.lean

ASCII-safe operator codes for transformation theory.

These codes name kinds of change. They do not determine persistence.
-/

namespace SETheoryTransformation

inductive OperatorCode where
  | CP
  | PR
  | EM
  | RF
  | RO
  | SP
  | MG
  | CL
  | EX
  | SH
  | VS
  | BR
  | RV
  | BD
  | UB
  | AZ
  | AT
deriving DecidableEq, Repr

end SETheoryTransformation
