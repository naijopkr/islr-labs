"
Same example as in stock-market.r
but usint train test split.
"
library(ISLR)

names(Smarket)

train <- Smarket$Year < 2005

X_test <- Smarket[!train, -9]
y_test <- Smarket$Direction[!train]

glm_fit <- glm(
    Direction~.-Year-Today,
    data=Smarket,
    family=binomial,
    subset=train
)

glm_probs <- predict(glm_fit, X_test, type="response")

glm_pred <- rep("Down", length(glm_probs))
glm_pred[glm_probs > .5] <- "Up"

table(y_test, glm_pred)
mean(glm_pred == y_test) # 0.48 accuracy

# Using only Lag1 and Lag2
glm_fit <- glm(
    Direction~Lag1+Lag2,
    data=Smarket,
    family=binomial,
    subset=train
)

glm_probs <- predict(glm_fit, X_test, type="response")

glm_pred <- rep("Down", length(glm_probs))
glm_pred[glm_probs > .5] <- "Up"

table(y_test, glm_pred)
mean(glm_pred == y_test) # 0.56 accuracy

# Test with brand new data
predict(
    glm_fit,
    newdata=data.frame(Lag1=c(1.2, 1.5), Lag2=c(1.1, -0.8)),
    type="response"
)
