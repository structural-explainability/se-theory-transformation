module

set_option autoImplicit false

namespace SE.Transformation

public section

/--
Mid-level behavioral category grouping transformation operators by shared
structural behavior.
-/
inductive TransformationFamily where
  | aggregation
  | association
  | attestation
  | branching
  | containment
  | contextual
  | decomposition
  | migration
  | normative
  | projection
  | replication
  | reorganization
  | scaling
  | versioning
deriving DecidableEq, Repr

end

end SE.Transformation
