#Jonathan Luu - Practice Exercise 6

#ANOVA question
library(MASS)
anova(lm(Days~Age, data = quine))
class(Days~Age)
anova(lm("Days~Age", data = quine))

ANOVA <- function(dat=quine, outcome="Days", x)
{
  Formula<-paste(outcome, x, sep="~")
  anova.results <- anova(lm(Formula, data = dat))
  results <- data.frame(Outcome=outcome, X=x, F=round(anova.results[["F value"]][1],2), P=round(anova.results[["Pr(>F)"]][1],5))
  return(results)
}

ANOVA(x="Lrn")
ANOVA(x="Age")

ANOVA_list <- function(dat, outcome, xlist)
{
  results = ANOVA(dat, outcome, xlist[1])
  
  if (length(xlist) > 1)
    for(i in 2:length(xlist))
      results = rbind(results, ANOVA(dat,outcome,xlist[i]))
  
  return(results)
}

ANOVA_list(dat=quine, outcome="Days", xlist=c("Eth"))
ANOVA_list(dat=quine, outcome="Days", xlist=c("Eth", "Lrn"))
ANOVA_list(dat=quine, outcome="Days", xlist=c("Eth", "Sex", "Lrn"))

#IO question
readFiles <- function(name)
{
  setwd(name)
  dir.create("new")
  
  for (i in dir(pattern = ".*.txt"))
  {
      results = data.frame(fileName=i, read.table(file=i, header=T, colClasses = c("character", "numeric")))
      newFileName =  paste("new_", i, sep="")
      newPath = paste("./new/", newFileName)
      write.table(results, file=newPath, sep="\t", row.names=F, quote=F)
  }
}

readFiles("/Users/jluu/Desktop/testDat")


