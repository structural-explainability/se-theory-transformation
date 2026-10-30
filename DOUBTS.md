# Research Doubts and Open Questions

This document records the current research assessment,
known limitations, unresolved questions, and safeguards
against overclaiming for this theory.

For the three research criteria, doubt classifications,
status definitions, and procedures, see the
[SE Research Doubts Standard](https://raw.githubusercontent.com/structural-explainability/.github/refs/heads/main/docs/en/research/doubts.md).

## Repository Summary

This assessment is a summary of the present evidence.

| Criterion                | Current assessment                                                                                                                                                                                                    |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Mathematical Correctness | Formal results are established under stated hypotheses. Footprints and required-change clauses are defined for all 17 operators over 11 effect dimensions. Sequence-level net effect and restoration are not defined. |
| Scientific Adequacy      | Open. Footprints are conservative bounds that rest on stated readings of each operator description. Whether the operators, dimensions, and readings fit real systems is not established.                              |
| Theoretical Contribution | The proposed contribution is a vocabulary of transformation operators with intrinsic effect semantics. `docs/en/theory/related-work.md` places it beside PREMIS and SPDX as orientation, not a survey.                |

The doubts below identify specific issues affecting these assessments.

---

<!-- markdownlint-disable MD024 -->

## Register 1. Doubts About Assumptions (Undermining Doubts)

These questions concern the premises of an argument.
Even if a theorem is correctly proved, can we establish the assumptions necessary to apply it?

### UM-001. (OPEN) Footprints Rest on Operator Readings

#### Research criterion

Scientific Adequacy

#### Concern

A footprint is derived from how an operator is described.
A different reading of the description changes the footprint.

#### Current Knowledge

A footprint is a conservative upper bound.
It is not narrowed to make a theorem stronger, and not widened to reproduce a declared relation.

`docs/en/theory/effects.md` records, per operator, what the footprint relies on and the reading left open.
For example, if attestations (AT) are recorded in version history, `lineage` would join the footprint.
If embedding (EM) fixed a sibling position, `arrangement` would join.
For BD and UB, context, bearer, scope, and applicability setting are not separated.

#### Remaining Work

A realization must justify the readings it relies on, or the operator descriptions must be refined.

### UM-002. (OPEN) Net Effect and Restoration

#### Research criterion

Scientific Adequacy

#### Concern

Can the theory say what a sequence of steps changes overall, and whether it restores a prior configuration?

#### Current Knowledge

`sequenceFootprintUpperBound` bounds the dimensions that may differ between the initial and final configurations.
Net effects are not determined by an operator sequence alone because steps are relations.
Only necessary conditions for restoration are established.
They do not show that a sequence restores a prior configuration.

#### Remaining Work

Listed as planned: a complementary result for a required-change clause that no other operator in the sequence can touch.

### UM-003. (OPEN) Absorbing and Redundant Composition Relations

#### Research criterion

Mathematical Correctness

#### Concern

A declared composition relation should satisfy conditions justified by its meaning.

#### Current Knowledge

The coherence result covers declared inverse-like pairs: each has `EffectsOverlap`.
Coherence conditions for absorbing and redundant relations are listed as planned, to be stated if such a relation is declared.

#### Remaining Work

Derive candidate conditions from the meanings of those relations, keeping may-change footprints distinct from required-change clauses.

## Register 2. Doubts About Conclusions (Rebutting Doubts)

These questions concern whether a claimed conclusion is false.
For example, a counterexample satisfying all the premises
but violating the conclusion would challenge the claimed theorem or its formalization.
A model that violates a required assumption does not
necessarily refute a conditional theorem.
If a counterexample is found,
we must identify the exact claim it challenges and
whether its assumptions are satisfied.

**None currently identified.**

## Register 3. Doubts About What Our Results Mean (Undercutting Doubts)

These questions concern the connection
between a formal theorem and the scientific claim made about it.
A theorem may be correct while its informal interpretation is too strong.
Some of these doubts are addressed by permanent documentation
rules rather than additional proofs.

### UC-001. (STANDING RULES) Footprints Are Not Net Effects

#### Research criterion

Scientific Adequacy

#### Concern

A reader might read a footprint as what a step changes, or inverse-like coherence as restoration.

#### Current Knowledge

Touched dimensions are kept distinct from net change.
The restoration conditions do not show that any operator pair restores anything.

#### Standing Rules

1. Describe a footprint as an upper bound on what a step may change.
2. Do not present inverse-like coherence as restoration.

<!-- markdownlint-enable MD024 -->
