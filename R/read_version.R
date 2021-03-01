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

  info <- try(system2(path, args = version_flag,
                      stderr = TRUE, stdout = TRUE), silent = TRUE)
  if(inherits(info, "try-error")) {
    message(catch_error(path, version_flag))
    info <- NA_character_
  }
  info
}

catch_error <- function(path, version_flag){
  cmd <- tempfile(fileext = ".sh")
  log <- tempfile(fileext = ".log")

  writeLines(text = paste(path, version_flag, ">", log, "2>&1"), cmd)
  Sys.chmod(cmd, mode = "755")
  old_warn <- getOption("warn")
  options(warn = -1)
  try(system2(cmd), silent = TRUE)
  options(warn = old_warn)

  message("The following command failed: ", paste(path, version_flag))
  message("with following log:")

  paste0(readLines(log), collapse = "\n")
}

