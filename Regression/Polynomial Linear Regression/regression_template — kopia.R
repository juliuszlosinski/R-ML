# Regression template
library(caTools)
library(ggplot2)

# 1. Preprocessing.

# 1.1 Importing the data set.
dataset <- read.csv("Position_Salaries.csv")
dataset <- dataset[2:3]

# 1.2 Splitting the data set into training set and test set.
split_format <- sample.split(dataset$Salary, SplitRatio=2/3)
train_set <- subset(dataset, split_format == TRUE)
test_set <- subset(dataset, split_format == FALSE)

# 1.3 Feature scaling
train_set <- scale(train_set)
test_set <- scale(test_set)

# 2. Creating and evaluating Regression model.

# 2.1 Fitting the Regression Model to the data set.
# Creating regressor...

# 2.2 Predicting a new result with regressor/ regression model.
y_predicted <- predict(regressor, data.frame(Level = 6.5))

# 2.3 Visualizing the regression model results.
ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary), color="red")+
  geom_line(aes(x=dataset$Level, y=predict(regressor, newdata = dataset)), color="blue")+
  ggtitle("Salary(Level) ~ Regression Model") + xlab("Level [-]") + ylab("Salary [$]")