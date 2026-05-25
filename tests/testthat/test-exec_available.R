test_that("exec_available validates the executable name", {
  expect_error(exec_available("not-an-exec"))
})

test_that("exec_available returns a single logical", {
  res <- exec_available("node")
  expect_type(res, "logical")
  expect_length(res, 1L)
})

test_that("an unreasonably high required version is never satisfied", {
  for (exec in testable_execs) {
    skip_if_exec_missing(exec)
    expect_false(exec_available(exec, version = "9999.0.0"))
  }
})

test_that("version '0' or higher is always satisfied when available", {
  for (exec in testable_execs) {
    skip_if_exec_missing(exec)
    expect_true(exec_available(exec, version = "0"))
  }
})

test_that("error = TRUE raises when the required version is not met", {
  skip_if_exec_missing("node")
  expect_error(
    exec_available("node", version = "9999.0.0", error = TRUE),
    "node"
  )
})

test_that("error = TRUE stays silent when the executable is available", {
  skip_if_exec_missing("node")
  expect_true(exec_available("node", error = TRUE))
})
