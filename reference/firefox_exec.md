# Path to 'Mozilla Firefox' executable

return the full path of 'Mozilla Firefox' executable if found.

## Usage

``` r
firefox_exec()
```

## Value

Firefox executable full path in a character vector of length 1.

## See also

Other executable full path:
[`air_exec()`](https://ardata-fr.github.io/locatexec/reference/air_exec.md),
[`chrome_exec()`](https://ardata-fr.github.io/locatexec/reference/chrome_exec.md),
[`excel_exec()`](https://ardata-fr.github.io/locatexec/reference/excel_exec.md),
[`libreoffice_exec()`](https://ardata-fr.github.io/locatexec/reference/libreoffice_exec.md),
[`node_exec()`](https://ardata-fr.github.io/locatexec/reference/node_exec.md),
[`npm_exec()`](https://ardata-fr.github.io/locatexec/reference/npm_exec.md),
[`pandoc_exec()`](https://ardata-fr.github.io/locatexec/reference/pandoc_exec.md),
[`pip_exec()`](https://ardata-fr.github.io/locatexec/reference/pip_exec.md),
[`powerpoint_exec()`](https://ardata-fr.github.io/locatexec/reference/powerpoint_exec.md),
[`python_exec()`](https://ardata-fr.github.io/locatexec/reference/python_exec.md),
[`word_exec()`](https://ardata-fr.github.io/locatexec/reference/word_exec.md)

## Examples

``` r
if(exec_available("firefox"))
  message(firefox_exec())
#> /usr/bin/firefox
```
