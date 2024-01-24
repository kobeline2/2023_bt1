do_process <- function(data, metadata){
  # ARMA-GARCHモデルの設定
  library(rugarch)
  spec <- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 1)),
                     mean.model = list(armaOrder = c(3, 1), include.mean = TRUE),
                     distribution.model = "norm")#distribution.modelは使用する確率分布
  #ged-一般化エラー分布が一番volatiが大きい
  
  # モデルの適合
  fit <- ugarchfit(spec, data = data, solver = 'hybrid')
  # ボラティリティの推定結果の取得
  volatility <- as.numeric(sigma(fit))
  z = sum(volatility)
  return(z)
}