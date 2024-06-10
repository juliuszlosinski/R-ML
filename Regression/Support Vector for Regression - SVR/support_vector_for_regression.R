# 0. Importing libraries.
library(ggplot2)
library(e1071)

# 1. Data preprocessing.

dataset <- read.csv("./Position_Salaries.csv")
dataset <- dataset[2:3]
print(dataset)

# 2. Fitting SVR model.

support_vector_for_regression_model <- svm(
  formula = Salary ~ Level,
  data = dataset,
  type = "eps-regression"
)

summary(support_vector_for_regression_model)

# 3. Testing SVR model.

y_predicted = predict(
  support_vector_for_regression_model,
  dataset
)

print("y predicted: ")
print(y_predicted)

# 4. Visualizing support vector for regression results.
ggplot()+geom_point(aes(x=dataset$Level, y=dataset$Salary), color="red")+
  geom_line(aes(x=dataset$Level, y=predict(support_vector_fo_regression_model, dataset)), color="blue")+
  ggtitle("Salary(level) - Support vector for regreesion") + xlab("Level [-]") + ylab("Salary [$]") + ggsave("Salary(level)-Support_vector_for_regression.jpg")

## **

y_predicted = predict(
  support_vector_for_regression_model,
  data.frame(Level=1,5,6)
)

print(y_predicted)