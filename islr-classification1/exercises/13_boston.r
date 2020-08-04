library(MASS)

summary(Boston)

crime_median <- median(Boston$crim)

crim_above_median <- rep(0, length(Boston$crim))
crim_above_median[Boston$crim > crime_median] <- 1


df <- data.frame(Boston, crim_above_median)
names(df)

plot(df)

for (feat in names(df)) {
    df_plot <- data.frame(df['crim_above_median'], df[feat])
    names(df_plot) <- c('x', 'y')
    boxplot(y~x, data=df_plot, main=feat)
    readline()
}

"
feat: zn, indus, nox, age, dis, rad, tax, lstat, medv
"

features <- c(
    'zn',
    'indus',
    'nox',
    'age',
    'dis',
    'rad',
    'tax',
    'lstat',
    'medv'
)

X <- df[, features]
y <- data.frame(y=df[, 'crim_above_median'])
df_fit <- c(X, y)

train <- rep(FALSE, dim(y)[1])
train[1:dim(y)[1]*0.75] <- TRUE

X_test <- X[!train, ]
y_test <- y[!train, ]


# Logistic regression
log.fit <- glm(y~., data=df_fit, family=binomial, subset=train)
log.probs <- predict(log.fit, X_test, type='response')
log.pred <- rep(0, length(log.probs))
log.pred[log.probs > .5] <- 1

table(y_test, log.pred)
mean(y_test != log.pred) # Error rate: 7.8%


# LDA
lda.fit <- lda(y~., data=df_fit, subset=train)
lda.probs <- predict(lda.fit, X_test)
lda.pred <- lda.probs$class

table(y_test, lda.pred)
mean(y_test != lda.pred) # Error rate: 8.6%


# QDA
qda.fit <- qda(y~., data=df_fit, subset=train)
qda.probs <- predict(qda.fit, X_test)
qda.pred <- qda.probs$class

table(y_test, qda.pred)
mean(y_test != qda.pred) # Error rate: 5.5%


# KNN
library(class)

X_train <- X[train, ]
y_train <- y[train, ]

knn.reports <- c()
set.seed(1)
for (k in 1:300) {
    knn.pred <- knn(X_train, X_test, y_train, k=k)
    knn.reports <- c(knn.reports, mean(knn.pred != y_test))
}

plot(knn.reports)
min_error <- min(knn.reports) # 0.05511811 -> 5.51%
match(min_error, knn.reports) # k = 198 has the min error
