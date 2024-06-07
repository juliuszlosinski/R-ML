# NEEDED POLYNOMIAL FEATURES TO SIMPLE LINEAR REGRESSION MODEL.

# 0. Importing libraries.
library(caTools)
library(ggplot2)

# 1. Loading data.
dataset <- read.csv("Position_Salaries.csv")
print(dataset)

# 2. Preprocessing data.
dataset <- dataset[2:3]
print(dataset)

# 3. Creating/ fitting simple linear regression model to the data set.
linear_regression_model <- lm(
  formula = Salary ~ Level,
  data = dataset
)

summary(linear_regression_model)

test_data <- as.data.frame(cbind(Level=dataset$Level))

predict(linear_regression_model, dataset)
predict(linear_regression_model, test_data)

# 4. Creating/ fitting polynomial linear regression model to the data set.
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
print(dataset)

polynomial_regression_model <- lm(
  formula = Salary ~ .,
  data = dataset
)

summary(polynomial_regression_model)

# 5. Visualizing the simple linear regression model results.
ggplot()+geom_point(aes(x=dataset$Level, y=dataset$Salary), color="red")+
  geom_line(aes(x=dataset$Level, y=predict(linear_regression_model, dataset)), color="blue")+
  ggtitle("Salary(level) - Simple linear regression regression") +
  xlab("Level [-]") + ylab("Salary [$]") + ggsave("Salary(Level)-Simple-Linear-Regression.jpg")

# 6. Visualizing the polynomial linear regression model results.
ggplot()+geom_point(aes(x=dataset$Level, y=dataset$Salary), color="red")+
  geom_line(aes(x=dataset$Level, y=predict(polynomial_regression_model, newdata=dataset)), color="purple")+
  ggtitle("Salary(level) - Polynomial linear regression") +
  xlab("Level [-]") + ylab("Salary [$]") + ggsave("Salary(Level)-Polynomial-Linear-Regression.jpg")
            
# 7. Predicting new result with Simple Linear Regression model.
y_predicted <- predict(linear_regression_model,
                       as.data.frame(cbind(Level=(6.5))))
print("Prediction of simple linear regression model for Level 6.5:")
print(y_predicted)

# OR
y_predicted <- predict(linear_regression_model, data.frame(Level = 6.5))
print(y_predicted)

# 8. Predicting new result by using Polynomial regression model.
tmp <- print(data.frame(Level=6.5, Level2=6.5^2, Level3 = 6.5^3, Level4 = 6.5^4))

y_predicted <- predict(polynomial_regression_model, data.frame(Level = 6.5,
                                                               Level2 = 6.5^2,
                                                               Level3 = 6.5^3,
                                                               Level4 = 6.5^4
                                                               ))
print(y_predicted)