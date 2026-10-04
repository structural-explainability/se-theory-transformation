# Related Work

This page places the transformation vocabulary beside existing work.
It is orientation, not a survey.

## Vocabularies of Change

### PREMIS Preservation Events

The Library of Congress publishes a controlled vocabulary of preservation
event types, maintained alongside PREMIS.

Three event types are especially close to transformation operations:

- **migration** creates a version in a more contemporary format;
- **normalization** creates a version better suited to preservation; and
- **replication** creates a bit-wise identical copy.

This is an operation vocabulary for digital objects,
as this theory's operators are.

The controlled vocabulary itself is a list of preservation event types
rather than a kind → family → operation taxonomy.

### SPDX Relationship Types

SPDX 2.x labels relationships between elements, including
`GENERATES`,
`GENERATED_FROM`,
`ANCESTOR_OF`,
`DESCENDANT_OF`,
`VARIANT_OF`,
`COPY_OF`,
`PATCH_APPLIED`, and
`FILE_MODIFIED`.

The distinction between `COPY_OF` and
`ANCESTOR_OF` / `DESCENDANT_OF`
offers a useful comparison with the distinction between
copy (`CP`) and branch (`BR`) in this theory.

SPDX labels relationships between artifacts;
this theory names transformation operations.

### W3C PROV

PROV defines derivation, with revision, quotation, and primary source
as specialized kinds of derivation.
PROV defines no attributes specific to those derivation subtypes.
It records relations between entities rather than organizing
transformation operations into kinds and families.

## Precedent for Formal Semantics

### PRISM Schema Modification Operators

PRISM provides a language of operators for schema changes,
tools to evaluate their effects,
automatic data migration,
query rewriting, and
documentation of changes to support provenance.

It builds on theoretical results on
mapping composition,
invertibility, and
query rewriting.
It is a particularly relevant precedent for transformation operators
with defined effects and algebraic relationships.

### Lenses

In programming-language theory and bidirectional transformation research,
a **lens** is a formal abstraction for relating two representations through
paired `get` and `put` operations.

Well-behaved lenses satisfy round-trip laws and support composition,
providing a precedent for giving transformations formal behavioral laws.

Quotient lenses relax the round-trip requirements
so that the laws need hold only up to a chosen equivalence,
such as one that ignores whitespace.
They provide a precedent for stating laws about change
modulo an equivalence.

## Classifications of Transformation Approaches

Czarnecki and Helsen give a feature model of design choices
in model-transformation approaches.
Mens and Van Gorp give a taxonomy of model transformation
derived from a Dagstuhl working group.
The taxonomy was subsequently applied to graph-transformation technology.
These works classify transformation languages,
tools, techniques, and approaches,
rather than kinds of change performed by individual operations.

## Contribution

In the (limited search) sources reviewed,
we did not find a vocabulary that

- groups concrete transformation operations into families and kinds, and
- states explicit, partial composition and orthogonality relations among them.

## Open Directions

- Expand composition and orthogonality rule coverage,
  including investigating whether split and merge admit
  a justified orthogonality classification.
- Investigate a coherence law between composition and orthogonality,
  including whether absorbing, inverse-like, or redundant
  composition relations constrain orthogonality.

## References

- Library of Congress, Preservation Events vocabulary:
  <https://id.loc.gov/vocabulary/preservation/eventType.html>
- SPDX relationship types:
  <https://spdx.github.io/spdx-spec/v2.3/relationships-between-SPDX-elements/>
- W3C, PROV-DM:
  <https://www.w3.org/TR/prov-dm/>
- Curino, Moon, Zaniolo.
  _Graceful Database Schema Evolution: The PRISM Workbench_.
  PVLDB, 2008.
  <https://doi.org/10.14778/1453856.1453939>
- Foster, Greenwald, Moore, Pierce, Schmitt.
  _Combinators for Bi-Directional Tree Transformations_.
  ACM TOPLAS, 2007.
- Foster, Pilkiewicz, Pierce.
  _Quotient Lenses_.
  <https://repository.upenn.edu/server/api/core/bitstreams/50864938-ca31-4fd5-bf2a-9ea2f3c6e28d/content>
- Czarnecki, Helsen.
  _Feature-based Survey of Model Transformation Approaches_.
  IBM Systems Journal 45(3), 2006.
  <https://doi.org/10.1147/sj.453.0621>
- Mens, Van Gorp.
  _A Taxonomy of Model Transformation_.
  <https://doi.org/10.1016/j.entcs.2005.10.021>
- Mens, Van Gorp, Varró, Karsai.
  _Applying a Model Transformation Taxonomy to Graph Transformation Technology_.
  <https://doi.org/10.1016/j.entcs.2005.10.022>
