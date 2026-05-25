# Get executable version

get the version of an executable.

## Usage

``` r
exec_version(exec)
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

## Value

a [`numeric_version()`](https://rdrr.io/r/base/numeric_version.html)
with the version of the executable found.

## Examples

``` r
if(exec_available("chrome"))
  message(exec_version("chrome"))
if(exec_available("node"))
  message(exec_version("node"))
#> 22.22.3
if(exec_available("air"))
  message(exec_version("air"))
if(exec_available("pandoc"))
  message(exec_version("pandoc"))
#> 3.8.3
if(exec_available("python"))
  message(exec_version("python"))
#> 3.12.3
if(exec_available("libreoffice"))
  message(exec_version("libreoffice"))
if(exec_available("word"))
  message(exec_version("word"))
if(exec_available("powerpoint"))
  message(exec_version("powerpoint"))
if(exec_available("firefox"))
  message(exec_version("firefox"))
#> 150.0.3
```
