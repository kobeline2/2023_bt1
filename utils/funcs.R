plot_residual <- function(reg, x){
  old_par <- par()
  par(mfrow = c(2, 1))
  res <- residuals(reg)
  plot(x, res, type='p')
  abline(h=0, lty=2)
  acf(residuals(reg), lag.max=10)
  par(old_par)
}

plot_result_nls <- function(result, d){
  # plot predicts
  plot(y ~ x, d)
  dnew <- data.frame(x=seq(0, max(d$x)*1.1, by=max(d$x)/100))
  pre <- predict(result, dnew)
  lines(dnew$x, pre)
  
  # plot residuals
  old_par <- par()
  par(mfrow = c(2, 1))
  res <- residuals(result)
  plot(d$x, res, type='p')
  abline(h=0, lty=2)
  acf(residuals(result), lag.max=10)
  par(old_par)
}
