module

public import SE.Transformation.Domain.Operator.Admissibility

/-!
# Admissibility checks

SE.Transformation.Tests.Admissibility
-/

namespace SE.Transformation

@[expose] public section

example : OperatorAdmissible OperatorCode.CP := by
  trivial

example : OperatorAdmissible OperatorCode.AZ := by
  trivial

end

end SE.Transformation
