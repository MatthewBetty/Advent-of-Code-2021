library(data.table)

input <- read.table("input.txt")

input <- input[,-2]

start <- input$V1
finish <- input$V3

start <- transpose(as.data.frame(strsplit(start,",")))
finish <- transpose(as.data.frame(strsplit(finish,",")))

start[, 1:2] <- sapply(start[, 1:2], as.numeric)
finish[, 1:2] <- sapply(finish[, 1:2], as.numeric)

map <- as.data.frame(matrix(0,999,999))

idx <- c()
for (i in 1:ncol(start)){
  for (t in 1:nrow(start)){
    if (start[t,i] == finish[t,i])
      idx <- c(idx,t)
  }
}

startSt <- start[idx,]
finishSt <- finish[idx,]

diagSt <- start[-idx,]
diagFin <- finish[-idx,]

for (n in 1:nrow(startSt)){
  for (j in startSt[n,1]:finishSt[n,1]){
    for (h in startSt[n,2]:finishSt[n,2]){
      map[j,h] <- map[j,h] + 1
    }
  }
}


for (n in 1:nrow(diagSt)){
  allIdx <- c()
  colIdx <- c(diagSt[n,2]:diagFin[n,2])
  acc <- 1
  for (j in diagSt[n,1]:diagFin[n,1]){
    allIdx <- c(allIdx,j,colIdx[acc])
    acc <- acc + 1
  }
  num <- 0
  newIdx <- c()
  for (t in 1:(length(allIdx)/2)){
    newIdx <- allIdx[(2*t-1):(2*t)]
    map[newIdx[1],newIdx[2]] <- map[newIdx[1],newIdx[2]] + 1
  }
}

output <- 0
for (i in 1:ncol(map)){
  for (t in 1:nrow(map)){
    if (map[t,i] > 1){
      output <- output +1
    }
  }
}

print(output)

