# NovaNode

AI token usage status CLI for **Claude**, **Codex**, and **Cursor**.

Ships `novanode` for package info and `nn-usage` for the AI usage dashboard.

## Install

### Homebrew (macOS, recommended)

```sh
brew tap nachogonz/novanode-resgistry https://github.com/nachogonz/novanode-resgistry
brew install novanode
```

After tapping, you can also install with the fully qualified formula name:

```sh
brew install nachogonz/novanode-resgistry/novanode
```

If `brew install novanode` says no formula is available, the tap has not been
installed yet. Run the `brew tap` command above first.

### npm (global)

```sh
npm install -g @nakdev-npm/novanode
```

Both channels install `novanode` and `nn-usage` onto your `PATH`.

## Usage

```sh
novanode  # package info
nn-usage  # AI usage dashboard
```

## Requirements

- `bash`
- `python3` (used for the inline progress bar rendering)
- macOS or Linux

## Release flow

Releases are driven by git tags. To cut a new version:

```sh
npm version patch   # or minor / major — updates package.json + creates git tag
git push
git push --tags
```

The `release.yml` workflow publishes to npm on tag push. After the tag lands
on GitHub, update [`Formula/novanode.rb`](./Formula/novanode.rb) with the new
`url` and `sha256`:

```sh
curl -L https://github.com/nachogonz/novanode-resgistry/archive/refs/tags/vX.Y.Z.tar.gz \
  | shasum -a 256
```

## License

MIT — see [LICENSE](./LICENSE).
