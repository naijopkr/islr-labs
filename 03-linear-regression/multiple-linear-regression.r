source('import-libraries.r')
LoadLibraries(Boston)

# Multiple linear regression
lm.fit <- lm(medv~lstat+age, data=Boston)
summary(lm.fit)

lm.fit <- lm(medv~., data=Boston)
summary(lm.fit)

library(car)
vif(lm.fit)

# All predictors but one
lm.fit1 <- lm(medv~.-age, data=Boston)
summary(lm.fit1)

# Or with update()
lm.fit1 <- update(lm.fit, ~.-age)
summary(lm.fit1)
