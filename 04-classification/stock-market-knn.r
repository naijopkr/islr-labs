"
Implementing K-Nearest Neighbors model
to Smarket data set to predict if the stocks
will go up or down
"
library(MASS)
library(ISLR)
library(class)

train <- Smarket$Year < 2005

X_train <- cbind(Smarket$Lag1, Smarket$Lag2)[train, ]
X_test <- cbind(Smarket$Lag1, Smarket$Lag2)[!train, ]
y_train <- Smarket$Direction[train]
y_test <- Smarket$Direction[!train]

set.seed(1)

# K = 1
knn_pred <- knn(X_train, X_test, y_train, k=1)
table(y_test, knn_pred)
mean(knn_pred == y_test) # accuracy 0.5


# K = 3
knn3_pred <- knn(X_train, X_test, y_train, k=3)
table(y_test, knn3_pred)
mean(knn3_pred == y_test) # accuracy 0.5357

# K = 5
knn5_pred <- knn(X_train, X_test, y_train, k=5)
table(y_test, knn5_pred)
mean(knn5_pred == y_test) # accuracy 0.4841
