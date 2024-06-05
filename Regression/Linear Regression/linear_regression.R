# Loading data
data_set <- read.csv("Salary_Data.csv")

library(caTools)

split_format <- caTools::sample.split(data_set$Salary, SplitRatio = 2/3)
training_data <- subset(data_set, split_format == TRUE)
testing_data <- subset(data_set, split_format == FALSE)

print("Size of training data:")
print(length(training_data$YearsExperience))
print("Size of testing data:")
print(length(testing_data$YearsExperience))

# Fitting Simple Linear Regression model.
regression_linear_model <- lm(
  training_data$Salary ~ training_data$YearsExperience
)

# Predicting on the test results
y_predicted <- predict(
  regression_linear_model, 
  as.data.frame(testing_data$YearsExperience)
)

# Printing results.
print(y_predicted)

install.packages('ggplot2')

#ggplot2::qplot(
#  training_data$YearsExperience, 
#  training_data$Salary,
#  xlab = "Years of experience",
#  ylab = "Salary",
#  main="Salary(years of experience)"
#)

library(ggplot2)

ggplot()+geom_point(aes(x=training_data$YearsExperience, y=training_data$Salary), color="red")+
  geom_point(aes(x=training_data$YearsExperience, y=predict(regression_linear_model, as.data.frame(training_data$YearsExperience))), color="blue")+
  geom_line(aes(x=training_data$YearsExperience, y=predict(regression_linear_model, as.data.frame(training_data$YearsExperience))), color="green")+
  ggtitle("Salary(years of experience)") + xlab("Years of experience [y]") + ylab("Salary [$]") + ggsave("Salary(years) - Linear Regression.jpg")
