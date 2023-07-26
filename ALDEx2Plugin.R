library(ALDEx2)


dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")

input <- function(inputfile) {
   print("HI")
   pfix <- prefix()
   parameters <- readParameters(inputfile)
   csvfile <- paste(pfix, parameters["csvfile", 2], sep="/")
   print(csvfile)
   group1 <- parameters["group1", 2]
   count1 <- as.integer(parameters["count1", 2])
   group2 <- parameters["group2", 2]
   count2 <- as.integer(parameters["count2", 2])
   mydata <<- read.csv(csvfile)
   conds <<- c(rep(group1, count1), rep(group2, count2))
}

run <- function() {
   x <<- aldex(mydata, conds, test="kw", verbose=TRUE)
}

output <- function(outputfile) {
   print("OUTPUT")
   write.csv(x, paste(outputfile, ".x.csv", sep=""))
   write.csv(aldex.effect(aldex.clr(mydata, conds)), paste(outputfile, ".effect.csv", sep=""))
}

