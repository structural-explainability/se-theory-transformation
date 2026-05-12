# Composition

Composition describes how transformation operators may be sequenced.

A composition rule does not assert persistence.

It only describes whether the second transformation can meaningfully follow
the first transformation.

## Relation types

| Relation | Meaning |
| --- | --- |
| composable | The sequence is generally meaningful. |
| conditionally-composable | The sequence is meaningful only under stated constraints. |
| non-composable | The sequence is structurally invalid or incoherent. |
| redundant | The second transformation adds no relevant structural change. |
| absorbing | The second transformation dominates or erases the first. |
| inverse-like | The transformations move in opposing directions but may not fully reverse. |
| unknown | The relation is unresolved. |

## Rule

```text
Composition describes sequencing.
Persistence describes survival.
