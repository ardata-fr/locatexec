# global ----
.exec <- new.env()
.exec$node <- list(exec_file = NULL, version = NULL)
.exec$npm <- list(exec_file = NULL, version = NULL)
.exec$chrome <- list(exec_file = NULL, version = NULL)
.exec$libreoffice <- list(exec_file = NULL, version = NULL)
.exec$python <- list(exec_file = NULL, version = NULL)
.exec$pip <- list(exec_file = NULL, version = NULL)
.exec$firefox <- list(exec_file = NULL, version = NULL)
.exec$excel <- list(exec_file = NULL, version = NULL)
.exec$powerpoint <- list(exec_file = NULL, version = NULL)
.exec$word <- list(exec_file = NULL, version = NULL)

.exec_names <- new.env()
.exec_names$node <- list(exec_win = "node.exe", exec_osx = "node", exec_unix = "node")
.exec_names$npm <- list(exec_win = "npm.cmd", exec_osx = "npm", exec_unix = "npm")
.exec_names$chrome <- list(exec_win = "chrome.exe", exec_osx = "Google Chrome", exec_unix = "chrome")
.exec_names$libreoffice <- list(exec_win = "soffice.com", exec_osx = "soffice", exec_unix = "soffice")
.exec_names$python <- list(exec_win = "python.exe", exec_osx = c("python", "python2", "python3"),
                           exec_unix = c("python", "python2", "python3"))
.exec_names$pip <- list(exec_win = c("Scripts/pip.exe", "Scripts/pip2.exe", "Scripts/pip3.exe"),
                        exec_osx = c("pip", "pip2", "pip3"), exec_unix = c("pip", "pip2", "pip3"))
.exec_names$firefox <- list(exec_win = "firefox.exe", exec_osx = "firefox", exec_unix = "firefox")
.exec_names$excel <- list(exec_win = "EXCEL.exe", exec_osx = "Microsoft Excel", exec_unix = NA_character_)
.exec_names$powerpoint <- list(exec_win = "POWERPNT.exe", exec_osx = "Microsoft PowerPoint", exec_unix = NA_character_)
.exec_names$word <- list(exec_win = "WINWORD.exe", exec_osx = "Microsoft Word", exec_unix = NA_character_)

supported_exec <- names(.exec)

main_exec <- function(exec){
  if(is_windows()){
    .exec_names[[exec]]$exec_win
  } else if(is_osx()){
    .exec_names[[exec]]$exec_osx
  } else {
    .exec_names[[exec]]$exec_unix
  }
}


# utils ----
set_exec_info <- function(exec_file, version = NULL, exec) {
  .exec[[exec]] <- list(exec_file = exec_file, version = version)
}

exe_located <- function(exec, version){
  !is.null(.exec[[exec]]$exec_file) &&
    (is.null(version) ||
       version == .exec[[exec]]$version)
}

min_version_available <- function(exec, version){
  !is.null(.exec[[exec]]$exec_file) &&
    (is.null(version) ||
       version >= as.numeric_version(.exec[[exec]]$version))
}

#' @importFrom utils head
extract_numeric_version <- function(path, version_flag = "--version") {
  info <- read_version(path = path, version_flag = version_flag)
  if(any(is.na(info))) return(numeric_version("0"))
  gmatch <- gregexpr("[[:digit:]\\.]+", info)
  version <- regmatches(info, gmatch)
  version <- unlist(version)
  version <- head(version, n = 1)
  if(length(version)<1) return(numeric_version("0"))
  numeric_version(version)
}

match_version <- function(exec_files, versions, match_version = NULL){

  choosen_exec_files <- NULL
  choosen_ver <- numeric_version("0")

  for (i in seq_along(exec_files)) {
    current_version <- versions[[i]]
    if ((!is.null(match_version) && current_version == match_version) || (is.null(match_version) && current_version > choosen_ver)) {
      choosen_ver <- current_version
      choosen_exec_files <- exec_files[[i]]
    }
  }

  list(exec_file = choosen_exec_files, ver = choosen_ver)
}

read_registry_app_path <- function(name){
  name <- tolower(name)
  regpath <- "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App paths\\"

  vapply(name, function(z){
    exec_path <- try(utils::readRegistry(paste0(regpath, z)), silent = TRUE)
    if(inherits(exec_path, "try-error")) return(NA_character_)
    absolute_path(exec_path$Path)
  }, FUN.VALUE = NA_character_, USE.NAMES = FALSE)
}

read_registry_app_version <- function(name){
  vapply(name, function(z){
    key <- paste0(z, "\\CurVer")
    v_registry <- try(utils::readRegistry(key, hive = "HCR"), silent = TRUE)
    if(!inherits(v_registry, "try-error"))
      version <- v_registry$`(Default)`
    else version <- "0"
    version
  }, FUN.VALUE = NA_character_, USE.NAMES = FALSE)
}

exec_candidates <- function(sources, exec){

  sources <- vapply(sources, absolute_path, NA_character_, USE.NAMES = FALSE)
  all_com <- expand.grid(
    dir = sources,
    exec = main_exec(exec),
    stringsAsFactors = FALSE)
  candidates <- file.path(all_com$dir, all_com$exec)
  candidates <- Filter(function(z) !is.na(z) && file.exists(z), candidates)
  candidates <- candidates[!grepl("Microsoft/WindowsApps", candidates, fixed = TRUE)]
  candidates
}
