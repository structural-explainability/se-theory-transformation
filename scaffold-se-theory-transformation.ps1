param(
    [string]$RepoName = "se-theory-transformation"
)

$ErrorActionPreference = "Stop"

function New-Dir {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

function New-File {
    param(
        [string]$Path,
        [string]$Content = ""
    )
    if (-not (Test-Path $Path)) {
        $parent = Split-Path $Path -Parent
        if ($parent) {
            New-Dir $parent
        }
        Set-Content -Path $Path -Value $Content -Encoding utf8
    }
}

# If run from parent repo directory, create/use repo folder.
# If run from inside repo folder, use current folder.
$current = Split-Path (Get-Location) -Leaf
if ($current -eq $RepoName) {
    $Root = Get-Location
} else {
    $Root = Join-Path (Get-Location) $RepoName
    New-Dir $Root
}

$LeanRoot = Join-Path $Root "SETheoryTransformation"

$dirs = @(
    "SETheoryTransformation",
    "SETheoryTransformation/Transformation",
    "SETheoryTransformation/Operator",
    "SETheoryTransformation/Family",
    "SETheoryTransformation/Tests",
    "data/transformation",
    "data/schema",
    "docs/theory",
    "docs/examples",
    "docs/diagrams",
    "scripts",
    "reports",
    "tests"
)

foreach ($dir in $dirs) {
    New-Dir (Join-Path $Root $dir)
}

$leanFiles = @(
    "SETheoryTransformation/Basic.lean",
    "SETheoryTransformation/Transformation.lean",
    "SETheoryTransformation/Operator.lean",
    "SETheoryTransformation/Family.lean",
    "SETheoryTransformation/Composition.lean",
    "SETheoryTransformation/Outcome.lean",
    "SETheoryTransformation/Orthogonality.lean",
    "SETheoryTransformation/Registry.lean",
    "SETheoryTransformation/Transformation/Primitive.lean",
    "SETheoryTransformation/Transformation/Structural.lean",
    "SETheoryTransformation/Transformation/Temporal.lean",
    "SETheoryTransformation/Transformation/Contextual.lean",
    "SETheoryTransformation/Transformation/Normative.lean",
    "SETheoryTransformation/Transformation/Observational.lean",
    "SETheoryTransformation/Operator/Codes.lean",
    "SETheoryTransformation/Operator/Semantics.lean",
    "SETheoryTransformation/Operator/Composition.lean",
    "SETheoryTransformation/Operator/Admissibility.lean",
    "SETheoryTransformation/Family/Branching.lean",
    "SETheoryTransformation/Family/Decomposition.lean",
    "SETheoryTransformation/Family/Aggregation.lean",
    "SETheoryTransformation/Family/Projection.lean",
    "SETheoryTransformation/Family/Reorganization.lean",
    "SETheoryTransformation/Family/Versioning.lean",
    "SETheoryTransformation/Family/Migration.lean",
    "SETheoryTransformation/Tests/Orthogonality.lean",
    "SETheoryTransformation/Tests/Composition.lean",
    "SETheoryTransformation/Tests/Admissibility.lean"
)

foreach ($file in $leanFiles) {
    $moduleName = ($file -replace "/", ".") -replace "\.lean$", ""
    New-File (Join-Path $Root $file) "/-- $moduleName -/`n"
}

$jsonFiles = @(
    "data/transformation/operator-registry.json",
    "data/transformation/transformation-catalog.json",
    "data/transformation/transformation-family-registry.json",
    "data/transformation/outcome-registry.json",
    "data/transformation/composition-rules.json",
    "data/transformation/orthogonality-matrix.json",
    "data/schema/operator-registry.schema.json",
    "data/schema/transformation-catalog.schema.json",
    "data/schema/transformation-family-registry.schema.json",
    "data/schema/outcome-registry.schema.json",
    "data/schema/composition-rules.schema.json",
    "data/schema/orthogonality-matrix.schema.json"
)

foreach ($file in $jsonFiles) {
    New-File (Join-Path $Root $file) "{`n  `"$schema`": `"`",`n  `"items`": []`n}`n"
}

$mdFiles = @(
    "README.md",
    "docs/index.md",
    "docs/theory/transformation-theory.md",
    "docs/theory/operator-vocabulary.md",
    "docs/theory/composition.md",
    "docs/theory/orthogonality.md",
    "docs/theory/admissibility.md",
    "docs/examples/split.md",
    "docs/examples/merge.md",
    "docs/examples/branch.md",
    "docs/examples/project.md",
    "docs/examples/version.md",
    "docs/examples/reorganization.md",
    "docs/diagrams/operator-taxonomy.md",
    "docs/diagrams/composition-flow.md",
    "docs/diagrams/orthogonality-grid.md",
    "reports/operator_registry_report.md",
    "reports/orthogonality_report.md",
    "reports/composition_report.md"
)

foreach ($file in $mdFiles) {
    $title = [System.IO.Path]::GetFileNameWithoutExtension($file)
    New-File (Join-Path $Root $file) "# $title`n"
}

New-File (Join-Path $Root "lakefile.toml") @"
import Lake
open Lake DSL

package se_theory_transformation where

lean_lib SETheoryTransformation where
"@

New-File (Join-Path $Root "lean-toolchain") "leanprover/lean4:stable"

New-File (Join-Path $Root "tests/test_registry_shapes.py") @"
from pathlib import Path
import json


def test_operator_registry_is_valid_json() -> None:
    path = Path('data/transformation/operator-registry.json')
    assert path.exists()
    data = json.loads(path.read_text(encoding='utf-8'))
    assert isinstance(data, dict)
"@

Write-Host "Scaffold complete: $Root"
