# cf. http://user.keio.ac.jp/~nagakura/R/R_NLOLS.pdf

library(carData)
library(car)

# see data
plot(population~year, data=USPop, main="U.S. population")

# apply linear regression
abline(lm(population~year, data=USPop))

# logistic regression
result=nls(population ~ a/(1+exp(-(b0+b1*year))),
           start=list(a=400, b0=-49, b1=0.025),
           data=USPop, 
           trace=TRUE)
summary(result)

# plot residuals
res=residuals(result)
plot(USPop$year, res, type='b')
abline(h=0, lty=2)
acf(residuals(result), lag.max=10)

# plot predicts
plot(population ~ year, USPop)
lines(seq(1790, 2000, by=10), predict(result))

# plot predicts future
pyear2 = data.frame(year=seq(1790, 2100, by=10))
pre2=predict(result, pyear2)
plot(population ~ year, USPop ,xlim=c(1790,2100), ylim=c(0,450))
lines(pyear2$year, pre2)
