
input <- read.table("input.txt", colClasses = "character")

gamOutput <- c()
epsOutput <- c()

for(i in 1:12){
  ones <- 0
  zeros <- 0
  for (t in 1:nrow(input)){
    if (substr(input[t,1],i,i) == "1"){
      ones <- ones + 1
    } else {
      zeros <- zeros + 1
    }
  }
  if (ones >= zeros){
    gamOutput <- c(gamOutput,"1")
    epsOutput <- c(epsOutput,"0")
  } else {
    gamOutput <- c(gamOutput,"0")
    epsOutput <- c(epsOutput,"1")
  }
}

gamma <- gsub(", ","",toString(gamOutput))
epsilon <- gsub(", ","",toString(epsOutput))

output <- strtoi(gamma, base = 2) * strtoi(epsilon, base = 2)

print(output)

