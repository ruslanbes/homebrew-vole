# ruslanbes/vole (Homebrew tap)

Homebrew tap for [vole](https://github.com/ruslanbes/vole) — a macOS CLI that records
why each installed piece of software is there.

## Install

```sh
brew install ruslanbes/vole/vole
```

Or:

```sh
brew tap ruslanbes/vole
brew install vole
```

Data lives in `~/.config/vole/` (created on first `vole scan`).

## Upgrade

After a new [vole release](https://github.com/ruslanbes/vole/releases), this tap’s
formula is bumped; then:

```sh
brew update
brew upgrade vole
```

## Documentation

See the [vole README](https://github.com/ruslanbes/vole#readme) and `brew help`.
