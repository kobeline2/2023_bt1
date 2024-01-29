#####
library(ggplot2)
source('param.R')
source(MODEL_PATH)
font = "Times New Roman"

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
  theme_classic()+
  theme_minimal(base_family = font, base_size = 9) +  # 基本のテキストサイズを9ptに設定
  theme(
    plot.margin = margin(t = 0.2, r = 0.2, b = 0.2, l = 0.2, "cm"),
    panel.grid.major = element_blank(),  # 主要なグリッド線を消す
    panel.grid.minor = element_blank(),  # 補助的なグリッド線も消す
    plot.title = element_text(size = 9, color = "black", family = font),
    axis.title.x = element_text(hjust = 0.5, size = 9, color = "black", family = font),
    axis.title.y = element_text(hjust = 1, vjust = 0, size = 9, color = "black", family = font),
    axis.text.x = element_text(hjust = 0.5, size = 9, color = "black", family = font),
    axis.text.y = element_text(vjust = 0.5, size = 9, color = "black", family = font),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 1)
  )+ 
  theme(axis.ticks = element_line(color = "black"))+
  scale_x_continuous(breaks = c(0, 50000, 100000, 150000))+
  # scale_x_continuous(breaks = c(1, 2, 3, 4, 5), labels = c("A", "B", "C", "D", "E"))+
  geom_hline(yintercept = res, linetype = "dashed", color = "red") +
  labs(x = "Sample Points [-]", y = "Signal Amplitude [mV]")

# ggsave("plot.png", plot = p, width = 8, height = 4, units = "cm", dpi = 600)
