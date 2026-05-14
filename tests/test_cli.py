"""Tests for CLI entry-point wiring."""

from se_theory_transformation import cli
from se_theory_transformation.commands import root


def test_cli_reexports_expected_entry_points() -> None:
    """Public CLI module should expose script entry points."""
    expected = {
        "main",
        "ref_export_main",
        "ref_scaffold_main",
        "ref_validate_main",
        "sync_main",
        "validate_main",
    }

    assert set(cli.__all__) == expected


def test_root_parser_accepts_validate() -> None:
    """Root parser should accept the validate subcommand."""
    parser = root.build_parser()
    args = parser.parse_args(["validate"])

    assert args.command == "validate"


def test_root_parser_accepts_ref_scaffold_flags() -> None:
    """Root parser should accept ref-scaffold flags."""
    parser = root.build_parser()
    args = parser.parse_args(["ref-scaffold", "--dry-run", "--overwrite"])

    assert args.command == "ref-scaffold"
    assert args.dry_run is True
    assert args.overwrite is True


def test_root_parser_accepts_ref_validate_strict() -> None:
    """Root parser should accept ref-validate strict flag."""
    parser = root.build_parser()
    args = parser.parse_args(["ref-validate", "--strict"])

    assert args.command == "ref-validate"
    assert args.strict is True


def test_root_parser_accepts_ref_export_check() -> None:
    """Root parser should accept ref-export check flag."""
    parser = root.build_parser()
    args = parser.parse_args(["ref-export", "--check"])

    assert args.command == "ref-export"
    assert args.check is True


def test_root_main_prints_help_for_no_command() -> None:
    """Root dispatcher should return 2 when no command is provided."""
    result = root.main([])

    assert result == 2
