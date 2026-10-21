# locatexec 0.2.1

* On Linux, executables are now run without the `LD_LIBRARY_PATH` set by R
  to read their version. R prepends its own library directories to this
  variable and 'LibreOffice' was then failing ("libreglo.so: cannot open
  shared object file") or aborting, so that it was not detected.

# locatexec 0.2.0

* Add detection of the 'air' executable (R formatter).
* Add detection of the 'Pandoc' executable.
* Make version parsing robust: an executable emitting an unexpected `--version` 
output (e.g. the Firefox snap wrapper on Ubuntu) no longer raises "invalid 
version specification" but is reported as not found.
* Fix `min_version_available(version=...)`
* Set `NODE_DISABLE_COMPILE_CACHE=1` when calling node/npm to avoid leaving a `node-compile-cache` directory in the temp directory.

# locatexec 0.1.1

* Added some timeout when system2 is called.
* change python reference order for execs, see `.exec_names$python` and `.exec_names$pip` 
