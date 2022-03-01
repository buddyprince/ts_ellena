library(forecast)

read_data = function(file){
  return(read.csv(file))
}

ts_decompose = function(data,fre=0){
  if (fre==0){
    fre = findfrequency(data)
  }
  data = ts(data,end = length(data),frequency = fre)
  return(decompose(data, type = "additive"))
}