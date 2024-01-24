# パッケージの読み込み
library(rugarch)

# 時系列データの読み込み（ここでは仮のデータを使用）
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

# グラフの描画（線の太さを指定）
plot(time_seconds, 
     dd, 
     type = "l", 
     lwd = 1, 
     xlab = "time [s]", ylab = "voltage [mV]",
     xlim = c(1, 1.2))




# ARMA-GARCHモデルの設定
spec <- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 1)),
                   mean.model = list(armaOrder = c(1, 1), include.mean = TRUE),
                   distribution.model = "ged")#distribution.modelは使用する確率分布
#ged-一般化エラー分布が一番volatiが大きい

# モデルの適合
fit <- ugarchfit(spec, dd, solver = 'hybrid')

# ボラティリティの推定結果の取得
volatility <- as.numeric(sigma(fit))

# 時系列データとボラティリティの推定値をプロット
plot(time_seconds, dd,
     main = "Time Series with GARCH Volatility", 
     ylab = "Value", 
     col = "blue",
     type = "l",
     lwd = 2,
     xlim = c(1, 1.2))
lines(volatility, col = "red", 
      type = "l", 
      lwd = 2)
