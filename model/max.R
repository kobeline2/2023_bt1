do_process <- function(data, metadata){
  z = max(abs(data), na.rm = TRUE)
  return(z)
}