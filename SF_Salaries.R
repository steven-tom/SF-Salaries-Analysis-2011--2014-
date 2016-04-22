library(ggplot2)
library(readr)


data <- read_csv('/Users/Steven_Tom/Desktop/SF_Salaries/Salaries.csv')
data$Year <- as.factor(data$Year)

## Status investigation
## Established no data for 2011, 2012, 2013
## Perhaps look at comparison of PT vs FT for 2014 though?

year1 <- data[which(data$Year == 2011),]

is.na(year1$BasePay)
year1 <- year1[year1$BasePay!="NA" ,] 

year2 <- data[which(data$Year == 2012),]
year3 <- data[which(data$Year == 2013),]
year4 <- data[which(data$Year == 2014),]


ggplot(data=year1, aes(x=BasePay))+geom_density()+
  xlab("Base Pay") +
  ylab("Employee Count") +
  xlim(0, 250000) +
  ylim(0, 2500)


ggplot(year1, aes(x = BasePay)) + #for 2011
  geom_density(fill = "grey40") 

ggplot(data, aes(x = BasePay)) + #for all years
  geom_density(fill = rainbow) 

#bench testing with average salary as $60,000

year1_bench <- year1[year1$BasePay>60000, ]

nrow(year1_bench)/nrow(year1) # 52.94118% of employees make more than $60,000 in 2011

year2_bench <- year2[year2$BasePay>60000, ]

nrow(year2_bench)/nrow(year2) # 55.17054% of employees make more than $60,000 in 2012

## The following will act as the template for how we view the time-evolution of salaries for different groups

ggplot(data, aes(x=TotalPay, group=Year, fill=Year, color=Year)) +
  geom_histogram(binwidth = 500) +
  xlab("Total Pay") +
  ylab("Employee Count") +
  xlim(0, 250000) +
  ylim(0, 2500)