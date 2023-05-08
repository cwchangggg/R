FP <- read.csv(file.choose(), header = TRUE)
View(FP)

###
install.packages("ggplot2") # ggplot2
install.packages("psych")
install.packages("car")
install.packages("RcmdrMisc") # rcorr.adjust()
install.packages("apaTables") # apa.cor.table()
install.packages("ggpubr") # ggscatterhist()
install.packages("corrplot") # corrplot()
library(psych) # bartlett.test()
library(car) # leveneTest()
library(ggplot2)
library(RcmdrMisc) # rcorr.adjust()
library(apaTables) # apa.cor.table()
library(ggpubr) # ggscatterhist()
library(corrplot) # corrplot()

###Descriptive statistics
#all
describe(FP$amount)
describe(FP$persuasive)
describe(FP$knowledgeable)
describe(FP$charming)
describe(FP$reliable)
describe(FP$impressive)
describe(FP$priority)
#by gender
describeBy(FP$amount, FP$gender)
describeBy(FP$persuasive, FP$gender)
describeBy(FP$knowledgeable, FP$gender)
describeBy(FP$charming, FP$gender)
describeBy(FP$reliable, FP$gender)
describeBy(FP$impressive, FP$gender)
describeBy(FP$priority, FP$gender)
#boxplot by gender
FP$gender <- as.factor(FP$gender)
str(FP)
ggplot(FP, aes(x=gender, y=amount, color=gender)) + geom_boxplot()


###gender piechart
FP$gender <- as.factor(FP$gender)

gender_pie <- data.frame(table(FP[1:328,]$gender))
colnames(gender_pie) <- c("gender", "Count")
View(gender_pie)


ggplot(gender_pie, aes(x="", y=Count, fill=gender)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y") +
  geom_text(aes(label = Count),
            color = "white", size=10,
            position = position_stack(vjust = 0.5)) +
  theme_void()

###amount piechart
FP$amount <- as.factor(FP$amount)

amount_pie <- data.frame(table(FP[1:328,]$amount))
colnames(amount_pie) <- c("amount", "Count")
View(amount_pie)


ggplot(amount_pie,aes(x="", y=Count, fill=amount)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y") +
  geom_text(aes(label = Count),
            color = "white", size=6,
            position = position_stack(vjust = 0.5)) +
  theme_void()

###jobs pie chart

FP$jobs <- as.factor(FP$jobs)

jobs_pie <- data.frame(table(FP[1:328,]$jobs))
colnames(jobs_pie) <- c("jobs", "Count")
View(jobs_pie)


ggplot(jobs_pie,aes(x="", y=Count, fill=jobs)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y") +
  geom_text(aes(label = Count),
            color = "white", size=6,
            position = position_stack(vjust = 0.5)) +
  theme_void()

###online shopping pie chart

FP$online <- as.factor(FP$online)

online_pie <- data.frame(table(FP[1:328,]$online))
colnames(online_pie) <- c("online", "Count")
View(online_pie)


ggplot(online_pie,aes(x="", y=Count, fill=online)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y") +
  geom_text(aes(label = Count),
            color = "white", size=6,
            position = position_stack(vjust = 0.5)) +
  theme_void()

###amount histogram
str(FP)
ggplot(FP, aes(x=amount)) +
  geom_histogram(bins = 10)

###correlation
FP2 <- read.csv(file.choose(), header = TRUE) #FP2 = numerical FP
View(FP2)
pearson <- rcorr.adjust(FP2, type="pearson")
pearson
apa.cor.table(FP2, filename = "correlation_table.doc")
windows(width=8, height=8, pointsize = 10)
corrplot.mixed(pearson$R$r, lower="number", upper="ellipse", addCoef.col = 'black')

windows(width=15, height=15, pointsize = 10)

ggscatterhist(FP2, x="reliable", y="amount",
              bins=30,
              shape="circle",
              margin.plot="histogram",
              margin.params=list(color="black"))

windows(width=15, height=15, pointsize = 10)
ggscatterhist(FP2, x="charming", y="amount",
              bins=30,
              shape="circle",
              margin.plot="histogram",
              margin.params=list(color="black"))

###independent t-test amount-gender
FP$gender <- as.factor(FP$gender)
str(FP)
#step1
describeBy(FP$amount, FP$gender)
#step2
bartlett.test(FP$amount, FP$gender)
#step3
t.test(amount ~ gender,
       data=FP,
       var.equal=T,
       mu=0)

###independent t-test reliable-gender

#step1
describeBy(FP$reliable, FP$gender)
#step2
bartlett.test(FP$reliable, FP$gender)
#step3
t.test(reliable ~ gender,
       data=FP,
       var.equal=T,
       mu=0)
