"""cli.py - Command-line interface for se-theory-transformation."""

import argparse
import sys

from se_manifest_schema.cli import main as manifest_schema_main
from se_manifest_schema.sync import sync_all

from se_theory_transformation.reference import run_ref_validate, run_scaffold


def build_parser() -> argparse.ArgumentParser:
    """Build the argument parser."""
    parser = argparse.ArgumentParser(
        prog="se-theory-transformation",
        description="Manifest and reference tooling for se-theory-transformation.",
    )
    subparsers = parser.add_subparsers(dest="command")

    subparsers.add_parser(
        "validate",
        help="Run repository validation.",
    )

    subparsers.add_parser(
        "schema-validate",
        help="Validate the manifest schema layer.",
    )

    subparsers.add_parser(
        "sync",
        help="Sync pyproject.toml fallback-version from CITATION.cff version.",
    )

    ref_scaffold_parser = subparsers.add_parser(
        "ref-scaffold",
        help="Scaffold reference/ artifacts from Lean 4 source.",
    )
    ref_scaffold_parser.add_argument("--dry-run", action="store_true")
    ref_scaffold_parser.add_argument("--overwrite", action="store_true")

    ref_validate_parser = subparsers.add_parser(
        "ref-validate",
        help="Validate reference/ artifacts against Lean 4 source.",
    )
    ref_validate_parser.add_argument("--strict", action="store_true")

    return parser


def validate_main() -> int:
    """Run full repository validation."""
    sync_all()
    ref_result = run_ref_validate(strict=True)
    if ref_result != 0:
        return ref_result
    print("Repository validation passed.")
    return 0


def schema_validate_main() -> int:
    """Validate the manifest schema layer."""
    return manifest_schema_main(["validate", *sys.argv[1:]])


def sync_main() -> int:
    """Sync version metadata."""
    sync_all()
    return 0


def ref_scaffold_main() -> int:
    """Scaffold reference/ artifacts from Lean 4 source."""
    return main(["ref-scaffold", *sys.argv[1:]])


def ref_validate_main() -> int:
    """Validate reference/ artifacts against Lean 4 source."""
    return main(["ref-validate", *sys.argv[1:]])


def main(argv: list[str] | None = None) -> int:
    """Run the command-line interface."""
    parser = build_parser()
    args = parser.parse_args(argv)

    try:
        if args.command == "validate":
            return validate_main()

        if args.command == "schema-validate":
            return schema_validate_main()

        if args.command == "sync":
            return sync_main()

        if args.command == "ref-scaffold":
            return run_scaffold(
                dry_run=args.dry_run,
                overwrite=args.overwrite,
            )

        if args.command == "ref-validate":
            return run_ref_validate(strict=args.strict)

    except (ValueError, FileNotFoundError, RuntimeError) as e:
        print(f"Error: {e}")
        return 1

    parser.print_help()
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
