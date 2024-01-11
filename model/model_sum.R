do_process <- function(data, metadata){
  z = sum(data[, 1], na.rm = TRUE)
  return(z)
}