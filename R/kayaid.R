#' The Kaya Identity is an equation that expresses yearly CO2 emissions as a product of four factors
#'
#' The Kaya Identity can be computed as: co2 = pop  gdp  enInt  carbInt. You can see by the units that they automatically resolve to million tonnes of CO2.
#'
#' @param pop Population size (in millions)
#' @param gdp GDP per capita (in 1000$/person)
#' @param enINT Energy Intensity (in Gigajoule/$1000GDP). Energy Intensity is the energy needed to produce a certain amount of economic value.
#' @param carbInt Carbon Intensity (in tonnes CO2/Gigajoule). Carbon Intensity is the CO2 emitted for produced energy. This number depends on the energy mix used (coal, solar, . . . ).
#' @param output_type If the option “C” is chosen, the results are given in tonnes C instead of tonnes CO2
#' @return million tonnes of CO2 emissions
#' @example
#' kaya_identity(82.4, 44,5,0.05)
#' @export
kaya_identity <- function(pop, gdp, enInt, carbInt, output_type = "CO2") {
  checkmate::assert_numeric(pop, lower = 0, any.missing = FALSE, len = 1)
  checkmate::assert_numeric(gdp, lower = 0, any.missing = FALSE, len = 1)
  checkmate::assert_numeric(enInt, lower = 0, any.missing = FALSE, len = 1)
  checkmate::assert_numeric(carbInt, lower = 0, any.missing = FALSE, len = 1)
  checkmate::assert_choice(output_type, choices = c("CO2", "C"))

  output <- if(output_type == "C") 1/3.67 else 1


  pop * gdp * enInt * carbInt * output

}

