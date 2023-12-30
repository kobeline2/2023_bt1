do_process <- function(data){
  z = sum(abs((data[, 1] - mean(data[, 1]))/all_data$duration[i]), na.rm = TRUE)
  return(z)
}