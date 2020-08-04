library(ISLR)

summary(Auto)

mpg_median <- median(Auto$mpg)

mpg01 <- rep(0, length(Auto$mpg))
mpg01[Auto$mpg > mpg_median] <- 1

df <- data.frame(Auto, mpg01)
names(df)

plot(df)

par(mfrow=c(2, 2))
boxplot(horsepower~mpg01, data=df)
boxplot(weight~mpg01, data=df)
boxplot(acceleration~mpg01, data=df)

"
We can see covariance between mpg01 and
horsepower, weight and acceleration.
"

X <- df[, c(-1, -2, -3, -7, -8, -9, -10)]
y <- data.frame(mpg01=df$mpg01)

length(df$year)*0.75
train <- df$year < 80

X_train <- X[train, ]
X_test <- X[!train, ]

y_train <-data.frame(mpg01=y[train, ])
y_test <- data.frame(mpg01=y[!train, ])

library(MASS)

df_train <- data.frame(X_train, y_train)


# LDA
lda.fit <- lda(mpg01~., data=df_train)

lda.probs <- predict(lda.fit, X_test)
lda.pred <- lda.probs$class

table(y_test$mpg01, lda.pred)
mean(y_test$mpg01 != lda.pred) # Error rate: 17.65


# QDA
qda.fit <- qda(mpg01~., data=df_train)
qda.probs <- predict(qda.fit, X_test)
qda.pred <- qda.probs$class

table(y_test$mpg01, qda.pred)
mean(y_test$mpg01 != qda.pred) # Error rate: 12.94%


# Logistic regression
logistic.fit <- glm(mpg01~., data=df_train, family=binomial)
logistic.probs <- predict(logistic.fit, X_test, type='response')

logistic.pred <- rep(0, length(logistic.probs))
logistic.pred[logistic.probs > .5] <- 1

table(y_test$mpg01, logistic.pred)
mean(y_test$mpg01 != logistic.pred) # Error rate: 20%


# KNN
library(class)

knn.reports <- c()
for (k in 1:30) {
    set.seed(1)
    knn.pred <- knn(X_train, X_test, y_train$mpg01, k=k)
    knn.reports <- c(knn.reports, mean(knn.pred != y_test$mpg01))
}

plot(knn.reports) # Minimal error rate: 17.65%
match(min(knn.reports), knn.reports) # Minimal error rate with K=23
