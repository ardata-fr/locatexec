test_that("exec_version validates the executable name", {
  expect_error(exec_version("not-an-exec"))
})

test_that("exec_version returns a numeric_version for available executables", {
  for (exec in testable_execs) {
    skip_if_exec_missing(exec)
    v <- exec_version(exec)
    expect_s3_class(v, "numeric_version")
    expect_gt(v, numeric_version("0"))
  }
})

test_that("read_version() does not pass R's LD_LIBRARY_PATH on Linux", {
  skip_if_not(is_unix())
  script <- tempfile(fileext = ".sh")
  writeLines(c("#!/bin/sh", "echo \"ldp=[$LD_LIBRARY_PATH]\""), script)
  Sys.chmod(script, mode = "755")

  old <- Sys.getenv("LD_LIBRARY_PATH", unset = NA)
  on.exit(if (is.na(old)) Sys.unsetenv("LD_LIBRARY_PATH") else Sys.setenv(LD_LIBRARY_PATH = old))
  Sys.setenv(LD_LIBRARY_PATH = "/r/lib:/usr/lib/x86_64-linux-gnu")

  expect_identical(read_version(script, version_flag = ""), "ldp=[]")
  # restored afterwards
  expect_identical(Sys.getenv("LD_LIBRARY_PATH"), "/r/lib:/usr/lib/x86_64-linux-gnu")
})
