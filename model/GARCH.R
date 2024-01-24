do_process <- function(data, metadata){
  z = 
  return(z)
}


#例
# データの読み込み
dd <- read.table("C:\\Users\\project\\sotsuron\\2023_bt1\\data\\waveTxt\\data98.txt",
                 sep = "",
                 header = TRUE)
dd <- dd$SP

# データの長さを設定
data_length <- 250000  # 希望のデータの長さ (5秒分)

# データの長さを250000まで延長
dd <- rep(dd, length.out = data_length)

# 時間の生成
time_seconds <- seq(0, (data_length - 1) / 50000, by = 1 / 50000)


#GARCH
library(rugarch)
# GARCHモデルの設定
spec <- ugarchspec(variance.model = list(model = "sGARCH",
                                         garchOrder = c(1, 1)),
                   mean.model = list(armaOrder = c(0, 0),
                                     include.mean = TRUE),
                   distribution.model = "norm")

# GARCHモデルの適用
garch_model <- ugarchfit(spec, data = dd)

# ボラティリティの変動を抽出
volatility <- sigma(garch_model)

# 時間軸の生成
data_length <- length(dd)
time_seconds <- seq(0, (data_length - 1) / 50000, by = 1 / 50000)

# プロット
plot(time_seconds, dd, type = "l", 
     col = "red", 
     ylab = "Voltage[mV]", 
     xlab = "Time[s]",
     xlim = c(1, 1.2)
     )
lines(time_seconds, volatility, col = "blue", lwd = 2)
