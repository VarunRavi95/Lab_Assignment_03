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
#' @source \url{https://en.wikipedia.org/wiki/Dijkstra's_algorithm/}
"wiki_graph"
