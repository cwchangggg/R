
#############################################################
### What to learn today:
### 1. Measures of Central Tendency: Mode, Median, Mean
### 2. Measures of Variability: Max, min, IQR, Variance, Standard Deviation
### 3. Shape: Skewness and Kurtosis
### 4. box plot
#############################################################


### 0. import libraries & import data

install.packages(c("ggplot2", "psych"))

library(ggplot2)  # ggplot
library(psych)    # describe

?describe 

L4 <- read.csv(file.choose())
str(L4)  # check data and data type


### 1. Measures of Central Tendency: 
### histogram
ggplot(L4, aes(x=HW)) + geom_histogram()

### Mean
mean(L4$HW)
### Median
median(L4$HW)
### Mode
names(table(L4$HW))[which.max(table(L4$HW))]


### practice1
###draw the histogram for age
###calculate mean, median, and mode of age, by editing the following script
ggplot(L4, aes(x=Age)) + geom_histogram()
mean(L4$Age)
median(L4$Age)
names(table(L4$Age))[which.max(table(L4$Age))]


?describe
### 2. Measures of Variability: 
### Max, min, range, IQR, Standard Deviation, variance...
describe(L4$HW)

summary(L3$HW)

### 3. Shape: 
### Skewness and Kurtosis
describe(L4$HW)


### 4. box plot
ggplot(L4, aes(y=Midterm_Exam)) + geom_boxplot()

#change the structure of Male from numeric to factor
L4$Male = as.factor(L4$Male)
str(L4$Male)
ggplot(L4, aes(x=Male,y=Midterm_Exam, fill=Male)) + geom_boxplot()



### practice2
##draw a boxplot for the following 20 data points on two variables
##trophy: 17,18,18,19,19,19,19,20,20,20,20,20,20,21,21,21,21,22,22,23
##grade: 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0
trophy<-c(17,18,18,19,19,19,19,20,20,20,20,20,20,21,21,21,21,22,22,23)
trophy
grade<-c(1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0)
grade
L4_box<-cbind(trophy,grade)
str(L4_box)
L4_box<-as.data.frame(L4_box)
str(L4_box)
##############################################################
##draw a boxplot for trophy
##ggplot(filename, aes( y=VariableName)) + geom_boxplot()
##ggplot(filename, aes(x=GroupName , y=VariableName, fill=GroupName)) + geom_boxplot()

#change the structure of trophy from numeric to factor
L4_box$trophy<-as.factor(L4_box$trophy)


##draw a boxplot for trophy by grade      
