#' @export
#' @title Find an executable
#'
#' @description Searches for an executable in a some places and use the
#' highest version found (unless a specific version is requested).
#'
#' The function mimic the behavior of the `rmarkdown::find_pandoc()`
#' function in order to locate programs.
#'
#' Some methods work differently depending on the OS or the program:
#'
#' * Under Windows, the search
#' for 'Google Chrome', 'Mozilla Firefox', 'Microsoft Word', 'Microsoft PowerPoint'
#' and 'Microsoft Excel' is done in the registry, which means that only one version
#' can be chosen, the one referenced in the registry. (you still can force another path
#' with argument `dir`).
#' * 'Microsoft Word', 'Microsoft PowerPoint' and 'Microsoft Excel' can not be located
#' on linux OS.
#' * the search for 'pip' is using the result of the search of 'python' to find the corresponding
#' 'pip' executable.
#'
#'
#' @inheritParams exec_version
#' @param cache if `FALSE`, search for the executable again even if the
#' executable has been found previously.
#' @param dir A character vector of directory paths under which
#' the executable may be found.
#' @param version The version of the executable to look for (e.g., \code{"14.15.4"}).
#' If NULL (the default), it searches for the highest version.
#' @return A list containing the path of the executable and its version if found. If not found,
#' the version will be `0` and the `exec_file` will be `NULL`.
#' @export
#' @examples
#' exec_locate("firefox")
#' exec_locate("chrome")
#' exec_locate("chrome", version = "88.0.4324.150")
#' exec_locate("libreoffice")
#' exec_locate("node")
#' exec_locate("npm")
#' exec_locate("python")
#' exec_locate("pip")
#' exec_locate("excel")
#' exec_locate("word")
#' exec_locate("powerpoint")
#' @seealso [exec_available()] will check if an executable is available
#' and [exec_version()] will return the version of a located executable.
#' @section libreoffice:
#' On some Ubuntu platforms, 'LibreOffice' require to add in
#' the environment variable `LD_LIBRARY_PATH` the following path:
#' `/usr/lib/libreoffice/program` (you should see the message
#' "libreglo.so cannot open shared object file" if it is the case). This
#' can be done with R
#' command `Sys.setenv(LD_LIBRARY_PATH = "/usr/lib/libreoffice/program/")`
exec_locate <- function(exec, cache = TRUE, dir = NULL, version = NULL){
  exec <- match.arg(exec, choices = supported_exec, several.ok = FALSE)
  class(exec) <- exec
  UseMethod("exec_locate", exec)
}

#' @export
exec_locate.chrome <- function(exec, cache = TRUE, dir = NULL, version = NULL){
  if (!cache) set_exec_info(NULL, exec = exec)
  if(exe_located(exec = exec, version = version)) return(as.list(.exec[[exec]]))

  if(!is.null(dir)){
    sources <- absolute_path(dir)
  } else if(is_osx()){
    sources <- "/Applications/Google Chrome.app/Contents/MacOS"
  } else if(is_windows()){
    sources <- read_registry_app_path(main_exec(exec))
  } else {
    sources <- c(
      dirname(Sys.which(exec)),
      "/usr/local/bin",
      "/usr/bin"
    )
  }

  compete_source_versions(sources = sources, exec = exec,
                          version_fun = get_chrome_version,
                          version = version)

  as.list(.exec$chrome)
}
#' @export
exec_locate.firefox <- function(exec, cache = TRUE, dir = NULL, version = NULL){
  if (!cache) set_exec_info(NULL, exec = exec)
  if(exe_located(exec = exec, version = version)) return(as.list(.exec$firefox))

  if(!is.null(dir)){
    sources <- absolute_path(dir)
  } else if(is_osx()){
    sources <- "/Applications/Firefox.app/Contents/MacOS"
  } else if(is_windows()){
    sources <- read_registry_app_path(main_exec(exec))
  } else {
    sources <- c(
      dirname(Sys.which(exec)),
      "/usr/local/bin",
      "/usr/bin"
    )
  }

  compete_source_versions(sources = sources, exec = exec,
                          version_fun = extract_numeric_version,
                          version = version)

  as.list(.exec$firefox)
}

