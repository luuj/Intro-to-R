#Jonathan Luu - Practice Exercise 1

#Create the following two vectors with the specfied components
score1 <- c(2, NA, 10, 1)
print(score1)

score2 <- c(pi, sqrt(10), 6, 8)
print(score2)

#Compute the sum of squares of these two vectors (score2 + score2) and store the result in score3
score3 <- score1^2 + score2^2
print (score3)

#Use appropriate R functions to find out the sum, mean and the length of score3
sum(score3, na.rm=T)
mean(score3, na.rm=T)
length(score3)

#Use appropriate R functions to find out the storage mode and class of score3
typeof(score3)
class(score3)

#Use an appropriate R function to find out which function is to calculate the standard deviation of a given vector
help.search("standard deviation")

#Use an appropriate R function to find out what arguments in the sd function
args(sd)

#Use an appropriate R function to find out the documentation of the sd function
help(sd)

#Use the sd function to find out the standard deviation of score3
sd(score3, na.rm=T)

#Use an appropriate R function to find out all the function names that contains "sum"
apropos("sum")

#Create a 2 by 2 matrix by using the vector score3 and store the result to mat3
mat3 <- matrix(score3, nrow=2)
print(mat3)

#Use appropriate R functions to find out the storage mode and class of mat3
typeof(mat3)
class(mat3)

#Use an appropriate R function to fnd out whether mat3 is vector
is.vector(mat3)

#Use an appropriate R function to fnd out whether mat3 contains character values
is.character(mat3)

#Create a character vector named char1 that contains values two A's and two B's
char1 <- c('A', 'A', 'B', 'B')
print(char1)

#Create a data frame dat1 that contains two variables; one uses score3 vector, and the other uses char1 vector
dat1 <- data.frame(score3, char1)
print(dat1)

#Display the contents of dat1 by using the following methods
str(dat1)
head(dat1, n=2)
tail(dat1, n=2)

#Use an appropriate R function to indicate which elements of score3 vector are missing, and assign the result to miss1. 
#Use an appropriate R function to find out the storage mode of miss1. And how many missing values are in miss1?
miss1 <- is.na(score3)
typeof(miss1)
print(miss1)
sum(miss1)

#Use an appropriate R function to find out your current working directory. Use an appropriate R function to find out what physical files that you have in your current working directory
getwd()
dir()

#Change your working directory to the Desktop of your computer
setwd("C:/Users/Jonathan/Desktop")

#Use an appropriate R function to find out what objects that we have created so far in theWorkspace
ls()

#Save all the objects to a file named Practice1.RData
save.image("Practice1.RData")

#Save score3 and mat3 to a file named foo.RData
save(score3, mat3, file="foo.RData")

#Now, remove all the objects in the Workspace
rm(list=ls())
ls()

#Load foo.RData to your workspace and use an appropriate function to verify you have loaded this file successfully
load("foo.RData")
ls()

#Load Practice1.RData to your workspace and use an appropriate function to verify you have loaded this file successfully
load("Practice1.RData")
ls()

