# 0. Loading libraries.
# install.packages('rpart')
# install.packages('ggplot2')
library(rpart)
library(ggplot2)


# 1. Preprocessing.
dataset <- read.csv("./Position_Salaries.csv")
dataset <- dataset[2:3]
print(dataset)

# 2. Fitting Decision Tree Regression model.
decision_tree_regression_model <- rpart(
  formula = Salary ~ Level,
  data = dataset,
  control = rpart.control(minsplit=5) # SPLITS! 
)

summary(decision_tree_regression_model)

# 3. Testing Decision Tree Regression model.
y_predicted = predict(
  decision_tree_regression_model,
  data.frame(Level=6.5)
)
print("y_predicted:")
print(y_predicted)

data = data.frame(Level=6.5)
print("Data:")
print(data)

y_predicted = predict(
  decision_tree_regression_model,
  data
)
print("y_predicted:")
print(y_predicted)

Level <- c(5, 6, 10, 15, 20)
data <- as.data.frame(cbind(Level))
y_predicted <- predict(
  decision_tree_regression_model,
  data
)
print("Data:")
print(data)
print("y_predicted:")
print(y_predicted)

y_predicted <- predict(
  decision_tree_regression_model,
  data.frame(Level=6.5)
)
print("y_predicted:")
print(y_predicted)

Level <- c(5, 6, 10)
data <- as.data.frame(cbind(Level))
y_predicted <- predict(decision_tree_regression_model, data)
print("y_predicted:")
print(y_predicted)

data <- data.frame(Level=5)
y_predicted <- predict(decision_tree_regression_model, data)
print("y_predicted:")
print(y_predicted)

# 4. Visualizing Decision Tree Regression model results.
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.001)
ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary), color="red")+
  geom_line(aes(x=x_grid, y=predict(decision_tree_regression_model, newdata=data.frame(Level=x_grid))), color="blue")+
  ggtitle("Salary(Level) - Decision Tree Regression - m.splits:5")+
  xlab("Level [-]") + ylab("Salary [$]") + ggsave("Salary(Level)-Decision_Tree_Regression.jpg")