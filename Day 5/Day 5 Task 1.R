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

startPt <- start[idx,]
finishPt <- finish[idx,]


for (n in 1:nrow(startPt)){
  for (j in startPt[n,1]:finishPt[n,1]){
    for (h in startPt[n,2]:finishPt[n,2]){
      map[j,h] <- map[j,h] + 1
    }
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

