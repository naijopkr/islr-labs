power <- function() {
    print(2^3)
}

power2 <- function(x, a) {
    print(x^a)
}

power3 <- function(x, a) {
    return(x^a)
}

x <- 1:10
y <- power3(x, 2)

plot(y~x)
plot(y~x, log='xy')

PlotPower <- function(x, a) {
    y <- power3(x, 3)
    plot(y~x)
}

PlotPower(1:50, 3)
