library(MASS)
library(ISLR)

fix(Boston)

names(Boston)[-1]

target <- names(Boston[1])
predictors <- names(Boston[-1])

get_p <- function(model) {
    fstatistic <- NULL
    f <- summary(model)$fstatistic
    p <- pf(f[1], f[2], f[3], lower.tail = FALSE)
    attributes(p) <- NULL

    return(p)
}

coef.uni <- NULL

for (predictor in predictors) {
    lm.fit <- lm(Boston[, target]~Boston[, predictor])
    p <- get_p(lm.fit)
    print(c(predictor, p))

    coef <- coefficients(lm.fit)[2]
    attributes(coef) <- NULL
    coef.uni <- c(coef.uni, coef)
}

'
Predictor               P Value
"zn"                   "5.50647210767939e-06"
"indus"                "1.45034893302726e-21"
"chas"                 "0.209434501535199" << very high p-value, can be discated
"nox"                  "3.75173926035698e-23"
"rm"                   "6.34670298468782e-07"
"age"                  "2.85486935024409e-16"
"dis"                  "8.51994876692653e-19"
"rad"                  "2.69384439818606e-56"
"tax"                  "2.35712683525675e-47"
"ptratio"              "2.94292244735986e-11"
"black"                "2.48727397377375e-19"
"lstat"                "2.65427723147327e-27"
"medv"                 "1.17398708219434e-19"
'

plot(crim~chas, data=Boston)
plot(crim~rad, data=Boston)
plot(crim~tax, data=Boston)
plot(crim~nox, data=Boston)
plot(crim~age, data=Boston)
plot(crim~lstat, data=Boston)


Boston$chas <- factor(Boston$chas, labels=c("No", "Yes"))

boston.fit0 <- lm(crim~., data=Boston)
coef.multi <- coefficients(boston.fit0)[-1]
plot(coef.uni, coef.multi)
"
    The coefficient for nox is very higher in
    the individual model (31.24) than it is in
    the multiple predictors model (-10.31)
"

boston.fit1 <- lm(
    crim~zn+dis+rad+medv,
    data=Boston
)
summary(boston.fit1)

for (predictor in predictors) {
    try({
        lm.fit <- lm(Boston[, target]~poly(Boston[, predictor], 3))
        p <- get_p(lm.fit)
        print(c(predictor, p))
    })
}

'
"zn"                   "1.28129325849003e-06"
"indus"                "1.54927077773521e-32"
Error in poly(Boston[, predictor], 3) :
  "degree" must be less than number of unique points
"nox"                  "3.80663931952012e-38"
"rm"                   "1.06739270322408e-07"
"age"                  "1.02101906818475e-20"
"dis"                  "3.13572137533327e-35"
"rad"                  "2.31494828460805e-55"
"tax"                  "7.33819151312089e-50"
"ptratio"              "4.17131449000046e-13"
"black"                "1.41335847125299e-17"
"lstat"                "1.34733035941123e-26"
"medv"                 "4.45281797920609e-59"
'

"
Evidence of non linearity in:
    p           p-value linear              p-value poly
    indus       1.45034893302726e-21        1.54927077773521e-32
    nox         3.75173926035698e-23        3.80663931952012e-38
    age         2.85486935024409e-16        1.02101906818475e-20
    dis         8.51994876692653e-19        3.13572137533327e-35
    ptratio     2.94292244735986e-11        4.17131449000046e-13
    medv        1.17398708219434e-19        4.45281797920609e-59
"
