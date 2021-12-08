library(sjmisc)

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

noOutput <- as.data.frame(matrix(0,nrow(output),ncol(output)))

for (i in 1:ncol(output)){
  for (n in 1:nrow(output)){
    
    for (t in 1:ncol(wires)){
      #Find the letters for one, four, seven, eight
      if (nchar(wires[n,t]) == one){
        tOne <- wires[n,t]
      } else if (nchar(wires[n,t]) == four){
        tFour <- wires[n,t]
        
      } else if (nchar(wires[n,t]) == seven){
        tSeven <- wires[n,t]
       
      } else if (nchar(wires[n,t]) == eight){
        tEight <- wires[n,t]
        
      }
    }
    if (nchar(output[n,i]) == one){
      noOutput[n,i] <- 1
      
    } else if (nchar(output[n,i]) == four){
      noOutput[n,i] <- 4
      
    } else if (nchar(output[n,i]) == seven){
      noOutput[n,i] <- 7
      
    } else if (nchar(output[n,i]) == eight){
      noOutput[n,i] <- 8
      
    } else if (nchar(output[n,i]) == 5){
      counterO <- 0
      counterF <- 0
      counterS <- 0
      counterE <- 0
      
      for (z in 1:nchar(output[n,i])){
        if (grepl(substr(output[n,i],z,z), tOne)){
          counterO <- counterO + 1
        } 
        if (grepl(substr(output[n,i],z,z), tFour)){
          counterF <- counterF + 1
        }
        if (grepl(substr(output[n,i],z,z), tSeven)){
          counterS <- counterS + 1
        }
        if (grepl(substr(output[n,i],z,z), tEight)){
          counterE <- counterE + 1
        }
      }
      if (counterO == 2){
        noOutput[n,i] <- 3
      } else if (counterF == 2){
        noOutput[n,i] <- 2
      } else {
        noOutput[n,i] <- 5
      }
    
      
    } else if (nchar(output[n,i]) == 6){
      counterO <- 0
      counterF <- 0
      counterS <- 0
      counterE <- 0
      
      for (p in 1:nchar(output[n,i])){
        print(substr(output[n,i],p,p))
        if (grepl(substr(output[n,i],p,p), tOne)){
          counterO <- counterO + 1
        } 
        if (grepl(substr(output[n,i],p,p), tFour)){
          counterF <- counterF + 1
        }
        if (grepl(substr(output[n,i],p,p), tSeven)){
          counterS <- counterS + 1
        }
        if (grepl(substr(output[n,i],p,p), tEight)){
          counterE <- counterE + 1
        }
      }
      if (counterO == 1){
        noOutput[n,i] <- 6
      } else if (counterF == 4){
        noOutput[n,i] <- 9
      } else {
        noOutput[n,i] <- 0
        
      }
      
    }
    
  }
  
}

final <- c()
for (i in 1:nrow(noOutput)){
  number <- 0
  for (t in noOutput[i,]){
    number <- number*10 + t
  }
  final <- c(final,number)
}

print(final)
sum(final)



