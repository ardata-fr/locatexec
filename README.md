
<!-- README.md is generated from README.Rmd. Please edit that file -->

# locatexec

<!-- badges: start -->

[![R build
status](https://github.com/ardata-fr/locatexec/workflows/R-CMD-check/badge.svg)](https://github.com/ardata-fr/locatexec/actions)
<!-- badges: end -->

The package aims to allow the localization of external programs such as
“python”, “Google Chrome”, “node.js” and “LibreOffice” in order to be
able to easily call them from R.

This makes it easier to call these programs from R from various
operating systems.

``` r
library(locatexec)

if(exec_available("node")){
  message(exec_version("node"))
  message(node_exec())
}
#> 12.16.0
#> C:/Program Files/nodejs/node.exe
```

| exec        | exec\_fun            | available | version      | path                                                                  |
| :---------- | :------------------- | :-------- | :----------- | :-------------------------------------------------------------------- |
| node        | `node_exec()`        | TRUE      | 12.16.0      | C:/Program Files/nodejs/node.exe                                      |
| chrome      | `chrome_exec()`      | TRUE      | 89.0.4389.82 | C:/Program Files (x86)/Google/Chrome/Application/chrome.exe           |
| python      | `python_exec()`      | TRUE      | 3.9.1        | C:/Users/dgohe/AppData/Local/Programs/Python/Python39/python.exe      |
| libreoffice | `libreoffice_exec()` | TRUE      | 7.1.0.3      | C:/Program Files/LibreOffice/program/soffice.com                      |
| excel       | `excel_exec()`       | TRUE      | 16           | C:/Program Files/Microsoft Office/root/Office16/EXCEL.exe             |
| powerpoint  | `powerpoint_exec()`  | TRUE      | 16           | C:/Program Files/Microsoft Office/root/Office16/POWERPNT.exe          |
| pip         | `pip_exec()`         | TRUE      | 20.2.3       | C:/Users/dgohe/AppData/Local/Programs/Python/Python39/Scripts/pip.exe |
| firefox     | `firefox_exec()`     | TRUE      | 86.0.1       | C:/Program Files/Mozilla Firefox/firefox.exe                          |
| npm         | `npm_exec()`         | TRUE      | 6.13.4       | C:/Program Files/nodejs/npm.cmd                                       |
| word        | `word_exec()`        | TRUE      | 16           | C:/Program Files/Microsoft Office/root/Office16/WINWORD.exe           |

## Motivations

This was motivated by the need for tools similar to
`rmarkdown::pandoc_available()` and `rmarkdown::pandoc_exec()` but
allowing to locate external programs other than `pandoc`.

I need to use these programs from R without having heavy dependencies.
These functions will mainly be used to automate some visual tests or to
improve the documentation of other packages.

## Installation

You can install the CRAN version with:

``` r
install.packages("locatexec")
```

## Related work

  - Packages pagedown is providing `find_chrome()` for finding “Google
    Chrome”.
    
  - Packages findpython is providing `find_python_cmd()` for finding "python".

  - If you want to go deeper with ‘R’ and ‘node.js’, I recommend package
    [packer](https://packer.john-coene.com/).

  - If you want to go deeper with ‘R’ and ‘Python’, I recommend package
    [reticulate](https://rstudio.github.io/reticulate/).
