#' @title Check executable availability and version
#' @description determine whether an executable is
#' currently available on the user machine (optionally checking for
#' a specific or greater version).
#' @inheritParams exec_version
#' @param version required version of executable
#' @param error if `TRUE`, executes an error action if executable
#' with the required version is not found.
#' @return a logical indicating whether the executable is available.
#' @examples
#' if (exec_available("python")) {
#'   cat("\npython", as.character(exec_version("python")), "is available!\n")
#' }
#' py_path <- "~/../AppData/Local/Programs/Python/Python39"
#' if(dir.exists(py_path)){
#'   exec_locate("python", dir = py_path, cache = FALSE)
#' }
#' if(exec_available("python", "3.9")) {
#'   cat("required version of python is available!\n")
#' }
#' if (exec_available("pip")) {
#'   cat("pip", as.character(exec_version("pip")), "is available!\n")
#' }
#' if (exec_available("pip", "19.3")) {
#'   cat("pip", as.character(exec_version("pip")), "is available!\n")
#' }
#' if (exec_available("chrome")) {
#'   cat("chrome", as.character(exec_version("chrome")), "is available!\n")
#' }
#' if (exec_available("firefox")) {
#'   cat("firefox", as.character(exec_version("firefox")), "is available!\n")
#' }
#' if (exec_available("node")) {
#'   cat("node.js", as.character(exec_version("node")), "is available!\n")
#' }
#' if (exec_available("npm")) {
#'   cat("npm", as.character(exec_version("npm")), "is available!\n")
#' }
#' if (exec_available("npm", version = "10.13.0")) {
#'   cat("npm", as.character(exec_version("npm")), "is available!\n")
#' }
#' if (exec_available("excel")) {
#'   cat("excel", as.character(exec_version("excel")), "is available!\n")
#' }
#' if (exec_available("word")) {
#'   cat("word", as.character(exec_version("word")), "is available!\n")
#' }
#' if (exec_available("powerpoint")) {
#'   cat("powerpoint", as.character(exec_version("powerpoint")), "is available!\n")
#' }
#' @export
exec_available <- function(exec, version = NULL, error = FALSE) {
  exec <- match.arg(exec, choices = supported_exec, several.ok = FALSE)
  exec_locate(exec)
  x <- min_version_available(exec = exec, version = version)

  msg <- c(
    exec,
    if (!is.null(version)) c("version", version, "or higher"),
    "is required and was not found.")

  if (error && !x)
    stop(paste(msg, collapse = " "), call. = FALSE)

  x
}
