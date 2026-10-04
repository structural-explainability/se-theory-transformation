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

## Interpretive Principles

These principles govern how operator footprints and requirements are assigned.
The operator descriptions are evidence for the assignments.
They are not treated as exhaustive effect specifications.
Family and kind descriptions give context.
They are not inherited by every member.

### Atomic steps

One step is the intrinsic effect of one application of one named operator.
An effect is intrinsic when it is constitutive of the operator or entailed by it.
That covers the facts that make a created result what it is,
such as the relations that make it a copy, a part, or a version.
It also covers the disappearance of facts about participants
that the operator removes.

Incidental changes belong to separate operator steps
or to compound transformations.
Properties that a result may later acquire are not effects of the operator.
A copy may later be bound to a context, carry evidence, or take part
in associations, but none of that is an effect of the copy operator.

New and removed participants still count.
New participants occur in the after-configuration,
and removed participants are absent from it.
Creating or removing a participant may therefore change population
and may change other dimensions when those changes are intrinsic to the operator.
The mere creation of a participant does not mean
every dimension describing it has changed.

### Footprints

A footprint is a conservative upper bound.
A dimension is omitted only when the theory is prepared to assert
that every application of the operator preserves it.

Ambiguity broadens a footprint.
A footprint is not narrowed to make a theorem stronger.
It is not widened to reproduce a declared relation.

### Requirements

Requirements are a lower-bound constraint.
Ambiguity does not strengthen them.
A multi-member clause is a genuine alternative.
Separate clauses are independently mandatory.

### Operator and step properties

A generic operator effect says what any application may change.
A particular step may satisfy stronger properties.
A lossless split preserves aggregate content,
and a faithful merge preserves the union of its inputs' content,
but those are properties of particular steps.
They are not encoded in the generic operator effect.

## Dimension Scopes

- `content` is the set of distinct content descriptions the participants carry.
  It is multiplicity-insensitive.
  A faithful duplicate of an already-present description
  does not by itself change it.
  A new, distinct, or partial description may.
- `arrangement` is the ordering and relative-position structure among components,
  compared modulo the model's arrangement equivalence.
- `composition` is the part-whole structure of the configuration,
  compared modulo the model's composition equivalence.
- `referentPopulation` is which referents and structural participants exist.
- `representationPopulation` is which representations of a referent exist.
- `containment` is which enclosing structure each participant is placed in.
- `binding` covers associations with contexts, bearers, scopes,
  and applicability settings.
- `association` covers relations among participants
  other than containment, binding, composition, and lineage.
- `lineage` covers derivational ancestry, continuation and version relations,
  including copy-of, derived-from, successor and version relations,
  branch continuation, and a participant's position in a version chain.
- `evidence` covers claims, verification, and attestation metadata
  attached to participants.
  Evidence is attached to participants and is not itself a participant.
- `standing` covers permission, authority, or normative standing,
  including its holder and scope.

Three boundaries are fixed by convention.
A bearer counts as part of `binding`.
Which structure contains a participant is `containment`,
and its relative position within that structure is `arrangement`.
The population dimensions distinguish referents
from representations of a referent.

## Operator Assumptions

Each entry records what the footprint relies on
and the reading left open, which broadens the footprint.

- **AT** attaches evidence.
  It does not itself create a version, a derivation, or a participant.
  If attestations are recorded in version history, `lineage` would join.
- **AZ** changes only `standing`, where standing includes holder and scope.
  If a grant also bound the referent to a scope, `binding` would join.
- **BD** and **UB** change one dimension, `binding`.
  Context, bearer, scope, and applicability setting are not separated.
  A later split would turn the single clause into alternatives.
- **LK** changes only `association`.
  The description says it does not by itself imply containment.
- **EM** establishes `containment`.
  Placement among siblings and treating members as parts of the container
  are not intrinsic.
  If embedding fixed a sibling position, `arrangement` would join.
- **RO** changes `arrangement` and preserves which components exist.
  This rests on the wording that membership is unchanged.
- **SH** moves a referent across a relation, bearer, context, or position.
  Relations that continue to hold on the moved referent are unchanged.
  "Structural position" may mean containment or arrangement,
  so both are in the footprint and in the single required clause.
- **EX** and **CL** act on a referent in place.
  No participants are created or removed, so population is preserved.
  The earlier words scale, detail, and complexity are expressed through
  `content` for detail, `composition` for parts,
  and `arrangement` for complexity.
  No separate scale dimension is defined.
  If collapsing redundant structure could remove participants,
  population would join CL.
  CL's footprint includes `content`, but its required clause is
  composition or arrangement.
- **CP** produces a faithful duplicate.
  Content, arrangement, and composition are preserved by definition.
  The copy relation is part of `lineage`.
  The duplicate may be a second referent or a representation,
  which is a genuine alternative and one clause.
- **BR** establishes a divergent continuation path.
  Later divergence comes from other operators.
  A fork that creates a new participant is a copy followed by a branch.
  If BR were meant to cover such forks,
  the population dimensions would join.
- **PR** derives a representation without modifying the source.
  The derived representation may be partial or a selected form,
  so its content, arrangement, and composition may differ from the source.
  Creating the representation and establishing its derivation
  are separate mandatory clauses.
- **SP** divides a referent into components,
  each of which may itself be a referent.
  `composition` necessarily changes.
  `referentPopulation` changes only if the components are referents.
  `lineage` is not in the footprint, because parts are parts, not derivations.
- **MG** combines referents or components into one referent.
  Merging may consume its inputs, removing the facts about them,
  and may reconcile their descriptions.
  No dimension is excluded from the generic footprint,
  so the footprint is every dimension.
  If inputs persisted as parts, the relational dimensions could drop out.
- **VS** establishes a position in a version chain
  and may materialize that version as a new referent or representation.
  Edits that make a successor differ from its predecessor
  are separate operators.
- **RV** restores a referent to a prior version.
  The theory does not say what a version captures,
  so nothing is asserted preserved and the footprint is every dimension.
  Every restoration changes the referent's position in the version chain.

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

## Sequences

A sequence is a list of operators applied in order, each as one atomic step.

`sequenceFootprintUpperBound` of a sequence is the union of its operators'
footprints.
It is the set of dimensions that may be touched somewhere in the
sequence.

```text
touched somewhere in a sequence
≠
different between the initial and final configurations
```

A later step may restore a dimension that an earlier step changed.

What follows from the bound:

```text
a dimension outside the bound is preserved throughout the sequence:
the initial, every intermediate, and the final configurations agree on it

a difference between the initial and final configurations lies inside the bound
```

A dimension inside the bound may still agree at the end.

## Coherence

A declared inverse-like composition relation needs
the second operator to be able to change what the first must change.
A declared inverse-like pair therefore has overlapping effects.

## Not Covered

Net before-and-after effects, restoration histories, and inverse behavior are
not defined here.
