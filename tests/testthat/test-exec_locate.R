test_that("exec_locate validates the executable name", {
  expect_error(exec_locate("not-an-exec"))
})

test_that("exec_locate always returns a list with exec_file and version", {
  res <- exec_locate("node")
  expect_type(res, "list")
  expect_named(res, c("exec_file", "version"))
})

test_that("a located executable points to an existing file", {
  for (exec in testable_execs) {
    skip_if_exec_missing(exec)
    res <- exec_locate(exec)
    expect_type(res$exec_file, "character")
    expect_true(file.exists(res$exec_file))
    expect_s3_class(res$version, "numeric_version")
  }
})

test_that("results are stable across cached and uncached lookups", {
  skip_if_exec_missing("node")
  cached <- exec_locate("node")
  fresh <- exec_locate("node", cache = FALSE)
  expect_equal(fresh$exec_file, cached$exec_file)
  expect_equal(fresh$version, cached$version)
})
