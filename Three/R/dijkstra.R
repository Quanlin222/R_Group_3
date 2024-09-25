#' Dijkstra's Algorithm
#'
#' @param wiki_graph A data frame representing the graph, including columns for nodes and edge weights.
#' @param init_node The starting node for the algorithm.
#' @return A named vector of distances from the initial node to all other nodes.
#' @references See [Wikipedia](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm).
#' @examples
#' wiki_graph <- data.frame(
#'     v1 = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6),
#'     v2 = c(2, 3, 6, 1, 3, 4, 1, 2, 4, 6, 2, 3, 5, 4, 6, 1, 3, 5),
#'     w  = c(7, 9, 14, 7, 10, 15, 9, 10, 11, 2, 15, 11, 6, 6, 9, 14, 2, 9)
#' )
#' dijkstra(wiki_graph, 1)
#' 
#' @export
dijkstra <- function(wiki_graph, init_node) {
  # Dijkstra's algorithm implementation
}


dijkstra <- function(wiki_graph, init_node) {
  if (!init_node %in% c(wiki_graph$v1, wiki_graph$v2)) {
    stop()
  }
  
  nodes <- unique(c(wiki_graph$v1, wiki_graph$v2)) 
  n <- length(nodes)  
  
  distances <- rep(Inf, n) 
  names(distances) <- nodes 
  distances[as.character(init_node)] <- 0 
  
  visited <- rep(FALSE, n) 
  names(visited) <- nodes
  
 
  while (any(!visited)) {
    unvisited_distances <- distances[!visited]
    current_node <- names(which.min(unvisited_distances))  
  
    if (distances[current_node] == Inf) {
      break
    }
    
    visited[current_node] <- TRUE  
    
    neighbors <- subset(wiki_graph, wiki_graph$v1 == as.numeric(current_node)) 
    for (i in 1:nrow(neighbors)) {
      neighbor_node <- neighbors$v2[i]  
      weight <- neighbors$w[i]  
      new_distance <- distances[current_node] + weight 
      
      if (new_distance < distances[as.character(neighbor_node)]) {
        distances[as.character(neighbor_node)] <- new_distance
      }
    }
  }
  
  return(as.numeric(distances))
}
