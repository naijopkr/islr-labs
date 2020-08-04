"
Implementing Logistic Regression model
to the Caravan Insurance data set to predict
if a person will purchase an insurance
"
library(MASS)
library(ISLR)

test <- 1:1000

glm_fit <- glm(
    Purchase~.,
    data=Caravan,
    family=binomial,
    subset=-test
)
glm_probs <- predict(glm_fit, Caravan[test, ], type='response')

y_pred <- rep("No", length(glm_probs))
y_pred[glm_probs > .5] <- "Yes"

y_test <- Caravan$Purchase[test]

table(y_test, y_pred) # True positive is zero!!!

y_pred25 <- rep("No", length(glm_probs))
y_pred25[glm_probs > .25] <- "Yes"

table(y_test, y_pred25) # Success rate 33.3%
