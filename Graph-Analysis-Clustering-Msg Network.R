### Describing/ dividing network by using edge betweenness algorithm.
describe_net_edge_betweeness <- function(net){
  edge_betweeness <- igraph::cluster_edge_betweenness(net)
  edge_betweeness_sizes <- igraph::sizes(edge_betweeness)
  edge_betweeness_number_of_communities <- length(edge_betweeness_sizes)
  edge_betweeness_modularity <- igraph::modularity(edge_betweeness)
  
  print("####### EDGE BETWEENESS #######")
  print("Result:")
  print(edge_betweeness)
  print("Size of groups:")
  print(edge_betweeness_sizes)
  print("Number of communities:")
  print(edge_betweeness_number_of_communities)
  print("Modularity factor:")
  print(edge_betweeness_modularity)
  plot(
    edge_betweeness,
    net,
    vertex.size = 16,
    vertex.label.cex = 1.0
  )
  
  return (c(edge_betweeness_number_of_communities, edge_betweeness_modularity))
}

### Describing/ dividing network by using fast greedy algorithm. 
describe_net_fast_greedy <- function(net){
  fast_greedy <- igraph::fastgreedy.community(net)
  fast_greedy_sizes <- igraph::sizes(fast_greedy)
  fast_greedy_number_of_communities <- length(fast_greedy_sizes)
  fast_greedy_modularity <- igraph::modularity(fast_greedy)
  
  print("####### FAST GREEDY #######")
  print("Result:")
  print(fast_greedy)
  print("Size of groups:")
  print(fast_greedy_sizes)
  print("Number of communities")
  print(fast_greedy_number_of_communities)
  print("Modularity factor:")
  print(fast_greedy_modularity)
  plot(
    fast_greedy,
    net,
    vertex.size = 16,
    vertex.label.cex = 1.0
  )
  
  return (c(fast_greedy_number_of_communities, fast_greedy_modularity))
}

### Describing/ dividing network by using walktrap algorithm
describe_net_walktrap <- function(net){
  walktrap <- igraph::walktrap.community(net)
  walktrap_sizes <- igraph::sizes(walktrap)
  walktrap_number_of_communities <- length(walktrap_sizes)
  walktrap_modularity <- igraph::modularity(walktrap)
  
  print("####### WALKTRAP #######")
  print("Result:")
  print(walktrap)
  print("Size of groups:")
  print(walktrap_sizes)
  print("Number off communities:")
  print(walktrap_number_of_communities)
  print("Modularity factor:")
  print(walktrap_modularity)
  plot(
    walktrap,
    net,
    vertex.size = 16,
    vertex.label.cex = 1.0,
  )
  
  return (c(walktrap_number_of_communities, walktrap_modularity))
}

### Describing centrality of the network.
describe_centrality <- function(net){
  degree_result <- igraph::degree(net)
  closeness_result <- igraph::closeness(net)
  betweenness_result <- igraph::betweenness(net)
  
  print("Degree:")
  print(degree_result)
  print("Closeness:")
  print(closeness_result)
  print("Betweenness:")
  print(betweenness_result)
}

# 1. Reading data into data frame.
data_frame <- read.csv("msg_network.csv")

# 2. Creating network by using iGraph library.
net <- igraph::graph.data.frame(data_frame, directed=F)
net <- igraph::simplify(net)

# 3. Plotting/ visualizing the network.
plot(net)

# 4. Describing/ dividing network by using various algorithms.
# a) Edge betweeness algorithm (decreasing).
edge_betweeness <- describe_net_edge_betweeness(net)
# b) Fast greedy algorithm (increasing).
fast_greedy <- describe_net_fast_greedy(net)
# c) Walktrap algorithm (random).
walktrap <- describe_net_walktrap(net)

# 5. Comparing modularity of algorithms
algorithms = c("Edge betweeness", "Fast greedy", "Walktrap")
number_of_communities = c(
  edge_betweeness[1],
  fast_greedy[1],
  walktrap[1]
)
modularities = c(
  edge_betweeness[2], 
  fast_greedy[2], 
  walktrap[2]
)
comparison_data_frame <- as.data.frame(
  cbind(algorithms, number_of_communities, modularities)
)
print(comparison_data_frame)

print("The best method/ algorithm:")
print(comparison_data_frame$algorithms[comparison_data_frame$modularities 
                                       == max(comparison_data_frame$modularities)])

# 6. Describing centrality of the network
describe_centrality(net)

