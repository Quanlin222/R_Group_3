#' Calculate Euclidean distance
#'
#' This function implements the Euclidean algorithm to calculate the distance between two points.
#'
#' @param a The coordinates of the first point (numeric value)
#' @param b The coordinates of the second point (numeric value)
#' @return Returns the Euclidean distance (numeric value) between two points.
#' @references See [Wikipedia](https://en.wikipedia.org/wiki/Euclidean_distance).
#' @examples
#' euclidean(1, 2)  # Calculate the distance between points (1, 2) and (0, 0)

euclidean <- function(a, b){
  if(a < b){
    c <- b
    b <- a
    a <- c
  }
    while (b != 0) {
      d <- b
      b <- a %% b
      a <- d
    }
  return(abs(a))
}
    
  
    
  
