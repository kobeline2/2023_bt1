# apply fundamental regression

# data -----------
d <- select(all_data, 'mass', 'duration', 'result')
d <- na.omit(d)
d$x <- d$result
d$y <- d$mass / d$duration

# linear regression ----
# plot(y~x, data=d, log = "xy")
# reg <- lm(log(y)~log(x), data=d)
par(mfrow = c(1, 1))
plot(y~x, data=d)
reg <- lm(y~x, data=d)
abline(reg, untf = TRUE)
plot_residual(reg, d$x)

# exponential regression ----
result <- nls(y ~ a*exp(b*x),
           start=list(a=10, b=0.001),
           data=d,
           trace=TRUE)
summary(result)
plot_result_nls(result, d)
