input <- read.table("input.txt", colClasses = "character")

oxyTable <- input
co2Table <- input


for(i in 1:12){
  ones <- 0
  zeros <- 0
  print(nrow(oxyTable))
  for (t in 1:nrow(oxyTable)){
    if (substr(oxyTable[t,1],i,i) == "1"){
      ones <- ones + 1
    } else {
      zeros <- zeros + 1
    }
  }
  if (ones >= zeros){
    oxyInput <- "1"
  } else {
    oxyInput <- "0"
  }
  idx <- c()
  for (t in 1:nrow(oxyTable)){
    if(substr(oxyTable[t,1],i,i) == oxyInput){
      idx <- c(idx,t)
    }
  }
  oxyTable <- as.data.frame(oxyTable[idx, ]) 
  print(nrow(oxyTable))
  if (nrow(oxyTable) == 1){
    print(oxyTable[1,1])
    break
  }
}



for(i in 1:12){
  ones <- 0
  zeros <- 0
  print(nrow(co2Table))
  for (t in 1:nrow(co2Table)){
    if (substr(co2Table[t,1],i,i) == "1"){
      ones <- ones + 1
    } else {
      zeros <- zeros + 1
    }
  }
  if (zeros > ones){
    co2Input <- "1"
  } else {
    co2Input <- "0"
  }
  idx2 <- c()
  for (y in 1:nrow(co2Table)){
    if(substr(co2Table[y,1],i,i) == co2Input){
      idx2 <- c(idx2,y)
    }
  }
  co2Table <- as.data.frame(co2Table[idx2, ])
  print(nrow(co2Table))
  if (nrow(co2Table) == 1){
    print(co2Table[1,1])
    break
  }
}





output <- strtoi(oxyTable[1,1], base = 2) * strtoi(co2Table[1,1], base = 2)

print(output)
