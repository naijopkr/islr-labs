source('import-libraries.r')
LoadLibraries(Carseats)

lm.fit <- lm(Sales~.+Income:Advertising+Price:Age, data=Carseats)
summary(lm.fit)

contrasts(Carseats$ShelveLoc)