#' @export
exec_locate.excel <- function(exec, cache = TRUE, dir = NULL, version = NULL){
  if (!cache) set_exec_info(NULL, exec = exec)
  if(exe_located(exec = exec, version = version)) return(as.list(.exec$excel))

  if(!is.null(dir)){
    sources <- absolute_path(dir)
  } else if(is_osx()){
    sources <- "/Applications/Microsoft Excel.app/Contents/MacOS"
  } else if(is_windows()){
    sources <- read_registry_app_path(main_exec(exec))
  } else {
    sources <- c(
      dirname(Sys.which(exec)),
      "/usr/local/bin",
      "/usr/bin"
    )
  }

  compete_source_versions(sources = sources, exec = exec,
                          version_fun = get_excel_version,
                          version = version)

  as.list(.exec$excel)
}
#' @export
exec_locate.word <- function(exec, cache = TRUE, dir = NULL, version = NULL){
  if (!cache) set_exec_info(NULL, exec = exec)
  if(exe_located(exec = exec, version = version)) return(as.list(.exec$word))

  if(!is.null(dir)){
    sources <- absolute_path(dir)
  } else if(is_osx()){
    sources <- "/Applications/Microsoft Word.app/Contents/MacOS"
  } else if(is_windows()){
    sources <- read_registry_app_path(main_exec(exec))
  } else {
    sources <- c(
      dirname(Sys.which(exec)),
      "/usr/local/bin",
      "/usr/bin"
    )
  }

  compete_source_versions(sources = sources, exec = exec,
                          version_fun = get_word_version,
                          version = version)

  as.list(.exec$word)
}
#' @export
exec_locate.powerpoint <- function(exec, cache = TRUE, dir = NULL, version = NULL){
  if (!cache) set_exec_info(NULL, exec = exec)
  if(exe_located(exec = exec, version = version)) return(as.list(.exec$powerpoint))

  if(!is.null(dir)){
    sources <- absolute_path(dir)
  } else if(is_osx()){
    sources <- "/Applications/Microsoft PowerPoint.app/Contents/MacOS"
  } else if(is_windows()){
    sources <- read_registry_app_path(main_exec(exec))
  } else {
    sources <- c(
      dirname(Sys.which(exec)),
      "/usr/local/bin",
      "/usr/bin"
    )
  }

  compete_source_versions(sources = sources, exec = exec,
                          version_fun = get_powerpoint_version,
                          version = version)

  as.list(.exec$powerpoint)
}

#' @export
exec_locate.libreoffice <- function(exec, cache = TRUE, dir = NULL, version = NULL){
  if (!cache) set_exec_info(NULL, exec = exec)
  if(exe_located(exec = exec, version = version)) return(as.list(.exec$libreoffice))

  if(is.null(dir)){
    sources <- c(
      dirname(Sys.which("soffice")),
      "/Applications/LibreOffice.app/Contents/MacOS",
      "~/Applications/LibreOffice.app/Contents/MacOS",
      "/usr/local/bin",
      "/usr/bin",
      if(is_windows()) read_registry_app_path("soffice.exe"),
      "C:/Program Files/LibreOffice/program"
    )
  } else {
    sources <- dir
  }

  compete_source_versions(sources = sources, exec = exec,
                          version_fun = extract_numeric_version,
                          version = version)

  as.list(.exec$libreoffice)
}

#' @export
exec_locate.node <- function(exec, cache = TRUE, dir = NULL, version = NULL){

  if (!cache) set_exec_info(NULL, exec = exec)
  if(exe_located(exec = exec, version = version)) return(as.list(.exec$node))

  if(is.null(dir)){
    sources <- c(dirname(Sys.which(exec)),
                 "C:/Program Files/nodejs",
                 "/usr/local/bin", "/usr/bin")
  } else {
    sources <- dir
  }

  compete_source_versions(sources = sources, exec = exec,
                          version_fun = extract_numeric_version,
                          version = version)

  as.list(.exec$node)
}

#' @export
exec_locate.npm <- function(exec, cache = TRUE, dir = NULL, version = NULL){
  if (!cache) set_exec_info(NULL, exec = exec)
  if(exe_located(exec = exec, version = version)) return(as.list(.exec$npm))

  if(is.null(dir)){
    sources <- c(
      dirname(Sys.which(exec)),
      "C:/Program Files/nodejs",
      "/usr/local/bin",
      "/usr/bin")
  } else {
    sources <- dir
  }

  compete_source_versions(sources = sources, exec = exec,
                          version_fun = extract_numeric_version,
                          version = version)
  as.list(.exec$npm)
}


build_python_dir_candidates <- function(){
  userdir <- path.expand("~")
  dirs <- character(0L)
  if(is_windows()){
    user_win_dirs <- list.dirs(
      file.path(userdir, "..", "AppData","Local","Programs","Python"),
      recursive = FALSE, full.names = TRUE)
    conda_locs <- file.path(userdir, "..", c("Miniconda3", "Anaconda3", "Miniconda2", "Anaconda2"))

    public_win_dirs <- list.files(c("C:/Program Files", "C:/Program Files(x86)"),
                                  recursive = FALSE, full.names = TRUE,
                                  include.dirs = TRUE, pattern = "python", ignore.case = TRUE)
    dirs <- c(user_win_dirs, public_win_dirs, conda_locs)
  } else {
    dirs <- c(
      file.path(userdir, "opt", "miniconda3", "bin"),
      file.path(userdir, "opt", "anaconda3", "bin"),
      file.path(userdir, "opt", "miniconda2", "bin"),
      file.path(userdir, "opt", "anaconda2", "bin"),
      file.path(userdir, "miniconda3", "bin"),
      file.path(userdir, "anaconda3", "bin"),
      file.path(userdir, "miniconda2", "bin"),
      file.path(userdir, "anaconda2", "bin")
    )
  }
  Filter(dir.exists, dirs)
}

