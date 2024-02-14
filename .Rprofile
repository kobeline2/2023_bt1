## library
library(dplyr)
library(xts)
library(fGarch)
library(rugarch)
library(forecast)
library(tseries)
library(ggplot2)
library(ggfortify)
library(gridExtra)

# excel file
EXCEL_PATH <- file.path("data",
                        "201409_Experimental conditions (ETH-VAW)ForR .xlsx")
# wave file with regular expression %d
WAVE_TXT_PATH <- file.path('data', 'waveTxt', 'data%d.txt')
source(file.path("utils", "read_excel_ip.R"))
rm(list = setdiff(ls(), c('EXCEL_PATH', 
                          'WAVE_TXT_PATH',
                          "MODEL_PATH",
                          "all_data")))
source(file.path("utils", "funcs.R"))
source(file.path("utils", "main_func_single.R"))
source(file.path("utils", "main_func_parallel.R"))
