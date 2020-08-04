auto <- read.csv("data/Auto.csv", header=T, na.strings="?")
fix(auto)

auto <- na.omit(auto)
names(auto)

plot(
    auto$weight,
    auto$displacement,
    xlab="Weight",
    ylab="Displacement",
    main="Weight vs Displacement"
)

attach(auto)
plot(cylinders, mpg)

cylinders <- as.factor(cylinders)
plot(
    cylinders,
    mpg,
    col="red",
    varwidth=T,
    xlab="cylinders",
    ylab="MPG"
)

hist(mpg, col=2, breaks=15)

pairs(~ mpg + displacement + horsepower + weight + acceleration, auto)

plot(horsepower, mpg)
identify(horsepower, mpg, name)

summary(auto)
summary(mpg)
