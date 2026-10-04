/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Domain.Operator.Codes

/-!
# Effect Dimensions

Effect dimensions name the aspects of a transformation configuration that an
operator step may change.

A step is the intrinsic effect of one application of one named operator.
Incidental changes belong to separate operator steps. Properties a result may
later acquire are not effects of the operator that produced it.

- `footprint op` is a conservative upper bound on the dimensions that a step
  of `op` may change. A dimension outside it is preserved by every step.
- `requirements op` is a lower bound: a finite collection of clauses. Every
  clause must be satisfied by every step, and a clause is satisfied when at
  least one of its dimensions changes. Requirements are conjunctions of
  disjunctions.
- `characteristic op` is the single dimension that `op` is defined by
  changing, when its complete requirement is exactly one singleton clause.

Footprints and clauses are lists read as finite sets. Only membership matters:
order and repetition have no semantic significance.
-/

set_option autoImplicit false

namespace SE.Transformation
@[expose] public section

-- RR.DEFINES: TR.TYPE.DIMENSION
/--
An aspect of a transformation configuration.

`content` is multiplicity-insensitive: its agreement compares the sets of
distinct content descriptions the participants carry, so a faithful duplicate
of an already-present description does not by itself change it, while a new
distinct description may. `arrangement` and `composition` are structures
compared modulo the model's agreement equivalence for each.
-/
inductive Dimension where
  /-- The set of distinct content descriptions the participants carry. -/
  | content
  /-- The ordering and relative-position structure among components. -/
  | arrangement
  /-- The part-whole structure of the configuration. -/
  | composition
  /-- Which referents and structural participants exist. -/
  | referentPopulation
  /-- Which representations of a referent exist. -/
  | representationPopulation
  /-- Which enclosing structure each participant is placed in. -/
  | containment
  /-- Associations with contexts, bearers, scopes, and applicability settings. -/
  | binding
  /-- Relations among participants other than containment, binding,
  composition, and lineage. -/
  | association
  /-- Derivational ancestry, continuation and version relations, including
  copy-of, derived-from, successor and version relations, branch continuation,
  and a participant's position in a version chain. -/
  | lineage
  /-- Claims, verification, and attestation metadata attached to participants. -/
  | evidence
  /-- Permission, authority, or normative standing, including its holder and
  scope. -/
  | standing
deriving DecidableEq, Repr

-- RR.DEFINES: TR.DEF.REFERENCE_DIMENSIONS
/-- All effect dimensions in canonical reference order. -/
def referenceDimensions : List Dimension :=
  [ Dimension.content,
    Dimension.arrangement,
    Dimension.composition,
    Dimension.referentPopulation,
    Dimension.representationPopulation,
    Dimension.containment,
    Dimension.binding,
    Dimension.association,
    Dimension.lineage,
    Dimension.evidence,
    Dimension.standing ]

/-- `referenceDimensions` has no duplicates. -/
theorem referenceDimensions_nodup : referenceDimensions.Nodup := by
  decide

/-- Every dimension occurs in `referenceDimensions`. -/
theorem referenceDimensions_complete (d : Dimension) :
    d ∈ referenceDimensions := by
  cases d <;> decide

-- RR.DEFINES: TR.DEF.FOOTPRINT
/--
The dimensions that a step of an operator may change.

A dimension omitted here is a substantive assertion that every step of the
operator preserves it. `MG` and `RV` carry the widest footprints: `MG` because
consuming its inputs removes the facts about them, and `RV` because restoring
a prior version reaches whatever a version captures.
-/
def footprint : OperatorCode → List Dimension
  | OperatorCode.AT => [Dimension.evidence]
  | OperatorCode.AZ => [Dimension.standing]
  | OperatorCode.BD => [Dimension.binding]
  | OperatorCode.BR => [Dimension.lineage]
  | OperatorCode.CL =>
      [Dimension.content, Dimension.composition, Dimension.arrangement]
  | OperatorCode.CP =>
      [ Dimension.referentPopulation, Dimension.representationPopulation,
        Dimension.lineage ]
  | OperatorCode.EM => [Dimension.containment]
  | OperatorCode.EX =>
      [Dimension.content, Dimension.composition, Dimension.arrangement]
  | OperatorCode.LK => [Dimension.association]
  | OperatorCode.MG => referenceDimensions
  | OperatorCode.PR =>
      [ Dimension.content, Dimension.arrangement, Dimension.composition,
        Dimension.representationPopulation, Dimension.lineage ]
  | OperatorCode.RO => [Dimension.arrangement]
  | OperatorCode.RV => referenceDimensions
  | OperatorCode.SH =>
      [ Dimension.binding, Dimension.association, Dimension.containment,
        Dimension.arrangement ]
  | OperatorCode.SP =>
      [ Dimension.content, Dimension.arrangement, Dimension.composition,
        Dimension.referentPopulation ]
  | OperatorCode.UB => [Dimension.binding]
  | OperatorCode.VS =>
      [ Dimension.lineage, Dimension.referentPopulation,
        Dimension.representationPopulation ]

