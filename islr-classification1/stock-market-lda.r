"
Implementing Linear Discriminant Analysis
to Smarket data set to predict if the stocks
will go up or down.
"
library(ISLR)
library(MASS)
names(Smarket)

train <- Smarket$Year < 2005

lda_fit <- lda(Direction~Lag1+Lag2, data=Smarket, subset=train)
lda_fit
"
Call:
lda(Direction ~ Lag1 + Lag2, data = Smarket, subset = train)

Prior probabilities of groups:
    Down       Up
0.491984 0.508016

Group means:
            Lag1        Lag2
Down  0.04279022  0.03389409
Up   -0.03954635 -0.03132544

Coefficients of linear discriminants:
            LD1
Lag1 -0.6420190
Lag2 -0.5135293
"

plot(lda_fit)

X_test <- Smarket[!train, -9]
y_test <- Smarket$Direction[!train]

lda_pred <- predict(lda_fit, X_test)
names(lda_pred)

y_pred <- lda_pred$class
table(y_test, y_pred)
mean(y_pred == y_test) # accuracy 0.5595

sum(lda_pred$posterior[, 1] >= .5)
sum(lda_pred$posterior[, 1] < .5)

# The posterior probability output corresponds
# to the probability lthat the market will decrease
lda_pred$posterior[1:20, 1]
y_pred[1:20]
