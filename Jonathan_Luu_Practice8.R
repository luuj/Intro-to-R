#Jonathan Luu - Practice Exercise 8

library(MASS)

#Based on the painters data frame from the MASS library:
d1 = painters[painters$Colour>=17 & painters$School=="D", ]
d2 = painters[c("Da Udine", "Barocci"),]
d3 = painters[painters$Colour>=17 & painters$School=="D", c("Composition", "Drawing")]

#Creating variables
qt = quantile(painters$Composition, seq(0,1, by=1/3))
Comp_cat = cut(painters$Composition, qt, labels=c("I","II","III"), include.lowest=T)
Comp_cat2 = ifelse(painters$Composition < qt[2], "I", ifelse(painters$Composition < qt[3], "II", "III"))
identical(Comp_cat, Comp_cat2)
ordinal = 1 + (painters$Composition >= qt[2]) + (painters$Composition >= qt[3])

convert <- c(A = "One", B = "Two", C = "Three", D = "Four", E = "Five", F = "Six", G = "Seven", H = "Eight")
School_new <- convert[as.character(painters$School)]

#Based on the quine data frame from the MASS library, sort the variables based on the following order:
quine[order(quine$Eth, -quine$Days),]
quine[order(quine$Eth, -xtfrm(quine$Sex), -quine$Days),]

nrow(unique(quine))
nrow(unique(quine[1:4]))
nrow(unique(quine[1:2]))
quine_order = quine[order(quine$Eth, quine$Sex, -quine$Days),]
dup_vector = duplicated(quine_order[c("Eth","Sex")])
non_dup_vector = !dup_vector
quine_order[non_dup_vector, c("Eth","Sex", "Days")]
tapply(quine$Days, list(quine$Eth, quine$Sex), max)

#Consider the following data frame:
dat <- data.frame(
   ID = c(rep("A01", 3), rep("A02", 2), "A03", "A04", rep("A05", 2)),
   visit = c(3:1, 1, 2, 1,1,1,2),
   score = c(3,8,2,5,8,4,4,4,5)
)

datSort = dat[order(dat$score, decreasing=T),]
highestScore = datSort[!duplicated(datSort[,1]),]
highestScore = highestScore[order(highestScore$ID),]


myTable <- function(df, charvec)
{
  returnDF <- data.frame()
  for (i in charvec)
  {
    tab <- table(df[i])
    tab.dat <- as.data.frame(tab)
    
    newDF = data.frame("Varname" = c(i, rep(" ", nrow(tab.dat)-1)), "Levels"=levels(tab.dat$Var1), "Count"=tab.dat$Freq, "Percent" = as.data.frame(prop.table(tab))$Freq)
    returnDF = rbind(returnDF, newDF)
  }
  return(returnDF)
}

myTable (quine, c("Eth"))
myTable (quine, c("Eth", "Age"))
myTable (quine, c("Eth", "Age", "Sex"))
myTable (quine, c("Eth", "Age", "Sex", "Lrn"))