####  test kaya_id  ############################################################
context("test kaya")

test_that("expect correct output", {
  set.seed(123)
  values <- runif(4)
  co2emission <- do.call(kaya_identity, as.list(values))
  cemission <- do.call(kaya_identity, list(values[1], values[2], values[3], values[4], output_type = "C"))
  expect_more_than(co2emission, 0)

  expect_error(do.call(kaya_identity, as.list(runif(4, -2, -1))))

  expect_equal(co2emission / cemission, 3.67)
})
