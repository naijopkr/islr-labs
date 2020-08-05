library(ISLR)
attach(Auto)

set.seed(2)
train <- sample(392, 196)


# Estimate the test error for linear regression
auto_fit <- lm(mpg~horsepower, data=Auto, subset=train)
mean((mpg - predict(auto_fit, Auto))[-train]^2) # 23.26601


# Use poly() to estimate the test error for
# quadratic and cubic regression
auto_fit2 <- lm(mpg~poly(horsepower, 2), data=Auto, subset=train)
mean((mpg - predict(auto_fit2, Auto))[-train]^2)

auto_fit3 <- lm(mpg~poly(horsepower, 3), data=Auto, subset=train)
mean((mpg - predict(auto_fit3, Auto))[-train]^2)


"
Results

set.seed(1) MSE:
    Linear function: 23.26601
    Quadratic: 18.71646
    Cubic: 18.79401

set.seed(2) MSE:
    Linear function: 25.72651
    Quadratic: 20.43036
    Cubic: 20.38533

We can verify that the quadratic function
describes better the relation mpg~horsepower
than the linear function. There is little to
no evidence that the cubic function performs
better than the quadratic one.
"
