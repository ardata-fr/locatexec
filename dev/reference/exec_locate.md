# Find an executable

Searches for an executable in a some places and use the highest version
found (unless a specific version is requested).

The function mimic the behavior of the
[`rmarkdown::find_pandoc()`](https://pkgs.rstudio.com/rmarkdown/reference/find_pandoc.html)
function in order to locate programs.

Some methods work differently depending on the OS or the program:

- Under Windows, the search for 'Google Chrome', 'Mozilla Firefox',
  'Microsoft Word', 'Microsoft PowerPoint' and 'Microsoft Excel' is done
  in the registry, which means that only one version can be chosen, the
  one referenced in the registry. (you still can force another path with
  argument `dir`).

- 'Microsoft Word', 'Microsoft PowerPoint' and 'Microsoft Excel' can not
  be located on linux OS.

- the search for 'pip' is using the result of the search of 'python' to
  find the corresponding 'pip' executable.

- the search for 'pandoc' also looks into the directory referenced by
  the `RSTUDIO_PANDOC` environment variable (the copy bundled with
  'RStudio' and 'Quarto'), in addition to the `PATH`.

## Usage

``` r
exec_locate(exec, cache = TRUE, dir = NULL, version = NULL)
```

## Arguments

- exec:

  executable identifier, a single character. Use one of these values:

  - `chrome`: 'Google Chrome' executable

  - `firefox`: 'Mozilla Firefox' executable

  - `libreoffice`: 'LibreOffice' executable

  - `node`: 'node.js' executable

  - `npm`: 'npm' executable

  - `air`: 'air' R formatter and language server executable

  - `pandoc`: 'Pandoc' document converter executable

  - `python`: 'python' executable

  - `pip`: 'pip' executable

  - `excel`: 'Microsoft Excel' executable

  - `word`: 'Microsoft Word' executable

  - `powerpoint`: 'Microsoft PowerPoint' executable

- cache:

  if `FALSE`, search for the executable again even if the executable has
  been found previously.

- dir:

  A character vector of directory paths under which the executable may
  be found.

- version:

  The version of the executable to look for (e.g., `"14.15.4"`). If NULL
  (the default), it searches for the highest version.

## Value

A list containing the path of the executable and its version if found.
If not found, the version will be `0` and the `exec_file` will be
`NULL`.

## libreoffice

On some Ubuntu platforms, 'LibreOffice' require to add in the
environment variable `LD_LIBRARY_PATH` the following path:
`/usr/lib/libreoffice/program` (you should see the message "libreglo.so
cannot open shared object file" if it is the case). This can be done
with R command
`Sys.setenv(LD_LIBRARY_PATH = "/usr/lib/libreoffice/program/")`

## See also

[`exec_available()`](https://ardata-fr.github.io/locatexec/dev/reference/exec_available.md)
will check if an executable is available and
[`exec_version()`](https://ardata-fr.github.io/locatexec/dev/reference/exec_version.md)
will return the version of a located executable.

## Examples

``` r
exec_locate("firefox")
#> $exec_file
#> [1] "/usr/bin/firefox"
#> 
#> $version
#> [1] ‘150.0.3’
#> 
exec_locate("chrome")
#> $exec_file
#> NULL
#> 
#> $version
#> [1] ‘0’
#> 
exec_locate("chrome", version = "88.0.4324.150")
#> $exec_file
#> NULL
#> 
#> $version
#> [1] ‘0’
#> 
exec_locate("libreoffice")
#> $exec_file
#> NULL
#> 
#> $version
#> [1] ‘0’
#> 
exec_locate("node")
#> $exec_file
#> [1] "/usr/local/bin/node"
#> 
#> $version
#> [1] ‘22.22.3’
#> 
exec_locate("npm")
#> $exec_file
#> [1] "/usr/local/bin/npm"
#> 
#> $version
#> [1] ‘10.9.8’
#> 
exec_locate("air")
#> $exec_file
#> NULL
#> 
#> $version
#> [1] ‘0’
#> 
exec_locate("pandoc")
#> $exec_file
#> [1] "/opt/hostedtoolcache/pandoc/3.8.3/x64/pandoc"
#> 
#> $version
#> [1] ‘3.8.3’
#> 
exec_locate("python")
#> $exec_file
#> [1] "/usr/bin/python3"
#> 
#> $version
#> [1] ‘3.12.3’
#> 
exec_locate("pip")
#> $exec_file
#> [1] "/usr/bin/pip3"
#> 
#> $version
#> [1] ‘24.0’
#> 
exec_locate("excel")
#> $exec_file
#> NULL
#> 
#> $version
#> [1] ‘0’
#> 
exec_locate("word")
#> $exec_file
#> NULL
#> 
#> $version
#> [1] ‘0’
#> 
exec_locate("powerpoint")
#> $exec_file
#> NULL
#> 
#> $version
#> [1] ‘0’
#> 
```
