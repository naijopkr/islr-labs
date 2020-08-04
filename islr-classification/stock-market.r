library(ISLR)

names(Smarket)
dim(Smarket)
summary(Smarket)
fix(Smarket)

pairs(Smarket)

cor(Smarket[, -9])

plot(Smarket$Volume)

fit_glm <- glm(Direction~.-Year-Today, data=Smarket, family=binomial)
summary(fit_glm)

coef(fit_glm)
summary(fit_glm)$coef
summary(fit_glm)$coef[, 4]

probs_glm <- predict(fit_glm, type="response")
probs_glm[1:10]
length(probs_glm)

contrasts(Smarket$Direction)

pred_glm <- rep("Down", length(probs_glm))
pred_glm[probs_glm > .5] <- "Up"
pred_glm[1:10]

confusion_matrix <- table(Smarket$Direction, pred_glm)

accuracy <- mean(pred_glm == Smarket$Direction)
