# excel file
EXCEL_PATH <- file.path("data",
                        "201409_Experimental conditions (ETH-VAW)ForR .xlsx")
# wave file with regular expression %d
WAVE_TXT_PATH <- file.path('data', 'waveTxt', 'data%d.txt')
# time series model path
MODEL_PATH <- file.path('model', 'do_nothing.R')
source("read_excel_ip.R")

rm(list = setdiff(ls(), c('EXCEL_PATH', 
                          'WAVE_TXT_PATH',
                          "MODEL_PATH",
                          "all_data")))
