##Jonathan Luu - Final Assignment

##
##Problem 1
##

stackDataInList <- function(alist){
  if (is.null(alist))
    return(NULL)
  
  r <- data.frame()
  for (i in alist)
    r <- rbind(r, i)
  return(r)
}

stackDataInList(datList[1])
stackDataInList(datList[c(1,3,4)])
stackDataInList(datList)


##
##Problem 2
##

table1 <- function(dat){
  numeric_stats <- dat[!sapply(dat, is.factor)]
  factor_stats <- dat[sapply(dat, is.factor)]
  
  if (ncol(numeric_stats)==0)
    numeric_return <- NULL else{
    numeric_return <- t(sapply(numeric_stats, function(x){
      r <- data.frame(MEAN=mean(x, na.rm=T), MEDIAN=median(x, na.rm=T), SD=sd(x, na.rm=T), NMiss=sum(is.na(x)))
    })) 
    numeric_return <- data.frame(varName=names(numeric_stats), numeric_return)
    rownames(numeric_return)=NULL
  }

  if (ncol(factor_stats) == 0)
    factor_return <- NULL else{
    factor_return <- lapply(factor_stats, function(x){
      r <- table(x, useNA="always")
      names(r)[is.na(names(r))] <- "NMiss"
      r <- as.data.frame(r)
    })
    
    for (i in 1:length(factor_return)){
      factor_return[[i]] = cbind(c(names(factor_return[i]), rep("", length(factor_return[[i]]$Var1)-1)), factor_return[[i]])
      names(factor_return[[i]]) = c("varName", "group", "count")
    }
  }
  
  combined_return <- list(numericStats=numeric_return, FactorStats=stackDataInList(factor_return))
  return(combined_return)
}

table1(patient[,4:6])
table1(patient[,3:5])
table1(patient[,6:7])
table1(patient)


##
##Problem 3
##

impute <- function(..., dat)
{
  if (!is.null(c(...)))
    dat = dat[c(...)]
  
  dat[!sapply(dat, is.factor)] <- sapply(dat[!sapply(dat, is.factor)], function(x){
    x[is.na(x)] = median(x, na.rm=T)
    return(x)
  })
  
  dat[sapply(dat, is.factor)] <- sapply(dat[sapply(dat, is.factor)], function(x){
    x[is.na(x)] = x[which.max(x)]
    return(x)
  })
  
  
  return(dat)
}

impute(dat=patient)
impute("ID", "GLUC", "TGL", "HDL", dat=patient)
impute("LDL", "HRT", "MAMM", dat=patient)


##
##Problem 4
##

confound <- function(..., dat, outcome, mainVar, p=0.1){
  confounders = c(...)
  
  mainCoeff = lm(paste(outcome, "~", mainVar), data=dat)$coefficients[[2]]
  covCoeff = t(sapply(confounders, function(x){
    covariateCoeff=lm(paste(outcome, "~", mainVar, "+", x), data=dat)$coefficients[[2]]
    percentChange = as.numeric((covariateCoeff-mainCoeff)/mainCoeff)
    isConfounder = as.integer(abs(percentChange)>p)
    c(mainVar=mainVar, mainCoeff=mainCoeff, covariate=x, covariateCoeff=covariateCoeff, percentChange=percentChange, confounder=isConfounder)
  }))
  rownames(covCoeff) = NULL
  data.frame(covCoeff)
}

confound.all <- function(..., dat, outcome, p=0.1){
  combined <- lapply(c(...), function(mainVar){
    x <- confound(c(...)[c(...) != mainVar], dat=dat, outcome=outcome, mainVar=mainVar, p=p)
  })
  rownames(combined) = NULL
  stackDataInList(combined)
}

confound.all("age", "sex", "chol", "wt", "ht", dat = chol, outcome ="log(tg)", p=0.1)
confound.all("vldl", "hdl", "ldl", dat = chol, outcome ="log(tg)", p=0.15)