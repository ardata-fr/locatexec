#' @importFrom utils file_test
read_version <- function(path, version_flag = "--version") {
  if (!file.exists(path)) {
    return(NA_character_)
  }

  if (!file_test('-x', path)) {
    return(NA_character_)
  }

  # NODE_DISABLE_COMPILE_CACHE=1 prevents node/npm (>= Node 22.8) from leaving a
  # 'node-compile-cache' directory in os.tmpdir(); ignored by older node and by
  # other executables, so it is safe to set unconditionally. It is set on the
  # process environment (not via system2(env=), which is not portable to Windows)
  # and restored afterwards.
  old <- Sys.getenv("NODE_DISABLE_COMPILE_CACHE", unset = NA)
  Sys.setenv(NODE_DISABLE_COMPILE_CACHE = "1")
  on.exit(
    if (is.na(old)) {
      Sys.unsetenv("NODE_DISABLE_COMPILE_CACHE")
    } else {
      Sys.setenv(NODE_DISABLE_COMPILE_CACHE = old)
    },
    add = TRUE
  )

  # On Linux, R prepends its own library directories to LD_LIBRARY_PATH
  # (see R_HOME/etc/ldpaths) and executables inherit them: LibreOffice then
  # loads other versions of its libraries and fails ("libreglo.so: cannot
  # open shared object file") or aborts. The variable is removed for the call
  # and restored afterwards.
  if (is_unix()) {
    old_ld <- Sys.getenv("LD_LIBRARY_PATH", unset = NA)
    Sys.unsetenv("LD_LIBRARY_PATH")
    on.exit(
      if (!is.na(old_ld)) Sys.setenv(LD_LIBRARY_PATH = old_ld),
      add = TRUE
    )
  }

  info <- try(
    system2(
      path,
      args = version_flag,
      stderr = TRUE,
      stdout = TRUE,
      timeout = 20
    ),
    silent = TRUE
  )
  if (inherits(info, "try-error")) {
    message(catch_error(path, version_flag))
    info <- NA_character_
  }
  info
}

catch_error <- function(path, version_flag) {
  cmd <- tempfile(fileext = ".sh")
  log <- tempfile(fileext = ".log")

  writeLines(text = paste(path, version_flag, ">", log, "2>&1"), cmd)
  Sys.chmod(cmd, mode = "755")

  suppressWarnings(try(system2(cmd, timeout = 20), silent = TRUE))

  message("The following command failed: ", paste(path, version_flag))
  message("with following log:")

  paste0(readLines(log), collapse = "\n")
}
