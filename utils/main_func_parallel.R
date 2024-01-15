main_func_parallel <- function(all_data, WAVE_TXT_PATH, isdebug, sensor) {
  library(parallel)
  no_cores <- detectCores() - 1
  cl <- makeCluster(no_cores)
  
  main_each <- function(i, all_data, WAVE_TXT_PATH,sensor, do_process) {
    data_id <- all_data$Run[i]
    file_path <- sprintf(WAVE_TXT_PATH, data_id)
    data <- read.table(file_path,
                       header = TRUE,
                       colClasses = c("numeric", "numeric"))
    res <- do_process(data[, sensor], all_data[i, ])
  }
  
  res <- parLapply(cl,
                   seq_along(all_data$Run),
                   main_each,
                   all_data,
                   WAVE_TXT_PATH,
                   sensor,
                   do_process)
  stopCluster(cl)
  all_data$result <- unlist(res)
  return(all_data)
}