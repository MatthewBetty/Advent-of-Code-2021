
input <- read.table("p1input.txt")

#Task 1.1

noIncrease <- 0

for (i in 2:nrow(input)){
  if (input[i,1] > input[i-1,1]){
    noIncrease <- noIncrease + 1
  }
}

#Answer 1.1
print(noIncrease)

#Task 1.2

noIncreaseThree <- 0

for (i in 4:nrow(input)){
  if (sum(input[(i-2):i,1]) > sum(input[(i-3):(i-1),1])){
    noIncreaseThree <- noIncreaseThree + 1
  }
}

#Answer 1.2
print(noIncreaseThree)
