#' @importFrom utils file_test
read_version <- function(dir_exe, file_exe, win_ext = ".exe", version_flag = "--version") {
  path <- file.path(dir_exe, file_exe)

  if (is_windows()) {
    path <- paste0(path, win_ext)
  }

  if (!file.exists(path)) {
    return(NA_character_)
  }

  if (!file_test('-x', path)) {
    return(NA_character_)
  }

  info <- system2(path, args = version_flag, stderr = TRUE, stdout = TRUE)
  info
}
