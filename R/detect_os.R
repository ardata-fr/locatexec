#' @export
#' @title Test if the system is "Windows"
#' @description Test if the operating system is "Windows"
#' @return TRUE or FALSE
#' @family operating system testing
#' @examples
#' is_windows()
is_windows <- function() {
  "windows" %in% .Platform$OS.type
}

#' @export
#' @title Test if the system is "macOS"
#' @description Test if the operating system is "macOS"
#' @return TRUE or FALSE
#' @family operating system testing
#' @examples
#' is_osx()
is_osx <- function() {
  "unix" %in% .Platform$OS.type &&
    "Darwin" %in% Sys.info()["sysname"]
}

#' @export
#' @title Test if the system is "unix"
#' @description Test if the operating system is "unix"
#' @return TRUE or FALSE
#' @family operating system testing
#' @examples
#' is_unix()
is_unix <- function() {
  "unix" %in% .Platform$OS.type &&
    !"Darwin" %in% Sys.info()["sysname"]
}

