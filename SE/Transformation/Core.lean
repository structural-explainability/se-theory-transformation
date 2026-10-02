/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Transformation.Domain.Operator.Semantics
public import SE.Transformation.Domain.TransformationFamily
public import SE.Transformation.Domain.TransformationKind
public import SE.Transformation.Relation.Composition
public import SE.Transformation.Relation.Orthogonality

/-!
# Core

Core aggregator for the Transformation theory.

Imports the operator taxonomy and relation definitions
required by downstream consumers of this theory.

This module does not define persistence semantics, regime behavior,
or admissibility criteria.
-/
