source("C:\\Users\\Rコード\\model\\average_sum.R")



source("C:\\Users\\Rコード\\read_excel_ip.R")

# SUMカラムをデータフレームに追加
all_data$result <- NA  # 初期値はNA
# 各データIDに対して処理を行う
for (i in seq_along(all_data$Run)) {
  data_id <- all_data$Run[i]
  file_path <- sprintf("C:\\Users\\資料\\waveTxt\\data%d.txt", data_id)  # ファイルパスの生成
  # ファイル読み込みと和の計算
  tryCatch({
    # テキストファイルを読み込む
    # header = TRUE はファイルにヘッダが含まれていることを意味します
    # colClasses を "numeric" に設定して、実数型として列を読み込みます
    data <- read.table(
      file_path,
      header = TRUE,
      colClasses = c("numeric", "numeric")
    )
    # ---- ここに各データに対する処理を記述 ----
    all_data$result[i] <- do_process(data)
    # ---- ここまで ---------------------------
    print(i)
  }, error = function(e) {
    # エラー時の処理 (例: メッセージを表示)
    warning("Error in reading file: ", file_path)
  })
}
