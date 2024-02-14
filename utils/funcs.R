read_wav <- function(file_path){
  data <- read.table(file_path,
                     header = TRUE,
                     colClasses = c("numeric", "numeric"))
  return(data)
}

custom_theme <- function(font, fsz, w, h, fn) {
  theme_classic()+
    theme_minimal(base_family = font, base_size = fsz) +  # 基本のテキストサイズを9ptに設定
    theme(
      plot.margin = margin(t = 0.2, r = 0.2, b = 0.2, l = 0.2, "cm"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.title = element_text(size = fsz, color = "black", family = font),
      axis.title.x = element_text(hjust = 0.5, vjust = 0,  size = fsz, color = "black", family = font),
      axis.title.y = element_text(hjust = 1.0, vjust = 0, size = fsz, color = "black", family = font),
      axis.text.x = element_text(hjust = 0.5, vjust = 0.0, size = fsz, color = "black", family = font),
      axis.text.y = element_text(hjust = 0.5, vjust = 0.5, size = fsz, color = "black", family = font),
      panel.border = element_rect(color = "black", fill = NA, linewidth = 1),
      axis.ticks = element_line(color = "black")
    )
}

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
