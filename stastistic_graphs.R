
#############################################################
### What to learn today:
### 1. install libraries
### 2. import libraries
### 3. import data
### 4. check data
### 5. data type transformation
### 6. help function
### 7. bar chart
### 8. histogram
### 9. pie chart
#############################################################

### 1. install libraries
install.packages("ggplot2") # ggplot2


### 2. import libraries
library(ggplot2)


### 3. import data
L3 <- read.csv(file.choose(), header = T)
L3 <- read.csv("Blended_Course_LA.csv")


### 4. check data
str(L3)
View(L3)
class(L3)
head(L3)


### 5. data type transformation
L3$Male <- as.factor(L3$Male)
str(L3)


### 6. help function
??ggplot
?geom_bar


### 7. ????????? (Bar chart)
ggplot(L3, aes(x=Male)) +
  geom_bar()

#  assign row 1 ~ row 18)
#  fill bar with colors by Male
#  adjust bar width
str(L3[1:18, ])
ggplot(L3[1:18,], aes(x=Male, fill=Male)) +
  geom_bar(width=0.5)


### 8. ????????? (Histogram)
ggplot(L3, aes(x=Final_Exam)) +
  geom_histogram(bins = 10)


### 9. ????????? (Pie chart)
table(L3[1:18,]$Male)

###A data frame is a table or a two-dimensional array-like structure in which 
###each column contains values of one variable and each row contains 
###one set of values from each column.
###Following are the characteristics of a data frame.
###The column names should be non-empty.
###The row names should be unique.
###The data stored in a data frame can be of numeric, factor or character type.
###Each column should contain same number of data items.

L3_pie <- as.data.frame(table(L3[1:18,]$Male))
colnames(L3_pie) <- c("Male", "Count")
View(L3_pie)

ggplot(L3_pie, aes(x="", y=Count, fill=Male)) +
  geom_bar(stat="identity", width=1) + 
  coord_polar("y") +
  geom_text(aes(label = Count), 
            color = "white", size=10, 
            position = position_stack(vjust = 0.5)) +
  theme_void()  # remove background, grid, numeric labels
  
