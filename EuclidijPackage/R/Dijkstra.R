#' @title Computes The Shortest Path Between Two Given Nodes
#' @description It is an algorithm for finding the shortest paths between nodes in a graph.
#' @param graph Parameter 1
#' @param init_node Parameter 2
#'
#' @return Returns the distance between two given nodes.
#' @export
#'
dijkstra <- function(graph, init_node){
  #Check if 3 columns are available in graph
  df_colnames <- names(graph)
  if(length(df_colnames) != 3) stop("Graph needs to have 3 columns")
  
  #Check if the names in the graph data frame is correct
  if(df_colnames[1] != "v1" || df_colnames[2] != "v2" || 
     df_colnames[3] != "w") stop("Invalid column names")
  
  #Check if init_node is part of the nodes in graph
  all_nodes <- unique(graph[,1])
  if(!(init_node %in% all_nodes)) stop("Wrong init_node")
  
  #Get the final_mat with the distance from first node
  final_mat <- matrix(NA, nrow = length(all_nodes), ncol = 2)
  colnames(final_mat) <- c("node", "distance")
  final_mat[, "node"] <- all_nodes
  final_mat[final_mat[,"node"] == init_node,"distance"] = 0
  visited_vect <- c(init_node)
  final_mat <- get_distance(graph, init_node, final_mat, visited_vect,0)
  
  #Loop through each entry in the final_mat
  for (i in 1:nrow(final_mat)) {
    #Sort final_mat based on distance
    final_mat <- final_mat[order(final_mat[,"distance"]),]
    #If the node is not in the visited_vect, then continue
    if (!final_mat[i,"node"] %in% visited_vect) {
      #Get the distance to the neighboring nodes and update final_mat
      final_mat <- get_distance(graph,final_mat[i,"node"],
                                final_mat, visited_vect,
                                final_mat[i,"distance"])
      #Update visited_vect
      visited_vect <- c(visited_vect, final_mat[i,"node"])
    }
  }
  final_mat <- final_mat[order(final_mat[,"node"]),]
  return(final_mat[,"distance"])
}
get_distance <- function(graph, node, df, visited_vect, node_dist){
  #Loop through the graph
  for (i in 1:nrow(graph)) {
    v1 <- graph[i,"v1"]
    v2 <- graph[i,"v2"]
    weight <- graph[i,"w"]
    neigh_dist <- df[df[,"node"] == graph[i,"v2"],"distance"]
    
    #For the node, if the entries are found in graph &
    #if the node is not available in the visited_vect &
    #if the distance(node) + weight to neighbor < the distance(neighbor),
    #then update the distance(neighbor)
    if(v1 == node && (!v2 %in% visited_vect)
       && (is.na(neigh_dist) ||
           ((node_dist + weight) < neigh_dist))
    ){
      df[df[,"node"] == graph[i,"v2"],"distance"] =
        (node_dist + weight)
    }
  }
  return(df)
}
# wiki_graph <-
#   data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#              v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#              w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))
# dijkstra(wiki_graph, 1)
