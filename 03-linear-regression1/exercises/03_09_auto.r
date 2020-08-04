library(MASS)
library(ISLR)

fix(Auto)

# Part a
pairs(Auto)

# Part b
cor(subset(Auto, select=-name))

# Part c
fit.lm <- lm(mpg~.-name, Auto)
summary(fit.lm)

"
Questions
i.      There is relationship between the predictors and the
        response, p-value < 2.2e-16.
ii.     The least p-value predictors: Displacement, weight,
        year, origin.
iii.    The .75 coefficient suggests that newer cars have
        higher mpg.
"

# Part d
par(mfrow=c(2, 2))
plot(fit.lm)
"
Residuals vs Fitted suggests non-linearity
Observation 14 has high leverage
"

# Part e
fit.lm0 <- lm(mpg~displacement+weight+year*origin, Auto)
fit.lm1 <- lm(mpg~displacement+weight*horsepower+year*origin, Auto)
fit.lm2 <- lm(mpg~displacement*weight*horsepower+year*origin, Auto)
fit.lm3 <- lm(mpg~displacement*weight*horsepower*cylinders+year*origin, Auto)
summary(fit.lm0)
summary(fit.lm1)
summary(fit.lm2)
summary(fit.lm3)
plot(fit.lm)
plot(fit.lm0)
plot(fit.lm1)
plot(fit.lm2)
plot(fit.lm3)

# LM2 seems to have the best fit

# Part f
fit.log0 <- lm(mpg~log(displacement)*log(horsepower), Auto)
summary(fit.log0)
plot(fit.log0)

fit.sqrt0 <- lm(mpg~sqrt(displacement)*sqrt(horsepower), Auto)
summary(fit.sqrt0)
plot(fit.sqrt0)

fit.sq0 <- lm(mpg~I(displacement^2)*I(horsepower^2), Auto)
summary(fit.sq0)
plot(fit.sq0) # Bad fit

fit.poly0 <- lm(mpg~poly(horsepower, 5)*poly(displacement, 5), Auto)
summary(fit.poly0)
plot(fit.poly0)
