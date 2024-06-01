?plot

library(datasets)

plot(iris)
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Petal.Length, iris$Petal.Width)

plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  col="#FF0000",
  main="Sepal.Width(Sepal.Length)",
  xlab = "Sepal width",
  ylab = "Sepal height"
)


plot(cos, 0, 2 * pi)
plot(exp, 1, 5)
plot(dnorm, -3, +3)


plot(
  cos,
  0,
  2 * pi,
  col = "#FF0000",
  lwd=5,
  xlab = "x",
  ylab = "cos",
  main="cos(x)"
)


plot(dnorm, -3, +3,
     xlab = "x",
     ylab = "y",
     main = "f(x)",
     lwd=6,
     col = "#AAAAA0"
)

cylinders <- mtcars$cyl

print(cylinders)
barplot(cylinders)

head(iris)

hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(
  iris$Petal.Width,
  xlab = "Petal width",
  ylab = "Frequencies",
  main = "Histogram - Petal width"
)

value = c(1, 3)
print(value)

hist(
  iris$Petal.Width[iris$Species == "setosa"],
  breaks = 9,
  xlim=c(0, 3)
)

?mtcars

plot(mtcars$wt, mtcars$cyl)
hist(mtcars$wt)
hist(mtcars$mpg)

?mtcars

plot(mtcars$wt, mtcars$mpg, cex=1.5, pch=15)

###############################################


?lynx

head(lynx)

print(lynx)

length(lynx)

hist(
  lynx,
  breaks = 14,
  freq = FALSE,
  xlab = "Values",
  ylab = "Frequencies",
  main = "Frequencies of values",
  pch = 1.5,
  col = "#AA00DD"
)

curve(
  dnorm(x, mean = mean(lynx), sd=sd(lynx)),
  col="thistle4",
  lwd=2,
  add=TRUE
)

lines(density(lynx), col="blue", lwd=2)

################

summary(lynx)

###############

head(iris)

summary(iris$Sepal.Length)
summary(iris$Sepal.Width)
summary(iris$Petal.Length)
summary(iris$Petal.Width)

load(psych)

install.packages("psych")

psych::describe(iris$Sepal.Length)
psych::describe(iris)

###########################


hist(iris$Petal.Length)
summary(iris$Petal.Length)
summary(iris$Species)
boxplot(iris$Sepal.Length)


hist(
  iris$Petal.Length[iris$Species == "versicolor"],
  main = "Petal Length: Versicolor",
  xlab = "Petal length",
  ylab = "Frequencies"
)

hist(
  iris$Petal.Length[iris$Species == "setosa"],
  main = "Petal Length: Setosa",
  xlab = "Petal length",
  ylab = "Frequencies"
)

hist(
  iris$Petal.Length[iris$Species == "virginica"],
  main = "Petal Length: Virginica",
  xlab = "Petal length",
  ylab = "Frequencies"
)

##################################################

maxPetalLength = 2
hist(
  iris$Petal.Length[iris$Petal.Length < maxPetalLength],
  main = "Petal Length < 2 [-]",
  xlab = "Petal length",
  ylab = "Frequencies",
  col = "#FF0011",
)

maxPetalWidth = 2
hist(
  iris$Petal.Width[iris$Species == "setosa" & 
                     iris$Petal.Width < maxPetalWidth],
  main = "Petal width : Setosa",
  xlab = "Petal width [m]",
  ylab = "Frequencies [-]",
  col = "#00AAFF"
)

############################

i.setosa = iris[iris$Species == "setosa", ]
i.virginica = iris[iris$Species == "virginica", ]
i.versicolor = iris[iris$Species == "versicolor", ]

i.setosa <- iris[iris$Species == "setosa", ]
i.virginica <- iris[iris$Species == "virginica", ]
i.versicolor <- iris[iris$Species == "versicolor", ]


print(i.setosa)

summary(i.setosa)
psych::describe(i.setosa)

summary(i.setosa$Sepal.Length)
hist(
  i.setosa$Sepal.Length, 
  main="Sepal Length : Setosa",
  xlab="Sepal length",
  ylab="Frequencies",
  col="#AAAAFF"
)

########### TYPES ###################


n1 = 15

typeof(n1)

?typeof

logicalVariable = TRUE

### VECTOR

v1 = c(1, 2, 3, 4, 5)

print(v1)

summary(v1)

v2 <- c(45, 23, 45, 65)

psych::describe(v2)

is.vector(v2)

#### MATRIX

m1 = matrix(
  c(1, 2, 3, 4),
  nrow=2
)


c2 = matrix(
  c(
    1, 2, 3, 4,
    5, 6, 7, 8
  ),
  nrow=2
)

print(c2)

psych::describe(c2)

m2 = matrix(
  c(
    1, 2, 3, 4,
    4, 3, 2, 1,
    4, 5, 7, 2,
    2, 3, 4, 2
  ),
  nrow=4
)
print(m2)

psych::describe(m2)

m3 = matrix(
  c(
    10:20,
    20:30,
    30:40
  ),
  nrow=3
)

print(m3)

psych::describe(m3)

m3[, 1]

######### ARRAY

a1 <- array(c(1:24), c(4,3,2))

print(a1)

######## DATA FRAME

v1 <- c(1, 2, 3)
v2 <- c(3, 4, 5)
v3 <- c(6, 7, 8)

dfa <- cbind(v1, v2, v3)

print(dfa)

df <- as.data.frame(dfa)

print(df)

