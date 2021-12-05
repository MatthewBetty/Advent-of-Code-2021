
input <- read.table("input.txt")
bingo <- read.csv("bingo.txt", header = FALSE)



isBing <- input * 0
stop <- FALSE
winners <- as.data.frame(matrix(0,100,1))


for (n in bingo){
  
  #Mark bingo cards
  for (i in 1:ncol(input)){
    rowIdx <- which(input[,i] == n)
    isBing[rowIdx,i] <- 1
  }
  
  #Isolate bingo card
  for (t in 1:(nrow(isBing)/5)){
    bCard <- isBing[(5*t-4):(5*t),]
    
    #Check for horizontal bingo
    for (z in 1:nrow(bCard)){
      if (sum(bCard[z,]) == 5){
        winners[t,1] <- 1
        if (sum(winners) == 100){
          stop <- TRUE
          finNum <- n
          output <- input[(5*t-4):(5*t),]
          break
        }
      }
    }
    
    #Check for vertical bingo
    for (p in 1:ncol(bCard)){
      if (sum(bCard[,p]) == 5){
        winners[t,1] <- 1
        if (sum(winners) == 100){
          stop <- TRUE
          finNum <- n
          output <- input[(5*t-4):(5*t),]
          break
        }
      }
    }
    if (stop) {break} 
  }
  if (stop) {break}
}

#Calculate Final Output
temp <- -(bCard - 1)
final <- sum(output * temp) * finNum
