source('param.R')
source(MODEL_PATH)
main <- function(all_data, WAVE_TXT_PATH, isdebug, skip_values, sensor) {
  # result(特徴量)カラムをデータフレームに追加
  all_data$result <- NA  # 初期値はNA
  # 各データIDに対して処理を行う
  for (i in seq_along(all_data$Run)) {
    data_id <- all_data$Run[i]
    if (data_id %in% skip_values) {next}
    file_path <- sprintf(WAVE_TXT_PATH, data_id)  
    data <- read.table(
      file_path,
      header = TRUE,
      colClasses = c("numeric", "numeric")
    )
    # 各データに対する処理
    all_data$result[i] <- do_process(data[, sensor], all_data[i,])
    if (i%%50==0){cat(sprintf("%.1f%% done\n", (i*100/length(all_data$Run))))}
    if (isdebug) {if (i > 10) {break}} # debug
  }
  return(all_data)
}

all_data <- main(all_data, WAVE_TXT_PATH, isdebug, skip_values, sensor)
rm(main)