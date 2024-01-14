source('param.R')
source(MODEL_PATH)
all_data <- all_data[!all_data$Run %in% skip_values, ]
if (!isparallel) {
  all_data <- main_func_single(all_data, WAVE_TXT_PATH, isdebug, sensor)
} else {
  all_data <- main_func_parallel(all_data, WAVE_TXT_PATH, isdebug, sensor)
}