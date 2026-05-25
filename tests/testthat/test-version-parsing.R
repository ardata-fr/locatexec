# A binary that emits an exotic --version output must not crash the caller:
# extract_numeric_version() should sanitize the token or fall back to "0".
make_fake_exec <- function(output) {
  skip_on_os("windows")
  path <- tempfile(fileext = ".sh")
  writeLines(c("#!/bin/sh", paste0("echo '", output, "'")), path)
  Sys.chmod(path, "0755")
  path
}

test_that("a trailing-dot version token does not raise an error", {
  path <- make_fake_exec("Mozilla Firefox 1.0.")
  v <- locatexec:::extract_numeric_version(path)
  expect_s3_class(v, "numeric_version")
  expect_equal(v, numeric_version("1.0"))
})

test_that("a version-less output falls back to version 0", {
  path <- make_fake_exec("command not available")
  expect_equal(
    locatexec:::extract_numeric_version(path),
    numeric_version("0")
  )
})

test_that("a well-formed version is parsed as-is", {
  path <- make_fake_exec("tool 12.4.1")
  expect_equal(
    locatexec:::extract_numeric_version(path),
    numeric_version("12.4.1")
  )
})
