# SE Theory: Transformation

[![Docs Site](https://img.shields.io/badge/docs-site-blue?logo=github)](https://structural-explainability.github.io/se-theory-transformation/)
[![Repo](https://img.shields.io/badge/repo-GitHub-black?logo=github)](https://github.com/structural-explainability/se-theory-transformation)
[![Tooling](https://img.shields.io/badge/python-3.15%2B-blue?logo=python)](./pyproject.toml)
[![License](https://img.shields.io/badge/license-Apache--2.0-yellow.svg)](./LICENSE)

[![CI-Lean](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-lean.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-lean.yml)
[![CI](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-python-zensical.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-python-zensical.yml)
[![Docs](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/deploy-zensical-lean.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/deploy-zensical-lean.yml)
[![Links](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/links.yml)
[![Dependabot](https://img.shields.io/badge/Dependabot-enabled-brightgreen.svg)](https://github.com/structural-explainability/se-theory-transformation/security)

> Lean 4 formalization of foundational transformation theory for
> Structural Explainability.

This repository defines structural transformation vocabulary,
intrinsic effect semantics, and
selected relations among transformation operators.

It does not decide what persists through a transformation.

## Scope

Transformation theory defines transformation kinds, families, operations,
atomic effect semantics, effect dimensions, operator footprints,
required-change conditions, finite sequences of atomic steps,
composition relations, and orthogonality relations.

Persistence judgments and operational policy are out of this scope.

## Authority

Lean source files are authoritative for formal definitions, predicates, axioms,
theorems, proof obligations, and reference rules.

Reference artifacts under `reference/` and generated artifacts under
`data/` mirror the Lean public surface.
They do not define theory semantics independently of Lean.

The CI-Lean workflow builds the declared public Lean surface with
`lake build --wfail`,
failing on reported warnings, including `sorry`.
Successful compilation verifies formal declarations against their
stated assumptions; it does not establish the scientific adequacy
of those assumptions or interpretations.

## Import

Import the public surface:

```lean
import SE.Transformation
```

## Developer

Maintain:

- `lakefile.toml` and
- `lean-toolchain`
- `reference/theory-reference.toml` - hand-maintained configuration
- `reference/*.toml` - reference source artifacts
- Lean source and RR traceability comments (`-- RR.DEFINES`, `-- RR.IMPLEMENTS`) - hand-maintained theory source

Documentation rule:

- Describe concepts positively.
- Define scope clearly in README.md, SE_MANIFEST.toml, and docs/en/index.md.

### Clone and Open in VS Code

Open a machine terminal where you want the project
and open in VS Code:

```shell
git clone https://github.com/structural-explainability/se-theory-transformation

cd se-theory-transformation
code .
```

### Setup and Run

Use VS Code Menu:
View / Command Palette / `Developer: Reload Window` to refresh.

```shell
.\sit.ps1
.\rel.ps1

# inspect shared theory-reference command surface
uvx se-theory-reference-kit@latest --help
uvx se-theory-reference-kit@latest validate --help
uvx se-theory-reference-kit@latest scaffold --help
uvx se-theory-reference-kit@latest export --help
uvx se-theory-reference-kit@latest catalog --help
uvx se-theory-reference-kit@latest inspect --help

# validate reference artifacts against the declared Lean public surface
uvx se-theory-reference-kit@latest validate
uvx se-theory-reference-kit@latest validate --strict

# scaffold reference artifacts from Lean public declarations
uvx se-theory-reference-kit@latest scaffold
uvx se-theory-reference-kit@latest scaffold --dry-run
uvx se-theory-reference-kit@latest scaffold --overwrite

# regenerate or check generated JSON artifacts from reference TOML
uvx se-theory-reference-kit@latest export
uvx se-theory-reference-kit@latest export --check

# build or verify the generated reference catalog
uvx se-theory-reference-kit@latest catalog
uvx se-theory-reference-kit@latest catalog --check

# inspect resolved repository configuration and reference declarations
uvx se-theory-reference-kit@latest inspect

# validate SE manifest file
uvx se-manifest-schema validate-manifest --strict

# save progress
git add -A
git commit -m "update"
git push -u origin main
```

## Authority Manifest

[.accountability/surfaces.toml](./.accountability/surfaces.toml)

## Changelog

[CHANGELOG.md](./CHANGELOG.md)

## Citation

[CITATION.cff](./CITATION.cff)

## Documentation

[Documentation](https://structural-explainability.github.io/se-theory-transformation/)

## License

[Apache 2.0](./LICENSE)

## Repository Manifest

[SE_MANIFEST.toml](./SE_MANIFEST.toml)
