# Effect Semantics

Effect semantics describe constraints on the intrinsic effects
of atomic transformation operations.

One application of an operator is modeled as an atomic step
between abstract transformation configurations.

## Effect Dimensions

An **effect dimension** is an aspect of a transformation configuration
that an operator step may change.

The current reference dimensions are:

- `content`
- `arrangement`
- `composition`
- `referentPopulation`
- `representationPopulation`
- `containment`
- `binding`
- `association`
- `lineage`
- `evidence`
- `standing`

The authoritative definition is `SE.Transformation.Dimension`
and its canonical enumeration `referenceDimensions`.

## Footprints

`footprint op` is a conservative upper bound on
the dimensions that one atomic step of `op` may change.

If a dimension is outside the footprint,
the frame law requires an `op` step to preserve agreement
on that dimension.

The current footprints are exported with each operator in the
[operator registry](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/operator-registry.json).

## Required Change

`requirements op` is a collection of required-change clauses.

Every clause must be satisfied.
A clause is satisfied when the step changes
at least one dimension in that clause.

Every operator has at least one nonempty clause,
and every dimension appearing in a required clause
also appears in that operator's footprint.

The current requirements are exported with each operator in the
[operator registry](https://github.com/structural-explainability/se-theory-transformation/blob/main/data/transformation/operator-registry.json).

## Characteristic

`characteristic op` is defined only when
the operator's complete required-change condition
is exactly one singleton clause.

It is derived from `requirements`;
it is not an independent operator classification.

## State Model

`StateModel` is an abstract model of transformation configurations.

A model supplies:

- a type of configurations;
- an agreement equivalence for each effect dimension; and
- an atomic step relation for each operator.

Every step satisfies:

- the **frame law**: dimensions outside the operator footprint are preserved; and
- the **required-change law**: every required clause is satisfied.

The theory does not prescribe a concrete representation of configurations.

## Generic Results

The effect semantics support generic reasoning about operator steps.

Frame-based preservation shows that an operator preserves
a relation determined by dimensions outside its footprint.

Required-change breakage shows that an operator breaks
a relation when one of its required clauses consists entirely
of dimensions whose agreement that relation requires.

The maximal model demonstrates that the frame and required-change
constraints are jointly satisfiable.

## Effect Relationships

`EffectsDisjoint` and `EffectsOverlap`
are derived directly from operator footprints.

They are effect-level predicates.
They do not replace the declared orthogonality relation.

The declared orthogonal and overlapping entries are checked
for consistency with these predicates.

## Composition Constraints

The effect semantics also provide necessary conditions
for restoration and inverse-like composition.

These conditions constrain what restoration could require.
They do not establish that any operator pair actually restores
a prior configuration.
