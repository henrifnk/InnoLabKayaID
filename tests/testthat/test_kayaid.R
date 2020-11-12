####  test kaya_id  ############################################################
context("test kaya")

test_that("expect correct output", {
  set.seed(123)
  co2emission <- do.call(kaya_identity, as.list(runif(4)))
  expect_more_than(co2emission, 0)

  expect_error(do.call(kaya_identity, as.list(runif(4, -2, -1))))
})
