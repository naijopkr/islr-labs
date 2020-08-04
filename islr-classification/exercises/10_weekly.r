library(ISLR)

# Part a
summary(Weekly)
plot(Weekly)

cor(Weekly[, -9])
plot(Weekly$Volume, ylab='Volume', xlab='Index')


# Part b
p <- c(2:7)
y <- Weekly$Direction
X <- Weekly[, p]
df <- data.frame(X, y)

log_reg <- glm(y~., data=df, family=binomial)
summary(log_reg)


# Part c
y_probs <- predict(log_reg)
y_pred <- rep("Down", length(y_probs))
y_pred[y_probs > .5] <- "Up"

confusion_matrix <- table(y, y_pred)
accuracy <- mean(y_pred == y) # 0.4655647


# Part d
train <- Weekly$Year < 2008

X_test <- data.frame(Lag2=Weekly$Lag2[!train])
y_test <- y[!train]

log_reg <- glm(y~Lag2, data=df, family=binomial, subset=train)
summary(log_reg)

y_probs <- predict(log_reg, X_test, type='response')
y_pred <- rep('Down', length(y_probs))
y_pred[y_probs > .5] <- 'Up'

cm.logreg <- table(y_test, y_pred)
acc.logreg <- mean(y_pred == y_test) # 0.5512821


# Part e
library(MASS)

lda_fit <- lda(y~Lag2, data=df, subset=train)
lda_fit

lda_probs <- predict(lda_fit, X_test)
lda_pred <- lda_probs$class

cm.lda <- table(y_test, lda_pred)
acc.lda <- mean(y_test == lda_pred) # 0.5448718


# Part f
qda_fit <- qda(y~Lag2, data=df, subset=train)
qda_fit

qda_probs <- predict(qda_fit, X_test)
qda_pred <- qda_probs$class

cm.qda <- table(y_test, qda_pred)
acc.qda <- mean(y_test == qda_pred) # 0.5384615


# Part g
library(class)

X_train <- data.frame(Lag2=df$Lag2[train])
y_train <- y[train]


set.seed(1)
knn_pred <- knn(X_train, X_test, y_train, k=1)

cm.knn <- table(y_test, knn_pred)
acc.knn <- mean(y_test == knn_pred) # 0.5

models_acc <- c(acc.logreg, acc.lda, acc.qda, acc.knn)
models_names <- c('Logistic', 'LDA', 'QDA', 'KNN')
acc_df <- data.frame(Accuracy=models_acc, row.names=models_names)

"
          Accuracy
Logistic 0.5512821 * best fit
LDA      0.5448718
QDA      0.5384615
KNN      0.5000000
"
