# locatexec 0.1.2

* Fix `min_version_available(version=...)`
* Set `NODE_DISABLE_COMPILE_CACHE=1` when calling node/npm to avoid leaving a `node-compile-cache` directory in the temp directory.

# locatexec 0.1.1

* Added some timeout when system2 is called.
* change python reference order for execs, see `.exec_names$python` and `.exec_names$pip` 
