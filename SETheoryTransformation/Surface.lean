import SETheoryTransformation.Domain.Operator.Labels
import SETheoryTransformation.Domain.Operator.Semantics
import SETheoryTransformation.Domain.TransformationFamily
import SETheoryTransformation.Domain.TransformationKind
import SETheoryTransformation.Outcome
import SETheoryTransformation.Relation.Composition
import SETheoryTransformation.Relation.Orthogonality
import SETheoryTransformation.Registry

-- ============================================================
-- SETheoryTransformation/Surface.lean
-- ============================================================
-- REQ.FILE.SURFACE
--   Curated stable surface for downstream consumers of the
--   transformation theory (identity regimes, exchange protocol).
--   This file defines what "import SETheoryTransformation" provides.
--   Core internals not listed here are not part of the public contract.
-- WHY: Explicit export means Domain internals can be refactored
--   without breaking downstream code, as long as the names listed
--   here remain provable and their types remain stable.
-- USAGE:
--   import SETheoryTransformation
--   open SETheoryTransformation    -- types, operators, relations, outcomes

-- ============================================================
-- TYPES
-- ============================================================
-- REQ.SURFACE.TYPES
--   The classification vocabulary downstream theories build on.
--   Cite IDs: TR.TYPE.*
export SETheoryTransformation (TransformationKind)
export SETheoryTransformation (TransformationFamily)
export SETheoryTransformation (OperatorCode)
export SETheoryTransformation (CompositionRelation)
export SETheoryTransformation (CompositionRule)
export SETheoryTransformation (OrthogonalityRelation)
export SETheoryTransformation (OrthogonalityRule)
export SETheoryTransformation (TransformationOutcome)

-- ============================================================
-- FUNCTIONS
-- ============================================================
-- REQ.SURFACE.FUNCTIONS
--   The classification functions downstream proofs may apply.
--   Cite IDs: TR.DEF.*
export SETheoryTransformation (operatorCodeLabel)
export SETheoryTransformation (operatorFamily)
export SETheoryTransformation (familyKind)
export SETheoryTransformation (operatorKind)

-- ============================================================
-- PREDICATES
-- ============================================================
-- REQ.SURFACE.PREDICATES
--   The properties downstream proofs quantify over or discharge.
--   Cite IDs: TR.DEF.*
export SETheoryTransformation (OperatorInFamily)
export SETheoryTransformation (OperatorInKind)

-- ============================================================
-- REFERENCE LISTS
-- ============================================================
-- REQ.SURFACE.REGISTRY
--   Lean-side enumerations for operators, families, kinds, outcomes.
export SETheoryTransformation (referenceOperators)
export SETheoryTransformation (referenceFamilies)
export SETheoryTransformation (referenceKinds)
export SETheoryTransformation (referenceOutcomes)

-- ============================================================
-- AXIOMS
-- ============================================================
-- REQ.SURFACE.AXIOMS
--   Domain assumptions the main theorems rest on.
--   Cite IDs: TR.AXIOM.*
--   None established yet.

-- ============================================================
-- THEOREMS
-- ============================================================
-- REQ.SURFACE.THEOREMS
--   Results downstream proofs may apply or extend.
--   Cite IDs: TR.THEOREM.*
--   None established yet.
