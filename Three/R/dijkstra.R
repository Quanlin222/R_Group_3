dijkstra <- function(graph, init_node) {
  nodes <- unique(c(graph$v1, graph$v2)) 
  n <- length(nodes)  
  devtools::load_all(".")
  
  distances <- rep(Inf, n) 
  names(distances) <- nodes 
  distances[as.character(init_node)] <- 0
  
  visited <- rep(FALSE, n) 
  names(visited) <- nodes
  
  while (any(!visited)) {
    unvisited_distances <- distances[!visited]
    current_node <- as.numeric(names(which.min(unvisited_distances)))
    
    if (distances[as.character(current_node)] == Inf) {
      break
    }
    
    visited[as.character(current_node)] <- TRUE
    
    neighbors <- subset(graph, v1 == current_node) 
    for (i in 1:nrow(neighbors)) {
      neighbor_node <- neighbors$v2[i] 
      weight <- neighbors$w[i]
      new_distance <- distances[as.character(current_node)] + weight 
      
      if (new_distance < distances[as.character(neighbor_node)]) {
        distances[as.character(neighbor_node)] <- new_distance
      }
    }
  }
  
  return(distances)
}

