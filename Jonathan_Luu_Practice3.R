#Jonathan Luu - Practice Exercise 3

#Create a list, named list1, by using the following components
list1 <- list(A=1:10, B=LETTERS[1:4], C=list(C1=matrix(1:4, ncol=2), C2=pi))

#Display list1 in a compact form
str(list1)

#Write an R command to access the first and the third components of list1
list1[c(1,3)]

#Write an R command to access the C1 component, which is the first component of C component. Make sure the returned result is a matrix.
list1$C[1]

#Use appropriate functions to find out the length and the names of the last component of list1
length(list1[[3]])
names(list1[[3]])

#Create a list, named list2, by using the following components
list2 <- list(D=10:1, E=factor(c("M","M","F","F")))

#Create a list, named list3, by concatenating list1 and list2. Display list3 in a compact form.
list3 <- c(list1, list2)
str(list3)

#Create a data.frame, dat1, based on the above table.
name <- c("Alfred", "Barbara", "John", "Kerry")
sex <- c("M", "F", "M", "F")
age <- c(23, 35, 25, 19)
height <- c(72, 61, NA, 66)
weight <- c(160.3, 125.4, 175.0, 130.2)
smoke <- c(TRUE, TRUE, FALSE, FALSE)
dat1 <- data.frame(name, sex, age, height, weight, smoke)

#Create a data frame, named dat2, with the following two variables
dat2 <- data.frame(smoke_ind=as.integer(dat1$smoke), bmi=(100*dat1$weight)/dat1$height^2)

#Create a data frame, named dat3, by combining dat1 and dat2 horizontally.
dat3 <- cbind(dat1, dat2)

#Create a data frame, named dat4, by using all the variables from dat3 except for the name variable. Then use the name variable as the row names for dat4.
dat4 <- dat3[2:8]
rownames(dat4) <- dat3$name

#Create a text file based on dat4 data frame
write.table(dat4, file="dat4.txt", sep="\t", quote=F, row.names=F, na=" ")
