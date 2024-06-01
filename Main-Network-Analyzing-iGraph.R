############# GRAPH
?igraph

dataFrame = read.csv("main_network.csv")

net<-igraph::graph.data.frame(dataFrame, directed = F)

print(net)

net2 <- igraph::simplify(net)

print(net2)

jpeg("main_network.jpeg")

plot(net2)

dev.off()

igraph::V(net2)
igraph::E(net2)

###### EDGE BETWEENNESS:

edgeBetweeness <- igraph::cluster_edge_betweenness(net2)

jpeg("edge_betweenness_main_network.jpeg")

plot(
  edgeBetweeness, 
  net2, 
  vertex.size=10,
  vertex.label.cex=0.8
)

dev.off()

edgeBetweeness_sizes <- igraph::sizes(edgeBetweeness)
print(edgeBetweeness_sizes)

vertices <- edgeBetweeness[1:length(edgeBetweeness)]
print(vertices)

numberOfCommunities <- length(edgeBetweeness_sizes)
print(numberOfCommunities)

edgeBetweeness_modularity <- igraph::modularity(edgeBetweeness)
print(edgeBetweeness_modularity)

###### FAST GREEDY:

fast_greedy <- igraph::fastgreedy.community(net2)

jpeg("fast_greedy_main_network.jpeg")

plot(
  fast_greedy,
  net2,
  vertex.size=10,
  vertex.label.cex=0.8
)

dev.off()

fast_greedy_sizes <- igraph::sizes(fast_greedy)
fast_greedy_number_of_communities <- length(fast_greedy_sizes)
fast_greedy_modularity <- igraph::modularity(fast_greedy)

print(fast_greedy_sizes)
print(fast_greedy_number_of_communities)
print(fast_greedy_modularity)

#### WALKTRAP

walktrap <- igraph::cluster_walktrap(net2)

jpeg("walktrap_main_network.jpeg")

plot(
  walktrap,
  net2,
  vertex.size=12,
  vertex.label.cex=0.8
)

dev.off()

walktrap_sizes <- igraph::sizes(walktrap)
walktrap_number_of_communities <- length(walktrap_sizes)
walktrap_modularity <- igraph::modularity(walktrap)

print(walktrap_sizes)
print(walktrap_number_of_communities)
print(walktrap_modularity)

degree_result <- igraph::degree(net2)
closeness_result <- igraph::closeness(net2)
betweeness_result <- igraph::betweenness(net2)

print(degree_result)
print(closeness_result)
print(betweeness_result)

