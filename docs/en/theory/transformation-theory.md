# Transformation Theory

Transformation theory provides the structural vocabulary for describing
change.

It defines operators, families, kinds, outcomes, composition relations, and
orthogonality relations. It does not decide what survives a transformation.

## Core rule

```text
Transformations are defined independently.
Persistence is evaluated downstream.
```

## Authority

The public Lean import is:

```lean
import SETheoryTransformation
```

The public surface is curated in:

```text
SETheoryTransformation.lean
SETheoryTransformation/Surface.lean
```

The main Lean source areas are:

```text
SETheoryTransformation/Domain/
SETheoryTransformation/Relation/
SETheoryTransformation/Reference/
SETheoryTransformation/Outcome.lean
SETheoryTransformation/Registry.lean
SETheoryTransformation/Conformance.lean
```

The reference registry mirrors are in:

```text
reference/
data/transformation/
```

## Boundary

This repository owns transformation vocabulary and structural relations.

It does not own identity regimes, regime profiles, persistence behavior,
accountable entities, exchange protocols, domain mappings, or runtime systems.
