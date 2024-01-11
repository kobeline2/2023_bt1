do_process <- function(data, metadata){
  m <- mean(data)
  # L1
  z = sum(abs(data - m), na.rm = TRUE)/metadata$duration
  # L2
  # z = sqrt(sum((data - m)^2, na.rm = TRUE)/metadata$duration)
  return(z)
}