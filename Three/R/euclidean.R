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
  return(a)
}
    
  
    
  
