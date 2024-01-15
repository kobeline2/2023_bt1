source('param.R')
source(MODEL_PATH)

all_data <- all_data[!all_data$Run %in% skip_values, ]
elapsed_time <- system.time(
  if (!isparallel) {
    all_data <- main_func_single(all_data, 
                                 WAVE_TXT_PATH, 
                                 isdebug, 
                                 sensor)
  } else {
    all_data <- main_func_parallel(all_data, 
                                   WAVE_TXT_PATH, 
                                   isdebug, 
                                   sensor, 
                                   isparallel)
  }
)
print(paste("elapsed time: ", elapsed_time["elapsed"], " sec"))
