
input <- read.table("input.txt")
bingo <- read.csv("bingo.txt", header = FALSE)



isBing <- input * 0
stop <- FALSE

for (n in bingo){
  
  #Mark bingo cards
  for (i in 1:ncol(input)){
    rowIdx <- which(input[,i] == n)
    isBing[rowIdx,i] <- 1
  }
  
  #Isolate Bingo Card
  for (t in 1:(nrow(isBing)/5)){
    bCard <- isBing[(5*t-4):(5*t),]
    
    #Check for horizontal bingo
    for (z in 1:nrow(bCard)){
      if (sum(bCard[z,]) == 5){
        print("horizontal bingo")
        stop <- TRUE
        output <- input[(5*t-4):(5*t),]
        finNum <- n
        break
      }
    }
    
    #Check for vertical bingo
    for (p in 1:ncol(bCard)){
      if (sum(bCard[,p]) == 5){
        print("Vertical Bingo")
        stop <- TRUE
        output <- input[(5*t-4):(5*t),]
        finNum <- n
        break
      }
    }
   if (stop) {break} 
  }
  if (stop) {break}
}


#Calculate output
temp <- -(bCard - 1)
final <- sum(output * temp) * finNum



