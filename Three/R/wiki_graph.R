#' Graph Data Frame
#'
#' This data frame represents a graph with nodes and weighted edges.
#' 
#' @format A data frame with three columns:
#' \describe{
#'   \item{v1}{Source node.}
#'   \item{v2}{Target node.}
#'   \item{w}{Weight of the edge between v1 and v2.}
#' }
#'
#' @examples
#' wiki_graph <- data.frame(
#'     v1 = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6),
#'     v2 = c(2, 3, 6, 1, 3, 4, 1, 2, 4, 6, 2, 3, 5, 4, 6, 1, 3, 5),
#'     w  = c(7, 9, 14, 7, 10, 15, 9, 10, 11, 2, 15, 11, 6, 6, 9, 14, 2, 9)
#' )
#'
#' @references 
#' \href{https://en.wikipedia.org/wiki/Graph#Mathematics}{Graph - Wikipedia}
#'
#' @export
"wiki_graph" <- data.frame(
  v1 = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6),
  v2 = c(2, 3, 6, 1, 3, 4, 1, 2, 4, 6, 2, 3, 5, 4, 6, 1, 3, 5),
  w  = c(7, 9, 14, 7, 10, 15, 9, 10, 11, 2, 15, 11, 6, 6, 9, 14, 2, 9)
)
