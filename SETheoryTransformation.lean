import SETheoryTransformation.Core
import SETheoryTransformation.Spec
import SETheoryTransformation.Surface

/-!
# SE Theory: Transformation Theory

Lean 4 formalization of the transformation theory layer from
Structural Explainability (SE) theory.

This library defines the structural vocabulary for transformations:
transformation kinds, transformation families, transformation operators,
transformation outcomes, admissibility conditions, composition relations,
and orthogonality relations.

It provides a public, theory-level surface for downstream SE libraries
that need to reason about structural change without importing domain
interpretation, identity-regime behavior, operational validation, or
application-specific semantics.

## 1. Scope (Informative)

Applies to structural transformations over SE-relevant objects,
relations, records, contexts, and organizational configurations.

This library provides the theory layer for describing and constraining
transformations independently of any particular domain application.

This library does not encode:

- identity regimes
- persistence behavior
- accountable entities
- exchange protocols
- causal interpretation
- normative interpretation
- operational validation rules
- application-specific transformation policies

Those layers are handled by downstream SE libraries or operational
systems.

## 2. Public Surface (Normative)

The following names constitute the normative public surface of this
library. They are stable across patch versions. Breaking changes require
a minor version increment.

Names in internal modules not listed here are implementation details and
may change without notice.

### 2.1. Core Types

- `TransformationKind`     top-level classification of what aspect is changed
- `TransformationFamily`   structural family of transformation behavior
- `TransformationOperator` named operator that performs or denotes a change
- `TransformationOutcome`  normalized outcome classification
- `TransformationSpec`     structured specification of a transformation

### 2.2. Transformation Kinds

The canonical transformation kinds are:

- `Structural`
- `Temporal`
- `Relational`
- `Contextual`
- `Observational`
- `Normative`
- `Organizational`

These kinds classify the primary aspect affected by a transformation.
They do not, by themselves, determine identity preservation or identity
breakage.

### 2.3. Transformation Families

The canonical transformation families include:

- `Aggregation`
- `Association`
- `Attestation`
- `Branching`
- `Containment`
- `Decomposition`
- `Migration`
- `Normative`
- `Projection`
- `Reorganization`
- `Replication`
- `Scaling`
- `Versioning`

Families group transformation operators by structural behavior.
A family may contain multiple operators, and an operator may be analyzed
through admissibility, composition, and orthogonality constraints.

### 2.4. Operators

Transformation operators are named structural changes.

Operators are defined by:

- code
- label
- semantic description
- admissibility requirements
- associated kind
- associated family
- expected outcome form

The operator vocabulary is structural, not interpretive. Operator
membership does not assert that a transformation is causally valid,
normatively justified, or identity-preserving.

### 2.5. Outcomes

Transformation outcomes classify the result of applying or analyzing a
transformation.

Outcome vocabulary is provided by `SETheoryTransformation.Outcome` and
re-exported through the public surface.

Outcomes are structural descriptions only. They do not determine regime
persistence unless interpreted by a downstream identity-regime library.

### 2.6. Relations

This library exposes two primary relation families:

- `Composition`     when transformations may be sequenced or combined
- `Orthogonality`   when transformations are structurally independent

Composition and orthogonality are theory-level relations among
transformations. They constrain transformation analysis without importing
domain-specific policy or regime-specific persistence behavior.

### 2.7. Predicates

The public surface includes predicates for structural validity and
conformance, including admissibility predicates for operators,
families, kinds, and registry entries.

Admissibility means that a transformation entry conforms to the
structural theory contract. It does not mean that the transformation is
appropriate for every domain or interpretation.

### 2.8. Reference Registries

The Lean surface is aligned with reference artifacts under `reference/`
and exported JSON artifacts under `data/transformation/`.

Reference artifacts include:

- `transformation-basis.toml`
- `transformation-kinds.toml`
- `transformation-families.toml`
- `transformation-operators.toml`
- `transformation-outcomes.toml`
- `composition-rules.toml`
- `orthogonality-rules.toml`

Operational JSON exports include:

- `transformation-catalog.json`
- `transformation-family-registry.json`
- `operator-registry.json`
- `outcome-registry.json`
- `composition-rules.json`
- `orthogonality-matrix.json`

The Lean surface is the normative theory surface. The reference and data
artifacts provide inspectable registry and contract material for
downstream systems.

## 3. Public Import Pattern (Normative)

Downstream libraries should import this module as their public entry
point:

```lean
import SETheoryTransformation
open SE.TheoryTransformation
```

Downstream libraries that need citation identifiers may additionally
open the specification namespace:

```lean
open SE.TheoryTransformation.Spec
```

Downstream code should not depend directly on internal module layout
unless it is intentionally extending this library.

## 4. Layer Boundary (Normative)

This library is a transformation theory library.

It may define:

- transformation vocabulary
- transformation kinds
- transformation families
- transformation operators
- transformation outcomes
- admissibility constraints
- composition relations
- orthogonality relations
- registry conformance structure

It must not define:

- identity-regime persistence decisions
- accountable-entity semantics
- exchange-protocol semantics
- causal explanation semantics
- normative authorization semantics
- application-domain rules
- operational validation policy

The theory layer remains neutral with respect to downstream
interpretation.

## 5. Relationship to Structural Explainability (Informative)

Within the SE ecosystem, this library supplies the structural theory of
change.

Identity-regime libraries may consume this surface to ask how a
transformation affects a particular regime profile. Operational systems
may consume exported registry artifacts to validate that transformation
references are well-formed.

This library itself does not decide whether a transformation preserves
or breaks identity. That decision belongs to the relevant identity regime
or downstream application layer.

## 6. Usage (Informative)

```lean
import SETheoryTransformation

open SE.TheoryTransformation
open SE.TheoryTransformation.Spec
```

## 7. Metadata (Informative)

Version, authorship, and release date: see `CITATION.cff`.

Scope, layer, governance, and exported artifacts: see
`SE_MANIFEST.toml`.

Reference vocabulary: see `reference/`.

Operational registry exports: see `data/transformation/`.

## 8. File Notes (Informative)

- This file must remain thin: imports only, no logic.
- Downstream SE libraries should depend on this file as the public
  transformation-theory import.
- Internal structure is not part of the public contract unless re-exported
  through `SETheoryTransformation.Surface`.
- Public names should be curated in `SETheoryTransformation.Surface`.
- Citation identifiers and stable theorem/specification IDs belong in
  `SETheoryTransformation.Spec`.
- Foundational definitions belong below this surface, not in this file.

-/
