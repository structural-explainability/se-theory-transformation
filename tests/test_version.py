"""Tests for package version metadata."""

from se_theory_transformation import _version


def test_version_is_nonempty_string() -> None:
    """Version metadata should expose a nonempty string."""
    assert isinstance(_version.__version__, str)
    assert _version.__version__
