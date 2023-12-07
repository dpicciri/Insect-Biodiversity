
# ------------library------------------
library(tidyverse)
library(dplyr)
# ------------data file------------------

InsectData<-read.csv("InsectData0209.csv")
head(InsectData)
summary(InsectData)
n_distinct(InsectData$Trap)
# 65 different traps
n_distinct(InsectData$Site)
# 8 sites
n_distinct(InsectData$Day)
# 3 days 
summary(InsectData$Site)
DI<-data.frame(InsectData)

as.factor(DI$Site)


n_distinct(DI$Order)
# 7 orders found
as.factor(DI$Order)
# find a way to gather all the site data together

x<-DI%>%
  group_by(Site)%>%
  mutate(n=n())

# barplot(height=ohx$ordernum, names= x$Site, col="blue")
hist(ohx$ordernum, main= "frequency of number of orders",xlab= "number of orders" ,col="blue")
# more orders are found more frequently in an area together because the habitat in which they are found promotes biodiversity and allows for many different organisms to coexists, 
# for the next project how does this relate to the small mammal data and vegetation, which factors contribute to the increase in orders?
ggplot(data=x, mapping = aes(x=Site, fill="red"))+geom_bar()+ ggtitle("Number of insects collected per Site")+ ylab("Number of Individuals (insects)")
# A1 has the most individuals found, may be due to sampling error because some of the samples have not been identified yet and more work has to be done to finish the data set. But the A1 site may have higher biodiversity than the other sites. 
 ohx<- x%>% 
  group_by(Site)%>%
  mutate(ordernum =n_distinct(Order))

