set.seed(1)

fit_and_plot <- function(x, y) {
    fit.lm0 <- lm(y~x)
    fit.lm1 <- lm(y~x+I(x^2))
    print(summary(fit.lm0))
    print(summary(fit.lm1))
    print(confint(fit.lm0))

    plot(y~x)
    abline(-1, 0.5, col='red') # true relationship
    abline(fit.lm0, col='blue') # fitted relationship
    abline(fit.lm1, col='green') # fitted relationship with x^2
    legend(
        "bottomright",
        legend=c("True relationship", "Fitted model", "Fittet model with x^2"),
        col=c("red", "blue", "green"),
        lwd=2
    )
}

x <- rnorm(100)

# Model 1: eps sd: 0.5
eps <- rnorm(100, sd=0.5)
y <- 0.5 * x - 1 + eps # Beta 0: -1, Beta 1: 0.5
length(y)
fit_and_plot(x, y)
"
Formula1:
lm(formula = y ~ x)

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept) -1.01885    0.04849 -21.010  < 2e-16 ***
x            0.49947    0.05386   9.273 4.58e-15 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.4814 on 98 degrees of freedom
Multiple R-squared:  0.4674,    Adjusted R-squared:  0.4619
F-statistic: 85.99 on 1 and 98 DF,  p-value: 4.583e-15

==================================================================

Formula2:
lm(formula = y ~ x + I(x^2))

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept) -0.97164    0.05883 -16.517  < 2e-16 ***
x            0.50858    0.05399   9.420  2.4e-15 ***
I(x^2)      -0.05946    0.04238  -1.403    0.164
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.479 on 97 degrees of freedom
Multiple R-squared:  0.4779,    Adjusted R-squared:  0.4672
F-statistic:  44.4 on 2 and 97 DF,  p-value: 2.038e-14

==================================================================

Confidence intervals Formula1

                 2.5 %     97.5 %
(Intercept) -1.1150804 -0.9226122
x            0.3925794  0.6063602
"

# Model 2: eps sd: 0.1 >> less noise
eps2 <- rnorm(100, sd=0.1)
y2 <- 0.5*x - 1 + eps2
fit_and_plot(x, y2)
"
Formula1:
lm(formula = y ~ x)

Coefficients:
             Estimate Std. Error t value Pr(>|t|)
(Intercept) -1.003164   0.009723  -103.2   <2e-16 ***
x            0.488173   0.010800    45.2   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.09652 on 98 degrees of freedom
Multiple R-squared:  0.9542,    Adjusted R-squared:  0.9538
F-statistic:  2043 on 1 and 98 DF,  p-value: < 2.2e-16

==================================================================

Formula2:
lm(formula = y ~ x + I(x^2))

Coefficients:
             Estimate Std. Error t value Pr(>|t|)
(Intercept) -1.005599   0.011907 -84.456   <2e-16 ***
x            0.487703   0.010928  44.629   <2e-16 ***
I(x^2)       0.003067   0.008578   0.358    0.721
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.09695 on 97 degrees of freedom
Multiple R-squared:  0.9543,    Adjusted R-squared:  0.9533
F-statistic:  1013 on 2 and 97 DF,  p-value: < 2.2e-16

==================================================================

Confidence intervals Formula1

                 2.5 %     97.5 %
(Intercept) -1.0224601 -0.9838682
x            0.4667405  0.5096058
"

# Model 3: eps sd: 1 >> more noise
eps3 <- rnorm(100)
y3 <- 0.5*x - 1 + eps3
fit_and_plot(x, y3)
"
Formula1:
lm(formula = y ~ x)

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept)  -1.2109     0.1090 -11.106  < 2e-16 ***
x             0.6038     0.1211   4.986 2.66e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.082 on 98 degrees of freedom
Multiple R-squared:  0.2024,    Adjusted R-squared:  0.1942
F-statistic: 24.86 on 1 and 98 DF,  p-value: 2.662e-06

==================================================================

Formula2:
lm(formula = y ~ x + I(x^2))

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept) -1.19990    0.13358  -8.982 2.11e-14 ***
x            0.60595    0.12260   4.942 3.23e-06 ***
I(x^2)      -0.01383    0.09624  -0.144    0.886
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.088 on 97 degrees of freedom
Multiple R-squared:  0.2025,    Adjusted R-squared:  0.1861
F-statistic: 12.32 on 2 and 97 DF,  p-value: 1.711e-05

==================================================================

Confidence intervals Formula1

                 2.5 %     97.5 %
(Intercept) -1.4272494 -0.9945209
x            0.3635036  0.8441495
"

"
Observations:
    Formula1: lm(formula = y ~ x)
    Formula2: lm(formula = y ~ x + I(x^2))

    f(x) = y: Intercept: -1, Slope: 0.5
    Model 1:
        Formula1 has intercept and slope very close to real ones.
        Formula2 has a p-value higher than Formula1 as expected.
    Model 2:
        Formula1: shows lower p-value compared with Formula1 in model 1.
        Formula2: shows worse results compared with Formula2 in model 1
    Model 3:
        Formula1: has higher p-value than Formula1 in models 1 and 2
        Formula2: has the best performance compared with Formula2 in other
                  models
"
