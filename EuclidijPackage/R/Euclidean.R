#' @title Computes The Greatest Common Divisor Of Two Numbers(Integers).
#'
#' @param x One of the integers of the two required to calculate the GCD
#' @param y One of the integers of the two required to calculate the GCD
#'
#' @return This code returns the greatest common divisor
#' @export
#'

euclidean  <- function(x, y){
  while (y != 0) {
    temp_divisor = y
    y <- x %% y
    x <- temp_divisor
  }
  return(x)
}

euclidean(888, 888)

