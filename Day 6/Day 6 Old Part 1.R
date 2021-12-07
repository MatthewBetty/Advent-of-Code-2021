library(data.table)

input <- read.table("input.txt")

fishies <- as.data.frame(strsplit(input[1,1],","))
fishies <- as.numeric(fishies[,1])
newBorn <- c()
total <- 0

for (h in 1:80){
  for (i in 1:length(fishies)){
    if (fishies[i] == 0){
     fishies[i] <- 6 
    } else{
      fishies[i] <- fishies[i] - 1
    }
  }
  fishies <- c(fishies,newBorn)
  newBorn <- c()
  for (t in 1:length(fishies)){
    if (fishies[t] == 0){
      newBorn <- c(newBorn,8)
    }
  }
  print(h)
}

print(length(fishies))
