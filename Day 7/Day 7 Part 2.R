
input <- read.table("input.txt")

crabs <- as.data.frame(strsplit(input[1,1],","))
crabs <- as.numeric(crabs[,1])

Position <- round(mean(crabs),0)
fuel <- 0
fuels <- c()

for (j in 1:1000){
  fuel <- 0
  for (i in crabs){
    fuel <- fuel + 0.5*abs(i - j)^2 + 0.5*abs(i - j)
  }
  fuels <- c(fuels,fuel)
}

print(min(fuels))

plot(1:1000,fuels)

