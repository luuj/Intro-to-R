#Jonathan Luu - Practice Exercise 9

#Prop_case question
prop_case <- function(x)
{
  r = vector()
  for (i in x)
  {
    x_split_fixed = lapply(strsplit(i, " +")[[1]], function(x){ r=toupper(substr(x,1,1)); r=paste(r, tolower(substr(x,2,nchar(x))), sep="")})
    r = c(r, paste(x_split_fixed, collapse=" "))
  }
  return(r)
}

prop_case(c("john doe", "mary jane", "TOM"))
prop_case(c("this is chapter 7", "working WITH characTers"))

#T-test question
set.seed(1)
gene <- matrix(rnorm(1000*20), 1000)
gene[1:10, 1:10] <- gene[1:10, 1:10]+4
rownames(gene) <- paste("G", 1:1000, sep="")
pheno <- c(rep("case", 10), rep("control", 10))

rowTtest <- function(data, pheno)
{
  p = apply(data, 1, function(x) t.test(x~pheno)$p.value)
  return(data[p<(0.05/nrow(data)),])
}

rowTtest(gene, pheno)