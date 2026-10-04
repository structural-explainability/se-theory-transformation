/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module -- shake: keep-all

public import SE.Transformation.Effect.Dimension
public import SE.Transformation.Effect.Model
public import SE.Transformation.Effect.Orthogonality
public import SE.Transformation.Effect.Composition
public import SE.Transformation.Effect.Sequence
public import SE.Transformation.Effect.Coherence

/-!
# Effect Semantics

Public import surface for the effect semantics of the Transformation
operators: effect dimensions, operator footprints and required-change clauses,
the abstract state model, the generic preservation and breakage results that
follow from them, and sequences of atomic steps.
-/
