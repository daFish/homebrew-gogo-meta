# homebrew-gogo-meta

A [Homebrew](https://brew.sh) tap for [`gogo`](https://github.com/daFish/gogo-meta) —
a modern Go CLI for managing multi-repository projects.

> **Rename required:** for the commands below to work, the GitHub repository must be
> named **`homebrew-gogo-meta`**. Homebrew derives the tap name `daFish/gogo-meta` by
> stripping the mandatory `homebrew-` prefix.

## Install

```sh
brew install --cask daFish/gogo-meta/gogo
```

This taps `daFish/gogo-meta` automatically on first use. Equivalently, tap first:

```sh
brew tap daFish/gogo-meta
brew install --cask gogo
```

## Upgrade

```sh
brew upgrade --cask gogo
```

## Uninstall

```sh
brew uninstall --cask gogo
brew untap daFish/gogo-meta
```

## Notes

- **macOS only.** Homebrew casks do not support Linux. Linux users should grab a
  [pre-built binary](https://github.com/daFish/gogo-meta/releases) or use the
  [container image](https://github.com/daFish/gogo-meta/pkgs/container/gogo-meta).
- **Apple Silicon and Intel** are both covered; Homebrew selects the matching build.
- The released binaries are ad-hoc signed but not notarized. The cask strips the
  `com.apple.quarantine` attribute on install so macOS Gatekeeper does not block the
  first run.

## Maintaining the cask

Each upstream release requires bumping `version` and both `sha256` values in
[`Casks/gogo.rb`](Casks/gogo.rb). Fetch the checksums from the release:

```sh
gh release download vX.Y.Z --repo daFish/gogo-meta --pattern checksums.txt -O -
```

To automate this, add a
[`homebrew_casks`](https://goreleaser.com/customization/homebrew_casks/) block to the
upstream project's `.goreleaser.yaml` so GoReleaser commits an updated `Casks/gogo.rb`
to this tap on every release (requires a repo-scoped token with write access here).
