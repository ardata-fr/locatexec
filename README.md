
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
#> 12.18.2
#> /usr/local/bin/node
```

| exec        | exec\_fun            | available | version      | path                                                                       |
| :---------- | :------------------- | :-------- | :----------- | :------------------------------------------------------------------------- |
| node        | `node_exec()`        | TRUE      | 12.18.2      | /usr/local/bin/node                                                        |
| chrome      | `chrome_exec()`      | TRUE      | 89.0.4389.82 | /Applications/Google Chrome.app/Contents/MacOS/Google Chrome               |
| python      | `python_exec()`      | TRUE      | 3.9.1        | /usr/local/bin/python3                                                     |
| libreoffice | `libreoffice_exec()` | TRUE      | 7.1.0.3      | /Applications/LibreOffice.app/Contents/MacOS/soffice                       |
| excel       | `excel_exec()`       | TRUE      | 16.46        | /Applications/Microsoft Excel.app/Contents/MacOS/Microsoft Excel           |
| powerpoint  | `powerpoint_exec()`  | TRUE      | 16.46        | /Applications/Microsoft PowerPoint.app/Contents/MacOS/Microsoft PowerPoint |
| pip         | `pip_exec()`         | TRUE      | 20.3.3       | /usr/local/bin/pip3                                                        |
| firefox     | `firefox_exec()`     | TRUE      | 86.0.1       | /Applications/Firefox.app/Contents/MacOS/firefox                           |
| npm         | `npm_exec()`         | TRUE      | 6.14.5       | /usr/local/bin/npm                                                         |
| word        | `word_exec()`        | TRUE      | 16.46        | /Applications/Microsoft Word.app/Contents/MacOS/Microsoft Word             |

## Motivations

This was motivated by the need for tools similar to
`rmarkdown::pandoc_available()` and `rmarkdown::pandoc_exec()` but
allowing to locate external programs other than `pandoc`.

I need to use these programs from R without having heavy dependencies.
These functions will mainly be used to automate some visual tests or to
improve the documentation of other packages.

## Installation

You can install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("ardata-fr/locatexec")
```

## Related work

  - Packages pagedown is providing `find_chrome()` for finding “Google
    Chrome”.

  - If you want to go deeper with ‘R’ and ‘node.js’, I recommend package
    [packer](https://packer.john-coene.com/).

  - If you want to go deeper with ‘R’ and ‘Python’, I recommend package
    [reticulate](https://rstudio.github.io/reticulate/).
