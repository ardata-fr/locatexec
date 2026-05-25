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
