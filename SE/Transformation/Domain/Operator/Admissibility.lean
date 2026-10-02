/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Domain.Operator.Codes

/-!
# Operator Admissibility

SE.Transformation.Domain.Operator.Admissibility

Initial admissibility vocabulary for transformation operators.

This module provides only a placeholder predicate.
Specific admissibility rules belong in later theory.
-/

namespace SE.Transformation

@[expose] public section

def OperatorAdmissible (_op : OperatorCode) : Prop :=
  True

end

end SE.Transformation
