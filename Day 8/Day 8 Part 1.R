
input <- read.table("input.txt")

zero <- 6
one <- 2
two <- 5
three <- 5
four <- 4
five <- 5
six <- 6
seven <- 3
eight <- 7
nine <- 6

output <- input[12:15]
wires <- input[1:10]

nchar(output[1,1])

total <- 0

for (i in 1:ncol(output)){
  for (n in 1:nrow(output)){
    if (nchar(output[n,i]) == one){
      total <- total + 1
    } else if (nchar(output[n,i]) == four){
      total <- total + 1
    } else if (nchar(output[n,i]) == seven){
      total <- total + 1
    } else if (nchar(output[n,i]) == eight){
      total <- total + 1
    }
  }
}

print(total)

