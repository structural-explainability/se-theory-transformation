"""lean_surface.py - Expected Lean public surface.

Owns:
  - SURFACE_TYPES          - exported public Lean types
  - SURFACE_PREDICATES     - exported public Lean predicates
  - SURFACE_VOCABULARY     - exported classification/transformation vocabulary
  - SURFACE_WITNESSES      - exported public Lean witness objects (def only)
  - SURFACE_THEOREMS       - exported public Lean theorems
  - SURFACE_SYMBOLS        - combined exported public Lean symbols

Does not own:
  - parsing Lean files
  - validating reference artifacts
  - loading TOML or JSON files
  - CLI or orchestration behavior

This module mirrors SETheoryTransformation/Surface.lean so Python validation can
check that reference artifacts cover the public Lean surface.

Current strategy:
  Keep this file aligned manually with SETheoryTransformation/Surface.lean.
  Surface.lean is the authoritative export list. Internal helpers and examples
  are not listed here unless they are intentionally part of the public surface
  contract.

Future strategy:
  Replace or supplement these constants by parsing Surface.lean directly.

Call chain:
  __main__.py -> cli.main()
              -> orchestrate.run_validate()
              -> validate_reference.validate_reference()
              -> lean_surface.SURFACE_SYMBOLS

Witness vs theorem convention:
  SURFACE_WITNESSES contains only Lean `def` declarations that provide concrete
  witness objects or named reference examples.
  SURFACE_THEOREMS contains all Lean `theorem` declarations re-exported through
  Surface.lean.

Internal symbols omitted unless explicitly re-exported through Surface.lean:
  splitThenMerge, bindThenUnbind, authorizeThenAttest
"""

SURFACE_TYPES: frozenset[str] = frozenset(
    {
        "OperatorCode",
        "TransformationFamily",
        "TransformationOutcome",
        "CompositionRelation",
        "CompositionRule",
        "OrthogonalityRelation",
        "OrthogonalityRule",
    }
)


SURFACE_PREDICATES: frozenset[str] = frozenset(
    {
        "OperatorInFamily",
        "OperatorsComposable",
        "OperatorsOrthogonal",
        "OperatorAdmissible",
    }
)


SURFACE_VOCABULARY: frozenset[str] = frozenset(
    {
        "referenceOperators",
        "referenceFamilies",
        "referenceOutcomes",
        "referenceCompositionRelations",
        "referenceOrthogonalityRelations",
    }
)


SURFACE_WITNESSES: frozenset[str] = frozenset(
    {
        "copyOperator",
        "projectOperator",
        "splitThenMerge",
        "bindThenUnbind",
        "authorizeThenAttest",
    }
)


SURFACE_THEOREMS: frozenset[str] = frozenset(
    {
        "operator_codes_distinct",
        "composition_relation_cases_complete",
        "orthogonality_relation_cases_complete",
    }
)


SURFACE_SYMBOLS: frozenset[str] = frozenset(
    {
        *SURFACE_TYPES,
        *SURFACE_PREDICATES,
        *SURFACE_VOCABULARY,
        *SURFACE_WITNESSES,
        *SURFACE_THEOREMS,
    }
)


SURFACE_BY_KIND: dict[str, frozenset[str]] = {
    "type": SURFACE_TYPES,
    "predicate": SURFACE_PREDICATES,
    "vocabulary": SURFACE_VOCABULARY,
    "witness": SURFACE_WITNESSES,
    "theorem": SURFACE_THEOREMS,
}


def expected_symbols_for_kind(kind: str) -> frozenset[str]:
    """Return expected public Lean symbols for a surface kind.

    Args:
        kind: Surface kind. Expected values are type, predicate, vocabulary,
            witness, theorem.

    Returns:
        The expected exported Lean symbols for the requested kind.

    Raises:
        ValueError: If kind is not a known surface kind.
    """
    try:
        return SURFACE_BY_KIND[kind]
    except KeyError as e:
        valid_kinds = ", ".join(sorted(SURFACE_BY_KIND))
        raise ValueError(
            f"Unknown Lean surface kind: {kind}. Expected one of: {valid_kinds}"
        ) from e
