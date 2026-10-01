# ============================================================
# Audit Lean module migration from repository root
# ============================================================
# Read-only: reports issues; changes nothing.

$ErrorActionPreference = "Stop"

$root = (Get-Location).Path

Write-Host ""
Write-Host "============================================================"
Write-Host "Lean Module Audit"
Write-Host "============================================================"
Write-Host "Root: $root"
Write-Host ""

# ------------------------------------------------------------
# Helpers
# ------------------------------------------------------------

function Get-RelativePath {
    param(
        [Parameter(Mandatory)]
        [string] $Path
    )

    return [System.IO.Path]::GetRelativePath($root, $Path)
}

function Get-LeanContent {
    param(
        [Parameter(Mandatory)]
        [string] $Path
    )

    $content = Get-Content -LiteralPath $Path -Raw

    if ($null -eq $content) {
        return ""
    }

    return $content
}

function Test-HasModuleDeclaration {
    param(
        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string] $Content
    )

    if ([string]::IsNullOrWhiteSpace($Content)) {
        return $false
    }

    # Accept:
    # module
    # module -- shake: keep-all
    return $Content -match '(?m)^\s*module(?:\s+--.*)?\s*$'
}

function Get-ImportedModules {
    param(
        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string] $Content
    )

    if ([string]::IsNullOrWhiteSpace($Content)) {
        return @()
    }

    $matches = [regex]::Matches(
        $Content,
        '(?m)^\s*(?:public\s+)?import\s+([A-Za-z0-9_.]+)\s*(?:--.*)?$'
    )

    return @(
        foreach ($match in $matches) {
            $match.Groups[1].Value
        }
    )
}

function Convert-ModuleToPath {
    param(
        [Parameter(Mandatory)]
        [string] $Module
    )

    $relative = ($Module -replace '\.', [System.IO.Path]::DirectorySeparatorChar) + ".lean"
    return Join-Path $root $relative
}

function Test-HasDeclarations {
    param(
        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string] $Content
    )

    if ([string]::IsNullOrWhiteSpace($Content)) {
        return $false
    }

    return $Content -match (
        '(?m)^\s*' +
        '(?:' +
            'abbrev|' +
            'axiom|' +
            'class|' +
            'def|' +
            'inductive|' +
            'instance|' +
            'opaque|' +
            'structure|' +
            'theorem|' +
            'lemma' +
        ')\s+'
    )
}

# ------------------------------------------------------------
# Collect Lean files
# ------------------------------------------------------------

$leanFiles = @(
    Get-ChildItem `
        -Path $root `
        -Recurse `
        -File `
        -Filter "*.lean" |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.lake[\\/]'
    } |
    Sort-Object FullName
)

Write-Host "Lean files found: $($leanFiles.Count)"
Write-Host ""

$errors = [System.Collections.Generic.List[object]]::new()
$warnings = [System.Collections.Generic.List[object]]::new()
$info = [System.Collections.Generic.List[object]]::new()

function Add-Issue {
    param(
        [Parameter(Mandatory)]
        [ValidateSet("ERROR", "WARNING", "INFO")]
        [string] $Severity,

        [Parameter(Mandatory)]
        [string] $File,

        [Parameter(Mandatory)]
        [string] $Message
    )

    $item = [pscustomobject]@{
        Severity = $Severity
        File     = $File
        Message  = $Message
    }

    switch ($Severity) {
        "ERROR"   { $errors.Add($item) }
        "WARNING" { $warnings.Add($item) }
        "INFO"    { $info.Add($item) }
    }
}

# ------------------------------------------------------------
# Audit every Lean file
# ------------------------------------------------------------

