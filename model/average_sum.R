do_process <- function(data, metadata){
  z = sum(abs(data[, 1] - mean(data[, 1])), na.rm = TRUE)/all_data$duration
  return(z)
}