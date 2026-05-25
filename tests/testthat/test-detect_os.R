test_that("OS detectors return a single logical", {
  expect_length(is_windows(), 1L)
  expect_length(is_osx(), 1L)
  expect_length(is_unix(), 1L)
  expect_type(is_windows(), "logical")
  expect_type(is_osx(), "logical")
  expect_type(is_unix(), "logical")
})

test_that("exactly one OS detector is TRUE", {
  expect_equal(sum(is_windows(), is_osx(), is_unix()), 1L)
})
