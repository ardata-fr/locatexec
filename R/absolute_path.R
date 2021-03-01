absolute_path <- function(x){

  if (length(x) != 1L)
    stop("'x' must be a single character string")
  epath <- path.expand(x)

  epath <- normalizePath(epath, "/", mustWork = file.exists(epath))
  epath
}

