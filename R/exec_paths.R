#' @export
#' @title Path to 'Google Chrome' executable
#' @description return the full path of 'Google Chrome' executable
#' if found.
#' @return chrome executable full path in a character vector of length 1.
#' @family executable full path
#' @examples
#' if(exec_available("chrome"))
#'   message(chrome_exec())
chrome_exec <- function() {
  exec_locate("chrome")
  exec_available("chrome", error = TRUE)
  file.path(.exec$chrome$dir, main_exec("chrome"))
}

#' @export
#' @title Path to 'Mozilla Firefox' executable
#' @description return the full path of 'Mozilla Firefox' executable
#' if found.
#' @return Firefox executable full path in a character vector of length 1.
#' @family executable full path
#' @examples
#' if(exec_available("firefox"))
#'   message(firefox_exec())
firefox_exec <- function() {
  exec_locate("firefox")
  exec_available("firefox", error = TRUE)
  file.path(.exec$firefox$dir, main_exec("firefox"))
}

#' @export
#' @title Path to 'LibreOffice' executable
#' @description return the full path of 'LibreOffice' executable
#' if found.
#' @return executable full path in a character vector of length 1.
#' @family executable full path
#' @examples
#' if(exec_available("libreoffice")) {
#'   message(libreoffice_exec())
#' }
libreoffice_exec <- function() {
  exec_locate("libreoffice")
  exec_available("libreoffice", error = TRUE)
  file.path(.exec$libreoffice$dir, main_exec("libreoffice"))
}

#' @export
#' @title Path to 'node.js' executable
#' @description return the full path of 'node.js' executable
#' if found.
#' @return executable full path in a character vector of length 1.
#' @family executable full path
#' @examples
#' if(exec_available("node"))
#'   message(node_exec())
node_exec <- function() {
  exec_locate("node")
  absolute_path(file.path(.exec$node$dir, main_exec("node")))
}

#' @export
#' @title Path to 'npm' executable
#' @description return the full path of 'npm' executable
#' if found.
#' @return executable full path in a character vector of length 1.
#' @family executable full path
#' @examples
#' if(exec_available("npm"))
#'   message(npm_exec())
npm_exec <- function() {
  exec_locate("npm")
  absolute_path(file.path(.exec$npm$dir, main_exec("npm")))
}


#' @export
#' @title Path to 'python' executable
#' @description return the full path of 'python' executable
#' if found.
#' @return executable full path in a character vector of length 1.
#' @family executable full path
#' @examples
#' if(exec_available("python"))
#'   message(python_exec())
python_exec <- function() {
  exec_locate("python")
  exec_available("python", error = TRUE)
  file.path(.exec$python$dir, main_exec("python"))
}

#' @export
#' @title Path to 'pip' executable
#' @description return the full path of 'pip' executable
#' if found.
#' @return executable full path in a character vector of length 1.
#' @family executable full path
#' @examples
#' if(exec_available("pip"))
#'   message(pip_exec())
pip_exec <- function() {
  exec_locate("pip")
  exec_available("pip", error = TRUE)
  file.path(.exec$pip$dir, main_exec("pip"))
}

#' @export
#' @title Path to 'Microsoft Word' executable
#' @description return the full path of 'Microsoft Word' executable
#' if found.
#' @return executable full path in a character vector of length 1.
#' @family executable full path
#' @examples
#' if(exec_available("word"))
#'   message(word_exec())
word_exec <- function() {
  exec_locate("word")
  exec_available("word", error = TRUE)
  file.path(.exec$word$dir, main_exec("word"))
}

#' @export
#' @title Path to 'Microsoft PowerPoint' executable
#' @description return the full path of 'Microsoft PowerPoint' executable
#' if found.
#' @return executable full path in a character vector of length 1.
#' @family executable full path
#' @examples
#' if(exec_available("powerpoint"))
#'   message(powerpoint_exec())
powerpoint_exec <- function() {
  exec_locate("powerpoint")
  exec_available("powerpoint", error = TRUE)
  file.path(.exec$powerpoint$dir, main_exec("powerpoint"))
}

#' @export
#' @title Path to 'Microsoft Execl' executable
#' @description return the full path of 'Microsoft Excel' executable
#' if found.
#' @return executable full path in a character vector of length 1.
#' @family executable full path
#' @examples
#' if(exec_available("excel"))
#'   message(excel_exec())
excel_exec <- function() {
  exec_locate("excel")
  exec_available("excel", error = TRUE)
  file.path(.exec$excel$dir, main_exec("excel"))
}
