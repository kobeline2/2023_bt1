<<<<<<< HEAD
do_process <- function(data, this_excel){
  library(rugarch)
  # GARCHモデルの設定
  spec <- ugarchspec(variance.model = list(model = "sGARCH",
                                           garchOrder = c(1, 1)),
                     mean.model = list(armaOrder = c(0, 0),
                                       include.mean = TRUE),
                     distribution.model = "norm")
  
  # GARCHモデルの適用
  garch_model <- ugarchfit(spec, data = data)
  
  # モデルの概要を表示
  
  
  # ボラティリティの変動を抽出
  volatility <- sigma(garch_model)
  z = sum(volatility)
  return(z)
=======
do_process <- function(data, this_excel){
    library(rugarch)
    # GARCHモデルの設定
    spec <- ugarchspec(variance.model = list(model = "sGARCH",
                                             garchOrder = c(1, 1)),
                       mean.model = list(armaOrder = c(0, 0),
                                         include.mean = TRUE),
                       distribution.model = "norm")
  
  # GARCHモデルの適用
  garch_model <- ugarchfit(spec, data = data)
  
  # モデルの概要を表示
  
  
  # ボラティリティの変動を抽出
  volatility <- sigma(garch_model)
  z = sum(volatility)
    return(z)
>>>>>>> ee3c4e15d8ce6224e1a4f7f04652674854c535fe
}