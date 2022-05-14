#Jonathan Luu - Practice Exercise 4

#Consider the following vector:
a <- c(seq(1,10, by=2), NA, 20)
names(a) <- c(LETTERS[1:6], "A")
a

#Select the elements from vector a at all odd positions (1,3,5,7)
a[seq(1,length(a), by=2)]

#Select the elements that are not missing.
a[!is.na((a))]

#Select the elements that are less than 10. Make sure not including any missing values.
a[a<10 & !is.na(a)]

#Select all the elements except for the first and the third ones.
a[-c(1,3)]

#Select the elements with names equaling to C or D.
a[c("C","D")]

#Select the elements with names equaling to A or D.
a[is.element(names(a), c("A", "D"))]

#Consider the following matrix:
b <- matrix(1:12, nrow=3)
dimnames(b) <- list(c("I","II","III"), letters[1:4])
b

#Select first and second rows, and first and third columns from matrix b.
b[c(1,2), c(1,3)]

#Select rows with row names equaling to I and III.
b[c("I", "III"),]

#Select rows with row names equaling to I and III, and all the columns except for the last one.
b[c("I", "III"), -4]

#Select one single column with column names equaling to a. Make sure the result is still a matrix.
b[, "a", drop=F]

#Consider the data frame, quine, from the MASS library.
library(MASS)
head(quine)

#Create a data frame, named quine1, by keeping the Eth and Days variables.
quine1 <- quine[c("Eth", "Days")]
str(quine1)

#Create a data frame, named quine2, by keeping Age variables equaling to F0 or F1.
quine2 <- quine[is.element(quine$Age, c("F0", "F1")),]
quine2

#Create a data frame, named quine3, by keeping Age variable only.
quine3 <- quine["Age"]
str(quine3)

#Create a data frame, named quine4, by keeping Age variable only but restricting to Days >10.
quine4 <- quine[quine$Days>10,"Age",drop=F]

#Suppose that we would like to compare days absent from school in the year (Days variable) across different age group (Age variable).
Days.Age <- lm(Days~Age, data = quine)
Days.Age

#Use appropriate functions to find out the storage type and class of Days.Age.
typeof(Days.Age)
class(Days.Age)

#Use an appropriate functions to display Days.Age in a compact form:
str(Days.Age)

#Since Days.Age is a list object, you can extract its elements. First, what are is the names attribute of Days.Age object?
names(Days.Age)

#Extract the coefficients from Days.Age and store the result to Days.Age.Coef
Days.Age.Coef <- Days.Age$coefficients
Days.Age.Coef

#Use appropriate functions to find out the storage type and class of Days.Age.Coef.
typeof(Days.Age.Coef)
class(Days.Age.Coef)

#Since Days.Age.Coef is a numeric vector, you can extract its elements as well. For example,
#how to extract the elements with names equaling to AgeF1 and AgeF2?
Days.Age.Coef[c("AgeF1", "AgeF2")]

#To obtain the ANOVA table, we can use the anova function for the object that is returned from the lm function.
Days.Age.Anova <- anova(Days.Age)
Days.Age.Anova

#Use appropriate functions to find out the storage type and class of Days.Age.Anova.
typeof(Days.Age.Anova)
class(Days.Age.Anova)

#As you can see Days.Age.Anova has both anova and data.frame attributes. You can extract its
#element like you did from a regular data.frame. For example, how to extract the F statistics?
Days.Age.Anova[["F value"]][1]

#Create a numeric vector, named F.p, with two elements. The first element is the F statistics
#from the Days.Age.Anova object. The second element is the p-value from the Days.Age.Anova
#object. Assign the its names with F and p.
F.p <- c(F=Days.Age.Anova[["F value"]][1], p=Days.Age.Anova[["Pr(>F)"]][1])
F.p