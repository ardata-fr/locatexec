# global ----
.exec <- new.env()
.exec$node <- list(dir = NULL, version = NULL, exec_win = "node.exe", exec_osx = "node", exec_unix = "node")
.exec$npm <- list(dir = NULL, version = NULL, exec_win = "npm.cmd", exec_osx = "npm", exec_unix = "npm")
.exec$chrome <- list(dir = NULL, version = NULL, exec_win = "chrome.exe", exec_osx = "Google Chrome", exec_unix = "chrome")
.exec$libreoffice <- list(dir = NULL, version = NULL, exec_win = "soffice.com", exec_osx = "soffice", exec_unix = "soffice")
.exec$python <- list(dir = NULL, version = NULL, exec_win = "python.exe", exec_osx = "python", exec_unix = "python")
.exec$pip <- list(dir = NULL, version = NULL, exec_win = "Scripts/pip.exe", exec_osx = "pip", exec_unix = "pip")
.exec$firefox <- list(dir = NULL, version = NULL, exec_win = "firefox.exe", exec_osx = "firefox", exec_unix = "firefox")
.exec$excel <- list(dir = NULL, version = NULL, exec_win = "EXCEL.exe", exec_osx = "Microsoft Excel", exec_unix = NA_character_)
.exec$powerpoint <- list(dir = NULL, version = NULL, exec_win = "POWERPNT.exe", exec_osx = "Microsoft PowerPoint", exec_unix = NA_character_)
.exec$word <- list(dir = NULL, version = NULL, exec_win = "WINWORD.exe", exec_osx = "Microsoft Word", exec_unix = NA_character_)

supported_exec <- names(.exec)

main_exec <- function(exec){
  if(is_windows()){
    .exec[[exec]]$exec_win
  } else if(is_osx()){
    .exec[[exec]]$exec_osx
  } else {
    .exec[[exec]]$exec_unix
  }
}


# utils ----
set_exec_info <- function(dir, version = NULL, exec) {
  if(is.null(version) && !is.null(dir)) {
    version <- extract_numeric_version(dir, file_exe = exec)
  }
  .exec[[exec]]$dir <- dir
  .exec[[exec]]$version <- version
}

exe_located <- function(exec, version){
  !is.null(.exec[[exec]]$dir) &&
    (is.null(version) ||
       version == .exec[[exec]]$version)
}

min_version_available <- function(exec, version){
  !is.null(.exec[[exec]]$dir) &&
    (is.null(version) ||
       version >= as.numeric_version(.exec[[exec]]$version))
}

#' @importFrom utils head
extract_numeric_version <- function(dir, file_exe, win_ext = ".exe", version_flag = "--version") {
  info <- read_version(dir_exe = dir, file_exe = file_exe, win_ext = win_ext, version_flag = version_flag)
  if(any(is.na(info))) return(numeric_version("0"))
  gmatch <- gregexpr("[[:digit:]\\.]+", info)
  version <- regmatches(info, gmatch)
  version <- unlist(version)
  version <- head(version, n = 1)
  if(length(version)<1) return(numeric_version("0"))
  numeric_version(version)
}

valid_exec_dir <- function(dir){
  if(length(dir) < 1) return(FALSE)
  dir.exists(dir) &&
    !grepl("Microsoft/WindowsApps", absolute_path(dir), fixed = TRUE)
}

match_version <- function(dirs, versions, match_version = NULL){

  choosen_dir <- NULL
  choosen_ver <- numeric_version("0")

  for (i in seq_along(dirs)) {
    current_version <- versions[[i]]
    if ((!is.null(match_version) && current_version == match_version) || (is.null(match_version) && current_version > choosen_ver)) {
      choosen_ver <- current_version
      choosen_dir <- dirs[[i]]
    }
  }

  list(dir = choosen_dir, ver = choosen_ver)
}

read_registry_app_path <- function(name){
  regpath <- "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App paths\\"
  exec_path <- try(utils::readRegistry(paste0(regpath, name)), silent = TRUE)
  if(inherits(exec_path, "try-error")) return(NA_character_)
  absolute_path(exec_path$Path)
}

read_registry_app_version <- function(name){
  key <- paste0(name, "\\CurVer")
  v_registry <- try(utils::readRegistry(key, hive = "HCR"), silent = TRUE)
  if(!inherits(v_registry, "try-error"))
    version <- v_registry$`(Default)`
  else version <- "0"

  version
}

sanitize_paths <- function(x){
  x <- x[!is.na(x)]
  x <- x[!x%in%""]
  x <- unique(x)
  x <- x[dir.exists(x)]
  sapply(x, absolute_path)
}


