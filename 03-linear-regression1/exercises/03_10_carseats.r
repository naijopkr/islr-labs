library(MASS)
library(ISLR)

fix(Carseats)

# Part a
fit.lm0 <- lm(Sales~Price+Urban+US, data=Carseats)
summary(fit.lm0)

# Part b
"
    Sales relationship with price is negative, if the store
    is urban it has a negative impact in sales, although as
    the p-value is very high for this predictor it is not
    statistically significant and if the store is US based,
    it has a positive impact on sales.
"

# Part c
"
    y = 13.04 - 0.054*Price - 0.022*Urban + 1.201*US
    Urban = 1 / NonUrban = 0
    US = 1 / NonUS = 0
"

# Part d
"
    We can reject the null hypotesis for Price and USYes
"

# Part e
fit.lm1 <- lm(Sales~Price+US, data=Carseats)
summary(fit.lm1)

# Part f
par(mfrow=c(2, 2))
plot(fit.lm0)
plot(fit.lm1)

"
    Both models fit the data well. But the second one
    discard statistically insignicant variable. But the
    model lm1 is slightly better, based on its RSE value:

    lm0
        RSE: 2.472
        R²: 0.2393

    lm1
        RSE: 2.469
        R²: 0.2393
"

# Part g
confint(fit.lm1)

# Part h

# Residual vs Fitted doesn't show evidence of outlier
plot(fit.lm1)

# Studentized residuals between -3 and 3
plot(predict(fit.lm1), residuals(fit.lm1))
plot(predict(fit.lm1), rstudent(fit.lm1))

# Hat values show evidence of leverage for n = 43
require(car)
qqPlot(fit.lm1, main='QQ Plot')
leveragePlots(fit.lm1, name='Leverage Plot')
plot(hatvalues(fit.lm1))
which.max(hatvalues(fit.lm1))
