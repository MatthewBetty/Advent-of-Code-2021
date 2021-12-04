

input <- read.table("input.txt")

#Task 2.1

xPos <- 0
yPos <- 0

for (i in 1:nrow(input)){
  if (input$V1[i] == "forward"){
    xPos <- xPos + input$V2[i]
  } else if (input$V1[i] == "down"){
    yPos <- yPos + input$V2[i]
  } else
    yPos <- yPos - input$V2[i]
}

#Task 2.1 Answer
xPos * yPos


#Task 2.2

horizPos <- 0
depth <- 0
aim <- 0 

for (i in 1:nrow(input)){
  if (input$V1[i] == "forward"){
    horizPos <- horizPos + input$V2[i]
    depth <- depth + aim * input$V2[i]
  } else if (input$V1[i] == "down"){
    aim <- aim + input$V2[i]
  } else
    aim <- aim - input$V2[i]
}

#Task 2.2 Answer
horizPos * depth

