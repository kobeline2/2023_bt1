do_process <- function(data, metadata){
  z = 
  return(z)
}


#例
# データの読み込み
dd <- read.table("C:\\Users\\資料\\waveTxt\\data9.txt",sep = "", header = TRUE)
dd <- dd$SP

# データの長さを設定
data_length <- 250000  # 希望のデータの長さ (5秒分)

# データの長さを250000まで延長
dd <- rep(dd, length.out = data_length)

# 時間の生成
time_seconds <- seq(0, (data_length - 1) / 50000, by = 1 / 50000)

# グラフの描画（線の太さを指定）
plot(time_seconds, dd, type = "l", lwd = 0, xlab = "time [s]", ylab = "voltage [mV]")

#GARCH
# fGarchパッケージをインストール（初回のみ）
# install.packages("fGarch")

# パッケージを読み込む
library(fGarch)


# GARCHモデルの適用
garch_model <- garchFit(
  ~ garch(1, 1), 
  data = dd,
  include.mean = T,
  trace = F
  )

# モデルの要約表示
summary(garch_model)

# ボラティリティの予測
volatility <- predict(garch_model, n.ahead = length(dd), plot = FALSE)$standardDeviation

# 時間軸の生成
data_length <- length(dd)
time_seconds <- seq(0, (data_length - 1) / 50000, by = 1 / 50000)

# プロット
plot(time_seconds, volatility, type = "l", col = "blue", ylab = "Volatility", xlab = "Time")