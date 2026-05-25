
<!-- README.md is generated from README.Rmd. Please edit that file -->

# locatexec

<!-- badges: start -->

[![R build
status](https://github.com/ardata-fr/locatexec/workflows/R-CMD-check/badge.svg)](https://github.com/ardata-fr/locatexec/actions)
[![version](https://www.r-pkg.org/badges/version/locatexec)](https://CRAN.R-project.org/package=locatexec)
[![codecov test
coverage](https://codecov.io/gh/ardata-fr/locatexec/branch/main/graph/badge.svg)](https://app.codecov.io/gh/ardata-fr/locatexec)
<!-- badges: end -->

The package helps locate external programs such as “python”, “Google
Chrome”, “node.js” and “LibreOffice” so that they can be called easily
from R.

This makes it easier to call these programs from R across various
operating systems.

``` r
library(locatexec)

if(exec_available("node")){
  message(exec_version("node"))
  message(node_exec())
}
#> 26.0.0
#> /opt/homebrew/bin/node
```

| exec | exec_fun | available | version | path |
|:---|:---|:---|:---|:---|
| node | `node_exec()` | TRUE | 26.0.0 | /opt/homebrew/bin/node |
| chrome | `chrome_exec()` | TRUE | 148.0.7778.179 | /Applications/Google Chrome.app/Contents/MacOS/Google Chrome |
| python | `python_exec()` | TRUE | 3.9.6 | /usr/bin/python3 |
| libreoffice | `libreoffice_exec()` | TRUE | 26.2.3.2 | /opt/homebrew/bin/soffice |
| excel | `excel_exec()` | TRUE | 16.109.1 | /Applications/Microsoft Excel.app/Contents/MacOS/Microsoft Excel |
| powerpoint | `powerpoint_exec()` | TRUE | 16.109.1 | /Applications/Microsoft PowerPoint.app/Contents/MacOS/Microsoft PowerPoint |
| pip | `pip_exec()` | TRUE | 21.2.4 | /usr/bin/pip3 |
| firefox | `firefox_exec()` | TRUE | 151.0.1 | /Applications/Firefox.app/Contents/MacOS/firefox |
| npm | `npm_exec()` | TRUE | 11.12.1 | /opt/homebrew/bin/npm |
| word | `word_exec()` | TRUE | 16.109.1 | /Applications/Microsoft Word.app/Contents/MacOS/Microsoft Word |
| air | `air_exec()` | TRUE | 0.8.0 | /Users/username/.local/bin/air |
| pandoc | `pandoc_exec()` | TRUE | 3.9.0.2 | /opt/homebrew/bin/pandoc |

## Motivations

This was motivated by the need for tools similar to
`rmarkdown::pandoc_available()` and `rmarkdown::pandoc_exec()` but
allowing to locate external programs other than `pandoc`.

I needed to call these programs from R without pulling in heavy
dependencies.

## Installation

You can install the CRAN version with:

``` r
install.packages("locatexec")
```

## Related work

- Package pagedown provides `find_chrome()` for finding “Google Chrome”.

- Package findpython provides `find_python_cmd()` for finding “python”.

- If you want to go deeper with ‘R’ and ‘node.js’, I recommend package
  [packer](https://packer.john-coene.com/).

- If you want to go deeper with ‘R’ and ‘Python’, I recommend package
  [reticulate](https://rstudio.github.io/reticulate/).