#' @export
exec_locate.python <- function(exec, cache = TRUE, dir = NULL, version = NULL){
  if (!cache) set_exec_info(NULL, exec = exec)
  if(exe_located(exec = exec, version = version)) return(as.list(.exec$python))

  if(is.null(dir)){
    sources <- c(
      build_python_dir_candidates(),
      dirname(Sys.which(exec)),
      "/usr/local/bin",
      "/usr/bin")
  } else {
    sources <- dir
  }

  compete_source_versions(sources = sources,
                          exec = exec,
                          version_fun = extract_numeric_version,
                          version = version)

  as.list(.exec$python)
}

#' @export
exec_locate.pip <- function(exec, cache = TRUE, dir = NULL, version = NULL){
  if (!cache) set_exec_info(NULL, exec = exec)
  if(exe_located(exec = exec, version = version)) return(as.list(.exec$pip))

  python <- exec_locate.python(exec = "python", cache = cache, dir = dir, version = version)
  if(!is.null(python$exec_file))
    compete_source_versions(sources = dirname(python$exec_file),
                          exec = exec,
                          version_fun = extract_numeric_version,
                          version = version)

  as.list(.exec$pip)
}

# utils ----
compete_source_versions <- function(sources, exec, version_fun = extract_numeric_version, version){
  sources <- unique(sources)
  candidates <- exec_candidates(sources = sources, exec = exec)
  versions <- lapply(candidates, version_fun)

  match_v <- match_version(candidates, versions, match_version = version)
  set_exec_info(match_v$exec_file, match_v$ver, exec = exec)
}

# some specific version reader ----

get_word_version <- function(...) {
  if(is_windows()){
    version <- read_registry_app_version("Word.Application")
  } else if(is_osx()){
    version <- system2(command = "mdls",
                       args = c("-name", "kMDItemVersion", shQuote("/Applications/Microsoft Word.app")),
                       stdout = TRUE, stderr = TRUE)
    if(any(is.na(version))) return(numeric_version("0"))
  } else return(numeric_version("0"))

  gmatch <- gregexpr("[[:digit:]\\.]+", version)
  version <- regmatches(version, gmatch)
  version <- unlist(version)
  version <- gsub("(^\\.|\\.$)", "", version)
  version <- version[!version %in% ""]
  version <- head(version, n = 1)
  numeric_version(version)
}
get_powerpoint_version <- function(...) {
  if(is_windows()){
    version <- read_registry_app_version("PowerPoint.Application")
  } else if(is_osx()){
    version <- system2(command = "mdls",
                       args = c("-name", "kMDItemVersion", shQuote("/Applications/Microsoft PowerPoint.app")),
                       stdout = TRUE, stderr = TRUE)
    if(any(is.na(version))) return(numeric_version("0"))
  } else return(numeric_version("0"))

  gmatch <- gregexpr("[[:digit:]\\.]+", version)
  version <- regmatches(version, gmatch)
  version <- unlist(version)
  version <- gsub("(^\\.|\\.$)", "", version)
  version <- version[!version %in% ""]
  version <- head(version, n = 1)
  numeric_version(version)
}
get_excel_version <- function(...) {
  if(is_windows()){
    version <- read_registry_app_version("Excel.Application")
  } else if(is_osx()){
    version <- system2(command = "mdls",
                       args = c("-name", "kMDItemVersion", shQuote("/Applications/Microsoft Excel.app")),
                       stdout = TRUE, stderr = TRUE)
    if(any(is.na(version))) return(numeric_version("0"))
  } else return(numeric_version("0"))

  gmatch <- gregexpr("[[:digit:]\\.]+", version)
  version <- regmatches(version, gmatch)
  version <- unlist(version)
  version <- gsub("(^\\.|\\.$)", "", version)
  version <- version[!version %in% ""]
  version <- head(version, n = 1)
  numeric_version(version)
}

get_chrome_version <- function(exec_chrome) {
  if(is_windows()){
    chrome_v_registry <- try(utils::readRegistry("Software\\Google\\Chrome\\BLBeacon", hive = "HCU"),
                             silent = TRUE)
    if(!inherits(chrome_v_registry, "try-error"))
      version <- chrome_v_registry$version
    else return(numeric_version("0"))
  } else {
    info <- read_version(exec_chrome)
    if(any(is.na(info))) return(numeric_version("0"))
    version <- strsplit(info, split = " ")[[1]][3]
  }
  numeric_version(version)
}

