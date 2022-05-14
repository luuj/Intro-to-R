#Jonathan Luu - Practice Exercise 5

#Extreme function question
extreme <- function (vec)
{
  extreme_value = vec[abs(vec-mean(vec))>2*sd(vec)]
  if (length(extreme_value)>0) 
  {
    cat("The Extreme Values Are:", "\n", extreme_value, "\n")
    return(extreme_value)
  } 
  else
  {
    cat("There are no extreme values", "\n")
    return(NULL)
  }
}

set.seed(91786)
foo1 <- rnorm(100)
r1 <- extreme(foo1)
r1
r2 <- extreme(1:10)
r2

#Painters question
library(MASS)
head(painters)

mean.sd <- function(dat, varname)
{
  if (sum(is.element(names(dat), varname)) == 0)
    stop("No such variable\n")
  
  if (!is.numeric(dat[[varname]]))
    stop("The variable must be numeric")
  
  c(mean(dat[[varname]]), sd(dat[[varname]]))
}

mean.sd(painters, "Composition")  
mean.sd(painters, "Drawing")

mean.sd(painters, "Compositio")
mean.sd(painters, "School")
mean.sd(painters, "Composition")


mean.sd.table <- function(dat, varlist)
{
  table <- matrix(nrow=length(varlist), ncol=2)
  rownames(table) = varlist
  colnames(table) = c("Mean", "SD")
  
  for (i in 1:length(varlist))
  {
    table[i,] <- mean.sd(dat, varlist[i])
  }  

  return(table)
}

mean.sd.table(painters, "Composition")
mean.sd.table(painters, c("Composition","Drawing"))
mean.sd.table(painters, c("Composition", "Drawing", "Colour"))
mean.sd.table(painters, c("Composition", "Drawing", "Colour", "Expression"))

#Area question
Area <- function(shape, a)
{
  if (shape == "T")
    return((sqrt(3)/4)*a^2)
  else if(shape == "S")
    return(a^2)
  else if (shape == "P")
    return((1/4)*sqrt(5*(5+2*sqrt(5)))*a^2)
}

Area("T",4)
Area('S',7)
Area('P',2:7)

Area2 <- function(shapes, a)
{
  return.list <- list()
  for (i in 1:length(shapes))
    return.list[[i]] <- Area(shapes[i], a)  
  
  names(return.list) <- shapes
  return(return.list)
}

Area2('T', 1:4)
Area2(c('T', 'S'), c(3, 7, 10))
Area2(c('P', 'T', 'S'), c(1, 5))