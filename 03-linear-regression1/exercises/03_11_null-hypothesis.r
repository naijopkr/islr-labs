library(MASS)
library(ISLR)

# Create predictor and response
set.seed(1)
x <- rnorm(100)
y <- 2*x + rnorm(100)

# Part a
fit.lm0 <- lm(y~x+0)
summary(fit.lm0)
"
Call:
lm(formula = y ~ x + 0)

Residuals:
    Min      1Q  Median      3Q     Max
-1.9154 -0.6472 -0.1771  0.5056  2.3109

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
x   1.9939     0.1065   18.73   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.9586 on 99 degrees of freedom
Multiple R-squared:  0.7798,    Adjusted R-squared:  0.7776
F-statistic: 350.7 on 1 and 99 DF,  p-value: < 2.2e-16

>> Low value for p-value and high value
>> for t-value, the coefficient is statistically
>> significant
"

# Part b
fit.lm1 <- lm(x~y+0)
summary(fit.lm1)
"
Call:
lm(formula = x ~ y + 0)

Residuals:
    Min      1Q  Median      3Q     Max
-0.8699 -0.2368  0.1030  0.2858  0.8938

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
y  0.39111    0.02089   18.73   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.4246 on 99 degrees of freedom
Multiple R-squared:  0.7798,    Adjusted R-squared:  0.7776
F-statistic: 350.7 on 1 and 99 DF,  p-value: < 2.2e-16

>> Low value for p-value and high value
>> for t-value, the coefficient is statistically
>> significant
"

# Part c
"
    Both models have the same value for
    t-value, R-squared and F-statistic
"

# Part d
get_t_value <- function(x, y) {
    xy <- sum(x * y)
    x_sq <- sum(x ^ 2)
    y_sq <- sum(y ^ 2)

    return(sqrt(length(x) - 1) * xy / sqrt(x_sq * y_sq - xy^2))
}

t_stat_xy <- get_t_value(x, y) # 18.72593 ~ 18.73

# Part e
"
    It's the same because switching the values
    for x and y in the t-statistic formula does
    not change the results
"
t_stat_yx <- get_t_value(y, x)
t_stat_yx # 18.72593

# Part f
fit.lm2 <- lm(y~x)
fit.lm3 <- lm(x~y)

summary(fit.lm2)
"
Call:
lm(formula = y ~ x)

Residuals:
    Min      1Q  Median      3Q     Max
-1.8768 -0.6138 -0.1395  0.5394  2.3462

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept) -0.03769    0.09699  -0.389    0.698
x            1.99894    0.10773  18.556   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.9628 on 98 degrees of freedom
Multiple R-squared:  0.7784,    Adjusted R-squared:  0.7762
F-statistic: 344.3 on 1 and 98 DF,  p-value: < 2.2e-16

t-value: 18.556 ~ 18.56
"

summary(fit.lm3)
"
Call:
lm(formula = x ~ y)

Residuals:
     Min       1Q   Median       3Q      Max
-0.90848 -0.28101  0.06274  0.24570  0.85736

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept)  0.03880    0.04266    0.91    0.365
y            0.38942    0.02099   18.56   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.4249 on 98 degrees of freedom
Multiple R-squared:  0.7784,    Adjusted R-squared:  0.7762
F-statistic: 344.3 on 1 and 98 DF,  p-value: < 2.2e-16

t-value: 18.56
"
