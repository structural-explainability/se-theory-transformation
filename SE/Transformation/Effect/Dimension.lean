/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Domain.Operator.Codes

/-!
# Effect Dimensions

Effect dimensions name the aspects of a referent that an operator may change.

`footprint op` is the set of dimensions that `op` may change.
It is an upper bound: dimensions outside it are unchanged by `op`.

`characteristic op` is the dimension that `op` is defined by changing,
when one exists.
Every characteristic dimension lies in the footprint.

Each footprint below was read from the prose description
of the operator in `reference/transformation-operators.toml`.
Where the description does not narrow the effect,
the footprint is deliberately wide.
A wide footprint is sound for every result
that depends on what an operator leaves unchanged.
-/

set_option autoImplicit false

namespace SE.Transformation
@[expose] public section

-- RR.DEFINES: TR.TYPE.DIMENSION
/-- An aspect of a referent that an operator may change. -/
inductive Dimension where
  /-- What the referent says or describes, including its level of detail. -/
  | content
  /-- Internal arrangement, nesting, and structural scale. -/
  | organization
  /-- Which components or parts the referent comprises. -/
  | composition
  /-- The set of cases, subjects, or situations the referent covers. -/
  | extent
  /-- The ordering of its components. -/
  | order
  /-- The enclosing structure in which the referent is placed. -/
  | containment
  /-- Its association with a context, bearer, scope, or applicability setting. -/
  | binding
  /-- Its relations to other referents. -/
  | association
  /-- Its version, derivation, and continuation history. -/
  | lineage
  /-- Attached claims, verification, and attestation metadata. -/
  | evidence
  /-- Permission, authority, or normative standing attached to it. -/
  | standing
  /-- The representation or artifact that bears it. -/
  | carrier
deriving DecidableEq, Repr

-- RR.DEFINES: TR.DEF.ALL_DIMENSIONS
/-- Every effect dimension. -/
def allDimensions : List Dimension :=
  [ .content, .organization, .composition, .extent, .order, .containment,
    .binding, .association, .lineage, .evidence, .standing, .carrier ]

-- RR.DEFINES: TR.DEF.FOOTPRINT
/--
The dimensions an operator may change.

`RV` and `VS` have the widest footprint because a prior or successor version
may differ from the current one in any dimension, and the descriptions do not
narrow that.
-/
def footprint : OperatorCode → List Dimension
  | .AT => [.evidence]
  | .AZ => [.standing]
  | .BD => [.binding, .extent]
  | .BR => [.lineage]
  | .CL => [.organization, .content]
  | .CP => [.carrier]
  | .EM => [.containment]
  | .EX => [.organization, .content]
  | .LK => [.association]
  | .MG => [.composition, .organization, .extent, .content]
  | .PR => [.content, .organization, .carrier]
  | .RO => [.order]
  | .RV => allDimensions
  | .SH => [.binding, .association, .containment]
  | .SP => [.composition, .organization]
  | .UB => [.binding, .extent]
  | .VS => allDimensions

-- RR.DEFINES: TR.DEF.CHARACTERISTIC
/--
The dimension an operator is defined by changing, when its description names
one. `SH` has none because its description lists alternatives: a relation,
bearer, context, or position.
-/
def characteristic : OperatorCode → Option Dimension
  | .AT => some .evidence
  | .AZ => some .standing
  | .BD => some .binding
  | .BR => some .lineage
  | .CL => some .organization
  | .CP => some .carrier
  | .EM => some .containment
  | .EX => some .organization
  | .LK => some .association
  | .MG => some .composition
  | .PR => some .content
  | .RO => some .order
  | .RV => some .lineage
  | .SH => none
  | .SP => some .composition
  | .UB => some .binding
  | .VS => some .lineage

-- RR.DEFINES: TR.THM.CHARACTERISTIC_MEM_FOOTPRINT
/-- The characteristic dimension of an operator is in its footprint. -/
theorem characteristic_mem_footprint (op : OperatorCode) (d : Dimension)
    (h : characteristic op = some d) : d ∈ footprint op := by
  cases op <;> simp [characteristic] at h <;> subst h <;> decide

end
end SE.Transformation
