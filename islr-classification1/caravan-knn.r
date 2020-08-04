"
Implementing the K-Nearest Neighbors model
to the Caravan Insurance data set to predict
if a person will purchase an insurance
"
library(MASS)
library(ISLR)
library(class)

names(Caravan)
dim(Caravan)
summary(Caravan$Purchase)


y <- Caravan$Purchase

# Data needs to be standardized
var(Caravan[, 1]) # 165.0378
var(Caravan[, 2]) # 0.1647

X <- scale(Caravan[, -86])
var(X[, 1]) # 1
var(X[, 2]) # 1

# Split observations (1000 to test)
test <- 1:1000

X_train <- X[-test, ]
X_test <- X[test, ]
y_train <- y[-test]
y_test <- y[test]

set.seed(1)
knn_pred <- knn(X_train, X_test, y_train, k=1)
mean(knn_pred != y_test) # error rate: 11.8%
mean(y_test != "No") # Puchase rate is 6%
table(y_test, knn_pred) # Success rate to predict puchase is 11.69%
"
Although it 11.8% may appear to be fairly good.
If we have predictes all as 'NO' we would have
an error rate of 6%, since only 6% have puchased
insurance.
"

# k = 3
knn3_pred <- knn(X_train, X_test, y_train, k=3)
mean(knn3_pred != y_test) # Error rate: 7.5%
table(y_test, knn3_pred) # Success rate to predict puchase is 19.23%

# k = 5
knn5_pred <- knn(X_train, X_test, y_train, k=5)
mean(knn5_pred != y_test) # Error rate: 6.6%
table(y_test, knn5_pred) # Success rate to predict puchase is 26.67%
