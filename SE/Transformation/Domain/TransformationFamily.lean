/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

set_option autoImplicit false

namespace SE.Transformation

public section

-- RR.DEFINES: TR.TYPE.TRANSFORMATION_FAMILY
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
