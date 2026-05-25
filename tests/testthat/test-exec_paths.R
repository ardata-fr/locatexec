exec_path_funs <- list(
  node = node_exec,
  npm = npm_exec,
  python = python_exec,
  pip = pip_exec,
  chrome = chrome_exec,
  firefox = firefox_exec,
  libreoffice = libreoffice_exec
)

test_that("*_exec() returns the path found by exec_locate", {
  for (exec in names(exec_path_funs)) {
    skip_if_exec_missing(exec)
    path <- exec_path_funs[[exec]]()
    expect_type(path, "character")
    expect_true(file.exists(path))
    expect_equal(path, exec_locate(exec)$exec_file)
  }
})
