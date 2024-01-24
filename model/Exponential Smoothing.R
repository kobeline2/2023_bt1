do_process <- function(data, this_excel){
  library(forecast)
  data <- abs(data)
  # 単純指数平滑法の適用
  fit <- forecast::ets(data, model = "AAN")  # "AAN"は単純指数平滑法を指定
  
  # 平滑後の値を取得
  smoothed_values <- fit$fitted
  
  z = sum(smoothed_values)
  return(z)
}