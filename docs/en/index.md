# SE Theory: Transformations

Lean 4 formalization of foundational transformation theory for Structural
Explainability.

This repository defines kinds of change. It does not define what survives those
changes.

## Core principle

```text
Transformations are defined independently.
Persistence is evaluated relative to them.
```

## Scope

This repository covers:

- transformation operator vocabulary
- transformation family vocabulary
- composition relation vocabulary
- orthogonality relation vocabulary
- transformation outcome vocabulary
- machine-readable transformation registries
- Lean public import surface

It does not own:

- neutral substrate primitives
- identity regimes
- regime profiles
- persistence behavior
- regime persistence semantics
- domain mappings
- runtime systems

## Operators

```text
CP  copy
PR  project
EM  embed
RF  reference
RO  reorder

SP  split
MG  merge
CL  collapse
EX  expand

SH  shift
VS  version
BR  branch
RV  revert

BD  bind
UB  unbind
AZ  authorize
AT  attest
```

## Outcomes

```text
PRS  preserves structure
BRK  breaks structure
INH  inherits structure
IGN  ignores structure
MIX  mixed / partial
UNK  unresolved
```

Outcome vocabulary names structural effects. Persistence-specific interpretation
belongs downstream.

## Lean surface

Single public import surface:

```lean
import SETheoryTransformation
```

Primary modules:

```text
SETheoryTransformation.lean
SETheoryTransformation/TransformationClass.lean
SETheoryTransformation/Operator/Codes.lean
SETheoryTransformation/Composition.lean
SETheoryTransformation/Orthogonality.lean
SETheoryTransformation/Outcome.lean
```

## Authority

Lean source files are the only authoritative definition of:

- types
- predicates
- theorems
- proof obligations
- formal transformation relations

Machine-readable registries must mirror the Lean surface.

## Documentation rule

Documentation is descriptive only.

It may provide orientation, summaries, and navigation. It must not introduce
formal semantics absent from Lean.

## Build

```shell
lake build
lake build TestExport
uv run se-validate --strict
uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build
```
