library(ISLR)
set.seed(1)

train <- sample(392, 196)

auto_fit <- lm(mpg~horsepower, data=Auto, subset=train)
