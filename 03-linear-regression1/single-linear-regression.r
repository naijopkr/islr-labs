source('import-libraries.r')
LoadLibraries(Boston)

# Linear regression
lm.fit <- lm(medv~lstat, data=Boston)
summary(lm.fit)

names(lm.fit)
coef(lm.fit)

confint(lm.fit)

predict(lm.fit, data.frame(lstat=c(5, 10, 15)), interval='confidence')
predict(lm.fit, data.frame(lstat=c(5, 10, 15)), interval='prediction')

# Exploring fit
plot(Boston$lstat, Boston$medv)
abline(lm.fit, lwd=3, col="red")
plot(Boston$lstat, Boston$medv, pch="+")
plot(1:20, 1:20, pch=1:20)

par(mfrow=c(2, 2))
plot(lm.fit)

plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))
