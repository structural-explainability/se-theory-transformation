/-!
# Transformation Outcomes

SETheoryTransformation.Outcome

Outcome vocabulary used when evaluating structural effects.

Persistence-specific interpretation belongs downstream.
-/

namespace SETheoryTransformation

inductive TransformationOutcome where
  | PRS
  | BRK
  | INH
  | IGN
  | MIX
  | UNK
deriving DecidableEq, Repr

end SETheoryTransformation