age <- c(
  1, 2, 3, 4, 5
)
salary <- c(
  20, 30, 40, 50, 60
)
city <- c(
  1:5
)

df <- cbind(age, salary, city)

dataFrame <- as.data.frame(cbind(age, salary, city))

print(dataFrame)

psych::describe(dataFrame)

print(dataFrame$age)

print(dataFrame$city)

hist(
  dataFrame$age,
  xlab="Age",
  ylab="Frequency",
  main="Frequencies of age",
  col="#00DDFF"
)

value <- 5

value

time = c(
  1, 2, 3, 4, 5
)
fps = c(
  60, 59, 53, 54, 45
)
temperature = c(
  45, 62, 55, 60, 40
)

dataFrame <- as.data.frame(
  cbind(time, fps, temperature)
)

print(dataFrame)

plot(
  dataFrame$time, 
  dataFrame$fps, 
  col="red",
  xlab = "Time [s]",
  ylab = "Frame rate [F/S]",
  main = "FPS [F/S]"
)


m1 <- matrix(1:9, nrow=3)

print(m1)

############

x1 <- c(1:20)
y <- c(20:40)

dataFrame <- as.data.frame(cbind(x1, y))

print(dataFrame$y)

#### 

(x1 <- 1:3)
(y <- 1:9)

print(x1)
(df1 <- cbind.data.frame(x1, y))

typeof(df1)

#######

x1 <- 0:10
x1

x2 <- 10:0
x2

result <- seq(1, 25, by=pi)

print(result)

?c

id <- scan()

?rep

reps <- rep(1:5, 5)

reps

####### Hierarchical Clustering -------

?mtcars

print(mtcars)

cars <- mtcars[, c(1:3, 6:7, 9:11)]

?head

head(cars)

install.packages("dplyr")

require("dplyr")

hc <- cars %>% # Getting cars data
      dist %>% # Computing distance/ simil. matrix
      hclust   # Computer hierarchical clusters 

plot(hc)

#### ADDING BOXES TO PLOT

rect.hclust(hc, k = 2, border = "gray")
rect.hclust(hc, k = 3, border = "green")
rect.hclust(hc, k = 4, border = "blue")
rect.hclust(hc, k = 5, border = "orange")

################

head(mtcars)

cars <- mtcars[, c(1:4, 6:7, 9:11)]

cars

pc <- prcomp(cars, center=TRUE, scale=TRUE)


##############

?USJudgeRatings
print(USJudgeRatings)

data <- USJudgeRatings

print(data)

x <- as.matrix(data[-12])
y <- data[, 12]

print(x)
print(y)

# Using variables groups
reg1 <- lm(y~x)

print(reg1)

reg1 <- lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG +
             DECI + PREP + FAMI + ORAL + WRIT + PHYS,
           data = USJudgeRatings)
print(reg1)

reg1
summary(reg1)
anova(reg1)
resid(reg1)

coef(reg1)
confint(reg1)
hist(residuals(reg1))

###############

age = c(5, 6, 7, 8, 9, 10, 11, 12, 13)
salary = c(20, 30, 40, 30, 50, 60, 80, 90, 20)
dataFrame = as.data.frame(cbind(age, salary))

plot(dataFrame$age, dataFrame$salary, main = "Salary(age)")

regressor = lm(dataFrame$salary ~ dataFrame$age)

summary(regressor)

abline(regressor, col="red")

predict(regressor, dataFrame[-1])

plot(age, predict(regressor, dataFrame[-1]))

#############

?igraph

dataFrame = read.csv("main_network.csv")

net<-graph.data.frame(dataFrame, directed = F)

print(net)

net2 <- igraph::simplify(net)

print(net2)

plot(net2)
igraph::V(net2)
igraph::E(net2)

###### EDGE BETWEENNESS:

# 1. Doing Edge Betweenness algorithm.
edgeBetweeness <- igraph::cluster_edge_betweenness(net2)

# 2. Plotting the result.
plot(
  edgeBetweeness, 
  net2, 
  vertex.size=10,
  vertex.label.cex=0.8
)

# Getting sizes of communities.
edgeBetweeness_sizes <- igraph::sizes(edgeBetweeness)
print(edgeBetweeness_sizes)

# Getting the vertices from communities
vertices <- edgeBetweeness[1:length(edgeBetweeness)]
print(vertices)

# Getting number of communities.
numberOfCommunities <- length(edgeBetweeness_sizes)
print(numberOfCommunities)

# Getting modularity factor.
edgeBetweeness_modularity <- igraph::modularity(edgeBetweeness)
print(edgeBetweeness_modularity)

###### FAST GREEDY:

fast_greedy <- igraph::fastgreedy.community(net2)

plot(
  fast_greedy,
  net2,
  vertex.size=10,
  vertex.label.cex=0.8
)

fast_greedy_sizes <- igraph::sizes(fast_greedy)
fast_greedy_number_of_communities <- length(fast_greedy_sizes)
fast_greedy_modularity <- igraph::modularity(fast_greedy)

print(fast_greedy_sizes)
print(fast_greedy_number_of_communities)
print(fast_greedy_modularity)

#### WALKTRAP

walktrap <- igraph::cluster_walktrap(net2)

plot(
  walktrap,
  net2,
  vertex.size=12,
  vertex.label.cex=0.8
)

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

#################

dataFrame = read.csv("main_network.csv")

net<-graph.data.frame(dataFrame, directed = F)

print(net)

net2 <- igraph::simplify(net)

print(net2)

plot(net2)
igraph::V(net2)
igraph::E(net2)






