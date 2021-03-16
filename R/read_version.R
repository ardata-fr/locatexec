#' @importFrom utils file_test
read_version <- function(path, version_flag = "--version") {
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

  suppressWarnings(try(system2(cmd), silent = TRUE))

  message("The following command failed: ", paste(path, version_flag))
  message("with following log:")

  paste0(readLines(log), collapse = "\n")
}

