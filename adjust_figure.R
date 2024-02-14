#####
library(ggplot2)
source('param.R')
source(MODEL_PATH)

font = "Times New Roman"
fsz = 9
fn = "plot.png"
w = 8
h = 5

#####
data_id = 100
sensor = 1
file_path <- sprintf(WAVE_TXT_PATH, data_id)
data <- read.table(file_path,
                   header = TRUE,
                   colClasses = c("numeric", "numeric"))
d <- data[, sensor] - mean(data[, sensor])
res <- do_process(d, all_data[i, ])

## ggplot
d <- data.frame(x = seq_along(d), y = d)
p <- ggplot(d, aes(x = x, y = y)) +
  geom_line() +
  custom_theme(font, fsz, w, h, fn) +
  scale_x_continuous(breaks = c(0, 50000, 100000, 150000))+
  # scale_x_continuous(breaks = c(1, 2, 3, 4, 5), labels = c("A", "B", "C", "D", "E"))+
  geom_hline(yintercept = res, linetype = "dashed", color = "red") +
  labs(x = "Sample Points [-]", y = "Signal Amplitude [mV]")
ggsave(fn, plot = p, width = w, height = h, units = "cm", dpi = 600)
