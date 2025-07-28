# Nix Rocq Development Environment

A cross-platform Nix flake for Rocq development environment with multi-system support.

## Supported Systems

- `x86_64-linux` - Intel/AMD Linux
- `aarch64-linux` - ARM Linux
- `x86_64-darwin` - Intel Mac
- `aarch64-darwin` - Apple Silicon Mac (M1/M2/M3)

## Quick Start

### Use as Template (Recommended)

Create a new project using this flake as a template:

```bash
nix flake new -t github:Godalin/nix-rocq my-rocq-project
cd my-rocq-project
nix develop
```

### Direct Use

Use this flake directly without creating a local copy:

```bash
nix develop github:godalin/nix-rocq
```

### Local Development

Clone and use locally:

```bash
git clone https://github.com/godalin/nix-rocq.git
cd nix-rocq
nix develop
```
