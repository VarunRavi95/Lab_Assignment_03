#' A graph with the nodes and their weights.
#'
#' A data set containing the nodes of a graph along with the weights
#' of each connection between the nodes.
#'
#' @format A data frame with 18 rows and 3 columns:
#' \describe{
#'   \item{v1}{Vertex 1 containing the name of the node}
#'   \item{v2}{Vertex 2 containing the name of the node connected to v1}
#'   \item{w}{The weight/distance between v1 and v2}
#'   ...
#' }
#' @source \url{https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm}
wiki_graph <-
  data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
             v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
             w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))