# apply fundamental regression

# data -----------
d <- select(all_data, 'Ds', 'mass', 'duration', 'result')
d <- na.omit(d)
d$x <- log(d$result)
d$y <- log((d$mass / d$duration)/1000)
#d$y <- d$Ds

# linear regression ----
plot(y~x, data=d, log = "xy")
plot(y~x, data=d)
reg <- lm(y~x, data=d)
abline(reg, untf = TRUE)
plot_residual(reg, d$x)

# exponential regression ----
result <- nls(y ~ a*exp(b*x),
           start=list(a=1, b=0.001),
           data=d,
           trace=TRUE)
summary(result)
plot_result_nls(result, d)
