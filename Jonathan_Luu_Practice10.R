#Jonathan Luu - Practice Exercise 10

#Read in chol text file
chol = data.frame(read.table(file="/Users/jluu/Downloads/chol.txt", header=T))

#Do t-test on the chol dataset
t(apply(chol[,2:12], 2, function(x){
  result = t.test(x~chol$sex)
  return_vec = c(result$estimate[1], result$estimate[2], result$statistic, result$parameter, result$p.value)
  names(return_vec) = c("F.mean", "M.mean", "t", "df", "p")
  return(return_vec)
}))

#Confound function
confound <- function(..., dat, outcome, mainVar, p=0.1)
{
  confounders = c(...)
  
  #Find univariate coefficient
  mainCoeff = lm(paste(outcome, "~", mainVar), data=dat)$coefficients[[2]]
  
  #Find confounding coefficients
  covCoeff = t(sapply(confounders, function(x){
    covariateCoeff=lm(paste(outcome, "~", mainVar, "+", x), data=dat)$coefficients[[2]]
    percentChange = as.numeric((covariateCoeff-mainCoeff)/mainCoeff)
    isConfounder = as.integer(abs(percentChange)>p)
    c(mainVar=mainVar, mainCoeff=mainCoeff, covariate=x, covariateCoeff=covariateCoeff, percentChange=percentChange, confounder=isConfounder)
  }))
  rownames(covCoeff) = NULL
  data.frame(covCoeff)
}

confound("age", "sex", "chol", "sex", "wt", "ht", dat = chol, outcome ="log(tg)", mainVar = "bmi", p=0.15)
confound("wt", "ht", "age", dat = chol, outcome ="log(tg)", mainVar = "chol")