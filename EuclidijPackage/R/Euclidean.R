euclidean  <- function(x, y){
  while (y != 0) {
    temp_divisor = y
    y <- x %% y
    x <- temp_divisor
  }
  return(x)
}

euclidean(888, 888)

