source('import-libraries.r')
LoadLibraries(Boston)

# Regular linear fit
lm.fit_regular <- lm(medv~lstat, data=Boston)

# Fit model with lstat^2
lm.fit_square <- lm(medv~lstat+I(lstat^2), data=Boston)
summary(lm.fit_square)

# Compare linear models (with and without lstat^2)
anova(lm.fit_regular, lm.fit_square)

par(mfrow=c(2, 2))
plot(lm.fit_square)

# Adds polynomial terms
lm.fit_poly <- lm(medv~poly(lstat, 5), data=Boston)
summary(lm.fit_poly)

# Add log transformation
lm.fit_log <- lm(medv~log(lstat), data=Boston)
summary(lm.fit_log)

names(lm.fit_regular)
names(lm.fit_poly)

par(mfrow=c(4, 4))
plot(lm.fit_regular)
plot(lm.fit_square)
plot(lm.fit_poly)
plot(lm.fit_log)
