install.packages("gtrendsR")
library(gtrendsR)
library(reshape2)
library(ggplot2)

usr <- "" #put Google username here
psw <- "" #put Google password here
gconnect(usr, psw)
trend <- gtrends(c("nguyen tan dung", "truong tan sang","nguyen sinh hung","nguyen phu trong","ngoc trinh"), res="week")


trend2=trend$trend #subset the trend data frame from the list
trend3=subset(trend2, as.Date(start) >= '2015-01-01') #subset for 2015
trend4=melt(trend3, id.vars = "start", measure.vars = c("ngoc.trinh","nguyen.tan.dung", "truong.tan.sang","nguyen.sinh.hung","nguyen.phu.trong"))

## Plotting data
ggplot(trend4, aes(x=start, y=value, color=variable)) + geom_line() + 
  ggtitle("Interest over time: Bộ tứ vs Ngọc Trinh") + labs(x="Date",y="Interest index") 
