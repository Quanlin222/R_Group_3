#' Dijkstra's Algorithm
#'
#' This function implements Dijkstra's algorithm to calculate the shortest path 
#' from the initial node to all other nodes in the graph.
#'
#' @param graph A data.frame with three columns (v1, v2, w) representing the edges 
#'              of the graph and their corresponding weights. v1 and v2 are the nodes 
#'              and w is the weight of the edge.
#' @param init_node A numeric scalar representing the initial node, which must exist in the graph.
#'
#' @return A vector representing the shortest path from the initial node to every other node.
#' @details The function will throw an error if the graph structure is incorrect or 
#'          if the initial node is not in the graph.
#' @references See [Dijkstra's Algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)
#' @examples
#' wiki_graph <-data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#'           v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#'           w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))
#' dijkstra(wiki_graph, 1)

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
    
    neighbors <- subset(wiki_graph, v1 == as.numeric(current_node)) 
    for (i in 1:nrow(neighbors)) {
      neighbor_node <- neighbors$v2[i]  
      weight <- neighbors$w[i]  
      new_distance <- distances[current_node] + weight 
      
      if (new_distance < distances[as.character(neighbor_node)]) {
        distances[as.character(neighbor_node)] <- new_distance
      }
    }
  }
  
  return(distances)  
}