foreach ($file in $leanFiles) {
    $relative = Get-RelativePath -Path $file.FullName
    $content = Get-LeanContent -Path $file.FullName

    if ([string]::IsNullOrWhiteSpace($content)) {
        Add-Issue `
            -Severity "ERROR" `
            -File $relative `
            -Message "Lean file is empty."

        continue
    }

    $hasModule = Test-HasModuleDeclaration -Content $content
    $imports = @(Get-ImportedModules -Content $content)

    # --------------------------------------------------------
    # 1. Every migrated Lean file should use the module system.
    # --------------------------------------------------------

    if (-not $hasModule) {
        Add-Issue `
            -Severity "ERROR" `
            -File $relative `
            -Message "Missing module declaration."
    }

    # --------------------------------------------------------
    # 2. Catch stale pre-migration namespace/import references.
    # --------------------------------------------------------

    if ($content -match '\bSETheoryTransformation\b') {
        Add-Issue `
            -Severity "ERROR" `
            -File $relative `
            -Message "Contains stale SETheoryTransformation reference."
    }

    # --------------------------------------------------------
    # 3. Module files defining declarations should normally
    #    expose them explicitly through a public section.
    # --------------------------------------------------------

    if (
        $hasModule -and
        (Test-HasDeclarations -Content $content) -and
        $content -notmatch '(?m)^\s*(?:@\[[^\]]+\]\s*)?public\s+section\b'
    ) {
        Add-Issue `
            -Severity "WARNING" `
            -File $relative `
            -Message "Defines declarations but has no public section; review public visibility."
    }

    # --------------------------------------------------------
    # 4. Check every import target.
    # --------------------------------------------------------

    foreach ($import in $imports) {
        # External packages such as Mathlib/Batteries do not necessarily
        # correspond to files owned by this repository. Only inspect SE
        # and SETest module families here.

        if (
            $import -notmatch '^SE(?:\.|$)' -and
            $import -notmatch '^SETest(?:\.|$)'
        ) {
            continue
        }

        $targetPath = Convert-ModuleToPath -Module $import

        if (-not (Test-Path -LiteralPath $targetPath -PathType Leaf)) {
            Add-Issue `
                -Severity "ERROR" `
                -File $relative `
                -Message "Import '$import' has no file: $([System.IO.Path]::GetRelativePath($root, $targetPath))"

            continue
        }

        # ----------------------------------------------------
        # 5. A new-style module cannot import an old-style
        #    non-module dependency.
        # ----------------------------------------------------

        if ($hasModule) {
            $targetContent = Get-LeanContent -Path $targetPath

            if (-not (Test-HasModuleDeclaration -Content $targetContent)) {
                Add-Issue `
                    -Severity "ERROR" `
                    -File $relative `
                    -Message "Module imports legacy non-module '$import'."
            }
        }
    }

    # --------------------------------------------------------
    # 6. Report ordinary imports inside production modules.
    #    Not automatically wrong: useful migration review.
    # --------------------------------------------------------

    if ($hasModule -and $relative -match '^SE[\\/]') {
        $ordinaryImports = [regex]::Matches(
            $content,
            '(?m)^\s*import\s+([A-Za-z0-9_.]+)\s*(?:--.*)?$'
        )

        foreach ($match in $ordinaryImports) {
            Add-Issue `
                -Severity "INFO" `
                -File $relative `
                -Message "Ordinary import '$($match.Groups[1].Value)'; confirm it should not be public import."
        }
    }
}

# ------------------------------------------------------------
# Display results
# ------------------------------------------------------------

function Show-Issues {
    param(
        [Parameter(Mandatory)]
        [string] $Title,

        [Parameter(Mandatory)]
        [System.Collections.IEnumerable] $Items
    )

    $array = @($Items)

    Write-Host ""
    Write-Host "============================================================"
    Write-Host "$Title ($($array.Count))"
    Write-Host "============================================================"

    if ($array.Count -eq 0) {
        Write-Host "None."
        return
    }

    foreach ($item in $array) {
        Write-Host ""
        Write-Host "$($item.File)"
        Write-Host "  $($item.Message)"
    }
}

Show-Issues -Title "ERRORS" -Items $errors
Show-Issues -Title "WARNINGS" -Items $warnings
Show-Issues -Title "REVIEW ONLY" -Items $info

# ------------------------------------------------------------
# Summary
# ------------------------------------------------------------

Write-Host ""
Write-Host "============================================================"
Write-Host "Summary"
Write-Host "============================================================"
Write-Host "Lean files : $($leanFiles.Count)"
Write-Host "Errors     : $($errors.Count)"
Write-Host "Warnings   : $($warnings.Count)"
Write-Host "Review     : $($info.Count)"
Write-Host ""

if ($errors.Count -gt 0) {
    Write-Host "FAIL: module migration issues found."
    exit 1
}

Write-Host "PASS: no structural module errors found."

if ($warnings.Count -gt 0) {
    Write-Host "Review warnings before considering the migration complete."
}

exit 0
