#Jonathan Luu - Practice Exercise 2

#Using three methods to create a numeric vector foo1 with values 1, pi, and 10, and assign the vector names with e1, e2, and e3.
foo1 <- c(1,pi,10)
names(foo1) = c("e1", "e2", "e3")
print(foo1)

foo1 <- c(e1=1, e2=pi, e3=10)
print(foo1)

foo1 <- setNames(c(1,pi,10), c("e1","e2","e3"))
print(foo1)

#Accessing the components of foo1
foo1[c(1,3)]
foo1[c("e1","e3")]

#Create a character vector foo2 by using the names of foo1
foo2 <- names(foo1)
print(foo2)

#Create a character vector foo3 by repeating foo2 four times. Then assign its names with three-
#letter abbreviations of the month names. Lastly, assign a user-defined attribute named new_attr
#with value of foo3 is created from foo2.
foo3 <- rep(foo2, 4)
names(foo3) = month.abb
print(foo3)

attr(foo3, "new_attr") = "foo3 is created from foo2"
attributes(foo3)

#User an appropriate function to access all the attributes from foo3 and assign the result to foo4.
#What is the data type of foo4?
foo4 <- attributes(foo3)
print(foo4)
typeof(foo4)

#Create a numeric vector foo5 by using seq function. The foo5 vector needs to contains values of 2,4,6,8,10, and 12.
foo5 <- seq(2,12,2)
print(foo5)

#Use the vector foo5 to select the 2nd, 4th, 6th, 8th, 10th, and 12th elements from foo3 and assign
#the result to foo6. What attributes does foo6 have?
foo6 <- foo3[foo5]
print(foo6)
attributes(foo6)

#Create a vector foo7 by using the foo6 vector, but without the names attribute.
foo7 <- unname(foo6)
print(foo7)

#Create a vector foo8 by concatenating foo1 and foo7. What data type does foo8 contain?
foo8 <- c(foo1, foo7)
print(foo8)
typeof(foo8)

#Create a random vector foo9 with 100 elements.
foo9 <- rnorm(100, mean=5, sd=6)
mean(foo9)
sd(foo9)

#Consider the following vector:
example <- c(seq(1, 10, by=0.5), NA, 0.6)
example
foo10 <- (example > 2)
foo10
sum(foo10, na.rm=T)
sum(example > median(example, na.rm=T), na.rm=T)
sum(is.na((example)))

#Instead of using the any() function, you can also test if at least one element in the vector f is
#equaling to 3.001 by following the steps below:
f <- c(3.01, 3.001, 3.0001, 3.00001)
log_1 <- f==3.001
sum_log_1 = sum(log_1)
sum_log_1 > 0
sum(f==3.001) > 0

#Instead of using the all() function, write a R command to test if all the elements in the vector f is greater than 3.
sum(f>3) == length(f)

#Consider the following vector:
bar1 <- c(2, 5, 7, 10, 20)

#Create a logical vector logical_1 that indicates the elemenet in bar1 is greater than 5, and a
#logical vector logical_2 that indicates the elemenet in bar1 is equaling to 10 or 20.
logical_1 <- bar1 > 5
logical_2 <- bar1==10 | bar1==20
logical_1
logical_2

#Use an appropriate function can be used to convert logical_1 amd logical_2 to integer
#representation and store the result in num_1 and num_2 respectively.
num_1 <- which(logical_1)
num_2 <- which(logical_2)
num_1
num_2

#Based on logical_1 and logical_2, write an R command to indicate which elements in bar1
#is greater than 5 and is equaling to 10 or 20. Use num_1 and num_2 to accomplish the same task.
logical_1 & logical_2
intersect(num_1, num_2)

#Based on logical_1 and logical_2, write an R command to indicate which elements in bar1
#is greater than 5 or is equaling to 10 or 20. Use num_1 and num_2 to acomplish the same task.
logical_1 | logical_2
union(num_1, num_2)

#Based on logical_1 and logical_2, write an R command to indicate which elements in bar1
#is greater than 5 but is not equaling to 10 or 20. Use num_1 and num_2 to acomplish the same task.
logical_1 & !logical_2
setdiff(num_1, num_2)

#Create a factor gender based on the following vector:
gender_char <- c("M", "F", "F", "M", "F")
gender <- factor(gender_char)
gender

typeof(gender)
class(gender)

nlevels(gender)
levels(gender)
as.character(gender)

#Consider the following vector:
vec1 <- 1:6

#Using two methods to create a matrix mat1 with 3 rows and 2 columns based on vec1.
mat1 <- vec1
dim(mat1) = c(3,2)
mat1

mat1_2 <- matrix(vec1, 3, 2)
mat1_2

#Use appropriate functions to find out the number of rows, columns, and dimension of mat1
nrow(mat1)
ncol(mat1)
dim(mat1)

#Use two methods to assign a, b, and c as the row names, and I, and II as the column names for mat1.
rownames(mat1) = c("a", "b", "c")
colnames(mat1) = c("I", "II")
mat1

dimnames(mat1) = list(c("a", "b", "c"), c("I", "II"))
mat1

#Transpose mat1 from a 3 by 2 matrix to a 2 by 3 matrix and store the result to mat2.
mat2 <- t(mat1)
mat2

#Create a matrix mat3 by taking the rst and the third rows from mat1.
mat3 <- mat1[c(1,3),]
mat3

#Create a matrix mat4 by combining mat2 and mat3 horizontally.
mat4 = cbind(mat2,mat3)
mat4

#How to access the second row, and first and third columns of mat4?
mat4[2, c(1,3)]

#Use two methods to create a 3 by 2 by 2 array, names array1.
vec2 <- rep(c("A","B","C"), 3:5)
vec2
array1 <- vec2
dim(array1) = c(3,2,2)
array1

array2 <- array(vec2, c(3,2,2))
array2

