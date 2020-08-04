library(MASS)
head(Boston)

nrow(Boston)
ncol(Boston)

attach(Boston)

plot(Boston)
plot(medv, lstat)
plot(crim, medv)
plot(rm, medv)


plot(nox, dis)
plot(age, nox)
plot(age, dis)

plot(crim, age)
plot(crim, dis)
plot(crim, lstat)
plot(crim, medv)
boxplot(crim~rad)
boxplot(crim~chas)

max(dis)
min(dis)
mean(dis)

boxplot(dis~chas)
plot(dis, tax)
plot(indus, tax)

plot(crim)
plot(tax)
plot(ptratio)
plot(dis, ptratio)

nrow(subset(Boston, chas == 1))

median(ptratio)

range(medv)
mean(medv)

subset(Boston, medv == min(medv))

nrow(subset(Boston, rm > 7))
nrow(subset(Boston, rm > 8))
rm_bigger_8 <- subset(Boston, rm > 8)
sapply(rm_bigger_8, mean)
sapply(rm_bigger_8, range)