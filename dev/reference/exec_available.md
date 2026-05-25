# Check executable availability and version

determine whether an executable is currently available on the user
machine (optionally checking for a specific or greater version).

## Usage

``` r
exec_available(exec, version = NULL, error = FALSE)
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

- version:

  required version of executable

- error:

  if `TRUE`, executes an error action if executable with the required
  version is not found.

## Value

a logical indicating whether the executable is available.

## Examples

``` r
if (exec_available("python")) {
  cat("python", as.character(exec_version("python")), "is available!\n")
}
#> python 3.12.3 is available!
if(exec_available("python", "3.9")) {
  cat("required version of python is available!\n")
}
#> required version of python is available!
if (exec_available("pip")) {
  cat("pip", as.character(exec_version("pip")), "is available!\n")
}
#> pip 24.0 is available!
if (exec_available("pip", "19.3")) {
  cat("pip", as.character(exec_version("pip")), "is available!\n")
}
#> pip 24.0 is available!
if (exec_available("chrome")) {
  cat("chrome", as.character(exec_version("chrome")), "is available!\n")
}
if (exec_available("firefox")) {
  cat("firefox", as.character(exec_version("firefox")), "is available!\n")
}
#> firefox 150.0.3 is available!
if (exec_available("node")) {
  cat("node.js", as.character(exec_version("node")), "is available!\n")
}
#> node.js 22.22.3 is available!
if (exec_available("npm")) {
  cat("npm", as.character(exec_version("npm")), "is available!\n")
}
#> npm 10.9.8 is available!
if (exec_available("npm", version = "10.13.0")) {
  cat("npm", as.character(exec_version("npm")), "is available!\n")
}
if (exec_available("air")) {
  cat("air", as.character(exec_version("air")), "is available!\n")
}
if (exec_available("pandoc")) {
  cat("pandoc", as.character(exec_version("pandoc")), "is available!\n")
}
#> pandoc 3.8.3 is available!
if (exec_available("excel")) {
  cat("excel", as.character(exec_version("excel")), "is available!\n")
}
if (exec_available("word")) {
  cat("word", as.character(exec_version("word")), "is available!\n")
}
if (exec_available("powerpoint")) {
  cat("powerpoint", as.character(exec_version("powerpoint")), "is available!\n")
}
```
