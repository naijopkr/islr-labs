Auto <- read.csv("data/Auto.csv", na.strings="?")
Auto <- na.exclude(Auto)

summary(Auto)

plot(Auto)

quant_predictors <- c(
    "mpg",
    "cylinders",
    "displacement",
    "horsepower",
    "weight",
    "year",
    "acceleration"
)

quali_predictors <- c(
    "name",
    "origin"
)

sapply(Auto[, quant_predictors], range)
sapply(Auto[, quant_predictors], mean)
sapply(Auto[, quant_predictors], sd)

Trim_Auto <- Auto[-c(10:85), ]
nrow(Auto)
nrow(Trim_Auto)

sapply(Trim_Auto[, quant_predictors], range)
sapply(Trim_Auto[, quant_predictors], mean)
sapply(Trim_Auto[, quant_predictors], sd)

boxplot(horsepower~cylinders, data=Auto)
boxplot(mpg~cylinders, data=Auto)
plot(horsepower~mpg, data=Auto)
plot(horsepower~weight, data=Auto)
plot(acceleration~weight, data=Auto)
plot(acceleration~horsepower, data=Auto)
plot(weight~displacement, data=Auto)

mpg <- Auto$mpg
weight <- Auto$weight
displacement <- Auto$displacement
horsepower <- Auto$horsepower
cor(mpg, weight)
cor(mpg, displacement)
cor(mpg, horsepower)