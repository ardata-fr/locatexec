# Path to 'pandoc' executable

return the full path of 'pandoc' executable if found.

## Usage

``` r
pandoc_exec()
```

## Value

executable full path in a character vector of length 1.

## See also

Other executable full path:
[`air_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/air_exec.md),
[`chrome_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/chrome_exec.md),
[`excel_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/excel_exec.md),
[`firefox_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/firefox_exec.md),
[`libreoffice_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/libreoffice_exec.md),
[`node_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/node_exec.md),
[`npm_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/npm_exec.md),
[`pip_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/pip_exec.md),
[`powerpoint_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/powerpoint_exec.md),
[`python_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/python_exec.md),
[`word_exec()`](https://ardata-fr.github.io/locatexec/dev/reference/word_exec.md)

## Examples

``` r
if(exec_available("pandoc"))
  message(pandoc_exec())
#> /opt/hostedtoolcache/pandoc/3.8.3/x64/pandoc
```
