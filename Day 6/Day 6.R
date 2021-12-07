library(data.table)

input <- read.table("input.txt")

fishies <- as.data.frame(strsplit(input[1,1],","))
fishies <- as.numeric(fishies[,1])

cycleday <- as.data.frame(matrix(0,8,1))
preggers <- 0
births <- 0

for (i in 1:length(table(fishies))){
  cycleday[i,1] <- table(fishies)[i]
}


for (i in 1:80){
  births <- preggers
  preggers <- cycleday[1,1]
  for (h in 2:8){
    cycleday[(h-1),1] <- cycleday[h,1]
  }
  cycleday[7,1] <- cycleday[7,1] + preggers
  cycleday[8,1] <- births
}

output <- sum(cycleday)
