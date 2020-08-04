library(MASS)
library(ISLR)

fix(Auto)

# Part a
lm.fit <- lm(mpg~horsepower, Auto)
summary(lm.fit)

# Questions:
# i.    There is a relationship between the predictor and the response.
# ii.   The relationship is strong since the p-value < 2.2e-16
# iii.  The relationship is negative (Coefficient < 0)
# iv.
newdata <- data.frame(horsepower = 98)
predict(lm.fit, newdata)
predict(lm.fit, newdata, interval='confidence')
predict(lm.fit, newdata, interval='prediction')

# Part b
plot(Auto$horsepower, Auto$mpg)
abline(lm.fit, col='red')

# Part c
par(mfrow=c(2, 2))
plot(lm.fit)

# Considerations: the residuals x fitted plot shows that the model
# is not very well fitted. This means that the relationship between
# the predictor and the response is non-linear.
