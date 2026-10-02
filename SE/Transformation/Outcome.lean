/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

/-!
# Transformation Outcomes

Outcome vocabulary used when evaluating structural effects of a
transformation operator.

Persistence-specific interpretation belongs downstream.
-/

namespace SE.Transformation

public section

-- RR.DEFINES: TR.TYPE.TRANSFORMATION_OUTCOME
/--
Possible structural outcome of applying a transformation operator.

PRS, BRK, and IGN align with the three-value classification used in
the identity regime matrix. INH, MIX, and UNK extend that vocabulary
for compound and unresolved cases.
-/
inductive TransformationOutcome where
  /-- The transformation breaks identity. -/
  | BRK

  /-- The transformation has no effect on identity. -/
  | IGN

  /-- The outcome is inherited from a prior or enclosing transformation. -/
  | INH

  /-- The outcome is mixed: identity is preserved in some components,
      broken in others. -/
  | MIX

  /-- The transformation preserves identity. -/
  | PRS

  /-- The outcome is unresolved or intentionally unspecified. -/
  | UNK

deriving DecidableEq, Repr

end

end SE.Transformation
