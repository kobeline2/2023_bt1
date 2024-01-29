main_func_parallel <- function(all_data, WAVE_TXT_PATH, isdebug, sensor, np) {
  
  fn <- "my_log.txt"
  if (file.exists(fn)) {file.remove(fn)} else {file.create(fn)}
  
  library(parallel)
  # np: number of cores to use, if np is logical and TRUE, use all-1 cores.
  if (is.logical(np) && np) {no_cores<-detectCores()-1} else {no_cores<-np}
  cl <- makeCluster(no_cores)
  print(paste("number of cores: ", no_cores))
  
  main_each <- function(i, all_data, WAVE_TXT_PATH,sensor, do_process, fn) {
    data_id <- all_data$Run[i]
    file_path <- sprintf(WAVE_TXT_PATH, data_id)
    data <- read.table(file_path,
                       header = TRUE,
                       colClasses = c("numeric", "numeric"))
    d <- data[, sensor] - mean(data[, sensor])
    res <- do_process(d, all_data[i, ])
    
    log_conn <- file(fn, open = "a")
    message_text <- paste(i, "/", dim(all_data)[1], " has done.")
    cat(message_text, "\n", file = log_conn) 
  }
  
  res <- parLapply(cl,
                   seq_along(all_data$Run),
                   main_each,
                   all_data,
                   WAVE_TXT_PATH,
                   sensor,
                   do_process, 
                   fn)
  stopCluster(cl)
  all_data$result <- unlist(res)
  return(all_data)
}