-- RR.DEFINES: TR.DEF.REQUIREMENTS
/--
The required-change condition of an operator: a collection of clauses.

Every step of the operator must satisfy every clause, and a clause is satisfied
by a step that changes at least one of its dimensions. A single multi-member
clause is a genuine alternative; separate clauses are independently mandatory.
-/
def requirements : OperatorCode → List (List Dimension)
  | OperatorCode.AT => [[Dimension.evidence]]
  | OperatorCode.AZ => [[Dimension.standing]]
  | OperatorCode.BD => [[Dimension.binding]]
  | OperatorCode.BR => [[Dimension.lineage]]
  | OperatorCode.CL => [[Dimension.composition, Dimension.arrangement]]
  | OperatorCode.CP =>
      [ [Dimension.referentPopulation, Dimension.representationPopulation],
        [Dimension.lineage] ]
  | OperatorCode.EM => [[Dimension.containment]]
  | OperatorCode.EX =>
      [[Dimension.content, Dimension.composition, Dimension.arrangement]]
  | OperatorCode.LK => [[Dimension.association]]
  | OperatorCode.MG =>
      [[Dimension.composition, Dimension.referentPopulation]]
  | OperatorCode.PR =>
      [[Dimension.representationPopulation], [Dimension.lineage]]
  | OperatorCode.RO => [[Dimension.arrangement]]
  | OperatorCode.RV => [[Dimension.lineage]]
  | OperatorCode.SH =>
      [[ Dimension.binding, Dimension.association, Dimension.containment,
         Dimension.arrangement ]]
  | OperatorCode.SP => [[Dimension.composition]]
  | OperatorCode.UB => [[Dimension.binding]]
  | OperatorCode.VS => [[Dimension.lineage]]

-- RR.DEFINES: TR.DEF.CHARACTERISTIC
/--
The single dimension that an operator is defined by changing.

It exists exactly when the complete required-change condition is the one
clause `{d}`. A singleton clause alongside other mandatory clauses does not
yield a characteristic.
-/
def characteristic (op : OperatorCode) : Option Dimension :=
  match requirements op with
  | [[d]] => some d
  | _ => none

-- RR.DEFINES: TR.THM.REQUIREMENTS_NE_NIL
/-- Every operator has at least one required-change clause. -/
theorem requirements_ne_nil (op : OperatorCode) : requirements op ≠ [] := by
  cases op <;> simp [requirements]

-- RR.DEFINES: TR.THM.REQUIREMENTS_CLAUSE_NE_NIL
/-- Every required-change clause is nonempty. -/
theorem requirements_clause_ne_nil {op : OperatorCode} {C : List Dimension}
    (h : C ∈ requirements op) : C ≠ [] := by
  have key : ∀ C, C ∈ requirements op → C ≠ [] := by
    cases op <;> decide
  exact key C h

-- RR.DEFINES: TR.THM.REQUIREMENTS_SUBSET_FOOTPRINT
/-- Every dimension in a required-change clause lies in the footprint. -/
theorem requirements_subset_footprint {op : OperatorCode} {C : List Dimension}
    (h : C ∈ requirements op) {d : Dimension} (hd : d ∈ C) :
    d ∈ footprint op := by
  have key : ∀ C, C ∈ requirements op → ∀ d, d ∈ C → d ∈ footprint op := by
    cases op <;> decide
  exact key C h d hd

-- RR.DEFINES: TR.THM.CHARACTERISTIC_EQ_SOME_IFF
/-- An operator has characteristic `d` exactly when its complete requirement
is the single clause `{d}`. -/
theorem characteristic_eq_some_iff (op : OperatorCode) (d : Dimension) :
    characteristic op = some d ↔ requirements op = [[d]] := by
  cases op <;> cases d <;> simp [characteristic, requirements]

/-- Representation-independent form of `characteristic_eq_some_iff`: every
clause is satisfied only by changing `d`, and there is at least one clause. -/
theorem characteristic_eq_some_iff_forall (op : OperatorCode) (d : Dimension) :
    characteristic op = some d ↔
      (requirements op ≠ [] ∧ ∀ C, C ∈ requirements op → ∀ x, x ∈ C → x = d) := by
  cases op <;> cases d <;> decide

end
end SE.Transformation
