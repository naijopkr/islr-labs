source('import-libraries.r')
LoadLibraries(Boston)

# Linear Regression with Interactive Terms
lm.fit <- lm(medv~lstat*age, data=Boston)
summary(lm.fit)
