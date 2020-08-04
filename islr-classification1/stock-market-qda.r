"
Implementing Quadratic Discriminant Analysis
to Smarket data set to predict if the stocks
will go up or down
"
library(ISLR)
library(MASS)

train <- Smarket$Year < 2005

qda_fit <- qda(Direction~Lag1+Lag2, data=Smarket, subset=train)
qda_fit
"
Call:
qda(Direction ~ Lag1 + Lag2, data = Smarket, subset = train)

Prior probabilities of groups:
    Down       Up
0.491984 0.508016

Group means:
            Lag1        Lag2
Down  0.04279022  0.03389409
Up   -0.03954635 -0.03132544
"

X_test <- Smarket[!train, -9]
y_test <- Smarket$Direction[!train]

qda_pred <- predict(qda_fit, X_test)
names(qda_pred)
y_pred <- qda_pred$class

table(y_test, y_pred)
mean(y_pred == y_test) # accuracy 0.5992
