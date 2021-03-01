#' @export
#' @title Get executable version
#' @description get the version of an executable.
#' @param exec executable identifier, a single character.
#' Use one of these values:
#'
#' * `chrome`: 'Google Chrome' executable
#' * `firefox`: 'Mozilla Firefox' executable
#' * `libreoffice`: 'LibreOffice' executable
#' * `node`: 'node.js' executable
#' * `npm`: 'npm' executable
#' * `python`: 'python' executable
#' * `pip`: 'pip' executable
#' * `excel`: 'Microsoft Excel' executable
#' * `word`: 'Microsoft Word' executable
#' * `powerpoint`: 'Microsoft PowerPoint' executable
#'
#' @return a [numeric_version()] with the version of the executable found.
#' @examples
#' if(exec_available("chrome"))
#'   message(exec_version("chrome"))
#' if(exec_available("node"))
#'   message(exec_version("node"))
#' if(exec_available("python"))
#'   message(exec_version("python"))
#' if(exec_available("libreoffice"))
#'   message(exec_version("libreoffice"))
#' if(exec_available("word"))
#'   message(exec_version("word"))
#' if(exec_available("powerpoint"))
#'   message(exec_version("powerpoint"))
#' if(exec_available("firefox"))
#'   message(exec_version("firefox"))
exec_version <- function(exec) {
  exec <- match.arg(exec, choices = supported_exec, several.ok = FALSE)
  exec_locate(exec)
  .exec[[exec]]$version
}

