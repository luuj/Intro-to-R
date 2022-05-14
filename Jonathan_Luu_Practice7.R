#Jonathan Luu - Practice Exercise 7

#Write R commands to replace the missing value with the value of the highest frequency of charvar.
charvar <- c(rep("A", 3), rep("B", 4), NA, rep("C", 2))
replace = names(which(table(charvar) == max(table(charvar))))
charvar[is.na(charvar)] = replace
charvar

set.seed(91765)
mat <- matrix(rnorm(20), 4)
dim(mat)

#Calculate the variance of each row by using the for loop.
store=numeric(4)
for (i in 1:4)
  store[i] = var(mat[i,])
store

#Instead of using the for loop, calculate the variance of each row by using the apply function.
apply(mat, 1, var)

mat[1,1] <- NA

#Calculate the variance of each row by using the for loop with a missing value.
store=numeric(4)
for (i in 1:4)
  store[i] = var(mat[i,], na.rm=T)

#Calculate the variance of each row by using the apply function with a missing value.
apply(mat, 1, var, na.rm=T)

chol <- read.table("/Users/jluu/Downloads/chol.txt")
head(chol)

#Calculate the overall mean for each variable, except for the sex variable
colMeans(chol[2:12], na.rm=T)

#Calculate the sex-specific mean for the age variable by using the tapply function
tapply(chol$age, chol$sex, mean)

chol2 <- rep("LOW", nrow(chol))
chol2[chol$chol > mean(chol$chol, na.rm=T)]= "HI"
chol2[is.na(chol$chol)]= NA

#Calculate the standard deviation of bmi for each chol2 category.
tapply(chol$bmi, chol2, sd)

#Calculate the standard deviation of bmi for each combination of sex and chol2 categories
tapply(chol$bmi, list(chol$sex, chol2), sd)

#Create a two-by-two table based on the sex and chol2 variables, and store the result to sex_chol2.
sex_chol2 = table(chol$sex, chol2)

#Add row margins by using the mean of each rows.
addmargins(sex_chol2, 2, "mean")

library(MASS)
cutpt <- quantile(painters$Drawing, seq(0, 1, by=0.2))
cutpt
painters$DrawingCat <- cut(painters$Drawing, cutpt, labels=1:5, include.lowest=T)
table(painters$DrawingCat)

#Use the tapply function to accomplish this task
tapply(painters$Drawing, painters$DrawingCat, function(x) c(Min = min(x), Max = max(x)))

#Also try to use the split and apply functions to compare the difference with the result from using the tapply function.
sapply(split(painters$Drawing, painters$DrawingCat), function(x) c(Min = min(x), Max = max(x)))

lm(Composition ~ School, data=painters)

#Now, use either the apply or the lapply funcion to compare the difference for the Composition,
#Drawing, Colour, and Expression variables across different levels in the School variables, and
#store the result in result.
result = lapply(painters[,1:4], function(x) {lm(x~School, data=painters)})

#How to extract the coefficients from result[[1]]
result[[1]]
coefficients = result[[1]]$coefficients

#Use an appropriate function to extract the coefficients from each component from the result object.
sapply(result, function(x) {x$coefficients })

