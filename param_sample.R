# Run values in skip_values will be skipped.
skip_values <- c(206, 155, 104, 52, 53, 1 ,2 ,3 ,4 ,5 ,6 ,7 ,8, 0, 308, 309,
                 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 0, 369, 370,
                 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 431, 482,
                 533, 534)

# debug mode, if True, only 10 data will be processed.
# Must be False in parallel computing.
isdebug <- F

# parallel computing, F: no parallel, 
#                     T: parallel (use all-1 cores)),
#                     N: parallel (use N cores)
# when isdebug is True, log is output on my_log.txt.
isparallel <- 6

# sensor type, 1:SP, 2:VP
sensor <- 1 

# list of models
# do_nothing
# average_sum.R
# max
MODEL_PATH <- file.path('model', 'GARCH1.R') 

# check parameters
if (isdebug  && isparallel) {
  stop("isdebug and isparallel cannot be True at the same time.")
}


