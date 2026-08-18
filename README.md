# Kopuz-org Tap

Homebrew packages for [Kopuz](https://github.com/Kopuz-org/kopuz), a fast, modern music player built with Rust and Dioxus.

## Install

```bash
brew install --cask kopuz-org/tap/kopuz
```

Or tap first, then install:

```bash
brew tap kopuz-org/tap
brew install --cask kopuz
```

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "kopuz-org/tap"
cask "kopuz"
```

The build is Apple Silicon only and signed ad-hoc rather than notarized, so Gatekeeper blocks the first launch. Either install with `--no-quarantine`:

```bash
brew install --cask --no-quarantine kopuz-org/tap/kopuz
```

or clear the flag once after installing:

```bash
xattr -d com.apple.quarantine /Applications/Kopuz.app
```

## Updating

`Casks/kopuz.rb` is bumped automatically by the `update-tap` workflow in the main repo whenever a `v*` tag is released. To do it by hand:

```bash
brew bump-cask-pr --version <new version> --write-only kopuz-org/tap/kopuz
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
