College <- read.csv("data/College.csv", na.strings="?")
rownames(College) <- College[, 1]
College <- College[, -1]

summary(College)

plot(College[, 1:10], main = "Pairs")

boxplot(
    Outstate~Private,
    data=College,
    col="red",
    xlab="Private",
    ylab="Outstate"
)

Elite <- rep("No", nrow(College))
Elite[College$Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
College <- data.frame(College, Elite)
boxplot(
    Outstate~Private,
    data=College,
    col="green",
    xlab="Elite",
    ylab="Outstate"
)

par(mfrow=c(2, 2))
hist(College$Apps, breaks=50, xlim=c(0, 25000), main="Apps")
hist(College$Enroll, breaks=25, main="Enroll")
hist(College$Expend, breaks=25, main="Expend")
hist(College$Outstate, main="Outstate")
