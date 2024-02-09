main_func_single <- function(all_data, WAVE_TXT_PATH, isdebug, sensor) {
  all_data$result <- NA  # 初期値はNA
  for (i in seq_along(all_data$Run)) {
    data_id <- all_data$Run[i]
    file_path <- sprintf(WAVE_TXT_PATH, data_id)
    data <- read.table(file_path,
                       header = TRUE,
                       colClasses = c("numeric", "numeric"))
    # 各データに対する処理
    d <- data[, sensor] - mean(data[, sensor])
    all_data$result[i] <- do_process(d, all_data[i, ])
    if (i %% 50 == 0) {
      cat(sprintf("%.1f%% done\n", (i * 100 / length(
        all_data$Run
      ))))
    }
    if (isdebug) {
      if (i > 10) {
        break
      }
    } # debug
  }
  return(all_data)
}