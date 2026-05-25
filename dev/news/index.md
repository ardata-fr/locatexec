# Changelog

## locatexec 0.1.2

- Add detection of the ‘air’ executable (R formatter).
- Add detection of the ‘Pandoc’ executable.
- Make version parsing robust: an executable emitting an unexpected
  `--version` output (e.g. the Firefox snap wrapper on Ubuntu) no longer
  raises “invalid version specification” but is reported as not found.
- Fix `min_version_available(version=...)`
- Set `NODE_DISABLE_COMPILE_CACHE=1` when calling node/npm to avoid
  leaving a `node-compile-cache` directory in the temp directory.

## locatexec 0.1.1

CRAN release: 2021-05-19

- Added some timeout when system2 is called.
- change python reference order for execs, see `.exec_names$python` and
  `.exec_names$pip`
