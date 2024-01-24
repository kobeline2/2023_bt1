do_process <- function(data, this_excel){
  library(KFAS)
  data <- abs(data)
  # Step1 : モデルの構造を決める
  
  build_kfas <- SSModel(
    H = NA,
    data ~ SSMtrend(degree = 1, Q = NA)
  )
  
  # Step2 : パラメタ推定
  
  fit_kfas <- fitSSM(build_kfas, inits = c(1, 1))
  
  # Step3, 4 : フィルタリング・スムージング
  
  result_kfas <- KFS(
    fit_kfas$model,
    filtering = c("state", "mean"),
    smoothing = c("state", "mean")
  )
  # 推定結果の保存
  mu_filter_kfas <- result_kfas$a[-1]
  
  mu_smooth_kfas <- result_kfas$alphahat
  z = sum(mu_filter_kfas)
  return(z)
}