"""cli.py - Public command-line entry points for se-theory-transformation."""

from se_theory_transformation.commands.manifest import (
    sync_main,
)
from se_theory_transformation.commands.reference import (
    ref_export_main,
    ref_scaffold_main,
    ref_validate_main,
)
from se_theory_transformation.commands.root import main
from se_theory_transformation.commands.validate import validate_main

__all__ = [
    "main",
    "ref_export_main",
    "ref_scaffold_main",
    "ref_validate_main",
    "sync_main",
    "validate_main",
]


if __name__ == "__main__":
    raise SystemExit(main())
