# Package index

## Detect and locate executables

Core functions to check whether a program is installed, get its version,
and retrieve the path to its executable. exec_available() tests
availability (optionally for a minimum version), exec_version() returns
the version found, and exec_locate() performs the search.

- [`exec_available()`](https://ardata-fr.github.io/locatexec/reference/exec_available.md)
  : Check executable availability and version
- [`exec_version()`](https://ardata-fr.github.io/locatexec/reference/exec_version.md)
  : Get executable version
- [`exec_locate()`](https://ardata-fr.github.io/locatexec/reference/exec_locate.md)
  : Find an executable

## Path to a specific executable

Convenience wrappers that return the full path to a given program,
regardless of the operating system and its configuration.

- [`air_exec()`](https://ardata-fr.github.io/locatexec/reference/air_exec.md)
  : Path to 'air' executable
- [`chrome_exec()`](https://ardata-fr.github.io/locatexec/reference/chrome_exec.md)
  : Path to 'Google Chrome' executable
- [`excel_exec()`](https://ardata-fr.github.io/locatexec/reference/excel_exec.md)
  : Path to 'Microsoft Execl' executable
- [`firefox_exec()`](https://ardata-fr.github.io/locatexec/reference/firefox_exec.md)
  : Path to 'Mozilla Firefox' executable
- [`libreoffice_exec()`](https://ardata-fr.github.io/locatexec/reference/libreoffice_exec.md)
  : Path to 'LibreOffice' executable
- [`node_exec()`](https://ardata-fr.github.io/locatexec/reference/node_exec.md)
  : Path to 'node.js' executable
- [`npm_exec()`](https://ardata-fr.github.io/locatexec/reference/npm_exec.md)
  : Path to 'npm' executable
- [`pandoc_exec()`](https://ardata-fr.github.io/locatexec/reference/pandoc_exec.md)
  : Path to 'pandoc' executable
- [`pip_exec()`](https://ardata-fr.github.io/locatexec/reference/pip_exec.md)
  : Path to 'pip' executable
- [`powerpoint_exec()`](https://ardata-fr.github.io/locatexec/reference/powerpoint_exec.md)
  : Path to 'Microsoft PowerPoint' executable
- [`python_exec()`](https://ardata-fr.github.io/locatexec/reference/python_exec.md)
  : Path to 'python' executable
- [`word_exec()`](https://ardata-fr.github.io/locatexec/reference/word_exec.md)
  : Path to 'Microsoft Word' executable

## Operating system

Helpers to test which operating system R is running on.

- [`is_windows()`](https://ardata-fr.github.io/locatexec/reference/is_windows.md)
  : Test if the system is "Windows"
- [`is_osx()`](https://ardata-fr.github.io/locatexec/reference/is_osx.md)
  : Test if the system is "macOS"
- [`is_unix()`](https://ardata-fr.github.io/locatexec/reference/is_unix.md)
  : Test if the system is "unix"
