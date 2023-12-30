library(readxl)

# Excelファイルのパス
file_path <- "C:\\Users\\yukia\\Downloads\\201409_Experimental conditions (ETH-VAW)ForR .xlsx"

# よみたいExcelファイル内のシート名を指定
sheet_names <- as.list(as.character(1:10))

# set column names
column_names <- c("Run", "Inclination", "Discharge", "Vw", "Fr", "Depth", "Ds", "Pn", "mass", "SoundWave_Avg", "Vib_Avg", "ips10", "ips8", "ips6", "ips4", "ips2", "ips1", "first_collision", "duration")

f <- function(sheet) {
  data <- read_excel(file_path, sheet = sheet, skip = 2)
  # カラム名の設定
  colnames(data) <- column_names
  # 全てのカラムを実数型に変換
  data <- data.frame(lapply(data, as.numeric), stringsAsFactors = FALSE)
  return(data)
}
all_data <- lapply(sheet_names, f)
# 結合したデータフレームを表示
all_data <- do.call(rbind, all_data)