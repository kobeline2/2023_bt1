source('.Rprofile')
source('main.R')
# all_dataをRDSファイルとして保存
saveRDS(all_data, file = "res/all_data_GARCH(3,2)1.rds")
# RDSファイルを読み込み
all_data <- readRDS(file = "res/all_data_GARCH(3,1)1.rds")

#all_data_GARCH1
#all_data_GARCH-ARMA1