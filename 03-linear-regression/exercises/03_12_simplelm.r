library(MASS)
library(ISLR)

set.seed(1)

"
    The coefficient estimate for the regression Y onto X
    is the same as the one for the regression X onto X
    when the sum(x^2) is equal to the sum(y^2)
"

x <- rnorm(100)
y <- x*2 + rnorm(100)

fit.lm0 <- lm(x~y+0)
summary(fit.lm0) # Coefficient estimate: 0.39

fit.lm1 <- lm(y~x+0)
summary(fit.lm1) # Coefficient estimate: 1.99

x <- rnorm(100, mean=500, sd=0.1)
y <- rnorm(100, mean=500, sd=0.1)

fit.lm2 <- lm(y~x+0)
summary(fit.lm2) # Coefficient estimate: 1

fit.lm3 <- lm(x~y+0)
summary(fit.lm3) # Coefficient estimate: 1
