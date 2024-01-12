# スキップする値のリスト
skip_values <- c(206, 155, 104, 52, 53, 1 ,2 ,3 ,4 ,5 ,6 ,7 ,8, 0, 308, 309,
                 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 0, 369, 370,
                 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 431, 482,
                 533, 534)
isdebug <- F
sensor <- 1 # 1:SP, 2:VP

MODEL_PATH <- file.path('model', 'GARCH1.R')      # list of models
                                                  # do_nothing
                                                  # average_sum.R
                                                  # max