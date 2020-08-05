library(ISLR)
attach(Auto)


# Linear regression with glm() instead of lm()
auto_glm <- glm(mpg~horsepower, data=Auto)
coef(auto_glm)

auto_lm <- lm(mpg~horsepower, data=Auto)
coef(auto_lm)

"
coef(auto_glm)
(Intercept)  horsepower
39.9358610  -0.1578447

coef(auto_lm)
(Intercept)  horsepower
39.9358610  -0.1578447
"


# Using LOOCV statistic
library(boot)
auto_cv_err <- cv.glm(Auto, auto_glm)
auto_cv_err$delta

"
Cross-validation error: 24.23
"


# Using for loop to fit polynomial regressions
auto_cv_err <- rep(0, 5)
for (i in 1:5) {
    auto_glm <- glm(mpg~poly(horsepower, i), data=Auto)
    auto_cv_err[i] <- cv.glm(Auto, auto_glm)$delta[1]
}

auto_cv_err
"
Degree      CV Error
1           24.23
2           19.25
3           19.33
4           19.42
5           19.03

As in the validation set example,
we can see a sharp drop in the
estimated test MSE between the
linear and the quadratic fits,
but then no clear improvement from
using higher-order polynomials

Time of computation:
real    0m4.667s
user    0m4.640s
sys     0m0.028s
"
