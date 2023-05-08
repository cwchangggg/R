#Comment
x=1:5
x
x[1]
x+1
x++
x=c(1, 3, 5, 7)
x=c(1, "cat", 3)
x[c(1,2)]
x=c(1, 2, 3,5)
y= 2*x
y
x="Hello World"
x
class(x)
x=100
x
class(x)
x/3
x%%3
x%3
sum(x)
x=as.integer(1.4)
x
class(x)
dt_raw <- read.csv(file.choose(), header=TRUE)
str(INDAOV)
dt_raw$ID <- as.factor(dt_raw$ID)
dt_raw$Ethnic <- as.factor(dt_raw$Ethnic)
str(dt_raw)
length(dt_raw$Math_Score)
mean(dt_raw$Math_Score)
sd(dt_raw$Math_Score)
quantile(dt_raw$Math_Score)
install.packages("car")
install.packages("sandwich")
install.packages("RcmdrMisc")

library(car)
library(sandwich)
library(RcmdrMisc)

with(dt_raw, plotMeans(Math_Score, Ethnic, error.bars="se"))
with(dt_raw, boxplot(Math_Score ~ Ethnic, error.bars="se"))
title(xlab="ethnic", ylab="score")
