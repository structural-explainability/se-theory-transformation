/-!
# Transformation Family

SETheoryTransformation.Domain.TransformationFamily

Core classification vocabulary for families of transformation.

A transformation family describes a mid-level behavioral category of change.
Families group operators that share similar structural behavior and
belong to exactly one transformation kind.

This module defines classification vocabulary only.
It does not define persistence semantics, regime behavior,
or admissibility criteria.
-/

namespace SETheoryTransformation

/--
Mid-level behavioral category of transformation.

Transformation families organize operators into semantically related
groups of change. Each family belongs to exactly one TransformationKind.
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

end SETheoryTransformation
