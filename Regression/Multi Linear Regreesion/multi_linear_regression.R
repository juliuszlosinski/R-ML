library(caTools)
library(ggplot2)

# 0. Loading data into data frame.
dataset <- read.csv("50_Startups.csv")

# 1. Preprocessing
# 1.1 Encoding categorical data.
dataset$State <- factor(dataset$State, 
                        levels = c('New York', 'California', 'Florida'),
                        labels = c(1, 2, 3))

# 1.2 Splitting data set into training and testing.
split_format <- caTools::sample.split(dataset$State, SplitRatio = 0.8)
training_data <- subset(dataset, split_format == TRUE)
testing_data <- subset(dataset, split_format == FALSE)

print("Size of training data:")
print(length(training_data$Profit))
print("Size of testing data:")
print(length(testing_data$Profit))

# 2. Training linear regression model.
# 2.1 Fitting multi linear regression model.
linear_regression_model <- lm(
  formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
  data = training_data
)

summary(linear_regression_model)

# 3. Testing multi linear regression model.
y_predicted = predict(linear_regression_model, testing_data)

print("Y expected:")
print(testing_data$Profit)
print("Y predicted:")
print(y_predicted)

ggplot() + geom_point(aes(x=testing_data$R.D.Spend, y=testing_data$Profit), color="red")+
  geom_point(aes(x=testing_data$R.D.Spend, y=y_predicted), color="blue")+ggtitle("Salary(R.D.Spend)")+
  xlab("R.D.Spend [$]")+ylab("Profit [$]") + ggsave("Salary(R.D.Spend).jpg")


## * Backward elimination.

model <- lm(
  formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
  data = training_data
)

summary(model)

model <- lm(
  formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
  data = training_data
)

summary(model)

model <- lm(
  formula = Profit ~ R.D.Spend + Marketing.Spend,
  data = training_data
)

summary(model)

model <- lm(
  formula = Profit ~ R.D.Spend,
  data = training_data
)

summary(model)