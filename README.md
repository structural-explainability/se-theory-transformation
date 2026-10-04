# SE Theory: Transformation

[![Docs Site](https://img.shields.io/badge/docs-site-blue?logo=github)](https://structural-explainability.github.io/se-theory-transformation/)
[![Repo](https://img.shields.io/badge/repo-GitHub-black?logo=github)](https://github.com/structural-explainability/se-theory-transformation)
[![Tooling](https://img.shields.io/badge/python-3.15%2B-blue?logo=python)](./pyproject.toml)
[![License](https://img.shields.io/badge/license-MIT-yellow.svg)](./LICENSE)

[![CI-Lean](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-lean.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-lean.yml)
[![CI](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-python-zensical.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/ci-python-zensical.yml)
[![Docs](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/deploy-zensical-lean.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/deploy-zensical-lean.yml)
[![Links](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation/actions/workflows/links.yml)
[![Dependabot](https://img.shields.io/badge/Dependabot-enabled-brightgreen.svg)](https://github.com/structural-explainability/se-theory-transformation/security)

> Lean 4 formalization of foundational transformation theory for
> Structural Explainability.

This repository defines structural transformation vocabulary and relations.

It does not decide what persists through a transformation.

## Scope

Transformation theory defines transformation kinds, families, operations,
composition relations, and orthogonality relations.

Persistence judgments and operational policy are out of this scope.

## Authority

Lean source files are authoritative for formal definitions, predicates, axioms,
theorems, proof obligations, and reference rules.

Reference artifacts under `reference/` declare the repository-owned
classification, traceability, and export intent for the Lean public surface.

Generated artifacts under `data/` are outputs.
They do not define theory semantics independently of Lean or the reference artifacts.

The reusable `se-theory-reference-kit` owns the generic validation,
cataloging, inspection, and export machinery.
This repository owns its Lean source, reference declarations, and
generated artifacts.

## Import

Import the public surface:

```lean
import SE.Transformation
```

## Lean Module Convention

Production Lean code uses the `SE.*` namespace.

- `SE.lean` is the repository production entry point.
- `SE/<Project>.lean` is the project public import surface.
- Production modules live under `SE/<Project>/`.

Test Lean code uses the `SETest.*` namespace.

- `SETest.lean` is the repository test entry point.
- `SETest/<Project>.lean` is the project test surface.
- Test modules live under `SETest/<Project>/`.

`Spec.lean` is used when the project defines a specification module.

## Reference Configuration

The theory-reference workflow is configured by:
`reference/theory-reference.toml`.

That file declares this repository's Lean public modules,
reference artifact layout, export targets, and validation commands.
Public symbols are declared in the reference artifacts.

## Developer

Maintain:

- `lakefile.toml` and
- `lean-toolchain`
- `reference/theory-reference.toml` - hand-maintained configuration
- `reference/*.toml` - hand-maintained/scaffolded reference source artifacts
- Lean source + RR comments - hand-maintained theory source

Documentation rule:

- Describe concepts positively.
- Define scope clearly in README.md, SE_MANIFEST.md, and docs/en/index.md.

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

[MIT](./LICENSE)

## Repository Manifest

[SE_MANIFEST.toml](./SE_MANIFEST.toml)
