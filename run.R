source('.Rprofile')
source('main.R')
# all_dataをRDSファイルとして保存
saveRDS(all_data, file = "res/all_data.rds")
# RDSファイルを読み込み
all_data <- readRDS(file = "res/all_data.rds")