library(ISLR)
library(boot)
attach(Auto)

set.seed(17)

auto_cv_err <- rep(0, 10)
for (i in 1:10) {
    auto_glm <- glm(mpg~poly(horsepower, i), data=Auto)
    auto_cv_err[i] <- cv.glm(Auto, auto_glm, K=10)$delta[1]
}

auto_cv_err
"
Degree      CV Error
1           24.27
2           19.27
3           19.34
4           19.29
5           19.03
6           18.90
7           19.12
8           19.15
9           18.87
10          19.50

Time of computation:
real    0m0.451s
user    0m0.438s
sys     0m0.016s

Much faster than the loocv method
"
